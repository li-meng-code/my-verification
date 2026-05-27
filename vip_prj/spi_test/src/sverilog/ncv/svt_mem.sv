//=======================================================================
// COPYRIGHT (C) 2010-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_MEM_SV
`define GUARD_SVT_MEM_SV

/** Add some customized logic to copy the actual memory elements */
`define SVT_MEM_SHORTHAND_CUST_COPY \
`ifdef SVT_VMM_TECHNOLOGY \
  if (do_what == DO_COPY) begin \
    svt_mem_copy_hook(this.__vmm_rhs); \
  end \
`endif

/** Add some customized logic to compare the actual memory elements */
`define SVT_MEM_SHORTHAND_CUST_COMPARE \
`ifdef SVT_VMM_TECHNOLOGY \
  if (do_what == DO_COMPARE) begin \
    if (!svt_mem_compare_hook(this.__vmm_rhs, this.__vmm_image)) begin \
      this.__vmm_status = 0; \
    end \
  end \
`endif

// ======================================================================
/**
 * This class is used to model a single memory region. 
 *
 * An instance of this class represents an address space. When constructed,
 * the address space number is assigned to the instance. If there are multiple
 * memory banks/address spaces, the value of m_bv_addr_region should be used to
 * select the corresponding memory instance to access.
 *
 * Internally, the memory is modeled with a sparse array of svt_mem_word objects,
 * each of which represents a full data word.
 */
class svt_mem extends `SVT_DATA_TYPE;

  /**
   * Convenience typedef for address properties
   */
  typedef bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] addr_t;

  /**
   * Convenience typedef for data properties
   */
  typedef bit [`SVT_MEM_MAX_DATA_WIDTH-1:0] data_t;

  /**
   * Defines values used to specify what type of data is returned when a read targets
   * a memory address that has not been initialized (not previously written).
   */
  typedef enum {
    UNKNOWNS = `SVT_MEM_INIT_UNKNOWNS,         /**< Reading any uninitialized address returns Xs. */
    ZEROES = `SVT_MEM_INIT_ZEROES,             /**< Reading any uninitialized address returns 0s. */
    ONES = `SVT_MEM_INIT_ONES,                 /**< Reading any uninitialized address returns 1s. */
    ADDRESS = `SVT_MEM_INIT_ADDRESS,           /**< Reading any uninitialized address returns the address (plus an optional offset). */
    VALUE = `SVT_MEM_INIT_VALUE,               /**< Reading any uninitialized address returns a fixed value.*/
    INCR = `SVT_MEM_INIT_INCR,                 /**< Reading any uninitialized address returns the incrementing pattern stored in the address. 
                                                   If the incremented value exceeds 2**data_wdth, the higher order bits are masked out.*/
    DECR = `SVT_MEM_INIT_DECR,                 /**< Reading any uninitialized address returns the decrementing pattern stored in the address. 
                                                   If the decremented value is less than 0, the returned value is 0.*/
    USER_PATTERN = `SVT_MEM_INIT_USER_PATTERN, /**< Reading any uninitialized address returns data is based on the user pattern that has 
                                                   been loaded into the memory using load_mem(). The pattern loaded through 
                                                   load_mem() is considered to be repeated across the entire address range and the 
                                                   data returned is calculated accordingly. */
    RANDOM = `SVT_MEM_INIT_RANDOM              /**< Reading any uninitialized address returns random data */
  } meminit_enum ;


  /** Identifies the address region in which this memory resides. */
  bit [`SVT_MEM_MAX_ADDR_REGION_WIDTH-1:0] addr_region = 0;

  /** Identifies minimum byte-level address considered part of this memory. */
  bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] min_addr = 0;

  /** Identifies maximum byte-level address considered part of this memory. */
  bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] max_addr = 0;

  /**
   * Determines the form of data that is returned by a read from an
   * address that has not previously been written.
   */
  meminit_enum meminit = UNKNOWNS;

  /**
   * Value used to calculate default data returned by read from a location not 
   * previously written, if #meminit is VALUE, INCR or DECR. If #meminit = VALUE,
   * this represents the default value returned; if #meminit = INCR or if
   * #meminit = DECR,  this represents  the default value at the minimum byte-level
   * address of this memory. Default value of other locations will be calculated based
   * on this value. 
   */
  bit [`SVT_MEM_MAX_DATA_WIDTH-1:0] meminit_value;

  /**
   * The offset to be added to the address, the sum of which defines the data returned
   * by read from a location not previously written, if (and only if) #meminit = ADDR.
   */
  bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] meminit_address_offset;

  /** Stores the effective data width, as defined by the configuration. */
  int data_wdth = 0;

  /** Queue used to store a user-defined pattern */
  bit [`SVT_MEM_MAX_DATA_WIDTH-1:0] user_pattern[$];

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
CpeciS7T5g4s7q/uAYZVpFcE3f9Ig3OEFekSEZXQ+nsjcdOJZ82ZVYqtwA7vY4R3
WI4YhX+GIGepoPMLX80j8NOh8r4FQNu+cDxwnvUsOfnYPsRXMJMHnjzlVEKwpE5R
gralPMqcWY1J5FUWd2whyGKP6Dr5WefN4knHbc5Oo6L8w515yo5UMQ==
//pragma protect end_key_block
//pragma protect digest_block
yOlD8rpfak6mvIWer0BwMr4cq1Y=
//pragma protect end_digest_block
//pragma protect data_block
mx5bQhkjkATCNODzo0Daes/aM9/DWux7Vl2RsIqtL2qEQJlkdKP6Jt8aLzme0mAh
3gNe5zMAOiBy/TGgZ7wuL3OOlupwOixV/3Q3aiuQtcFlkviNqErEdUoTYsYVja29
TbcHQy78Md7dsOCVEJvhWeG6lArXkPtie/GUGEZ+LyCLGtI2oNfdyHZ2M7XIpDF/
U+fILjCy28iE4uXQy2oG3AJhboI51lZoVXoNCUMvwMORcvj2O+7TcE6USG2fcci5
SWcm/i+GGWaq6J9Yg/RL7gCUKFrCnJBIIepeEJ37ctR5yGGiiylUQX73g7ukXgCk
jM71k8qxWWLJXalHTVIoAFwtG0nYwWdFCaGIUEaJA4f8OUGR0faEDFpAT8Jowz0y
4nPA2GmX1pwTZNZiqjyE6nUDZPcPzaZrv5YQ9r65gYEJ5ooY7PNWKfaQVDeSyjGo
7ZrirWvb2Ch6WAHn6G5nVRoXQdh4oj8CLxb0ryvHGenlF+8yxFiphA90w7CIO/vb
EE05aiXcRySe9o0b/eAPDuxnBaoeeo1/EiK0F2urOnPZzIBe+P+naniT+VutQOou
PvRCBSUk3OfPjzspegjkuOIw6t4RsESvlGJ7cfBnf5R5LuampJWSX8QaAVjslEdt
LtcHta++uRSoha2Fm8Jc/VRc79Vg/gEtQuhiFYBUGgb7QiE5A44vuKwAImpIAwYV
4/qJciz4kPEdMjiifJOpmJlETxg7KXSqXUR0dwMWhtFXR3AKDzv2x+1JSC/rkbDJ
BPmkmk+WiaeG3Y/uKxsNIaB+vJkhmL0r/GGV4mYVmUcEzY7N3SPWDfE/eT0dHEYc
y334NKQ0LiapDYPQOiYRkfCyvNPL23HD/Y+ZRbgjFP2fxkfb9LARZIqHjvPzQ9Dd
OObJsnqIODpXSHosKIaZVR9Yxy0UUlHPcH7KhdJmBdO+S62yVwTADNOOvx0VY/+G
+2tJpE2DLkOxA854tnW5/QMPUkdQLS25iFvnej6a9DQYVq1Uby8tJJPBZyrIOJul
THpWl165d0ZczqRHWLC3Uo2OPUAopcrIDa0u0/l0H6PpN5fRLJe+fJ6aY3HDOS9Z
LCkBTtacnvYKZe4WiJevIGCH5lYHHjnSMopZr8g5BDI4P3jQ5BppXbxQ1sDibvto
TQ5qK0CuyiEeFSXVdz2dEPUiiHRm6za/mleqsBPrS4NTBinFqZqF4jZAOAWrm2XK
f91c6gRiA684qwUhvbBNe0/WB17TpelU20oraqpHh/I0IjzWbRUBKKYOFcILNaRE
Umj/pWhnlGHZeFdGNLWQMCNm1svXkWmKYTg3mJNkmRK5BzS2xqwZlnOTF80lodHa
3FLXWuAgtWzhK47SgtCaZVlo40jgN4TDVaQ2uLTQIWFAulEYKdP+uqU0BpXhMJdo
PDSADH4EYevTOMKhCICbmIEx/sTidkKwqWL/1w27pUU88vZNzVZw2WcK9ddkVAVO
xvLufHQaQLgetzFWwNTtBmFKuBW+P4jV04o98U1uQvhBAPA+SVIGZ4Er74fshu4f
yYUEOxi94x2Nj31Fs67JCsg2iWo6LJY/SszH/pqmvst3HRxBTFYh3I9h1cL+LFg1
7EgAewPaBz+BsfgU4Ef/+kd0Xs9LC1mCY3OPSoI7mUXMHtnvLWWLsqXm/C/K8RUf
EJDjHr35Cm3iCQV7n+MHxxli+hdF3q5he3u9gMyIOkqXXW/qhMhsH4Q+WH5GskpB
USjC0LIL4qsalZp9Y4mbR9v6rpbLUcUMLPKCxVsYgjlzbuUaavt5a1jZx5/ByZym

//pragma protect end_data_block
//pragma protect digest_block
MgC0NbkhidWbdQwZen2vMOBXJPI=
//pragma protect end_digest_block
//pragma protect end_protected

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_mem)
  // --------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new instance of this class.
   *
   * When this object is created, the memory is assigned an instance name, 
   * data width, an address region and Max/Min byte address locations. 
   *
   * @param log The log object.
   * 
   * @param suite_name Name of the suite in which the memory is used.
   * 
   * @param data_wdth The data width of this memory.
   * 
   * @param addr_region The address region of this memory.
   * 
   * @param min_addr The lower (word-aligned) address bound of this memory.
   * 
   * @param max_addr The upper (word-aligned) address bound of this memory.
   */
  extern function new(vmm_log log = null,
                      string suite_name = "",
                      int data_wdth = 32,
                      int addr_region = 0,
                      bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] min_addr = 0, 
                      bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] max_addr = ((1<<`SVT_MEM_MAX_ADDR_WIDTH)-1));
`else
  // --------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new instance of this class.
   *
   * When this object is created, the memory is assigned an instance name, 
   * data width, an address region and Max/Min byte address locations. 
   *
   * @param name Intance name for this memory object
   * 
   * @param suite_name Name of the suite in which the memory is used.
   * 
   * @param data_wdth The data width of this memory.
   * 
   * @param addr_region The address region of this memory.
   * 
   * @param min_addr The lower (word-aligned) address bound of this memory.
   * 
   * @param max_addr The upper (word-aligned) address bound of this memory.
   */
  extern function new(string name = "svt_mem_inst",
                      string suite_name = "",
                      int data_wdth = 32,
                      int addr_region = 0,
                      bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] min_addr = 0, 
                      bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] max_addr = ((1<<`SVT_MEM_MAX_ADDR_WIDTH)-1));
`endif

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
  `svt_data_member_begin(svt_mem)
    `SVT_MEM_SHORTHAND_CUST_COPY
    `SVT_MEM_SHORTHAND_CUST_COMPARE
  `svt_data_member_end(svt_mem)

  // ---------------------------------------------------------------------------
  /**
   * Configures how the memory structures data to be returned by reads from
   * uninitialized addresses.
   *
   * @param meminit (Optional: Default = UNKNOWNS). Refer to #meminit_enum 
   * for supported types.
   * 
   * @param meminit_value Specifies the (hex) value to be returned by a read
   * from any uninitialized memory location, if the <b>meminit</b>
   * argument was passed with the value VALUE. Specifies the value at the minimum
   * address if the <b>meminit</b> argument was passed as INCR or DECR. 
   * 
   * @param meminit_address_offset Specifies the (hex) value of a word-aligned
   * byte level address. If (and only if) the <b>meminit</b> argument was passed
   * with the value ADDR, a read from any uninitialized memory location will
   * return the address of that location, plus this offset.
   */
  extern task set_meminit(meminit_enum meminit = UNKNOWNS,
                          bit [`SVT_MEM_MAX_DATA_WIDTH-1:0] meminit_value = 0,
                          bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] meminit_address_offset = 0);
  
  // ---------------------------------------------------------------------------
  /**
   * Returns the value of the data word stored by this object.
   *
   * @param addr The byte-level address to be read. The addr should be aligned to
   * the data_width of memory, if address is unaligned it will be realigned to
   * data_width of memory.
   * 
   * @param set_lock (Optional) If supplied as 1 (or any positive int), locks
   * this memory location (preventing writes). If supplied as 0, unlocks this memory
   * location (to allow writes). If not supplied (or supplied as any negative
   * int) the locked/unlocked state of this memory location is not changed.
   * 
   * @return The data stored at the indicated address. If the address has not
   * previously been written, data is returned per the setting in meminit. 
   */
  extern virtual function logic [`SVT_MEM_MAX_DATA_WIDTH-1:0] read(bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] addr, int set_lock = -1);

  // ---------------------------------------------------------------------------
  /**
   * Stores a data word into this object, with optional byte-enables.
   *
   * @param addr The byte-level address to be written. The addr should be aligned to
   * the data_width of memory, if address is unaligned it will be realigned to
   * data_width of memory.
   *
   * @param data The data word to be stored. If the memory location is currently
   * locked, the attempted write will not change the stored data, and the function
   * will return 0.
   * 
   * @param byteen (Optional) The byte-enables to be applied to this write. A 1 in a
   * given bit position enables the byte in the data word corresponding to that bit
   * position.
   * 
   * @param set_lock (Optional) If supplied as 1 (or any positive int), locks
   * this memory location (preventing writes). If supplied as 0, unlocks this memory
   * location (to allow writes). If not supplied (or supplied as any negative int) 
   * the locked/unlocked state of this memory location is not changed.
   * 
   * @return 1 if the write was successful, or 0 if it was not successful (because
   * the memory location was locked).
   */
   extern virtual function bit write(bit [(`SVT_MEM_MAX_ADDR_WIDTH-1):0] addr = 0,
                                     bit [(`SVT_MEM_MAX_DATA_WIDTH-1):0] data = 0,
                                     bit [(`SVT_MEM_MAX_DATA_WIDTH/8-1):0] byteen = ~0,
                                     int set_lock = -1);

  // ---------------------------------------------------------------------------
  /**
   * Dumps the contents of this memory into a file. The data is dumped in hex format.
   * 
   * @param filename Name of the file into which the contents are to be dumped. 
   * 
   * @param data_wdth If the data width of the memory is greater than or equal
   * to 8 and is an exact power of 2, this value specifies the data width of the
   * the words in the file.  If the data width of the memory is not a power of 2
   * or is less than 8, this value must be left at its default value (-1).
   * If left at its default value, it is assumed that the data width of the words
   * in the file is same as that of the memory.
   * 
   * @param start_addr The start address from which data in the memory is to be saved.
   * 
   * @param end_addr The end address upto which data is to be saved. 

   * @param enable_autosize_of_saveddata Control to write/save the data with automatic sizing
   * i.e. with leading zeros, if any
   */
  extern virtual function bit save_mem(string filename,
                                       int data_wdth = -1, 
                                       bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] start_addr = 0, 
                                       bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] end_addr = ((1<<`SVT_MEM_MAX_ADDR_WIDTH)-1),
									   bit enable_autosize_of_saveddata = 0);

  // ---------------------------------------------------------------------------
  /**
   * Loads the contents of the file into memory. Data should be in $readmemh format.
   * 
   * If the data width of the file contents is different than the configured width
   * of the memory then a step value is generated that is proportional to the
   * relationship between the two widths.
   *  - If the data width of the file is less than the configured data width of the
   *    memory then each value that is read from the file will be merged to write
   *    into contiguous memory addresses.
   *  - If the data width of the file is greater than the the configured data width
   *    of the memory then each value read from the file will be split to write into
   *    multiple contiguous memory addresses.  Care must be taken in this case to
   *    not exceed the end address if one is supplied to this method.
   *  .
   * 
   * @param filename Name of the file from which data is to be loaded.
   * 
   * @param is_pattern If this bit is set, the contents of the file are loaded
   * as a user-defined pattern.  This pattern is used to return data from a read
   * to an uninitialized location if meminit is USER_PATTERN. The pattern is 
   * repeated across the entire memory.
   * 
   * @param data_wdth If the data width of the memory is greater than or equal
   * to 8 and is an exact power of 2, this value specifies the data width of the
   * the words in the file. If the data width of the memory is not a power of 2
   * or is less than 8, this value must be left at its default value (-1). If left
   * at its default value, it is assumed that the data width of the words in the 
   * file is same as that of the memory. 
   * 
   * @param start_addr The byte aligned start address at which data in the memory is
   * to be loaded.  If the value supplied is not byte aligned then a warning is
   * generated and the start address will be modified to be byte aligned.  This argument
   * is optional, and if not provided then the load will begin at address 0.
   * 
   * @param end_addr The byte aligned end address up to which data is to be loaded.
   * If the value supplied is not byte aligned then a warning is generated and the end
   * address will be modified to be byte aligned.  This argument is optional, and if not
   * provided then the end address will be the maximum addressable location.
   * 
   */
  extern virtual function bit load_mem(string filename, 
                                       bit is_pattern = 0, 
                                       int data_wdth = -1, 
                                       bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] start_addr = 0, 
                                       bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] end_addr = ((1<<`SVT_MEM_MAX_ADDR_WIDTH)-1));

  // ---------------------------------------------------------------------------
  /**
   * Clears contents of the memory.
   */
  extern virtual function void clear();

  // ---------------------------------------------------------------------------
  /**
   * Used to check whether a given byte-level address is within the
   * Min/Max bounds for this memory.
   *
   * @param addr The byte-level address to be checked.
   * 
   * @return 1 if the address is in the memory, 0 if it is not.
   */
  extern function bit is_in_bounds(bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] addr);

  // ---------------------------------------------------------------------------
  /**
   * Used to check whether a given byte-level address within this memory
   * is locked or not locked.
   *
   * @param addr The byte-level address to be checked.
   * 
   * @return 1 if the address is locked, 0 if it is not.
   */
  extern function bit is_locked( bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] addr);
  
  // ---------------------------------------------------------------------------
  /**
   * Gets the aligned address.
   */
  extern virtual function bit get_aligned_addr(ref bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] addr);

  // ---------------------------------------------------------------------------
  /**
   * Returns the class name for the object.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /** Override the default VMM allocate implementation */
  extern virtual function vmm_data do_allocate();

  // ---------------------------------------------------------------------------
  /** Enable the VMM compare hook method */
  extern virtual function bit do_compare(vmm_data to, output string diff, input int kind = -1);

  // ---------------------------------------------------------------------------
  /**
   * Hook called by the VMM shorthand macro after performing the automated 'copy'
   * routine.
   * 
   * @param to Destination class for the copy operation
   */
  extern function void svt_mem_copy_hook(vmm_data to = null);

  // ---------------------------------------------------------------------------
  /**
   * Hook called by the VMM shorthand macro after performing the automated
   * 'compare' routine.
   *
   * @param to vmm_data object to be compared against.
   * 
   * @param diff String indicating the differences between this and to.
   */
  extern virtual function bit svt_mem_compare_hook(vmm_data to, output string diff);

  // ---------------------------------------------------------------------------
  /**
   * Hook called after the automated display routine finishes.  This is extended by
   * this class to format a display of the memory contents.
   *
   * @param prefix Prefix appended to the display
   */
  extern virtual function string svt_shorthand_psdisplay_hook(string prefix);
`else
  // ---------------------------------------------------------------------------
  /** Extend the display routine to display the memory contents */
  extern virtual function void do_print(`SVT_XVM(printer) printer);

  // ---------------------------------------------------------------------------
  /** Extend the copy routine to compare the memory contents */
  extern virtual function void do_copy(`SVT_XVM(object) rhs);

  // ---------------------------------------------------------------------------
  /** Extend the compare routine to compare the memory contents */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
`endif

  /** Added to support the svt_shorthand_psdisplay method */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  /** Added t support the svt_shorthand_psdisplay_method*/
  extern virtual function svt_pattern do_allocate_pattern();

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
hSgpd9mA/0b15SP6z62LkgZLZe8fUZTdJ1AGaXLqcyHO/5LxuevEgrsDzG+Ot5DD
qoNpffvWWsCG28CVZAqvypwo7SP7mpvStYOow9YJl9KdIXSbicOLIeQcEw8QBrH5
SLsrwgdfL8eGYORXfVT4z4V2NM+VC+wUMx3ktQGW3T+9xdWqPyQm+g==
//pragma protect end_key_block
//pragma protect digest_block
h9HGhznz2uCo8oJP9Z3l8znkV1w=
//pragma protect end_digest_block
//pragma protect data_block
YZuqORixknteFGNYZi7w3tS+8lGaUgOJDJf5B3y0IvU9W2QuIaHJqWsCKxSveUZ7
0Bw6SmRTpERF9Sf4l8BNEdyUeVH4LNqVOEdydIbMbYpq9BfcuPgmFs7Luw6rvHkB
yvfdQoFcvTiyWVZ+l+EBGqab2QPmOcIhMa+t8rXt+pryHpW30g6+Ox6xDcDdyhH1
A12gMu76rspht+OV9O7b4h8BG56oVHZsciy6l8xAeZZ1qnuJtCCw+0AtewGz63NQ
StFXc+J+UaYVNwtVBAHRf2LLzz/+bV2Ir7Q4oLQa925BiK6Qg5WmbL/7otrTWnlX
fwv1HtnWYCdilHEI/T5RFN3HkdFeEpM6IlggtZLLbDzpiaCutzQRstmsg4T8F/uY
8RuzsJgDBs46oSw5jKOaUueV89n41zKnyJXypb/nfC7wIqlfMOsZLDZU9TjIPXyi
IT7zW7GVihnuedWKa3B+YiEfooFVPIdyPmJFECvrv7nq0AOD9TCtmDSS6ObxT+z6
E4M+Rmaz1Ps/7AW9UrGmSu8qH41eDRIZmWeQ0Hc8P4jrvJ+qbFW2z83hJCpu+Y/Y
WC1qQ/jTlwvLCEB1qFprTYThvRiNDMHYkkG1PRKDSIxO+wM5YaqtPuxXOubXvjbv
9Fo6h0ME9pJGvmd2PeFayPdGA9WAyItLj/ZNyEWi5RUk1iiq4DZ6I5JHuparzg28
wajuearohzns2QerpgX3i2f/fAfFIvj94mh0FplrvQ6+lWpsVXAlMkZEbEkRnjgl
sYf8TKfYVXH9oGFsRp/fwb70sWCoCgkh9uNqexxffD0VfDmM8Khtbpe5b9+HvzzX
7hb3X5FB/8zgIzl/eYAyNLux1pv6M8P4MoeP4lfAerC3ZAawlznryjCKJtjaH9so
daMDQGbLGxTpffLQAqole/ZijGy59cXPFmW6K5R8AzPXLDp1h8k4GTzh3tKpXp/p
XJKY6NehkhHq0jleGd/wJz4pYBouPrxoP7pcgB5Mhc7NleXZIM5Pv6qoC4Nu/UJ2
YPnpBTQrwkwCJPTBTu5zwEVAtyZ0encTDA4H4Zb9qKSQXh4Frv7rmRnbvroqzg+I

//pragma protect end_data_block
//pragma protect digest_block
K5MJf9QzO1Ky4GUL4a/1EGQCTmo=
//pragma protect end_digest_block
//pragma protect end_protected

  //------------------------------------------------------------------------------
  /**
   * Applies a property value to this memory
   * 
   * @param name Property name to be set
   * @param value Property value to be set
   */
  extern function void set_property(string name, bit[1023:0] value);

  //------------------------------------------------------------------------------
  /**
   * Obtains a property value from this memory
   * 
   * @param name Property name to retrieve the value for
   * @param value Property value that was previously set
   * @return Return 1 if the name was previously set, 0 if not previously set
   */
  extern function bit get_property(string name, output bit[1023:0] value);

// ======================================================================
endclass

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
mX35mEy2tFtX64FGCtdPzPPPfFU7TzMVnLZDLZVVXYAwH/lngW2b3RJkuqENewUk
WCH46+O3c+1M0utk54SUOEkC21sPIjLGfDh6/vPkngY6YrOngoRg6aIjt3T/gExl
+PnAcCb/kgFmTDUWz3oKR863Kl52zg3m8nKz/N0mQWGNurDhdUvnuw==
//pragma protect end_key_block
//pragma protect digest_block
zMRNDLkORnPxzcdeKS5dIZW3l4Y=
//pragma protect end_digest_block
//pragma protect data_block
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
Hnvb+tOm0KURQaH21rTJHYso/0/wzILkyl3oCRfvymyTNGSulEoJzcDG3LjTvUmr
ZeqjoSHTjaU5lV6aLfq0q+ZfvEvAJ2hxJvn8SLFbsA8uoWoEztZcN4WHDBjnTbLn
aQ6RF17SmZbeYbd3AZ+WkkURbOs+crBrG/REdex5pAa/5lwHsVPFE/VRGSfe+VEU
aBs7U7YLZH/Yb0y7ITFR40i+8CFanAg+KpgxV5U895xibGpody9r17hL0E/1c/bS
U0l32tJliPsSXOhJOtQ+hqEYJdgodKtlnJTFHWA4i39lkaJh2V6kOQIYSbNy7SHn
wiiDl+ETdNEFmRcRatkCpYFfLslXD7OTRFWhS/mG5XJjus0yBrd9jXXd4fHcByOK
mln2hI5UwD9DnWrvMsuYCgqxgR7FTNTiRls33c7fQJyPAryUp8mrZxqj+aScDBPC
4IdONOYiKeJCDbxqc2Q9ClAPy4XJk4ps5dIgjlR3x0FDugmIA7PydUPufkFSPz1i
CVR0jRc9XH5L/KIMXMNUGI8a/1SZtvAXgtcVB782oFPE7iFYX8AqHw/8Zj6bQjKY
bYoGgIKZdPl5ViK3G32f9Rb2AOlpA2M+C3i9SzFtauFI3SosnaTDYsr9avdttZh7
tKHCXKj5GWSIj5/qiXFJDMd4A+pxpSXZn8r4IHm5uqXkCDyWrA4dn5bvY0vnQpxz
Cw3JtZyl7Ewkmj7JdxpUTFRhgSVgN5Hw+XIB/TK2gOiyTezVT9dYgrT89hk3JOhT
oaevIpZaoVPcq1Ez45U7FrmlMWTiJukV/SARYOVYoSxU4/MWo9urQw18cuP7Mtq2
VDouCALeytKnE51x7ltPnncEAV9VW1ShwLw70/Z9weYkXjRn6XFRlebv4Be3Lbhx
vEP0J4J9OvDUYoBrw1cWPKSy0BMup7468llVGf8vWCM2VUc518LzYhN2o7tRq8lo
6RXLf8pu4/QsAhcIjopL0xM0jAm5+FdLdkxhPVJanD+joB07IyIXIN6zKPJFPLR3
0Qv75H9KLXwhP5VLMpWWItjq/tnarD08lwsdcL57NedwpGbTu/iptYI687vx0Soi
iCtV42MtbS2jROVVVOXOSIdFWfBxg2rkzRHUYhx4VqHGEuYTfW3S/yoOAt/ek4uR
1+JrOu5+tSbkb7l08d9tQYjBgQYNvRYwJZ3gFvrnw2FGUPEL3AgfSRV9scR+nBYo
OFJXEo7dfxni4QRVeCsDTO+oDlsOgYEOI8q56bppuJEjuLfHq3rI5M1s67SRK7G5
PtGu5PYM3KsPQDOgjqddvy8fnB1cPU1clOMYrdnBssuRqKOdgZVe4CGUohgeIwxJ
l7TIX6/0XUcxoUnt4xDA+AxT9XhXfxqK0ayf6E+hi1FcO8WhUxR8RFzy0ftcMNT1
HRHNVmW+A1nnguDBpjaxU0uX9w9qDpgUDmhC1c3FKUcQaxMY2QeVmVsUfQwoNE33
V3/AuUuuUEzT2/bB+Du8aOvdzuDyYVn4+nl/tN+sT08UwjopfuP+3KIC6pubL0lr
h88Gu1XYelLCaZ/SsCDYJoV4ZqBCfEM+RAiKsPv0IrYTl8hEgHAhiKR8zdnfnhft
uUukt6jtQ4fTcNfkoUIjectq1J5Lz2pNFyFETzX5yJZLBz8kFdO8ZV+3HGVyT9Ca
Wm9ywTwpzwAuwet2Orr9BleYGIzYv5GgcOVUWYK2kIHyBsFTsbhCS7pthNTu82XY
b1xQU6FcyWX4Vm28PWt1otBCSz68q/C7lC3eIQfbbFba1u4k9xguOeRDOFK08F/S
WRqN3gXzq4jauiD1kvCdCcTRMd0OlDoZE65CgbTbqlRI/XzMTCKujcPjZ7m1tSKc
x/+FGyWXYQbmfYKQnD3YSZnpTh9BrAERvx2/oz7oI31jg+/35Dl/adNBpHbyV4Ba
z14XuQ5n+OZxGfR6bPmdP/RifAmYjbC/xbhweOm2+fOPYYdErO61CVJERJErfXN9
LGV6NKW69doKCz97B0JWpzD4dsQjafogsJSG/aI07ZtDeV7lQqaO8xfYragcpIlu
TZqIMmPpqUDrCN5GU+KKY16apocwjJigGPHNlLPSP2AV64W2pchXKtor+OMv1PL9
sQezchlYICth7DfbQxi9w7FbQFvgTPFybNNgBZNBHRIAuJAUZnguUhCNueDekq77
JQ4S5mBlJKvU0fyhlTKWppIxoWJZbhNKE4EgJF6XB/qcMXLXpL0XFiMLu+AeqdZ7
tzNtJ3+X1LLHH2YG/Xr2bUZLnjHCVbdI/zqpNzBxQTmIolopuTN5i5DRxYYG5i6M
qf/DLzTX9dLQSPXsQFEB2FjKFkjW0NCCfwROw/y+Q4f+UYnKajZvOJ/c7MyBDkSU
8PCRn/+YrU6FkL8NKhvUuIhjaCicky5Y1ujIgbRV2bKRHQ+jQ7lWTVK9fJIBkdAP
hVFu2t+PohRQpuL3gTiOjOP9BHe1lYyHeAqvxjAO6qm3S2oxGW/c2mqi/kywIu1c
i94a3bE4i6WWcTj+hAusOOUci9QUOSft5kU3ACbpfdVhLqr7ycfNwCyBAt9QBmxm
04PMJzb04DHg84Ku8gswbZHnGprGmwAngOgiO5WLz8yWDBUpkT6maxBQYDAI9/r2
3eNSxRimq7q0w467lbF2ApLRNzzaksOLn2XrIhxHTJpO2m7E+wad+XfINO+8kkkd
i0oM5owTY1H8hg4NO0UEY0GUERus7nEVE4adC9yUgDP6M0nNZrDH7PeJ9UYFHQe4
dVxQSIVujCJiWCNIfhfX8rN8eTNYuvJxCQTbC7tl6fUNKCI5K4HRuodGDG+D9b3r
549I2M8s/g0SgzuVhnuaSJmJ3xrdYTdlfKS1jMNXlPB+02iHMQE5ISpENcqiOK2d
xQRsUcQwd81BuiXnuH7zG6yYqGIg4DmSwxsh7WlDjOQlD7Ir3BM5xCvSqKGtPsjj
CyhgyJrnrFAeT1fby50FX0Ew4otrLnVDz+QHg7XemoCuHdGkXUQTHBSSD7blf5qa
R78vBWJxEGKaY07FfEMO/pgFPlt1WWkn6IjiiyMSj+4etCXsGpPmq+0/kfsPE0up
zOfgOGj+LLzAPHwDiGnEg6FesqhFticDiGSjjJC6eV0PdNq7NFS19Jb9cozo8ig7
io0kj3uiYWqolt2q1PzbOCVRZUzJv5sb+Cnbn2x77xCy6lq4J2oXOLCPRYllmjnK
bF8niiCt166N6VGVgxl2Z2KPHyANEAx+gOeMko5GAnIwom01MMRgNut09PPJRWte
rsFj4ZxhbblAIkCqzazfSCy/KRh34Hfzdz1+2imOUoSBGi4fVwZWUgqHCOje3hvL
O/wAfk8y5VpNNvvsmDEu78aINIzBGIZeK+I9q57AccAbLMelXWpik5R+TMQuEO/t
G78OPbFJXwObYJbUPQl5++kFdLOK9OEfIkNDif+86h0nYLB8lv30NMlJSOMhQTXy
o1fUcgKoCvFZDIVWHtfa4ZOfNkvAGjEfQWfZDUp1Yaa5UfxXJaxxDIDyGqBh43H8
6rRaGr5z39VQcDd8u7ZYo75h4csZAZhctAZXTPx1L4blzYWrf2kODpBgot4XrOa8
7mPD7z/JA6hmpHy196TX8QRR+VCShz4upVJpXkRbvIue6gSPcyzDfU3xsemRKFoK
1akU+2ct8J4X8D/2JlvdOsDVkh8VvE25Ys26tSp5KuK9eV4wPjCaj5BOTph/aUFh
PbFybFVRpP1QJGhvE1upceLGiWaMCZI3SXdXY09k07TyoLnTfFfJqqdqEdxVtF1l
Spkzo/pT2it175RguLoEzpfAAFqGY0XXDaNtEw71Axb4OeauT8wzuUjbb7ce2q9K
YPjRYy9uQRDL2eG6OLUNsUdI5Jr+lL94/wueC+LIUlIRFIPuzJ8NwiFMIC7i5K/U
WiK9tuDorZVyBcGCU6AMteg60dCMwMwuEPVsp7e00nHpf46kEZ3lI6qibKIpbO3Z
EvUNX7AOxKDtZJTE70uDGGgpQamLmXf7UjFUJf5nHNC+oDKL0u8IrzjBLnf9pt1L
zMH33C+hl9q8RtSA9G5xdVsvrPTnBVv9+7cTqNdzPk3qPLy9U7+v32OAvAz4ccSW
eqbh6b/SkpRQ5/l3dfEHV3xTPfsGoOhIFtL5zXYxeclyadNg3uQTFgpyT4HJjAmc
PGdYAMDalB5Aa0eWO488A2seo9OEslWj+gx8inMX1+edFS4dUnCfL0ZeG/gqjevu
1rdsPMgYARVknk7jtuOaeRISLHnC5plOxBUoW74QvUuQRNQroH7sIyTcamCAi3Bp
7E3qv8aAmjDR4loMsr/UqGM7zDEAMN9xVaOh4fFX+opCYUg78lpI9UJXJ1Wq19KM
Q5ovON6oBHeEqqPQe+GCB7Vn4r+Qo4ieZ8bxkaf75FCnRylTokgcDeClMEnoAJo8
wAgj7LHD9bIhljV/F/iMWhXgTL6D9t+I22TQL5NHRahTkveVL2rX5X+1PjGcwC9d
jRXB4IH48FXiGmvRaV46iME7xpxZ+dkccDwbD5YFkLBruj6I7chrJbYWqXUX8pVP
Q6qLnBzO691tN/WCEUUE2LWSiKOatF+/d7od8M/g0DU8hEgqgnj/nZJIVCAks8iG
7QjvVblPnOrukDnzyGxqrASHUzacS2QEgJFz/Vyqx1hhYh+AfZ8sZaRpvWbH8YMb
22Dqzv7N1unjDkhBXQ1TTk17/YXl8GGe4Gy7UGB+ndGVMfJ4ENDtkyU4RT6YAzJ6
0PjXqixAyVT5Jla+MJzkRxCofAyz45c2XQ/SxftgqhWxnIPVjtaPIiwyMOt17vGH
S6xec7RE6Ek99hLMAvAUOIx/VKzejnnh6k0PtvCVClLPSKtf8sPx5rAtGyh+rH5p
19LcJ6khg9Cp9eLALMZz8J+ftzyobth1qqArPKALzo55QJ2M7mQQMihp2jwK52Eb
jo2DfHB5Gf3ekkdGi47PE+w86yptG2DnjXd4LeOELTBpExoFAhjBeMVFpwOnLW7Y
yyF+2dd8WXf1yo/ZvQ1UaKc2uc9zFwUGZdEPJt47jlRDF6R8BdEj2V2/VTm6Q6IZ
+lAGP2koWXRSlqBxKfdhSYZ2RPYTQVmYVe/5l/30KOhUkXkzw4rA7yXiziYn+Xuk
opJ1+cuVyvYqrpdNXcMAGVoe3dlqE0Jnijb1SDFkf4rdH7apPLxxVmrHyJHfdkkn
Qe3UGecx0UbLoQC3GWx3oryupfVXyrXr92KdxGH2RYKGxIl1aw0NzGiBM3xlQYAH
IO5nCX7+4BMSsgd8jMv7l56KXQpF3lP4a2As7ErduECCj7HPzK1IPfZQpQh/orjv
WqoiPEsB/q6UIEtnVz1IXpaHbx5O6bI2NS37//CVQut7sqTofgtuh6kpzNcTc7w/
bQ0qcvFD1qWiiL/hg5/oR5B1JCAQDA3hrY9ebcdST3fxRPO7/s0OELfUzNWNKJrd
go8J5hhfKiD2IGiK3YdJyh5tQqM/41Kt7I3WENn7wp5vBkE09hHETvobk381daaU
WsEL7aJhHoQRGZhLMFsixke5+E/L+2CKr7SrPgrHVBlUZtzrVLBbog8hqVDKtZ0m
/MEa+qrpKgGITU6Ef1zoVRMXyqZ0lNSZ4qWmJONTigaljolACqIXIUykLFwbkg/o
pEcri0Q1gFpeJ5ssVRBDm46fx/rXMgXWYULh8AUav3qPrvM7KliqInapJJSFCt7z
fdh6QhLP2SJ4NRgJuMwxotJUO3zbw1N6Rwx10g5OrVmjvQkT3wcwXZxUBYhpSeP7
8fyjk/wW7iFhF3yA8/bkV1aWKvk5zPtbrqBHwpq799D8B0/Lc6nvChpHnJizlsio
FKeR9dVntTTkWE9DmZtZ9MswK3tgWGKy2pSmU70x6yvJ+/dJnZu4K2IW2g3YHmL3
CgN3dCG2rSxirPn91m9L65eKVLKggx26Xvi5x7lNVb/p5PS3Ja0U1qt5q9s4PHQq
o3c2jegACQAklK8L0jfT1f3LVfpUTmmsWSqSMb8CFRwnElc5gKOxNJRZt16GLOza
QcufSVW6ypek/eXQak2B3WPVlE1NJOhWG2lItKyGCoNgCRNMYE24gidVolSWC4fU
fyr7HCdb1AOz/kYFEGP96E/ndygz+D7TKEDClHTlNeyOCjBs+jet6Ydwmywj4cpN
4dHttSXY4KeDvMywigO+W2pWKfJL53++FCop6AWUGkX2vw0fQtEnEMOOWsVSllBa
MLL0Fqwm9CHaEJ90WF4MNluIzPrxI/IgM/YN5rBtxWoDhnVZmAWeHxFfdGS5Ty7Q
Yd+ekHgHE7BgtiMEIGyH8RG0kN7wtnjk7H815Z4yQYMm21PH3u3Pw0Hbxnf4h7dy
26pHW6fye8RycR67qcOM+xxeCzjeNe78249iDF4dPuo6RpDsecNE6QzSIcytW7ke
DE/p8wWxjTQZgfvlyKUq7r0aGLI7MAAKVr+Gx3wky9nY+IYEsFGt+cGvUMCb6rsk
Nb8liVkxHODmxFff0dznhlflecpejEve0DLhJXuD9KurluyPOD/X+heXoFj/ero0
ZZ8uQU7RQXD5VAtvdWCICpPBC8fGxh4k16vKIHjZsanC+PboHkO5RQ2OpjlBEr/F
iCH7rMAYactzdIvkCzisAYk8AAVHadbPvxQkAhj2Hm8JR+g2jq4iD2OiMzS6gee7
DmnziqbXSfGjdO7EIqyldvMZKOtKPBy7bjFU5k1dAKKNrH5sniKrO5YPaWGMC6mm
MWABfxklvYJbuuA2xKwp9xSxbFRRf9I1UV47XaAFjWWym7SAqdnAPrlqaCzuoRen
p+n8yCCb/VmszjX60WtA60FA0faqS0zYBJcAtk1Ub3vlovh6+Q+4llVa+qwSiu5q
ANuR2gQQ77zgKjBx4xNTI3+EsSHIGjNtfg8mgg9/zKtjibnFF4W+qT0fickE7uFH
oDZXHByGN1KSkanDA87e9nwIJyrxgcMWoc4fLS1wfhRz6nkWQunBi67Nuc+N1l3Q
Mw9B28XslnqwRt0zab/Vfh40m6JPMcwvt1YVJS2EzAJWMtQU6zmB4NRCdw7ixIQ1
thrfcusUAN5tQ7Ryp1KKqhzmUVYSUUk/fOwnzIOlDoI4HodedCpsAZVRTX/jw1qC
1SxVXQdjD90sdji1YtokVWuGewNp/ihnYUf59tiVIsoKxM5C7+qNZBdqlX59ec83
sPB+kARm8ZdC/2lVeMMAaPDmenrlQkLJFv1INxqdtSZoKOmwDt1LtjYRi4aTpX7/
tnaU+d+xP78o/5t+bi50NdbaCE142GSWJA5dItW/SdbGjcVqIqcD/+rej/g5kfl9
lo0RyIJ0aEiy+ZlqabqiYjYNwdWsoEINYoK9h0F6BWO5fiZBZtiDqUM+8Sz/tkD2
lzQ8p0NCWglHj4mciljrpGYGglvOR7iiaq64LtmmrE8hFJWFCaGmSbQFhAxPAeuy
W27csszO6UACv09p4UezHOfEHyxsIVFx34v6PIUNpeQo6xBecW5S/U3pZ88dZQB2
0quguwMq2HtRD3WSlkF/eeeN1WdXOzD0mHjhJkPYWW2ZNN6QOA3/VGVEDdM36Vmr
4yLFwTogXngNwuD4oApKuCv9jT5oaukbelCKz4XbA6/r4hRDMlOd2TQNM0NzOAwM
/+nQdNbye8z2To4pzPadrzGvQ4DHrNJ05Wc79FNVGS9wr2dZE++ZS2DVFYj3CUxT
r0OJHUr+jsoMFAXYTikfrGitwhA91/BfZkquDjukcJTz0FQT/KmPXfujl1r7yFo0
9R3ngiYeWLMR/l5ESlixROeVwFvQGQ7r4pNMAR/Pa2Nn7ALAS6NObwe206LKXyRQ
tYR7Y9knXYyn4SBqFTjvSpHRFywEIC57stnOnDm4nEhZsv3Jz+NT15u9JRXRs967
SbhM2qV5rO2eDnvdrhvjMIpQPXXq2cHBP3j1S9luah2nth4Eb+fgIWHdSEnZ3SzY
hQM6ljOdMQdOlKDaWeTFSNI9Nryhk3liKYvfbNi++Sirz1tKZeWvyOd4Wx03OvKc
fEZho6amqVsdUAaheUoZ/W33WOGaZ5uKG8BJIQDNxpTTHRCtUK/8xU40VPQPu+7L
JZgUVvIdcB+au+kwt/FHg2YtDy0vQChaGXga3+6ReHS4kbRXN+U0FM5lTKSOh1ev
RB7coTbQipXSbLOx8QKPaai/jmREqW82G90QQGy46SA6hfRrmbvuXx2QV91sPSDS
8KRZekWsCLFbRExQWDrg2/EJ1lWY8+twNSN6vJTaxSS8vFkvySPTElhaWGPdEGGY
o44JpTOuhHnSaOpT3OPXHEyJXdRv+FjYTcqwWvO5kLFpcKLQ6Hu8ZIS+cDRT/6O/
hYQtQp/A3w5UTsfJZBRfgYMIjlh1zaOwiEnvCcmmgmMGw/dtF1l2CYwtxiqNvp/W
7RH1zF7+18K5uxM19rx66gXsYsvV5T+u0bS9mj/X2VTb4fg0GV9232gDeWuehV42
TZ+lglZhwK67vOtDR1r+zqwrPRloXmY392k9DbpAS0i+Y8Ir1Z/DDbGbe+KKWO5v
B2yiw6Tdw1GbJsYMXyFUxr8h0XGK8g8FLIycM6S/7QMs9yvAKcgCSvxfafsc67It
IYANG89qT77ALbBxe5G3IU/LKEc/yKeCC59W0fGO1D0NLg982m4V8buVLPzxaDm8
KeJqzHS4jaqUhXWNxuXvVF7OmdbSuT+aUz8Iv7ngBUHXlufEXubZlehULaKpWHTH
4suGss8laVaYfBJumj28qYE8rMDqHYcXvovCH95sODnhiIAsPtj1flNXVy2VvkCH
yZyLseK61m75Wx+F4aviLC6DabUjbb4dgO9PluYJycbSm0a0ipHsCOIW1G4c79P5
8H+DXsRa9N6g6YhpXnQ42DQ7JXuxnDYRnNKXIg9phTT3PzU2siLYOr5t37Uuqk3b
8LhhD3DRKAl2L+EG3uOdgo4MEiWsrRWZEAY5vQppeI9GWbINqDiUXI4+NOFspfe/
ctoHD9Z4XVMpGu25PSJUWxQe1u6DL5agC+dW1urNlUxG7dJBy0CFO0WtNgjnsprk
MdBMzwUrjOA5joaXxh4tYeuFXnnaNlqVWVud/DMrzq/+2/7WYgM6I5Yr4tUjjdwI
epMSsL97e4G9xSop7ARxiBFEn3QnHWoMW1k/+Ac8XasxI6pIk3ABbIr6EeYDseVL
01frxSPtn4UC3gvMMuxd07ln8LmiVEtF40kODOcanp9kR7KJ3QYWdfNfwknMlhwb
XGKNOt5KnxO97KqEH+5pm6gJOegp07gfQWSe95fI5Vs6QxhmBSElyTxF/h4YvB9x
L5W5jPGoZzdDTE5/dXjHmURQsB+CZcWomYU5AKslBho0v6BbZzuq8VMiq+M6M9S1
ngQRNo+8BboR8XKuPK9Fjo+jowtHs1ZoiOVNwb7XDkfoGp9ogff89WGPEZtQ2aCH
qMEethqpui9qLi5LZFWW3PsGe7oF7ZmS3QsAqZNCG5PCN4V8w1kglG3RbYjWevzl
iK4++QcTv6CzXk1rsiJoF/XzK2sFKHGptOJG45rT869lPLAtZVnMw3k9nbYvc0d/
urgK/HBhXI/T6mW5cAr+yg7BDmBTM84vF01OxoT8DSGYU1KoVvZLgy6IjzSnBDjH
QqYgrU5LJxKb4yS+k0BWE4otEHTFlc2xPYR4q0E4cmNp6VNdqAgvbK+Xj+elRHPU
GwmV+UzyOEKUqgFzQ4RkdqhZMOFZo09T+WeLxrCyQQeAr+kyOPzAjMeRthkdMIPU
4w/N3noKnmsJeR2guM/aJgEf59peHXMqJBVlmf9aavcB3sXAZsSxyJubnC5a6gbM
w0uQZkroqDb349lXRYZQwU+9FNXrELM56Oj0YVTkpCBAggk6EQjpKUbufaYIDVAV
6dBI3WfYHSPPQgOI9GfCT8qIeDKccO+jQSteSPcpOeh3ZLK7a75riWd32mLXcQxs
bSc6Sv2VsgViZawQdCibfK4LuhHTjd3uwA0/1IH3Q5WNfJEH2o+tNOZD4/78pqvZ
pjZLPpnR6IVgvrYEHBKlm0wbC6WEkUkKz+Nml6EaaX8tXbumRPJbip3COFBlHKTy
2D3A+ChTFS3Lts7iNCw4AR1zvysRA0b/C0hvrHgqv3cj9s3lYX5CvOasNtlJqfNo
VnTi0RZlkxrYvlcqdD8XRFqLWGwpQMLNnmQbvsZcjxXZ6TRVljNpt4ahRCbRvmxj
NarXlB3n8niiRrJI93aKg1BS+9eUXhLRgpiy2I+0lz7LrixtYPbeszTP2TIgntpK
qkLS0xqKV1jlA+b5LlPar4unMTWoN7e0jI/xJQelcE9TugMaAozEydbyXzXEdz5b
fYPf8b9B4mdij0A5hNXlcYmWkOqGM7kR2jDiaOtqw+RMXVm5YvX3rcSFnKfBu9d7
0oGO+GQiOx6+lj2a5RRL3a93BrijkoeYjLgiR+0S6I6/fbvoeiBcxq/lvfOHuc/v
rhdVEv0hVdeMRMYLmkriuSRoD0cfIhrO9eBvOgWkb0s/s01OEVq11HkuGbCVxpOr
ELw0vbEZFpN3wRCCO2cfexYs21wvOyahPu6ilKmANcWf/ElmnCOVO4fJjzspg/QZ
5Ia3AfC1+V0857lkr8ZWLXRFdsS1qK6PsRVhZKlno2hBoasLl98I9GPLhKgzUG+/
lcqGLvnm8J7avEcDCrKcGgMjzr1bSxkFxzU8TYPWOI8irIUGdZ3bjNnVFtBnvQLO
JJbmHiF7bGkb28Gf0hULlWpLwalAlWqqtojf8iAODLHkhuUhGEWiP6vW2QQwtakM
VNp25MqrHSXFTPf4TQKKGcZIaJhzI2LrwZFNG35vEYCXzo1uZMVW0HWJ5HCg9LYr
pQ4UIOOUcslQzZ+XCRIO4oAcSd5DB2r5DdoM81ui/7MkbCDdJmlnEYjdFrw5TbBS
levN0NSoEooqQTMvc1PuTI6moRuFGvh2q04xJF+9i4NFuoN+kDUaeFEem5w3yAUC
dLBIog6wWNyj4O8+1JGxGYqGP0h1Po8xEdMByVG483+w+nP+ff+NjIgVxXzJ+jBt
OufA+vnu9apskAEXxV+5YDpzWocNgczR7+JYDznO7Txx6e6Ms/y7EplG4kGRmXeF
gcZAzVnjsUjnRLm0PHoMUXY4qjJ9JMdiH3auFmjZrLHOW5OEO9jII4fvXN8+/oZx
sHH8BYiKbW4SuxpEIaEGuK/B+WzVMnFy5x6jKsOv+KrKXP2gNJIIk4VA6k+hKWhV
8YPV6HVPBzQOdz2yyp6D8d9xm/wGQvYFXB0QMPdkEpbVoaX2e/Eu+Yx5NMI8niC2
vzheSnnqzuKayDaWdkImNmf3u/GalbRdiyGCAt9hfO5Cct+uXsBnipyN67+g0hhG
7Urmj9S5ceSml61ZR60bA4RfPTPdphWnK27l8DHt2oN40PtlMXmWxjzvQr/59th6
9KGszFTCPZGeRx3/01maeNFl25PCRLSjnX3+uTGFyHk3YvwqOB8W+DKhoY7TxuOP
DpQVtkJxuytPUHdyTpxrGAbMP+lmhyp+x8HOu4OOHr7TQjeYdsqYLcC5fPLMSqiU
amelos8viyzsnPKEFVfVu3BSriJ+u5nNTKtkE8rByMUXM6JdKBB9OH2QsMZZebQU
TeS7J8c7xaxG7+Cv0O2q0mkYzI26p2fgi6PkPkDlxeM6NQalxqY8TjuRAqnxQD3j
vV6tQIZdUfJQQMZgtrw7LJHej37IvzHirtC9pLcWGa11+2dKnm5e2r5bOF9ecZFU
oaIRb8SDZSnZdzMz999mRGdBV0FSVdT9gJJ6hSvfis97bVRUf5OjC7mvgt+Jaq1M
WOdanjCyHwatLs/lKiOn0uIEaRNNUUBPqJDRUWHetaTJ/tAiiE9E3wX7IZNnnpdU
omo4/29N/UY6BIUwdt69jUrlXA3CX2bj+bXL5ru+lfkm6XuzTqqgYrvej2B6Xs+V
u8uHQrhRicxrz5YtnthdvZelz+ONxYtXdA1PcmAPqW6FWEwNwt/2yUS3Nu4w5pjB
yzvxUfoNGMtU5MMDA/bg/9Hb/FcU80enFWaZN0nAPg/iwQ2sFxzsIQliX+SvGjgs
9T8OSM6MaciMJJzda9oYGsKQuWSithAD8VucqG7LDzs+bl7j0yVJPeNM4DDzB049
jznFHtQhDCjpC70f/UmOeWwi8xF/foXNe91QH7UTct2JGHol7cyBS1uEFvWLY+Rt
H5H30xZUnLUgRFbqs2x9wtxyUaYXTebetKyDn5Rq3Abz5jskv9wQTuxihHTikU/9
ywB9jDlHfGLMGdjxeBmO23F1Biop4O8RCmoIz7D9VkuwE9Y6RqrNZ0dpqTTyoMv4
ykpPxwT+pO++1FE+o1veNo83oFs4NDZ8m4xoAWuR+nuNy7JBWWb74XHHNUdUnz5q
jaZMHBNwoiEFO8fbX4RQdAwZO/K59eQbhwWetI73MMq0gAnOaJQhbJsdVn4NFgR2
lhovt6ILqIOq/1atp/5yYDw+BCID+JwKz/amalGS3mu14mG/lYSFvTONt4ecRMF2
zxtXdxOks43xXVdxAl2Cw5knYj2p9X8O1UzsJt4CUQ+NFnLZjSeQxMSz2LhWL56U
w0TcKfp99ES2Q7tLrpIuzjvXd1FKo/BLDBm6tcvKQKtpqhP/8XyhHU4dUZKZyhNI
vgpb4lhY/z7INkkkeiDzd/1A29tub00qjkocCRj8ReiVSjs1iKWn6mBvf9HgO/JX
6ELPwh2SU/zOB8/Bb3laBk91JLYKxVPm7pG6xP2ZjkIq82QR2Fiveh8UEfBxRaWq
hOTkMq8OoPJP5zzO3JooyHzL77Cx7hj2lwb6hSpOfLf4tXimVnQTgir4cXe/QRRQ
KsPYXQXy/zSuy66EETAFlN691o6Q3591JX/WvR4TD+hwDUk2lDEQU2NBXyaUYA8D
zljE1HiGkyESw9wKXk+qKzCveUOmfo48/AQSqF7Ak084N88TxoEqJdrY67hFHjuC
3Fw6yokLzriAoS5tk65wCxhmKdTcu0orM0bLqBnrjSH5A2MKZ7h161+kZB1AAdx7
MC68CTpQCwbIj9ABuayV9K7J23szqbLEB6mIozHXelHaPEkThpCDqODtY7sLhGhD
mMbMSDfSew9d4xZCyy6B04X+q4XGoesZHNqgQm9TuVVom+K/BuxSJuxB58yx/ZbZ
lFe4qNjDmMRkdHZ3MUhzBJrUdkRRKNONxa4ovHWBfcpopoTTnrCc7FDbBd2oq1GG
ASVG/YOdVx35XFD6V07EHePHfuzQNFcQ+whi0nuJXN+VVwHrtIafK9UbdFqTypDs
6G16IRbfiNmUPrgpb6Swlt5bClTyNORavSATdrQL2e0FdqTvY91USHTH8uT33tdz
tIvVAYGkqbgTe/6AdYviQ7wzsKViDB58Bynj9RYYFtn4zoqtS0Bx35oO2UR0Icgq
I8jlbPv863pQNTukQq55/AXwZcQeUGBlih41FPY32wRwqz5FVp2NU8VUMNaIUT6+
+L5fjwb+TkNg7Tj4VgW2LaxXVNIK95zgBe/DFOb4R/kqyu3aiiRPWD9OC0Kj7b1R
UXd5J/H7w7sCv3ZE5RRPNN8iXbJD+sSfZOKeF/xDd8auHfJ/BvcyWx5Ty5+mZRjb
UKDOwNUlCCoeyeNBxdNXHuz9b2rOarrBu0O9oqTK1ZwDURsWpWD+6rgLi1AwhrWX
haxXi79Z4zNhvjSk2cStw1/2gOqYQHbYeDJgYHDdGbDS77uEqb0ZC8kaiDyiBzlB
ij9mO5jP7lo5UPZlUkNr6DQczbuVWq2F3zeu417mPy2RCbqxeIN2m6FGgiCCGam/
NkcHNPDSzJOBCjJcDBerx7TaDuY3V7YKQG/3mLSQPvVihbdD0jF1kox3qBMfx1JT
mU8qsbtFZPt/H8FvNVsMzKeF9TBJ1cSiuvasV+7uGOw1/6niJ3+V6gMMry8MUcNR
aOhm4EBrNmW+v3wsDecx8GnjzsY6vTGlYcKp4v77VDPAmKv1rT5AAoyQEVvHYvbk
jWWA0BPZ7meGyK4ihLKQFpeknNntf7dEaXXf14ydlgyd70OynhduoXd4o1SGH92s
CmaGqYzueLDMEViRgCyCyF38QkU1uEfoftXPOmXWIOhg2iJ9zS2O4whn2YhvhYiU
iC/iKBFfadtuNw7e6MedoVyJ62QcZqW+8O11xoCcUgCZk5RgN7Lnlr88JYFx25Ee
T8PqULv7WhpSjcjlVPA7nlUHtBsltPboTn68eVScblvixm+tlVwiwr9fjgo9rIPv
jJbpDXwXQS5me1o21n67VmQU9FBYFpWpkbDoZyHWZBNpp77jXit/1ClLo9hJyaXY
ahZjIrg6JC49C1V9FB/FO7vIrQLP3e2zg20qC0EG8sez5VUXdBHaF3ioWHrLWhap
aaxijQRdi5jy2WEoYr2mLRkhzRRalamKgvVEWGEfymjolDFDRERLm8hFHSuFr3qb
PmUj741iG/grpWH45KXEefS96WazOmhriDuCgWqEGjIxjCNd8+h68Pslw2p8fZGp
YV+bsiMe1vWnPjIF1gZU552ILbvrze8oHNdkrwci6ojl4a4lajE6BUSb+WArf4fu
ampyqkwLxNobvvj7AkBjiWVbin56ipgcCqbRS31LNwKzmT+n7fzdp4Qa791OgeJH
IAzuTDtizhzgmR7pgIQ84kymDdSCJEwp6iidswbKTHyavB3u7IsHHoIi0jg6qjuS
Ph2q/ZKNaKtcZC3vJXhc8S2Wc6YeFyHrIgfLsv1NLFdNdK7w52gOxTuJnRTYxSRl
knDBFrrR7wdt1g1XCgowqsvKnphKm6hBfyuSLV0A+63zxuz81VzfGOHgTfP8Yy6U
poiqQpilItzjkBVAEb/qvSc/x0cuR6CNDpek6EmB7JHBuAKTNhsEK2dbX5HmGkmd
XskSyn0igCVk3RXi7A8B7egQBf33Xz1F7Rnvs9OAMaanarGl9Y0MVYMnZB8Xyw3n
QSMqh4Dwr7ER3s1yDqZZAk4ciPLucUVfHQX2SGLv2wGDwqt7wFMxCZtOz5HjM7B6
W+rx3qOXQZyH37W73gv+Pxa0iZ3No7Zex2oR5WBKdtyLAXdu2MCXHM3PhBtbWPQm
FQX5KLmN8+6M+kscbXfr9Cs7yQZ0OiEgQ4cCtnj4gwbVOtWuOR0wOfiqrCBYdAJE
7+V861MWKB1MZdX0WH9qvcP/ofAMfDwTOulUtbUs1oTMlXc7QwmgNj6vLDrCvlC9
/iNofbsyZQ0rUc6taZvPDzOxTdv0SfdFE+8DYGWVIkikIrSIYsYCtqjFsjQc2ix/
SBDfuEVKzhMtv+feZ+ymW0czr78r3/FtH2l8XYufFVyyZBui1GE734ZP687VcMPU
isQJvsWqnba5MxyuesfFGxSa/lROvh1YPQ5SJSJ6X78fd/3A/LpOC6StXtWfYdZ8
0d54j9jKpu3voMkMyBVVWyhagIsjy5mA+zPQdjlywcCag6m3+gozho2YfaGOZ7bO
VNaZVn1DRf/3z/ToIcIbyDnCUK68mO6cooyP1urw5iITq9VUg4JPFoeSbrWqLfQE
hTAPRXsgFb5B/JiqsyeBUeAV6fTwlhPCoAXPQmKTEzXONB+aA7EdlUCpDm8sWUij
hLmVn4ShMxhzUVb++Fztwmoj1ZjSJhQsLBx3ga72qRV0EEnXWhEDDZbStwydLhF+
nfhfpOHh7Evas5oK/f1MLyULJalJJ+I1FyK5BKyO8r3XXfBeXwZ6cIc0FnqLmPTT
HN88XSs6sBNaK3IjW6DIlc6Og/qemP1NnYI3lzoQjUxCB+O98h9KHqm7y3HWRZkw
tHE0GRFiAj8aFcWZWZBM/FvpJmZcJ7lxRcVcVLHQRDrm4cCHL4hO0T/gT10zXcx5
PjLzWyEWKscLluz38+WrcSsVw48QHyRHcdajwZvo8m3Z92bNTe+tNwAzuPxWehsf
KcZTxe9JHzRTBI/oG23I8U/iYqkiS97jv36c6Q8tY0l7RNR0Yh4z9VUIamhLZZgV
Wk/4T1s9kLtKVGdcijDPRMVeXQGvqz1B5O2TI4oR4jNgta0OYnzZuDVObZGks1rg
dC9fDd4zIyQeOpiky2zz0Sj16duLL6bXS6JGhaVNJkGp4B5Uj3QDdZVFwubWzdwg
cCkY0R1wIfJGD6N2NKrIEw+aWv5Cym3g8tfo9KqRuAYX1FQne6xKyL3nE7b4ZH4a
wtC3BdhjlUmhszszQs0IUU9apCKJ8ETTSwphh1ebaT/PHg0SUDvgQp13rKloX5rT
LezyyMBAFsaUwdm1cQkd56FQEXMhIsz3iGnq2nOnR/xc5AljOM0/tXn0emDA8al6
WtpXMuGmecmhfuC9OoY/dS8DoetK1peeEUnN12U167k9ZpcVumq+GHbb/h78hxiK
FcdYA6veFrLY9OEBIUmZOzx1Owuh45hiBdcm+yMAfoF1d/VzBEpjLS6dQar/oLNE
ghO3oHCFBL6SttG4MOqrQipEXE0qILHkTxp20NzcEvQiUpliP5nubSrPQ6nJKpi/
NvZnE2/gC/s9e0VOsqiGY1GNjKyKNxbEAajOgrHrSjxUiPs5riYoH02UnnpbFhFe
5Y6QMLyMQ4wKTc2oUJ/IBkIsTkPpbZJdhtAM84YI9B/oQ+MMvF2+OfKxSa4Elz0v
88ZnjvY8cVKoRvzVgJuJMdwqWLbLtHnij2gNG9mE1F5ZH8XYEUKnO0LtOWNnfnQE
j/Cg7bjzlVQ1i9jn8GrutzG9o6kBYF3zZH2QIS8mSpM9OPN8kn22oKtgsna7pJNS
HyrPeA5tW8Xn3hXu78tJdLLfnkEt8Doaj9EB6mbSpIjx6y17z8aLawqDi5xjBaCi
P5MyYurPVB8Q2wTgVpv/Fwyi2Ys/IYd5QO9GTkdVuGvEvGuC+yMNnLPz8RM6/15u
cQs8wdvkR+8KAHUG+OrQp0nvakbNGEYsVcag4WCMAa47XJ94Fg9jak090A9pBjFD
MgqDD7ADWE1gFunLy+f3HaI4pRg4/+fZJ19yULxejZCrh917tDnfT/DRPxmP8J/G
SFefDP54USoDDRaALhG3B5jk9CHaiAhCAXSa1MbUeRTbLeCAiuQocgN2Btq60d4T
A7IkktyU+ze7JYtjd6XIOmjxzAqKNBzaTSq2O9vBLk/esdVeQBQunszuH0+fCK/V
sfTa8yMN3yZW+cI66kjyFJmJArqbTDjXDE6gy5qW2k4OrxreGHUj8mhSt5ODDKyB
4Jm+Cm/iNVQ7pESvmQ9nhsRXfp7UxzN2sL5JqzN/vGjclY+4bxX+Q269gQ8ehPBT
9Wfz/K1kqKMSbTwjRRv3Y68tdtby0ir17B6FeITytsRwL1sc+Sgej+FEDfGvV0jZ
Nx8InjankuWl468YF1nieAZcuvifIjmTL5Izamb6kWpNEb1paD5f7Mi9JZ14vYpA
RUEKwoQ3JjPtHLZmSeIuYk8mTvJeA+29mv/teQkUHBJwyKZqMGWqoiJ0MXoOg8HU
gYvfLDEam5xGANNmjx479nhkuFdqGPfJCCkmXhkv4AUelBUjiSC2OgE/ED7JGpgc
RDoC3Mb6DR2axWVAZT90fBpbEvVk24zrVYtkYGGdDThB4CAqZ+OgfgCLj++bM+mI
Kkxo4NRNdcBbtkqWf7IeDnXIAjzhWSoQrcJrPdm1iqVpQdtvdQOjWGPWtdSBHrEQ
Nxz1/aycnHtkieGhjQYS7nBYaVE7WKqWRsoFWtwA5qF9Aus8xwIiX7aqlrT7//7m
nxwmLAJb8UPm7EbDAPFP2x5LRi8p2T1AkitBzGFvZpD39hbtjQESO9mQjz101s/u
ERGJ0aZWBB43EJRjH0PT5C8pb0c0mf31/9vz+wwWJ626ONRy7hdbVGyxD7fysIkd
fEbZyBArEucMjm87mnhYdQXKXQ9gVKGO2dqbP1P9aDycfIHH10QWIZUaT1EbKpAc
cTysMjmHqYnNxbFwZxCtMca/MwQDG2MDnI+Etn76oVYItkh+ZI4BrnDwGClfH4IQ
Me3kSJLLezXbkChMYdDq7aynhe5i06XV/oCLC67ISIh2V4UQX1DAcpu883uGTyL0
yOnDvCWg8OHcHHRWq6SbGof5FfEXaXBr5rF/ib3IIM4gc+Etfrgg1cGywfjcN04J
T+KWw1mKbPKjnbY5J5BYyiGmkW4VVsJlJ9DscwVKLOTuz6cR+czpgC5/KXc49nMg
EJeN67eoZrKcPoh7h3MPjU/LM3Sqnz6O873mRrc+niTRy462TeYbFW/6/m42sziJ
vaEvrPqCdwiAM1vIzTA9R2FVhPRDFEgHs0uIkZg1W2u7lHdYALN8gM36dQiowyuQ
6vPGDuG8jIWpCar5sFqV2AtAUKKekMIDmikP5octnGjaUUeKJvVHQlfRYc4CLFos
Oy53tBzEx4gvCayBXLNBzlIod2Y0kuauuXnZCXS9/cLfh2M9y1r//+KxfPBSjxRU
WlzWUpc1K8Jwo2AvKR/NOJqvssKIRRxjbSJH7z3YB6wm6MJaIBXCTxmcrGzLGWtq
QILfjzzklT1ml4Ppl4qBgdZxPZDqFUfoLD3qcSyf2KS5ZATm6TAIW31bDcjCc6XG
IcyyRhyXNGGtP1TcseARu83204DZzVeK6dQHxF6uky5RtSuuQtynYRemnmKMn0sW
KQwFW/d4yihB1+PqeyyqYDL9aZ1trOb3ZgpwBjtb1GqtHPJhwVE8u0hGQzpbRVw+
dEVc8PCTNFghRT8mXAK8iSMim09k9shx+Deeu+PjshFkaZqWTQh5KkwNmnK5qG9j
HGAU6kJp8x4WN+b+ExahASCjRWqFAgSAFvLYREi2+Byr39V5u7B1FcHDL+GpxHTo
/jpO+2YS3QuPmXcZyDqy0tMs6GgNz/atR1I9nSKtEA/mK5wW39FxFHplpIg8KPPY
lVhzv21QHeWPmCv53MxyWXbpWPpBGvYT7kF8uhSsbwfR94OiVfTbjd95dMZhAyiv
8Nl7M1dq2pyrCWdjtMG7gI+5mmPoFxpyg9r+ti3rB1z7qGAfqQ/p8ECzVpT08NEd
vapwBeDvavkYwapFsHXMhYE0/kSShgLpJm9KijCgpz0SceTPvnudlSMCxlgb4ahz
pNCqgOEjd0+hIUl1tsUh6sxF27OW0OgGxBMHPf7sHY+k4KrQTw1oQ80cfqTkikSF
a1bAEfnfw5pXE9XvRYqIYv47tiepHVaHHDNwYfKr+SDRa4hLryMoxp+veWtloUKE
Xjssdz/KieBapFg506AmBg7eyT2DsTC72WmA4AxyTdbOKJMfwwLvMo+YQ1iNK2Gw
ZO6KWtC3gLuQ6T/wQYF/YOmn/PZ1bD595p1aYl3+MFMUMTkqwxzBd+X2/jjUzezr
cAs+DeLuo1xpY/ztV/864/oA4u9G9OXFaWXQ1c+Dp9ih+FZXui8AuNvLDFMK2RZd
1UiD5gnVBY/lBo8a7V6+zOmHXBymcW/LE2ObK0xIAvMvT1wUxRzwIqfIJitvQXYj
ipMUjcS7RZvhVcveJZbVumje38oO7LcA+hz14psfq2eXhYRJM13VwTa57GtyIYRz
Emo8v3IsEBboh2hsgwyA2eG1iqoqnsoYX+sdxvgxrq57EpS+F2AiGLv7YLFL4Hrl
uD7ikuprmb6t+6Bi3ctx19THd+FM78rMQhFbklwA4PgGjGKncVdh07s8MFhz/DZn
g44EpvMqws8jDxlWYb9wSaIfIQpiTlEBihAjmwswpIu2DwXtNtLpROwDN0NdU5hO
YvU4vFYrvJA+pcCXVMkp9FdblqHXt+BdIsN/9SjncHKnHElggejEZaNRvbiSZ1Dr
tBtxC5+Ajmi2MSddTZGc2FXmn/oDD0MdZkU2+JqCbAE+BBSehGAwZchyTreeCbam
PMHIXOpOMsXmcCQADDxb1ih7Zm6ySmNQXnrkJxu5aVfvcvoa1N5pNCzUmNH2d7ck
aPMde+cYOKmlnWooYeetAFR3STdU4wleS7XDa7C88fC3OXLQSYKjXKH7uERORKqf
XL4roVdWIv6h3k4f3byeQABNvsDYQo05kATC96nFnzyVhPCJaZECHx45bvpXSGsb
fqmdIrBuK3HiRypL7xo7rmIoVi3Nz+mpq4aMl9yKPik9AjRdg7B7kFiAVpXJJ11a
C6N1ClPbHEIEXfXtjNqZlvu0sy47rQa31hOeDMTZJefcPX3epcKAGCpqse3i6nsv
V4AbAe07anvAu7S9ZkNWcwnYgCfq1QKMmSfkZi3EkU0caY4i5SBoslmNIaDGi7D4
59qWceAexTAgq+INwvALyDYkhJDrnhMNc74s3Fr8EQLTXDgNAwqdpxhbuXUzBZJW
Mr0ZYakuwKaTudU4yOIQIEN8DVypAhhtfM0NLcqvT7uyA9sYA8LyjYHnU/Ig8mOV
a3xmV8DW/NZajYpX7HoDxg3hWIfn/RQPJZppIU0lgHpJjHND2dobbz/7fIOM3hs5
OajGo+oYkRb1Ny0WsqWyX7jI/jeLjm8td8QQXIzRri6kelC+yFzz8feonAL/Ax8r
x6cV+9Ewe7nT67MaiyJCNmbnWwYPekg7PUC7fINkLAM/WBL/czGJfguxbq1B8YlS
6E41AAcNDXyiGl7uI1Z7be6IYPq/5ifhyxzDVmGRt3m+AysniBWy1LMOKvM2wpL+
WDRr24G9b9SiGtjK7dJZd9O5Lz5y08Qn3/UKKk7CphWlEuzfB3rKfsyEnYFYDepr
gCyDm/aIvleaVC1TskCjbQBJ4vF04f4oQsdF5GDBeFnv86pUV6bDKg7eao+RxthK
TVPhbjZGkHlrjhBus5kzWfWHPrBNzZlTS/yGJ/6bU5eRW5AyhkJtTGwHaUvMKKUO
bd27gofI27M5IMTTxP+5bTCEK++z7pVJkq/atjmao4oikLtvRFLQaJWB4+ZDc6XQ
WYgZaL+TscdjZygPl6T+jJ4GSfskXMRXK5cV5Nvb/BeLCSW+HM6ee8FXcxV3C8fp
vhHSHsz1ePkXLyFtRV/FpLK4Z07d/ymi1QgH/KO3WO3TqDxZzuTn7qYtRMlamZW6
vCpJvr+BhYp0fq3+V6UgjNm0Cy/hsMXCiAIclidU7+MD85xCVXSNuZRAj1FPeJlk
E/PU/hdVgaMOm8LwlwIuqyv2HnLDnPndOvnfhOLLjO6iy/+rNnuatQd8QOTxUOZn
3gRcv31PA5RlTbWTZrNn5/ZXrSf9cixvWPBZqD186VisaFCkLUp22pGaFHFqQpwl
3TjM6ilBDbb0TqxG635kSIDXfZ6RZYTkVlGmUj5qxWqIChYC3mG1PKFV9pHy5qUi
IV9pwKJxXmUC2JfqPbWRROPTUC70Q1grjwigb1zzHsp+7CX5Vw8uekK+/EqKxwkz
85D/SehtZyNoUsMq7AqD616ON5XlE4XiR5VTCu0DcvnEJvaeg2lPtdTm2L9fVenS
OtbuSI3z8szSsZkufyC+25huphiLAHwKmll+yY7bB/lRxbAXPOdfR+mLkmq0EC9p
sRMKgdJ2ir0EVz0XZRHfUFNe5vYnIYxJF8eDZowz31FGhL+6QFV6ghzDmzo1Hknu
V9XrKeVhcFRBFVj13aqSAQo0IMuVa6Dl33mTLzTrQmajlO9ayHfMcZjTaV6HkoHh
qhcVxkNN9RGGevErWzmItAmj6JsvQ+KxCXm6PLShmnKFK4J1nmIcAg9etG8SEuGe
y6KzQHzdbd64VhWvR9zGAkDB3vkhGm2YmC/cZ40cYNl5DX6YfIHIjTUjH5LpIgFs
q3T5jnVvQ1LKYoQ3vv06a0FcIbAWOHwK9c0JDhLehoJaXFmCdNWVo13gLpbPaxab
Kp7ML75hv0CiKUzjoWFePPQvfudugm3gnphXda/nWCgqzSxajC7v35fNAt5Qjnu3
X4B3uT2dK46M2cEy1ZHQy0nCE839lxBokg3dWIcSpq7loV9Igf3Oxx4ejxwSwgIG
uPZrXjFN4982j9ns2hyvWxWotzcN7ebfue4h3RI41lGOtvQzN1ZULxTj7qp9QD0P
ypPcuChoh0nBXEXSbffdJ6j9TUQzersUTpP3da6A3wjYl49SpGWAGS/O8JW2dlin
/ET7UrWBeUaPX74Er5FjwGlKyFv7GLxTWC4wYM5fLG3lA1YWqWD94v09Ye7TPrZF
dF/a+h+eQyp4gwf8mHPoXSbMuVd19+btocJAfVxuXC6UvQ30KMmUQGvO7yB7UQRz
8VmZ8j84k1rrgSteFMZ21WDpRIpOVxF9PWlU8ciNTPdknPwEl5AJzgkXUU0xS8RL
uaIcugovJpqvSur+Y8ENVepo9aZTAgK8Ti7ufI1L2LcMHJjdnZYIfcPr/ELKw3HL
8mrgEsfQjT4CBj1wDGPKk6CaV9TwFY+PUWCRYte7nZX9Z6fGmFLWdOvHm8LidCmc
qh/QYED5/F7Cp7JhR2NHrDw2f0oLlTT3Lsoegu6WKajNpuzhTYMdkRwzjyUCIg2d
XtoCl1OYfwL7L3g//ptUViNzI2SvCgZXGLJD8FLKTauP52WUOuUXcUOtn8qcotKL
37LkWnWOnhfHbkddWyCbdbvxVHAqflDkpFXrWDkjI+R8Pu4YwG97cVtlfaQGrf0X
+0EYFFdlt7BTXiagfKJsxt0UzcTD1/zO+yR4GtI3+iTNWXDptW+qCiSc+TW1jTkW
2K8BiefKmL8VwNFbvQG2eta78/2+a+lUfrLth7WyfRGY0yUVPEUOOzMKERt+NYqf
7wUGMDPtQLjtFhnszufCms8ou9RBxkVONupQ8Z5nxgpeLzB+R4JSSw6md8hODaCm
vF4rncEiRtvIngDfGRRhhQnro1oTEwAO5NS1m5nb0KEl+rnlh7HKzcqndIlRHf/E
JFXPfdEXNR+ZGaaIl1VtRaYB8peJn6fTrvDSlA6dDInqdDgWeYmq0kMaVB8HPbvc
eeBg105imqMKBrAv2mPfnAfwjou1DesnyKYh6KBfH36cZzbVdwOfGlsv0s3qTQFd
9lpjRksmPcE+uafgKujBT1UW3hV1lmLD/nJA1oADksaju9QQP+bdObw+kEFw1c+A
esbH+jzhE4HvbWmIjN10q9pzoqXzIsJe51n6cmBRM112Tf8UZ565h3Q0/bp4KVyx
0ZBHPzvaqW6PiifBIfAr59FzKegHNg6qhSB8X1TFUPKHvfJWd+RxaGEfLYz1AXBI
ap4wuTHjEGnrCsXRbEIudERt8TW8RkhOgxUXHNo4eHi4t88IPLLFEuxpNLNTa8TO
qj7NhFkRxpuIzN504+KejMozK1n50vZAg8py56OyPK3keUXU88HvbfhKAe3Y8H8A
XQvxVJueVFdkj++jW9ZnEkBLaDfdx8K4fVo19w30QPtVpvqj2HvkZDOrwdgLncyL
746YQ7sTiYM4qCLt2dqZrAo4HcKsyf3ORko8l4fuKlGVurh8I3Mw9O0Ga+v4XGNh
AOKcVI5uJxjM18SCxOqkEh+7IdKcnCJ9TUUZISETCHMwNinh3ZVMJb2j8+nFeDhj
K3d1wNRdM6R1HV69mbt383leDUwNIoHN4I5c37r89U6tKzr6g21BYuJVXZiA5RZO
pJo4tqw9DbfPM3iicI2uR4vP7u7eB7sKlPflI9TipHwBCJHJ+li8XoR1NRtKGsGc
eMbv1zaYlSDs8Y94AbDS4HXiWLC24t+aV8lNqbe0ZXkFZl31Fg1vSe4ss4+Am3VI
yen8utcSOilD8GRI3MMHMyhMRQtdYpAD0wkX5a3HygMoQvnMFJVAs1v01rMidryY
B9h214YdqkkW/2I4okHnP6JicNKlpGjWMKMdh1UoQwTMVI1HHOq4pZu9fVpD5JHZ
/BUCmu/rabGNFAnyq0IyWn3mWhW9ONBFfMtoYGrpaOlL1PLtj8RSl1MJbda86gNz
2+PiWRruAA+krhYFulJPrt+5Dt5Ba8amOwq7vcwRsneI/WDAHQeQFFPbR5NMj/if
JMJ+Lyzw1ZOVuwnbJnCFVlHFfjMG4D6/kfZT4G/5TI/G2rMlYtvJl3DuIDtsaU31
PoE6bziyHRbYXky6ikS5WWUvLAKbsDXyNu4vIyXHv9NYFMi+O7yMatFLDGViQy+t
6zUTFhlglvmSWuA78WQaFfEF74ZibOvFMPLGvMDhwPUZCnsrv46US+NJ1L9FuBDj
dx/ovjb14ObWJk2DnpvIOya4n+D8F66ts+I1eAWrUBwkWtnU/27Ti2eZ/QE2biPv
1tphO0EFoUeaxb4YkUGEvM3/t3t93M+nRpuc728FNyQcopudd+bYLFsd6kVpXz5q
X9XugD9bbqsZjcJPXo+vQC3Y0n6TczwvzlzQuuXlNiQm4vlKe8huAOtEja0xp5xK
byR8IJk98RuQHAqeo4CJpg==
//pragma protect end_data_block
//pragma protect digest_block
D6IyRN7mC1/I0zv1gk36D/OaHa0=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_MEM_SV
