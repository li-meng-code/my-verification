
`ifndef GUARD_SVT_SPI_xSPI_REGISTER_FIELD_LIST_SV 
`define GUARD_SVT_SPI_xSPI_REGISTER_FIELD_LIST_SV
// =============================================================================
/**
 * This class specifies single register field of xSPI Register. <br/>
 * It encapsulates field name and its default value, supported field width, list of registers that contains this register field. <br/>
 * Member 'nonvolatile_reg_field' holds non volatile (if applicable) version <br/>
 * of this register field. <br/>
 *
 * Following register fields/variables are supported in generic registers: <br/>
 * <b> <font size="+2"> Field Name </font> <br/> </b>
 *  1. write_in_progress              : Device Busy/Read Status             <br/>
 *  2. write_enable_latch             : Device Write Enabled or not         <br/> 
 *  3. program_error                  : Device detected Program Error       <br/>
 *  4. erase_error                    : Device detected Erase Error         <br/>
 *  5. dummy_cycles                   : Sets Number of dummy clock cycles   <br/>
 *  6. quad_mode_enable               : Device QPI/Quad mode enables or not <br/>
 *  7. octal_mode_enable              : Device Octal mode enables or not    <br/>
 *  8. ddr_mode_select                : Device DDR mode enables or not      <br/>
 *  9. io_driver_strength             : Sets driver strength                <br/>
 */
class svt_spi_xSPI_register_field_list extends svt_configuration;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------
  
  /** This field specifies the register field name */
  string field_name = "";

  /** This field specifies the register field value */
  bit[`SVT_SPI_xSPI_MAX_REG_FIELD_WIDTH-1:0] field_value;
  
  /** This field specifies the width of the register field */
  int field_width = `SVT_SPI_xSPI_MAX_REG_FIELD_WIDTH;

  /** This field specifies the access type(Read Only, Read-Write) of the register field */
  svt_spi_types::xSPI_register_field_access_type_enum access_type = svt_spi_types::RD_WR;
  
  /** This field specifies the field type(Volatile, Non Volatile, OTP etc) of the register field */
  svt_spi_types::xSPI_register_field_type_enum field_type = svt_spi_types::VOLATILE;

  /** This object specifies the list registers, which contains the register field  */
  svt_spi_xSPI_reg_field_register_map register_map[];
  
  /** This object contains the non-volatile copy of register field  */
  svt_spi_xSPI_register_field_list nonvolatile_reg_field;
  
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
  `svt_vmm_data_new(svt_spi_xSPI_register_field_list)
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
  extern function new(string name = "svt_spi_xSPI_register_field_list");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_register_field_list)
    `svt_field_array_object(register_map, `SVT_ALL_ON|`SVT_NOPACK|`SVT_DEEP|`SVT_NOCOPY, `SVT_HOW_DEEP|`SVT_NOCOMPARE)
    `svt_field_object(nonvolatile_reg_field,`SVT_ALL_ON|`SVT_DEEP|`SVT_NOCOPY|`SVT_NOCOMPARE|`SVT_UVM_NOPACK, `SVT_HOW_DEEP)
  `svt_data_member_end(svt_spi_xSPI_register_field_list)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_xSPI_register_field_list.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

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
  `vmm_typename(svt_spi_xSPI_register_field_list)
  `vmm_class_factory(svt_spi_xSPI_register_field_list)
`endif

endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
QNRXLanNx+5znnGLSzNExq8JLc6/rb/NqdSYMXQ67QYfR5NjSPU8VFaJzCOMQc5c
ZVB0ew8MNMGurmFqLdCZFlYMOwDgFZt2yR4QavnY535F/eF2zxFvXyaFcMMHdwBl
N6h1rSYMaFzd63SxTDJTbv11F4pzO79hzfeUGC+dnjm/0E1MSykp3w==
//pragma protect end_key_block
//pragma protect digest_block
JlgyRpjdR8xSzucGrNHHZgIdbJ0=
//pragma protect end_digest_block
//pragma protect data_block
aIaOhIDNKjaoTpMvIGkhM/Ui18HeWHwbQOUxzWi8Uu9dyT98beJT9FAivfZG0fXL
v4iQ3912+/dXeyFdxRQpEIGuG5EpcaVpTvFK79Xuh2IB3CUUeRkI4w4MQuhrrUyB
p8RKoUcsxk5t+CnbxYtZbQXcRBXVs83hlULRPXUVaBrbwUgrb/uAFefH8065w/C+
Qe2R//3TAXN6h8uN6XcO5zE/MOhXHU4iU4r9Mja3vb9Yq1QFu+0L6ePCbIFx4/MK
Cjl+bWNtjrxS4yGP0VYry/EUe8o/z+VRSHCwgV98dBoem654iwlCsjxCi76Drbwb
JmeT5j48DsvQE0wxwf91bQLNi2Y0OeFb/dN9sTsygHgvj3I3jPDdSquRqF1Pyj00
2ALf0/nWcEy0tu6EFnwSV5+3BeaxUeIQTGN4mte8rySeX9EYZwNXhbkvLGmrtJcZ
PPzDXabePihun7BoAc9E3zkZ+QiJerPUTHKZKSf+dicHAB6X0rhHXY2kXdvoM3zI
CH9FLNmAU3dvgn94Y6WchbvUIFpMB/oM/8Wxv3oU1rqGqIcphKBe+HarSm2DlB3z
h9kIX1O/1PWG/sOvmRkGGFQcrn7q+5Oe/PUNTBOIe2Epem/F9uBCb8iil+qNTH9m
VrZZ5IFaY13BAANlP2ScgM91r30zIsKWqa1HAtBg/e/swDkki8lqo2683FzJ56Nl
fLSt4ktujj60HoCXC7h6EJ2SkbyxvctlwCPYDofznc3xSNJxk2wcrp+4OEOC8cOT
YsyJkBeS1Lo1GBa6zH6VDQ2nRSBPb1UThk9Drlu/lIBH0s08RBsWxXeZ1p+L07xa
GLDrw+V3bmK7PARHgJyU2WANvsOCpzK4EVWZrBPpo3Y0bQRXlCLv1PIRIg1y/PVQ
Aycvbc6Y1BbTh96LD7O+knTyQsm1QcaJBzkfKgZpAeNv+3GrYRt95/NYqSj89OVB
xUQvX+PSkDDEHz20MxxR6RRETjSzzmdjWbAqSo5X14WAgtTQ5eYtoONShfs6JleE
0lyoc+cVwn1/xUdjOOV42Rl6phjRPzIauRGNQwbG5Uo=
//pragma protect end_data_block
//pragma protect digest_block
/RK3mhxS7FUsdlAWFQJsigZ6YsI=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
iKaXWg48VeIml9Z/7v/KUf6pH32Fh2D5BYAVc8hw/q0V9A0oz2J+MOero4GTx8Xj
9bLerF5NkXYcsbDFQsNlRjb6fvwVylPeTXwzMvJa6bNkTL/9Wq2lEkn4cfchEWM1
Smfl3bk8ZFajOtx19q3XSbHPdctXnjJ3yDSgiRNlBR+JEvX924C+jA==
//pragma protect end_key_block
//pragma protect digest_block
2qKd11ooMpnfKpxMI0drt22lOkE=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
CLJVLYuUwlH3RzMrXE/wwgOVWfo=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_REGISTER_FIELD_LIST_SV

