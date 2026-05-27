
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
wF1uJ/jnival7JhGrqbQ/hxIAjdeea1YEQhUUdvg5wiVF+wETPx0sq+YDVDH0FVw
JSeMePpzFBVR/7rHUIG51nt7wUjdp6Pan5C2zw9CP9T6hm+vityeuAdJVoAVE5G4
L2zh/1CuaJql6VTEmmfyXldXZ7F1+XyPS1utgnGjYjPeg3P7igt69w==
//pragma protect end_key_block
//pragma protect digest_block
qNvx++gedp5QOwRj0bjwQTp7iV4=
//pragma protect end_digest_block
//pragma protect data_block
4uFTwaeVrZYsE9pQHdbsZILzJm1sfNrLJF7I8ayZwb07Ix/pNP7sin1ZFs6H032t
rzmuTLl91mlp7gRAn3+7hiELviqysSypRp80j1fdblHrRGKrNubDotYMAtOZCvFY
NyA/yP7D2hTEKOFccM2Zcb55RFz5+qKK1BJsfclcqGz5tfQ710q1rHuNCLI1tGCM
ZSrWCa8m3/QL544Oh2WoKEYNvTf8gN+qh2V7poH99wO/7uM0iaT/7KNNVXeHM1S6
2PF+nlc2meOgReIm/Nm6CRjat/ZHgWqMW52MrNmpekjeSJlFKnmNhTBuABjyzkK8
NRyYh+PNunLCF4Utvr6anfln538d1ncOmh6mRTCNrNv7YhC/u5on2gjjmrMt7vXh
zA6l3yiZ67dUZZsmcnkYRP3CGVoyWBOhHmjScYdotec61qdfVIQT6W+kWxsneacS
h6lQuOE4SWUVH4VAFgb5j44LzrW8jiG673rEyvStz+dgGAWK2u4vfN9vZFyI4dWo
EGoBLvRM0AhUqvEBvTeJKeNjsd86U7MteOk0/F8Fh6ySfpFvN9vcWX320OJACO13
SBR9WPY+BqVE5YN+4U11oDFhkBK00wTNSVmp41CVK4E65o1SfQScu0XfbBaG0ELj
srbiE7zmgyUOqyK+/kuj88KWccumFKY6gf4L9ktn2Wo=
//pragma protect end_data_block
//pragma protect digest_block
9F0htdSivIWByQgpj+ATMTUVq4w=
//pragma protect end_digest_block
//pragma protect end_protected

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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
rK2WhKvjLcOPnBYIW25xMEYDbVut//A6DXVRJtneJ6eTqtLWSgYZC1pBm8L6oWFt
r+ytqoFrSZYshewU+elXu9lcP6X8fK2b6bz5ngxC51sczjBZySJFp7EtpgJVTkie
rILwapZUttpEW/Ut6xB+pCVg2ibdR0lXpVu+9xpMID9Ee1rFrYBk/g==
//pragma protect end_key_block
//pragma protect digest_block
HYZ+ZiBEVKGxZrcYdVT+J3Wevd8=
//pragma protect end_digest_block
//pragma protect data_block
BLU9xcteKrFrg++If1TzL1SRUpweVAJNVmQfzCzqJztfOrNzzZVbpAQ76PhvMqMy
tFiWifFj5KcSN6iGxC9FIuZuH0QJ9566MvIL7lm1+fqddX78Lf/s5wejqi2k++pv
QV2JbVkzgyBfKd1hLngCQbbbPUZ4IvEdN5ldHeyKmjQddOtxsrGxb96Dc8uJ0G1B
WZeFwUB7rViaGuaMEC+r9fEf4C/eOJ1BXd1muMtnfQjUdbH9f0b6D6rdIN6P5zql
2lBeHq+Mo60g2f1/mxLbzMIoVoDnCZx57ugn+IAROfKBzuz8P7k7001vLMAl7qKp
M87xkG9G86lEmT0HMme6KAnjlQP9dchOS6Ju1MVrOm+bQsZ0DIvy41Oc8BiPYsQc
jz/S5ItKuFHiWRDIAc8WXDIof4iodZFuQC7COeEGCCIjxeq505DN2xmvBUC9sOrs
5mwD3dXee6BNrPcJkk9ljjnQF/t23ycZnUSGmKEC7z8=
//pragma protect end_data_block
//pragma protect digest_block
e/+4lxtRlHiMEzvs38hYB130jDY=
//pragma protect end_digest_block
//pragma protect end_protected
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
aGqJs6VSwDgiYY07Br16M/JJ27p96xDorjdwriXwK4li9BGOhZ/x2V0qoF5Dz1Tk
orF/2M7TleKk0S68mz1nksghNTYyLV9/5WfdN/yCqlYkXU0yLMpNGQyFgNwRLKtv
CY4HUiD70a184Mz0fRtJFBbJaHWNlAgAfcu+V01WFkD0qsLPUCb6zQ==
//pragma protect end_key_block
//pragma protect digest_block
94vfp12wMCox0vwrtGZC1icDmAY=
//pragma protect end_digest_block
//pragma protect data_block
wy0Rt761rIwL5ohJEYBv179vXOjW8LxRB3/YzcwBBIaxmAqnKboRhb90xj16ywaw
L4hEqxzJPGbaMvgeYdrh+WRCRS1zeTijXRF9upq3AH5ahCIkRkqpapZ1hvUf7/hh
KIq1I3SIxIhIdsrLm1xJzeq4Zady5a1qGd7B9m9sTg9WDmMp4MAd+MF4aa1p0/p4
5TKAAA49CdXmjeNZGcgo/1MoQp0t1405riG1LtjA3VlVUaWbE1tuCGj9badBdsac
knlsf+VDAfoaZAXRNCRdBfAMmn03ogXO0NGAeQnTYEZRUmunBp6zEU0FuuEfTXHa
g2l7KLNgp37bhq6FVI/peqVTTFcySAXrG7M2/vmc0V0UhIac+9RrGxP8hzYuSIRw
8GgIvgf0Y6JQoRI6DbwGW6OG1TpzHmUO4cWljcvbLBOfzwBnZ75SGwqb4yw4jEEh
IYTHNwaCMC1sbsUL//i1iWH1ByVbFLTfy8yOqKUn87RleKX6GdsVcTdbZyWF2+64
KPTbukIcIKGL8sXUiGZF4RPxblH7MqeUL7LOSbPWXzAHT9J4uMekf9B+m2jLcb/J
Cpz1vvMK1DnRv4EFTZrJNtI8I4Jzm9uv8zfbXYSRvZ5BEjdhojJeopO8ZsgC12ww
8kpVyJ/Wq7AmI0fV1jUsDPkny0hmwWzw7xGqi2v+bJrMDnfXk0HtkipdHmaWhXiP
WZ7Vyz+8upwJdZAK3M2uDvSNSGWNx9KliRE8tNwYzeNMKwC6wppCk/qzZUynymVw
r8XXelrMvw+Hb72oArsqXiELAhRKQ43f/v2HxeBx1QgxRm1AngEZEdUai5Q9haLu
r3EmVuByr23WcaUDYZGRHvIvFJxdlhSlsNb2bynCUGTcKXCFEcgsrIYOYE87OhnM
uVUyXbwwH0h8pm4pr3CfNbICxq0lMnl1/fECkJJWybCA0nmHhkcTmQla9hKkUXE+
xESjPufUuudgs0q2Ek8cs7WPz/UOtkiI9CPpGlz6Fig=
//pragma protect end_data_block
//pragma protect digest_block
/l9+VGASn2h4JqqFMWxUP3nTEbc=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
a21ZKgWXRGR8M/nsvh5bUxGew3aiqQmPGeXDJVp3/J6FNpETfX8vbGXfR4lPH0WJ
+vZp2XZSaCYgxS9kbYTqeesgDoaZjrtkTgkjXLroDosF9Vi5rCFDjhpOyJUVey8B
KZ6IkOqhcFg+fECuX97Cfdf7NNs1qd/eU4jN6ROA7gs6ulsooTemfw==
//pragma protect end_key_block
//pragma protect digest_block
pNOTtAcd8OouW67MZJx0pbEcUFI=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
D7it6ldqq2xx3mbC/2yHWWxsqaM=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_XSPI_SPANSION_TOP_REGISTER_SV

