
`ifndef GUARD_SVT_SPI_FLASH_ADESTO_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_ADESTO_NONVOLATILE_CONFIGURATION_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP Adesto Nonvolatile configuration register class.
 *  This maintains teh copy of Non Volatile fields that can be stored/reload based
 *  on requirement.
 */
class svt_spi_flash_adesto_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Status Register. */
  bit [1:0] status_register_protect = 2'b01;

  bit sector_protect = 1'b0;

  bit top_bottom = 1'b0;

  bit [3:0] block_protect = 4'b0;

  bit complement_protect = 1'b0;

  bit [3:0] security_register_lock_bits = 1'b1;

  bit quad_enable = 1'b1;

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
  `svt_vmm_data_new(svt_spi_flash_adesto_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_flash_adesto_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_adesto_nonvolatile_configuration_register)
  `svt_data_member_end(svt_spi_flash_adesto_nonvolatile_configuration_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_adesto_nonvolatile_configuration_register.
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
  `vmm_typename(svt_spi_flash_adesto_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_flash_adesto_nonvolatile_configuration_register)
`endif

  // ---------------------------------------------------------------------------
  /**
   *
   */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
fzBd4hwyDfKOWNi71OFeBaTpII2q6GyPc1cCCEX9CqfLks3j+Dd9G6wIbroQz0ba
vVx2p1Bod5qr7NriOrYLtm6r2hbUyOa+bsEzkpXLxrKfpQzrJyGOsfUOLjHFonog
w35b/19UDD76fCvhZGQP2xTD77Jvzp81Zzt6IYii33iGLvGO2Azk6g==
//pragma protect end_key_block
//pragma protect digest_block
j12ASw4DlpS99yW0ptFlmPCuGpQ=
//pragma protect end_digest_block
//pragma protect data_block
SMMHDSpm1WsE1FiH4lUcE5Sucovy8MkeQqExzHOw55acLDtt/jmeOdLPZ6qq2qkh
imnexxujwWNDCFRjiyoEcjJ+1XEubg1wi1CG6NnvaYvMRcrnhlcxV4Lnmd0eb7Qp
CaJqaXWeMRv5XHYrxlGph6dTplr7bb2I4ZySId5/xnCJ+Kk4aQ0N2XtwGXTKkzS7
sIX7TGxl3WvYOGotkmIKpGgn9+8GDCNTvHRzrwpZ7Sxj+zMRN+UJIIkoMwyzsnjq
Rp1dOlK8oRhLWpcSaLaoYE1tGDdbdVyqYyZ/7b0n7uHNwCG/Y/BmIeh+ciBPXmgq
lnHBWjNC2oB5xqBpupRCxugAZUMt9eX0JSbspmPwVLPKPmlJ1123SP8iAHG08hRb
D21ctldPNjSoALS9XdQK1YM31J23VF6olMHD2ZNNXGm/nvP3vB5NaGJFGL3IsWX6
q3NtMmdvAdnedR8I3um24BOfnilBJJBBdVPlol06eR8XOI29bYCr0ft6pfb5WkZY
DMSeMJnD+RBruniEkRhEefmMXDjf6g7C847X3psLLHAn/5iPFaLomM1ih635e/Kh
xzX+TEy8PomDBCrlG7xQFFB2r47eV3MvG33H7pqOc4qwWD1J8XHCcOYChV4QFIr5
PVzD3FW3XCfcrWEeW1uFuDJjalt0z2vmNjfQiHfLmFV2341/LpSK5yfTylRPI441
IaABJiSa6IMK9hspcK59YdOQJlFTIbJ+2qcySddlSGCFUp+dd8hiR5OK9/swAkhu
r+V3oRgHRxQBFTQwpGSljRS6FEyqWstjK09KotzBRndwshOw6kADbvtfRElWZNqD
9WGpK4w9dfnDyK93O67YuWaFNN4ZT8U9+xvJ/4Dxp7uLBfgOxmSdBxh/Nb2eV4B+
LBEL0BLiqhn25euQSBAf66PdGvCwrM+L+XgdOspFxCdoNp4OCYqgJKIsOoxT8lYj
Dg0vs7hLP4UGqMQ2yMtBCJYUg/4VvxBxa+5Ratk0/JRKEBdVVsvjy1bjmpCcv2Tz
SWiliXxXkOifItZi5Jlzg4vDF97Gvw0KQ6wgyswZqGLVKC1lE4EORbX4WcbA7cC4
bmuuUHLgitt/9ffRJGINYVuPM0sbS+xOJ9ia66NsZTi+WMnl3zScuKMRlnEa9O+P
5JXJPXSRCtKqg4+ZcKHoGA==
//pragma protect end_data_block
//pragma protect digest_block
RuhaJgarqfze25hK9uDQilgCQvc=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
f4kkXOAxeoh3vXD/xxsYRb8U9pCxh6LJBfbCHyws7z2WFPn1hp0d3Strh+gW0atD
Br+tqTZjNsrb20tBW9qVY2na7bjdVV0cbao1ZXXkKaT24h8Z+KZv5BCQJcx0uyQ+
QI8I7s6l1RABYPe05luhxkNKyisc7GsijEvHcb3mWFmnkM3kz7rLGQ==
//pragma protect end_key_block
//pragma protect digest_block
D7jWhKl41XHss/prPIdmXtwQAvI=
//pragma protect end_digest_block
//pragma protect data_block
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
RkOFFiO4A0FuOtIBwTz4NA==
//pragma protect end_data_block
//pragma protect digest_block
Z5gtSoTOVYP6iWI8fLNC/p7PfoM=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_ADESTO_NONVOLATILE_CONFIGURATION_REGISTER_SV

