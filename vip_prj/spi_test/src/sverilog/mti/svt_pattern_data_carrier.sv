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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
agX6OplFT9Om+I4kspVD5qPk2OOh2cD2yu/e1O6/Jdq5i7AwLzGFQnDB8QHIpTlK
uhsB0pWkAOb/w82vpulw9ZaLoXQo+w+B0OKnYwxb+PBSHiiiteIvT0dQitYxyE1F
q+XnT2cI9J/z928J56G/MHF3z3UfJGAo5zCHlAz9Yrs=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11665     )
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
zxfRcOoBtRAzNWxL39E/uw==
`pragma protect end_protected

`endif // GUARD_SVT_PATTERN_DATA_CARRIER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
oY1BGvPYSoMgv3RZ8jnDErZl0VFAlEaO2jI0dU2jlEchVEfGoxAHWlq/ggvHJizy
8YceZvDZ04BU/MVExmCOaStzADPbh0jW+8SX8NoQJixqaF/vTDYsV0n99GK1NHrQ
k+VEyVo6IkvPkT7x2vsx36428hyryTI0gVYYtb3MkSo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11748     )
1UoVNN0BCeCbIfROYw5pzGoM4LdJEqrWE4ljed+kh8iDqVmyAgWpoPReuSY2oKo2
+rSxkqNc4GRe00a3aQDP3BWYc0ZIzC0XjEHXFbQarXs9adQ+kZMaQXE5K8qqzNSt
`pragma protect end_protected
