
`ifndef GUARD_SVT_SPI_NAND_FLASH_GIGADEVICE_TOP_REGISTER_SV
`define GUARD_SVT_SPI_NAND_FLASH_GIGADEVICE_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP GigaDevice top register class.
 */
class svt_spi_nand_flash_gigadevice_top_register extends svt_status;

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
  bit [2:0] block_protect = 3'b0;

  /**  
   * Determines whether the protected memory area defined by the block protect <br/>
   * bits starts from the top or bottom of the memory array. <br/>
   * 0 : Top Blocks Protected <br/>
   * 1 : Bottom Blocks Protected 
   */
  bit invert_protect = 1'b0;

  /**
   * This is used to reverse the Protection set. <br/>
   * if set to 1, previous array protection set by #block_protect and #invert_protect will be reversed.
   */
  bit complement_protect = 1'b0;

  /** SPI Feature Register. */

  /** 
   * OTP space can be protected after Programming it by setting #otp_protection to 1. <br/>
   * The OTP space cannot be erased and after it has been protected. <br/>
   * it cannot be programmed again.
   */
  bit otp_protection = 1'b0;

  /** Configures the device to program OTP locations if #otp_protection has not been enabled */
  bit otp_enable = 1'b0;

  /** Configures the device into ECC operation */
  bit ecc_enable = 1'b0;

  /** Configures the device Bad Block Inhibit operation */
  bit bad_block_inhibit = 1'b0;

  /** 
   * Configures the device into QUAD IO operation. <br/> 
   * 1 : Quad IO Selected   <br/>
   * 0 : Extended or Dual IO Selected
   */
  bit quad_enable = 1'b0;

  /** SPI Status Register. */

  /**
   * ECCS provides ECC status as follows: <br/>
   * 00b = No bit errors were detected during the previous read algorithm. <br/>
   * 01b = bit error was detected and corrected, error bit number = 1~7 <br/>
   * 10b = bit error was detected and not corrected <br/>
   * 11b = bit error was detected and corrected, error bit number = 8 <br/>
   * ECCS is set to 00b either following a RESET, or at the beginning of the READ. <br/>
   * It is then updated after the device completes a valid READ operation. <br/>
   * ECCS is invalid if #ecc_enable is disabled
   */
  bit [1:0] ecc_status = 1'b0;

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

  bit [1:0] driver_register_bits;

  /**
   * ECCSE provides ECC status Error when ECC Status is 2'b10 as follows: <br/>
   * 01b = bit error <=4 were detected and corrected <br/>
   * 01b = bit error =5  were detected and corrected <br/>
   * 10b = bit error =6  were detected and corrected <br/>
   * 11b = bit error =7  were detected and corrected <br/>
   * ECCSE is set to 00b either following a RESET, or at the beginning of the READ. <br/>
   * It is then updated after the device completes a valid READ operation. <br/>
   * ECCSE is invalid if #ecc_enable is disabled
   */ 
  bit [1:0] ecc_status_error;

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
  `svt_vmm_data_new(svt_spi_nand_flash_gigadevice_top_register)
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
  extern function new(string name = "svt_spi_nand_flash_gigadevice_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_nand_flash_gigadevice_top_register)
  `svt_data_member_end(svt_spi_nand_flash_gigadevice_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_nand_flash_gigadevice_top_register.
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
  `vmm_typename(svt_spi_nand_flash_gigadevice_top_register)
  `vmm_class_factory(svt_spi_nand_flash_gigadevice_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Protection Register */
  extern virtual function bit [7:0] get_gigadevice_protection_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Feature Register */
  extern virtual function bit [7:0] get_gigadevice_feature_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_gigadevice_status_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Feature Register 2*/
  extern virtual function bit [7:0] get_gigadevice_feature_register_2();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register 2*/
  extern virtual function bit [7:0] get_gigadevice_status_register_2();

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Protection Register */
  extern virtual function void set_gigadevice_protection_register( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Feature Register */
  extern virtual function void set_gigadevice_feature_register( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_gigadevice_status_register( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Feature Register 2*/
  extern virtual function void set_gigadevice_feature_register_2( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register 2*/
  extern virtual function void set_gigadevice_status_register_2( bit [7:0] reg_val);

endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
XXzSVNMqLzIKsQl3cp9Jd02x8CU9BZxFO8JmWGSiVhVq+qvraXeum8iXfxT2VfmF
v9lmbSiaVpYm+cO63ob8OwUCPJnz5qIOPj7FcVvz6+3h8fyjoVOZpj3JmOQUkocg
P9knXLZeyP9wySRPvrQUsCvVpaybnCEe5yIausZtMdd4QfW10EBuUw==
//pragma protect end_key_block
//pragma protect digest_block
tdiEbs93QPaBLajoUVQUg5ctt6o=
//pragma protect end_digest_block
//pragma protect data_block
F87z1/P8cwp61EIdMzf4MFLxgf7HtL7k6wgpZtZTs8IW6864dO1kup28vo5rte0u
2yyEZzKJj75eM/tVFP2DxkAIS60fYLz4SdKaauZSm2ObVW13fQJfUGDTLscWJO89
ypVTe1vuHzSXbw1u80KkCQbboY9IHypsmHZU3pf5Fy+eyVreyY+bvsUK9A/0deim
FiT3xyhVt7ssHkaT953seYbbKZJd7AMVxcpvd5NyMc8MvZi1NWl8mNPN9T6K6CDS
SKSAq0wuZWZKpZsCUwb/VeZ/inpjR6NVSPIgB4AuRkXCe1sCwqgg5g4k/PJ7EFtZ
KafkPWJyij1pOjLcPoo1yNljCxanSnfrXPWCsksRwgjQZNydWJ5gLp1cVmXSjLP5
xpjNiOFv7LhU/9kVxEcNk+sIINOD6KeWQBWk7swzpKg9GDPMDMybaG4bqWNEPGj2
OIsirTQv7ElcKq7W3voAzKtK2LUTA4m0mibEjxKAT7oEH5yQFZXY8Vhvv0Zvq4WB
4+SjBJLHqBssUz8DUBng79Jsz4MLjxdnQBIAdd1a6jilC8Ksh1Gs/ebi+HmyHQkx
IBZmHu0vGB6ROO+9F2/ih1XzaMVf98bSB7dM9pEv4coniv6Uzo1EoJiES+FCQZwo
1FwPzPYd82Amqjlsq4Wi3SV7G2tuzAxTE9Bk+DdJEfkXiAK9pzhOPBBZJuKGF6Kx
pqUUXGNu1NWF0UgBL0bpIZjIhcWs+lcDzS1ZrqnW6mDkOLRBZhn9JrVi9+2bk93Y
az0pp3UG9xshkxuQULrdThS4BevoCZvnyVelQMtw5LSMbrkm/cOrUvaEKp4os3B0
/pEE409s8NEWr1oqkVx/ghfsHl6I2KUN/Tu0cdSA4m1B034n+F4bz9G89Mikxz07
IpndY2aJx1mlVmoZuZ/fA3LJTZebRJ70NmwuQLdHVcXg+v8AW2YjoWT0B1UdrQja
GYRHp5hm83l94zPmb3nbfYvbBTWBAwy8X0LKRX216ItUqhFKgavSKW5zTfhTMeBN
yb7+Tb9TjD6KU0pLhlzpAw4UMcdvbQknFGWih/nsAc9eOMXc9PF6vniXJmOAaTGH
PKrIvFH+sf+wp0Na3TFYgQ==
//pragma protect end_data_block
//pragma protect digest_block
tAt425o6TnPNoIZkDPMAD1XZ2Bc=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
eDqm9h060OkjERNk0sSkFf8XgEAuGyxkXVissHKwKvxr8m1+oBK/G3Iq/eTzhRLn
tUx8JcZm9BZAchtowjmwqNz4wcinKUtZWdxNu+5UDBUVQVXa4XWQpnKg9ni/Izuv
NPjKkZAKp9RDmAMIdLxyttofi3W4DsvKOtCXOu38a4Ntug/VHvpVjg==
//pragma protect end_key_block
//pragma protect digest_block
98PsWA87Ab6g5b3oqu0HpCZYEnA=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
RpMrIKUt0JEOh9zPybBRpaolNHI=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_NAND_FLASH_GIGADEVICE_TOP_REGISTER_SV

