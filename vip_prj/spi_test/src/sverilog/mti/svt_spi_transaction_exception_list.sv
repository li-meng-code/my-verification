
`ifndef GUARD_SVT_SPI_TRANSACTION_EXCEPTION_LIST_SV
`define GUARD_SVT_SPI_TRANSACTION_EXCEPTION_LIST_SV

typedef class svt_spi_transaction;
typedef class svt_spi_transaction_exception;

//----------------------------------------------------------------------------
// Local Constants
//----------------------------------------------------------------------------

`ifndef SVT_SPI_TRANSACTION_EXCEPTION_LIST_MAX_NUM_EXCEPTIONS
/**
 * This value is used by the svt_spi_transaction_exception_list constructor
 * to define the initial value for svt_exception_list::max_num_exceptions.
 * This field is used by the exception list to define the maximum number of
 * exceptions which can be generated for a single transaction. The user
 * testbench can override this constant value to define a different maximum
 * value for use by all svt_spi_transaction_exception_list instances or
 * can change the value of the svt_exception_list::max_num_exceptions field
 * directly to define a different maximum value for use by that
 * svt_spi_transaction_exception_list instance.
 */
`define SVT_SPI_TRANSACTION_EXCEPTION_LIST_MAX_NUM_EXCEPTIONS   1
`endif

// =============================================================================
/**
 * This class contains details about the spi svt_spi_transaction_exception_list exception list.
 */
class svt_spi_transaction_exception_list extends svt_exception_list#(svt_spi_transaction_exception);

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_transaction_exception_list)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new exception list instance, passing the appropriate argument
   * values to the <b>svt_exception_list</b> parent class.
   *
   * @param log Sets the log file that is used for status output.
   * @param randomized_exception Sets the randomized exception used to generate exceptions during randomization.
   */
  extern function new(vmm_log log = null, svt_spi_transaction_exception randomized_exception = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new exception list instance, passing the appropriate argument
   * values to the <b>svt_exception_list</b> parent class.
   *
   * @param name Instance name of the instance
   */
  extern function new(string name = "svt_spi_transaction_exception_list", svt_spi_transaction_exception randomized_exception = null);
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_transaction_exception_list)
  `svt_data_member_end(svt_spi_transaction_exception_list)

  //----------------------------------------------------------------------------
  /**
   * Returns the class name for the object.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_transaction_exception_list.
   */
  extern virtual function vmm_data do_allocate();
`endif

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Compares the object with to. Differences are placed in diff. Only
   * supported kind values are -1 and `SVT_DATA_TYPE::COMPLETE. Both values result
   * in a COMPLETE compare.
   */
  extern virtual function bit do_compare(vmm_data to, output string diff, input int kind = -1);
`endif

  // ---------------------------------------------------------------------------
  /**
   * Does basic validation of the object contents. Only supported kind values are -1 and
   * `SVT_DATA_TYPE::COMPLETE. Both values result in a COMPLETE validity check.
   */
  extern virtual function bit do_is_valid(bit silent = 1, int kind = -1);

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation. Only supports
   * COMPLETE pack so kind must be `SVT_DATA_TYPE::COMPLETE.
   */
  extern virtual function int unsigned byte_size(int kind = -1);
  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset. Only supports COMPLETE pack so
   * kind must be `SVT_DATA_TYPE::COMPLETE.
   */
  extern virtual function int unsigned do_byte_pack(ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1);
  //----------------------------------------------------------------------------
  /**
   * Unpacks the object from the bytes buffer, beginning at offset. Only supports COMPLETE unpack so
   * kind must be `SVT_DATA_TYPE::COMPLETE.
   */
  extern virtual function int unsigned do_byte_unpack(const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1);
`endif

  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>write</i> access to public data members of this class.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);

  //----------------------------------------------------------------------------
  /**
   * Pushes the configuration and transaction into the randomized exception object.
   */
  extern virtual function void setup_randomized_exception(svt_spi_configuration cfg, svt_spi_transaction xact);

  // ---------------------------------------------------------------------------
  /** 
   * The svt_proto_transaction_exception class contains a reference, xact, to the transaction the exception is for.  The
   * exception_list copy leaves xact pointing to the 'original' data, not the copied into data.  This function
   * adjusts the xact reference in any data exceptions present. 
   *  
   * @param new_inst The svt_proto_transaction that this exception is associated with.
   */ 
  extern function void adjust_xact_reference(svt_spi_transaction new_inst);
  
  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_transaction_exception_list)
  `vmm_class_factory(svt_spi_transaction_exception_list)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
UxpIIXHAIqzPIAfdjK+YZgWLZ5e0FxbR8GdC6j6yzPdrUebyYYpV1ceB5F42bxV/
4Y9nnd2mZWoEc5SvDKhv0lXy7DFX7b7XcxjWtVWZ1cLzYVfPiVJumooTh3N+GLM0
3jKzbLu9vLripklZXNX21SLa0bsQViekZfAvQcWB1KI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1090      )
HT/p0T7JFPmoJrTPs8dNUsogxNF+dxZxchAQ5NgbwBuOB005HIrfbOe18eDhnLWK
vpA+7khD465wARjJORDxPmaC67HzlAqnBcMDPyIw503Jp2RFpa71PMot3ZK1Tne+
hkP/k3E7sq1z3qhPxmOCqtBy+k9Jf7loypZjhHb0Lc3AS8LgFa9AL4uhYApDhH4N
wwkyrkI8yw4KagOyemvmtfHrCEVzUfSk/RFJzfOWBGSHi+dHHdwi5qq4BdeDUAJH
iOFT4csSO42jtVHl46FZWJYp8/13WedXp5EuqVhuNNNIeSmUZamIQmldi18AWMG/
bIzouuoN/3fdibbV/qrqXBy5XC5lJvV5Xa2/kQ+0anpimVFUDPe/hSHWX6F3JOoX
MU/HSmOt3CyhLt1W+S8T1l+QVJCxl6v85qnaxnozWmQWmxs9LvfPWVo87q1+aJOg
8BRYgAy+d5uqmwvfKR6GvjOxv22BWMUd1wNHzFk7GYxuLiJs/ZBOlv6HLIVx528g
V+zrTr2S8M2ijHhNTdqNxAF+M1NazEK7llZ+ajxo4OMIxVvy2RHoOcAPghJPtijs
BKcaicNTT7C9fnrSJpBMNCzTWw7M5qe+lUjsfXGRY2lo98Wvp1/NLnGpS//E2CHm
M9M+pt1wsFDtNd65De1feUE0HvUmy+YZAqC4JiW4WO6ytLYoyFHzLZoL2kn3qTEh
qw8cx9EYZL8IzpFFi8QpvNkTsKL+jiiTWilDqkm8+KO8tbMCThs6HgS4JPo1X9YK
r3fBL45BuumS1xcJX3FvfXrj7BQlT/TAuuiAb0q9Je8069MPI+C5/u7g4y4tF1zO
htr+LE465uR5VGFQKPCkgV6I4vhB7lNe3V9rSM6fQuE/7J0PcOqwgBJjo7vBg+k8
lmMPneFJA9cRGNETvgWLy8EUKN1ryCx3Jkq7eWwS9ahbpKQo2G2o6kA5c10zfByU
SMdL4X5pPk8fbQYn8y2N4+o0FWHC4dUcIufle+SpzqID0pp+FLsup7ElizQiKxNb
3spbanv+v3SbA/Mfx2KIFvR7HmPAqBr+mhASSecdpux+eCJOn/nh3Y1GvtoZqxnw
TU5YomkV/5p06jm+ld2fw+psxKtjMw+nL36BcQlz9FwjTpkfXF5Yxba9pRBIbKpB
Jhuz1MNgrq6gaT3Jlout1R4bXV/w7YG4McHOK05nol8UwGij1A0OZWPYUZfWcCCT
DMZ+J4Pvsd6/B7IxLitApDMEZny/R6/QfLHUAqF+L1OW/L4dzhF/oafjD36HFz+f
GYe4dMq1ViVG2CBalfMVShQ1fjWdUc0MAMrB72ndOCQ80GTzcCW+n3Uy8lTBr75H
osSasQJrVcTF1DSwT5y3fwCGa2nTB5DkDULiUqYBv+RsGJbZo8L3TQ7R2BMv+E3B
ayXVK/xd9z6+/td3f2NOO1nN1RZWXC8HvFQ+fcY0kmTD3lXp5Mz3D8FA4S2x5bfB
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
gSRutsrFMkHO+FfKySgHCwBQJcg/PF9gVIYHLwync8+g3SiFUYafjhVIxNYSABUS
HAMFpvxqG/PHgsYAGDi9vwMqju6Xh+CM7V7jeU6yJS6FPVcwqRYzCaVH/H5B4mWp
SwrG4/5ReKk2bvYmxbwrArRCSCe5at3Ww1GN5Z9iz+o=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 9082      )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TRANSACTION_EXCEPTION_LIST_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
M2ss5MIOaZ+Q5fy9+ywf2l2KAx5714tY5JOdhnHbfUExhy7XUDc3QhI8oczDDwiG
JhZhP1n0mEglJ3cT4AklfVgXUzFCQbPNxMmLsFkgOiVS8w0JI9kiamC+ODxvbUFz
mqVFzWyh3utH3A8NMbb2ciMbZoCAfqpabvhg4t/+FQE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 9165      )
wEnhMVf2WxUPtaQN2tcpVf5a0Qq8zGZdwsa91uetkgAQBmacDZroHo4c9FAAHvY9
U3cBn3PiiCEvzBQVAlvkq7TCS7xqlfK0XhSFtk32fs5xf8/L+X0gYiXgFBDlnRlL
`pragma protect end_protected
