
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
XF1sQUC4grDy40bN2p5usI68jLLbjWCYeDrZIUcy1GvGjbA8wL298XqXJTBWK+Hb
ygT7lYs6N7CwDiKnFPjBZVLM+1agU+dwdNBcl1M/K6FKvs+vfGW/PJ255YxjM843
KwGUexXR28XemVvqjo9g3PlaCWC0IRAn9iiFxDwetDKpZXcMdO2p6A==
//pragma protect end_key_block
//pragma protect digest_block
Ml/dAA5k6+EXmE8s2GLGU7CDJCg=
//pragma protect end_digest_block
//pragma protect data_block
hFa1PbDuVEhzitzLLt/98mJQDiitib/4uGLhjnCN57Hj3Qyrlh19wW4zhhHCNgXD
seINXIcY8V85gQsFK0L1Pz5TO8qFQjqci9k2XDq9t25fydjReOu0fvFNlPbuq7L7
f3+CnLmf6EuGXovwgpCFeueZYILuSPFKVD87fxgOucvjDXcJJ3APHbNeSE8KyKvg
4nwGHoALgCte4Vy8JP3Hl3zxAl3oZFGWAzztG1Zxj2+LSmJRP4h/k47DXlWwgjC7
NYjDm0DhgUvTnSeyWzpjF+GKE4A+/oxtMJWpvFI9Nb39Py6E/r10BYxvLHDzgNKj
PYzfoBp1uymtat66KgJ8NnSTqN/wecyWVGyFzkrCaq1/TmYpxBM9qo3TnVE/Z7kI
DAdl9eZEThe/Eqw33mFzfKWjYL66kcbUa62llzDr5sVHg6Gw81YITHBrRFFNh0yK
UCnJPohpHAeVgTryb7+oX+8T/CswO8o5LS0dOoCKwCUXBv9lawi0UK40mvdZk4UR
8b0oFbzMQvOM0KX1s54GMlAkjTlWpmWizOJyclFa97VaFpdug9zR2IxFVRI+7oBU
dmWQkB5Us67Tc9HclhSF5rd3E4omJ9PjAaEDci8ll3QHCrLD6euPmtPjb/Fp4KQN
ZM1gT645QuEvYQCQj9Fi3AIXkE7xB/NozG2pY5sAZLGcqW/fOtswtO0PvM5TyjRi
RZyfWPO8dSIHSw+8uJ9v9TyFA6Ckxs3QQEN0iOSDbzMR36iKakeiua1yXt/9wiUg
SNW4fMREK6yUmZ9ahFvq9SU+aNd44Rgpjm11hK00HkfgVVLQj/X4QLw167dJbUbX
u18RhVyuMQqTSKBqtZLnxvMDlhYuqNyKHZQW9ZGyoyBYBGYr1G5p1E7CZoua+oWV
g09QGqWMkQeuxqnbRJnobYUjRmoGSZjho0MuqGVglouwP//MOkJp9WkFNNzfa6gH
wI+4j9mh4a7Q9YxQiZlntjtQR2un00xXPRGbetFeXUlaM7sehaqBYal408QX9RJ3
va8l7CfuIWxL2iCnZJnYkxDbys4TMT4aJ3RvHLrxhc0=
//pragma protect end_data_block
//pragma protect digest_block
QRRxqPu5qpaLwougjFxT8LlBW6s=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
mPvohzyXIwrdGIXM5CgHae2gBucHidfzLXVxlVY5S6ToVySWtqccdVMsoQsDZhzL
IDLaPY1gmF0Py/eJqtNVlDx95R/uVTFEmN7xCNEiwirvstU37W8SO71AFTX/Z+NR
9O12rczvk/ABDzsTIHVIgSjoHhx0hDirk0dhiWM9VcLmHMHEujYU9w==
//pragma protect end_key_block
//pragma protect digest_block
XRC/dBj6OMsHfNvH50vhic8WRwY=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
U1ntBdgbH495XcMJGZtP+iZ1+W0=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_ADESTO_TOP_REGISTER_SV

