
`ifndef GUARD_SVT_SPI_NAND_FLASH_DATA_CACHE_REGISTER_SV
`define GUARD_SVT_SPI_NAND_FLASH_DATA_CACHE_REGISTER_SV 

`include "svt_spi_defines.svi"

// =============================================================================
/**
 *  This is SPI NAND Flash Data Cache class. This holds Cache and Data
 *  registers of NAND Slave device.This is instantiated inside shared_status
 *  object for Selected NAND Flash device. 
 */
class svt_spi_nand_flash_data_cache_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** 
   * SPI NAND Flash Data Register
   * This buffer holds the Data read from Memory Core
   * ECC operation is calculated on this data, corrected and then pass on to
   * #nand_cache_register (Cache Register)
   */ 
  svt_spi_types::word nand_data_register;

  /** SPI NAND Flash cache Register*/
  svt_spi_types::word nand_cache_register;
  
  /** Valid bit for corresponding byte location in #nand_cache_register. */
  bit valid_nand_cache_register [];

  /** SPI NAND FLASH cache Register address. */
  bit[`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] nand_data_page_address;

  /** SPI NAND FLASH cache Register address. */
  bit[`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] nand_cache_page_address;

  /** Specifies the Partition Index Updated by Program Load/Program Load
   * Random Data
   * program.
   */ 
  bit [`SVT_SPI_MAX_PAGE_PROGRAM_PARTITION-1:0] cache_page_program_partition_access;

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
  `svt_vmm_data_new(svt_spi_nand_flash_data_cache_register)
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
  extern function new(string name = "svt_spi_nand_flash_data_cache_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_nand_flash_data_cache_register)
  `svt_data_member_end(svt_spi_nand_flash_data_cache_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_nand_flash_data_cache_register.
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
  `vmm_typename(svt_spi_nand_flash_data_cache_register)
  `vmm_class_factory(svt_spi_nand_flash_data_cache_register)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
e0Yiyl0CIgz/MEI7JJPzeuSBQbKTlPDN4EOKQaTJeLM1u1kQWsZ8F1qZHVRSKYtX
YMhBFN57jcm5ryHiaQK7aYoYMkXH8atO1KcuhIXEZINYVobKN9J/mcQdHFlf3PyZ
kSpMLtiI6nAsuBJOg0EYr9urGlB4RKTGCoMZtu0qR/kOgwQ4s8qd4A==
//pragma protect end_key_block
//pragma protect digest_block
9xcvFaShhfD9rA1NNTes1xBYHNs=
//pragma protect end_digest_block
//pragma protect data_block
WZKaj4rYpll6hyhv/w7WCtFX8xLnXgDTiE+6KmM5w2BBfegCIJgZeAiGZR4NBsst
l/tIpWSxDwbyT66dSU3LPLVj6D1xeZUzBr8rXtoEm7eTKcH1sVuTaT/WnhA2SeHs
5rQ8LK3tQAlamEoq5fxHLYaA6nKEIfq6/AkwGlxMLdfMd5jVvqaUZqnR2ffvRpy3
ZRQ+GGp79TKdP5K5tq/mTd3fFKfax6g8vPUTzhciiVXChFRi7aN7k76Jeyw/hU8F
ma+mSpW4wXImQ8rMhdKrTX8D65qQxZhBzw6+pIviCQgoHrUoMwBpio7nyGCKIDNJ
707SJXEELVI2q901ilw4AQCaudCg1V803qI3n9DBmDTrSL/MH3IzJ85cWAU5nmtI
OcIPXdCg7s1DSkV34JQ0eMKf5leYF/HN3Md9+yTOxkltZKZkpZ13QBOWU/l0Q2Dd
TQQ8j7Q9dK9dUfn3Y3UpHxrOYuvF1evjOddg6eNyY+DF4xc8uKae3iB8D6Vf0LJr
1OXmx6PuQmUEriN3YKDRLNemOTLfFXYcYJpy4/pAD5dSBefIhsVRTD0Tnpw/RQZC
QzeapOgJCrDFIZN+OrmLC7z+slyUoNJ90X1Em6q08/D8+MJJ+ge8k7JAw+pq2C3u
6k7MDg+DcViWc5G/IbIQskMWq1bFkV/iJvaJ9igwSZrDxCVpUb0YI0MRczhTNW+S
YvINQO870VDDEOrX5s/MfSQsu+A/WoOOu2f+5VRGT6f6IxqfgU4UORVl07bJVPAw
GEN4cn975a7/RXbXG/H1DkRFQRk4hZrm0dRroabJIxMzYaZzdmlkSdIBnOnGxR67
JBKOOLCJRgPrgEHzvNVA0op05YSuKbd1Ml+2I7X2yGfvc/8n0/AkrDFj5NN0kg47
tOaCaP5MKMy80PhS8GTdtY0oZxaguwwpibVKpD3vWu1j8afIwgMP5vmaj1J9q0V3
+8+Aa5rH5us5QQWCN06uFiZI1VQY/sGTUm3Qq9QYVTNI9iIcl5MisQguhY3ppb7r
1KREh0rs87kpXEinkz7GNpp/Gfdhk5UrabfOOLtbx8yU5Gm9V4X0GFiSerd/XbU6

//pragma protect end_data_block
//pragma protect digest_block
yAxdoj8Qb33QMUOhkHZBQG4zRgs=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
NFPq/eQOTdAeXKiQ0eR/6mruW4Cyxw0NnxYOhzypdldjuDNyMsASLmK3O4Oo9YpT
iimoUXQ5mUPkHR/+QkCcBM/fUrp+wi40dHSrNndJSXijNVB/8q/aYubXIwrBewnp
XXtjfkb5Og91LLLnrRHdcPPxRlCHxJgtfsNfs+JhiugWVQrXGbVb1Q==
//pragma protect end_key_block
//pragma protect digest_block
fjGv4vIc3Bf5qt9qKM8Dlld04a4=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
TxYcHZbW6ma+rXTw5z34ppqvWWw=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_NAND_FLASH_DATA_CACHE_REGISTER_SV

