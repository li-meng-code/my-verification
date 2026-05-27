
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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
BZUIa5s2WRDMPmVX7PoCkBzv4/9LQ1l1ZhWF2KIFEa+zUdDhJmzixgU9RS+ezEIY
313HBGMS5jpsk0IS0tBrBVc7RIKYEa//CrEyCVofHCe8wGFsS06WVtUVCEokiDa5
psj1s7W1ekNRNb12yTqQXrHtL0UwH7Xe0zAoDzPXjIQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 722       )
jttmMx+7+yF2BQ24ex5O4YjYlNrXimfCPCzfJ0+PTweyViaZrJxVaXMyP25YNd/5
Q1MPbxB++nWNOtx9hccl3K+qucAlrHOSESHLjz2249eE68flBgmyQ7FZz9uTNIEv
+n7uRi1PD4dxgaHAkLI7V2e/squXnsFsL7ozbl+rbK1SbVWC31M4+eeypDKr3Rka
lT1vgaH1xp/czfzo3jFYXfJG0j1OvYBOXMJYxTPmfhMV/AgwlpYxs2L1a00auV0S
aMwv+mA2n3poyWhbHohicFkt7hCaLJRd2s3lHJc1a9UNDmvz6oWWSwwLVEVwDoGu
3m7ATEPZQjwimPd7MZ9Bc9i1uxV1ff6D5SsU0IO6os/ls53R045ZFnm2Y3n+vvY7
Oi7vMKglBvg6HKXcTVKkC5HM0LpMM6S03SM7aErS7RfViUwflpMVaFf6ykx8Cx9J
FeLxJW7rc8nEN8fdQUxHn0z77pFFscNmzTINySVzjV6PZxIMVvR1Wj4wcimNt6e4
cIaeH4nj3Z0RIHN+cyeUgbEUTXWOEQQhGh4PtBEZu0utETTQiHq7nX1KrUTjyBKn
7jF+TCUtgCOaSnSPy/+jfDNz8p885uni5uqT6fr/JJCIbQn8N8ETpru1gcD9ovGl
Mr3N2cJUE4X3gaZoOyGGBR1uOCzBjdVvHCnsiBpX5j71uM1gsbnHzHH3uwOHpP5/
IDtPkgf2ldTDoLZIeTARRjO350Yy0Es6lZd77kuZTJ0Ew7vd/bRoBKVmMIIIim3K
DVJ1wK/FE1EQfCRA+nrXytdyBBhddrZJ7n0s/8vLsjYE38wBkbr/41dIy3ECmRO+
9BlsNSqhCx+mYhZS5RU6NFKwSMgZO/dmr8xwCC0S04N1FTWUfU6yz+/dCEPKG7qm
ClrY33cg1wT0ekfp03XrILE2gEmBRQuW0vXttrczCJwjnEmtylQS2Es8OtEyVJR0
bM62ocEuOQSKK0QcuB0hQw==
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
CrC04jUwJieFNsid3DZQFDqvzE4QUTStCu6snQR2pQ6J9outeD6SDuhX7Ld5pPJs
vo+or+IPaANPzKyvhTTu9fgQne3FmGARc42qrzOpIaOk1x06AyG7t4kg9NhX4rGp
anurr2ZV3w0nOKKlhERTB36p3zcUT1MWRKVD3SjYb4I=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 23456     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_SPANSION_NONVOLATILE_CONFIGURATION_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
KlJtwyux/62aLO/ONehWYcz11pcujRh3g95au5FfjOgfvVLYHEM3TnY6kerRchNl
rOeBSdnQbRempsqRdeA1MC1aPAoj2iHnd620dIA1OIKd9E7TOCALV8Pw79zyVk7H
IfiTfJSRRJ0f65ieJtRdobat+z8Fnkw8QwlJnDJDy2s=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 23539     )
5Uxa6cMbZvc3uP8l5rgSromZd6huQSNzIAYDhC+PqM2BhwBWbX6mwUfM05acfC2X
U/wAtB/VW9CGvQUxikMU6NE7lMhGS/IJupsVVbCyWRbeVhx2DAwjHcSNf6dhLGRj
`pragma protect end_protected
