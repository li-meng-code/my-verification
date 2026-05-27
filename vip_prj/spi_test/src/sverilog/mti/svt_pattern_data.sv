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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Y6Ob3/h6pXNwawuh/fl7VD5BSs+zceaIMenEyNDdL9bjMPtBdh8pOhESHHQAJtoh
VHttCTu9TGVZ+U2rmWBKqgSN+V+/uMcevsY14wyI0Dvb1r4LDPWpum2cbA0PnK58
V18Qlw5hptHBsvjm65AqZvpFnDAlrdUPpArdb2pVaTc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 8058      )
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
`pragma protect end_protected

`endif // GUARD_SVT_PATTERN_DATA_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
PZNCEy461F5rVgyaUbb7cAuq0eaqt+sIVhyO1doWEyfemMcoMuvYCtHuYBRZOyAS
b7Fn2DOXgF+N+irUIEdN7jz1LERjzDTTN3NAvxKssA53A9RT5E9zrZ33n1mPAinv
RbA++nfE+eoN3uYEMGIhFVofobMen1KUPCzUkHgLjSE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 8141      )
nx6C+zWN0ceqbLamf7z9Oo87fVSGtrZWVtSbSVeMk5lSLbsaTWTXL4GuKBNrUfcO
mp0XXUe+jKwe8I+BGtSgeT0jWJ7wJpk0ET4HWFNqC5FI3yAew3pWMhseP0abHzo0
`pragma protect end_protected
