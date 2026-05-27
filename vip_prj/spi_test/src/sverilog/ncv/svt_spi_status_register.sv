
`ifndef GUARD_SVT_SPI_STATUS_REGISTER_SV
`define GUARD_SVT_SPI_STATUS_REGISTER_SV 

`include "svt_spi_defines.svi"

// =============================================================================
/**
 *  This is the SPI VIP SPISR (SPI Status Register) class.
 */
class svt_spi_status_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Mode fault flag, this bit is set if SS pin becomes low, when SPI is master and MODFEN is set. */
  bit modf = 0;

  /** This bit indicates that transmit data register is empty. */
  bit sptef = 0;

  /** This bit is set after received data byte is transferred into data register. */
  bit spif = 0;

  //----------------------------------------------------------------------------
  // Random Data Properties
  //----------------------------------------------------------------------------

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
  `svt_vmm_data_new(svt_spi_status_register)
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
  extern function new(string name = "svt_spi_status_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_status_register)
  `svt_data_member_end(svt_spi_status_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_status_register.
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
  `vmm_typename(svt_spi_status_register)
  `vmm_class_factory(svt_spi_status_register)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
/LuRvwhrCtERH4o91yamAAbb8QgTDp9zUlRNLsK6OxdjKt8/ElRJECWaM+gYTtj9
3tWjOA74CHE8Q4oE81SKNdXDVO3DcJm84evF/TuEFWz60XgxP5Zp9ZY9+OeeU5jq
nyY4b3QJs46wPBBpwIqtYiTP3YvFTqNN/S0dPvoAPpGBmNT6cR4KgQ==
//pragma protect end_key_block
//pragma protect digest_block
uKjXlK0PN8uncC9h1mhaCt6RVbY=
//pragma protect end_digest_block
//pragma protect data_block
vcVuFT60TW2Xkrd8QApBpOvIQeLxq0No4MzLJTNsX1jqP9GKIPFrL2U0c1ikvWwx
4Nqftwxnh6l6qO7qSLEx9aePcczymS8VSxLskSHQT/lq1Jkn/S4I6c+xehfZvOyT
iXvjN1Z9I3r3+vTJJrjMwc7IYPlivmJ0eUqtezqkcviiyrp1RAYpLFF5jIfwOk1b
nu6h9ovlY8FI2CwIth17HjBQpxAcRP+nrUC62sMhdE/DQKR7V2mZsuFS0CPutK0N
Bg1jlkKHvgIXYmdEuVjiyfD3IayQU4rvKftJ5GoAatmKCf757JkgWeJDZafLHihi
8HpgbmPA5/4LyVbvBmtNEgsUNV1hGEFg37HkEWY1SzlKorhiNn0SsIbF/cSoiB6p
apHGbfcSI0j6gElkZfZm5rDOEc+OgkQilMcmYa/+3o6jbWiLE7cjOblZrlAGHgzV
6piS3Cm8lXvK2kehjyudGHoZBvUfYxH6Bdy/uyMFtBz64qosA21kE/UJVBAV9rhs
OxPoirpHJnWQNks6JdSlRAZC2mzj+0gDBmMhuTIMdNxNRX/MSCfDxa5ONSq2xyYV
ayGrSzG279wIDuku2GO/y5QK9VuCfVAcnqks93JeVxANOBoBMLLdZ6QR0DBTssSv
3toGnNEZCVM5Olt+edJYh/GfRHa7UdDlettd8Qp1JXnGrk31Xab5e7Gdfu0D51vm
9ADrGjXrEqJwLYuIxYJ5ykFsWaXKOvqfHOUeeCN2Ku+Q2VESsoRdS/WQDHB85OFc
Dg5/L+AC7qL/WnQCFfWIoZjapkt7+VUkmL0DmZcroOWeavK6wfd/wzuoHGm1aont
qHzmzMMUxlI6vZNi8kHCxjcA9fNCB7IjPml8/OtORGssmRPuba8TsLI+tBjUAcp0
gm7eOWOGaBjXz19BerSd3sz1/iZKWxYs0eC/GBQ/jocOCdDaIefB5cyTJl30oGJ+
lunLF89DZ7bIEvBgDNYzpFUCh8jqN5vRckXlgWm7zxg=
//pragma protect end_data_block
//pragma protect digest_block
eI0lWG3Pc3d9smmbp8u3FPfjVS0=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
TrhvbWTV6U5D+ZdgIf+us1DYgeC4dGBNw+p+PwRxHV6F2XjOBnTpGVGDXNxPnZbV
S8neXfEyhEHUyrjLUJtX25G4PMfJ93Tk5vLpOzSJr2+lsrG6OXGlM3VFu9sZJYvq
kT4iLA/jiyw46kClk6K9sI6h9JgX+z+DoZf6zQjl6b5J6OTWE4d4yw==
//pragma protect end_key_block
//pragma protect digest_block
GR8vpiTVqRTB9Rwx6GNsOuUzuSA=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
gcDa8++8tRs+fqIvrWeN5dQHxOk=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_STATUS_REGISTER_SV

