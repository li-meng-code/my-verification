
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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
pTf4ecbOQyI9/d6X90OeNL/A8brKdBxQTpDQtr/4j2vgF8XGEjo8hTue7tYsqlKD
5WTQE0oGAzgalQePeYJIUCiawqRQck9LjD9DZL1HPZHfIHmSjhbo8MnBNbJvfQhC
NTnLfc7hGHd895ddNrU4BOHAwsW7M/Dv6X9CkuV7/qI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 649       )
6eoc5NbOCMogBk1zGXbl/sPjMEOIktxHky3usUOspKc44BC4LQGBuX5a/N+0Azc3
JzX1huP3E6DotOFMG7kjnQo+ovRDGmSD3mu+lTBYcPtcFF3pt8EGWcdIIrBu83ou
XD0xy+AJgfSUb1GqrEDe+KvVCCjWQjLuR5tNd3sI5XFowFcvlZIhUooPMwwvJkN1
6dGNoP6O+/YYPUY00t5yigAegCsR6OVTjmQq7FSfH/P4N6RpGxSjfAmqX4nTyfOf
i1nu1qw0xjV0AndHcs0QyWV827MewifI0UFGjTPX688X/osEH8TGENx2oqsUWY31
lz6oMD+k3o2plrWmM8XK33chpX/CJ5SPui/3ukODsz4B1vuD6cQTD20X+Aja1IxV
HogVxLv9P0QRhM4q6uHoMhwk4HeeQdLaqDIl/9mz9bIxROnnjabdfmv/X2tZyUH8
4mrVh3/5rhn99S8sYBQee7EvRs4VpmmuI3w1mIZE8TOdp/ctDXFvch1cdPv+kcHV
DC0hS/jDv92FSadxC9fe5DPgf5QbzofV1l9eZRSkorUYlie8O1AGoc+H5XOtCdwr
2Qe/UMKCBAXushg7m8s/SFe6O3pcRhmrMQ3tTzUTSWALFvgIB0COvqS3a+twDPcX
qcLrEGU6gCHrmHyBj0c3dXg8LdcpbsP6Z5dlW/F9bU439nlO4amjJjyzag6Ptzo2
SXHNvzdjQ6UG3WuNaxiZrnta+n6vgPo31eQsce+wXM9H2v7wLnAtwJMV3fvA8Zk6
7Qsn7bw7N7FG0L71j9nkgEIJv9/j+5KI4FK2SXRDKKMX/iwiBKw9Q/4l3/rFa600
ZHM1vk1jR8fa1THJwxV27Gr0AGcY2sBXd5WMuao3sok=
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
TzeHZV9OLRVRiC2dJlyLKQPmXjBJy6U8cK5qiy/Ijr9d4YpE1dDd5mpv87WYwUuV
u3Tmi3O11/tstl5IGk2tHZuA46NBl4IC7xu1R95nNRGn7sRNM55MFaJFShbVWqm4
pvDR8bkG8mFdkr0JyqDcRpQA87NoOdeJBfSDjv+RnYA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11175     )
+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
daAQC25mCVxA1zwLK4RHQA==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_NAND_FLASH_DATA_CACHE_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
GbGPhXePcwqcUAclH4CFHy9Z6Lj1/tNVTFsITf45tKFn6VOxd5uTKhNaq+2xUH6y
v9mlDRTiHQ05Hta51Hwn5tSsb602TauLd76e62I8LWh95VF6wmhofJ2ciNza3pLX
Pg9c2dLElQlSNiW864VX6gtu9BLvbe8VCGGJMlZVJAk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11258     )
M4yVSBJfG/uXDtXY8kq4SZfGwDgS1Sq6i0UdguB18xmZMcdA8lmRLH+ULy8VBxEk
t+7thbvvBg+yMYxJbp/3JWSJc7dmtSEm0DBJ+Kcp/+lLNG5KHZ7oEsT+nkwcInk0
`pragma protect end_protected
