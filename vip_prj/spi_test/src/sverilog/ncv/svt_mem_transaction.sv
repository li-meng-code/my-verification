//=======================================================================
// COPYRIGHT (C) 2012-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_MEM_TRANSACTION_SV
`define GUARD_SVT_MEM_TRANSACTION_SV

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_mem_sa_defs)

// =============================================================================
/**
 * This memory access transaction class is used as the request and response type
 * between a memory driver and a memory sequencer.
 */
class svt_mem_transaction extends `SVT_TRANSACTION_TYPE;

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /** Randomizable variables */
  // ---------------------------------------------------------------------------

  /**
   * Indicates if the memory transaction is a READ or WRITE operation.
   * When set, indicates a READ operation.
   */
  rand bit is_read;

  /**
   * The base address of the memory burst operation,
   * using byte-level granularity.
   * How that base address is interpreted for the remainder of the data burst
   * depends on the component or transactor fulfilling the transaction.
   */
  rand svt_mem_addr_t addr;
 
  /**
   * Burst of data to be written or that has been read.
   * The length of the array specifies the length of the burst.
   * The bits that are valid in each array element is indicated
   * by the corresponding element in the 'valid' array
   */
  rand svt_mem_data_t data[];

  /**
   * Indicates which bits in corresponding 'data' array element are valid.
   * The size of this array must be either 0 or equal to the size of the 'data' array.
   * A size of 0 implies all data bits are valid. Defaults to size == 0.
   */
  rand svt_mem_data_t valid[];

  /**
   * Values representing the base physical address for the transaction.  These values
   * must be assigned in order to enable recording of the physical address.
   *
   * Actual production of physical addresses for communication with the memory
   * are done through the get_phys_addr() method.
   */
  int unsigned phys_addr [`SVT_MEM_SA_CORE_PHYSICAL_DIMENSIONS_MAX];

  // ****************************************************************************
  // Constraints
  // ****************************************************************************
   
  constraint mem_transaction_valid_ranges {
    data.size() == valid.size();
  }
   
  constraint reasonable_data_size {
    data.size() <= `SVT_MEM_MAX_DATA_SIZE;
    data.size() > 0;
  }
   
  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
`ifndef __SVDOC__
  `svt_vmm_data_new(svt_mem_transaction)
`endif
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transaction instance, passing the appropriate argument
   * values to the <b>vmm_data</b> parent class.
   *
   * @param log Sets the log file that is used for status output.
   *
   * @param suite_name A String that identifies the product suite to which the
   * transaction object belongs.
   */
  extern function new(vmm_log log = null, string suite_name="");
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transaction instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name of the transaction
   * 
   * @param suite_name A String that identifies the product suite to which the
   * transaction object belongs.
   */
  extern function new(string name = "svt_mem_transaction", string suite_name="");
`endif // !`ifdef SVT_VMM_TECHNOLOGY

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************

  `svt_data_member_begin(svt_mem_transaction)
  `svt_data_member_end(svt_mem_transaction)

  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   */
  extern virtual function int reasonable_constraint_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Returns the class name for the object used for logging.
   */
  extern function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_mem_transaction.
   */
  extern virtual function vmm_data do_allocate();

  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to. Differences are placed in diff. Only
   * supported kind values are -1 and `SVT_DATA_TYPE::COMPLETE. If protocol
   * defines physical representation for transaction then -1 does RELEVANT
   * compare. If not, -1 does COMPLETE (i.e., all fields checked) compare.
   * `SVT_DATA_TYPE::COMPLETE always results in COMPLETE compare.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.

   * The basic comparison function is implemented as follows:
   * For a given bit position, 
   *     If both sides have the corresponding valid bit set, the corresponding data bits are compared
   *     If both sides exist and only one side has valid bit set, it is considered a mismatch
   *     If both sides exist and no side has the valid bit set, it is considered a match
   *     If only one side exists, and if the valid bit is set, it is considered a mismatch
   *     If only one side exists, and if the valid bit is not set, it is considered a match
   */
  extern virtual function bit do_compare(vmm_data to, output string diff, input int kind = -1);
`else // !`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with rhs..
   *
   * @param rhs Object to be compared against.
   * @param comparer TBD
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
`endif // !`ifdef SVT_VMM_TECHNOLOGY
   

  //----------------------------------------------------------------------------
  /**
   * Checks to see that the data field values are valid, focusing mainly on checking/enforcing
   * valid_ranges constraint. Only supported kind values are -1 and `SVT_DATA_TYPE::COMPLETE.
   * If protocol defines physical representation for transaction then -1 does RELEVANT
   * is_valid. If not, -1 does COMPLETE (i.e., all fields checked) is_valid.
   * `SVT_DATA_TYPE::COMPLETE always results in COMPLETE is_valid.
   */
  extern function bit do_is_valid(bit silent = 1, int kind = RELEVANT);


`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation. If protocol
   * defines physical representation for transaction then -1 kind does RELEVANT
   * byte_size calculation. If not, -1 kind results in an error.
   * `SVT_DATA_TYPE::COMPLETE always results in COMPLETE byte_size calculation.
   */
  extern virtual function int unsigned byte_size(int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset. If protocol
   * defines physical representation for transaction then -1 kind does RELEVANT
   * byte_pack. If not, -1 kind results in an error. `SVT_DATA_TYPE::COMPLETE
   * always results in COMPLETE byte_pack.
   *
   * @param bytes Buffer that will contain the packed bytes at the end of the operation.
   * @param offset Offset into bytes where the packing is to begin.
   * @param kind This int indicates the type of byte_pack being requested. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in all of the
   * fields being packed and the return of an integer indicating the number of
   * packed bytes. All other kind values result in no change to the buffer contents, and a
   * return value of 0.
   */
  extern virtual function int unsigned do_byte_pack(ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Unpacks the object from the bytes buffer, beginning at offset. If protocol
   * defines physical representation for transaction then -1 kind does RELEVANT
   * byte_unpack. If not, -1 kind results in an error. `SVT_DATA_TYPE::COMPLETE
   * always results in COMPLETE byte_unpack.
   *
   * @param bytes Buffer containing the bytes to be unpacked.
   * @param offset Offset into bytes where the unpacking is to begin.
   * @param len Number of bytes to be unpacked.
   * @param kind This int indicates the type of byte_unpack being requested. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in all of the
   * fields being unpacked and the return of an integer indicating the number of
   * unpacked bytes. All other kind values result in no change to the buffer contents,
   * and a return value of 0.
   */
  extern virtual function int unsigned do_byte_unpack(const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1);
`endif //  `ifdef SVT_VMM_TECHNOLOGY
   


  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>read</i> access to public data members of this class.
   */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>write</i> access to public data members of this class.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);

  // ---------------------------------------------------------------------------
  /**
   * HDL Support: This method allocates a pattern containing svt_pattern_data
   * instances for all of the primitive data fields in the object. The
   * svt_pattern_data::name is set to the corresponding field name, the
   * svt_pattern_data::value is set to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern();

  // ---------------------------------------------------------------------------
  /**
   * Method used to obtain the physical address for a specific beat within a burst.
   *
   * @param burst_ix Desired beat within the burst.
   *
   * @return The physical address for the indicated burst_ix.
   */
  extern virtual function void get_phys_addr(int burst_ix, ref int unsigned phys_addr [`SVT_MEM_SA_CORE_PHYSICAL_DIMENSIONS_MAX]);

  // ---------------------------------------------------------------------------
endclass:svt_mem_transaction


`ifdef SVT_VMM_TECHNOLOGY
`vmm_channel(svt_mem_transaction)
`vmm_atomic_gen(svt_mem_transaction, "VMM (Atomic) Generator for svt_mem_transaction data objects")
`vmm_scenario_gen(svt_mem_transaction, "VMM (Scenario) Generator for svt_mem_transaction data objects")
`endif

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
pSh61bMw8/amX4wxe6hPzaV/e4C28nXdQLFdH54tBCoZy/osN8h9IfrUEFhoaIqR
u5OpBYz3jzba6ejkSU+YHBcMHH55eKOtKCFIh2jSRkQCVpI4alzI8j8L0oxLfsfx
yT4N3czhckrUTP5xrH54n5F/fgPUkHp9ukU4rsK67UoeXdlH08kLtg==
//pragma protect end_key_block
//pragma protect digest_block
A+gig2AHbGKNlCJUaI9krGIUMbo=
//pragma protect end_digest_block
//pragma protect data_block
yke+D4Ea2u2SUxkrcHATi9G7YW11JdNInxySKRb8kH0JLUHJno5ottgYWFJso5xx
hjF2v0uMA91AZ2IFC4l+TrhG8M5Rx0VAtnO0P8vzWp2WfelZ1aLBCDOS1czfcaN4
X0fHam/s1+oki+sYhbKQ6pG5IbjNrLUeiSU7zXK7AmqIpkY0YrQwIjD0TR2hsSh0
1DgOvdiTC43vw5U9niipyJuyJ6J2czeEPlPyJPcOgkv2FmSyzP2PcZaN6ffVJxVC
f7xQ7BLDW0j+gYH+L6jbxt9+w3Fiyy+cGSOvhMxg0W+5EQ9EINQo93hr8th9Uzwl
oPDtqXbaIaooToJX4Q7l8aBZFRjBtsF17ATNpKiri6fSpOyZuBj+Jpo+vz+xYnIE
S/vpclnaAGuOSSiLihEjDKYXLcCD+4FMFfSeURUcUyhD83czn5WV6Sf5rp3G+a3P
nyr/rhxBMQofBcAH/nOOym/IyjS9fBPm6AGqgLavaXUE4ZhUWXy9hVHWH1OT3Ngi
ln2tJUb2gjy9lbgwXUi61KbhDcPs+mlfuRIZ7Yjtb6CoqJ3NPA7LWMYGyUDr//l9
7K4NqiNngBtwJ4AO03uQVuGGm2q5qnGY+Z5T9QQKA7IzaO9RohfsRoS5hQdMKJUZ
tv/QZAv103ZoNehPOsn909xqCwNzyNIbp4cHadjd1cyxosjMOOrKIVLCRbnlKLfA
pxNkQctQYBWTFtQdLjI4A3/U1WAw3fTZl2DGRkqk7twxN3mpQK7l37dqk16XR3He
v+eZsYAHW8Jbyxh1S88hp7Enk3r5jXozxwmfRBRx91hvl3pAN2/+GO+oUZHzCQAX
9UUcjDdThE82DRyC1pFIQPl/zOAFO4wqobA3Ab6b6SxSL1rjoO7AfUHK84Ls0GMf
iBZumsnshfwIhy9i6pssVm71ddW6MHHlsxVXV+CqQNP1PBsC1yKtLDzUl/0yfqUH
QdKkaNB0Lu23pfyLx+TTJlyWyRf6D4DTFeUyNpuTa6NpyXzSG4G8+rBpJPlziuzf
lpXYBXVpINxWmpOgL+NtfYx0tngTjFmhb9Vjr/nqytleUdIgOqz0QDjEXY2l47s8
9Acd+9WiPA1rPh0ITJ9lF5l03FEPs/UhYUuWqBPRyUCTgsx4nBGQ+gLOLB7Yyt+v
+We3g7Nv7JG2zl4xQOeqPylpkUZt5/x/eZkNYW48nEWOS+R4ZXmrvohIk/50Nq67
1/XUGP/N3U/5IotPexT9tltvn20DgztSfcTRgE5e/vA=
//pragma protect end_data_block
//pragma protect digest_block
aHbXEosixEJdfzXIkKvyInIgFbY=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
w8VrWFNbIM9W6SeOTscu3BDQkEwcpcJj2eH3DKCj3XPNyC1OWMiAIASq6awE8ln8
r37dW/PqKAQw8YMfjlkgGQHrj3ytxzWDS9Lbowt/zc0+8zuB4h5e3Egll9op6tGI
OukVAhKC5MvjxC9TqILjJPNQRECumSW5p9ECzKnIWTH1bCAWLb7t5Q==
//pragma protect end_key_block
//pragma protect digest_block
j1C99c8hglSDcQYFzURzeHMJmAk=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
erfSoKZpSIZoPGIrErTK/Mb80cY=
//pragma protect end_digest_block
//pragma protect end_protected

`endif //  `ifndef GUARD_SVT_MEM_TRANSACTION_SV
   
   
