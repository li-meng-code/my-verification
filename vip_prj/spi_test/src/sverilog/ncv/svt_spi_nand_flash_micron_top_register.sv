
`ifndef GUARD_SVT_SPI_NAND_FLASH_MICRON_TOP_REGISTER_SV
`define GUARD_SVT_SPI_NAND_FLASH_MICRON_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP Micron NAND Flash top register class.
 */
class svt_spi_nand_flash_micron_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Protection Register. */

  /** Used for enabling the function of Write Protect Pin (W#).*/
  bit block_write_disable = 1'b1;

  /**  
   * Defines memory to be software protected against PROGRAM or ERASE operations. When one or <br/>
   * more block protect bits is set to 1, a designated memory <br/>
   * area is protected from PROGRAM and ERASE operations.
   */
  bit [3:0] block_protect = 3'b0;

  /**
   * Top Bottom control bit used to control the Range of protected blocks.
   */ 
  bit top_bottom = 1'b0;

  /**
   * Control bit that Specifies whenther Write Protect/Hold feature is
   * enabled.
   */
  bit disable_write_protect_hold = 1'b0;

  /** 
   * OTP space can be protected after Programming it by setting #otp_protection to 1. <br/>
   * The OTP space cannot be erased and after it has been protected. <br/>
   * it cannot be programmed again.
   */
  bit otp_protection = 1'b0;

  /** Configures the device to program OTP locations if #otp_protection has not been enabled */
  bit otp_enable = 1'b0;
 
  /**
   * Configures Mode of operation/Region to access (NAND or NOR Read MOde, OTP/Parameter/Uniqueue ID). <br/>
   * CFG2 CFG1 CFG0 State <br/>
   * 0     0     0 Normal operation <br/>
   * 0     1     0 Access OTP area/Parameter/Unique ID <br/>
   * 1     1     0 Access to OTP data protection bit to lock OTP area <br/>
   * 1     0     1 Access to SPI NOR read protocol enable mode <br/>
   * 1     1     1 Access to permanent block lock protection disable mode <br/>
   */ 
  bit [2:0] cfg = 3'h0;

  /**
   * Device Lock Tight <br/>
   * Specifies Whether Block Protection State can be modified through <br/>
   * Register Write command. <br/>
   */
  bit device_lock_tight = 1'b0; 

  /** Configures the device into ECC operation */
  bit ecc_enable = 1'b0;

  /**
   * Specifiy whether Read Page Cache Random command is in progress.
   */ 
  bit crbsy = 1'b0;

  /**
   * For 'B' Generation based Devices like MT29F2G01ABBGDSF, MT29F2G01ABBGDWB <br/>
   *  0 0 0 No errors <br/>
   *  0 0 1 1-3 bit errors detected and corrected <br/>
   *  0 1 0 Bit errors greater than 8 bits detected and not corrected <br/>
   *  0 1 1 4-6 bit errors detected and corrected. Indicates data refreshment might be taken <br/>
   *  1 0 1 7-8 bit errors detected and corrected. Indicates data refreshment must be taken to guarantee data retention <br/>
   *  Others Reserved <br/>
   *
   * For 'A' Generation based Devices like MT29F1G01AAADD <br/>
   * ECCS provides ECC status as follows: <br/>
   * 00b = No bit errors were detected during the previous read algorithm. <br/>
   * 01b = bit error was detected and corrected, error bit number = 1~7 <br/>
   * 10b = bit error was detected and not corrected <br/>
   * 11b = bit error was detected and corrected, error bit number = 8 <br/>
   * ECCS is set to 00b either following a RESET, or at the beginning of the READ. <br/>
   * It is then updated after the device completes a valid READ operation. <br/>
   * ECCS is invalid if #ecc_enable is disabled
   */
  bit [2:0] ecc_status = 3'h0;

  /** 
   * Indicates if Program Error has occured. <br/>
   * 1 : Error Occured
   * 0 : No Error
   */
  bit program_fail = 1'b0;

  /** 
   * Indicates if Erase Error has occured. <br/>
   * 1 : Error Occured
   * 0 : No Error
   */
  bit erase_fail = 1'b0;

  /**  
   * Write Enable Latch indicates if the device is Write Enabled. <br/> 
   * This bit defaults to ‘0’ (disabled) on power-up. <br/>
   * 1 : Write Enabled   <br/>
   * 0 : Write Disabled
   */
  bit write_enable_latch = 1'b0;

  /**  
   * Indicates the ready status of device to perform a memory access. <br/>
   */
  bit operation_in_progress = 1'b0;  
  
  /**
   * Die Select
   */ 
  bit DS0 = 1'b0;

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
  `svt_vmm_data_new(svt_spi_nand_flash_micron_top_register)
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
  extern function new(string name = "svt_spi_nand_flash_micron_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_nand_flash_micron_top_register)
  `svt_data_member_end(svt_spi_nand_flash_micron_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_nand_flash_micron_top_register.
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
  `vmm_typename(svt_spi_nand_flash_micron_top_register)
  `vmm_class_factory(svt_spi_nand_flash_micron_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Protection Register */
  extern virtual function bit [7:0] get_micron_protection_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current FeatureRegister */
  extern virtual function bit [7:0] get_micron_feature_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_micron_status_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_micron_die_select_register();

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Protection Register */
  extern virtual function void set_micron_protection_register( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Feature Register */
  extern virtual function void set_micron_feature_register( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_micron_status_register( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of Die Select Register */
  extern virtual function void set_micron_die_select_register(bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the Agent configuration object handle */
  extern virtual function void set_cfg(svt_configuration cfg);

endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
iveXzvepNJbmkiBQjXzI8bty43qZH+qwDf3Of+M92kSuNFDGXyJoGCmRv/zyMev+
QTkbt9bJ+UDpDOx0dO4L3GPP5gDRg9Cg+Fu6LSaeJm7T5mkro+a1b9EcY6jmAL2t
h/0jSa2WdEIYi1FV5H7GvHzP7UzsGamNBBPElLpCUsff/P8CvRi9rA==
//pragma protect end_key_block
//pragma protect digest_block
tiEz8Y0Dm15MT7hxWbkh/niPkAI=
//pragma protect end_digest_block
//pragma protect data_block
sJXes0D34rwV57hWo7FTq6fe15Rt9awlou80r8Puf212bEjM4L7WVEtPZZWAUYzG
re3vO0oTFtM6bx99oLG9JB2oDGh8Y5GIH6ntA7V96T5mTDSpKJg6EfraO1kvPln2
gpinUQRljDuUtDBRHF8z2Zwlji0gksTuxKjruzZLBlK+gYjuuwcwKDN8yeJUpWI3
7T8D4r3SOw5Nvj+QyJcpoKrtP8uUU6m2k1IRnrnz2i+YMYCSqXePn0LHsOaUqh1+
yfYg+eVL9JZtmJyX1J0yK+2I9DM50UmSPMEQWrW9AH2PffrNbgex4OK04g+yyOel
PjIUnFEGuEUOkwGTATjV2Fb2RXzEDPY9SeD3F7snYIOBZVr1Nxy/638PCoNC7Noe
pWAPDLKBFfpvcXIIran7KBjszkJKLDwtMCMALRPTWwEQ4WAUiXefB809aubZpbUz
+u4BtbaQHgirM84GHMnuu/6lx4Q7PlCQFwR4b4xmZXgxLgSvHfqLzLyDxppSddM9
aVqhP/FUuDr87VUEx93uYb5DhiN1zNNw6FPQu2y15nvI0h5W9kDO7gCdqV36fqdt
MpOLKeKb87os9cho18WzFi8ulwJuE1J+fMjKKwes//0brtQyQKQaoXt2QUSunL/V
cKd3qI2SMSxzJX//+Tjugt9K/r/zuO3Eywktak/GN2AQoKAIkt9CqAXqMyLofrkE
8A5UcmaQ1+L4um4zXf/FbN71rD7u9Lm/PEwqGYQ2WOkckOgdMDglgjPUvLaqrYuW
Ahv20sy8d4g723MRcmxhpzeLDF0CvJmAYCPPZf78ZrKjGqWBMGH7ZWeMpODtT3Kq
O4H3L61Vw4mThfJle3yxtSNkWBzT9dSwppfM2GkCpY+Ktn1UZ/SMbFaVnrkevvru
Gkkoq+t3tXYoUcW73ivj967PULChtk5UpatoyyBY+PA6GaC57N7HOhd5SoVqbwsy
F7THD9+MYvqBZ449QVxJ90VazUIs4XU7f1LD28SgxDmSoU8DhtpC7UNHFj3S66WW
u4aV4PXb/fxig4RWy/3ZQoQLc8TOfEzk1EEYOyZgrQvI8ixCgVtsgAJtoDBPLtsZ

//pragma protect end_data_block
//pragma protect digest_block
Gm3+dlIpN7IpXK50rOFgPWiC5n0=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
lwUFaPhAV2WnRkDxNxzBquFAdgfBa8Yw4wv26tjsF3uPEj22pb/qLXawu5LvpBrB
6RtyAkr5zJ0V12fyKrb3rQeD0zXwNlWcAftgd5W5XPZRgtmudARM4A6TWnCZezPD
Lt6oW+jIiY0otZeiIt9SeGkzfMjtXMfDvH9S+TQ62X7sR91llJL4QQ==
//pragma protect end_key_block
//pragma protect digest_block
v7kV3ec1yVe+MUQPRkiCvBzIBgM=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
AFDLiqG59gAC5aH5S/EhCgtmyxw=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_NAND_FLASH_MICRON_TOP_REGISTER_SV

