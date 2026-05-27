
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Wd7A08SRbOwSo5bgCYpMbg5cL4jtmVCL29yDApUB8Gcv6u+1NJe4RIGkUdGrYdaY
MSRfYP7e+JVsY0L6v9TUDTV8L/jIWnlqr1uoypQgBvEDu21vNOZckkb030rst7Eu
M0zl61dJSRe/80jQWz51fUuoBBa6awsqKnv3rF/FksbhOSghkKHUaA==
//pragma protect end_key_block
//pragma protect digest_block
4y59oVDN8Y5bIGHfpfb7Gp4SfmY=
//pragma protect end_digest_block
//pragma protect data_block
kPIU8ZcPPbJdPTsm0bY3mxNRwOgo10lNJ5ugA3BkUAuEDyAQShh8tfgvkwpltLwq
ZNZPLuEsHh8ynqktTM8B/TnAzvR3EbD+FlS43fnFORkn046Nx0Dsvrh7PK0d/iJe
jSwkk5R7tm1YS3cEBWFioUqOaGSLVtFIr1lFyt8mgI2zZEwAUO4BZP4x+WpHmExS
oOXud7kda/7M9BrUWZJyzJJXmTDGz1LEdvAaIg4E+w0pIXAjWQq92Wd9hAdYDVsK
IZ9HWrzWs4NztZ2lb64NXfxDODuJ0tf/mpXN8amHFtqFyuPHQbZ3JpxNoe+ts/pl
vbLY5/Mn/NpbC3ghrrQ3GfUmN0SCX1aSbDb0ONR6BjehI2tekLiUiW0AK6WecJn+
FEnZWypMGpKhjn0bDA9J7QdpVQryJ8k9vg8Ie3OHgU6AWgLNXMzmptdxvcLV/eYc
VVbUCcNkwqM3QAscYYFZoQrbsKjt5aWhhL7HvDosVdG3jCY3+FGJQLSTHuYGWjHJ
FNySwDG8HlozJk9apqaqkDF40E/fpYVd2MEwbpZRTI7Y31XLNsSiD2yHIkfrzVCD
+Wj3b+K/fllLKPgW+gWxz+U4cTl+RCvDFKB46uBqMknRoSfQBoeuZXu/u1+/RQ8p
mfsLSwjX58IwEQp32uTC9IXrVEjR08uB4InsLEllF5IpgVJkDpgrAQcnTFVvUCfA
+DGtdoPK03/suP73DigilnNF8pBrGdow/iPPYUP/2gVLo5FMS1w4VRCD+/YXrQvH
UYCQvOnkUdwXp76014f/InGtAKbHTf8ypvHQQbUAcVFwM7sb4v9+mouqyHJGeIfo
lvGwoNl1xN0v2aF2EbakG/dXil7VrzeEHbTlNprMKzAVOy3Ys9hP5ps+85o5+OP1
B3mapLjTc6tjnHvXMEnF+IQx3mhmrWseixyfhZ9BRbsUIoGIjDbj7Nz6AYXkUJ+w
TqX5M83Wf9X0p8V/bD4YTnIaiWP1pJG3RVhquMZceAARKNuLiJ0LXIXyuUdVgjNS
RFoeOX0EUM3NAlX9MF2PLz6x31yA3ZycwFCNc7sxfd1qhi3pBuFPsA7xcI/yoLWO

//pragma protect end_data_block
//pragma protect digest_block
GGx9Gb1QmBGQ1OGwb2xwOeflO4Y=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
k8sWMK0J902jkfAF6gDJvkj8e9W9MtHn8bCaaTWxK3YR8Ap11Eep7XVkBTmkt0Py
6xLYcwbSve60VKDZpWGn3Z8H55m5Lzzy5KKDn+AscUAg+413F6LFzDk/ySfrSVJo
xJuRorU5Thx3MvcmUoswpICjjMzxXqXK18ArBBW98cyaS3DTkQwTGA==
//pragma protect end_key_block
//pragma protect digest_block
ivpJ0CeyFL9G/Ya3RBAS8Fy4uQA=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
pYVtKNxACPv88jq9j8QXTThEP6g=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_NOR_FLASH_DATA_CACHE_REGISTER_SV

