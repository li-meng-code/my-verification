
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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
E7mdHbFPrfmkxO7a9/zUIfQSfRkzm1gfz7kwH+0ojIN3e6vJr6sJ2c//YNLVHWty
DkVURcY9yA0Ubf2DUEGUkm646Moy6ZakTxSD/yCLBioHeO9G6g/q5qSZKhshV3Zo
sZBQ2zCuaZIHudzR/TB5gqivDGg/Vstpc2CuYdl16/8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 646       )
1uM9mStoP1XBE+GVVnGEyc+G9tRNjdzWR9FU+l7JnEb7opnljj8igSHbAYC3/eNO
Ro/embFzkx6ddQ2PPQnMuRM/FtBAYI2zBYln2nkn/EGP3J1ifCCi5CwaG5tgY7bJ
LEce/gz/PmHBrpj4UPTBt4W17cdstSMrYpFyKjguuu4j8vzs0sf6ep5MymLMKo1G
hF5LvZyZv3wh5oYpVK+6IsITMm+p6Y/WOED5OYcuk5XoO2v2mvTFf5x1iSp77veV
cmSbrKZ/9gWK/aA4U+pkVDMA8BSPkZwx7lNmN8aBbTCiiRzd/YzXKMjA8JFh6fsa
GZmBC+lX1j3qSkc7CTS7AutwMzGdhySMtjsrdA/zqkyOpuyuEyOr7mT6XhBewN2B
KZPxL7zsiXhQ/L3MjWAyOEZu/sWeeKbjzbGJEDh1ww9u/azNoVmA3+q51oj75Moc
4US7IMpHBSwAv2yZRDf2buKjOdqOCQJeWOrhVisF3cwUV/1IBvjUcordEToMCvIC
ec75up21g7+Qskd+Qg8TGige0jTue+3puUo48GsWIT1tYDyZr3Xoon5Z3NoIiYeP
h8sTDXURdm7u0hJ00kajahDTkZy6Hi7Z+I0zRDbcDZuu9HEUSmxuy0NBoXfdSA70
JS/GeurLfAcueOvko5mLukMpGIgiAMyuFPqmUeXfiz1nncuhoR6nSY1Cr3p7+Lme
lE7XKOEqEBWcrz/cE+wBjshcoorqGE6zrfvXPkpoqkptpYLPLI8/iLmd0/q3q9nX
PDgHK55gvhr5EtB2H5m1mxR74OtGrnOZj0d25e0QhhSHu1SlTmo41alN5VymYxEy
BWW2Ddu4YvnIzAA0tzkTbCr6OB/3nnH8ecc+D6u2Omk=
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
OOcD5/1wIrJYlHE0MiEdc827jdUsXMnz4JENwkGxaMpixIvAcubcRJ24PxPwTdx/
mDvcL2rvQM7A/TzUWHdDp6rXeITfX+vAJB/vigb1w3J4gapZn8z0YS1JjyDRRTgq
rmTV4jo3JgkLaaPA+A0epXGdeIyomztXlzB0WtUV4O0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 17611     )
+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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_NAND_FLASH_MICRON_TOP_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
WHhpuT+jpEeC4TXMY27vwy7ZboEqT54Dq1n88ajDuPC+EHJRzUabcGcVVQopvYiO
DOoz+1VQb7gkI2+a7//f900BpPLlM3LvEfUWvQe/bGfgdj6U1dnkEYY+B5MA7G/P
tUPvwCwJeFCsul2OLbSnKeWju1JZyL6QvY8YYB3svxE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 17694     )
ngjXz9n+nKxlNx7JIjN5JEES+RHbte/gjVI6knFCF8UHMEcemFlh/080sMpQnqnF
DACOSW/Vd6mVWkPyXqQYP2ddWZDFpnHiL2X8o8R/oo/7OFGma2k3B92JNZemIa0m
`pragma protect end_protected
