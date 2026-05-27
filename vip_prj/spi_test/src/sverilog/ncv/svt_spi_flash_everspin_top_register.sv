
`ifndef GUARD_SVT_SPI_FLASH_EVERSPIN_TOP_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_EVERSPIN_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP everspin top register class.
 */
class svt_spi_flash_everspin_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Status Register. */

  /** Used for enabling the function of Write Protect Pin (W#).*/
  bit status_write_disable = 1'b1;

  /** 
   * Configures the device into QUAD IO operation. <br/> 
   * 1 : Quad IO Selected   <br/>
   * 0 : Extended or Dual IO Selected
   */
  bit quad_mode_enable = 1'b0;  

  /**  
   * Defines memory to be software protected against PROGRAM or ERASE operations. When one or <br/>
   * more block protect bits is set to 1, a designated memory <br/>
   * area is protected from PROGRAM and ERASE operations.
   */
  bit [1:0] block_protect = 2'b0;

  /**  
   * Write Enable Latch indicates if the device is Write Enabled. <br/> 
   * This bit defaults to ‘0’ (disabled) on power-up. <br/>
   * 1 : Write Enabled   <br/>
   * 0 : Write Disabled
   */
  bit write_enable_latch = 1'b0;

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
  `svt_vmm_data_new(svt_spi_flash_everspin_top_register)
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
  extern function new(string name = "svt_spi_flash_everspin_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_everspin_top_register)
  `svt_data_member_end(svt_spi_flash_everspin_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_everspin_top_register.
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
  `vmm_typename(svt_spi_flash_everspin_top_register)
  `vmm_class_factory(svt_spi_flash_everspin_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_everspin_status_register();

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_everspin_status_register( bit [7:0] reg_val);

endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
G2CTYsLoq1Ar//vQhm3cHh+S3hJxdylMzdATg2szx1gmBLnQdU61ROsvX6hqpOiV
qeqkHZ8MJ0u0htMBuncst3S36P+qDzvwJoIvK7ycutLBQvNPCSXDXsLoLP7ftXmX
5gFbjmC0ec7AkyuogDYsFnYednBi+QgdaIC7BIDP20ey5+IDO6IwWg==
//pragma protect end_key_block
//pragma protect digest_block
XSomUGBt4Z5vXjgsFkmI40VydGI=
//pragma protect end_digest_block
//pragma protect data_block
pw1+GNNkzNM4zlJwVjy2u9oJxf/QHy+M12HyDQxgjymVKLXwL67DaW/WdGcEo0eT
QHLTTxCWUO/yXfWQ6E7owHbcghAoqeuvF0zYK3pG9lNqc8mLj1yfsk5zvK16eADZ
Ie+KpTHF3OSDt7tS+r6kV8Qn6MOqmt4RlSoK8RsmeyvyKiIooMviLflgW0r6yqQy
kIC0yUQuDImAgtWIIPYU5cDQjatq8kIy/9OXo+oGep8oP7zmSh3SuZd1LGpeN/Y7
4aviP2zuJLiSe02K5a9drHq6BZ6I1X+H0wU5QjoXtyivavBZdiNC2IgAldjGVVfO
mEk29cCjxQUNoGHJ0QYqgLoifH1IJ41KsQVvtyCBfhpq64HcV7gE8WeOoY3rOd31
hh8Lsiy8MlwvvabjqOTTdCorv8USqP8a6fls3+FAcnwE0HQVbre7M9ywdkzyhiXE
704H3GwvpriaX/wEkS8T1dxmc7g62OPKTCMyeJP7VuNlYSQ5bit2MGkihRlv+OJJ
zIg5u6O0CcaTAN6N+a4pH80O/xSa5hjRwcwTwZ0VRStcbV1VIHSnem7ZTybHZpKZ
1UhwMtHGQwm+xu2re2Ig7iV8tVHEuM3uW+oWBvgBxe9oiVWEkJFsuG0KrXdYn/Nd
Pbk7TxiyQZBpPIHZOEJcCv+e7Xq+7TbwFBqP9tTkHq/4q6xW8oZ/nzWDELZlMTG7
Myd570GYzfwtFFUvKzd/NkPBlN7fTsAeL6jD1+v4kEAyX5sDPx4kmcxoIx6SRskH
0TE9Oe96jPyBZLlsdAPHIiBZ2GTr6k8cL9wkrmBsylJFYqxqdm/hYv919axgU0Lj
BzYvKBXWMUP6EnwVl0TC1mT8UfJ7E8G5xIKVELdaPG9iqRQF6mqJB171RjpECM31
jlOHYy9khwVRB1e57LllmtQ8fWIfiOwaWxlGzWH74mO1qTcYN2ghHGbaps9U1lx8
uHdcS469naC4BPLp1E+PDNVEmdTS6IjFRwwpFhB5UJQvevpRRMWIGz/yF6GewW3x
7wGmro6GQMcjAEoA+V8b0dvnUXhV0YJs0WC5/ztD+3c=
//pragma protect end_data_block
//pragma protect digest_block
T6AqGukodAryjkR3rYsbocO+E1Y=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
nqK+asxU8P5vg8AnRjB9LrbacJmROH2MW/YlmoEVEUSExkUsFdw2zKLIER8KhfUc
ALNSfsQz0eR08ego81tTpZIz5JaH4xAB8vnmnwLbsS9A+atoGo0uW0N+GpUk1nJq
kPKNH3IDjgDDdx12rDrGYfp9a74mrlXAssF2bJPiIr2IwRRBevySbA==
//pragma protect end_key_block
//pragma protect digest_block
GAAqa8QfZ7l3H6/Wt5I/RDNzy8o=
//pragma protect end_digest_block
//pragma protect data_block
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
vyxTQ6Ij31HTIrA1DxP/rg==
//pragma protect end_data_block
//pragma protect digest_block
Er0g/BY3VCpDMJkRWo+qHPRAIr4=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_EVERSPIN_TOP_REGISTER_SV

