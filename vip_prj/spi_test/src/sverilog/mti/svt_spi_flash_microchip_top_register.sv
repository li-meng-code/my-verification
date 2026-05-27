
`ifndef GUARD_SVT_SPI_FLASH_MICROCHIP_TOP_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_MICROCHIP_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP Microchip top register class.
 */
class svt_spi_flash_microchip_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Mode Register. */

  /**  
   * The MODE Bits indicate the operating mode of SRAM <br/>
   * 00 : Byte Mode         <br/>
   * 10 : Page Mode         <br/>
   * 01 : Sequential Mode   <br/>
   * 11 : Reserved
   */
  bit [1:0] mode = 2'b01;

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
  `svt_vmm_data_new(svt_spi_flash_microchip_top_register)
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
  extern function new(string name = "svt_spi_flash_microchip_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_microchip_top_register)
  `svt_data_member_end(svt_spi_flash_microchip_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_microchip_top_register.
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
  `vmm_typename(svt_spi_flash_microchip_top_register)
  `vmm_class_factory(svt_spi_flash_microchip_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current MODE Register */
  extern virtual function bit [7:0] get_microchip_mode_register();

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current MODE Register */
  extern virtual function void set_microchip_mode_register(bit [7:0] reg_val);
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
LhLjv0lEcj0OghVNkgKxpBZFSMXYyIMji5btKl9DDsua+a8lNXmsie6HkvqbSIJk
R4BNELp5XfAwkoOVUYXPMJo6v+cfsVzxjhWVlxHYp6ShyZByJWnyRMdY60lOBzTq
ZApQi47c8kOmLTKnDz8oNryt3Eze1OOFwMT0+jY7Pro=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 638       )
nHqrwlrKvEaH0/+i4JUE2JqMzlb/aWfRAWFUde2/U4sF0Ly+bIKHnBUvVjugVyOR
aUEqjkF7sMd6WbDj3KXrSU5PWKQlov7tluNGYoHqohUQBMcxAYZmy4Dk4rAOaQmi
HZ2+f1T6o0cOlZ+N5AnFsJflJBgnEzhy9ZfF7WrwMdhuEJ611LDdBtdV8qqQEFFR
LgzmLnDlK5RfYS0t9+tDIU4s3SrxjxCjE3Vqx7cdRBDjOje+AEw+XyHWF1OaOioj
2tO7VTBtZE70yl78rqY1Kxd6DtithN6zNGvuOXUmFAfnwMmWdfWMPPrvYtdkQnuR
xu+AEQqR23mJHsndyG79aGwzU4FSf9IYhGUQwmbaSPRw016gtE33bvn3KN2E6NAh
mUI7s5So5OjjhkQSRmKWfsSEo3QGAuXB7S4/kbFffgd61gDlfHNtNRIPh6rYo/1n
AqzVXcnUNiHhOWKXGVSj4w9375H0KFfazI26RvrWkLCqmKMWIKOLLHHcVbeaQmN4
5TDmIFLTe1tpqhr1Uid5TRt+oTqNp10iVSBU0gerCmt3lKDFbY0ngLR1OcBVmHwA
+VcB2SsWWyNoM8morPYjzJyuH2py7OtuHwLz5jfHrRLjCvh4cWmKrZbS5NoaD3jk
aP6rbNK8V98vIUuyzPOPYZyRQtBqcEGx7YvPn82dQQ4I85WQ2yovSOCwyUucicWD
ephJNljnCg/A1Xv7SUnYmQKuP6ijcHlgiWuWN17Ta0p1eCOSYAxpmF/qCmJ+lMXe
rfEtbVI6ws/AZlQ235N8hGeSryaxPiGZmybJitdXrFyO+gJ39U2vNZ9L9mP6po0N
1qj4F+bK8dFJRAU1jYOnWw==
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ark6tiuodyJGgh7UHx3re2PMUvC+i4giPUJAW4W2hQSw8vAkIseMLlh++yneB2/d
dg6MO/C0UMkXyJJBCNh1p7zDFNI3+u8RMg6ziCawrk9c2yR1Khw1DkaXGE9dosQw
OOIj+YcbRQNAWercYFdCdIxAGNe8OycuSkOEVFIFxrM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10571     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MICROCHIP_TOP_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hnlA+ENk84HsbvyNLriRfpMvqDZb6JXMQASw6M64hT/qDtBRRn1EUhtxjClGsmur
Ss11vULX8+XskT0gizbTInhU2uq2va8MPzndNIoH+jv+Z3LxOVpQDmKtR+3HsUPQ
iQazrN8U1KOLaekbZZNuUL9vUhnNXPPbYqWpcgptN6g=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10654     )
6/z/wxSMhHA/4zh5nVdgL61PSLQsaMZR6squWdVUYW6y+e/MXEiBEyEpYOHKNCmg
rmDc0xHKf4R187ttmatcrYtopgrk/RY4VhKBHHyzvbcrv/mSyV0nxTyYllUcoSBl
`pragma protect end_protected
