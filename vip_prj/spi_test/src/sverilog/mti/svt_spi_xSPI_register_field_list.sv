
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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
JFjUGQWhDjGr7P6odlH60d9Gn7SeQRvlsPEHtGauGb/f626J3VmGHhKJXDlaCLpH
aG9GM4ZhjVqkgemsVJ2YZr+2qowABwCQdqXsDqcwu+w0iowRuLXcOxYHInfSgkXL
hLy+ofKxCsI5K73hszAOKWTxBkXj7BbNXtoTc4AoLHA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 622       )
Tj6EFbI/0y28yWIANrAxdHFVA4nQ8fdEpb6rlrHsbY05opsPooPO+0kPN2BVeke1
ODgCXFMS58yCkjDKoE47B2X4fOnxyaOXSFrz3Krw6VTVsRl55XR7Kfj5p1Uf6KSM
PXN0nIVqKBwht1l3EZYMohkls0PJ3B4jj94IYZt03e20+5hm4mr0xsIs1uW1qbLj
9CmNmzpFJxRcDwJEayx0W/eOXRUgcr9yImRs31D8kEAjhWEh0r4DUc/jGA+0Nito
0TOfrK//3JykAt0Gxe2/33gQAQaF9+DZUivhs/y+skOm6gxbZcgRadqIMNrO+WHC
TS94AdQldJjKfwd4H96sptX+aoLrkvAZy4S+SY1YwghAdbSOXXQyto4t6CB9CCBt
bu4+XGZD13vobQK7QSQkkQ9PhuSD3PWSlm8E20CqzzFxu7cm6MeUpygdS0rm6Ng9
kO3awZitPJyqI88rfJYtIeEoA/D/1DFitTswM9orVcM+ecUCiiVROfpzmmTFY39G
Znxo39BL7Hq9AcROfP9jC/TCPhpwNbfTLCHEfraERNngc63uJi98zDNJRRzEwt+G
KZqxtJ4jKF0hXUTkZD1fOA5mA5z15xRXQ3AuOnRGDC7ix6W/E41sr3ynL6+V38cO
+QBGDNh6RSZRXufqqKsjyWOt4BAx3Csu7oPjWq3LlAKSktCKs+JljrYyMVE4FOtT
rBDZikI9jNi2Dl+GAc43OlkooQbkJ5Y49duJSiyBF+BLFcFY9IHzoSLTRz0cUhu1
RDBwj6CJEc2Ctj3Gtxsdcnd6Jox0aHRmNGZRc3s+5/VScdGVTh4ojd7hDvoOAKhr
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
TbpfchU7KXPsXAvFnJBY5SWRkgVtb4HQbooMjd42CHKYgpJoTWTy38f8WGwAbh0a
MCIAzcIdEP9Nli9rXomxQ24DP0Qj34y5wUOSG2foTMBCL8Ne155FVnzWG725NTMZ
5cPhYNxRHgFeIuXsyq+eWp48p6pVXFP6ExZYgMEWS2A=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 13676     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_REGISTER_FIELD_LIST_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
NI9mDx2IdJTKnb1EF0JD8ot34vF913MzhtEfbvFSsZlYJ77eny8mU1jEqozhhu1a
9U65Nxv3cnjRCIwCwmWit5T3XrZl+q1e44KcNcOWt8vCptxqpP5dJZ49HZEvAeay
n2zkwMneeKUg+banwW7vO3wVthVQlpkseaFULSduhMU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 13759     )
RKLeFssiPfM9nZac6vK28pGfBLzrlpsNjBNedSnaQaBRizx1WB/mx27D2XhD8qBF
V3UN5OgT8hYFGwp11G2HekLP6atjelsDn8pXVcwz7O7mr8P7aVl2z6mEdJ4rZV4D
`pragma protect end_protected
