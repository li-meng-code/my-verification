
`ifndef GUARD_SVT_SPI_xSPI_REGISTER_PACK_SV
`define GUARD_SVT_SPI_xSPI_REGISTER_PACK_SV

// =============================================================================
/**
 *  This is the SPI VIP xSPI register pack class.
 */
class svt_spi_xSPI_register_pack extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** This field specifies register name  */
  string register_name = "";

  /** This field captures register field object handle index at svt_spi_mem_mode_register_configuration::xSPI_register_field_list */
  int xSPI_register_field_index[];

  /** This field captures register map object handle index at svt_spi_xSPI_register_field_list::register_map */
  int xSPI_reg_field_register_map_index[]; 

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
  `svt_vmm_data_new(svt_spi_xSPI_register_pack)
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
  extern function new(string name = "svt_spi_xSPI_register_pack");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_register_pack)
  `svt_data_member_end(svt_spi_xSPI_register_pack)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_xSPI_register_pack.
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
  `vmm_typename(svt_spi_xSPI_register_pack)
  `vmm_class_factory(svt_spi_xSPI_register_pack)
`endif

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
FJfbUOKVbvcLJ4YrPlzDwMcd6UqNgY3NkjpPC5OKvDWcUb8kJXUytAGaKZjMPuql
M7hM1wThTutdHAmNgK9N6MXHtp9tbvB8lfmkydoIx/uSB2j0WqoQdLPmy989+cOa
QffHQLfNoWbWbr3/rUlQVF31fQN84la0/5GFzPCeTE0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 598       )
/Tgae1gp2G1MzPqISi0gXEMXD7XrrmErGcLOYqY3xDm4Bbk0r1Dsukh7JDGIzpLQ
2Mjgd1rbRwtaME05yTfvcHfQeKDOpkoeTPvir1OI96no/xQn2U690nxuraDXmjj0
NBktdJAPDp99r476S0v732X2Ob4Zt65fb7eGGWBKW1IcGyyIOc/BjlMtlhLxmzUS
lglOQeqmOqA8l/io83OpPVAH6av8B2UCfmdI68EC0rqyFXuf7j2M0tuXdIol5dCU
GQyVnVPi4QVkPvfFJ1PkB23F10YeM5b6HXstkEFRORF4FDFT48Yued3x/tJR5Poj
hQPUW/HVCUEDRJF7UUmXGsAOPBfl8TMIy7ThBhxtY2zVU/nY75LH5n+dOpVepWEp
vklwo+Q54OBcz+8n2DmA6/9sspPgskvXIbUBhyp6sclTB7SYbKqvtg6CYI1VG795
BC6EVx9R8OPd5e3VJZaEWky1Ima5QYkRrwlRkx6r5YGY15Qtlf68fUQuoCTvcVuY
5WlyhcvosOIhA2RC7Zr4OuxQjwR7d3CdQCVr9/Rgindj1z0YpRKKyS83HxWI2vRz
J0HheNPGNG9NV7nZ6l/E5X+ijI9dvAWG2N+7GZEbMwWxKomJB5zlQx8YLMarE9+6
0aAzR9ZMsoY1bd65zqX48gAKIlqAo74Mv/TN8OCy/PRtTO1IykAdi1caeNvtJBRO
617VFbGClI4DfiVPPBm09bVIRQ6EGFjEq8N1q3xLt1dEC1LvLrbswwNp9NN9K2ul
th5EnOa1eJPxjdY3OTSZPNIyP/iGU+GtDMUpHAJWQ74=
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
YATv/0SOEzkLwyEuxsLV0VyAAlQ2Nd7mwLHJee9FsoKp893L2rrRNuXujidEQd6R
LApxhLWZx3gEztYwqHI9B8iDIPKJM2g5Yin27nBBMqSbnWsz6Qac60ArumH2lLdG
xrEdKGLfoJcjN5Qh5PHLDcPuu101pW5ul9NxipEypm8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10172     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_REGISTER_PACK_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
JecXbdfvGYWxzrkd7wURC0lOeX91ZszBQ4Vnqd4qAyFza7bdqb1RyvEB8BMSDTAl
dW2uAq6eAV6DgNfe8HJX6BcSwjl0mlNDJJZhjH+eQXSlBMSWvZPUmHg64kn9oyeq
vYHM9++Gvh+IIO1Rx0CzH96saasCty4KbHiyP9dbpfA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10255     )
bsjHsIKVQJoDddMlHnvnN8obIIWOluUR7A132EN8l7y77XjTwOgDryMUPKfPX07/
/+sKWzdhxuRIwljmMOc9eDqPt9RFo/TnFRlX4RDO/h68hLoJBnGuhHpuIVD9XZkz
`pragma protect end_protected
