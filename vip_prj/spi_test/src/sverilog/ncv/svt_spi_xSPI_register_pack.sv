
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
bqUr3rJ/Yjr6Wl2QaGVc9+h0yFk2qDZrRKhQccdUnk94i7dN6fwdYaYXHVuS+5bp
RplE+rTfB45QElRiIIcBU9XtygD5mXd1huwtpui/cTP7AuoU7JW+GhdbdTWRebLW
Lx7hyDmzUDZK27H1w9Yfh8Hn9BcVUqYHSUiSeek0VFSub96aQTZIUw==
//pragma protect end_key_block
//pragma protect digest_block
PbRsgzQ45sv14zYi5po2VZQOdXk=
//pragma protect end_digest_block
//pragma protect data_block
BTYJLDXWn5ez11yhRwRVCrl2xBFA//EQ5TWwORgZ3gbHzeyakGu998en8Oj7Fymo
YadhHvozwVosL+PGJQXThLw9qVltyJkJok4C+kAvsejTHgClzRKskfMJj3s6Kvn1
mxkVBqHUrpQ+cO/lmpJ8xju7BvwShwUtM4fPSEAu9oMNDcmHSG/GiW315NTy7KIi
q6FApPFqseEYMYvvs4/lhIvF9DHBZpo6vt24OAfyqkZFyub/Uad12IUCDBxqhFPn
B3XYfaJdzN9bGV2Ry/zEfvJuTKK7gh34dz5dD5q9Gax+gceZyCvEPcwz3U/OSb5Z
zeXBJjRLI/Ua5bv6H6mRzX7UoKh3e+fb4SUNJ6a+dbATpr4nuRAosESRmhwows+r
XEky7NGZSTvF5SMxsLfnDKi3L2tFoC7esyKHbD+dlRJ3Sln4xFVQoPh1D9nPL9Nt
mHhWBJ2FtQxcBSO+Ml/6w+6BnorSDvpxDHKPdCfEP9x13yO5xgHYlhA/rS5ze3jd
OW8mGzjBRNhkjsEnlfCf7PB+eNi8JAlamTSxj3A3HbnA4T5GayW8/Hk3EJsrGYTL
ssv1c6n+F3SN2aJHvCrF8xbFFIFLa1HZtNbuAQkMbdTEqC5ur9wGYzndBQctqOwj
suh2WKaWR/bQE51jZi1pwX8w7e99Dc+spHHv1dZbL3BRET3iBZvsGB70WmaFhKNJ
vl2Rp/CWpCmx/pcLnMrB4T+ftQA7GuhpJNz3PMRQhZ0uRvUfnoTKCDDqg5IY9pon
92qz4uNiJ4KuDYDp5UMHbmd/5fHqn0cPGO0/i5+EUhFw6fd/E51JAJ8un6DhG6Go
UJ/tLRwA4ycVN5R5V6kFtloJu8KVGe7weX55ag55otungpQH2xQJ/TqpVrZQDOil
6l9kzVWAlcIC3b38ikPs5N3hRn/XEnfGHBhmCXBNR/ixStsRFDk3tapZkwrUnvaa
GOH9wdZYmOcuFRW9uDk+KcHdX/61lDPUasIbb3Vhdo31tG4UxyT7jKx7H6aQmXUp

//pragma protect end_data_block
//pragma protect digest_block
asE3q2jSAyQloTi0Ul7HYXxgVvk=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Zb+R3ClrKS1cD4oGj9NYFZgCNvh43sglUEWYigXhr0YT+hHrZgkDFuQDpFdNNERB
0H9Kpwt2nqmbAtL2SIFXycHkv5+jvpGr7voC3OUiIxlns/2Odcbs5ObRoAadjjNL
u1OZX7N4DCHdtzBQL1VP0rv2Hi2vcSHXPIosJs6gOrM6x7PhiLj28g==
//pragma protect end_key_block
//pragma protect digest_block
ASj1g4DYkg+04byrx4aZ6SS72To=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
nKOPF2ut2wFP55ItHyH8oHxSALU=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_REGISTER_PACK_SV

