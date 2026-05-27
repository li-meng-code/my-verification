
`ifndef GUARD_SVT_SPI_FLASH_ADESTO_TOP_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_ADESTO_TOP_REGISTER_SV 
typedef class svt_spi_flash_adesto_nonvolatile_configuration_register;

// =============================================================================
/**
 *  This is the SPI VIP Adesto top register class.
 */
class svt_spi_flash_adesto_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Flash Adesto NonVolatile Configuration Register Class Handle. */
  svt_spi_flash_adesto_nonvolatile_configuration_register nonvolatile_cfg_register;

  /** SPI Status Register. */
  bit [1:0] status_register_protect = 2'b01;

  bit sector_protect = 1'b0;

  bit top_bottom = 1'b0;

  bit [3:0] block_protect = 4'b0;

  bit write_enable_latch = 1'b0;

  bit busy = 1'b0;  

  /** SPI Status 2 Register. */
  bit erase_program_suspend_status = 1'b0;

  bit complement_protect = 1'b0;

  bit [3:0] security_register_lock_bits = 1'b1;

  bit quad_enable = 1'b1;

  /** Sector Protect Register */
  bit [7:0] sector_protect_register[];

  /** SPI Status Register 1 */
  bit sector_protection_registers_locked = 0;
  bit deep_power_down_status = 0;
  bit program_erase_error = 0;
  bit ultra_deep_power_down_status = 0;
  bit[1:0] software_protection_status = 2'b11;

  /** SPI Status Register 2 */
  bit ddr_mode_select = 0;
  bit auto_ultra_deep_power_down_enable = 0;
  bit auto_deep_power_down_enable = 0;
  bit reset_command_enable = 0;
  bit octal_mode_enable = 0;
  bit quad_mode_enable = 0;
  bit program_suspend_status = 0;
  bit erase_suspend_status = 0;

  /** SPI Status Register 3 */
  bit wrap_type = 0;
  bit [1:0] wrap_length = 0 ;
  bit write_protect_pin_status_n = 1;
  bit [3:0] dummy_cycles = 4'h7;

  /** SPI IO Pin Drive Strangth Control Register*/
  bit [2:0] io_driver_strength = 0;

  /** SPI Read-While-Write Configuration Register*/
  bit [2:0] read_while_write = 0;

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
  `svt_vmm_data_new(svt_spi_flash_adesto_top_register)
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
  extern function new(string name = "svt_spi_flash_adesto_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_adesto_top_register)
    `svt_field_object(nonvolatile_cfg_register, `SVT_ALL_ON|`SVT_NOPACK|`SVT_NOCOMPARE|`SVT_REFERENCE, `SVT_HOW_REF)
  `svt_data_member_end(svt_spi_flash_adesto_top_register)

  // ---------------------------------------------------------------------------
  /** This method sets the configuration handle */ 
  extern virtual function void set_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_adesto_top_register.
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
  `vmm_typename(svt_spi_flash_adesto_top_register)
  `vmm_class_factory(svt_spi_flash_adesto_top_register)
`endif

  // ---------------------------------------------------------------------------
  /**
   *
   */
  extern virtual function void create_adesto_nonvolatile_cfg_register();
  extern virtual function bit [7:0] get_adesto_sector_protect_register(int sector_count);
  extern virtual function bit [7:0] get_adesto_status_register();
  extern virtual function bit [7:0] get_adesto_status_register_2();
  extern virtual function bit [7:0] get_adesto_status_register_3();
  extern virtual function bit [7:0] get_adesto_io_drive_strength_control_register();
  extern virtual function bit [7:0] get_adesto_read_while_write_configuration_register();
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);
  extern virtual function void set_adesto_sector_protect_register(int sector_count,bit[7:0] reg_val);
  extern virtual function void set_adesto_status_register( bit [7:0] reg_val = 8'h00);
  extern virtual function void set_adesto_status_register_2( bit [7:0] reg_val=8'h00);
  extern virtual function void set_adesto_status_register_3( bit [7:0] reg_val=8'h00);
  extern virtual function void set_adesto_io_drive_strength_control_register( bit [7:0] reg_val=8'h00);
  extern virtual function void set_adesto_read_while_write_configuration_register( bit [7:0] reg_val=8'h00);
  extern virtual function void store_adesto_nonvolatile_settings();
  extern virtual function void reload_adesto_nonvolatile_settings();
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
URSkXDZJCZYkbqco+xiv5zsUrmEhRKd1blB+jxyPGmOch07HeC4ObyG0i1sEaZP5
k+i9p1QxK7GE4a4NeKXQB1aSHaLiRq1vYnmCNlLuY4x8slMLLu8zQ6chmSTajwXE
USJ0JKwp876CgQ1uRkrvEim9nLQeZnhlZwqLXp1AF9g=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 626       )
MyHSohydxkrZiH27FSLSzWEmMr+06z2+ncVUano7hkNZ6vt1EMuVXts9mIXvu/qp
tYIqw5fTb9V1Ly3ZUze8BRvWL9dPWBmvaYGAjh/0FPwNy2a5iHduFnEDS7T9DCe9
lsApDzbQTOVELzW74ivZu5Hzo9onvYKsFWgnG9CoZDHl27Gx3pfjeJkcNIKst22T
uODNUrxaSgd8lAiqf1zXtNH76rrt2UEq7+1TT7K7N40W/UZWJN+FWCVx43+N+ANU
U1i7YsQLmBUlXPpk9K0FOpOdTFkmAyinWpHh/GjRZ7IuDhRH/VBHR/6sTduL/L0k
1nYijnaG1ZREJcFrRtAHHrrjCyoHn+qLQGGvoInBIdBR/of/rNo+VoOsR2+Ehb+u
wubBxrAP6hAjItotO1n+RaYe2icjkGe6RO3ksrSBx9sfToNtGUq8XLN7OYinJA1I
FwjK3N+dDk2JVT20VAOhZ1HBRwo+yJRQYXUuarGHDsyD/meQuBjklTo+zA7d+3HV
uigjj6VP5gQlWiZEOFRpPo7kOzaP8oaQmHhGWhlU7qvgUNodMp1cD1GQzzX6IrzU
3qEvKFxh4fNcUNV4/E83dfzoaBduJ/dZbol+MzWFfOwn++NgjGm7dRFMOOiXeq2U
+dJFQmTsxAL0hFwNmoSEtGdmzejA9USyc8SYnZgtLUIpeR9Z1gmwTaRtj3+msVQY
ZO7jfdp8BLhKq4f9LVOW+eEe+3yAg67kn58Fe2drn7A6UF+vjOJtFXr1EZR9meRz
ixB2JYIBP3xpLvu7wy+xTsHozryRBZtx2uzLDEo0cHbDmWaglpPBJ/Ze7ytehVVS
L68qMnKTK86NA4Zzg7fiyQ==
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Yb5thnSPFQuRbfi2CndRt6Bush7pIOtdn/O6H0SrroQy2GJLvL0TdrgLU+moAGhC
r+uJYTrWNQEWSl8G+8ce5I+N9Iqj3KtfkD3lTfNYDLxa3R+EcPjPcV/gEC93axCv
+E3F9+5nse2LwcXIhLUtd65YO5k9IsJEVQmeH0CYrDo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 26409     )
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
hjbOZ77a9rb4dOlOEly1pA==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_ADESTO_TOP_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
TBUt3saAlZKEUdwciIyFxJFHujzqtaiJF6KtRfgx0ItWscs9jRDfzD8qo3Phf8Q/
JDOjwtACs3ltQfO1TAdVqBgwEK8uPbpsU4ANkK4y37G0tErgHG2zCQPdpUpjRnzO
/pHy2+SC8Tu1odtIbBJNnvObkQSOtr8zFi7URSyhdn0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 26492     )
Jl3pazWF6tmZpYTg7lkL+j1can8TM9wlisQn+VfNOMrNiU7sSNI9XTCnwxlr0VbO
FQlil/idGbWIu6VqEIz2Oik0UxksZjzoRWfGJSw/HTp7yHw6HCMU+s5TFzXdhbXQ
`pragma protect end_protected
