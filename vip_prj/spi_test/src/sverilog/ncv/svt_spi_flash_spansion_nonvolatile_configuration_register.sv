
`ifndef GUARD_SVT_SPI_FLASH_SPANSION_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_SPANSION_NONVOLATILE_CONFIGURATION_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP spansion Nonvolatile configuration register class.
 *  This maintains the copy of Non Volatile fields that can be stored/reload based
 *  on requirement.
 */
class svt_spi_flash_spansion_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------
  /** SPI Status Register 1. */
  /** Used for enabling the function of Write Protect Pin (W#).*/
  bit status_write_disable = 1'b0;

  /**  
   * Defines memory to be software protected against PROGRAM or ERASE operations. When one or <br/>
   * more block protect bits is set to 1, a designated memory <br/>
   * area is protected from PROGRAM and ERASE operations.
   */
  bit [2:0] block_protect = 3'b0;

  /** SPI Configuration Register 1. */
  /**  
   * Determines whether the protected memory area defined by the block protect <br/>
   * bits starts from the top or bottom of the memory array.
   */
  bit top_bottom_protection = 1'b0;

  /**  
   * Determines whether the BP bits defined in #block_protect are volatile or non volatile <br/>
   * 1 : Volatile   <br/>
   * 0 : Non Volatile
   */
  bit block_protect_non_volatile = 1'b0;

  /**  
   * Configures Parameter Sectors location <br/>
   * 1 = 4-kB physical sectors at top, (high address).
   * 0 = 4-kB physical sectors at bottom, (low address).
   */ 
  bit top_bottom_parameter_sector = 1'b0;

  /** 
   * Configures the device into QUAD IO operation. <br/> 
   * 1 : Quad IO Selected   <br/>
   * 0 : Extended or Dual IO Selected
   */
  bit quad_data_width = 1'b0;

  /**  
   * Configures whether the 4 KB sectors are grouped together or evenly split between High and LOW address ranges. <br/>
   * 0 = 4 KB Sectors are grouped together                       <br/>
   * 1 = 4 KB Sectors are split between High and Low Addresses   <br/>
   */ 
  bit split_top_bottom_sector = 1'b0;

  /**  
   * Configures whether the BP bits and 4 KB sectors are permanently protected. <br/>
   * Note : PLPROT protects Block Prot[2:0], split TB, top_bottom protect and top_bottom_parameter_sector bits from program and erase. <br/>
   * 0 = Legacy Block Protection and 4 KB Sector Location are not protected  <br/>
   * 1 = Legacy Block Protection and 4 KB Sector Location are protected      <br/>
   */ 
  bit permanent_lock_protection = 1'b0;

  /** SPI Configuration Register 2. */
  /** 
   * Indicates whether 3-byte or 4-byte address mode is enabled <br/>
   * 1 : 4-byte (32-bits) addressing required from command. <br/>
   * 0 : 3-byte (24-bits) addressing from command + Bank Address <br/>
   * This also depicts address_length for S25FS_S device families.
   */
  bit extended_address_enable = 1'b0;

  /** Used to enable the QPI Feature  */
  bit qpi_enable = 1'b0;

  /** Used to enable Reset on IO3 Feature  */
  bit io3_reset = 1'b0;

  /** Used to configure the Read Latency values */
  bit [3:0] read_latency = 4'h8;

  /** SPI Configuration Register 3. */
  /** Control the read latency (dummy cycles) delay in all variable latency register read transactions. */
  bit [1:0] register_latency_code = 2'b0;

  /** Used to enable the Blank Check Feature  */
  bit blank_check_enable = 1'b0;

  /** 
   * Used to enable the Page Buffer Wrap <br/>
   * 0 : 256 Bytes Wrap <br/>
   * 1 : 512 Byte Wrap
   */
  bit page_buffer_wrap = 1'b0;

  /** 
   * Used to enable the Erase 4kB command. <br/>
   * 0 : 4-kB Erase enabled (Hybrid Sector Architecture). <br/>
   * 1 : 4-kB Erase disabled (Uniform Sector Architecture). <br/>
   */
  bit enable_hybrid_sector_arch_n = 1'b0;

  /** 
   * Used to Select 30h Opcode for eitjer CLSR or Resume command. <br/>
   * 0 : 30h is clear status command. <br/>
   * 1 : 30h is Erase or Program Resume command
   */
  bit enable_30h_as_resume_command = 1'b0;

  /** 
   * Used to configure Block Erase Size  
   * 0 : 64-kB Erase
   * 1 : 256-kB Erase
   * */
  bit block_erase_size = 1'b0;

  /** 
   * Used to Enable the Legacy Soft reset Command. <br/>
   * 0 : F0h Software Reset is disabled <br/>
   * 1 : F0h Software Reset is enabled
   */
  bit enable_legacy_software_reset = 1'b0;

  /** SPI Configuration Register 4. */
  /** Output Driver Strength */
  bit [2:0] output_impedence = 3'b0;
 
  /** Used to enable the Wrap Feature  */
  bit wrap_enable_n = 1'b0;

  /** Used to enable the Wrap Length <br/>
   * 00 = 8-byte wrap   <br/>
   * 01 = 16-byte wrap  <br/>
   * 10 = 32-byte wrap  <br/>
   * 11 = 64-byte wrap
   */
  bit [1:0] wrap_length = 2'b00;
  /**
   * Selects between 1-bit ECC error detection/correction or both 1-bit ECC error detection and correction and 2-bit ECC error detection. <br/>
   * 0 = 1-bit ECC Error Detection/Correction                                 <br/>
   * 1 = 1-bit ECC Error Detection/Correction and 2-bit ECC error detection   <br/>
   */
  bit ecc_select = 1'b0;

  /**
   * The DPDPOR bit selects if the device will be in either Deep Power Down (DPD) mode or the Standby mode after the completion of POR.
   * If enabled, DPDPOR configures the device to start in DPD mode to reduce
   * current consumption until the device is needed. If the device is in DPD, a
   * pulse on CS# or a Hardware reset will return the device to Standby mode.
   * 
   * 0 = Standby mode is entered upon the completion of POR
   * 1 = Deep Power Down Power mode is entered upon the completion of POR
  */
  bit enable_deep_power_down_upon_power_up = 1'b0;

  /** SPI Configuration Register 5. */
  bit ddr_mode_select = 0;
  bit octal_mode_enable = 0;

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
  `svt_vmm_data_new(svt_spi_flash_spansion_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_flash_spansion_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_spansion_nonvolatile_configuration_register)
  `svt_data_member_end(svt_spi_flash_spansion_nonvolatile_configuration_register)

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
   * Allocates a new object of type svt_spi_flash_spansion_nonvolatile_configuration_register.
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
  `vmm_typename(svt_spi_flash_spansion_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_flash_spansion_nonvolatile_configuration_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [1023:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // -----------------------------------------------------------------------------------
  /** This method returns the value to current Non Volatile Status Register */
  extern virtual function bit [7:0] get_spansion_status_register_1_non_volatile();

  // -----------------------------------------------------------------------------------
  /** This method returns the value to current Non Volatile Configuration Register */
  extern virtual function bit [7:0] get_spansion_configuration_register_non_volatile();

  // -----------------------------------------------------------------------------------
  /** This method returns the value to current Non Volatile Configuration Register 2 */
  extern virtual function bit [7:0] get_spansion_configuration_register_2_non_volatile();

  // -----------------------------------------------------------------------------------
  /** This method returns the value to current Non Volatile Configuration Register 3 */
  extern virtual function bit [7:0] get_spansion_configuration_register_3_non_volatile();

  // -----------------------------------------------------------------------------------
  /** This method returns the value to current Non Volatile Configuration Register 4 */
  extern virtual function bit [7:0] get_spansion_configuration_register_4_non_volatile();

  // -----------------------------------------------------------------------------------
  /** This method returns the value to current Non Volatile Configuration Register 5 */
  extern virtual function bit [7:0] get_spansion_configuration_register_5_non_volatile();
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
sw2e9gb+k6CH0ytGNNVckGjJLxZOd2sZWXXd2C9Uu3788aZPOr89SoBL6SQG5ulw
yNOJp/I2idfuMzeb5OA6RGcCHifrDJRSSyFvbVedWjk72dfXTSBKE4dkw1cFfa+e
1ROZyhUkgDIxOi2BF6OXbLXNxpaxdKdzATsCg4buSJtqr8lwpgVy/A==
//pragma protect end_key_block
//pragma protect digest_block
evRIBDLwIFNwzEY4sYsyJCFONUU=
//pragma protect end_digest_block
//pragma protect data_block
5wYHjDXi+qRs76WrcjlO0yiMcxv2d3UU1wDKghSsnL4SSjrpbANjOhri69m0yy4W
nF8wQp8uuJc1V2+RdTyqqWWnjFGKngx4fEatUxiKQWu41o57EasHv8X2beolRlZ3
mp06eGY4SUGTkCjhifOdjnozpEQLvKYpIFgmS2NlT1txk7Italbos/x7h0DADe92
mNGyYE/fFr2eHrOMFuUg6GiMudqEVvDuxPCsC/uYt3j73G5v1MzbXufpNRX05DFt
V/sgtrzTOJKjpOuU8g353Rx09ww3mJBjF8Ev3fyyp4Ir3krvsvK4LuBB9gXGuat8
IRUP9l9hndopxgGnncqGtIU5kuU1ruRofDWG0A9lrzWZu7tRIrDvxPdW2nZLHrum
LOFa4zPdPx9wEQ6HKQRr2fhoU749H0wSlNP0X6sva9Y8zoBhBoeOAUObbPKbtSr7
APyHG5ufKl/EHULCFOxmqznq+XXYzUW+hxgNK9FtzCvadRNK+3oiFUAzJNPoefL8
P+WRRDXwYuzFnmGFqJ2V260XLtCH/eoe7cEjlWbxsOjFc4P4AUCuwLIEYoN64ObW
UJF+JblS1bLfmkfpKu6aIhSWX8ORo1tovL0aVjCWYrerpJQe/tePIUvpWQflEoi9
KeRZAFeQ7YqebRtjfAkuNOdeYhtkmWZW7iHLXX4owJDkeLqG4zWmuZq68hiq451M
yp/JUeGJPyBLfBFxtOUIeE9kuULX6kQTPFAvyaZ8KyuTPFHlp0N9J2fR8eCAhgYD
ZGv7YwDIG7RAQ5SczinaRhE6lDrdq2qlvUFM8bOHxa3P8bALFwrbbmzXaIJKQTqM
z9cfuxxHSXfCTcCZATkFB34j1FA4KsTKyIkJENCZDAQpleRrO6v3P7kyCxb9CiiK
RMmXKoSgOfhAOOk2IctSbEh2RqwhYc9ZHRSfVxaUrKqJfZnl9rtDVdMpAB/TKV/+
sgvfkBeN1jgc2tfxJlkDwKgln8t/ljPnqBCYwZvqccDb8Zgq/dtiQvyxJpk2Tktd
GJ1ceZG2tHg06HDJsciKvUfeX62i6vjPwCrooa9IbtO47y86lQ9CSdOwNWEESIfL
NV8lSIJ7sYoR1FlIltDODI2WSMV1A/d28uKKwcQ3Hn5Fl+NYu1NtrZ77ikzECepz
0DbMFEhsfZH0cd02b2oSSZYcrJYqlE0aJzV9o7sEYm8=
//pragma protect end_data_block
//pragma protect digest_block
SCorU1jOGvZvhhtr/lnJzIhFaeM=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
ICxPT16hvDedSnwecQ/PQDTdfIcnj+uBRMPv5E4xZ/tn1aNmU8TYuaM8zKrHTVeH
+lRz2475ZwKxe2v7wmnBrizToJIlDJHdt6QWrw26MKTlAZM3PnN2MOiVu6JVLkvt
tlpyFHqqvtY/RLnkhuvL8S6oszgeNsVM2QfvTr5ZyEFzaJ2Ze7Qepg==
//pragma protect end_key_block
//pragma protect digest_block
kwkTUBWZXLeOiyuKjXMGCGsToyI=
//pragma protect end_digest_block
//pragma protect data_block
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
BSLmCSPGU2bJmu1f0ICgXA==
//pragma protect end_data_block
//pragma protect digest_block
y8+pYwsrqm3eW4DmFLXqlbXwrGY=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_SPANSION_NONVOLATILE_CONFIGURATION_REGISTER_SV

