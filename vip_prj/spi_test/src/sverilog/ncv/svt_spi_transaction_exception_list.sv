
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
XKbSWDP1sxIk19awJRFoV1ci4mqaKAcE4fnR4HfyBVgYZWYtweLQULcX9QGBgNXN
Xd192yvTQITForsT1ublhTk7QweDQFFwcqJqBMV6WtDk0Jw1o81Iucg8Zeal0S5a
b7D8sMst2wkE53jDx4RKUTCPvpUo3gZKTHZ4XpQM+LICxEcOQneD7A==
//pragma protect end_key_block
//pragma protect digest_block
JjiwFclYFOx5DaUD8ZH6/euP72g=
//pragma protect end_digest_block
//pragma protect data_block
jc/ZvRe3KjI5AGva8q+jPL2vJFnu0OqUPyY71L3jRQuU18ukcM8qu8gMeBjQez1q
XvtfwzWh7P2RW5pBo9vWRSterV01pOZnC9JWne3XvLGGhJ6A2gY+9RqjQPsfUwdV
LUBDr31S/muYZPnV1e94i4/VHHxri/J/o8Vbx1CmTiy44yrCdrqWvjkB076uEpHL
uPfpMEIZR6LLDir0JYEqZJ0F6GqzvRyexiCaBAjGCbyW8ruoc7vezczb1/YyP9zt
ZNuK5Ks1Mto8bHQZkhgo0XB0bQkgrMUG3grKQAcjVYl/IeYUTpPu8QiiGIKkXcKM
2V6ckqmQwXCzMVpklMHYNA2TSRvAu7Wj4/r0RnPJGn3ZDRbtraE+CUg/onlWqPlA
znqrLAuhDZwLG5h4yZHk5G4eLR7KSSLqgDZFNq7xh+n2EKb5Nzfv7QPGGVTUFAxm
ehWzD8i1YEQbHg5Bioyi8Vhmhr3Jv6FAz0YECcQhU+uLiS30JIVMDKNhm4OshXJC
tz92GQruno+DFD4t7tpFaC9z/9/hs1/rSfSTIA2d3dqkrOhyKr7a4toMapeWgEw/
eYnJ0g97E+dEutEVSYQFb8Ixh94KHlNm7hGvIWBaHoZsYD3aqHt1IA+jesXIyj6w
2b1iWDYLgJVZlyaPVWYVlc2ldV6CUJ5D5dDx6pAsjgTeBTtfuLICkaAU16C3+oUH
Dxa0Og9u+NHH0zLiwBLr7jcDTlMa2q1pnjXsln+L0+tYh6zIb52fgAdOsCpQCvw2
dvwiIIs74OnWBJy1EYkNnTMH/UE66VeQB+p/8dETRrjMu7GZ+bOmreC2p8B7tprk
Qh9sMu2fTopm3oioF4Mf4JbOiZJXmQeUint+9g+1x5a3vmGMSbHmT74xRSgqAgZX
HCvLCYFUDIjjKk7VagcTrjtmgCmVZ5l7V9SctRKf8kIztBJ/DBTG6DW9Tq9R4JjO
p4+pWWiXSL/qPOsGRXPkRs3Jp12joL2bUH87sJCHrgBLXJx0p4VbWn9n3lb4pv1R
hGS+8d5DJdXpqL6y0dFc3mwBMKK0R9DmZ2SEz0XcFnP4WRcHJuHiQ5bOuEHRxUg+
s6sQmW6CUFQMWZH9jLoogXCWJLGSWfLc4wUrf2D5SU7CjqBEEgNqv5Jws8d9tDmC
GkTynE7FuniyxFIMzyKn1coId429b6U8CPpvwEAi/CkgeuI61haPplcXRIQBys8c
ofr4FmGMwji9CjWhKrAky6VXIVVvDdAleYnNl6y+hTK/iku+RIgv+wjJ/C/F4KkP
2grDa8iWI+mrkHJuEHX6SUGhUJA82GKSQ5P/FlrcFfukpIenCb+buMKjVbrSJPLQ
NHEKSaJ+KS1VAJNv8tWDUFjwak/EFLySjFe9opzgoXh6jWJh1Neij6bbhpLqcMeW
SjjWkIGmsdKeGia2gjAo32RIWXwFA9LO0HB2p9WtMERmjb7tdqIUQTX+24i/+SkV
Xwxe+V2zlw8Ekjc3IHHwJ14Zb7bBmaFFmVfUQCJYqovtIdYz7HMP7ee0Z2U0lRTb
C6flMUI963Gj/xFEGNKJ6gxXqaWxH8NzaYL5JcPquVFQx1+Id4j0vgaRMSEbBARQ
sP/75nNpfvFYzu9ZRPI90r3CidB7aGMtkb0EG5bJKQulHsRp5A/3hGjWdCmR6PxK
yiv0tkuKQEXhrIDXMwWv4Q==
//pragma protect end_data_block
//pragma protect digest_block
CzEbcqMqHShUQu7vkq3tvsRuTtU=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
ht4IupytbX+kg0dhEBWuGUQKy1hRG63zqcZgKqdpCQIV18zT1b7Ye2tmeJjKvrr7
lZpmPBnktiwySwIsYG3tOIq1kiPooDABYRM7E351Ibx0sQ8qKhXgf/r1HZNbx9aa
DC1TSAu9pLzrxlrxmkGxCn3Dn6OFxEvf+ytUW09B23hBR2JqpIzcrQ==
//pragma protect end_key_block
//pragma protect digest_block
38WzE7QVLVLGiis1UO3Gw1VAiC8=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
ZG18ZzmPPi8PZmUv4SbhXBqjsf0=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TRANSACTION_EXCEPTION_LIST_SV
