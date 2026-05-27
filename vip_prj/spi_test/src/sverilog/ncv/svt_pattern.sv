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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
vGdPxicJ0wGZaPtFC6ylNveAaPlWjCFz2n2Zoec0uRVwx6kGYkrm9KTWniqCm4oK
RPSTZAXHTQYvhq0BePFdUOF2TivhbAHWj3ub4ja+18dOCUTfpAzDm+2J9egO/Zzr
u4IyQSUVABeIQwCbYImcCtacn4WxYDWohzu6OZ+peRl0flZhY2yv2A==
//pragma protect end_key_block
//pragma protect digest_block
5c5aGmvz9fRRH2LdJAhJDNpvVVE=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
MAcKK/20G3FHDLrT515dPomIM58=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_PATTERN_SV
