//=======================================================================
// COPYRIGHT (C) 2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_FIFO_RATE_CONTROL_CONFIGURATION_SV
`define GUARD_SVT_FIFO_RATE_CONTROL_CONFIGURATION_SV
`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_defines)
// =============================================================================
/**
 * This FIFO rate control configuration class encapsulates the configuration information for
 * the rate control parameters modeled in a FIFO.
 */
class svt_fifo_rate_control_configuration extends svt_configuration;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************
  typedef enum bit {
    FIFO_EMPTY_ON_START = `SVT_FIFO_EMPTY_ON_START,
    FIFO_FULL_ON_START = `SVT_FIFO_FULL_ON_START 
  } fifo_start_up_level_enum;

  typedef enum bit {
    WRITE_TYPE_FIFO = `SVT_FIFO_WRITE,
    READ_TYPE_FIFO = `SVT_FIFO_READ
  } fifo_type_enum;

  // ****************************************************************************
  // Local Data
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************
  /**
   * The sequence number of the group in the traffic profile corresponding to this configuration
   */
  int group_seq_number;

  /**
   * The name of the group in the traffic profile corresponding to this configuration
   */
  string group_name;

  /**
   * The full name of the sequencer to which this configuration applies 
   */
  string seqr_full_name;

  /**
   * Indicates if this is a FIFO for read type transactions or a FIFO
   * for WRITE type transactions
   */
  rand fifo_type_enum fifo_type = WRITE_TYPE_FIFO;

  //----------------------------------------------------------------------------
  /** Randomizable variables - Dynamic. */
  // ---------------------------------------------------------------------------
  /** 
   * The rate in bytes/cycle of the FIFO into which data from READ
   * transactions is dumped or data for WRITE transactions is taken. 
   */
  rand int rate = `SVT_FIFO_MAX_RATE;

  /** 
   * The full level in bytes of the READ FIFO into which data from READ transactions
   * is dumped or the WRITE FIFO from which data for WRITE transactions is taken.
   */
  rand int full_level = `SVT_FIFO_MAX_FULL_LEVEL;

  /**
   * Indicates if the start up level of the FIFO is empty or full
   */
  rand fifo_start_up_level_enum start_up_level = FIFO_EMPTY_ON_START;

  // ****************************************************************************
  // Constraints
  // ****************************************************************************
  constraint valid_ranges {
    rate > 0; 
    full_level > 0;
  }

  constraint reasonable_rate { 
    rate <= `SVT_FIFO_MAX_RATE;  
  }

  constraint reasonable_full_level { 
    full_level <= `SVT_FIFO_MAX_FULL_LEVEL;
  }
  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
`ifndef __SVDOC__
  `svt_vmm_data_new(svt_fifo_rate_control_configuration)
`endif
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate argument
   * values to the <b>vmm_data</b> parent class.
   *
   * @param log Sets the log file that is used for status output.
   *
   * @param suite_name A String that identifies the product suite to which the
   * configuration object belongs.
   */
  extern function new(vmm_log log = null, string suite_name="");
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name of the configuration
   *
   * @param suite_name A String that identifies the product suite to which the
   * configuration object belongs.
   */
  extern function new(string name = "svt_fifo_rate_control_configuration", string suite_name="");
`endif // !`ifdef SVT_VMM_TECHNOLOGY
   

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
`ifndef __SVDOC__
  `svt_data_member_begin(svt_fifo_rate_control_configuration)
  `svt_data_member_end(svt_fifo_rate_control_configuration)
`endif

  //----------------------------------------------------------------------------
  /**
   * Method to turn static config param randomization on/off as a block.
   */
  extern virtual function int static_rand_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   */
  extern virtual function int reasonable_constraint_mode (bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Returns the class name for the object used for logging.
   */
  extern function string get_mcd_class_name();

  //----------------------------------------------------------------------------
  /**
   * Used to limit a copy to the dynamic data members of the object.
   */
  extern virtual function void copy_static_data ( `SVT_DATA_BASE_TYPE to );

  //----------------------------------------------------------------------------
  /**
   * Used to limit a copy to the dynamic data members of the object.
   */
  extern virtual function void copy_dynamic_data ( `SVT_DATA_BASE_TYPE to );

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to. Differences are placed in diff. Only
   * supported kind values are -1 and `SVT_DATA_TYPE::COMPLETE. Both values result
   * in a COMPLETE compare.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
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

`endif //  `ifdef SVT_VMM_TECHNOLOGY

  //----------------------------------------------------------------------------
  /**
   * Checks to see that the data field values are valid, focusing mainly on
   * checking/enforcing valid_ranges constraint. Only supported kind values are -1 and
   * `SVT_DATA_TYPE::COMPLETE. Both values result in the same check of the fields.
   */
  extern function bit do_is_valid(bit silent = 1, int kind = RELEVANT);

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation. Only supports
   * COMPLETE pack so kind must be `SVT_DATA_TYPE::COMPLETE.
   */
  extern virtual function int unsigned byte_size(int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset. Only supports COMPLETE
   * pack so kind must be `SVT_DATA_TYPE::COMPLETE.
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
   * Unpacks the object from the bytes buffer, beginning at offset. Only supports COMPLETE
   * unpack so kind must be `SVT_DATA_TYPE::COMPLETE.
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
   * Simple utility used to convert string property value representation into its
   * equivalent 'bit [1023:0]' property value representation. Extended to support
   * encoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort. 
   *
   * @return The enum value corresponding to the desc.
   */
  extern virtual function bit encode_prop_val( string prop_name,
                                               string prop_val_string,
                                               ref bit [1023:0] prop_val,
                                               input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  // ---------------------------------------------------------------------------
  /**
   * Simple utility used to convert 'bit [1023:0]' property value representation
   * into its equivalent string property value representation. Extended to support
   * decoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort. 
   *
   * @return The enum value corresponding to the desc.
   */
  extern virtual function bit decode_prop_val( string prop_name,
                                               bit [1023:0] prop_val,
                                               ref string prop_val_string,
                                               input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

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
endclass:svt_fifo_rate_control_configuration


`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
R+WAIpT3vgpqk7snTkDC+mtFBsadIQiL/mOT8k1heOrPzhrpPH4rkLtEsevc2fZP
XdZHkITA6F/yrXo8o4J0Ffx8h5UoejXqbEsXh1WHueLmd3ApIJPYLBsSzUdhwpt3
uNFDSnKQg9hNjk5dHSlupe1NNRbrNWZ+85siYzX5v+o=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 688       )
hqpm+Pqm5IVQTgKGGAUdJGPoU2Fbmkq8V/MhDdAWU6YywdfI90MbcBq/JVeFb3pI
Vd/6XjUK5/DVtZYISVAdcrS5mvDObn31PaOrOuWSezYQmEwyjPl7G1egdHE+DerA
1/hWvgh7G16i1AFKWU1IXhKKh4jLx5umB+VA05Ma2OVmCd2ySissojguu3k7uJxX
Pucd89CSBvtxlPGbiwB49ASMcGcuE4izGHjDj4JsJxugzJxoJU3Akk3j0rZRg7Ax
JIpWL5TEOfOgauCR0uhmtAmQfguDYTj1cJCtf3TBd9BJg5YOD+mnilnLENBmuT5/
B3S5LzBmjHd4qcJq7DkKBaPV4LSidD1HFgCT/Oa1URV64CxqMTUd7PLJasn2mLqH
nZx2GbSa5Dzsx9gEyj8ikWJ/Fg1BF2znsuiRndq4XIa6KiBcOQDamEMDHQhx3PGt
CHWVudAGCfxnfaV5jwVAdSFGBH6nP1B84ME3HpWxwgvbyomPPPL/fLHRzqxZfLdB
Nhh9YLd2fjjKyC7pSsUyjpWLgoCx57LBxeNfvsVLQ/zTeQXAIPYOMr0x7nSQXH7Z
PYYia5Q/xqx1Nv2MnbLn4mzoRnBpf7rk3/J3+5ZWunOZ3ywOkXnVFm+ymkVOKU+p
8/J+cy//1RP9qAQawdj23Do99IofgLQ6uNa62/0KJVBsZSmZi7Aeg/1RyFoYEG/g
yVpyZU2BEEmqQehMdFn5ZZfGlNKwQM15K5LSsWIFD/yqZ13fhcxNgofNA5Prilvz
z+Vj7heNe2UYFsYK5H0+bZbRfUo9vgNgJaoRjvY3xW8HXkqn7MRF1oB8SzMqhr2l
OJDL6KCQ4kZ7YiCKlXZIWNYhl3Iag7DXFXDIf2fld0dCXiT7LwjVGY0bLvbddHec
IBZ7BZSLF0CsCNmkE8h6FWmVevadY6i3A2+VrrFkMeQ=
`pragma protect end_protected

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
CDk2+aqO7Lrw5tk0JENdDRW54qe+NZ+BFA+oo3vwTGsf4yaWxBwD6F9bEOEJpjQk
UqYF99A/GPx34ala6GUnSq4GW93qvlWFvoxmMNcA37QKQYSwrW/4MF7BAvPu3CL4
FLlHqpPzOrj2tGCx3vhYBlURlvUhaZdkm68wi2D7V0c=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 16503     )
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
`pragma protect end_protected
   
`endif //  `ifndef GUARD_SVT_FIFO_RATE_CONTROL_CONFIGURATION_SV
   
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Pj+T2moCo2YQQfJ2VcC7myOQC6bJSOE4YIQvbhpgqFbg3CaZqBqI9Hj5OjdENyWl
ZLdwLUq9Tm2ndyocM+vyA6FMJvAcqKVtEHi2IeY7Hiie4jOlShq5BoG00PR0pkRx
aKAoyd0UVS9q53Osu0P//ZQ3CX34ibJvzSfSf8B7O3U=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 16586     )
VnlvfUqTpSEgosIwJrtH8bjLgTawa8kUYMD52w86se+9NFH+ULyfe4qPHt+7ED8i
gZp1xsnSoJx7EH1zovH/cLAUvr3Mk5LNnabeEij1Cc0kTB6PNGJHAdjsaRCl1n4G
`pragma protect end_protected
