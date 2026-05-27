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

`ifndef GUARD_SVT_PATTERN_SV
`define GUARD_SVT_PATTERN_SV

/** @cond SV_ONLY */
// =============================================================================
/**
 * Simple data object for describing patterns as name/value pairs along with
 * match characteristics. In addition to the name/value information this includes
 *  - match_min and match_max
 *    - Used to define whether the match should repeat
 *    - Typical matches:
 *      - If match_min == 1 and match_max == 1 then the match must occur once and
 *        only once
 *      - If match_min == 0 and match == n for some positive n then the match
 *        is expected to occur for "up to n" contiguous instances.
 *      .
 *    .
 *  - positive_match (pattern_data)
 *    - Stored with each name/value pair this indicates whether the individual
 *      name/value pair defines a match or mismatch request.
 *    .
 *  - positive_match (pattern)
 *    - Stored with the pattern, indicating whether the overall pattern defines
 *      a match or mismatch request.
 *    .
 *  - gap_pattern
 *    - Patterns can sometimes need to describe non-contiguous sequences. In
 *      these situations the non-contiguous nature of the match must be
 *      described by defining the gaps between the desired match elements.
 *      Each gap is itself stored as a pattern, but with the gap_pattern flag
 *      set. When set to true the pattern is used to do the match, but is not
 *      stored in the match results.
 *    .
 *  .
 */
class svt_pattern;

  // ****************************************************************************
  // GeneralTypes
  // ****************************************************************************

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /** Pattern contents, consisting of multiple name/value pairs, stored as a svt_pattern_data. */
  svt_pattern_data contents[$];

  /** The minimum number of times this pattern must match. */
  int match_min = 1;

  /** The maximum number of times this pattern must match. */
  int match_max = 1;

  /** Indicates whether this is part of the basic pattern or part of a gap within the pattern. */
  bit gap_pattern = 0;

  /**
   * Indicates whether the pattern should be the same as (positive_match = 1)
   * or different from (positive_match = 0) the actual svt_data values when the
   * pattern match occurs.
   */
  bit positive_match = 1;

  /**
   * Flag that indicates that the pattern values have been populated.
   */
  bit populated = 0;

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_pattern class.
   *
   * @param gap_pattern Indicates if this is part of the pattern or a gap within the pattern.
   *
   * @param match_min The minimum number of times this pattern must match.
   *
   * @param match_max The maximum number of times this pattern must match.
   *
   * @param positive_match Indicates whether entire pattern match (positive_match == 1) or
   * mismatch (positive_match == 0) is desired.
   */
  extern function new(bit gap_pattern = 0, int match_min = 1, int match_max = 1, bit positive_match = 1);

  // ---------------------------------------------------------------------------
  /**
   * Displays the contents of the object to a string. Each line of the
   * generated output is preceded by <i>prefix</i>.
   *
   * @param prefix String which specifies a prefix to put at the beginning of
   * each line of output.
   */
  extern virtual function string psdisplay(string prefix = "");
  
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of same type.
   *
   * @return Returns a newly allocated svt_pattern instance.
   */
  extern virtual function svt_pattern allocate ();

  // ---------------------------------------------------------------------------
  /**
   * Copies the object into to, allocating if necessay.
   *
   * @param to svt_pattern object is the destination of the copy. If not provided,
   * copy method will use the allocate() method to create an object of the
   * necessary type.
   */
  extern virtual function svt_pattern copy(svt_pattern to = null);
  
  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * Method to add a new name/value pair to the current set of name/value pairs
   * included in the pattern.
   *
   * @param name Name portion of the new name/value pair.
   *
   * @param value Value portion of the new name/value pair.
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
  extern virtual function void add_prop(string name, bit [1023:0] value, int array_ix = 0, bit positive_match = 1, svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF,
                                        string owner = "", svt_pattern_data::display_control_enum display_control = svt_pattern_data::REL_DISP,
                                        svt_pattern_data::how_enum display_how = svt_pattern_data::REF, svt_pattern_data::how_enum ownership_how = svt_pattern_data::DEEP);

  // ---------------------------------------------------------------------------
  /**
   * Specialized method for adding an bit name/value pair to the current set of name/value pairs
   * included in the pattern.
   *
   * @param name Name portion of the new name/value pair.
   * @param value Value portion of the new name/value pair.
   */
  extern virtual function void add_bit_prop(string name, bit value);

  // ---------------------------------------------------------------------------
  /**
   * Specialized method for adding an bitvec name/value pair to the current set of name/value pairs
   * included in the pattern.
   *
   * @param name Name portion of the new name/value pair.
   * @param value Value portion of the new name/value pair.
   * @param field_width Field bit width used by common data class operations. 0 indicates "not set".
   */
  extern virtual function void add_bitvec_prop(string name, bit [1023:0] value, int unsigned field_width = 0);

  // ---------------------------------------------------------------------------
  /**
   * Specialized method for adding an int name/value pair to the current set of name/value pairs
   * included in the pattern.
   *
   * @param name Name portion of the new name/value pair.
   * @param value Value portion of the new name/value pair.
   */
  extern virtual function void add_int_prop(string name, int value);

  // ---------------------------------------------------------------------------
  /**
   * Specialized method for adding a real name/value pair to the current set of name/value pairs
   * included in the pattern.
   *
   * @param name Name portion of the new name/value pair.
   * @param value Value portion of the new name/value pair.
   */
  extern virtual function void add_real_prop(string name, real value);

  // ---------------------------------------------------------------------------
  /**
   * Specialized method for adding a realtime name/value pair to the current set of name/value pairs
   * included in the pattern.
   *
   * @param name Name portion of the new name/value pair.
   * @param value Value portion of the new name/value pair.
   */
  extern virtual function void add_realtime_prop(string name, realtime value);

  // ---------------------------------------------------------------------------
  /**
   * Specialized method for adding a time name/value pair to the current set of name/value pairs
   * included in the pattern.
   *
   * @param name Name portion of the new name/value pair.
   * @param value Value portion of the new name/value pair.
   */
  extern virtual function void add_time_prop(string name, time value);

  // ---------------------------------------------------------------------------
  /**
   * Specialized method for adding a string name/value pair to the current set of name/value pairs
   * included in the pattern.
   *
   * @param name Name portion of the new name/value pair.
   * @param value Value portion of the new name/value pair.
   */
  extern virtual function void add_string_prop(string name, string value);

  // ---------------------------------------------------------------------------
  /**
   * Method to add a new name/value pair to the current set of name/value pairs
   * included in the pattern specifically for adding information about display
   * properties.
   *
   * @param name Name portion of the new attribute.
   * @param title Title portion of the attribute.
   * @param width Witdh of the attribute.
   *
   * @param alignment Type portion of the new name/value pair.
   */
  extern virtual function void add_disp_prop(string name, string title, int width, 
                                             svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF,
                                             svt_pattern_data::align_enum alignment = svt_pattern_data::LEFT);

  // ---------------------------------------------------------------------------
  /**
   * Method to copy an existing property data instance and add it to this pattern.
   *
   * @param src_pttrn Source pattern to be used to find the desired property data.
   * @param name Indicates the name of the property data instance to be found.
   *
   * @return Indicates success (1) or failure (0) of the add.
   */
  extern virtual function bit add_prop_copy(svt_pattern src_pttrn, string name);

  // ---------------------------------------------------------------------------
  /**
   * Method to copy an existing property data instance and add it to this pattern,
   * but with a new value.
   *
   * @param src_pttrn Source pattern to be used to find the desired property data.
   * @param name Indicates the name of the property data instance to be found.
   * @param value Value to be placed in the property data.
   *
   * @return Indicates success (1) or failure (0) of the add.
   */
  extern virtual function bit add_prop_copy_w_value(svt_pattern src_pttrn, string name, bit [1023:0] value);

  // ---------------------------------------------------------------------------
  /**
   * Utility method provided to simplify trimming a pattern down based on a
   * specific keyword.
   *
   * @param keyword The keyword to look for.
   * @param keyword_match Indicates whether the elements left in the pattern
   * should be those that match (1) or do not match (0) the keyword.
   */
  extern virtual function void keyword_filter(string keyword, bit keyword_match);

  // ---------------------------------------------------------------------------
  /**
   * Finds the indicated pattern data.
   *
   * @param name Name attribute of the pattern data element to find.
   *
   * @return Requested pattern data instance.
   */
  extern virtual function svt_pattern_data find_pattern_data(string name);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for returning value as a real. Only valid if the field is of type REAL.
   *
   * @param name Name attribute of the pattern data element to access.
   * @param array_ix Index into value when value is an array.
   *
   * @return The real value.
   */
  extern virtual function real get_real_val(string name, int array_ix = 0);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for returning value as a realtime. Only valid if the field is of type REALTIME.
   *
   * @param name Name attribute of the pattern data element to access.
   * @param array_ix Index into value when value is an array.
   *
   * @return The real value.
   */
  extern virtual function realtime get_realtime_val(string name, int array_ix = 0);

  // ---------------------------------------------------------------------------
  /**
   * Utility method for returning value as a string. Only valid if the field is of type STRING.
   *
   * @param name Name attribute of the pattern data element to access.
   * @param array_ix Index into value when value is an array.
   *
   * @return The string value.
   */
  extern virtual function string get_string_val(string name, int array_ix = 0);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for returning value as a bit vector. Valid for fields which are not of
   * type OBJECT or GRAPHIC.
   *
   * @param name Name attribute of the pattern data element to access.
   * @param array_ix Index into value when value is an array.
   *
   * @return The bit vector value.
   */
  extern virtual function bit [1023:0] get_any_val(string name, int array_ix = 0);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for setting a real field value. Only valid if the field is of type REAL.
   *
   * @param name Name attribute of the pattern data element to access.
   * @param array_ix Index into value when value is an array.
   * @param value The real value.
   */
  extern virtual function void set_real_val(string name, int array_ix = 0, real value);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for setting a realtime field value. Only valid if the field is of type REALTIME.
   *
   * @param name Name attribute of the pattern data element to access.
   * @param array_ix Index into value when value is an array.
   * @param value The realtime value.
   */
  extern virtual function void set_realtime_val(string name, int array_ix = 0, realtime value);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for setting a string field value. Only valid if the field is of type STRING.
   *
   * @param name Name attribute of the pattern data element to access.
   * @param array_ix Index into value when value is an array.
   * @param value The string value.
   */
  extern virtual function void set_string_val(string name, int array_ix = 0, string value);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for setting a field value using a bit vector. Only valid if the fields which are not of
   * type OBJECT or GRAPHIC.
   *
   * @param name Name attribute of the pattern data element to access.
   * @param array_ix Index into value when value is an array.
   * @param value The bit vector value.
   */
  extern virtual function void set_any_val(string name, int array_ix = 0, bit [1023:0] value);
  
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
fJ+DK4O9m0F3giYQg3bjtdNoj/5h0fnviMIT/ZjAT5hXCVF/KS/74vl3t0pH6XGW
9vtmF44PozEOinnKrYo7e1P1T+ljJynh9rI0HcKByN0icz9vSOGsTv/xfO9EjhTv
zostk4MqavU0jIzAaJAPsZqhFzSpF7Uc0j511xbCapA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 12540     )
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
bM4DOhPUweK3MHyFC+2i0w==
`pragma protect end_protected

`endif // GUARD_SVT_PATTERN_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ICsyymzGiJOPreDUBYT5GvKU/jers3YgLhPwB3dd4XPnhuijJlnpRjJNxPV0n/FP
csos1IcEtKsNWhSMymjNiC5+kDkpsBHf+wgChNoZNaYBoce5RZBrIe+YheYEInRr
x55DD0BBHMhhrF+p8EBVOJX1ovzy91zp3BfmDvVKW3E=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 12623     )
UZlg7PsWCpLw1fXg47/k3KCus7HLGvLRKbvc6IK6XTLcddyrdDduNePw4cEj8MyO
Cb2qQRhGKsyrOI6x8inlczrqxo7aBugw+jABcpgreCI0VMkgR9SEKLUAS12L0bdD
`pragma protect end_protected
