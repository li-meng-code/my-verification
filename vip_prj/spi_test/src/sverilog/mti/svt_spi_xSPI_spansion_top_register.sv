
`ifndef GUARD_SVT_SPI_XSPI_SPANSION_TOP_REGISTER_SV
`define GUARD_SVT_SPI_XSPI_SPANSION_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP xSPI spansion top register class.
 */
class svt_spi_xSPI_spansion_top_register extends svt_status;

  /** SPI xSPI Flash SPANSION NonVolatile Configuration Register Class Handle. */
  svt_spi_xSPI_spansion_nonvolatile_configuration_register nonvolatile_cfg_register;
  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI ECC Status Register. */
  bit [7:0] ecc_status [];

  /**
   * Selects between 1-bit ECC error detection/correction or both 1-bit ECC error detection and correction and 2-bit ECC error detection. <br/>
   * 0 = 1-bit ECC Error Detection/Correction                                 <br/>
   * 1 = 1-bit ECC Error Detection/Correction and 2-bit ECC error detection   <br/>
   */
  bit ecc_select = 1'b0;

  /** ECC Status Register (ESCV) */
  bit ecc_2bit = 1'b0;
  bit ecc_1bit = 1'b0;

  /** ECC Address Trap Register (EATV) */
  bit [31:0] ecc_address_trap_register = 32'h0;

  /** ECC Error Detection Count Register (ECTV) */
  bit [15:0] ecc_error_count_register = 16'h0;

  /** Memory Array Data CRC Checksum Value */
  bit [31:0] crc_checksum_value = 32'h0;

   /** CRC Register to load start address for CRC calculation */
  bit [`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] prfl_2_0_crc_load_start_addr_reg = 0;

  /** CRC Register to load end address for CRC calculation */
  bit [`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] prfl_2_0_crc_load_end_addr_reg = 0;

  /** Interrupt Configuration Register (ICR) */
  bit prfl_2_0_one_bit_error_detect_ICR = 1;
  bit prfl_2_0_two_bit_error_detect_ICR = 1;
  bit prfl_2_0_ready_ICR = 1;
  bit prfl_2_0_INTR_output_enable_ICR = 1;

  /** Interrupt Status Register (ISR) */
  bit prfl_2_0_one_bit_error_detect_ISR = 1;
  bit prfl_2_0_two_bit_error_detect_ISR = 1;
  bit prfl_2_0_POR_Detect_ISR = 0;
  bit prfl_2_0_ready_ISR = 1;

  /** Event triggered when 2-bit ECC error is detected.  */
  event event_ecc_2bit_assert;

  /** Event triggered when 1-bit ECC error is detected and corrected. */
  event event_ecc_1bit_assert;

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
M9YIPHNxL9zC89J4KaqBhefHS2tulxau1BlApgH95Rx5F/egm6/JTh3w6yupeTmY
GD1GJaZurA4JnXnPOiI9ZWljdmTz5q2U+p9AL3h5B/hGuXYtQ4WWT5mnqgfbqZxS
P/QNHdemZP9iGUhF1SxP7XSjJIoswrhfsnQ0VmiYp5Y=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 336       )
zIg+BiUX6j8lScN5AYZB5upIkMwyJGyNrhG+Orls1nGgAXi2J5XXHhAfbB8w/gek
/83VYwnkonIznSDlpl6kW52vCTGd7RSv4F1UzKB67z80rU4mhsSWrwh/ZzKl935n
K73e4cLpmXe3Sri/F4RgSrQCovfDvaB67Lj2A0RgcnsmdLJ1RMh6UyBE0g04WZKS
wggDP+GHLvnpJSX3dHLtfV9LcBnwFSJYP+vSrPq4XP0R8KHfvJDg74CZHr1/FNwa
Hugor5BpkMVbHO3UR6ikCnrpwODa7huqKalfHw0hQCXFevnqXtfHF4ClCeT4SAHB
CdmSjivKEXXVGlGnpXRoXu867OOiJTgKBBInILxD4OEDsSzc2r6bIS6xSxSN1ouu
57G2ms2+c1BIh9n2nVqKAirSN4tz6JS1OVQQVi1CAE6unTG8b5nIAYQg5ESMhWXF
byWdUYYlJwT4CJ1v4Dth5g==
`pragma protect end_protected

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
  `svt_vmm_data_new(svt_spi_xSPI_spansion_top_register)
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
  extern function new(string name = "svt_spi_xSPI_spansion_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_spansion_top_register)
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
JKGthrYdwPym8J5oIQ1QksRta2eCTxJc/PoWmpC/z1sBJuTI5dbgdELqNozDD3b/
oDsJi6NOSR0z8jB3lc4iZjCL7R8TUNHoBDStaHEVZ98foUO0sU8IXkwNC342Eekt
1ceBf5I2M4qKCHv0jXQy0vrgdvTaQx2djBltIN0epzE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 539       )
1JYkIWVesGhk3f3XkPgJF5++aDsQvUoZyrjt8ziakb+dXgw21Dtx1pAlmgyfNBve
wvzG+dNlsKZrosy+5WBwHEdlibtECDcdrNhoTg+PAS5fnaOLpO9S3jrUsT5NWWTs
VF+4k7aAPCOqVk2JjGHpd01U+Kof0WsH97hxbtOqPCMVIKaeaPYNf68NIkdODTd4
7d844n/67lrL2nRRXaBLzkBMynuhdRJSrG9zZtX2PyW3ahRJsxYekzTJyBPR/A4Q
hgdEnahDr7A8SZ58TU5xJQ==
`pragma protect end_protected
    `svt_field_object(nonvolatile_cfg_register, `SVT_ALL_ON|`SVT_NOPACK|`SVT_NOCOMPARE|`SVT_REFERENCE, `SVT_HOW_REF)

  `svt_data_member_end(svt_spi_xSPI_spansion_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

  // ---------------------------------------------------------------------------
  /** This method sets the configuration handle */ 
  extern virtual function void set_cfg(svt_configuration cfg);

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_xSPI_spansion_top_register.
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

  //---------------------------------------------------------------------------
  /*
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
  `vmm_typename(svt_spi_xSPI_spansion_top_register)
  `vmm_class_factory(svt_spi_xSPI_spansion_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method creates SPANSION Nonvolatile cfg register */
  extern virtual function void create_xSPI_spansion_nonvolatile_cfg_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value of current ECC Status Register */
  extern virtual function bit [7:0] get_xSPI_spansion_ecc_status_register(int ecc_unit_count);

  // -----------------------------------------------------------------------------------
  /** This method returns the value to ECC Error Count Register */
  extern virtual function bit [15:0] get_xSPI_spansion_ecc_error_count_register();

  // -----------------------------------------------------------------------------------
  /** This method returns the value to ECC Address Trap Register */
  extern virtual function bit [31:0] get_xSPI_spansion_ecc_address_trap_register();

  // -----------------------------------------------------------------------------------
  /** This method returns the value to Memory Array CRC Checksum Value Register */
  extern virtual function bit [31:0] get_xSPI_spansion_memory_crc_register();

  // --------------------------------------------------------------------------                                        
  /**
   * This method is used to pack the register fileds into their corresponding
   * register using the bit location provided in register field class.
   *
   * @param reg_name specifies the name of the register.
   * @param reg_val_serial specifies the of register
   *
   * @return The 64 bit width register field data.
   */
  extern virtual function void get_xSPI_generic_register(input string reg_name, output svt_spi_types::serial_queue reg_val_serial,input bit enable_profile_2_0_mode);

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [63:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  //----------------------------------------------------------------------------
  /**
   * This method initializes the register_pack objects with all the regsiter 
   * fields of the corresponding registers. It stores all the register fields 
   * along with register names in their respective register.
   */
  extern virtual function void create_register_pack();

  // ---------------------------------------------------------------------------
  /** This method sets the value of current ECC Status Register */
  extern virtual function void set_xSPI_spansion_ecc_status_register(int ecc_unit_count,bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the configuration handle */ 
  //extern virtual function void set_cfg(svt_configuration cfg);
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
XLs6/muCT2xFZT4X66cK3x5be+nCDPvMRw2iwNcfmm/9pLLC84genh4EN8GCLAc+
9AxUYUWTtEwnuFsv0Iw01G0LXcf4Vk6BxoT3lFv7/VXDqalsNLT7qYAjDIQmaFFx
/X0VHZXqhkuBUe8Iny7iNywnaLgdtcvWYvqWij+4f/M=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1122      )
C5sRiDSdj2uJFSheqlClUVDxoqMb9Tnajs5HSiOFVV4s1YPCkimrT8vJEelPchRh
mokQIBUQc3zY2zi8plC10ApL7eoobawWjdO3EklEl+UU5i5+RXjF00hy6LWqzSrM
XurHb1u9a+iZqUmAQCQvCjNuoUegg5fk+48drvILWahMjUrIqQNTEAg14D8L9KTi
taIfAUGre9Vbq0x0whlciKjDsHNMKdsTTHmcGJ+JEJ8GIelBN8UseQwkNCKLOb5j
xTTyV3y8YyRo8XE36rkniD4RNhFThgEpDKBd9nC0Reltulo7bBb0Zwe09kzKownd
kryAoc6OyYBphOXo5SGMWHE7eSd4olyCgxukkHDwketfpRqXtka99CQ4foappsbq
xtpsaYtrqTa5oXRQekPCpE3NZB25RoCcj/l6TyAyw8jTnfp6IT/JiH7Fh2Z1y7N7
iBrFiTuVyvqqvnAtWlIgjkYHtD3Tq2KacGbuOq4eTdx0tuZSMdbkg36ifCaukp1j
skrzRCrQjXzPO3zy4KY2n6NNg7mI0RobFy0VRFe2hTh5vKCapjtsPJKRit5Pdc8X
8PpuwOkIO5zQMfqp25vfEuAWeXLpsMSsyWV8BnL9m9xBFatB3PR83SFZXU0b6h34
VowKo5IId4Zdm56wTDibG0QeL8NFY7Z8iV2u0HszDathJRoBKYC76JVcQV3H3/aX
PActEaRGGEbCShjqTvembV2LJ/UPOWhU3+5EOQluMeeQRtTchxe1/aaLeuT1PKMP
muhcn4OFiNQIxsRyWLa8Ig==
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
gc7+i+CwsNQ0U1boVizK6TMKyJvjIxP3IdA6dHyiA9NE46pt/MJ3dGVF8DTkw7mV
tBx5DTj/9oWLjZ8IVHg6EIRTf2vTeXvbKK5RujD6TSZmD1hxjetkASOH/I3aN4Uh
APZ2zHCZvXRPTbmKy29qV+0Ku55OdgojuVjdAWAbo7U=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 24561     )
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
RePcu3rJcUi9PRZzvcjY2Q==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_XSPI_SPANSION_TOP_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
NKqs5TDkyjkrbW+Alqgb7TQ1F3y8/r8nSPNy8k8ORV2g6QkEYh2N4wDSOsYZpPgI
2ztRLJU3Niw1NbUBXw7JEkzf10ZYubj10Fxi/yysneKD3bM4z0SujT9KpvaNDu4U
Jvy8UrNtpmHbLA7ryB2IuZK/Gn3ySWrmgbjO/6dx8XM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 24644     )
G3lD39AW+NUJC59LPSJeVfHL0ZOnO9vK+nyUNGE2A34ixGz3t3LMnVCaKz7qaumC
zpILLHR8ZQkX23DLKUhb3wbPMThQr/FoFPQdEAmmo1/fb1vL5Z8qb+WOkWSvirah
`pragma protect end_protected
