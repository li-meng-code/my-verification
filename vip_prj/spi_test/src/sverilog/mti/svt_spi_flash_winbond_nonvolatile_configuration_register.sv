
`ifndef GUARD_SVT_SPI_FLASH_WINBOND_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_WINBOND_NONVOLATILE_CONFIGURATION_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP Winbond Nonvolatile configuration register class.
 *  This maintains teh copy of Non Volatile fields that can be stored/reload based
 *  on requirement.
 */
class svt_spi_flash_winbond_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Status Register. */
  bit [1:0] status_register_protect = 2'b01;

  bit sector_protect = 1'b0;

  bit top_bottom = 1'b0;

  bit [3:0] block_protect = 4'b0;

  bit write_enable_latch = 1'b0;

  bit complement_protect = 1'b0;

  bit [3:0] security_register_lock_bits = 1'b1;

  bit quad_enable = 1'b1;

  /** Output Driver Strength */
  bit [1:0] output_driver_strength = 2'b11;

  /** 
   * HOLD#/RESET# pin selection Bit:
   * 0: indicates the HOLD# pin is selected 
   * 1: indicates the RESET# pin is selected
   */
  bit reset_hold_enable = 1'b1;
 
  /** Write Protection Selection */
  bit write_protect_sel = 1'b0;
  
  /*Power up Address Mode */
  bit powerup_addr_mode = 1'b0;

  /** SPI Agent configuration handle */
`ifdef SVT_VMM_TECHNOLOGY
  svt_spi_group_configuration spi_agent_cfg;
`else
  svt_spi_agent_configuration spi_agent_cfg;
`endif  

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
  `svt_vmm_data_new(svt_spi_flash_winbond_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_flash_winbond_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_winbond_nonvolatile_configuration_register)
  `svt_data_member_end(svt_spi_flash_winbond_nonvolatile_configuration_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_winbond_nonvolatile_configuration_register.
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
  `vmm_typename(svt_spi_flash_winbond_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_flash_winbond_nonvolatile_configuration_register)
`endif

  // ---------------------------------------------------------------------------
  /**
   *
   */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);
  extern virtual function void set_cfg(svt_configuration cfg);
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
QMbyoC3GczIlF7jM3+t/lFApGYNbDHV0gGyIc11edR9oEf892kUwk6YwJAs59xqy
OSlDgQoeKtIJZqZak0BsYXNCvUrztorbsU5AV9ZC79ucvvUecLIqoG05iIHFUXmT
wH1JtGDN9OPW3LietAwFQGcnaCXswEt4nvIX5T1Yy+U=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 718       )
ai8GTgOWoZhVewO3xHrUEM/qMAQ9ojIEldNq+zJ0nqXooVG0eS+w5AbpFHrzSDqY
79unvqe0mJfb13pQYCpdP1//ykw0ro6SyY7oC5sh0qFlRwD8q3rUrBMeScHFLl9G
fmMpignIc1R+8oY9eGUX7SrA4hca6v+WkUGw1EQ9BO6P8f4P4+of3TkdBwYKp5uj
5KYv44j39Uvz/1M4fVQ+y5aOOrCLrquEBzy4DLAIDCu0uCcbAkPYBE1MeEtq6Czq
5/eGM/eisiJPndc2bopd5v0g6iCO/kHewvMja/N/4V9nWpTffMVnpXq37T2vcJbW
eDLaqfAFzQLT1JfAaLMG/fo6ZmNpcbIT/D7KGyWRALlqpFpG9r6LPN+8XiCuEnGb
ZdNJWSszMmImcnApqmeB3yHWrSw81DLx0E66C41+6+FWlaj3HV0b0jrIs/gEDSj6
nzyl6OKTUq2zpkdL+CMcLEDhLT22JEBNI/MKgpOdYVZPv/AP5MuxvBi9Od8D+F8k
R67/X82yRxE5Py6hq0glk1WteCa9HGc3zERuf5s7jfRseJFuRHFJ2Z9OCvKb2cXc
oRclD6LbGAa0aCDVzon4weynAiChsHOUc3MEMlc9hpIvhUQxdX+Dg39iqasXMnxQ
F5wP6O3fObDSZAm2zLv1qbUnfsfftF+YXdbPgh6gC1tnacgjopUjGlQq6jfR8OsU
7VUK05BSSNf0zEk7LjSm3qm1liv5n51jTZ5ZFElvZ9h2iyS7lLdWalZYZyOXzXvb
7B3w2LXnfNa62m/g59Bp6AUPes0UpmN/zS0Zt/6bDBbC8j3H9F+pJYTpBNy7tiAw
tXu0Hmg+hryz3AiGzPbc91i2WAl4PKxxMhVZI7tpveVZi1jJzka2KJPqopIQSBA8
GPQZsFL5ja9ZZtM9DEmrAP6DEMlFjog2z1aLhX8WCGS3bHzLYUT0nk80kP9wsWO2
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
OM9AQLI2RX5IhtR2oBWXhusbYbFs5Opdi26kRJ43WU9vwHmwz/70FaF9ADCZ9ZAP
FQD52rlC66GtlPUp8aAiIJNf3BmDmac0UwLceO1OFi/gBTsdBEo2bBgdFQnS8zsG
iv1EchwA3aeDtlivDBU9uaNUuFVKykIS/gXsT2k2Aa4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 13500     )
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
2QIkTpnXmMmDXtOUPgkx1A==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_WINBOND_NONVOLATILE_CONFIGURATION_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
JLXDOVlWpAqHruxC2HGOqhObfFAqkr5IuH8XiT+Tp2k5Q7zmah4WH3ty5Bx+YdNU
hM/vCG5IMG1FfASm4OoG4w4rKmK6VufIgKb2VBxZRf5vwWodkWwEKemot9hmiRJT
+/yh6GLb4rzojjSMAXR8MhbBMnPRIJTkrRtQUs1pDhI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 13583     )
mnwih4L8H5JhIfhEhsGw4MeHj9r94oygtNUjZA6q1idNkkIuKMmY3U/3gj3LsDUu
ZiITdl8bkPC2t4+Sbm+U0wqaouGATqv7kDCvJCJCmP+Z9cbKHa8EpVam1B97idOl
`pragma protect end_protected
