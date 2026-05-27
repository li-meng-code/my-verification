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

`ifndef GUARD_SVT_MEM_SYSTEM_BACKDOOR_SV
`define GUARD_SVT_MEM_SYSTEM_BACKDOOR_SV

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_defines)

/** @cond SV_ONLY */
// =============================================================================
/**
 * This class manages a set of backdoor instances, converting requests relative to
 * the common source address domain into requests for the individual backdoor
 * instances using the individual destination address domains specified for these
 * backdoor instances.
 */
class svt_mem_system_backdoor extends svt_mem_backdoor_base;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  // ****************************************************************************
  // Local Data
  // ****************************************************************************

  /**
   * List of svt_mem_backdoor_base instances. The backdoor at a given index in the
   * 'backdoors' queue is supported by the address mapping stored at the same index
   * in the 'mappers' queue.
   */
  local svt_mem_backdoor_base backdoors[$];

  /**
   * List of svt_mem_address_mapper instances. The mapper at a given index in the
   * 'mappers' queue defines the address mapping for the backdoor at the same index
   * in the 'backdoors' queue.
   */
  local svt_mem_address_mapper mappers[$];

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_mem_system_backdoor class.
   *
   * @param name (optional) Used to identify the mapper in any reported messages.
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
  `svt_data_member_begin(svt_mem_system_backdoor)
  `svt_data_member_end(svt_mem_system_backdoor)
`endif

  // ---------------------------------------------------------------------------
  /**
   * Register the 'backdoor' instance that is responsible for backdoor operations
   * for the addresses represented by 'mapper'.
   */
  extern virtual function void register_backdoor(svt_mem_backdoor_base backdoor, svt_mem_address_mapper mapper);

  //---------------------------------------------------------------------------
  /** 
   * Set the output argument to the value found at the specified address.
   *
   * This method uses 'addr' as a source domain address to identify the correct
   * backdoor instance. The peek is then redirected to this backdoor, after
   * converting the address to the appropriate destination domain address.
   * 
   * @param addr Address of data to be read.
   * @param data Data read from the specified address.
   * @param modes Optional access modes, represented by individual constants.  No
   *   predefined values supported.
   *
   * @return '1' if a value was found, otherwise '0'.
   */
  extern virtual function bit peek_base(svt_mem_addr_t addr, output svt_mem_data_t data, input int modes = 0);

  //---------------------------------------------------------------------------
  /**
   * Write the specified value at the specified address.
   *
   * This method uses 'addr' as a source domain address to identify the correct
   * backdoor instance. The poke is then redirected to this backdoor, after
   * converting the address to the appropriate destination domain address.
   * 
   * @param addr Address of data to be written.
   * @param data Data to be written at the specified address.
   * @param modes Optional access modes, represented by individual constants.  No
   *   predefined values supported.
   *
   * @return '1' if the value was written, otherwise '0'.
   */
  extern virtual function bit poke_base(svt_mem_addr_t addr, svt_mem_data_t data, int modes = 0);

  //---------------------------------------------------------------------------
  /**
   * Return the attribute settings for the indicated address range. Does an 'AND'
   * or an 'OR' of the attributes within the range, based on the 'modes' setting.
   * The default setting results in an 'AND' of the attributes.
   * 
   * This method works in terms of source domain addresses, converting them to destination
   * domain addresses and redistributing the request to the appropriate backdoor instances.
   *
   * @param addr_lo Starting address.
   * @param addr_hi Ending address.
   * @param modes Optional attribute modes, represented by individual constants. Supported values:
   *   - SVT_MEM_ATTRIBUTE_OR - Specify to do an 'OR' of the attributes within the range. 
   *   .
   */
  extern virtual function svt_mem_attr_t peek_attributes(svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi, int modes = 0);

  //---------------------------------------------------------------------------
  /**
   * Set the attributes for the addresses in the indicated address range. Does an
   * 'AND' or an 'OR' of the attributes within the range, based on the 'modes'
   * setting. The default setting results in an 'AND' of the attributes.
   * 
   * This method works in terms of source domain addresses, converting them to destination
   * domain addresses and redistributing the request to the appropriate backdoor instances.
   *
   * @param attr attribute to be set
   * @param addr_lo Starting address.
   * @param addr_hi Ending address.
   * @param modes Optional attribute modes, represented by individual constants. Supported values:
   *   - SVT_MEM_ATTRIBUTE_OR - Specify to do an 'OR' of the attributes within the range. 
   *   .
   */
  extern virtual function void poke_attributes(svt_mem_attr_t attr, svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi, int modes = 0);

  //---------------------------------------------------------------------------
  /**
   * Loads memory locations with the contents of the specified file. This is the method
   * that the user should use when doing 'load' operations.
   *
   * The svt_mem_system_backdoor class provided implementation simply provides entry
   * and exit debug messages, otherwise relying on the super to implement the method.
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
   * The svt_mem_system_backdoor class provided implementation simply provides entry
   * and exit debug messages, otherwise relying on the super to implement the method.
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
   * This method works in terms of source domain addresses, converting them to destination
   * domain addresses and redistributing the request to the appropriate backdoor instances.
   *
   * @param addr_lo Low address
   * @param addr_hi High address
   * @param modes Optional access modes, represented by individual constants.  No
   *   predefined values supported.
   *
   * @return Bit indicating the success (1) or failure (0) of the free operation.
   */
  extern virtual function bit free_base(svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi, int modes = 0);

  //---------------------------------------------------------------------------
  /**
   * Initialize the specified address range in the memory with the specified pattern.
   *
   * This method works in terms of source domain addresses, converting them to destination
   * domain addresses and redistributing the request to the appropriate backdoor instances.
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
   * @param pattern Initialization pattern.
   * @param base_data Starting data value used with each pattern.
   *         For pattern INIT_ODD_EVEN_CONST pattern denotes data value for even addresses
   *
   * @param start_addr Low address of the region to be initialized.
   * @param end_addr High address of the region to be initialized.
   * @param modes Optional access modes, represented by individual constants.  No
   *   predefined values supported.
   * @param optional_data Starting data value used for odd addresses with INIT_ODD_EVEN_CONST pattern
   */
  extern virtual function void initialize_base(
    init_pattern_type_enum pattern = INIT_CONST,
  svt_mem_data_t base_data = 0, svt_mem_addr_t start_addr = 0, svt_mem_addr_t end_addr = -1, int modes = 0, svt_mem_data_t optional_data = 0);

  //---------------------------------------------------------------------------
  /**
   * Compare the content of the memory in the specifed address range
   * (entire memory by default) with the data found in the specifed file,
   * using the relevant policy based on the filename. This is the
   * method that the user should use when doing 'compare' operations.
   *
   * The svt_mem_system_backdoor class provided implementation simply provides entry
   * and exit debug messages, otherwise relying on the super to implement the method.
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
   * Used to convert a source address into a destination address. Accomplished by
   * doing repeated conversions, starting with the source backdoor and mapper for
   * the provided 'src_addr' and ending with the destination backdoor and mapper
   * that is reached after the multiple conversions. Issues a warning and returns
   * an address of '0' if the src_addr cannot be mapped to an address supported
   * by any of the destination backdoor instances.
   *
   * @param src_addr The original source address to be converted.
   * @param backdoor The backdoor for the destination address.
   *
   * @return The destination address based on conversion of the source address.
   */
  extern virtual function svt_mem_addr_t get_dest_addr(svt_mem_addr_t src_addr,
                                                       output svt_mem_backdoor_base backdoor);
  
  // ---------------------------------------------------------------------------
  /**
   * Used to convert a destination address into a source address. Accomplished by
   * doing repeated conversions, starting with the destination backdoor and mapper for
   * the provided 'dest_addr' and ending with the source backdoor and mapper
   * that is reached after the multiple conversions. Issues a warning and returns
   * an address of '0' if the dest_addr cannot be mapped to an address supported
   * by any of the source backdoor instances.
   *
   * @param dest_addr The original destination address to be converted.
   * @param backdoor The backdoor for the destination address.
   *
   * @return The source address based on conversion of the destination address.
   */
  extern virtual function svt_mem_addr_t get_src_addr(svt_mem_addr_t dest_addr,
                                                      svt_mem_backdoor_base backdoor);
  
  // ---------------------------------------------------------------------------
  /**
   * Generates short description of the backdoor instance. This includes information
   * for all of the backdoor and mapper instances.
   *
   * @return The generated description.
   */
  extern virtual function string psdisplay(string prefix = "");
  
  // ---------------------------------------------------------------------------
  /**
   * Method to provide a bit vector identifying which operations are supported.
   *
   * This class represents multiple backdoor instances so this method indicates
   * which operations are supported by at least one contained backdoor.
   * Clients wishing to know which operations are supported by all contained
   * backdoors should refer to the 'get_fully_supported_features()' method.
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
   *   .
   *
   * @return Bit vector indicating which features are supported by this backdoor.
   */
  extern virtual function int get_supported_features();
  
  // ---------------------------------------------------------------------------
  /**
   * Method to provide a bit vector identifying which operations are fully
   * supported.
   *
   * This class represents multiple backdoor instances so this method indicates
   * which operations are supported by all contained backdoors. Clients wishing
   * to know which operations are supported by at least one contained backdoor
   * should refer to the 'get_supported_features()' method.
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
   *   .
   *
   * @return Bit vector indicating which features are supported by this backdoor.
   */
  extern virtual function int get_fully_supported_features();
  
  //---------------------------------------------------------------------------
  /**
   * Internal method for loading memory locations with the contents of the specified
   * file. This is the file load method which classes extended from svt_mem_backdoor_base
   * must implement.
   *
   * The svt_mem_system_backdoor implementation redistributes the request to the
   * appropriate backdoor instances.
   *
   * The 'mapper' can be used to convert between the source address domain used in the
   * file and the destination address domain used by the backdoor. If the 'mapper' is
   * not provided it implies the source and destination address domains are the same.
   *
   * As part of the process of forwarding this request the svt_mem_system_backdoor must
   * provide the appropriate mapper to the destination backdoor. If no mapper has been
   * provided in the original call then the svt_mem_system_backdoor just uses the mapper
   * associated with the destination backdoor.
   *
   * If a mapper has been provided, however, then the svt_mem_system_backdoor must
   * provide a mapper which incorporates the mapper associated with the destination
   * backdoor as well as the mapper provided in the original call. This is done by
   * creating a svt_mem_address_mapper_stack containing the provided mapper (the front)
   * and the destination backdoor mapper (the back). 
   *
   * The 'modes' field is a loophole for conveying basic well defined instructions
   * to the backdoor implementations.
   *
   * @param filename Name of the file to load. The file extension determines
   *        which format to expect.
   * @param mapper Used to convert between address domains.
   * @param modes Optional load modes, represented by individual constants. Supported values:
   *   - SVT_MEM_LOAD_PROTECT - Marks the addresses initialized by the file as write protected
   *   .
   */
  extern virtual function void load_base(string filename, svt_mem_address_mapper mapper = null, int modes = 0);

  //---------------------------------------------------------------------------
  /**
   * Internal method for saving memory contents within the indicated 'addr_lo' to
   * 'addr_hi' address range into the specified 'file' using the format identified
   * by 'filetype', where the only supported values are "MIF" and "MEMH". This is
   * the file dump method which classes extended from svt_mem_backdoor_base must
   * implement.
   *
   * This method uses 'addr_lo' and 'addr_hi' as a source domain addresses to
   * identify the applicable backdoor instances. The dump is then redirected to
   * these backdoor instances, after converting the addresses to the appropriate
   * destination domain addresses.
   *
   * The 'mapper' can be used to convert between the source address domain used in
   * the file and the destination address domain used by the backdoor. If the 'mapper'
   * is not provided it implies the source and destination address domains are the
   * same.
   *
   * As part of the process of forwarding this request the svt_mem_system_backdoor
   * must provide the appropriate mapper to the destination backdoor. If no mapper
   * has been provided in the original call then the svt_mem_system_backdoor just
   * uses the mapper associated with the destination backdoor.
   *
   * If a mapper has been provided, however, then the svt_mem_system_backdoor must
   * provide a mapper which incorporates the mapper associated with the destination
   * backdoor as well as the mapper provided in the original call. This can be done
   * by creating a svt_mem_address_mapper_stack containing the provided mapper
   * (the front) and the destination backdoor mapper (the back). 
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
  extern virtual function void dump_base(
                    string filename, string filetype, svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi,
                    svt_mem_address_mapper mapper = null, int modes = 0);

  //---------------------------------------------------------------------------
  /**
   * Internal method for comparing the content of the memory in the specifed
   * address range (entire memory by default) with the data found in the specifed file,
   * using the relevant policy based on the filename.
   *
   * The 'mapper' can be used to convert between the source address domain used in
   * the file and the destination address domain used by the backdoor. If the 'mapper'
   * is not provided it implies the source and destination address domains are the
   * same.
   *
   * This method works in terms of source domain addresses, converting them to destination
   * domain addresses and redistributing the request to the appropriate backdoor instances.
   *
   * The following comparison modes are available:
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
   * @param mapper Used to convert between address domains.
   *
   * @return The number of miscompares.
   */
  extern virtual function int compare_base(
                    string filename, compare_type_enum compare_type, int max_errors,
                    svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi, svt_mem_address_mapper mapper = null); 

  // ---------------------------------------------------------------------------
  /**
   * Utility to figure the downstream mapper to use based on the contained mapper
   * and method provided mapper situation.
   *
   * @param mapper_stack Mapper stack that is used if the method provided mapper
   * is non-null.
   * @param front_mapper Method provided mapper, placed at the front of the mapper
   * stack if non-null.
   * @param back_mapper. Placed at the back of the mapper stack if method provided
   * mapper is non-null.
   *
   * @return The mapper which should be used for downstream operations.
   */
  extern virtual function svt_mem_address_mapper get_downstream_mapper(
                    ref svt_mem_address_mapper_stack mapper_stack,
                    input svt_mem_address_mapper front_mapper, input svt_mem_address_mapper back_mapper);

  // ---------------------------------------------------------------------------
  /**
   * Used to get the number of contained backdoor/mapper pairs.
   *
   * @return Number of contained backdoor/mapper pairs.
   */
  extern virtual function int get_contained_backdoor_count();

  // ---------------------------------------------------------------------------
  /**
   * Used to get the name for a contained backdoor.
   *
   * @param ix Index into the backdoors queue.
   *
   * @return Name assigned to the backdoor.
   */
  extern virtual function string get_contained_backdoor_name(int ix);

  // ---------------------------------------------------------------------------
  /**
   * Used to get the name for a contained mapper.
   *
   * @param ix Index into the mappers queue.
   *
   * @return Name assigned to the mapper.
   */
  extern virtual function string get_contained_mapper_name(int ix);

  // ---------------------------------------------------------------------------
  /**
   * Used to get a contained backdoor.
   *
   * @param ix Index into the backdoors queue.
   *
   * @return The backdoor at the indicated index.
   */
  extern virtual function svt_mem_backdoor_base get_contained_backdoor(int ix);

  // ---------------------------------------------------------------------------
  /**
   * Used to get a contained mapper.
   *
   * @param ix Index into the mappers queue.
   *
   * @return The mapper at the indicated index.
   */
  extern virtual function svt_mem_address_mapper get_contained_mapper(int ix);

  // ---------------------------------------------------------------------------
  /**
   * Used to check whether 'backdoor' is included in this system backdoor.
   *
   * @param backdoor The backdoor to be checked.
   *
   * @return Indicates if the backdoor is contained in this system backdoor (1) or not (0).
   */
  extern virtual function bit contains_backdoor(svt_mem_backdoor_base backdoor);
  
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
G2JvlklPInOPwTsX3x+1g8xAYTN1wLuamUhwBbkqrqN6TzpkiV9nc7uTctCwC5r5
URFfNp9xQk8LqW+I/HuSRKPLXCQXXlWmjXoT4ga95YUmgvP14g2KeGVygrHJvqLZ
Fmj8Ydwz7INLIBA3cO9Lk4ws8jASpoDHPvln/Qt6wc0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 38809     )
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
`pragma protect end_protected

`endif // GUARD_SVT_MEM_SYSTEM_BACKDOOR_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
GXCZ2+NxtBzPaih120Wu45i+DrGbVhXGH60GCnpEUmLyodLMOYEylGy73gPAVD04
VSEAruS0tuqiP5+r1MidRhUMZfytJYABG8C6US1fjRILC272OGKGm60GTCkiXhcE
9QC6t6dZWJ+jMlvzF8YHRL/vX9Mh3QGPKhZoOw31/fE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 38892     )
km8IvpaWGOj0YACK5s68fJGYopQI2laUBp5DCkm9As0CMLr5aQxUzyxS7xHt8uNZ
1d68PDuIAMrHQTweiafCjCD5xb4FW1JsjqWu9NEoPg/nt9dB1l9YBJFmfrguTUqt
`pragma protect end_protected
