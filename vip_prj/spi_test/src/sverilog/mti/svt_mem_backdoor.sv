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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
omSSuIWx/eE5/a2ZUV8sfdyhPRs9sWny5RFZumH34Y/TS3pgaqTHg0nTj2VIzywW
HzEDS+yG9ZXPD/RzZYsj+SH3h6mzxRSMB2oWpZmQbFKClpK/XzW4+K7LvGwSVz0G
i4OUBVZf9UEuq3ENQ1UYwkh0/NW6mH/3eN2aFBtw8CU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 18625     )
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
8MPHSlKxRubvE4pCm3pcZbtRXNdbMp5nArkolS3PSmX0r93Pa5ctU0d7ExgEId2c
+ABLLpM6md8+xWteosBdAtQPY+J36KNP5FAOq7kJTbOtiHaiygmQE5NzVibPZfQB
tvJ3oZaF0dVfh8SVz3jA058qYHRsb39I9dqhI4xdUPdYJUzE//SJJ0yVUmLYPzfI
0mgUbna8YychGmFk+B4oSHQyyToD8IMayTZ1tlg+N1K4r/soQ9xomSxknDLUomOF
zOb68jfiGAqYRDYe9iGvuJ5bwQZQQZ/0tM9fEQDGjTHZH+wclh4JJ2yfs0Ydh1y9
v29STBwA9xIMFbs5nUNFpWVdafwhqxsmdP0QtNYL2W9tS/mcoQLh8ajyjalq2yO8
1XY9bQmRn0v/COn2YK9PZsiR5j6Uiu3xMIZFQfuDHL3uukFR8j2P336zDT3yF04J
TsG+51aZV6UXW78FWqa23scBdVa5xzIv4rjeEn6kdVtrzurKWK76OFwqmWGUMNlz
AyRtjtBvf9DzRVbnue3nv/vR3oNRuBMevtc5F7UqzeuuwO0Sa5gHwrJ8YwCELbzz
zVieFbIHHHzKjrN86pwJFz70FzZWjf77hPRC2s1dNAlJOEUPbp14esmJKJ/fVqJ+
UvtRF8HehthejdeaGSptjuW+JdC3lBRfHMMcftyA5jf5Y9rSLQggx1Ap1BaB5RyT
XvpqD2Gjc9KQ+pzgsbO46lSyesPDeF7Efx3MBKeKcuZcm08MvVLDnJ3U+N8ZauJl
eY26+TLZg9sjqpIsBG+uFn4wsturYS+abPrExAMSCenoBbwFone51boUlTUHSIQC
GUU0NsVMZKvY7YBj2BDAvw8xmniU1aoIXzXSL/KgsIwK8tXrqGg7nDhydyh6+3tE
3ONuJ5PFKT6OUzAF4epiczoMphi5X4WoQetJMZkTmpJNBMcXrIXagjhbXA93lAFL
47mmPfaevgoRIkllWHNzkoNHaK4DXZh66jbbF4FRas3IPhuVCLJ+ADMMk6Kj5a8B
A7yEbYtyIjpABGdVaqUgTRR3DIF/IltgAGxlCDNAgWEs928/8V3vEThISFxyc2W5
f77Sk6mfMhoT9JcnKvIX8ly84poJCVYSWqAVJbkRVkRLQlE6sIVs6bxXsUoLQqMY
NlyFeshs/WcW2R0Ud3Ynk4yiTn3Qc8/SHqNSU4feSEEJBr7RMHwzO+JYHfUmn8du
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
u/QoNfUOYHD/og3zAcL/2Q==
`pragma protect end_protected

`endif // GUARD_SVT_MEM_BACKDOOR_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Y8IrEvyXXSVXr4ijwoy/SZhXX84Mi67t9Eh9j7E+pp2AkBaCKVMRaWi8kKVdDCur
1sWybC7qQRukWj6RCmrEt+C7MgSYc9PBDcRCzD5d5cIu7G3yX1oZIhddHF8zJpEZ
CdR3pRBS1PQ9Nbcq5x/OqjuDbdb1DrheEF+5B1xd+uQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 18708     )
FUmUM+1M0sEDuHWGCjETr7U+BUE5JrRFEZMHvLC8G0OWbRg1WGfFba7POl03ZRWq
lJH1GSPzrJC/67RYle6bC6yDEtJls3GBntKOerdqW0S7x+KACA//xzvA4ExI2YH8
`pragma protect end_protected
