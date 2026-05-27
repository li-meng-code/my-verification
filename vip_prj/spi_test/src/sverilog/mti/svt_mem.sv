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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
YEnJxC5OG6QsyH2HVv8KvRkRTu12QdyXfEpbOlO03xhBtXsMgFs9P7n1kddyyhTW
YEZUBR3yHxdfnV2v2y2KPecwtanUgBEHHodBbOCSIuLxRqpG47syDG21pUCqEQ4Z
T8/d3JWBLpA4EhCM1BS6SYM/hopTygr7VB1kkWsKdtM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1173      )
+F3d2p0LEP8EqsGUtERQhma98Jz10ptQ9XpAfa3fwzTMfnl/2ypo1nn48rc3D0MD
dRuvXYx4uNX4vjZqf6oOxBye8fo+v3q2gwI++MLyBuDEu2UF946Bnz6BxrSTSNPP
aHI10yQig6EBsyiqH4cTYTqoz7fpJlxHJA9SaKKwiwBqQCPVHc9H4CpNIkyX0xBt
MOn5SX6F7XwoYUyONaMyqpZrCEH6A8uTEQKscUw7/8sKvuf1r7Gbu8olYRiIIqrs
vGqAD5QPuwAaC37ENQhkHyM4IF1wEZ3Jy1HEdDgnelqh7O5L7xSDe4RMdNzNfdvc
laoDe3FVXun2qoUEKIhDkoK96isPV98qYUenPn851nM/FfUB2X9IncvjY+GEN+qf
Zi1eLN0nIlx9F2Qv7qinZD7PmhNuba/r+/uJ1+zZ1ig2S1D/PfY7j4oZKAckNVAf
Sq9sI8Y2Efs+ePzjC4BGk5n7yolkHkkSuNw7kHzGElrj6scUQP+oE/Ky3sUTv2gA
R2ogW562IRwYgHnitAjX8svxleT2l6DWS6ozoYHLcGLfsPWCxZktLhU++L17AlJl
bPAOUVqirzdMujzbhV+C0JC36SNZZZugjfK8uTJrthlmlGZ+Ln2m/y8+rq+poNsR
4pUxMtdMT1SS1FvBql2FDJfS7cneZe4V+qGwwXB+gS8WlTGcewzCBo6/MafMSqxR
zInoteXfOoT1BM2TFZjQ1+u3lnZll3nH773HkjQLvUHjDLQDVi63+THRbl0Zg6n7
+xHnfKrHLY79TCLw7LRYeOTjlBmO5d635whrPBbRoOvmm3MUnCUzyu0hjtQVB4nk
1OXFiUNMCvaGaPN0HEL7rmoMvnOzfjQE+VpCpBvnu9d09ExSOQjNUk8LMyMINb/g
cWTqSxXl0vMfm+V3fL/YnVd9IY7/fcX7KJJf/0t8+qjM/nKpjF7fIxqwoXRGzuW1
r1K2XCRRSlv5mljVYg/onieilQTC0Kg0tWUi01O6tZrPsAJPsiwFGko+83kTxvRg
YhMj4xxXrqL8KRfTx/KTcxrdB4jg7DvEbNJeqm3SeaZp7ttZRGkkqEDASEsc3wjR
L2QqMTksCkj81Go9YGJYkT74HdHAUZc0vAvE/Ef53dYMqr2b4cOkXWKtEkeDtjJ7
e6RIqtiTjaHpNqidqpRyAM+AZr4eAOJCbZkV3tPLSeheNR1yzfRavrz8cdPfEsJg
VTVEI7Y2jRqmVkoByMuPPgEy+bXRcXwzmaW3Q7wV1CYMt34Jy2A+Pa1pOo5+ywDB
nQrpwyddxLXi8QLyBNrS97NMk66vVH7g/AP/ut09/wyjvxSCaDpxfCsvI6shKDMg
WO7qqZIQfr/fgT0VNb0JGyLVmvgOp2LDoU0VCGB723RJndWRVdVHcw7s5toEt537
SvI5NgBd/Fw5xA49mQ7wRkDRU/sRCn+IKFpamL5+yWgCUsTkUxDkJmeU8hf24p8F
0yh69NZGPKHyvWshr8ylPAJfzRmP4tpnR9l9MX5pKBn0VbZgDjcBztA0Pl+TYh1p
wqwxmQsx+LAyog9buSQU47tEJ5yYSIJTod+IXtWZ2zI=
`pragma protect end_protected

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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
AflAjLLFqsgaVh9CU+OCA/UdY6GEQF03kVhbjZu+r0TR8tYjrqv9nQtg11xms+wx
+3mNyqWrshH+kB7EqLLuNGaPm3x2WIUTegWykxjmVnEeixAOfB2inkVOpsgLaOeU
YjV4/mTCqv7IaTZx67p8cBhwodntFd0FJQwMBUjH6P4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1815      )
3hlW0kI6h/W2BC/GYkgcfeuQBF9iQrF+vDdb3rin31JgPE+j+ih6H77LlagpfiKb
fop/f9ukiiSDnaU2p9p3tQk0jURbZYjBD5PM20Jza3GZM/4PkFuPMddh28mCu4j9
0oSjqZlHex8HEnLEqswApECmUJxWgs48v8a7JK/6Ege8DOe7jp/kEoPlxazz41lZ
71E113usb+FlJbVXkFCzYKzpESqWIyS/9jZw/2lVDJFvwljbNRSdPuzlPgSdby9Y
HdBck2GlKDhGUfGDvkNrcIvTxeNK3eXRJqAnBdHi/6zzyS0Jm8GSUGyfPzP0SowW
JVEmBSs3nEJ6reBi3vUVaFTO05dvGOES2qRzk8MH2bniR8OizVs4OEy2vLdgzMsO
5TgrBQge8ZNbu57lS9Sw/M2lqAaQ92848Z7pJyGrYTy21BvUpoytdZhQ130ii4Dk
gdpSeb/d6j2KLkFjVQz/FKVZYA231iXAwezjWeTb2pOjHcHW5ukLldVr9uoZIEYC
8dQZuflaDqQ7JkVTPbj/6YUwBguHqeRxtUikJLo2QLMvTy3N5EK6Moq42UNgZ66M
QykLKlt6AmJ3ILiDhWXq3jjdfoH0UBOfkb+e2KSfXSZdnPrcdBYEoHaQNG7hY8Xk
HOrVl+z1IL1JtMN5137cS32bEKZpR5qWj2Z9igbr1S+oJO5T2cRkM/Ee1QqcDldN
j6g6LVKEAk1658aapkJtfSzqZXk7BjIt1v/XweEE6pdyy4UKQsRhpZPqU6OCEBwW
LfFEvIfIW57czIL7A68n6LfGE3a6/FxT6DzxVdkS/0JeFYwvqsiuFLQi3fg0R3l4
1q7J7XXs66WoR8ctNm2njnfWUP9rDivkwoV7wFpdhWE=
`pragma protect end_protected

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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
DzyBap2iHpc6Y28Dyv73gEJhfUG1+eudDTUzogv6iMt/VrqNe6Ol8N00hTyV/3d6
e2qXrRTlB25QdvNobabZfXGPrKXGbGRJCYr2EX1QRkz+itzoq/AXbKpuvuL6VGb9
QcsKuJ1/ZBSyLWMtfDBfSlXqi1UhfctQ7O6wnrW4mG8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 31666     )
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
`pragma protect end_protected

`endif // GUARD_SVT_MEM_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
DpQt4+JXv1paqPAruH7Yv9g83aP1l6Uf9UBoauEWl/MevHzzZUo9EwbOHFdJUUnd
w9IdmiIKETCLGy6MErhCx19bKwYaXyjIageWcU6w91zQNyE6kdBufChHhT6n0cfw
LGX/g04bcynHCWzaqXl8T4t7NipftLyXd5E9RUAS17w=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 31749     )
wlxxrW02bqmovT8Fqch29lZ+iiBpSl/CuD3KZC176GSC9DBvqs4VJgWdGNux4bDl
SpVZbcNsFGDhJ/aVs/GcPjaey7Sh9OB1iIERgjcQJb0i4LtC/FHCMnvxBw7ZlofV
`pragma protect end_protected
