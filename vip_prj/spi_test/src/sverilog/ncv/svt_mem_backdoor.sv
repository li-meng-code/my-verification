//--------------------------------------------------------------------------
// COPYRIGHT (C) 2012-2022 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all authorized copies.
//--------------------------------------------------------------------------

`ifndef GUARD_SVT_MEM_BACKDOOR_SV
 `define GUARD_SVT_MEM_BACKDOOR_SV


`ifndef SVT_MEM_DPI_EXCLUDE
  // Needed to select 2state or 4 state server instances
  `define SVT_MEM_BD_SVR_DO_E(R)  mem_core.get_is_4state()?mem_core.svr_4state.R:mem_core.svr_2state.R
  `define SVT_MEM_BD_SVR_DO_S(R)  if (mem_core.get_is_4state()) mem_core.svr_4state.R; else mem_core.svr_2state.R
  `define SVT_MEM_BD_SVR_DO_LR(L,R) if (mem_core.get_is_4state()) L=mem_core.svr_4state.R; else L=mem_core.svr_2state.R
 `endif


// =============================================================================
/**
 * This class provides a backdoor and iterator interface to a memory core. Multiple
 * instances of this interface may exist on the same memory core.
 */
class svt_mem_backdoor extends svt_mem_backdoor_base;

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  // Store name of this class
  string name;

  /**
   * Pre-defined attribute indicating an address has been written or initialized.
   * Provided for backwards compatibility, but clients should actually use the
   * SVT specified attribute constants.
   *
   * Note that this uses the SVT_MEM_ATTRIBUTE_INIT constant, although the backdoor
   * code actually assumes that it represents all occupied locations, whether they
   * have been initialized or written to.
   */
  static const svt_mem_attr_t WRITTEN = `SVT_MEM_ATTRIBUTE_INIT;

  /**
   * Predefined attribute indicating an address was last accessed by a READ operation.
   */
  static const svt_mem_attr_t LAST_RD = `SVT_MEM_ATTRIBUTE_LAST_RD;

  /**
   * Predefined attribute indicating an address was last accessed by a WRITE operation.
   * Provided for backwards compatibility, but clients should actually use the
   * SVT specified attribute constants.
   */
  static const svt_mem_attr_t LAST_WR = `SVT_MEM_ATTRIBUTE_LAST_WR;   

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************
  
/** @cond PRIVATE */

  //----------------------------------------------------------------------------  
  /** Memory core reference to svt_mem_core instance */
  protected svt_mem_core mem_core;
   
  //----------------------------------------------------------------------------  
  /** A memory address */
  protected svt_mem_addr_t iterator;

`ifdef SVT_MEM_DPI_EXCLUDE
  //----------------------------------------------------------------------------  
  /** Current attribute that the iterator is associated with */
  protected svt_mem_attr_t attr;
`endif
   
/** @endcond */

  // ****************************************************************************
  // Private Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Methods
  // ****************************************************************************
   
`ifndef SVT_MEM_BACKDOOR_DISABLE_FACTORY

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new svt_mem_backdoor instance
   * 
   * @param name (optional) Used to identify the backdoor in any reported messages.
   * @param mem_core (required) The specific mem_core that this backdoor points to.
   * @param log||reporter (optional but recommended) Used to report messages.
   */
`ifndef SVT_VMM_TECHNOLOGY
  extern function new(string name = "", svt_mem_core mem_core = null, `SVT_XVM(report_object) reporter = null);
`else
  extern function new(string name = "", svt_mem_core mem_core = null, vmm_log log = null);
`endif

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
`ifndef SVT_VMM_TECHNOLOGY
  `svt_data_member_begin(svt_mem_backdoor)
  `svt_data_member_end(svt_mem_backdoor)
`endif

`else

`ifndef SVT_VMM_TECHNOLOGY
  /**
   * CONSTRUCTOR: Create a new svt_mem_backdoor instance
   * 
   * @param mem_core The specific mem_core that this backdoor points to.
   * 
   * @param reporter Message reporter instance
   */
  extern function new(svt_mem_core mem_core, `SVT_XVM(report_object) reporter);
`else
  /**
   * CONSTRUCTOR: Create a new svt_mem_backdoor instance
   * 
   * @param mem_core The specific mem_core that this backdoor points to.
   * 
   * @param log Message reporter instance
   */
  extern function new(svt_mem_core mem_core, vmm_log log);
`endif

`endif
  //---------------------------------------------------------------------------
  /** Returns the configured data width of the memcore */ 
  extern virtual function int get_data_width();

  //---------------------------------------------------------------------------
  /** Returns the configured address width of the memcore */
  extern virtual function int get_addr_width();

  //---------------------------------------------------------------------------
  /**
   * Creates a new user-defined attribute that can be attanched to any address.
   * Different user-defined attributes can be bitwise-OR's to operate on
   * multiple attributes at the same time.
   * 
   * The return value is the attribute mask for the new attribute.
   **/
  extern function svt_mem_attr_t new_attribute();

  //---------------------------------------------------------------------------
  /**
   * Release a presviously-created user-defined attribute. The released
   * attibute may be reused by a new subsequently created user-defined
   * attibute.
   * 
   * @param free_attr_mask attributes to be freed.
   */
  extern function bit free_attribute(svt_mem_attr_t free_attr_mask);

  // ---------------------------------------------------------------------------
  /** Create a write protect to a memory range
   * 
   *  @param addr_lo low addr address
   *  @param addr_hi high addr address
   */
  extern function void protect(svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi);

  // ---------------------------------------------------------------------------
  /** Release write protect to a memory range
   * 
   *  @param addr_lo low addr address
   *  @param addr_hi high addr address
   */
  extern function void unprotect(svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi);

  //---------------------------------------------------------------------------
  /** 
   * Set the output argument to the value found a the specified address
   * Returns TRUE if a value was found. Returns FALSE otherwise. By default. the
   * attributes are not modified but if specified, attributes may be set or cleared.
   * 
   * @param addr address on which data to be read
   * @param data ouput data on specified address.
   * @param modes Optional access modes, represented by individual constants.  No
   *   predefined values supported.
   *
   * @return '1' if the value was written, otherwise '0'.
   */
  extern virtual function bit peek_base(svt_mem_addr_t addr, output svt_mem_data_t data, input int modes = 0);  

  //---------------------------------------------------------------------------
  /**
   * Write the specified value at the specified address. By default, the
   * attributes are not modified but if specified, attributes may be set or 
   * cleared.
   * 
   * @param addr address on which data to be written
   * @param data data to be written to the specific address.
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
   * Special care must be taken when setting the 'access' attributes for a
   * memory location as these attributes govern how the memory package interacts
   * with the location.
   * An access value of SVT_MEM_ATTRIBUTE_UNINIT, for example, indicates the location
   * is not occupied. This will result in the failure of subsequent peek,
   * peek_attribute, and poke_attribute operations of that location.
   *
   * Changing the access value between the different 'occupied' settings will not
   * not result in failures with subsequent peek or poke operations. But it could
   * impact the outcome of subsequent access checks which rely on these settings
   * to discern the current state of the memory locations. The 'occupied' settings
   * are defined by:
   *   - SVT_MEM_ATTRIBUTE_LAST_WR - Last access was a 'write' operation.
   *   - SVT_MEM_ATTRIBUTE_INIT - Last access was a 'poke' or 'initialize' operation.
   *   - SVT_MEM_ATTRIBUTE_LAST_RD - Last access was a 'read' operation.
   *   .
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
   * Set the specified attributes for the specified address
   * 
   * @param attr attribute to be set
   * @param addr address at which the attribute is updated
   */
  extern virtual function void set_attributes(svt_mem_attr_t attr, svt_mem_addr_t addr);

  //---------------------------------------------------------------------------
  /**
   * Return TRUE if the specified address exists and all of the specified
   * attributes are set for the specified address.
   * 
   * @param attr attribute to test for
   * @param addr address to test at
   */
  extern virtual function bit are_set(svt_mem_attr_t attr, svt_mem_addr_t addr);

  //---------------------------------------------------------------------------
  /**
   * Clear the specified attributes for the specified address
   *
   *  @param attr attribute mask which determines which attributes to clear
   *  @param addr address to modify the attribute for
   */
  extern virtual function bit clear_attributes(svt_mem_attr_t attr, svt_mem_addr_t addr);

  //---------------------------------------------------------------------------
  /**
   * Free the data associated with the specified address range, as if it had never
   * been written. If addr_lo == 0 and addr_hi == -1 then this frees all of the
   * data in the memory.
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
  /** Free all data in the memory. */
  extern virtual function void free_all();   
   
  //---------------------------------------------------------------------------
  /**
   * Reset the iterator to the first address with all the specified(bitwise-OR'd)
   * attributes set. Default is SVT_MEM_ATTRIBUTE_INIT, which is interpreted to
   * represent all occupied locations, whether they have been initialized or
   * written to.
   */
  extern virtual function bit reset(svt_mem_attr_t attr = `SVT_MEM_ATTRIBUTE_INIT);

  //---------------------------------------------------------------------------
  /** Make a copy of this class, including the state of the iterator */
`ifdef SVT_VMM_TECHNOLOGY
  extern virtual function svt_mem_backdoor clone();
`else
  extern virtual function `SVT_DATA_BASE_OBJECT_TYPE clone();
`endif

  //---------------------------------------------------------------------------
  /**
   * Copy the state of the specified iterator to this iterator. The specified
   * iterator must refer to the same memory core.
   * 
   * @param rhs svt_mem_backdoor object to be copied.
   */
  extern virtual function void copy(svt_mem_backdoor rhs);  

  //---------------------------------------------------------------------------
  /**
   * Return the value in the memory location corresponding to the current
   * location of the iterator.
   */
  extern virtual function svt_mem_data_t get_data();  

  //---------------------------------------------------------------------------
  /**
   * Return the address of the memory location corresponding to the current
   * location of the iterator.
   */
  extern virtual function svt_mem_addr_t get_addr();  

  //---------------------------------------------------------------------------
  /**
   * Return the bitwise-OR of all attributes set for the memory location
   * corresponding to the current location of the iterator
   */
  extern virtual function svt_mem_attr_t get_attributes();  

  //---------------------------------------------------------------------------
  /**
   * Move the iterator to the next memory location. The order in which
   * memory location are visited is not specified.
   */
  extern virtual function bit next();  

`ifndef SVT_MEM_DPI_EXCLUDE
  //---------------------------------------------------------------------------
  /** Retrieve the attribute mask for the lock attribute */
  extern virtual function int get_access_lock_attr();

  //---------------------------------------------------------------------------
  /** Retrieve the attribute mask for the write protect attribute */
  extern virtual function int get_write_protect_attr();
`endif

  //---------------------------------------------------------------------------
  /**
   * Sets the error checking enables which determine whether particular types of
   * errors or warnings will be checked by the C-based memserver application. The
   * check_enables mask uses the same bits as the status values.
   * 
   * The following macros can be supplied as a bitwise-OR:
   * <ul>
   *  <li>`SVT_MEM_SA_CHECK_RD_RD_NO_WR</li>
   *  <li>`SVT_MEM_SA_CHECK_WR_LOSS</li>
   *  <li>`SVT_MEM_SA_CHECK_WR_SAME</li>
   *  <li>`SVT_MEM_SA_CHECK_WR_WR</li>
   *  <li>`SVT_MEM_SA_CHECK_RD_B4_WR</li>
   *  <li>`SVT_MEM_SA_CHECK_WR_PROT</li>
   *  <li>`SVT_MEM_SA_CHECK_ADR_ERR</li>
   *  <li>`SVT_MEM_SA_CHECK_DATA_ERR</li>
   *  <li>`SVT_MEM_SA_CHECK_ACCESS_LOCKED</li>
   *  <li>`SVT_MEM_SA_CHECK_ACCESS_ERROR</li>
   *  <li>`SVT_MEM_SA_CHECK_PARTIAL_RD</li>
   * </ul>
   * 
   * Note however that not all status values represent error checks that can be
   * disabled. Two pre-defined check enable defines exist:
   * <ul>
   *  <li>`SVT_MEM_SA_CHECK_STD</li>
   *  <ul>
   *   <li>includes RD_B4_WR, PARTIAL_RD, ADR_ERR, DATA_ERR</li>
   *  </ul>
   *  <li>`SVT_MEM_SA_CHECK_ALL</li>
   *  <ul>
   *   <li>includes all checks listed above</li>
   *  </ul>
   * </ul>
   *
   * @param enables Error check enable mask
   */
  extern virtual function void set_checks(int unsigned enables);

  //---------------------------------------------------------------------------
  /** Retrieves the check mask which determines which checks the memserver performs 
   *
   * Retrieves the check mask which determines which checks the C-based memserver
   * application performs.  The return value is a bitwise-OR that determines which
   * checks are enabled.
   * 
   * The following macros can be used to test whether specific checks are enabled:
   * <ul>
   *  <li>`SVT_MEM_SA_CHECK_RD_RD_NO_WR</li>
   *  <li>`SVT_MEM_SA_CHECK_WR_LOSS</li>
   *  <li>`SVT_MEM_SA_CHECK_WR_SAME</li>
   *  <li>`SVT_MEM_SA_CHECK_WR_WR</li>
   *  <li>`SVT_MEM_SA_CHECK_RD_B4_WR</li>
   *  <li>`SVT_MEM_SA_CHECK_WR_PROT</li>
   *  <li>`SVT_MEM_SA_CHECK_ADR_ERR</li>
   *  <li>`SVT_MEM_SA_CHECK_DATA_ERR</li>
   *  <li>`SVT_MEM_SA_CHECK_ACCESS_LOCKED</li>
   *  <li>`SVT_MEM_SA_CHECK_ACCESS_ERROR</li>
   *  <li>`SVT_MEM_SA_CHECK_PARTIAL_RD</li>
   * </ul>
   */
  extern virtual function int unsigned get_checks();

  //---------------------------------------------------------------------------
  /**
  * Initialize the specified address range in the memory with the specified
   * pattern. Supported patterns are: constant value, incrementing values,
   * decrementing values, walk left, walk right. For user-defined patterns, the
   * backdoor should be used.
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
   extern virtual function void initialize_base(init_pattern_type_enum pattern=INIT_CONST, svt_mem_data_t base_data = 0, svt_mem_addr_t start_addr=0, svt_mem_addr_t end_addr=-1, int modes = 0, svt_mem_data_t optional_data = 0);
  
  // ---------------------------------------------------------------------------
  /**
   * Method to provide a bit vector identifying which of the common memory
   * operations (i.e., currently peek, poke, load, and dump) are supported.
   *
   * This class supports all of the common memory operations, so this method
   * returns a value which is an 'OR' of the following:
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
  extern virtual function int get_supported_features();
  
  //---------------------------------------------------------------------------
  /**
   * Internal method for loading memory locations with the contents of the specified
   * file.
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
  extern virtual function void load_base(string filename, svt_mem_address_mapper mapper = null, int modes = 0);

  //---------------------------------------------------------------------------
  /**
   * Internal method for saving memory contents within the indicated 'addr_lo' to
   * 'addr_hi' address range into the specified 'file' using the format identified
   * by 'filetype', where the only supported values are "MIF" and "MEMH".
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
  extern virtual function int compare_base(
                    string filename, compare_type_enum compare_type, int max_errors,
                    svt_mem_addr_t addr_lo, svt_mem_addr_t addr_hi, svt_mem_address_mapper mapper = null); 

endclass: svt_mem_backdoor

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
QqD962dNf9SMCGlHzPP7BW81gHZMnuk0Pzw2K1rkPrJ276Np83zxcZfGM7LUmKsS
OrU/RecbzRXDsLzWTdAGgAjyn9FSBuA0GnIsySkdyWxsMrzVDHPmLk6pKuZldU5f
eHov3oOFtV1rdNupISKGWypIQ9X4GpYLklAtCQiTm3KwwMjnSuKA+Q==
//pragma protect end_key_block
//pragma protect digest_block
UNyBt9kWrIl9x4sXDE6+kEwM08Y=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
4Ovv3fYigS4Xm09EhIwKfk+NmXo=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_MEM_BACKDOOR_SV

