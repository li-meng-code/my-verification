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


//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
qEKSet6ojB/DgTvREqLcqixgRoK0uO3V1S0706dAFB7q5bPyWxe8SfR2KjQygP7O
Z/YCzR3gXg4oL1zS6b2N5wJnANJko+t3nyLo00O9VIN9SeharTwvufLs/YRPhoCd
V5y7NIJI0fkwzvhthk8P35K2VQLVfUh5Rb/5LrvJoGiLpnEEn6MCsg==
//pragma protect end_key_block
//pragma protect digest_block
CupdZgSeJXCEz5VCCGIit46kztg=
//pragma protect end_digest_block
//pragma protect data_block
WH55mYdSAyn1cJcC1YxvIyAZSdJMyP9e6rfk9Znj1dJWO0lruh1Qo5dQMCpV8oLc
+uqXDdmwWEqT3MIsvzu2FhdNALMhNF2RGZITkuEzWcLIpRuvTc8M++Ob+HUa7qQ0
Th7qYoe8nWxMHv0sYJa8XIFqemzcTfgU5ZrMBJWoLTHHzVLinIhAlQdHCjowBdHQ
vAQKoXd78vALeUqevS0N518PAubdBHPXqqklyKuldJsPoL3bwgVtPMkA7mSJj8f/
L516ZZPseGZ4IT8cINyxuEyzSQMcu9C7L5EBjdFW+B4t2V5cCgngHneM58kijyHf
j45RcnQSuKWS6PM2aSxCb6VnbZiU4EG6BJI7+EdCyXwE3KFzgh3TqxAcyvvtz24a
AvN4rWQ53mZvMG5V/BSCzc7TwFhK71q9l3p9RKPZ6noG2tikoLR0+FjZoz0Nng0n
Ok8hrV7uYcQxO5Rtj8iM085YlC+teGpoXREcKOQvYPjd5wWpyrNCALwOEZDbHWQb
gm2g0M5Z7ZflFVsHJUCPMr3APgUNN+PKf8WhCAirHM3vtXu6m9uhV3x0M41BtJKz
x+n2egsIonWfvByQ8sg4ilxq0c4SRMeR1Sh69zzrt+oXimDfPaJL6/CLXDJHkrTQ
hDbI0TCgTWOJmhkq+hkfy1k5N9uEX+wBiorGbm23oJJOykiRPW5HtTvKeThR09CN
gWQynZR7h9hZegl+kBs8ort4O0H9Fm4SVGfbxOUOXdSP2WW/xbIL1rpxGxgJPsaI
O67iiQZyP+1L3dV0pqvW8EVUGl2XFPSZEunPcSqbFyxCVLkgiegjeZptSBXSwNom
WCHqd+kmY55jqXZ/xQGS6lUNHrmqgdgQL5FyYjtisNwZCi8Lo0N9ifoGKWlHfFfP
7rnjCAKOiMvJy3njoYfFLovPM24K/O+mY7bgCIxnxH22EBWzWTG6MFecJIcS8pzS
LEgoTVD7e0Dk9NNHgL6EXFWMl+Gazv3ng45PUfesEkPXS7rBWZ0ucDCeWPQkbhjs
O6/RB8fzSfT0UClg5lP2l/quXZkKapET4wCxLcZDUPBNv2dXgpm67M9sldDM5w2q
u3EAfeoqkNjX6tWRohR/QxyOrxKOEeVMlMrjiqZzA+X6fjkz7GK/gb5aiVLsONye

//pragma protect end_data_block
//pragma protect digest_block
9MS06Dv22SO+oZN5zF2VcxNTdhY=
//pragma protect end_digest_block
//pragma protect end_protected

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
c4fWNUlbUvl8oKzfEnwGLOBkvHZYornzE4zaKUscV2fxa0xhcLycuAR19NQ8VqGu
iQhpoxMcvn4q1TNir9FzPhyu++diuVFkoWON4peZ0NKRMTm1c462gOOATQER4BOV
gJp4L1pZSClOkqS0sfIkDKmJMI/Hed42fRbxu1jkFGf4JaKd9SnLXQ==
//pragma protect end_key_block
//pragma protect digest_block
t0tYXRA6VXcl/JuqpEIoWfVV9ys=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
k0+J7jFVy0S5L/z8oMq+p9WZheE=
//pragma protect end_digest_block
//pragma protect end_protected
   
`endif //  `ifndef GUARD_SVT_FIFO_RATE_CONTROL_CONFIGURATION_SV
   
