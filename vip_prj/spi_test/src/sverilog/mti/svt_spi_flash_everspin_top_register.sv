
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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
YAgBbFEEMEaoDvccZ3A2YW8zQXVFCHoQfQ8EdnRzrWBqP1/sXY83k0x/rOrE1uu3
BtUcz/ejw8xbA0l3iUYPmEJuFz7LHgoVFSUHKNjkjSGZr37rYiN8Fqp53OSKjjnw
5wZlc7eFZG4eWM6fucb1k8c/bML/nESKWRtpCgb4SMI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 634       )
QxqYqvr4ruyw9ZZaNJBXfwWgK9YlqPWs59waM5u0vrZF3Q3f3TbJwDxVrLMctA+V
os5dL3sLHIAy3X7TGlPf8Pvd/46jBFk6K/fsTHL1VXoXoLj2E3le2feS0gl2yEOc
dC8c4mr0atGNKNAmail4qDX0gcvKBhoTOYLG2rUnghb2CuojPCyaPtVJr2kCQ1Dh
SF5bWA1dphddUTFpao+29TvuxXUAx2Ucs8q1xCHbTRivATDzLRUggroIwcx0jo5U
CRFoTlUoH9CDsDqnSvcC3Bsdaaul1f19Y4hIhW57UoLsADWkXE63I9DU+Hu9zYV6
z5h3dJ+t1x14OCWkb0qEtxVNefHF4TEBxb8xTKlECwsl7p6/E0kKVHKZWw02PzZa
kmA6Cz/TIXmR2U4IRzK4LmjN3DX8YibpzgPw5Y0mO3NgoVICJjLbeKGgiG4eeHCS
7uDx/bd3Q/jfFWwGv2BNQQjDguoeyrLh0VBzF7WPShPSlxMA62MggRn8M6aurCpO
GOTGwTEA/m+Ii4jSoIJKTz28q9NjQof6Qg5hCpdg6YhwALNGhMtT24UHhzhtJg46
yHHDsr9cZUpHChlhtW1QdJLKmJs2o30yPHH3KdI4/V/1D0DOLEgb8i8uh95vTnR3
7/j8awS3LeeODjCSA+Oyv0FwXlUdZchlac04jRiGZRQ9et04r2dnBoQNaXBgO/nW
WMyDCWsnL9ezWI52xTxt1qfFXQs5voVupxI+gcwi5Q1f+ViHFjk2295vIvq+1Ofo
1pfOMV0GReCy/oWVMqrBEEsKChhJ7BT2UmW6S9qY5a5kV3BPCW+HAdA2ofMcj2Rq
aoUxg8Xk8BpIl2qCxibxKQ==
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hgvmfMHnEOam3DrR+TO9GeeHwdG+jJD3MhMJXyGPZeinCsLAulvMxLDJzjyh6v63
3ZkbdkJY0RBas0Iz4Njr/0xj0+p+a7L0uHbq2/z2CRetCeG1Tv71oTsh1Dh+TlUc
GM0h70001d5odU/TFKHZsrWP5muL5/nQhBE+bNZ3Bew=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11512     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_EVERSPIN_TOP_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
T1zOMkszDc2bHaSfKVQyWR6NSken4E5/JE38GWSehW66plsaqV/rjhI2g07w5XPi
sREmsTgtJf5UYIh7mGZYntSsrNviaHuyfFKf5xnZsm10ZVqco510AP++QIUmH07l
zxD1/u3M881uH8t5eDb11Dp1gOk2V2xKdK823VyDJAk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11595     )
sW1LMVr+4wahT+zCfZM1BX6BAFtaqlYOWBwiSyxgoTageEQzruCnaLkKwJ9NrtfP
y7SObyT/cUUmxyL/J0+tJ4xgy/amyBxbBkM4nUHw8iDr4fsMZ2LMLsq/bFr3mzK5
`pragma protect end_protected
