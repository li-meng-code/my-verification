
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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
NHJnRuhVANJV3uqvp7tcps+78v5b8mOZXq2uuTYa7k17SuSsorKD83ejzQ5eb7vZ
F+a/NKXHsgGypbXDnfXO+V6EFKtT8ah6Eyq02x2R2MfCATe/yEphxs6glKXr1lPK
7Ft7hdwekpj0bUgSP6asNlaM073M9D3jjLX6ElibbMw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 714       )
j6zNHpTUoQ0mu5FJYb47YlzzBsil44WJlMbQjof1uKcAn8cBM7rH/+AbhGOEZ7Gp
BUChYSyHqMH5Ltxro1niMeFCmUHNRCz29QTWjxeKH0Yf8VuVmNqCGrHMTmPc+L/7
Z98pFPk3IfYpEyEu7/6QMOUf3S2CNgo8cxdhxW8xuQOQ3lZWbax1XMrUegJyUaZJ
oE3fDhoBzj9hwYyNslapBfY+nJuTRGSjIA+Yorh8i8vnLlLyz/TKpZlWITtDCTeF
FOcv9bO0HAoLK3knG2pZ8YgeL6Zan4vxRe8xg6HC2Z5zAGl0cR79lPeUAYKwDmyY
cf/HX1JVdG2jRfyb7wnET+NRk7x1VrwcrjvxVUfJaTGeB4ntY4LUI5r7Nj8TO2Og
d0zcbtF/nlx6juHofn4J2lA8Tiwt0mbKF55HrpsJqfLjlhzKzf9Zq/vRf++mF4hm
BxapzXRlB4/bEbV9nch9EAslqytiDFdzQoYLM1XjCMH+mcuUgz59jNP9ypCbc8Eq
PgDJ0fUMRypKMC+4G7b2U4p+Mzmu+/CJyPff5CUkajgZim2sizqIZDISPFTvb6K9
4HtUn7Auw1GwuvBQvYECU2miy6XHcIBSQKbGW9qxMhf6pn8x6/bbcnDleMabGOp1
xFYDpLLj8P4YC9n5IuXyaM3TtYvrZOSzI1ebudMei62g2A1/wdS+AmS9t8On+cy2
0w4/x6yFCS7lDc4wgVnubsOi8kiOgPYkrcjIqHizbIrKItwoqbbNmikb/ADfKc5M
hPkGbpPrZSewrHrUqxzjHwOit+plUDS7xbKGCjvNN44Xb+UdEicudZEK0P+0Dzaf
6+GQU+SCvnriS8NvlXu7zb+DEpOQtVXg2ijvmbyTxo4jqkmJKk8nWPt6QpY6H8Au
wP6eEu7gll71SzKltqf9yBcA46JoNVxhyS1XboQIMptjwEWMUaHFZ9RZj+uO1nNl
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
bDPWKLiBObAUvO5sdBO/pgp+eHlqoTyHKYRUBQNHEYRf42euTsBgaOj8Q+9dQQFq
FT7XW5FjljORj3m7P2aIJSUv7xFEzk35gh65ZqDEPubceAO5DPB9UNKom0ep5m+Z
F0KHZR7Gu7o+fEAD8BgQ3z6uCV4aj+Mf1Ae/iHvPQa0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11782     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_ADESTO_NONVOLATILE_CONFIGURATION_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
MrFKsZjtzLjaOz5kAQo0cHOK4fGdI8j7x2zQd3BQVTyvoN4jM9a52rXGS41Z20Bw
i9cCK7j4sEYqeHS0MwXh7/an8mX45atNpWTCrMZAbq8Jqd1AxzDQxa0W9kbZI3lp
oUcYIVEZnQ17NH1bIIER06tjWFjzY2HMXdVMK0K8uEw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11865     )
c7wCl4RBczZ9mLY9blxSbw/tQ3XlxA1IdB31AvmUHukAcR2p7ll/wSv0Ubf/Fnjp
H8XOILEK79zEcbktw+6/bse8r2JmGEWU/vZrOXrrkj1RbxFMrRg36o5D4j+Bpwd0
`pragma protect end_protected
