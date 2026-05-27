//=======================================================================
// COPYRIGHT (C) 2015-2022 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all authorized copies.
//
//-----------------------------------------------------------------------

`ifndef GUARD_SVT_MEM_BACKDOOR_BASE_SV
`define GUARD_SVT_MEM_BACKDOOR_BASE_SV

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_defines)

/** @cond SV_ONLY */
// =============================================================================
/**
 * This base class defines the common backdoor method signatures.
 */
`ifdef SVT_VMM_TECHNOLOGY
class svt_mem_backdoor_base;
`else
class svt_mem_backdoor_base extends `SVT_DATA_BASE_TYPE;
`endif

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  /** Pattern type to define the default value for uninitialized memory locations. */
  typedef enum {
    INIT_CONST = `SVT_MEM_INITIALIZE_CONST, /**< Initialize to a constant value */
    INIT_INCR = `SVT_MEM_INITIALIZE_INCR, /**< Initialize to an incrementing pattern */
    INIT_DECR = `SVT_MEM_INITIALIZE_DECR, /**< Initialize to a decrementing pattern */
    INIT_WALK_LEFT = `SVT_MEM_INITIALIZE_WALK_LEFT, /**< Initialize to a walking left pattern */
    INIT_WALK_RIGHT = `SVT_MEM_INITIALIZE_WALK_RIGHT, /**< Initialize to a walking right pattern */
    INIT_RAND = `SVT_MEM_INITIALIZE_RAND, /**< Initialize to a random pattern */
    INIT_ODD_EVEN_CONST = `SVT_MEM_INITIALIZE_ODD_EVEN_CONST /**< Initialize to different constant value for odd and even locations  */
  } init_pattern_type_enum;

  /** Compare type which controls how compare operations are performed */
  typedef enum {
    SUBSET=`SVT_MEM_COMPARE_SUBSET, /** The content of the file is present in the memory core and any additional values in the memory are ignored */
    STRICT = `SVT_MEM_COMPARE_STRICT, /** The content of the file is strictly equal to the content of the memory core */
    SUPERSET = `SVT_MEM_COMPARE_SUPERSET, /** The content of the memory core is present in the file and additional values in the file are ignored */
    INTERSECT = `SVT_MEM_COMPARE_INTERSECT /** The same addresses present in the memory core and in the file contain the same data and addresses present only in the file or the memory core are ignored */
  } compare_type_enum;

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /** Log instance used to report messages. */
  vmm_log log;
`else
  /**
   * SVT message macros route messages through this reference. This overrides the shared
   * svt_sequence_item_base reporter.
   */
  `SVT_XVM(report_object) reporter;
`endif

  // ****************************************************************************
  // Protected Data
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /** Name given to the backdoor. Used to identify the backdoor in any reported messages. */
  protected string name = "";
`endif

  // ****************************************************************************
  // Local Data
  // ****************************************************************************

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_mem_backdoor_base class.
   *
   * @param name (optional) Used to identify the backdoor in any reported messages.
   * @param log||reporter (optional but recommended) Used to report messages.
   */
`ifdef SVT_VMM_TECHNOLOGY
  extern function new(string name = "", vmm_log log = null);
`else
  extern function new(string name = "", `SVT_XVM(report_object) reporter = null);
`endif

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
`ifndef SVT_VMM_TECHNOLOGY
  `svt_data_member_begin(svt_mem_backdoor_base)
  `svt_data_member_end(svt_mem_backdoor_base)
`endif

  //---------------------------------------------------------------------------
  /** 
   * Set the output argument to the value found at the specified address
   * 
   * @param addr Address of data to be read.
   * @param data Data read from the specified address.
   *
   * @return '1' if a value was found, otherwise '0'.
   */
  extern virtual function bit peek(svt_mem_addr_t addr, output svt_mem_data_t data);  

  //---------------------------------------------------------------------------
  /**
   * Write the specified value at the specified address.
   * 
   * @param addr Address of data to be written.
   * @param data Data to be written at the specified address.
   *
   * @return '1' if the value was written, otherwise '0'.
   */
  extern virtual function bit poke(svt_mem_addr_t addr, svt_mem_data_t data);

  //---------------------------------------------------------------------------
  /**
   * Return the attribute settings for the indicated address range. Does an 'AND'
   * or an 'OR' of the attributes within the range, based on the 'modes' setting.
   * The default setting results in an 'AND' of the attributes.
   * 
   * @param addr_lo Starting address.
   * @param addr_hi Ending address.
   * @param modes Optional attribute modes, represented by individual constants. Supported values:
   *   - SVT_MEM_ATTRIBUTE_OR - Specify to do an 'OR' of the attributes within the range. 
   *   .
   */
  virtual function svt_mem_attr_t peek_attributes(svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi, int modes = 0);
    peek_attributes = 0;
  endfunction

  //---------------------------------------------------------------------------
  /**
   * Set the attributes for the addresses in the indicated address range. Does an
   * 'AND' or an 'OR' of the attributes within the range, based on the 'modes'
   * setting. The default setting results in an 'AND' of the attributes.
   * 
   * @param attr attribute to be set
   * @param addr_lo Starting address.
   * @param addr_hi Ending address.
   * @param modes Optional attribute modes, represented by individual constants. Supported values:
   *   - SVT_MEM_ATTRIBUTE_OR - Specify to do an 'OR' of the attributes within the range. 
   *   .
   */
  virtual function void poke_attributes(svt_mem_attr_t attr, svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi, int modes = 0);
  endfunction

  //---------------------------------------------------------------------------
  /**
   * Loads memory locations with the contents of the specified file. This is the method
   * that the user should use when doing 'load' operations.
   *
   * The svt_mem_backdoor_base class provided implementation simply calls the internal
   * method, load_base, which is the method that classes extended from svt_mem_backdoor_base
   * must implement.
   *
   * The 'write_protected' field enables write protect checking for all of the loaded
   * memory locations.
   *
   * @param filename Name of the file to load. The file extension determines
   *        which format to expect.
   * @param write_protected If supported by the backdoor, marks the addresses
   *        initialized by the file as write protected.
   */
  extern virtual function void load(string filename, bit write_protected = 0);

  //---------------------------------------------------------------------------
  /**
   * Saves memory contents within the indicated 'addr_lo' to 'addr_hi' address range
   * into the specified 'file' using the format identified by 'filetype', where the
   * only supported values are "MIF" and "MEMH". The 'append' bit indicates whether
   * the content should be appended to the file if it already exists. This is the
   * method that the user should use when doing 'dump' operations.
   *
   * The svt_mem_backdoor_base class provided implementation simply calls the internal
   * method, dump_base, which is the method that classes extended from svt_mem_backdoor_base
   * must implement.
   *
   * @param filename Name of the file to write to.
   * @param filetype The string name of  the format to be used when writing a
   *        memory dump file, either "MIF" or "MEMH".
   * @param append Start a new file, or add onto an existing file.
   * @param addr_lo Starting address.
   * @param addr_hi Ending address.
   * @param modes Optional dump modes, represented by individual constants. Supported values:
   *   - SVT_MEM_DUMP_ALL - Specify in order to include 'all' addresses in the output. 
   *   - SVT_MEM_DUMP_NO_HEADER - To exclude the header at the front of the file.
   *   - SVT_MEM_DUMP_NO_BEGIN - To exclude the BEGIN at the start of the data block (MIF).
   *   - SVT_MEM_DUMP_NO_END - To exclude the END at the end of the data block (MIF).
   *   .
   */
  extern virtual function void dump(string filename, string filetype, bit append, svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi, int modes = 0);

  //---------------------------------------------------------------------------
  /**
   * Free the data associated with the specified address range, as if it had never
   * been written. If addr_lo == 0 and addr_hi == -1 then this frees all of the
   * data in the memory.
   *
   * @param addr_lo Low address
   * @param addr_hi High address
   *
   * @return Bit indicating the success (1) or failure (0) of the free operation.
   */
  extern virtual function bit free(svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi);

  //---------------------------------------------------------------------------
  /**
   * Initialize the specified address range in the memory with the specified pattern.
   *
   * Supported patterns are:
   *   - constant value
   *   - incrementing values,
   *   - decrementing values
   *   - walk left
   *   - walk right
   *   - rand
   *   - different constant value on odd and even addresses
   *   .
   *
   * @param pattern initialization pattern.
   * @param base_data Starting data value used with each pattern.
   *   For pattern INIT_ODD_EVEN_CONST pattern denotes data value for even addresses
   * @param start_addr start address of the region to be initialized.
   * @param end_addr end address of the region to be initilized.
   * @param optional_data Starting data value used for odd addresses with INIT_ODD_EVEN_CONST pattern
   */
  extern virtual function void initialize(
    init_pattern_type_enum pattern = INIT_CONST,
    svt_mem_data_t base_data = 0, svt_mem_addr_t start_addr = 0, svt_mem_addr_t end_addr = -1, svt_mem_data_t optional_data = 0);

  //---------------------------------------------------------------------------
  /**
   * Compare the content of the memory in the specifed address range
   * (entire memory by default) with the data found in the specifed file,
   * using the relevant policy based on the filename. This is the
   * method that the user should use when doing 'compare' operations.
   *
   * The svt_mem_backdoor_base class provided implementation simply calls
   * the internal method, compare_base, which is the method that classes
   * extended from svt_mem_backdoor_base must implement.
   *
   * The following comparison mode are available:
   *
   * - Subset: The content of the file is present in the memory core. The
   *   memory core may contain additional values that are ignored.
   * - Strict: The content of the file is strictly equal to the content of the
   *   memory core.
   * - Superset: The content of the memory core is present in the file. The
   *   file may contain additional values that are ignored.
   * - Intersect: The same addresses present in the memory core and in the
   *   file contain the same data. Addresses present only in the file or the
   *   memory core are ignored.
   * .
   *
   * @param filename Name of the file to compare to.  The file extension
   *        determines which format the file is created in.
   * @param compare_type Determines which kind of compare is executed
   * @param max_errors Data comparison terminates after reaching max_errors. If
   *        max_errors is 0 assume a maximum error count of 10.
   * @param addr_lo Starting address
   * @param addr_hi Ending address
   *
   * @return The number of miscompares.
   */
  extern virtual function int compare(string filename, compare_type_enum compare_type, int max_errors, svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi); 

  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * Generates short description of the backdoor instance.
   *
   * @return The generated description.
   */
  extern virtual function string psdisplay(string prefix = "");
  
  // ---------------------------------------------------------------------------
  /**
   * Method to provide a bit vector identifying which operations are supported.
   *
   * The backdoor class may represent multiple backdoor instances in which case
   * the method should indicate which operations are supported by at least one
   * contained backdoor. Clients wishing to know which operations are supported
   * by all contained backdoors should refer to the 'get_fully_supported_features()'
   * method.
   *
   * Each operation included in the svt_mem_system_backdoor definition will have its
   * own bit value. A value of '1' in the bit position associated with a specific
   * operation indicates the operation is supported, a value of '0' indicates the
   * operation is not supported. Note that this insures that as new operations are
   * by default not supported.
   *
   * The following masks have been defined for the currently defined operations and
   * can be used to indicate or check specific operation support.
   *   - SVT_MEM_PEEK_OP_MASK
   *   - SVT_MEM_POKE_OP_MASK
   *   - SVT_MEM_LOAD_OP_MASK
   *   - SVT_MEM_DUMP_OP_MASK
   *   - SVT_MEM_FREE_OP_MASK
   *   - SVT_MEM_INITIALIZE_OP_MASK
   *   - SVT_MEM_COMPARE_OP_MASK
   *   - SVT_MEM_ATTRIBUTE_OP_MASK
   *   .
   *
   * @return Bit vector indicating which features are supported by this backdoor.
   */
  virtual function int get_supported_features();
    get_supported_features = 0; 
  endfunction
  
  // ---------------------------------------------------------------------------
  /**
   * Method to provide a bit vector identifying which operations are fully
   * supported.
   *
   * The backdoor class may represent multiple backdoor instances in which case
   * this method indicates which operations are supported by all contained backdoors.
   * Clients wishing to know which operations are supported by at least one contained
   * backdoor should refer to the 'get_supported_features()' method.
   *
   * The default implementation, which should be sufficient for simple backdoor
   * classes, simply calls 'get_supported_features()' to determine which operations
   * are supported.
   *
   * Each operation included in the svt_mem_system_backdoor definition will have its
   * own bit value. A value of '1' in the bit position associated with a specific
   * operation indicates the operation is supported, a value of '0' indicates the
   * operation is not supported. Note that this insures that as new operations are
   * by default not supported.
   *
   * The following masks have been defined for the currently defined operations and
   * can be used to indicate or check specific operation support.
   *   - SVT_MEM_PEEK_OP_MASK
   *   - SVT_MEM_POKE_OP_MASK
   *   - SVT_MEM_LOAD_OP_MASK
   *   - SVT_MEM_DUMP_OP_MASK
   *   - SVT_MEM_FREE_OP_MASK
   *   - SVT_MEM_INITIALIZE_OP_MASK
   *   - SVT_MEM_COMPARE_OP_MASK
   *   - SVT_MEM_ATTRIBUTE_OP_MASK
   *   .
   *
   * @return Bit vector indicating which features are supported by this backdoor.
   */
  extern virtual function int get_fully_supported_features();
  
  //---------------------------------------------------------------------------
  /** 
   * Internal method for reading individual address locations from the memory. This
   * is the peek method which classes extended from svt_mem_backdoor_base must implement.
   * 
   * The modes argument is optional and is not used by the base class implementation.
   * 
   * @param addr Address of data to be read.
   * @param data Data read from the specified address.
   * @param modes Optional access modes, represented by individual constants.  No
   *   predefined values supported.
   *
   * @return '1' if a value was found, otherwise '0'.
   */
  virtual function bit peek_base(svt_mem_addr_t addr, output svt_mem_data_t data, input int modes = 0);  
    peek_base = 0;
  endfunction

  //---------------------------------------------------------------------------
  /**
   * Internal method for writing individual address locations to the memory. This
   * is the poke method which classes extended from svt_mem_backdoor_base must implement.
   * 
   * The modes argument is optional and is not used by the base class implementation.
   * 
   * @param addr Address of data to be written.
   * @param data Data to be written at the specified address.
   * @param modes Optional access modes, represented by individual constants.  No
   *   predefined values supported.
   *
   * @return '1' if the value was written, otherwise '0'.
   */
  virtual function bit poke_base(svt_mem_addr_t addr, svt_mem_data_t data, int modes = 0);
    poke_base = 0;
  endfunction

  //---------------------------------------------------------------------------
  /**
   * Internal method for loading memory locations with the contents of the specified
   * file. This is the file load method which classes extended from svt_mem_backdoor_base
   * must implement.
   *
   * The 'mapper' can be used to convert between the source address domain used in the
   * file and the destination address domain used by the backdoor. If the 'mapper' is
   * not provided it implies the source and destination address domains are the same.
   *
   * @param filename Name of the file to load. The file extension determines
   *        which format to expect.
   * @param mapper Used to convert between address domains.
   * @param modes Optional load modes, represented by individual constants. Supported values:
   *   - SVT_MEM_LOAD_WRITE_PROTECT - Marks the addresses initialized by the file as write protected
   *   .
   */
  virtual function void load_base(string filename, svt_mem_address_mapper mapper = null, int modes = 0);
  endfunction

  //---------------------------------------------------------------------------
  /**
   * Internal method for saving memory contents within the indicated 'addr_lo' to
   * 'addr_hi' address range into the specified 'file' using the format identified
   * by 'filetype', where the only supported values are "MIF" and "MEMH". This is
   * the file dump method which classes extended from svt_mem_backdoor_base must
   * implement.
   *
   * The 'mapper' can be used to convert between the source address domain used in
   * the file and the destination address domain used by the backdoor. If the 'mapper'
   * is not provided it implies the source and destination address domains are the
   * same.
   *
   * The 'modes' field is a loophole for conveying basic well defined instructions
   * to the backdoor implementations.
   *
   * @param filename Name of the file to write to.  The file extension
   *        determines which format the file is created in.
   * @param filetype The string name of  the format to be used when writing a
   *        memory dump file, either "MIF" or "MEMH".
   * @param addr_lo Starting address
   * @param addr_hi Ending address
   * @param mapper Used to convert between address domains.
   * @param modes Optional dump modes, represented by individual constants. Supported values:
   *   - SVT_MEM_DUMP_ALL - Specify in order to include 'all' addresses in the output. 
   *   - SVT_MEM_DUMP_NO_HEADER - To exclude the header at the front of the file.
   *   - SVT_MEM_DUMP_NO_BEGIN - To exclude the BEGIN at the start of the data block (MIF).
   *   - SVT_MEM_DUMP_NO_END - To exclude the END at the end of the data block (MIF).
   *   - SVT_MEM_DUMP_APPEND - Append the contents to the existing file if found.
   *   .
   */
  virtual function void dump_base(
                    string filename, string filetype, svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi,
                    svt_mem_address_mapper mapper = null, int modes = 0);
  endfunction

  //---------------------------------------------------------------------------
  /**
   * Internal method to free the data associated with the specified address range,
   * as if it had never been written. If addr_lo == 0 and addr_hi == -1 then this
   * frees all of the data in the memory.
   *
   * @param addr_lo Low address
   * @param addr_hi High address
   * @param modes Optional access modes, represented by individual constants.  No
   *   predefined values supported.
   *
   * @return Bit indicating the success (1) or failure (0) of the free operation.
   */
  virtual function bit free_base(svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi, int modes = 0);
    free_base = 0;
  endfunction

  //---------------------------------------------------------------------------
  /**
   * Internal method to initialize the specified address range in the memory with
   * the specified pattern.
   *
   * Supported patterns are:
   *   - constant value
   *   - incrementing values,
   *   - decrementing values
   *   - walk left
   *   - walk right
   *   - rand
   *   .
   *
   * @param pattern initialization pattern.
   * @param base_data Starting data value used with each pattern
   *   For pattern INIT_ODD_EVEN_CONST pattern denotes data value for even addresses
   * @param start_addr start address of the region to be initialized.
   * @param end_addr end address of the region to be initilized.
   * @param modes Optional access modes, represented by individual constants.  No
   *   predefined values supported.
   * @param optional_data Starting data value used for odd addresses with INIT_ODD_EVEN_CONST pattern
   */
  virtual function void initialize_base(
    init_pattern_type_enum pattern = INIT_CONST,
  svt_mem_data_t base_data = 0, svt_mem_addr_t start_addr = 0, svt_mem_addr_t end_addr = -1, int modes = 0, svt_mem_data_t optional_data = 0);
  endfunction

  //---------------------------------------------------------------------------
  /**
   * Internal method for comparing the content of the memory in the specifed
   * address range (entire memory by default) with the data found in the specifed
   * file, using the relevant policy based on the filename. This is the file compare
   * method which classes extended from svt_mem_backdoor_base must implement.
   *
   * The 'mapper' can be used to convert between the source address domain used in
   * the file and the destination address domain used by the backdoor. If the 'mapper'
   * is not provided it implies the source and destination address domains are the
   * same.
   *
   * The following comparison mode are available:
   *
   * - Subset: The content of the file is present in the memory core. The
   *   memory core may contain additional values that are ignored.
   * - Strict: The content of the file is strictly equal to the content of the
   *   memory core.
   * - Superset: The content of the memory core is present in the file. The
   *   file may contain additional values that are ignored.
   * - Intersect: The same addresses present in the memory core and in the
   *   file contain the same data. Addresses present only in the file or the
   *   memory core are ignored.
   * .
   *
   * @param filename Name of the file to compare to.  The file extension
   *        determines which format the file is created in.
   * @param compare_type Determines which kind of compare is executed
   * @param max_errors Data comparison terminates after reaching max_errors. If
   *        max_errors is 0 assume a maximum error count of 10.
   * @param addr_lo Starting address
   * @param addr_hi Ending address
   *
   * @return The number of miscompares.
   */
  virtual function int compare_base(
                    string filename, compare_type_enum compare_type, int max_errors, svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi,
                    svt_mem_address_mapper mapper = null);
    compare_base = 0;
  endfunction

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Used to get the backdoor name.
   *
   * @return Name assigned to this backdoor.
   */
  extern virtual function string get_name();

  // ---------------------------------------------------------------------------
  /**
   * Used to set the backdoor name.
   *
   * @param name New name to be assigned to this backdoor.
   */
  extern virtual function void set_name(string name);
`endif

  // ---------------------------------------------------------------------------
  /**
   * Used to get the backdoor name in a form that can easily be added to a message.
   *
   * @return Name assigned to this backdoor formatted for inclusion in a message.
   */
  extern virtual function string get_formatted_name();
  
  // ---------------------------------------------------------------------------
endclass
/** @endcond */

// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
V9AnL4t4YVfcXhJ7mvhqIP5mskRlaVSHY5XETo5daJr7BktiR3wUjcyxpQJ2XJ98
tmYQKaBLS6VG8kFzvyDHSxXtD/tYrJak0RVhix135wVdK8yTizenNlo+J6gTLkFU
1mwnvAiE34stL++SGk74Su8jN4yEo8sgalAj8so7OtY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 6567      )
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
`pragma protect end_protected

`endif // GUARD_SVT_MEM_BACKDOOR_BASE_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
LSuYSk7NcPUqKZ/pe6aZOBWZMcuzrZlG+JFhm5Nkk217YbtUYRXF2HfYEKMdvsPx
51uXgdb4SykvgO/qQhCF7ROS0W5Kh8j87QEPjV0FiRDDVCfHXjXyAB+DSUiq9GA2
EPI60DgflnsUWieXsML6Nfm4/4/lsBmcBV1qIuS7G6Y=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 6650      )
8oAj1DgcAE/blAooSSWir03gE8HvGCMQko2gVWGIlWLAQ/PD4cf10zYVrkWaCjaU
9ADocQ8X6QktiUZSSAu3BONg6m75EISJUWqaKY54mnqDpYvp6QVK1hJ+k3vzPkWG
`pragma protect end_protected
