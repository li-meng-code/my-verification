
`ifndef GUARD_SVT_SPI_FLASH_WINBOND_TOP_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_WINBOND_TOP_REGISTER_SV 
typedef class svt_spi_flash_winbond_nonvolatile_configuration_register;

// =============================================================================
/**
 *  This is the SPI VIP Winbond top register class.
 */
class svt_spi_flash_winbond_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Flash Winbond NonVolatile Configuration Register Class Handle. */

  svt_spi_flash_winbond_nonvolatile_configuration_register nonvolatile_cfg_register;

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

  bit [3:0] security_register_lock_bits = 4'h0;

  bit quad_enable = 1'b1;

  bit [1:0] dummy_cycles = 2'h2;

  bit [1:0] wrap_length = 2'b0;
  
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
 
  /** Current Address Mode */
  bit addr_mode = 1'b0;

  /** SPI Extended Address Register. */
  bit address_segment = 1'b0;
  
  /** Block lock array, indicating individual sector block lock/unlock status. */
  bit [7:0] block_lock_n[];

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
  `svt_vmm_data_new(svt_spi_flash_winbond_top_register)
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
  extern function new(string name = "svt_spi_flash_winbond_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_winbond_top_register)
    `svt_field_object(nonvolatile_cfg_register, `SVT_ALL_ON|`SVT_NOPACK|`SVT_NOCOMPARE|`SVT_REFERENCE, `SVT_HOW_REF)
  `svt_data_member_end(svt_spi_flash_winbond_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_winbond_top_register.
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
  `vmm_typename(svt_spi_flash_winbond_top_register)
  `vmm_class_factory(svt_spi_flash_winbond_top_register)
`endif

  // ---------------------------------------------------------------------------
  /**
   *
   */
  extern virtual function void create_winbond_nonvolatile_cfg_register();
  extern virtual function bit [7:0] get_winbond_status_register();
  extern virtual function bit [7:0] get_winbond_status_2_register();
  extern virtual function bit [7:0] get_winbond_status_3_register();
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);
  extern virtual function bit [7:0] get_winbond_extended_address_register();
  extern virtual function bit [7:0] get_winbond_block_sector_lock_register(int block_count);
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);
  extern virtual function void set_winbond_status_register( bit [7:0] reg_val = 8'h00);
  extern virtual function void set_winbond_status_2_register( bit [7:0] reg_val=8'h00);
  extern virtual function void set_winbond_status_3_register( bit [7:0] reg_val=8'h00);
  extern virtual function void set_winbond_extended_address_register(bit [7:0] reg_val);
  extern virtual function void set_winbond_block_sector_lock_register(int block_count, bit [7:0] reg_val);
  extern virtual function void store_winbond_nonvolatile_settings();
  extern virtual function void store_winbond_nonvolatile_status_1_register();
  extern virtual function void store_winbond_nonvolatile_status_2_register();
  extern virtual function void store_winbond_nonvolatile_status_3_register();
  extern virtual function void reload_winbond_nonvolatile_settings();
  extern virtual function void set_cfg(svt_configuration cfg);
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
YHW4m4dBkStGqtAmmVPslnbdb27waevSw2zqivSbCV1fWyAGh7ZZVgIm/8GRXURG
MgBQYPAFStbzaI9dW4AD2Oy+HDGM0y59rx//gbyHGN7mZ/kzSJh7aKIuz5frCVnb
52OZlkVc9h0gZhXdfGH15Z9QdaNwZzBd9h6oV8ea3tc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 630       )
i51R9nP1P71kGf9EJ2eQSCsiKHWCVCY7ZenNvIh2ic61FF3rK+Ln8reZPqUTjOgf
WOsssMj+wkQe+W50Wn5cKakz8UBIPqxeNjjZBJYlv+a7KEItEvLSon2nByVxMmNT
dM01+sS5oLJugwh81MjhNCaVU6cgbWe/vNicvu2x5pN7wxyFpR/eAvjKHcN0GQy/
65khy3HvS/cVha53L5MOp+rTo9WThW8MWQfajKNnLoDa3mQu7Gwl+d33qxjtOBWt
dpyQGOEJl3L0s6llGR0Bk5qWlSj7AagtSRwdnStx6Zt5zX7pPXhz+VMTQRSsgrxW
xYpWVEeEskQ6qbfp84i3u9Z5H5qmNmY2t/YIqvBOVAFS2a49UYEKqkGrdpWAWVU+
hzrEnOb4e7sp6rSc2WKGANSKyzCmwT1xH8qkpvYM8TTHveQiB4IONbUpkDtFhx7B
lpSyKIxDntLGJoEI4A8E+IyTggIadf3HNYQMFOOeCt4Jn0DiRB3zZ2AQLnVEjsPr
PKRr9MvOvuWNgZfG3UMOPtQ5xlyvB2CJOuflWaypnwUgFi5+KGwSa6pHXzO9TEft
ed2Ye1rj+ZkrYId7hGWCX6vOqf3Jz5laHsvFUBW2VO7NZ4YR3ULgc/rLdcMJyP8y
3GlNLb8lexN46lvVcgnjJ71fZY7oHs+FnHYHBsvwPw/nJR8uwcWW538PzqOi7H+l
TbwYDHaDFT/BTHeM48O/O7gVuMEiwgYh5pma2WwIJesDaYskW6F9+uf7duFTgsBU
htZJ4xW5Y3hN1Bm77OZHVLMIW0RWP6bslEqFgchf1yVwG9t341Wx8PrP36LSbsMz
jd1PevTUNCWSYVuLtazO9Q==
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
BWdWHPk8hCU3fRE/Vbzm+IoNCdiwyTxqL6MZn9WnjeFCbPiyyOlM5IisWMkLEK0y
VJA+g0o+sDcVOhYGfU9+Iq8k/pqFMKkuKEPtfsrsp2cemRkG2cBziGoUy/WxOcnE
jAa97JF61XV/A6YEX+0kQcQkX5ZQv5en3R9WhA+kODI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 25710     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_WINBOND_TOP_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
WieyXRDo9iWMbgomwNWy6ArnQcvsts/kKx0ABPOG/lc2oRAEPLMnLJ/YEy9q2VFn
MA9hyrYUZYh6qK40agTaAvAawnJjHK81Tjye7OaaVz6BNCrS6aXwrAhbFHXWBrVj
zVxBR8IeNBZzIJF/iW8hCBTvjgmU/b4NCHud8f+jv6w=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 25793     )
wC9hsUNt1ct9UJNFONlVMwhYz/QyP0jWrLXsKwV99mG7QXqUxqlWavg4tPwEl3pe
0/H34m8bu4vaVm4gBrwZg71be6bRKAoENM9yfxLgKMSVKeZlOAdUlb78Yk/ySZfU
`pragma protect end_protected
