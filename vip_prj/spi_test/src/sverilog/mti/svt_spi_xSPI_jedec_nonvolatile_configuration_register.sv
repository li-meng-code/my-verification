
`ifndef GUARD_SVT_SPI_xSPI_JEDEC_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_xSPI_JEDEC_NONVOLATILE_CONFIGURATION_REGISTER_SV
// =============================================================================
/**
 *  This is the SPI VIP xSPI JEDEC top class.
 */
class svt_spi_xSPI_jedec_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
VJptv/JwzUFvTiLTkHCCO4EFh5wCiB8ZrpfJVNuZMObd7fO5fnR8G2bZaxC5Z7IE
Vw59A0ZPWUuDOY5ssY3ck/cH+faXBI9BrkYd4f6XHaHSzRCMz0xLQ2bpRSti8HNF
OC2ejZg5arHDlFyxzCf2ppYMV7QA2S/oxnB2/NZdhTg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 336       )
bjz3cXl1OASFUiy9z5nJ5ZWAUIeAbJxxhtPOEy4o27x71d0DBqPhSZ+8P0GqR4cO
qshCVyuEwOa+7OC0moX8io11Z1zVZynJ9gcvDa6HEu60lwpzmO3LunRxz289N1Qj
7xHhoa0P/vcagTFLht3Dm42UodlVLzL2cbsQZygPjC4ixsKrtt48kY6IaujzkHBm
fo9tUjMIKY6iIGcW1kjtriC4zUh5Ask2OuMhd+jhu5D1EQNjLbyGgUzDnrqNHEIj
k0ksDPlgXeocCPkMEFjdk3FxyFQ+2sOF2whHpPaBcsy6Krwtbq9u/Rsuch+dDV4h
tQLRlNzgDn7Ig+quJJSFpVyg69FiaIRtGg0W+s+YSIIDYt8LEPCdN1ZcfuvrYhxV
R6c1iEZQlB63Bxb3ybEP+DhZyfiYxm2IPOizerCXVtPeGDEJeeoSTwH+as3SILp8
PNIx31JW9jV/XYMlclRW4A==
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
  `svt_vmm_data_new(svt_spi_xSPI_jedec_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_xSPI_jedec_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_jedec_nonvolatile_configuration_register)
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
SK0ob/Tk+8X/t3jqiAvdpcDAYxF3lo20jpDE+iVKDIMZzOdi/7ssy4yWAT1pQtFF
AQapHhVLvgbpdDr7ZabGSRuqMaFohJev3mT8yrS6RtsTlxmc0FZmDygBhgEv3pnE
MFKRUSVyV74AcduHrGQeYdxucXciFcFXncJmEYVFqTM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 539       )
4IafK8k4VusdqbZ837Pwz6ycpMNMopvZeKOv/7BSGGnzdbZLMp7jnTxz0d8PYN4P
Doihb0xTT2VP7KLZFz+ftvvoL8chQl6mrq2J939o0OEq//8WN29ckBZYwhIjrgRD
e7FIyxghCKARI5adDbkC9WbaMnDfRyb0MIUKD3Ya72fZs+ktjdlDJto3gXgV7lhB
N40Sx84dyAknvoJxefC/IsYKIjxHy4OlxRTNcynV9EVqI6LgQMjm2yrduLVF8v2Q
tgCvJBUkNxpa0cQPdK+ssg==
`pragma protect end_protected
  `svt_data_member_end(svt_spi_xSPI_jedec_nonvolatile_configuration_register)

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
   * Allocates a new object of type svt_spi_xSPI_jedec_nonvolatile_configuration_register.
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
  extern virtual function void get_xSPI_generic_register(input string reg_name, output svt_spi_types::serial_queue reg_val_serial, input bit enable_profile_2_0_mode);

  //----------------------------------------------------------------------------
  /**
   * This method is used to update the register field with prop_name_field
   * value.
   *
   * @param prop_name_field specifies the name of the register field.
   * @param prop_value_field specifies value with which register field is
   * updated
   *
   * @return The 64 bit width register field data.
   */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /**
   * This method returns the updated value of register field.
   *
   * @param prop_name_field specifies the name of the register field.
   *
   * @return The 64 bit width register field data.
   */
  extern virtual function bit [63:0] get_reg_field(string prop_name_field);

  //----------------------------------------------------------------------------
  /**
   * This method initializes the register_pack objects with all the regsiter 
   * fields of the corresponding registers. It stores all the register fields 
   * along with register names in their respective register.
   */
  extern virtual function void create_register_pack();

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
  `vmm_typename(svt_spi_xSPI_jedec_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_xSPI_jedec_nonvolatile_configuration_register)
`endif

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
DnW78Ie5SL1HvefcJ4cmoI//4CeEfEtOcyPAzDTlc9hON4ECkNC3N8zc8AD8nDlt
5ZSIQXrr6yADxOTdjgfcRKNk64jVedQETRStnkMMYpwSe/rnPPUOwPM/rW9JtrTc
UBWKA5/NuOmTZX/P5w51q1WEmP6U41XxN2ndIjzIE44=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1245      )
u5beNFrgwz4rGnlcakuXxayrkzqUdQMcEMQMvR43VVLE3PvzzALwO5tOjrUeNhZ5
zc86TZQhguAEGTzlXC/d6SZJ4s6JytP9ZkoeVvAIoENZggB0Sls9QSwbRKG1WpwY
q/qOfCcItNclY8mbTM//uPk++E8AWFqIBYeYxDF0bYjF1aXPLzfhw/BAuJo/agFx
6J5PAF4JII/ugcvBASrMMhCS+YggT1OiW0pbOL5iWxWciGGi7/tmsAJPAGPvWasl
Jt5cZl6pdj1DNDh4qX4TlAumiyz82j7xxf8+TA1CZ5Tv3XdEW0mBLmieYuiAsPyq
QHBF18b2Ypa6JTT8oFEabvsqMT7p/M0ayEVINm9D0QuZHJ/RVzuDvAY3GkbjCEmi
i+bdNahls37ZhwQ91tHocrYSKwgz5RziayKkhQRt5KS0/M2rUzPNSbJUAj+t/be2
mcXIJsJ9cKGmBSB4eJGom7jQpG94UjD6M3dxoYLE6dRsux5HqPZA1W+SST2Eh1Z8
sKhbjvxirtYYbtANejUXtM8787mzdEzEhg0W/yzc2rxR9AH/G9Cdc/UXlyGHP/zX
mc+KCA8QiWs5E7gg+ZFdBxchDlUxBX2qiTdCcpfOjTFZDAAmsyZT7u9CgjM6Z8eJ
rnP1DHndGfRRXDV7bJd2aQ3UDmEyq/2REjYeeUiuME4m/R0d86ldC1se0tDnmsSq
CvEeMCBjUuSqUwgyX6LcKRIYx4d1UdmJmJca3RrWOfGYQ/HyDKBAiKRBYJBw80Hy
oz7XLfKapSuHbo3dTBiWf94v+tpC2zUaMxg1XTkmZBGaeMRmYMbj2HDRelg5TB9e
+/sdemh/CgAEUm4qP40aaso1LMLUs7FaozXgrk4uB+szXQGGeI1Bwl7wsMFpj2Mu
FILmCf3DqoOQoFvFzC/koLeznd7Z6BCNLqpir6I+uJm76uN9zSdfg4zne9jegNEj
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
LwJoTUNXFmJgikrMCZtxCYk/YwpvMvDw7kjP1JOkbPk/4rRRP4TI55uhXjPi4nZ8
cnuXTFKtFOBsOlv3D/oDBpIOXswMT19q/8nTLZioUMm88i02/Mu1wYEjEDypDTIQ
A0efv6BNUuDHDTK7daQ6AZgFlQHp39+Kwb1AX8b2IGk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 18360     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_JEDEC_NONVOLATILE_CONFIGURATION_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
pgg534+iapgMYFwLfwZiMmCODcuMo3QBXBE6j0jHVygm+np8acYGm2nO+9CJnADA
lfgMGyJRuGHL5oXV3jzz3ZIqQRTyfuj+SISbye5Hs5z/d4MTpJVybcPCkSJMlvNP
eYnmMdMTuF5G5WudOsH7PySeOsoUxW4jymTTEl+GwTA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 18443     )
3XJcBO2M+3r+xeCgUmr2UcZzNxHma69qpbM9h/couCjdqoAHoFnbpBrXF4jzpUuf
+q+UFIh03SUCbBhnwj/zqq4Go8KAUlWrIHAEH2j6KnmxLS43aeVZlQsnD9YagZg/
`pragma protect end_protected
