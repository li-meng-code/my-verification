//=======================================================================
// COPYRIGHT (C) 2015-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_PATTERN_DATA_CARRIER_SV
`define GUARD_SVT_PATTERN_DATA_CARRIER_SV

/** @cond SV_ONLY */
// =============================================================================
/**
 * The svt_pattern_data carrier is used to gather up properties so that they can
 * be acted upon as a group. 
 */
class svt_pattern_data_carrier extends `SVT_DATA_TYPE;

  // ****************************************************************************
  // GeneralTypes
  // ****************************************************************************

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /** The properties which have been stored in the carrier. */
  svt_pattern_data contents[$];

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_data)
  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_pattern_data_carrier class.
   *
   * @param log A vmm_log object reference used to replace the default internal logger.
   * @param field_desc Shorthand description of the fields to be created in the carrier.
   */
  extern function new(vmm_log log = null, svt_pattern_data::create_struct field_desc[$] = '{});
`else
  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_pattern_data_carrier class.
   *
   * @param name Instance name for this object
   * @param field_desc Shorthand description of the fields to be created in the carrier.
   */
  extern function new(string name = "svt_pattern_data_carrier_inst", svt_pattern_data::create_struct field_desc[$] = '{});
`endif

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
  `svt_data_member_begin(svt_pattern_data_carrier)
  `svt_data_member_end(svt_pattern_data_carrier)

  // ---------------------------------------------------------------------------
  /** Returns the name of this class, or a class derived from this class. */
  extern virtual function string get_class_name();
  
  // ---------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow command
   * code to retrieve the value of a single named property of a data class derived from this
   * class. If the <b>prop_name</b> argument does not match a property of the class, or if the
   * <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1', with the value of the <b>prop_val</b>
   * argument assigned to the value of the specified property. However, If the property is a
   * sub-object, a reference to it is assigned to the <b>data_obj</b> (ref) argument.
   * In that case, the <b>prop_val</b> argument is meaningless. The component will then
   * store the data object reference in its temporary data object array,
   * and return a handle to its location as the <b>prop_val</b> argument of the <b>get_data_prop</b>
   * task of the component. The command testbench code must then use <i>that</i>
   * handle to access the properties of the sub-object.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_val A <i>ref</i> argument used to return the current value of the property,
   * expressed as a 1024 bit quantity. When returning a string value each character
   * requires 8 bits so returned strings must be 128 characters or less.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @param data_obj If the property is not a sub-object, this argument is assigned to
   * <i>null</i>. If the property is a sub-object, a reference to it is assigned to
   * this (ref) argument. In that case, the <b>prop_val</b> argument is meaningless.
   * The component will then store the data object reference in its temporary data object array,
   * and return a handle to its location as the <b>prop_val</b> argument of the <b>get_data_prop</b>
   * task of the component. The command testbench code must then use <i>that</i>
   * handle to access the properties of the sub-object.
   * @return A single bit representing whether or not a valid property was retrieved.
   */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  // ---------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow
   * command code to set the value of a single named property of a data class derived from
   * this class. This method cannot be used to set the value of a sub-object, since sub-object
   * construction is taken care of automatically by the command interface. If the <b>prop_name</b>
   * argument does not match a property of the class, or it matches a sub-object of the class,
   * or if the <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1'.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_val The value to assign to the property, expressed as a 1024 bit quantity.
   * When assigning a string value each character requires 8 bits so assigned strings must
   * be 128 characters or less.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @return A single bit representing whether or not a valid property was set.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);

  // ---------------------------------------------------------------------------
  /**
   * Method to assign multiple values to the corresponding named properties included
   * in the carrier.
   *
   * @param prop_desc Shorthand description of the fields to be modified.
   * @return A single bit representing whether or not the indicated properties were set successfully.
   */
   extern virtual function bit set_multiple_prop_vals(svt_pattern_data::get_set_struct prop_desc[$]);

  // ---------------------------------------------------------------------------
  /**
   * This method allows clients to assign an object to a single named property included
   * in the carrier's contents.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_obj The object to assign to the property, expressed as `SVT_DATA_TYPE instance.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @return A single bit representing whether or not a valid property was set.
   */
  extern virtual function bit set_prop_object(string prop_name, `SVT_DATA_TYPE prop_obj, int array_ix);

  // ---------------------------------------------------------------------------
  /**
   * Since for do_allocate_pattern this class simply returns its own contents
   * field the expectation is that this will be processing a pattern made up of the
   * original carrier contents. Implying that it already has the values.
   *
   * If a simple check validates this to be the case, this method basically just
   * returns as the values are already contained in contents.
   *
   * If the check indicates there are differences with contents then this
   * implementation simply calls the super to let it load up the values.
   *
   * @param pttrn Pattern to be loaded from the data object.
   *
   * @return Success (1) or failure (0) of the get operation.
   */
  extern virtual function bit get_prop_val_via_pattern(ref svt_pattern pttrn);

  // ---------------------------------------------------------------------------
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the primitive data fields in the object.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern();

  // ---------------------------------------------------------------------------
  /**
   * This method modifies the object with the provided updates and then writes
   * the resulting property values associated with the data object to an
   * FSDB file.
   * 
   * @param inst_name The full instance path of the component that is writing the object to FSDB
   * @param parent_object_uid Unique ID of the parent object
   * @param update_desc Shorthand description of the primitive fields to be updated in the carrier.
   *
   * @return Indicates success (1) or failure (0) of the save.
   */
  extern virtual function bit update_save_prop_vals_to_fsdb(string inst_name,
                                                     string parent_object_uid = "",
                                                     svt_pattern_data::get_set_struct update_desc[$] = '{});

  // ****************************************************************************
  // Pattern/Prop Utilities
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
   * @param array_ix Index associated with the value when the value is in an array.
   *
   * @param typ Type portion of the new name/value pair.
   */
  extern virtual function void add_prop(string name, bit [1023:0] value = 0, int array_ix = 0,
                                        svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  // ---------------------------------------------------------------------------
  /**
   * Method to add multiple new name/value pairs to the current set of name/value pairs
   * included in the pattern.
   *
   * @param field_desc Shorthand description of the fields to be created in the carrier.
   */
  extern virtual function void add_multiple_props(svt_pattern_data::create_struct field_desc[$]);

  // ---------------------------------------------------------------------------
  /**
   * Utility method for adding simple supplemental data to an individual property.
   *
   * @param prop_name Name of the property that is to get the supplemental data.
   * @param name Name portion of the new name/value pair.
   * @param value Value portion of the new name/value pair.
   * @param typ Type portion of the new name/value pair.
   */
  extern virtual function void add_supp_data(string prop_name, string name, bit [1023:0] value, svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  // ---------------------------------------------------------------------------
  /**
   * Utility method for accessing supplemental data on an individual property.
   *
   * @param prop_name Name of the property to be accessed.
   * @param name Name of the supplemental data whose value is to be retrieved.
   * @param value Retrieved value.
   * @return Indicates whether the named supplemental data was found (1) or not found (0). This also indicates whether the 'value' is valid.
   */
  extern virtual function bit get_supp_data_value(string prop_name, string name, ref bit [1023:0] value);

  // ---------------------------------------------------------------------------
  /**
   * Utility method for adding string supplemental data to an individual property.
   *
   * @param prop_name Name of the property that is to get the supplemental data.
   * @param name Name portion of the new name/value pair.
   * @param value Supplemental string value.
   */
  extern virtual function void add_supp_string(string prop_name, string name, string value);

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
EGa0tMAcKEdYxEkBfOeBdnkDrAn3Yva/7siKyYdOiY8xCM+EBkWsVta79D/JpmPr
JpF8ieOFN9aPuNujQ7xMXvRBwsJDg1dHikJnTsdBvoG2c2MBqcYo3zvkeJNMhuHa
J9lTUHsAN8nvWXXNtiElITrNl7DKmeq1AvCUxlaZrrhnnsdCO4TbEQ==
//pragma protect end_key_block
//pragma protect digest_block
T4HomV3UL7PAvk56f6h5Hx5Hrso=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
xCK9zfotpt6CyYN53mR2lPyjn+Y=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_PATTERN_DATA_CARRIER_SV
