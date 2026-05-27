
`ifndef GUARD_SVT_SPI_FLASH_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP ISSI Nonvolatile configuration register class.
 *  This maintains the copy of Non Volatile fields that can be stored/reload based
 *  on requirement.
 */
class svt_spi_flash_issi_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Read Register. */
  bit reset_hold_enable = 1'b0;
  bit [3:0] dummy_cycles = 8'h00;
  bit wrap_enable = 1'b0;
  bit [1:0] burst_length = 2'b0;

  /** SPI Extended Read Register. */
  bit [2:0] output_driver_strength = 8'h00;

  /** SPI Bank Address Register. */
  bit extended_address = 1'b0;
  bit bank_address = 1'b0;

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
  `svt_vmm_data_new(svt_spi_flash_issi_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_flash_issi_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_issi_nonvolatile_configuration_register)
  `svt_data_member_end(svt_spi_flash_issi_nonvolatile_configuration_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_issi_nonvolatile_configuration_register.
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
  `vmm_typename(svt_spi_flash_issi_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_flash_issi_nonvolatile_configuration_register)
`endif

  // ---------------------------------------------------------------------------
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
kCUBZGk31tUKnZbYGS0bD/irn8ApumajcsuvuyTJC4T8e49IzNvR3uVOx4lDxsTJ
bq7w0gV6Dlb5nrMCVjSczEOOGQr6xawSrDQXqU5BecOl3NwV2Nbtn40Zz9Kd6scG
PNDhisL99ILiAdPqvwvYQWKHw5HaebRQKxKHwDju5R625bXausQ3sw==
//pragma protect end_key_block
//pragma protect digest_block
8yvwernrDJWd3EmgsS3mvwcHZ+M=
//pragma protect end_digest_block
//pragma protect data_block
qx9RDUVNPHk74PhyI57Aq2zd7CZgWCn0lPvIJBViLl3lzr0rZKAhI9Aj+cUEuNsE
k7WH42cVbhgo7NXRjUPcDrWU+SXtXTKRkWF1UEdqXxcvJCwoOeLrDJG4P8wcZoTJ
Td5iM3HyLNLqKe+Wo89c9nF/a+7PvA7OYu1ynA1QKZQUn2uR5sue4GwPGDysMgSD
lztMbykeUH7EzPVFgJoSHD6lWWuxIPDgqHRRIxhyTEySIdR57D7fmtZASGu6SjEz
6iWVjLXtMHG/xz4tSjju3FoPY8fCGizrs0zEtVko2YWN6cT+tLTbr0j1gOr7x454
cGj5cdDGDafnVXV5jB4Pdn+ADomGnP7+uQkDnN3Zqad1qD/foznHOCYSWDZtDS+B
QAag9jO6hvZCsbAADy7eKtCs05y8YDV+lJ1ZERULeGd8f4yTd2ZkMznmjt2HWDMD
XtYaBAH+eLQK8f8K3Me4/lSQofFp5DdFMjRon0iT7PshfKm1O+5Ky6I9tRpJiDub
TF0Em3w4XN8W1hjjxtR2Q9DMufy4VfAuyzKgchNLjP0WVmZ6U1P9FZmXeYvm1efs
h/YzipzU9TB7pQDNpdED678o8tiM3mXxkpBx7jLKHo7IQBipdvSFI+43titE22LJ
nTo2c0UGXoUAq6Tutb2Y/H51X+ca6Z+vuami3JEm4BfmCFLCJu6BalDdR8ynoyLs
ebH12gHfs4pDEtBWOaFk8SB/foYMmEMckHnfUdWt3OFkpDL6goqHKF/bMlYg3G+Y
HWzcJqaT7R1u5sf4iP2kjWI77/RfMjL61rVYrkSi7bH/FZM1F8jiTWeKfkSDCv6e
N6VuGU4DBjXVPqROlrut3M4jx1ulzW7PeGURlyIBLZog9KTSppjVU/qSS7o8dwzv
pHzV+LJ6XMQqNV4IBYCwraoOe6L/A8zNnMUGHiDwENhkufM7T5VeIJVCC5mxwdp1
D8fEzn4hAq9yVineUoSjGPjV/FBRvEuxJ5/3VojJLTWwV1U5RtOJlDJFvBDdHyu5
pyYPXbPzW+SprE+9rdATgMy2uqOMOjLgw2bbjUlhSTYLE6epYZuyil9SHmItIeaW
+bkQXCfV5ebnxEtCIeMRnAJ9SC0oEq60e88xrADXlUdF8ovAMHv9dLUVeXgJ0WXt
em7GZ00QCo21Tjj5vNi3nQ==
//pragma protect end_data_block
//pragma protect digest_block
bkUNJfPT3hkjItp3n+jaeM74ar4=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
ir1MPC16D7IJwTDW6suzq/G9ROSy7MRcoJCzyWrnvPmnjjjAgxCP/NeLsbmObYun
B4eqxOrlHeImH5kSBnBoNABc4C9JLrLXX2RZwduHIj9tCg0RiQMaigmKOgPLLpmh
OMx54JtGWf+LvgaotmShumyt7UkptTm52n84Gqrr1K1pvMK8a8wIgQ==
//pragma protect end_key_block
//pragma protect digest_block
16C5jVfXLLIgGg86leG0JRNWrSE=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
WLxd4xA0t/7PXDnyoryS5r9TVNk=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV

