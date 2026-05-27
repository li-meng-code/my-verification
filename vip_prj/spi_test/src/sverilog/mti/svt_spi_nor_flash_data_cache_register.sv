
`ifndef GUARD_SVT_SPI_NOR_FLASH_DATA_CACHE_REGISTER_SV
`define GUARD_SVT_SPI_NOR_FLASH_DATA_CACHE_REGISTER_SV 

`include "svt_spi_defines.svi"

// =============================================================================
/**
 *  This is SPI NOR Flash Data Cache class. This holds Cache and Data
 *  registers of NOR Slave device.This is instantiated inside shared_status
 *  object for Selected NOR Flash device. 
 */
class svt_spi_nor_flash_data_cache_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** 
   * SPI NOR Flash Data Register
   * This buffer holds the Data read from Memory Core
   * ECC operation is calculated on this data, corrected and then pass on to
   * #nor_cache_register (Cache Register)
   */ 
  svt_spi_types::word nor_data_register;

  /** SPI NOR Flash cache Register*/
  svt_spi_types::word nor_cache_register;
  
  /** Valid bit for corresponding byte location in #nor_cache_register. */
  bit valid_nor_cache_register [];

  /** SPI NOR FLASH cache Register address. */
  bit[`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] nor_cache_page_address;

  int buffer_word_count = 0;

  bit[`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] buffer_address [];

  bit[`SVT_SPI_DATA_WIDTH-1:0] buffer_data [];

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
  `svt_vmm_data_new(svt_spi_nor_flash_data_cache_register)
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
  extern function new(string name = "svt_spi_nor_flash_data_cache_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_nor_flash_data_cache_register)
  `svt_data_member_end(svt_spi_nor_flash_data_cache_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_nor_flash_data_cache_register.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /**
   * Method to make sure that all of the notifications have been configured properly
   */
  extern function bit check_configure();

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
  `vmm_typename(svt_spi_nor_flash_data_cache_register)
  `vmm_class_factory(svt_spi_nor_flash_data_cache_register)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
QNDi8fVw9sowbEwlmSQu6eR2/EFyqxQRh1HQJKzhdjj4JAVvRx2m2Xep1Ztkzd1u
vfZuBcgrTDLNS/Lik3lAE+0o0hhbnNRG+9WzXsQoAKXeSl3rTQ85tPbBTyGCoLx1
pJ5eKS0kD0PmTl+esh6DzZyQx0MBndmAPzEMg38b5s4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 645       )
nORVtvfq+x04MTS9ePxlxCLCLyUNTlLXuGQ2Of1I2Mv+OEgZJWmJeA8A5tzKBv1j
790oyLj6XWALNRCI7+LTkNkVfu4UYtMVT5EitTC7cDSe2KFzZClcIFQN10GaUj2u
QUC/kdooKNpPP43zIFpb5yuMLraQj19lKm9pHMzy3vTG6jHLZTrF/13CCKK3vqnt
n8TvbvA01UhXeHe96+jSa5yAMnzh3tGeXwIjHGsYNX/rsXZldRDs3tkEy4xgXnn2
mwNvjkcwchtPwRq/3yfCNI2Bff7A6WaQhioofO5mrf5X4cu8gEGCPAXY8bASv7Hv
tQcH+yABqaXgTDtbR5mp4f+LuioUfrSelxK6TD58lQFP6W7nQia6LmlsFlVz82E7
auMI92KCqZoATVBwnhSSEuPF8utlslcDsFkDizDBlvXU1XLkvH76M6IsCnX+kv1z
0RugJiw86M+KQKMASBRQTzmgTw0pqu+gymKcC19M6q0kurxI+h3r+0jOI8dEgm+5
cee1x/yOVGfE+BJ/Vd2j80HQuXxD4QGnhWMf42+ucGB9zso62rs7b4XntHFjTFsv
nNQSeB6u/pF+OMB3L8684tNHcDT4ADSuCuVZv4wT8EDf2gHDCBn/3PTN5aUgAGMU
kVnfksl8jTFJVzSychsU2GhiyX5Z7VfW3zZgRhZMfmKySk+IyltSb0cU6yjk0Don
nlbzGVxms6Wq0afcvgJxjd5U84wpR5UdQMIV73urbRaS8DiHStPPcmzjR2/sHXrC
0K8qN3NPO6s9J44QOXOSyBpk+h9bWjQ0o1k7BQR4vaPPZXIoCWnfQYkySNsATshk
83jQQwIJEkZOG/gA8lrkJPIdbC8BB1T7kaYHfaL03Jc=
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ifX994expDwjIQ05ubzCnD5SYgEnKoZ16CUaR8vgOoFlAHzQVi9Afoo8wKiSXpzD
FJgWQ2Nf4PmZB1tORiKlEqdg1/o18MHLoSzXQqVVvOU3TrB90O0t8m6Jk82H1chc
FSI3Hh1T9RbiiDpbyUUw0vLApZHYhdhbR59L0Syf7bw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 12429     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_NOR_FLASH_DATA_CACHE_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ZHTxwd1SA3xQnkcIhlT5is3H4kmB2qI7ojgwMaGMrq+vAIHdIVi5JmVllDks8aVQ
SJJ4jNFKqEqqQaKtXbrwDJ1ozqWi0+LXcSC/BEGyxuDvgly03/jl1ag/0ok2rB6n
VbSoc7dZRN2wgdjIAEXT1pq1JraoHtdEloPkqkBoGhI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 12512     )
Wv+EmEmtxAqjA54t7ge+aPCVMiacqLPX09kHf/Jbj6xrRtrb9IPsoeFkSQryNnyU
CzRJy8OfLTZ46+JNLPTKy9x/fw0/eApS2uheik4cvFnWFVolmoieaICXpy+bDVZD
`pragma protect end_protected
