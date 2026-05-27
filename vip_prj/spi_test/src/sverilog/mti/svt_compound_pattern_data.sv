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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
fmsA9S5U9aftfLH+05bHP5PWORpmKdS2aSGX7C6rzQmkCYtelBDGXMGQDuDf6/iY
eFgQ6ywKfhybj7dN0vG+niqtTNTk9rf3g8Gz4sGVcvuyffkNRNq/2ksun+I7ktAg
Akuy+UuF0WlzrlAARKHQ1NIXX6/vwXwBvXq364Ck6nU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 7605      )
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
`pragma protect end_protected

`endif // GUARD_SVT_COMPOUND_PATTERN_DATA_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
eIds8Klg44H0/iqhhDIG7tsd79lh0hWZxP21zFwgfvxeJVWg+b/VAgIQTPoIUJoQ
HJfsK0ks4xUZ4X2Esj1m486bP4c3wGuDqqlzqyUHjoVzgWSW4XwWT+6mD+YUxYs+
7za65GyrWOKwRk+BXrTbxalm/Hc3gKJCfPJOv0rNYP0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 7688      )
xaVs5POXl8y60hFkJ9oKpcQB8mm8vDURqfDP/VRiGLhRtNV0Owtp2SnNH0Ny1Ukm
WYIlsKi1FZUNItl0iRvCkHvfWPJ6Klio3ULHOStX6BfUOW6FLWNJs5eV2SWQ1GGc
`pragma protect end_protected
