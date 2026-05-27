//=======================================================================
// COPYRIGHT (C) 2015 SYNOPSYS INC.
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

`ifndef GUARD_SVT_OBJECT_PATTERN_DATA_SV
`define GUARD_SVT_OBJECT_PATTERN_DATA_SV

/** @cond SV_ONLY */
// =============================================================================
/**
 * Data object that stores an individual name/value pair, where the value is
 * an `SVT_DATA_TYPE instance.
 */
class svt_object_pattern_data extends svt_compound_pattern_data;

  // ****************************************************************************
  // GeneralTypes
  // ****************************************************************************

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Local Data
  // ****************************************************************************

  /** The object stored with this pattern data instance. */
  `SVT_DATA_TYPE obj;

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_object_pattern_data class.
   *
   * @param name The pattern data name.
   *
   * @param obj The pattern data object.
   *
   * @param array_ix Index associated with the object when the object is in an array.
   *
   * @param positive_match Indicates whether match (positive_match == 1) or
   * mismatch (positive_match == 0) is desired.
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
  extern function new(string name, `SVT_DATA_TYPE obj, int array_ix = 0, int positive_match = 1, string owner = "",
                      display_control_enum display_control = REL_DISP, how_enum display_how = REF, how_enum ownership_how = DEEP);

  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

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
  
endclass
/** @endcond */

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
WyS0TfLZDepB0dm/zXEYQI35w4RrSJJ6JKIZoCcUotUsF2d+rUzLxbl1Nk2QXMb8
9VR3i9ZcObx/rsMWqU9vYFkLV5ER1wUuIrcZPrNdeSwmXsnCxkRwmAaIo8TpQG9o
SH2zVqvuK14zvV8Y7hxBXBu30bqTP1HdQtw4fY22/fQ885f6lVmcfw==
//pragma protect end_key_block
//pragma protect digest_block
TUS0NTPihXIINZYWMOsdX5LO5w8=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
9HFzkLQ8+45oOicZ/aMNtdfdk0g=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_OBJECT_PATTERN_DATA_SV
