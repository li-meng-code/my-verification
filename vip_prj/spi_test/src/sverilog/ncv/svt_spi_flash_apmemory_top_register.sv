
`ifndef GUARD_SVT_SPI_FLASH_APMEMORY_TOP_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_APMEMORY_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP apmemory top register class.
 */
class svt_spi_flash_apmemory_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Mode Register 0. */

  /**
   * This parameter defines the min read latency and maximum push out for     <br/>
   * read commands. It also defines the max input sclk frequency.             <br/>
   *                                                                          <br/>
   * latency code         min_latency   max_push_out      sclk_frequency(MHz) <br/>
   *   000                    3              6                66              <br/>
   *   001                    4              8                104             <br/>
   *   010                    5              10               133             <br/>
   *   011                    6              12               166             <br/>
   *   100                    7              14               200             <br/>
   *  others               reserved           -                 -
   */
  bit[2:0] read_latency_code = 3'b010;

  /**  
   * This parameter defines the latency type:
   * 0 : variable(default)     <br/>
   * 1 : Fixed                 <br/>
   */
  bit  latency_type = 1'b0;

  /**  
   * It defines the output driving strength: <br/>
   *  Codes        Drive_strength           <br/>
   *   00              Full                 <br/>
   *   01              Half                 <br/>
   *   10              1/4                  <br/>
   *   11              1/8                  <br/>
   */
  bit[1:0] drive_strength = 2'b01;

  /** Mode Register 1. */

  /** 
   * This parameter enables the support of ultra low power mode:<br/>
   * 0 : Non-ULP (no half sleep)      <br/>
   * 1 : ULP (Half sleep supported)   <br/>
   */
  bit ultra_low_power = 1'b1;
  
  /** This parameter stores the vendor id.*/
  bit[4:0] vendor_id = 5'b01101;
  
  /** Mode Register 2. */

  /** This bit defines the good die bit. <br/>
   * 0 : FAIL <br/> 
   * 1 : PASS
   */ 
  bit [2:0] good_die_bit = 1'b1;

  /**
   * This parameter defines the device density mapping : 
   * 001    : 32Mb  <br/>
   * 011    : 64Mb  <br/>
   * 101    : 128Mb <br/>
   * 111    : 256Mb <br/>
   * others : reserved
   */
  bit[2:0] device_density = 3'b011;

  /** 
   * This parameter define the Device ID. <br/>
   * 00     : Generation 1 <br/>
   * 01     : Generation 1 <br/>
   * 10     : Generation 1 <br/>
   * others : reserved
   */ 
  bit[1:0] device_id = 2'b10;

  /** Mode Register 3. */

  /** This parametre defines Row Boundary Crossing Enable */
  bit enable_rbx_feature = 1'b0;

  /**
   * This parameter defines the operating voltage range:<br/>
   * 0 : 1.8V (default) <br/>
   * 1 : 3V             <br/>
   */
  bit operating_voltage_range = 1'b0;

  /**  
   * This parameter defines the refresh rate: <br/>
   * 0 : Slow refresh <br/> 
   * 1 : Fast refresh <br/>
   */
  bit [1:0] self_refresh_flag = 1'b0;

  /** Mode Register 4. */

  /** 
   * write latency code defines the min write latency for   <br/>
   * write commands. It also defines the max sclk frequency:<br/>
   * 
   *   code     Write_latency    sclk_frequency<br/>  
   *   000         3                 66        <br/>    
   *   100         4                104        <br/>
   *   010         5                133        <br/>
   *   110         6                166        <br/>
   *   001         7                200        <br/>
   */
  bit[2:0] write_latency_code = 3'b010;

  /**  
   * This parameter defines the refresh frequency 
   */
  bit [1:0] refresh_frequency = 1'b0;

  /**  
   * the PASR bits restricts refresh operation to a portion 
   * of the total memory array.
   */
  bit[2:0] partial_array_self_refresh = 3'b000;


  /** Mode Register 6. */

  /** This parameter is used for enabling half sleep mode*/
  bit[3:0] half_sleep = 4'b0000;

  /** Mode Register 8. */

  /** 
   * This parameter setting applies to Linear Burst read only on RBX enabled devices (MR3[7]=1). <br/>
   * Default write and read burst behavior is limited within the 1K column address space. <br/>
   * Setting this bit high allows Linear Burst reads to cross over into the next Row. <br/>
   * 0 : Reads stay within the 1K column address space <br/>
   * 1 : Reads cross row at 1K boundaries
   */ 
  bit enable_row_boundary_crossing = 1'b0;

  /** This parameter defines the burst type  */
  bit burst_type = 1'b0;

  /** 
   * This parameter defines the burst length:
   * 
   *  00 : 16 Byte <br/> 
   *  01 : 32 Byte <br/> 
   *  10 : 64 Byte <br/> 
   *  11 : 1K Byte <br/> 
   */
  bit[1:0]  burst_length = 2'b0;

  /** 
   * This parameter defines the burst length:
   * 
   *  00 : 16 Byte <br/> 
   *  01 : 32 Byte <br/> 
   *  10 : 64 Byte <br/> 
   *  11 : 512 Byte <br/> 
   */
  bit[1:0]  wrap = 2'b0;

  /**
   * This parameter defines the Data Lane Count 
   * 0 : x8 mode, data is driven on 8 lanes
   * 1 : x16 mode, data is driven on 16 lanes
   */
  bit enable_x16_mode = 1'b0;

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
  `svt_vmm_data_new(svt_spi_flash_apmemory_top_register)
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
  extern function new(string name = "svt_spi_flash_apmemory_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_apmemory_top_register)
  `svt_data_member_end(svt_spi_flash_apmemory_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_apmemory_top_register.
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
  `vmm_typename(svt_spi_flash_apmemory_top_register)
  `vmm_class_factory(svt_spi_flash_apmemory_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_apmemory_mode_register_0();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_apmemory_mode_register_1();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_apmemory_mode_register_2();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_apmemory_mode_register_3();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_apmemory_mode_register_4();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_apmemory_mode_register_8();

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_apmemory_mode_register_0( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  //extern virtual function void set_apmemory_mode_register_3( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_apmemory_mode_register_4( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_apmemory_mode_register_6( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_apmemory_mode_register_8( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the configuration handle */ 
  extern virtual function void set_cfg(svt_configuration cfg);
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
IOf29Cs077/8mY+F5HWv07WrA85ThUBsD4JOUnoS5yyrmmM1LOqurBAv9126Dndn
0IVUNGgFwULgwSy+y3zXtH7rQhWjkc236TutShTgMJ2wu2eKD2rkDepDx54SizA/
wIEGeI4UppD7cnenZ3JUOeQmo7Ux7qUz37eS+jOsB9TsADn5ldac1A==
//pragma protect end_key_block
//pragma protect digest_block
XxXAz8nYKhDkE3dMyA0R8Nc17UQ=
//pragma protect end_digest_block
//pragma protect data_block
qmeB95QA7jjMiYMPyPP3KMZ+WpsdxgtvKLKi3M1QpetDx1/EJuPoYr3OGu8zlhB7
6ddW9sH6RVj8KC6rCxoL3OdhlBjwzcc+LPvkNG+jn8i2ZyXHyDVFXhftT/EZeqjH
pvS09zhMN0qblqbwQQvtFkEBO1JclbSs4LFUspDgA3zARBocW7+0Euuh12vFzo6P
FbQwLR+KIHO47Blg4ofGKB+8S8/O1ooU+f6x3RJd7iCVLMQSMg1K62itm7uXBvnl
E92Cy/t08XtxSTOPVuuDfj3WMjtTVnONjevqQ8T7C7AhvXzUFjZ0CnQ2nmHX0/mB
cE6PtAztLb1l5INbqGWkf6a7SDDb+XtImK0FuS+oCwLET1US5ty34Pdux4Xea3vK
9hyssjbJzO9ZrBHRyH+uOfwifAiYoznnMJGb0gQGXUvTIui7/kkX6YhhZ7iCr5lR
uO/mW+z4Bts3Qg02JbIaW7PhsUrySVkNDpE7MFROTx97gBMg3FiV73f5Y/29Vp31
y/PF7MKirDdJQ9mThQQHWvovKj31NNZX2Tjz6LkrcyPSzc/iGv/K3AqrSGCsGoQd
6M2saOF82rxEimX/AIlMvadTBi4MP805auZEVJkpX8B7ogGwFiWIjC95I//qSO/u
R2fA1VkZsYmU4QkglTcQVdgh4mOE26FVVaSyGTO8q0m+76SzzrJYh3ms1e4NyjxL
4YwUKhdvvGZMZLssOwW+0zzHK/5qRFe1wADs/0+ccogK4Wn+1dYrqoWu8FVus08d
DQ0JcPjxmN/pKevuK3mCrXHqkv8rhgxB483L5d2RfIUC9g/8yiFScQ9DdF29LnVu
v+0O1H0vLQ8SBmxxXuzNU0LCD57hkdnmCIQLSDRgpIf1bkWthPQ1eCeUte2ymQ0G
1QmoEMFLeYZbFcR20Nnno4m8qBmL/qrrEU0J7M3wVOOIBdp+PlFBMgS1/nPGxCQe
T6nw3hB4wr2dZCGATOnzIamTaMfr4DdVwegDIuQUtgEDNSVw9p82sORSnjuDCJno
FpFBSUQSQIiESaqUHDphcKX8QrGALlEDY757vozm8mM=
//pragma protect end_data_block
//pragma protect digest_block
xk32JaZQ3acey8oF5CowPSfDtaE=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
D+VKoKn9brjMOp0I/QgDmvCbK2fAvxHpJBG83JGEYPoV5kl56innMjRrooeR18ol
7G/ts5bDSvmHsJ9S/L+JNb99/Df7U2irv0wKvjmZsKuY09tGwfdcOXNJ7scMCnJj
4UjUm1ELmvCFUlSw+7ANbcYL1QLgpsqOX6tFsAIih1MJlFbPxiW+iA==
//pragma protect end_key_block
//pragma protect digest_block
DstjgqYFNKpd9sz2BMfvFixcDlY=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
/9bGPzOpJ4mdVrjPoHuaZItrLIM=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_APMEMORY_TOP_REGISTER_SV

