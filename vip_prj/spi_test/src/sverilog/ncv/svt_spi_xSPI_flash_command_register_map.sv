
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
jyClZKvizCmhgTiJI7dyR7BXk3JeodXNkw78gcN3Bpvmfw2D+ty/76Lh6v22nPfP
05WklKhymlcuSOAoYdZP5OjrAJ646Mq2K3vdLgrXpD1IL47ADYCatzhIqipdSlBH
rJtSLlD+i7mvXAoqHVBAAA+2Hu3dmkCrQL4n23zoOp8gwS3/IjtiKg==
//pragma protect end_key_block
//pragma protect digest_block
enDPhCqeO/lvFA5PwZDfIRHZRcQ=
//pragma protect end_digest_block
//pragma protect data_block
Z3S1uWJ2srqUUgA9VYJPXocr8ItxltkrRClTPMRrwjmYAffj0GQZR/IoreLrs40x
CsXqzL+tVlFTpFhWcxCFSfKnBNNxmGaJr4pTfrfOghbVv85GfkCk7+CfA3kkHHX0
Srx6GdjZLBpbn+NX13DJJdQKYhrIgK4yn2YO6hfkaCFsz0yCKvNfVuVjhM6cys0s
ipOR/sagnkXax2r9G0fCpDsmeocTUo0txyI+/8YfXYUb8kCO/JBZISIK27pk8vIQ
17VHa8JX+NjQviVgS8f54iBXXJreGhBhRcoiifgzn5L5akE/Qg9LiP2X7qFhpUER
VF2jRTBgnPQ4VlQSc/WjkJN+G7cjbe9V0vG/Axv6++lNKaey2mXwjTxJIPTtZ7s2
XYdEhBACTjA1m3dY1S46gAngGBpsByHtsWWDKZo1FD4PSDHxL4ap5Sh76VXE0HYO
2HDvyztUydKP1lsWAGg2I/5EypA/3mVgszVqkF3sAV7OWoaotj2sl/v0KjBF/XUU
pt4UkfJSFvfA1/wQmgOt1Ute06B3y91k5u05BtBJj73YAvXHFSlhfY2vJ83tIZge
aTMnehYY25l4B8AXjaKYCRA1IOg5BL9fIw+XYkg0MHQcuv/hPyvkalK5uO55/KTJ
VJxPyFKmmkElOWffqaRkCmo32ejklBmAhAgcTV5eiY17y0mi89unfko0SHagmuEZ
O9lO7YdgBfSu9TqPICWV2WJXiDijPxv50J9U/S2+/ITMyD4alTVfo2zFKq6IS3hZ
H77BN98/mZcRfUJHCeTsayim3QcDZ9cojX5HeRczr9c/C9oBUzR0MrHftQgC8POz
lKIoVWBOsygAbzQXiMefgtf9pfD/kyjidV/77ZooXUTOdbgT1+hOE/GKqBNf34oO
/IfXFQcm2MFFfvkyI2Ua0jYbE1H6v5fs1PPn5b3GH/wMVs/qufHyqIzVM9HHF7DZ
xzkGZG2Ssnf2bBPdshux4mxMIkK2iHNwJTZTNGnASmtx11xGMSE7RHaa4qGh6HJD
9KdKN58IUPVzJLiSi2dpF2T0boz94vx/oCO0RVCNf0uRC5/bxw7eZhGOdepTid+Q

//pragma protect end_data_block
//pragma protect digest_block
1sop1Hb6OMSBNld0DpgXo82ZM9g=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
lk3SEr5/lznhbGNiSzH+OXU6WLTSVbyqQBRXM4gkjEw6fsiBW4qMmv2fuNXj1Fm9
spEjA1ws2vgUDSZO+pXEBeajFXEut014GXsKwZ4S6v/064H7zyI7W6EeOTw0pK0V
G5zD27lOlcg96cOkUISOfhIwvH6DrozU5g7PRpHj+C/WP+NmqBcnLQ==
//pragma protect end_key_block
//pragma protect digest_block
qeXqfUlaQ3y7uBqK3pwumOZ/ebg=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
hwriOad1D5b/ouMJwxjVTY8IpoM=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_FLASH_COMMAND_REGISTER_MAP_SV

