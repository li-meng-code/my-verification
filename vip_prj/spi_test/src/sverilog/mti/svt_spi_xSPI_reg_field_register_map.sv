
`ifndef GUARD_SVT_SPI_xSPI_REG_FIELD_REGISTER_MAP_SV 
`define GUARD_SVT_SPI_xSPI_REG_FIELD_REGISTER_MAP_SV
// =============================================================================
/**
 *  This class specifies xSPI register that holds mentioned register field.  <br/>
 *  A register field can be distributed in multiple registers. The valid
 *  locations for register field at register is specified through 'register_field_index' member <br/>
 */
class svt_spi_xSPI_reg_field_register_map extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** This filed specifies the name of the register which contains reg_field. */
  string register_name = "";

  /** Specifies list of 'Received Data' Index that are valid. */
  int valid_cmd_data_index[];  

  /** Specifies list of register field Index that gets updated with respective location of 'Received Data' specified by #valid_cmd_data_index. */
  int register_field_index[]; 

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
  `svt_vmm_data_new(svt_spi_xSPI_reg_field_register_map)
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
  extern function new(string name = "svt_spi_xSPI_reg_field_register_map");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_reg_field_register_map)
  `svt_data_member_end(svt_spi_xSPI_reg_field_register_map)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_xSPI_reg_field_register_map.
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
  `vmm_typename(svt_spi_xSPI_reg_field_register_map)
  `vmm_class_factory(svt_spi_xSPI_reg_field_register_map)
`endif

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
KfkUy6Z6ix+b4B5LGF3L0zflj8YBILFViIsHsoRDsWVWdXNKopEST6dhxiZuRRmt
6wVlci6RfsMP6CKXdaUERsQwoCyq+X3hwMTFgmKywA/xaAUQQfMengXkWxUImjO2
Q/pD0qy38awjxkJ9lXUJOkGnlQhjgur4aHyZQ194Knc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 634       )
JYlLaYAOfHvm0SJxhHmzezQvjM0Pnl73VHzAxfgnGu+7JEXaP1dA00DMhFykZnFV
X6IqhnvXYdERdnBC5fpAtnOrzK4U4Z7qlWxDJ1O9cvIqGNsUFD/tX9dH40xmsU59
Am7YuJKh1zdK+72xlG1Pl8RzfqtaAahdGBz3dMGXj9sRrckmIu/zGBNcfZvPKXmJ
hI7gHlo3MdRUJravo4DgOx0lAScJgFfV1X6r/mO3mjiMGGnT5KCXTi7xqXqgNFsY
Qvxp207l2tAel3pv4krVknXlRYC3ATVNVJTF1CpV1DlYy196eN845uiAh0/kN+9V
C5CPuqEJptThDQomXU7DAHblPiTerenartpkYpWIgp6p9USj4dGIDZ32aBhMkn5U
l8ZtIMr+6RJ3AQ0Ckrh+JeLzj2lv4sYhm/N93r0SuGTpF+hDcfASueW7N49afL3g
2+EpY/D6CwF3KLxfY+bv52eWE8eICQlPKCAVGIhHHhT9yJKbTnLs4/qJ2Q63V8EO
Z+FjSKq47/2kyzq8DxL2ZP9bSTfonXBd6kh3De5EXrCMcpokRQW05oJGSTmfXJDz
lbpLkStfp74eAwYLpwW51K8k1XFiA1rJNDv/iYYBhvOZ3vPCvvnAeL+t3PbMKmas
/ebtQJLOPqxlicKrU2chATGz27WCK2hXpecjaIxsmdmEV5/1HM1o5YVEp9MhdWyh
0Ic6soyLknNKcAnfgiSCLpF3yx8fIaPtuedGcFyWnwvMXA+34Osisp2TOfWNHVZk
zhfnUPtdouGo8gA4g9NQE8pVlaopNhVEvekDBzMowx5B7GxGQCOKx2tN+ThLZbkM
lhjFax5iKwo8OHzJUM0rjQ==
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
fve3lPKkKaxWPg1oK2qdWj6vDBD0M+wCLBDC1G1u3L6t2oiSD6Ld0AaHhvhplgr8
J8Y7eOJ3kU2gIXsU/dDVly8JhrshUTzPTDa2v4zWEIqKUoieKwfiHRYBoFoIYxtt
B1LXRMEPRUroKcbkP7KtXi+hq49ChTFTZq585OiVSe0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10264     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_REG_FIELD_REGISTER_MAP_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
SKJ3f5GJ6SYK6s0L3A6r+OAthiHfRu5v72/QAy92EDpBCKJc3wp/hICVBSIKfpIL
+zN4MacbgFZDqs1SSHVL0DtwOJUuJdubrhOdGK+IZZbJ7tdy6uCPmj0mEwiZ1vow
UBPUDFneBP40R+fV8fFvW5WA7ZH2yMmLbchvdHmmHbk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10347     )
k+i9Bj3NHi5O8VQQ+ZlMCiFWUnPds3ytPpNFmkMJJe/aO1hLvfw1ButTSCERTTTZ
Trow6vJonoEl++ddYFRfzuB8rfiIigzMrd96MebrBTC8fGt6CHY3aOYnxOfJQyqM
`pragma protect end_protected
