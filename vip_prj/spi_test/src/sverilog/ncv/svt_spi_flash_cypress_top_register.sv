
`ifndef GUARD_SVT_SPI_FLASH_CYPRESS_TOP_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_CYPRESS_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP Cypress top register class.
 */
class svt_spi_flash_cypress_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Status Register. */

  /** Used for enabling the function of Write Protect Pin (W#).*/
  bit write_protect_enable = 1'b1;

  /**  
   * Defines memory to be software protected against PROGRAM or ERASE operations. When one or <br/>
   * more block protect bits is set to 1, a designated memory <br/>
   * area is protected from PROGRAM and ERASE operations.
   */
  bit [2:0] block_protect = 2'b0;

  /**  
   * Write Enable Latch indicates if the device is Write Enabled. <br/> 
   * This bit defaults to ‘0’ (disabled) on power-up. <br/>
   * 1 : Write Enabled   <br/>
   * 0 : Write Disabled
   */
  bit write_enable_latch = 1'b0;

  /**  
   * Indicates the ready status of device to perform a memory access. <br/>
   * This bit is set to ‘1’ by the device while a STORE or Software RECALL cycle is in progress.
   */
  bit ready_n = 1'b0;  

  /** 
   * This field stores the value of Status/Configuration Register to non volatile memory after
   * Store/Autostore Operation. 
   */
  bit [7:0] store_status_register;
  bit [7:0] store_configuration_register;
  bit store_autostore_enable = 1'b1;
  bit [7:0] store_serial_number_register[];

  /** This field Locks the Serial Number */
  bit serial_number_lock = 1'b0;

  /**  
   * Determines whether the protected memory area defined by the block protect <br/>
   * bits starts from the top or bottom of the memory array. <br/>
   * 1 : Block Protection starts at Bottom   <br/>
   * 0 : Block Protection starts at Top   
   */
  bit top_bottom_protection = 1'b1;

  /** 
   * Configures the device into QUAD IO operation. <br/> 
   * 1 : Quad IO Selected   <br/>
   * 0 : Extended or Dual IO Selected
   */
  bit quad_enable = 1'b0;
  
  /** Flag that indicates that if Autostore Feature is enabled in SPI Flash. */
  bit autostore_enable = 1'b1;
 
  /** SPI Serial Number Register. */
  /**
   * Stores the 64 bits of Serial Number Register(SNR). <br/>
   * Index 0 represents 63:56 bits of SNR. <br/>
   * Index 1 represents 65:48 bits of SNR. <br/>
   * ...
   * Index 7 represents 7:0 bits of SNR.
   */
  bit [7:0] serial_number_register[];

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
  `svt_vmm_data_new(svt_spi_flash_cypress_top_register)
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
  extern function new(string name = "svt_spi_flash_cypress_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_cypress_top_register)
  `svt_data_member_end(svt_spi_flash_cypress_top_register)
  
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
   * Allocates a new object of type svt_spi_flash_cypress_top_register.
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
  `vmm_typename(svt_spi_flash_cypress_top_register)
  `vmm_class_factory(svt_spi_flash_cypress_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_cypress_status_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Configuration Register */
  extern virtual function bit [7:0] get_cypress_configuration_register();

  // ---------------------------------------------------------------------------
  /** This method re-stores the value of Stored Status Register upon RECALL */
  extern virtual function void recall_cypress_status_register();

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_cypress_status_register( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method stores the current Status Register on STORE/Autostore */
  extern virtual function void store_cypress_status_register();
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
TNElIJkc6j6mMPCu1v5eszj7pUxkn4gvudcFYZYXJEFvNEXUpR4lOlaxSndMyWfK
IH1A+2N6icfQdSb7t6ui7ZaEGB09QRjVU2jTuruF+mGBaT6OC1w6SB7v7a6Bxr0D
TYyWkk9PnTe/hEA8zcMbNUYlNoSrWhTRx5BHbu2ebaab+bP/GxdXgw==
//pragma protect end_key_block
//pragma protect digest_block
F4cZDZdWoAj/NP53MHMbz5RYgY0=
//pragma protect end_digest_block
//pragma protect data_block
J+ncIhneHeHfPKy+lzVJWf93U7FEoZspXYnsACF8ZuckxJIpBSGVUFqImqO24IP6
ww3AMAooquXiyDxjv2xG9yy069XtzV3ez+pnuV2jzBehgBMp1Wk8msoKkBlpVzgU
5nIfbLkAJpthQwqlm9cWdih7C0rZUOa0UriwqVUnGZbWG3YqXkCw3dUL28GQW/It
ztQBNOxSOr1xOfwHmr0mUga/CKWgQAo3j/8sY3WoerO8760uWuv4MbUXJ57W3alO
vxO0ToM05uhMu/qjZLJU69osuBLXxLUoOoGp9rAUeAIweemUckq62BcUPQIPvJ63
D3ID81xjtOVSdcKZwCWgayvCg9bjkMPw/luai+q4+DBg6UI0K82cAXO9cRs6S0p5
kxYrXaVQw5fRhCPgJY09Mz1mgaTacSk/RD+AqwKrvlAwguGL21emGtomyqXyRXFN
rVeNAWaacWfPJ6SXiG3Mn0BfN40/IuUOtJGXnKVveTzyS0pkBC2PhHrhkh4zgPbJ
rcbpphZvwO+RTSBejcTVwrqOw2UJ9+2MYbBFbfwySPYVVk6lsyMRF8IVUBxtP7SJ
lPI9i4ZJhrPwFmXGmuKbE8In15efXfN+FVuztUNlNfG2CFyd2byytHXeCWvhZGWa
LsT8ZCehYcvheFMniVO4YL+HKGOxvfo9eV4qq3N7yov9aLUr157PeObcCYHk2IjW
TP8qIjXn+JHbZR3zAayhAu//ZgmHpFnY1jSZNJ7OpfN073absSqlscJtJbgUiiDA
rTPaWJIe2IvrjxdFNFHZXJ3pd6WXfi3si+5POhZ28PdCVVhkezX5My9WQj2sIO13
YEzhztlt1mY9D82NMpBNbeQj05OKm+yQxKHy5aNe3q5uUZwKhDqncgzmq/PXJo0y
XWVckC2kquaa3Wpzt92+QPWONNWCljzjDDgJVi8nH4OeDn0OBcqWQFs3yj3HCqOC
h4Yj1UWp/XtU1zyJhlK4wQG5mwVLcSfmJQjK+QW9YVNRUjegor4fxl2aYI+T5Prv
1iXhtonklfl36h5kaWPPKUNYUfvsQLdkJeWLlXwRSUU=
//pragma protect end_data_block
//pragma protect digest_block
QhGOTfh5j0U+bL0chuMcI4NY694=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
x+B35uraZOtSI2ecA+YZff3KlxjirOgXOvRQm1Ehx9pbVh3mBKmvbCGXqofywX9w
70AKsKm1Tx+ld52dLp35xmZ4RMxlbr+2O9hRJvmowXPTAcT1LuKytEuz3eAVZV0I
mPCPVkacV5F7oejjT8hflyNRB6t4ON5ElrkxCObZBwPiyjF3WN3Y/A==
//pragma protect end_key_block
//pragma protect digest_block
aBHztCQue3wTUodN7cEJc+e1ED0=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
XLtMyHJ4imYrwuvURVWnhy1ZGj4=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_CYPRESS_TOP_REGISTER_SV

