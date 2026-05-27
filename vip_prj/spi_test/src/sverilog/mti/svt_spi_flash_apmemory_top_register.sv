
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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
EDpCPxqdwDbBZPPZARCL8jlRaUezI0lFFCJs2vDxiSy604MfimzS2YRnVUVQPcYL
QfHLi39COkj7n57i4rheFvaDeJf+A54cHXWgr1P8bLwHxpTTxifDL5qMHbalqLpO
+uGtEdvFaez5F70+/Z51eS1QgUiqu0iBR0T4/6ihtJE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 634       )
GpbGgF4eMjbGGq/wmzN9Vk/qZ96AuOe7jEpejkaIQVj9+6PrnM41y+6XT48YEapa
q3mKx/PAP7iLEMJ/GWzedMjSOSHrpcM0yJZhgIy97Hxi7ab86eUbuu87rpA3bJz3
TgDSJrxlaS4mLcu4WncYwDOqnq6Gipz982BTslYijQnsqIYEOjTAPGtKncxLPt7Y
aeJahoh8uJcgynSb+yhPUL6AQBZMgUHZtJIjRqQjfkMzLOyhA7BJ5M2ieJL0p+kW
I2SsavSgEAnxr2knaYM6qMguyiSyFnFHNklHVyMwMhVF+kLjmjERue8nzMqCldMX
movEnAyB98NT53B5krY1auxDGcna05EyZPxWjT4onYO3uIcimfEgRt+r8AfzEWed
qckM84IvK7fXhNcF+J2A431eqYKFqDVJCToz/NbpsIDGkRTIJVsjo/+/qUpo61Ez
R6S2XaThbaVUuu8FOwnkTjy5OMvwHHHn77P4+9Y2ivRolDclT4rJJ2dz6g3N/mWj
4aeJqHE3l+dwPLLsH2G8GvG4NLemTTHMnB0Yb+wnV5MU2anYSiG6FrABrSQegbVO
xwfOW/J2vRbxEhjNJVMTknbjJVD2+4gWZbd0jeXKlQmpfzjl6mPFm2w22kcyn+OM
THjcGnV2D25PlFiPkYB0oqXBHS/lBkM6AjQJ7bx4myJzhdaTx/k0rstQJT+CIyN0
kGIt+0E8QvaTW+uxKS5KuaCvOILYsTz8WIOnCDwq/1McIxNYDFn1m3nCvwAwG27L
c2y0gz5hRS9eF3N2sP0+4H9WvecUwo91YYd1iNytyDiFwK8JcIvkw7z+Kt6Tww0N
JWztFlg3zd+mJisfWXxf+g==
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
cIBXOit5eGR0fy1PHST1PxtvMZf0lRLfRYoOtAFKNoWVbiWYSoubWIQqZeO5uLAn
/FwLF/pUwPFLPrHE30rsfBoI1E4KKg39fykz79XOt1JgX/CcFn2zSHzlw9Pf+9fn
go7wzt6HXXQAeJWLLXCupESD1uAO4enRQ+WR7b7l5EM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20185     )
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
ZkNYLv8JrTtelFHhU3k/vg==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_APMEMORY_TOP_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ElsYYUtHhgkW8RIs4bFkl7X9FVUqQ60a7dTjMmaTjfgZlhDky6UCgZfLeH2OZDDN
ulD1bF4KhqoTJieJSQYjMXpyB+mg3J2TutnzILd19O3uv1n+LR0L7ZaQRMnShi/m
ft6mEyrDBXkAzp2Hm0gnVQQiTgIQ3y4NZOpZlKF8otU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20268     )
RoU+1TtbaMZShLvq9gi2JEz6L06vDB6K2su4tFTck0mbZddcQl4nXioMtQGAACky
7w16fiI/qjz/H4gMb/EXgTWfFVfJfnl6fCv85Ncxb+9HIEH7UmC8bycruBHeWOCV
`pragma protect end_protected
