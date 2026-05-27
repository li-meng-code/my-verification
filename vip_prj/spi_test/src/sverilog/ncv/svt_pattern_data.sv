//=======================================================================
// COPYRIGHT (C) 2009-2015 SYNOPSYS INC.
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

`ifndef GUARD_SVT_PATTERN_DATA_SV
`define GUARD_SVT_PATTERN_DATA_SV

/** @cond SV_ONLY */
// =============================================================================
/**
 * Data object that stores an individual name/value pair.
 */
class svt_pattern_data;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  /** Property type lables used when building the pattern data structure. */
  typedef enum {
    UNDEF,      /**< Unknown or undefined data type */
    BIT,        /**< Data corresponds to a bit value */
    BITVEC,     /**< Data corresponds to a bit vector value */
    INT,        /**< Data corresponds to an int value */
    REAL,       /**< Data corresponds to a real value */
    REALTIME,   /**< Data corresponds to a realtime value */
    TIME,       /**< Data corresponds to a time value */
    STRING,     /**< Data corresponds to a string value */
    ENUM,       /**< Data corresponds to an enum value */
    OBJECT,     /**< Data corresponds to an object */
    GRAPHIC     /**< Data corresponds to an graphic element, used for display */
  } type_enum;

  /**
   * Display control used by the automated SVT shorthand display routines
   * to recognize whether an individual field should be displayed as part
   * of the current request.
   */
  typedef enum {
    REL_DISP,  /**< Indicates field display for RELEVANT and COMPLETE display requests */
    COMP_DISP  /**< Indicates field display solely for COMPLETE display requests */
  } display_control_enum;

  /** Depth used for the SVT shorthand routines */
  typedef enum {
    NONE,  /**< Never work with the object reference (e.g., Never display it) */
    REF,   /**< Only work with the object reference (e.g., Only display whether the object is null or not) */
    DEEP   /**< Work with the entire object (e.g., Perform a deep display) or the evaluated (e.g., based on accessing the calculated 'get_<field>_val' value) value */
  } how_enum;

  /** Types of alignment during display */
  typedef enum {
    LEFT,    /**< Left aligned */
    RIGHT,   /**< Right aligned */
    CENTER   /**< Center aligned */
  } align_enum;

  // ****************************************************************************
  // General Types
  // ****************************************************************************

  /**
   * Simple struct that can be used to convey the basic 'create' elements of
   * a pattern_data instance.
   */
  typedef struct {
    string name;
    type_enum typ;
  } create_struct;

  /**
   * Simple struct that can be used to convey the basic 'set' or 'get' elements
   * of a svt_pattern_data instance.
   */
  typedef struct {
    string name;
    bit [1023:0] value;
  } get_set_struct;

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /** The pattern data name. */
  string name;

  /** The pattern data value. */
  bit [1023:0] value;

  /** The pattern array_ix. */
  int array_ix;

  /** Property type */
  type_enum typ;

  /** Class name where the property is defined */
  string owner;

  /** Display control */
  display_control_enum display_control;

  /** Display depth */
  how_enum display_how;

  /** Object access depth */
  how_enum ownership_how;

  /** Title used in short display. */
  string title;

  /** Alignment used in short display. */
  align_enum alignment;

  /** Width used in short display. */
  int width;

  /** Field bit width used by common data class operations. 0 indicates "not set". */
  int unsigned field_width = 0;

  /** Type string which can be used in enumerated operrations. Empty string indicates "not set". */
  string enum_type = "";

  /**
   * Flag indicating which common data class operations are to be supported
   * automatically for this field. 0 indicates "not set".
   */
  int unsigned supported_methods_flag = 0;

  /**
   * Indicates whether the name/value pairs should be the same as (positive_match = 1)
   * or different from (positive_match = 0) the actual svt_data values when the
   * pattern match occurs.
   */
  bit positive_match = 1;

  /** Additional situational keywords */
  string keywords[$];

  /** Supplemental data about this pattern_data instance, potentially situational. */
  svt_pattern_data supp_data[$];

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_pattern_data class.
   *
   * @param name The pattern data name.
   *
   * @param value The pattern data value.
   *
   * @param array_ix Index associated with the value when the value is in an array.
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
  extern function new(string name, bit [1023:0] value, int array_ix = 0, int positive_match = 1, type_enum typ = UNDEF, string owner = "", display_control_enum display_control = REL_DISP, how_enum display_how = REF, how_enum ownership_how = DEEP);

  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

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
   * Method to do the value match, taking into account positive_match.
   *
   * @param match_value The value that should be matched against.
   *
   * @param is_found_value Indicates whether the match_value is real, representing
   * a found value, or if the field could not be found. If is_found_value == 0, then
   * the success of the match relies entirely on whether we are doing a positive
   * or negative match. In this situation a positive match will always return
   * 0, a negative match will always return 1. If is_found_value == 1, then
   * the success of the match relies entirely on whether the match_value compares
   * with this.value.
   *
   * @return Indication of whether the value match passed (1) or failed (0).
   */
  extern virtual function bit match(bit [1023:0] match_value, bit is_found_value);

  // ---------------------------------------------------------------------------
  /**
   * Method to look for a specific keyword in the keyword list.
   *
   * @param keyword The keyword to look for.
   *
   * @return Indication of whether the keyword was found (1) or not (0).
   */
  extern virtual function bit has_keyword(string keyword);

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
   * @return The real value.
   */
  extern virtual function real get_real_val();
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for returning value as a realtime. Only valid if the field is of type REALTIME.
   *
   * @return The real value.
   */
  extern virtual function realtime get_realtime_val();

  // ---------------------------------------------------------------------------
  /**
   * Utility method for returning value as a time. Only valid if the field is of type TIME.
   *
   * @return The real value.
   */
  extern virtual function time get_time_val();

  // ---------------------------------------------------------------------------
  /**
   * Utility method for returning value as a string. Only valid if the field is of type STRING.
   *
   * @return The string value.
   */
  extern virtual function string get_string_val();
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for returning value as a bit vector. Valid for fields which are not of
   * type OBJECT or GRAPHIC.
   *
   * @return The bit vector value.
   */
  extern virtual function bit [1023:0] get_any_val();
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for setting a real field value. Only valid if the field is of type REAL.
   *
   * @param value The real value.
   */
  extern virtual function void set_real_val(real value);

  // ---------------------------------------------------------------------------
  /**
   * Utility method for setting a real field value. Only valid if the field is of type REALTIME.
   *
   * @param value The real value.
   */
  extern virtual function void set_realtime_val(realtime value);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for setting a string field value. Only valid if the field is of type STRING.
   *
   * @param value The string value.
   */
  extern virtual function void set_string_val(string value);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for setting a field value using a bit vector. Only valid if the fields which are not of
   * type OBJECT or GRAPHIC.
   *
   * @param value The bit vector value.
   */
  extern virtual function void set_any_val(bit [1023:0] value);
  
  // ---------------------------------------------------------------------------
  /**
   * Utility method for adding simple supplemental data.
   *
   * @param name Name portion of the new name/value pair.
   * @param value Value portion of the new name/value pair.
   * @param typ Type portion of the new name/value pair.
   */
  extern virtual function void add_supp_data(string name, bit [1023:0] value, svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  // ---------------------------------------------------------------------------
  /**
   * Utility method for adding string supplemental data to an individual property.
   *
   * @param name Name portion of the new name/value pair.
   * @param value Supplemental string value.
   */
  extern virtual function void add_supp_string(string name, string value);

  // ---------------------------------------------------------------------------
  /**
   * Utility method for accessing supplemental data.
   *
   * @param name Name of the supplemental data whose value is to be retrieved.
   * @param value Retrieved value.
   * @return Indicates whether the named supplemental data was found (1) or not found (0). This also indicates whether the 'value' is valid.
   */
  extern virtual function bit get_supp_data_value(string name, ref bit [1023:0] value);

  // ---------------------------------------------------------------------------
  /**
   * Utility method for accessing supplemental data as a string. Only valid if the supplemental data is of type STRING.
   *
   * @param name Name of the supplemental data whose value is to be retrieved.
   * @param value Retrieved string value.
   * @return Indicates whether named supplemental data of type string was found (1) or not (0).
   */
  extern virtual function bit get_supp_string(string name, ref string value);
  
  // ---------------------------------------------------------------------------
endclass
/** @endcond */

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
NWOOp6mmU91yvyKosN7DZ0KWO8VuWu580ZS5v3REUjV4i9DJuUs82WdMDysC+eto
xhd5fnwRKmQ522c8NsvwCo427l09nwPS8Lc4HFUKXVgEUn61gY6+YYhA+TlICL+M
lFS/LM7HgcJwlOINP7IJscHCm24qpDDOYZQEWFF8HZcGRv2N0mrhNA==
//pragma protect end_key_block
//pragma protect digest_block
pD+aJzv0pIKOubyAw3r6YWEJEK0=
//pragma protect end_digest_block
//pragma protect data_block
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
d0GGY8JamNAjkQ2lvYAaZA==
//pragma protect end_data_block
//pragma protect digest_block
9Gm/i0vthxS3PYPKgTP/sm+VLCs=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_PATTERN_DATA_SV
