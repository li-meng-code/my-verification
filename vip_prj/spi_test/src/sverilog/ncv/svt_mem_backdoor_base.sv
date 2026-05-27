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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
wOpArckZyERi12jp39OX6oaXW29SYrJMIg9L9UiKsygh973h+o0Kx7cWLUPuL89B
DfXKbZo0BusNA7yRELT03vWyryCga+HzcBNe/cDYrVcLKB/SmBwrFArSb/LOBFqw
AnykmAfl3VinPu1Go69HRtj2XdmbXv/g+SqGUI8BFfkDQEDllZL4Zw==
//pragma protect end_key_block
//pragma protect digest_block
bwEcypxSHuzj7EDFi2SfZxB9OfA=
//pragma protect end_digest_block
//pragma protect data_block
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
qU1WyizW9F0kJSH71d1yhQ==
//pragma protect end_data_block
//pragma protect digest_block
bKZc6V4g7W36zMmjfTyCTb8LzDQ=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_MEM_BACKDOOR_BASE_SV
