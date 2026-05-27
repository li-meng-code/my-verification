//=======================================================================
// COPYRIGHT (C) 2009-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_COMPOUND_PATTERN_DATA_SV
`define GUARD_SVT_COMPOUND_PATTERN_DATA_SV

/** @cond SV_ONLY */
// =============================================================================
/**
 * Data object for storing an set of name/value pairs.
 */
class svt_compound_pattern_data extends svt_pattern_data;

  // ****************************************************************************
  // GeneralTypes
  // ****************************************************************************

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /** The compound set of pattern data. */
  svt_pattern_data compound_contents[$];

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_compound_pattern_data class.
   *
   * @param name The pattern data name.
   *
   * @param value The pattern data value.
   *
   * @param array_ix Index into value when value is an array.
   *
   * @param positive_match Indicates whether match (positive_match == 1) or
   * mismatch (positive_match == 0) is desired.
   * 
   * @param typ Type portion of the new name/value pair.
   * 
   * @param owner Class name where the property is defined
   * 
   * @param display_control Controls whether the property should be displayed
   * in all RELEVANT display situations, or if it should only be displayed
   * in COMPLETE display situations.
   * 
   * @param display_how Controls whether this pattern is displayed, and if so
   * whether it should be displayed via reference or deep display.
   * 
   * @param ownership_how Indicates what type of relationship exists between this
   * object and the containing object, and therefore how the various operations
   * should function relative to this contained object.
   */
  extern function new(string name, bit [1023:0] value, int array_ix = 0, int positive_match = 1, svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF, string owner = "",
                      display_control_enum display_control = REL_DISP, how_enum display_how = REF, how_enum ownership_how = DEEP);

  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * Method to add a pattern data instance to the compound pattern data instance.
   *
   * @param pd The pattern data instance to be added.
   */
  extern virtual function void add_pattern_data(svt_pattern_data pd);

  // ---------------------------------------------------------------------------
  /**
   * Method to add multiple pattern data instances to the compound pattern data instance.
   *
   * @param pdq Queue of pattern data instances to be added.
   */
  extern virtual function void add_multiple_pattern_data(svt_pattern_data pdq[$]);

  // ---------------------------------------------------------------------------
  /**
   * Method to delate a pattern data instance, or all pattern data instances, from
   * the compound pattern data instance.
   *
   * @param pd The pattern data instance to be deleted. If null, deletes all pattern
   * data instances.
   */
  extern virtual function void delete_pattern_data(svt_pattern_data pd = null);

  // ---------------------------------------------------------------------------
  /**
   * Extensible method for getting the compound contents.
   */
  extern virtual function void get_compound_contents(ref svt_pattern_data compound_contents[$]);

  // ---------------------------------------------------------------------------
  /**
   * Copies this pattern data instance.
   *
   * @param to Optional copy destination.
   *
   * @return The copy.
   */
  extern virtual function svt_pattern_data copy(svt_pattern_data to = null);
  
  // ---------------------------------------------------------------------------
  /**
   * Returns a simple string description of the pattern.
   *
   * @return The simple string description.
   */
  extern virtual function string psdisplay(string prefix = "");
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for returning value as a real. Only valid if the field is of type REAL.
   *
   * @param array_ix Index into value array.
   *
   * @return The real value.
   */
  extern virtual function real get_real_array_val(int array_ix);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for returning value as a realtime. Only valid if the field is of type REALTIME.
   *
   * @param array_ix Index into value array.
   *
   * @return The realtime value.
   */
  extern virtual function realtime get_realtime_array_val(int array_ix);

  // ---------------------------------------------------------------------------
  /**
   * Utility method for returning value as a string. Only valid if the field is of type STRING.
   *
   * @param array_ix Index into value array.
   *
   * @return The string value.
   */
  extern virtual function string get_string_array_val(int array_ix);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for returning value as a bit vector. Valid for fields which are not of
   * type OBJECT or GRAPHIC.
   *
   * @param array_ix Index into value array.
   *
   * @return The bit vector value.
   */
  extern virtual function bit [1023:0] get_any_array_val(int array_ix);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for setting a real field value. Only valid if the field is of type REAL.
   *
   * @param array_ix Index into value array.
   * @param value The real value.
   */
  extern virtual function void set_real_array_val(int array_ix, real value);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for setting a realtime field value. Only valid if the field is of type REALTIME.
   *
   * @param array_ix Index into value array.
   * @param value The realtime value.
   */
  extern virtual function void set_realtime_array_val(int array_ix, realtime value);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for setting a string field value. Only valid if the field is of type STRING.
   *
   * @param array_ix Index into value array.
   * @param value The string value.
   */
  extern virtual function void set_string_array_val(int array_ix, string value);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for setting a field value using a bit vector. Only valid if the fields which are not of
   * type OBJECT or GRAPHIC.
   *
   * @param array_ix Index into value array.
   * @param value The bit vector value.
   */
  extern virtual function void set_any_array_val(int array_ix, bit [1023:0] value);
  
  // ---------------------------------------------------------------------------
endclass
/** @endcond */

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
XXxIs0Wia+6fGz9c5cFhCuVNFx4jOjJtB7cXKALEG/+8ECPdzWkzNjxhOCYDNqkL
ZF5L9ZJxePucwC9CDqLPQQph30CKXGDl1eaklO4Yocl7WPK56ymrZYf5Kk1Lsr4F
70CxP8KKeDV1NCt/TFdKZfDy/OSiV73+XwlrrXv/+07Crjx9yKHKtA==
//pragma protect end_key_block
//pragma protect digest_block
JHGZ9xmrZ5nR3PjksnNcAsFwD5s=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
jo+oTnDUKoeq6mJUVlQdw7qHscI=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_COMPOUND_PATTERN_DATA_SV
