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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Q61OCzkHiYCpYFN7/h5TVYWQGefB1J11VS/BvI4ojLTQQQc0fhnwDT1fqbxJIhxn
8DtwNaYWEIsLoM0jVMROZ/ajPvRnwbmbLMojPhDhlcw6yFRw6jMjcOj2GJ7c/rJi
OSLct3oe/0YLuJ0zylax3yRo828Fh0k3e6Dw/JiSuEM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 771       )
XhrFCrxRuTskOsRerzzhGAdsWGgpLjmxyS/ihy0UBxGbeTJ1kdqTtxr+hYfjRMfo
H/miw9h0KsWLNnTWpCzcTo8wtcqKlOHzXVstOAQppDrBccKs90jaJhYdztftyTK6
iIsT6iujHiJpCYQCaeTIoWFLziKz9ZMTOi7DBeHCkozYK1LnrzbZ4KXlQ4Kf8zUT
P7AsimEi26IrSTSJyPmV4aVxa3SRPGhRsWymsymeQ+EsuHibaWaENAt3MymGP6mm
lOhPf2jBYZx+PVFjmPQP5DiHj3QEwoa6YckuCj0nNvrHeSeuCIlvoPEC7lNOFU2L
nDamoe5eymJJU47625VzHwPMVJkI6qzBvCKc1aw98pAs9zI1KM4Hsxpj+zVwk2HJ
MqlZP57DDcThOxbmlzDjZLq0hvTe6rnY6ojbZdOFKth50V9BiKYkB8JJtWPpCUi6
WB5wULsSFSKkCIYQVC4D3Hk5IIe/FH50KdmQm1XEjxAv0cobaWTzUe3VrpWuDzen
jJlMMsB0FQ6ojIBwHzYqfJsR/0ReJVt4ahyZip2jLxY+uGZo8NOAx8yu0td7A51R
Tpt+v450nvjJdDIVVMVgu11i2gasAjwErsqJlKPPQVEsquvFxMeXAFntyVYQ0HxD
onlJNLInfJMLYWDc3BIBRQcx6g7OuSE/a0bY0tAmHf+zWXXchb7DgH0ebwH0if5n
mAESBf2ZPzUopMjNWze+mdEojt0lixO0uHU90yErgIdPEHFWicQg2uPH+4q+zT7r
7/k8e4PUzfFePqBOTa70AZ0/FfXPlaFxsfNWCo/kXlR2pF+S8cd2kFYGc8LntlRs
vbpgugHJcI/ydKUP4Xvy6lza5SiY51rbGxiXowi7WNtTmZSyfozOiuPW77qeUtqA
50PA670paprYcZ4WGS38lY0VrqZ/L7Ru21D/K6YFOkzgO5pzY7Hn6GQUNi7zWwzU
+4YtKDzUIozUACENNJNBSzEMC6gNTjWgUe2aBiY9hCTJMKJPifVEUKhnXgM+KNuR
UUgvWD3mwlch6shV59ZIDQ==
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
S+AWcZ7dxnXMXF/+Z4hL1+n3cgcwyoyRVowpK7K+uDh5Gkz4T3EbpENS8JQJkJOk
BOl1GqKIjiqNH/jYgEMT/+QAtAu9wn9yctK20sSoEVARfqaUE6dEoxpUL+iNYXEe
16Jl2KdyQhXPoxV5vPUfDpUZf5cnEOOnp8Xd9T6g8ik=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 16972     )
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
`pragma protect end_protected

`endif //  `ifndef GUARD_SVT_MEM_TRANSACTION_SV
   
   
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
RDIws/5RX9vMSEdv16flvVwUeFfoNuviOoY+wdQa9LBb6PrfHJrurR01/crhkFUg
cRLCa7JBxjh8+VkUE+8tAKBHSOzrBuTeKJJys6O47nwUfng+n0frr5Dhse/FIwyS
jpIlXAdyTw+DYTuAluxMm0bFjKlMH6wmyrrGYtORxuo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 17055     )
fck1N6qfy58KyRc7/cDLj8G7516dHaW2ici2xK3YDKTUiVnfcmA6y8L0rtCmAWkx
+70XFfTy4zMipcYyWpPm6aEVKLtgj0DObCzQhD6pvG8QeTC/nUMphgx5W0paX7mR
`pragma protect end_protected
