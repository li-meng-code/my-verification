
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
2u7k4HB7SweX+aZxDRt+Ld2HLG+TokgCtFlMBJnDfrbl6vODWXKImMedegA159+k
N9kItDGiguxCiDh0wDfdPj468EXSqcZArONT2e1I9Dnq0XjWzaiJlBIcfJoZ3F53
eUqAPcLWY7nnt1I56VgbCqRVIUucVx5USIbL35xniJVu6ZgoOhmEtw==
//pragma protect end_key_block
//pragma protect digest_block
Jd5ytRYz+T3ljZmBYQIiUXqMrWM=
//pragma protect end_digest_block
//pragma protect data_block
LFXPUkVjSdp8J3oy8tlcy2D1DLs3nN49JSzdgjuVaTk8b17KLN9agvSWJaU5bG/O
1jvyHh/mw64WD540E/8tJMmvhAtyC3/snNjFOLnj5uqNgidQ8HiJo8q8K/q3mQB6
bme1kC50ZBKBRY/wFim60Dyr2Qsi5ePObgHp9uAf7PiEhfbCNWMH3IVtRSSkNRhP
99dIi/EsCbWYOyH1OJE0SnwVkcKPCIn2mdcqjb8GA+OxE8wjS0TlqqWy2PqxHvqA
+2CWG8bpTj2YMMSRcTEsm5UK01ugVy78mgANPKY1W+E3jlXeFFan64Yc9XBXK7PU
tcFa7Lu8dQCIHaHCgv30HRNTnl+3uiiKrZdPCl7WX867U8ix0U5vkbs3cde6E2Ps
UPhAlN6iK0sT2KLRtykuZ6Cddt2FiulOT6ocveB8kMrAb1voTULhRIkSZxajyJrZ
T+PPG9JYdmG9oWr4qZicNYOgsqp6QB6wOwmCj7vI/wQk9/BH4CqDvZOleFym+sPS
tLkhETuMU8BSjbw5mJdNXirlaAUtJeiOO89w+MudOVmUxeqp4YodzBn/RAhbwQdO
CDiLNp/P2J4K/340c67J9F+Uc3lgSnwO+Zf47HQin2qpJZV1Gg/5DKydDJPOWYCL
ionCJ2Fu1tjDlvDt/f8LiWKilJSunF2yDz+t2W1jIflFBwgNFrJEl66OQzTkzz0/
JNXcZ7j7jlmzPEunMeMGkbNtBEd9LjwufsVkEsMeCOIedls3/NDjt6z+sHjyfBFN
/cPfevZugSA22a1QK4KwYFre5XhnsXoY4JGSBhgGtEWT1Ilolc8JLbEhBYEq1P2C
41JmlF84OZ3tuzwhjBlWMS7O6jdKGY6vUfa8IwrOpJDmPJh/PX+mSmARXZCWgMU7
8clIHNkqfGTE+qHmiol8do9qfgUUhFlrJDNbykWqr0fcHzaI4qJHpdkAoLwoQ7/M
tdHj8ZNKKgeY4ieK4K5T1iaj/L3HoiDvsklsfzEok7cShY8MiLGf26lQSVZr4aVJ
pQjbW59SiTvJRGtd2aqYrOlgUweeiEgzD5+CyL25WO8=
//pragma protect end_data_block
//pragma protect digest_block
AuFOm6ewiY6gZNxGQbeyBf6CfF4=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
RsYpUQ34bRu8Jyop4M5RSMuq5RkCY3SYuCxrEn8+pXpWoxNPCugq+Gzl7Jyd2//c
LRjzJQmnfA5B+CL1N15gcxF9hjhirjUomZnJBQtckx7Auykg1CfLa392CFKX++6J
jXzRkMmXUBNe4zMznC/CFUvBrQM/LKdmmiWp+TfQkTxd3S7H8CZJ7Q==
//pragma protect end_key_block
//pragma protect digest_block
OnyCiM+0jTAxb8q1/XJoJRgYx7o=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
ttQ89S3sE+eZMDnTmsE8m1mciuc=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_WINBOND_TOP_REGISTER_SV

