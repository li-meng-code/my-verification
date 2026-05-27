
`ifndef GUARD_SVT_SPI_FLASH_MICRON_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_MICRON_NONVOLATILE_CONFIGURATION_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP 'top level' status class.
 */
class svt_spi_flash_micron_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  bit [7:0] dummy_cycles = 8'h0;

  bit [7:0] xip_mode = 8'hFF;

  bit [7:0] output_driver_strength = 8'hFF;

  bit enable_dtr_protocol_n = 1'b1;

  bit reset_hold_enable = 1'b1;

  bit quad_protocol = 1'b1;

  bit dual_protocol = 1'b1;

  bit address_segment = 1'b1;

  bit address_bytes = 1'b1;

  bit [7:0] wrap_mode_reg = 8'hFF;

  bit[7:0] io_mode = 8'hFF;
  
  bit [15:0] register_value; 

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
  `svt_vmm_data_new(svt_spi_flash_micron_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_flash_micron_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_micron_nonvolatile_configuration_register)
  `svt_data_member_end(svt_spi_flash_micron_nonvolatile_configuration_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_micron_nonvolatile_configuration_register.
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

  extern virtual function bit [15:0] get_register_value(int addr=0);
  extern virtual function void set_register_value( bit [15:0] reg_val=16'h0, int addr=0 );
  extern virtual function void set_cfg(svt_configuration cfg);
  // ---------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_micron_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_flash_micron_nonvolatile_configuration_register)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
fpgpIU0thyEClD5z9A3ykpTTi41xueY7EsDhVYIUQbYw7sZq14nF33595YuMlJ0A
4X2PoOydeLw/rq6+CxfU8kh3Ie1BrKtmokC9JeG+NAM3NcQHv/Bmllx1acEWyED0
nuaEZueN2QkEIevzqOLsWCngCGVhvlfCA+ELhL0JS8T18GrOJENdSw==
//pragma protect end_key_block
//pragma protect digest_block
bPFZ/pwl8OYssSvxSM430cxjpEA=
//pragma protect end_digest_block
//pragma protect data_block
uJxQD6PjFMZTotoPqkAEPKtcem3Rjuc2oyBoHkhEP3I0a4ewzESEqVXaAY+dYYKY
xGoJcBQZ7xw53od1umONN84y9M+UDHPu+dTi0Xpi05CSA9MSH2IAskIRTq7nh8qr
j4dKdJwwRi65HwFgp+am+QHKGf8FST99pcPBTfZCt/QFEXzbTkqHpZkDsIATOcDY
mnElJDP24GIKNyO/jm7fR/ncsvNQUKicDcfcn1S8aGUKG0xcvYfI11AIWgN390r9
sTy+2Og098f7sOmUiekRWYTrq4HNl3P+/xOKk6AQQS82UyprNGmSlpA7CtqPkC2l
wquy13aQw4KVeDJAZWZxlmxEpnsowwN+TCNpGwo8ej9EXzPODMVMzwpjwHg9C9lD
TaATeeEW9LCjvEfD1TUFoZkZqfBxWSoHUQ8Bu9IRm0/JCUojM+lXnk0bdKqPyClN
5Jz1mNuXcXab7hS3HnGWPSr7lpCyfNDuwDXuHkQSBC4ugVv2wNFF3tJHOqG8SYOJ
+eufpa+k10Ni+ur6urM5mhk8fHuT7eQ+/RXBLeO3Wz4dXykeycE6jX9EiORF9djt
+mca7SfYfsw221RErvDW6Zu180wmx5jAdgkcF3ys9RPFFR7dTAbDNWU9Ls/XHEKD
8vTq/UjnegfGXW4tojRN5qYi/7X3XFXJl8YqCsijZZUPo3hqmP2n0EG99q5r4nWu
B5OoyflEpbDWYKSWATXS9VOIr8zeGQkiJP/SOzXBzWl2/MRaCwzFZuEKe/vhZ9RC
MQuy7z69t+PaZ2cyzcOJOTRqTEaHNU0MldrR3A/2uh/hL4n/oXLt0C8BnHZNQKL9
f6aF2+MwmhMNbwneWvrEx8I5naD0Fg5hQm1GvaAMHQYfE0RA8j1ov1YerEGRPbvm
eT6SVa8Ufav7d+JHTMqOAib560EWnQovN8Wdjm1NkD8WeeZdZNlSIBhg+I/0FTc2
yqoahejq9MYmBKUnY8xqbq1rO4py453SIz+3K6kVCBDe+331p7IxCrSou0ku41oC
gFx1dtveir5ildxB2Sd6wDQnDcCQUhoIDu/FunCZQvtGQIxBTQqCdNNqSMGkmcku
5RjBrOrOKsElrRJb5zXiIfep14qZ7dU9GEcw+nWSOVB55Fq7WYPDrMck8XLaL8t5
z4363UbqgV9QQe/dnJxbIoiGOcPGnAnb8SkSp1OTi0f6HzKZec0MWrY6I4l+x7wd
vI62Wf2sS5u2T7vqxMXWcef2C/8Cn6UNnDDMu+Ji0YLOauv0j1Yq4jtH41AEhkZl
Qm51uCERa6jfo+i9JUgJuSITSXztq+s9Z3aDlyaDWxNfmp+osm4vdkuMEfSUM6zq
W6mn230dJ+4xMhLuNiOLu1mOu2LZKi2rlK7JrulTqaMQo+rUdAbMj23klrJmGO91
aooD15VodNS1yesW2oTBtPLpsqyTsCLV/8idwEyfptKMKlb+nZn+PdVoOYeGEsxs
2d0JHk+X9GCZ5k5setTDK+JgaVc2keh/SiqXhb3BmKNDKhewIhVEZt1KFVOJdQbl
V3GDc2Vc4rpBx1soEbcMjxywgRRIrr/W7kWXVG//0ChpdFJ1g7nzKXCmid8xh1ky

//pragma protect end_data_block
//pragma protect digest_block
RByL6v9NSEerU6T+p+NgDrz9aPU=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
IgZj6gPuCI8Qu1yVkbfPI0YZqfNJx6RlOOLAvTH1jIVfAhado33Esr+lnqkeK07W
OdvyrTS2vR7V1MTp+N8bUiq3KWOUFdjWKBs+RKQ+/YAvG3GWRGrWC+tXplpAp07i
gcRTL8BciojvfaFBX95/OF5cW7kMuuH5V18IBUv7HOGccwlDQwcOoA==
//pragma protect end_key_block
//pragma protect digest_block
urUZO1GI+Prb6QL9nMIc5CuNlSY=
//pragma protect end_digest_block
//pragma protect data_block
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
VRyl7lbT1Z+lugbUthJHow==
//pragma protect end_data_block
//pragma protect digest_block
Pfu3u5MN7w/3H75+eOi/RwbNM8Y=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MICRON_NONVOLATILE_CONFIGURATION_REGISTER_SV

