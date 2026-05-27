
`ifndef GUARD_SVT_SPI_xSPI_REG_FIELD_REGISTER_MAP_SV 
`define GUARD_SVT_SPI_xSPI_REG_FIELD_REGISTER_MAP_SV
// =============================================================================
/**
 *  This class specifies xSPI register that holds mentioned register field.  <br/>
 *  A register field can be distributed in multiple registers. The valid
 *  locations for register field at register is specified through 'register_field_index' member <br/>
 */
class svt_spi_xSPI_reg_field_register_map extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** This filed specifies the name of the register which contains reg_field. */
  string register_name = "";

  /** Specifies list of 'Received Data' Index that are valid. */
  int valid_cmd_data_index[];  

  /** Specifies list of register field Index that gets updated with respective location of 'Received Data' specified by #valid_cmd_data_index. */
  int register_field_index[]; 

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_xSPI_reg_field_register_map)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new status instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new status instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the status.
   */
  extern function new(string name = "svt_spi_xSPI_reg_field_register_map");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_reg_field_register_map)
  `svt_data_member_end(svt_spi_xSPI_reg_field_register_map)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_xSPI_reg_field_register_map.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /**
   * Does a basic validation of this status object.
   *
   * @param silent bit indicating whether failures should result in warning messages.
   * @param kind This int indicates the type of is_avalid check to attempt. 
   */ 
  extern virtual function bit do_is_valid(bit silent = 1, int kind = RELEVANT);


`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Pack the dynamic objects and object queues as the default uvm_packer/ovm_packer
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_pack(`SVT_XVM(packer) packer);

  // ---------------------------------------------------------------------------
  /**
   * Unpack the dynamic objects and object queues as the default uvm_packer/ovm_packer
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_unpack(`SVT_XVM(packer) packer);
`endif

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation.
   *
   * @param kind This int indicates the type of byte_size being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in a size calculation based on the
   * non-static fields. All other kind values result in a return value of 0.
   */
  extern virtual function int unsigned byte_size(int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset, based on the
   * requested byte_pack kind.
   *
   * @param bytes Buffer that will contain the packed bytes at the end of the operation.
   * @param offset Offset into bytes where the packing is to begin.
   * @param kind This int indicates the type of byte_pack being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in all of the
   * non-static fields being packed and the return of an integer indicating the number of
   * packed bytes. All other kind values result in no change to the buffer contents, and a
   * return value of 0.
   */
  extern virtual function int unsigned do_byte_pack(ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Unpacks the object from the bytes buffer, beginning at offset, based on
   * the requested byte_unpack kind.
   *
   * @param bytes Buffer containing the bytes to be unpacked.
   * @param offset Offset into bytes where the unpacking is to begin.
   * @param len Number of bytes to be unpacked.
   * @param kind This int indicates the type of byte_unpack being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in all of the
   * non-static fields being unpacked and the return of an integer indicating the number of
   * unpacked bytes. All other kind values result in no change to the exception contents,
   * and a return value of 0.
   */
  extern virtual function int unsigned do_byte_unpack(const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1);
`endif

  //----------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow command
   * code to retrieve the value of a single named property of a data class derived from this
   * class. If the <b>prop_name</b> argument does not match a property of the class, or if the
   * <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1', with the value of the <b>prop_val</b>
   * argument assigned to the value of the specified property. However, If the property is a
   * sub-object, a reference to it is assigned to the <b>data_obj</b> (ref) argument.
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

  //----------------------------------------------------------------------------
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
   * Simple utility used to convert string property value representation into its
   * equivalent 'bit [1023:0]' property value representation. Extended to support
   * encoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort.
   *
   * @return The enum value corresponding to the desc.
   */
  extern virtual function bit encode_prop_val(string prop_name, string prop_val_string, ref bit [1023:0] prop_val,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  // ---------------------------------------------------------------------------
  /**
   * Simple utility used to convert 'bit [1023:0]' property value representation
   * into its equivalent string property value representation. Extended to support
   * decoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort.
   *
   * @return The enum value corresponding to the desc.
   */
  extern virtual function bit decode_prop_val(string prop_name, bit [1023:0] prop_val, ref string prop_val_string,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  //----------------------------------------------------------------------------
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the primitive data fields in the object. The svt_pattern_data::name
   * is set to the corresponding field name, the svt_pattern_data::value is set
   * to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern();

  // ---------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_xSPI_reg_field_register_map)
  `vmm_class_factory(svt_spi_xSPI_reg_field_register_map)
`endif

endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
XQgllyfpPgEoFw7szhIhfJGTZDI6q7TVHnKvOUYzzBNJCGtasTrty0feElYlQUVh
5s2CExl13I9Wn/cAFO9iARmNLac6rJnvFdgVfyPyncBTUj/bFgZXRlM3mQflqGnd
PdUcCw+dgXr+Y+tgBacfs5dOEJFSJcgdZ8ILXWLaFPf/ueKCG1YSRw==
//pragma protect end_key_block
//pragma protect digest_block
Tz1I0NmPR4vryavUQ1QE0oGTIQY=
//pragma protect end_digest_block
//pragma protect data_block
H78QWbsSL1Pybas+cP2sc966TGLyCMVHhSYizK/4F9WiIbeKMMnB56Pw204Nwqrw
Oov/rZIYZcnS5f6PSrN+0RHYJSbM2GfD/y+QRNNWfPKgHlJKusMxYeS+ZiUxzTeK
5KrjpcCAiVcV5Bp/vGP4+2SEzctuRo1Z2xI8ctKeEqb0chqwwlGycKzIFR7ItC2v
fQQv0z0bJCJJsVTWOdCIzfG8M1Xp7Qzgnfks6HGOJuhjJ5ysCH24H3kfreSvseoO
OKafsPRYcV8LnH6upzg7yuClZOZS3ip3UG2I36YVM8rP6BdZpwoWb9vl2VADaoDz
9kzR6AgYKu2RG8hOUqeRjT8CpdLDDhqf6O1k8eIRYhQLvZAmYHukOffxAppm8736
FkCOlDSX6Op81VH68/usLJqBC73MO14+L7v66+ItGJyxJEp/QkgZnpDsTDeMCyX7
I1DytV8RT2nZr7hghx6Shxg2m1rHQTfZ7w4SIy0NXeYI8H2Z3Id/XEmxOgDizE3z
eOlNrwCGPPh7SsECyaNM+MsUCSxFJGF5bZ2umK8oKcBUsNtQdlLTjcz/7P1GdSn+
UbzNUAHspumTQMQBDWfgYqd2Rx018ncnosHbXaSVqhUBwO6xqH/Hxm2eP8LkLfvf
sAe4w0Spf6QgWZG/NJkh6TZJFDck1cgvbx27wpX7WFxzj1liuMROd41K1eXhPQkc
rHfMZI9nKy+f5zEpdf35CTWKu8uBd67b9oqtejG+qSSYa33E19R3jtV50C5uqiiV
J87+jlY7TEeAghEEolxIqggwcEAx152IeZKEKIVToBz0BcJ/wDZTGy63jM8E3ymU
DDRDW1odoy1KQcwIgGsoa5OEKIB4LJZ2CHWyO4NBpftD/PIV+AfHfBzCmPVzWlxp
Cn1LJZaqqvyGlFWLO7OIwbkLeRsGKUAjMVTQqpmXWSYHdyamz+5AxdVX3e5ZFtsb
AODLflvsPiTdwyrH1SoeFaTgWjCSNO9osEsf7yi3hnJPfXlb10v/RPCU+iwUFqPA
8nquCYLEFBgzuCU5/KjR+RDVoJXLUtYu7zg4L8JJCqk=
//pragma protect end_data_block
//pragma protect digest_block
HNfUWreP1pO8k3XnCR8uTeVGqLI=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
ekB20sguY9l5PNmph2AEehnFTM2g2ofJ3bDYJXblm4nvqOFFKLsN64OT+bwT61Kx
dk6+g9zgIs+gO5lHqnDfTXEymvnz/cThOtuDunt5nwUUAVpSpN918QtPB+RdhZqf
bJ3q4uT4hR5eEuHxslCfBsHHKEz9U9Pr0O7SVtt9madSOJPQPybuuQ==
//pragma protect end_key_block
//pragma protect digest_block
BMBzY3NnlA4Kw7W4JxfS+4T0Wvk=
//pragma protect end_digest_block
//pragma protect data_block
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
9MoCTHYNsjTImWfpiQHgKg==
//pragma protect end_data_block
//pragma protect digest_block
wjR9dCPGdbAucDPzF3F1vBoxUb8=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_REG_FIELD_REGISTER_MAP_SV

