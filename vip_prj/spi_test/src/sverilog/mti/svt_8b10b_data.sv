//=======================================================================
// COPYRIGHT (C) 2007-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_8B10B_DATA_SV
`define GUARD_SVT_8B10B_DATA_SV

`include `SVT_SOURCE_MAP_LIB_SRC_SVI(V-2023.12,svt_data_util)

// =============================================================================
/**
 * A utility class that encapsulates an individual unit of transfer in an 8b/10b
 * encoding protocol.  The object can be initialized with either eight bit data
 * or ten bit data.  Methods are present on the object to encode eight bit data
 * into its ten bit representation, or decode ten bit data into its eight bit
 * representation.  The current running disparity must be provided to encode or
 * decode the data properly, and the updated running disparity value is returned
 * from these functions via a ref argument.
 * 
 * The 8b/10b and 10b/8b conversion methods utilize lookup tables instead of
 * calculations for performance reasons.  The data values represent the full
 * 8-bit state space, but the K-code values only utilize a subset of the 8-bit
 * state space.  Therefore, the following K-code values are incorporated into
 * the lookup tables:
 * 
 * - K28.0
 * - K28.1
 * - K28.2
 * - K28.3
 * - K28.4
 * - K28.5
 * - K28.6
 * - K28.7
 * - K23.7
 * - K27.7
 * - K29.7
 * - K30.7
 * .
 */
class svt_8b10b_data extends `SVT_TRANSACTION_TYPE;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Local Data
  // ****************************************************************************

  /** Static flag that gets set when the tables are initialized */
  local static bit lookup_table_init_done = 0;

  // ****************************************************************************
  // Protected Data
  // ****************************************************************************

  /** Eight bit data value to ten bit lookup table */
  protected static bit[9:0] lookup_table_D10b[512];

  /** Eight bit control value to ten bit lookup table */
  protected static bit[9:0] lookup_table_K10b[int];

  /** Ten bit value to eight bit lookup table */
  protected static bit[8:0] lookup_table_8b[int];

  /** Disparity lookup table (indexed by ten bit values) */
  protected static integer  lookup_table_disparity[int];

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /** Status information about the current processing state */
  status_enum status = INITIAL;

  //----------------------------------------------------------------------------
  /** Randomizable variables */
  // ---------------------------------------------------------------------------

  /**
   * Eight bit representation of the data
   * 
   * This property is declared rand, but the rand_mode is disabled in the constructor.
   */
  rand bit [7:0] data_8bit;

  /**
   * Flag that determines when the eight bit data represents a control character
   * 
   * This property is declared rand, but the rand_mode is disabled in the constructor.
   */
  rand bit data_k;

  /**
   * Ten bit representation of the data
   *
   * This property is declared rand, but the rand_mode is disabled in the constructor.
   */
  rand bit [9:0] data_10bit;

  // ****************************************************************************
  // Constraints
  // ****************************************************************************

  /**
   * Since every protocol supports a different sub-set of K-Code values, a
   * valid_ranges constraint can't be create which satisfies every protocol.
   * Therefore, it is the responsibility of the suite maintainer to create a
   * class that is derived from this one that implements the constraints that are
   * appropriate for that protocol.  The rand_mode of all of the random
   * properties that are defined in this class is also disabled in the
   * constructor.
   */
  //constraint valid_ranges
  //{
  //}

  /**
   * Ensures that the 8 bit representation matches the 10 bit representation and if the
   * data represents a control character, then the constraint ensures that a valid
   * control character is selected
   * 
   * Note: Functions in constraints won't be supported until VCS 2008.03, so this
   * constraint is commented out for now.
   */
  constraint reasonable_data_8bit {
    /*
    {data_k, data_8bit} inside { lookup_8b(data_10bit, 1'b0), lookup_8b(data_10bit, 1'b1) };

    if (data_k == 1'b1) {
      lookup_table_K10b.exists(data_8bit);
    }
    */
  }

  /**
   * Ensures that the 10 bit representation matches the 8 bit representation with either
   * positive or negative disparity
   * 
   * Note: Functions in constraints won't be supported until VCS 2008.03, so this
   * constraint is commented out for now.
   */
  constraint reasonable_data_10bit {
    /*
    if (data_k == 1'b0) {
      data_10bit inside { lookup_D10b(data_8bit, 1'b0), lookup_D10b(data_8bit, 1'b1) };
    }
    else {
      data_10bit inside { lookup_K10b(data_8bit, 1'b0), lookup_K10b(data_8bit, 1'b1) };
    }
    */
  }

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_8b10b_data)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transaction instance, passing the appropriate argument
   * values to the <b>vmm_data</b> parent class.
   *
   * @param log Sets the log file that is used for status output.
   * @param suite_name A String that identifies the product suite to which the
   * transaction object belongs.
   */
  extern function new ( vmm_log log = null, string suite_name = "" );
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transaction instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name of the transaction
   * @param suite_name A String that identifies the product suite to which the
   * transaction object belongs.
   */
  extern function new(string name = "svt_8b10b_data", string suite_name = "");
`endif

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
  `svt_data_member_begin(svt_8b10b_data)
  `svt_data_member_end(svt_8b10b_data)

  // ---------------------------------------------------------------------------
  /**
   * Encodes an eight bit data value into its ten bit representation.  The
   * data_8bit, data_k, and data_10bit values are updated as a result of calling
   * this function.  The function returns 0 and no properties are updated if
   * Xs or Zs are passed in via the arguments.
   * 
   * @param value Eight bit value to be encoded
   * @param RD The value provided to this argument determines whether the ten bit
   * value is selected from the positive or negative disparity column.  The value
   * is updated with the disparity of the new ten bit value that is selected.  If
   * the encode operation fails then the value remains unchanged.
   * value
   */
  extern function bit encode_data( bit[7:0] value, ref bit RD);

  // ---------------------------------------------------------------------------
  /**
   * Encodes an eight bit control value into its ten bit representation.  The
   * data_8bit, data_k, and data_10bit values are updated as a result of calling
   * this function.  The function returns 0 and no properties are updated if
   * Xs or Zs are passed in via the arguments, or if the value passed in is not
   * in the 8b/10b lookup table.
   * 
   * @param value Eight bit value to be encoded
   * @param RD The value provided to this argument determines whether the ten bit
   * value is selected from the positive or negative disparity column.  The value
   * is updated with the disparity of the new ten bit value that is selected.  If
   * the encode operation fails then the value remains unchanged.
   */
  extern function bit encode_kcode( bit[7:0] value, ref bit RD);

  // ---------------------------------------------------------------------------
  /**
   * Decodes a ten bit data value into its eight bit representation.  The
   * data_8bit, data_k, and data_10bit values are updated as a result of calling
   * this function.  The function returns 0 and no properties are updated if
   * Xs or Zs are passed in via the arguments, or if the value that is passed in
   * is not in the 10b/8b lookup table.
   * 
   * @param value Ten bit value to be decoded
   * @param RD The value provided to this argument determines whether the ten bit
   * value is selected from the positive or negative disparity column.  The value
   * is updated with the disparity of the new ten bit value that is selected.  If
   * the encode operation fails then the value remains unchanged.
   */
  extern function bit decode_data( bit[9:0] value, ref bit RD);

  // ---------------------------------------------------------------------------
  /**
   * Returns the code group of the data value as a string
   */
  extern function string get_code_group();

  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   */
  extern virtual function int reasonable_constraint_mode ( bit on_off );

  //----------------------------------------------------------------------------
  /**
   * Returns the class name for the object.
   */
  extern virtual function string get_mcd_class_name ();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Compares the object with to. Differences are placed in diff. Only
   * supported kind values are -1 and `SVT_DATA_TYPE::COMPLETE. If protocol
   * defines physical representation for transaction then -1 does RELEVANT
   * compare. If not, -1 does COMPLETE (i.e., all fields checked) compare.
   * `SVT_DATA_TYPE::COMPLETE always results in COMPLETE compare.
   */
  extern virtual function bit do_compare ( `SVT_DATA_BASE_TYPE to, output string diff, input int kind = -1 );
`else
  // ---------------------------------------------------------------------------
  /** Override the 'do_compare' method to compare fields directly. */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
`endif

  //----------------------------------------------------------------------------
  /**
   * Checks to see that the data field values are valid, focusing mainly on checking/enforcing
   * valid_ranges constraint. Only supported kind values are -1 and `SVT_DATA_TYPE::COMPLETE.
   * If protocol defines physical representation for transaction then -1 does RELEVANT
   * is_valid. If not, -1 does COMPLETE (i.e., all fields checked) is_valid.
   * `SVT_DATA_TYPE::COMPLETE always results in COMPLETE is_valid.
   */
  extern virtual function bit do_is_valid ( bit silent = 1, int kind = -1 );

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation. If protocol
   * defines physical representation for transaction then -1 kind does RELEVANT
   * byte_size calculation. If not, -1 kind results in an error.
   * svt_data::COMPLETE always results in COMPLETE byte_size calculation.
   */
  extern virtual function int unsigned byte_size ( int kind = -1 );

  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset. If protocol
   * defines physical representation for transaction then -1 kind does RELEVANT
   * byte_pack. If not, -1 kind results in an error. svt_data::COMPLETE
   * always results in COMPLETE byte_pack.
   */
  extern virtual function int unsigned do_byte_pack ( ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1 );

  //----------------------------------------------------------------------------
  /**
   * Unpacks the object from the bytes buffer, beginning at offset. If protocol
   * defines physical representation for transaction then -1 kind does RELEVANT
   * byte_unpack. If not, -1 kind results in an error. svt_data::COMPLETE
   * always results in COMPLETE byte_unpack.
   */
  extern virtual function int unsigned do_byte_unpack ( const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1 );
`endif

  //----------------------------------------------------------------------------
  /**
   * Displays the meta information to a string. Each line of the generated output
   * is preceded by <i>prefix</i>.  Extends class flexibility in choosing what
   * meta information should be displayed.
   */
  extern virtual function string psdisplay_meta_info ( string prefix = "" );

  //----------------------------------------------------------------------------
  /**
   * Returns a string (with no line feeds) that reports the essential contents
   * of the transaction generally necessary to uniquely identify that transaction.
   *
   * @param prefix (Optional: default = "") The string given in this argument
   * becomes the first item listed in the value returned. It is intended to be
   * used to identify the transactor (or other source) that requested this string.
   * This argument should be limited to 8 characters or less (to accommodate the
   * fixed column widths in the returned string). If more than 8 characters are
   * supplied, only the first 8 characters are used.
   * @param hdr_only (Optional: default = 0) If this argument is supplied, and
   * is '1', the function returns a 3-line table header string, which indicates
   * which transaction data appears in the subsequent columns. If this argument is
   * '1', the <b>prefix</b> argument becomes the column label for the first header
   * column (still subject to the 8 character limit).
   */
  extern virtual function string psdisplay_short( string prefix = "", bit hdr_only = 0);

  // ---------------------------------------------------------------------------
  /**
   * Access to the D8b lookup tables without disparity calculations.  These are
   * added to make expressing constraints possible when VCS supports this feature.
   * 
   * @param value Value to be applied to the lookup table
   * @param disp_in Disparity column that the 10 bit value will be returned from
   */
  extern virtual function bit[9:0] lookup_D10b( bit[7:0] value, bit disp_in );

  // ---------------------------------------------------------------------------
  /**
   * Access to the K8b lookup tables without disparity calculations.  These are
   * added to make expressing constraints possible when VCS supports this feature.
   * 
   * @param value Value to be applied to the lookup table
   * @param disp_in Disparity column that the 10 bit value will be returned from
   */
  extern virtual function bit[9:0] lookup_K10b( bit[7:0] value, bit disp_in );

  // ---------------------------------------------------------------------------
  /**
   * Access to the 10b lookup tables without disparity calculations.  These are
   * added to make expressing constraints possible when VCS supports this feature.
   * 
   * @param value Value to be applied to the lookup table
   * @param disp_in Disparity column that the 8 bit value will be returned from
   */
  extern virtual function bit[8:0] lookup_8b( bit[9:0] value, bit disp_in );

  // ---------------------------------------------------------------------------
  /**
   * Returns true if the provided value is in the 10 bit lookup table.  Otherwise
   * returns false.
   * 
   * @param value Value to be tested
   * @param disp_in Optional disparity to test against.  If this value is not
   * provided, then the function returns true whether the value was found in the
   * positive or negative disparity column.
   */
  extern virtual function bit is_valid_10b( bit[9:0] value, logic disp_in = 1'bx );

  // ---------------------------------------------------------------------------
  /**
   * Returns true if the provided value is in the 8 bit control character lookup
   * table.  Otherwise returns false.
   * 
   * @param value Value to be tested
   * @param disp_in Optional disparity to test against.  If this value is not
   * provided, then the function returns true whether the value was found in the
   * positive or negative disparity column.
   */
  extern virtual function bit is_valid_K8b( bit[7:0] value, logic disp_in = 1'bx );

  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>read</i> access to public data members of this class.
   */
  extern virtual function bit get_prop_val( string prop_name,
                                            ref bit [1023:0] prop_val,
                                            input int array_ix,
                                            ref `SVT_DATA_TYPE data_obj );

  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>write</i> access to public data members of this class.
   */
  extern virtual function bit set_prop_val( string       prop_name,
                                            bit [1023:0] prop_val,
                                            int          array_ix );

  // ---------------------------------------------------------------------------
  /**
   * Simple utility used to convert string property value representation into its
   * equivalent 'bit [1023:0]' property value representation. If provided the type
   * is used by the default implementation to choose an appropriate conversion method.
   * If the type is specified as UNDEF then the the field is assumed to be an int field
   * and the string is assumed to be an ascii int representation. Derived classes can
   * extend this method to support other field representations such as strings, enums,
   * bitvecs, etc.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort. 
   *
   * @return Status indicating the success/failure of the encode.
   */
  extern virtual function bit encode_prop_val(string prop_name, string prop_val_string, ref bit [1023:0] prop_val,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  // ---------------------------------------------------------------------------
  /**
   * Simple utility used to convert 'bit [1023:0]' property value representation
   * into its equivalent string property value representation. If provided the type
   * is used by the default implementation to choose an appropriate conversion method.
   * If the type is specified as UNDEF then the the field is assumed to be an int field
   * and the string is assumed to be an ascii int representation. Derived classes can
   * extend this method to support other field representations such as strings, enums,
   * bitvecs, etc.
   *
   * @param prop_name The name of the property being decoded.
   * @param prop_val The bit vector decoding of prop_val_string.
   * @param prop_val_string The resulting decoded value.
   * @param typ Optional field type used to help in the decode effort. 
   *
   * @return Status indicating the success/failure of the decode.
   */
  extern virtual function bit decode_prop_val(string prop_name, bit [1023:0] prop_val, ref string prop_val_string,
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
endclass

`ifdef SVT_VMM_TECHNOLOGY
`vmm_channel(svt_8b10b_data)
`endif

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Y4OUQm0wTxbmbYsSQbbs3r1KbWdITFNWakoaFx1GLhSiRcw5u2Tv4Mm3fMw9D2Wo
W409nZYV6d75exMb6cGtkBgYduycls+YjVfGhBUTnfEaXTVYqzO1wZ9AKNA/ZpMh
31FR7Mwh7aKZDQiNwuhsdqZvJpNFSAc/YMlDxEA8H7E=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 46292     )
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
`pragma protect end_protected

`endif // GUARD_SVT_8B10B_DATA_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
aXgnZtBO7ARMm5VWzeuyB5Mif2zFBBxh867/XWD0H3W+93rejlLpO6fjurRo34LV
KO3kB9ZZIEVgp8Qnw+fRKOs+3+vVG2VDJRir+7KFyVAjnnQMh7yxA5cylRMaGGro
gOd0cDTZLMcp0IC4nJz9iBfpebOyF9/y67AH2vGGSfQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 46375     )
tsTa+Hsqp6bQ65AQBIRYdxf7iTYcXD6mnD9cJkW9u7Fw8aWFub99vt9ClpkvlFUf
kiI2/O+oEmwFb4WPJebQYXIYDHr5fswKLznnotghF2IhsIzmeQr+q95FgwS3H4s8
`pragma protect end_protected
