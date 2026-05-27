
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
yoFXbaRXZ/IF0SVzLznud//VSYGwKboOvY3/lMptsqAhAaoW6WHoEKkXgPGhuOAb
rSkkFUNN79AaPqcEMdcfF9Lxrnk0TRFcQH61hEyMXuhadGcbbpSfBCnkDeFt6egp
/kTi+85kZ9Z7Ppli0cDt+gxp9MEXCHak/eSZaY9jb6IH4AzQHenI4w==
//pragma protect end_key_block
//pragma protect digest_block
hxYebutDgtJSDe31kFbePcWlqaI=
//pragma protect end_digest_block
//pragma protect data_block
ezdEwgzJSJkQA0bR+0tuNhpkJajkXZDnjr3NkkvkrF8EerWWlDsKSZplNYundiC9
fSRkwzDgHjwtp7jkO9/ZP1fC5B7VtE/C7UTy5S89f1Cuo8FUbxIGkgqPAVOJEREW
bfqiFlo+xayR6N/osGPCL2iL4yWa96BJqU9VOJfmK4X5oZhKLcjCs7QsW9tJ99gF
HuzAzBUAbE5vuC763WjUdAuICmtFO4GxGU0oY/JTgRxxtTL9gqKoiPR6y2UMNsxq
Uqz0aVRd/r1qrMlgRbCFTbrbg5xJ+ldkkTbW27dzjtGuiDs7zUk3K7X+yi151n9J
HilzVFYL+IpFe/Ks0DJtGw3dSlWPyz3Wgo8nV/YiYqLnq259hlYl/iOL1EMONXPw
oMWtQMGnVk2JTG+Do6GlvdFKGbYw6D5KkEnuWWcIwVWCHnLzjpD5fcH57sGLCnrk
y3L5GrLsu3phUjQWleTHAVSUSr2lRtzHeXdenTLYwuHymDguS+ZMWdZmyhjVWLH0
SHj6WT3Zo/TECCTRLZHWnv8CH9K7qaV5leR42k6smEdzJEcgTi1OWead/HlRraR1
yvjdTvzP9dwBMwEWPPB6sgVUCvDDo1xfKxhlh3zC4osv7NlCSDnHy85xqkFelmjA
xYAuHo60S6Wsx1FaAvopyBYwq30e5T04tYuKNn1MYpjyhNabbr11xJ76gZ75e2dB
CNOA8Jp5jDN53kCHo6OvdtItGaDvfCW+EznGnKTyD7AZk2+ozYsLJmbIqPKKuhlM
fBzOBvkL08RXXlKAn4CsVsppK37xxFc+gf/uTo0XwB3gUzxkX5UsLNq0cJFi+DiR
5t3hhIN0Zn+jTpZHKgrisTR6HK98HWmLzMxDYf0RFH4psAkzTbh+VnBsIBZ47o6i
RpQhYxgyCOi3zuVbIIbsVvJTRjdHT/J0SVbOwdPcBzB3omzqlK9xymdgSsiox4al
p53ZjEpdiitRIHwnbF/gu6u+QpWlLmCgegDUvYdjGIdldYAr/ELlad/ZywBAQbNX
fHCQhmav5kRrsQTbn8mkTuGqqhbg7x2xpoZlQUIJueZVJuZMLGidfBvOx1zLuFfO

//pragma protect end_data_block
//pragma protect digest_block
ntpAdxc5qFjV8iKxOoScLLZCx8Y=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
MowGWjlXMEJzaoOmHuug9XMhzSYZTfSHgR4t9sh0ahcvIURJKVOi4/5LfDY9/v1l
XT5TVCEvjuOCgsb0KNR6jekgeX/wBervmAT9UImJLqFr6jUyYYeMMrJXhfRJPBzl
9wCJkAMwe1n0DbGAuKqZpgbHyqP8j/kdVa5dyWHr1gEqIVH0yW01Pw==
//pragma protect end_key_block
//pragma protect digest_block
3CcMYJvzLgxvmeouYCpu7Ka3JJo=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
ShvuxJQcl7Oa7/Jvav/m131U7TQ=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MICROCHIP_TOP_REGISTER_SV

