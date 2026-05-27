
`ifndef GUARD_SVT_SPI_xSPI_FLASH_COMMAND_REGISTER_MAP_SV
`define GUARD_SVT_SPI_xSPI_FLASH_COMMAND_REGISTER_MAP_SV
// =============================================================================
/**
 *  This is the SPI VIP xSPI flash command register map class. <br/>
 *  It specifies flash command and address frame required to access specifie register.<br/>
 */
class svt_spi_xSPI_flash_command_register_map extends svt_configuration;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------
  
  /** 
   * This field along with #address_frame_list specifies flash command/address frame(if applicable) <br/> 
   * pair required to access xSPI register mentioned at the same index of #register_name_list.
   */
  svt_spi_types::flash_command_enum flash_command_list[];

  /** 
   * This field specifies the address frame to access register specifies at <br/>
   * same index of #register_name_list.
   */ 
  bit [`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] address_frame_list[];

  /** This field specifies whether the address frame is required to access the register. */
  bit address_valid_list[];

  /** This field specifies list of supported registers. */
  string register_name_list[];

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
  `svt_vmm_data_new(svt_spi_xSPI_flash_command_register_map)
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
  extern function new(string name = "svt_spi_xSPI_flash_command_register_map");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_flash_command_register_map)
  `svt_data_member_end(svt_spi_xSPI_flash_command_register_map)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_xSPI_flash_command_register_map.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to, based on the requested compare kind. Differences are
   * placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is svt_data::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(`SVT_DATA_BASE_TYPE to, output string diff, input int kind = -1);
`else
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with rhs..
   *
   * @param rhs Object to be compared against.
   * @param comparer TBD
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
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
  `vmm_typename(svt_spi_xSPI_flash_command_register_map)
  `vmm_class_factory(svt_spi_xSPI_flash_command_register_map)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  //extern virtual function bit [7:0] get_stm_status_register();

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
UzS3hNvDDskt7MwlkoL1O8zikVD1yBv6786LwSn7R47UHJ8E3J39RmQDKFr8Jmp6
UMYwz8P6b31s0LQOQY0GCut4NzUIp4LGhNi5KHe+IOAnhk32X34uhQNRCm7UrNds
deSAR5Wih1uiJz63OSHF6AKe0xGpTJDXxPVlbwTw8Ao=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 650       )
E7CBs86hIYuaCir66okPFAKnlVf3d/5tsm3wfgLuCoRGcBObXkQCeJ1QyglQa04E
46kWnvfp8wA/R28mKD1G1x7CI72EASST5lFoXuuv6Gb58MSUz2mDUHWdvrYaO5P3
8xnk55Y89inEsvcqTf3uILH2wUSPdL1A6HI3WO0yFXaTB7cxzqImL1kpWyGmPmeR
Lg8ZPF1fcKrwtZSpFW3/dnRUImfQUHQ/2y6Ht4N7ZywZEF9PM+Ayo4OMqv53fvSR
9wrT7zhnIUS5bDwZpcJjq8LDNndwwy4Bbc+mMZCzkcwzt9AL6mRZrCIGrZvDvY+T
duVrVUMBiveehjobgfob92Be/+Cfvoh7y2+OSIcKn+WbhIBwjU6B09aKpRqfxmJN
jElNr0ptMGW/TAPUQC8V+pfnfSTuiv7sgw8Cv6HpsuL3z5dMxAruhiyyVscoKJwy
gIy0yuAfgPDArsnrdOXbH6g/BesJVnkD9I59F/gSA3EZVtgVvxwxvNO6vrDjiMRP
kSToxFO7mxPVqq7yZtjjIz3BGVCjTSqqpIsGoieAw8yCWXhwOsyhLAj32XQCKL3u
DT1e5jPkwQy6sSONaPyQu+2OR6Pi+83QfUxbh/3PreH3l0HCSLr1skMswZJu7PPY
WhNXz+rp9IoJj7pSnZ7nlt/9Ib7w/m87QCtIV/CN+i1Peb73g+dXuivTCe6zJUB7
Qq0POU5f5SB/5+ClFP+fI2bUsMA/V/B7DqVl5Yez8crgtbfCgYKjS+G2/8U0qe5Y
qMGJDG+RpaneeycX5FSV5rmGVCNlao/POLOyPHzaes6hK71XcugohRt9PqS+Wz6d
kxhGDtymXq08REjwZjERr2xwxkkR1pvXuH3WXUC93Vc=
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
UeUQ81oKZF94PbBEcT3N+1Yvy4NmAfFo4ly0PdQ+5Zq6p5dkmwuYhefidBvonWnU
fHwEAWXho5L2Jm2vWRFsLwCNiWRVgua/OdpwnUlkEWJ5Lx9+21LGYZeGX/VEPAR8
yvS44giZnp9ZL4L4tS7UeDUmrTvHtqNM5XnTf/qm47o=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 14913     )
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
BU2Z2dMClZ+Tf8UvN9XKCQ==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_FLASH_COMMAND_REGISTER_MAP_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
PZQrC3/a8naUq8wvEVjOUIVuILxuYlFKJd4KV46Qj46fQQZpUeCx2/GL2ZRDvlnw
j0OJ2hzeH0HXZhNGN9G7tU+NIMpGE2V1xudVGBiS7ZgFdZ6J9VgsggAtvL2gVAuk
pgq8DlICiXo47BGP71u1jcgJYiQAbFbeOekM3XPfWmI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 14996     )
Uzw80kwNQAZ0QTugsZEjfYy0K0GV+CotBppb/kxVSbUaCWH/70wAULdrf3mzIhyU
7KKtyOmfUjz2psA2OObzMBDbFe18VdEA6bYNhY2z+dJweeK6XwLs9xUDjOD8hmtg
`pragma protect end_protected
