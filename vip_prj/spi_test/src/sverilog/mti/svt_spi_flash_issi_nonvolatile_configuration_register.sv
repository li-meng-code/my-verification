
`ifndef GUARD_SVT_SPI_FLASH_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP ISSI Nonvolatile configuration register class.
 *  This maintains the copy of Non Volatile fields that can be stored/reload based
 *  on requirement.
 */
class svt_spi_flash_issi_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Read Register. */
  bit reset_hold_enable = 1'b0;
  bit [3:0] dummy_cycles = 8'h00;
  bit wrap_enable = 1'b0;
  bit [1:0] burst_length = 2'b0;

  /** SPI Extended Read Register. */
  bit [2:0] output_driver_strength = 8'h00;

  /** SPI Bank Address Register. */
  bit extended_address = 1'b0;
  bit bank_address = 1'b0;

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
  `svt_vmm_data_new(svt_spi_flash_issi_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_flash_issi_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_issi_nonvolatile_configuration_register)
  `svt_data_member_end(svt_spi_flash_issi_nonvolatile_configuration_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_issi_nonvolatile_configuration_register.
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
  `vmm_typename(svt_spi_flash_issi_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_flash_issi_nonvolatile_configuration_register)
`endif

  // ---------------------------------------------------------------------------
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
HZe0nVVfVkcXMglqryMXIoMQxWQNx/k7gWr3Z79Utps/oWalJX0+1PS3hV0tZHCz
Iq2HDcnp5Ez7EVurrBnULqva1ePPCd3UYdCbauTxh0F8rHkVlZI+7C5lPzjYWEbb
BIy7p0tSHReQClaHKQguv8K3MvIF6AN1lRQFpZjrjlI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 706       )
xTpBRtR3VzLWW4T5Iux246/2CrviZ6mqVdXvOYGezdrJfhlK8xs8S4fueFALeaWT
sxhrvrQ9iVRZAs6+5gvE/m4xSELzFgCKG5+FGk6Zi9yzd07/GuqA635YQw62+Tqx
Ws7AodH/E6HTXK3R17pF/QptUViB6UanE4xJX02YEkwk1WfhEE4bnSCGPxJ5TaBU
ZC5LmUeNRZ31L8akzAPqkdNIl07a6AOWqyVjHahCdsqIuq6MJbPbPgcUtBld7QPa
qWTpUlUzDMAHbFyN1VnKRNJDRh+6zWtwqZldvXbdOEzSKW4+/w4S6lI8TlQMpndc
94L5LSTT11TqLJPMiZCBBf0U0CXH4K6pi5d++N4WbK9aMDgXQw3WanVa2EBZNl7Q
AuvD8um2GXPNy93cIxBG26gl/1zvtvPkwZV8aHp45lkQNBMlamxzTJXAF2aVU0ov
fyPo+AUO3BbxgM30YriuCwmKDO0q2LJrSy5J1EbcovjTn1k0j9lx6HPi8XXCyq/Z
3PlnxoCcNOXFHOolzshs6SQh3O6RKgoOdVYEF9cv9Riw3CQIDobwOi92SScNgqG6
uymHs+2zFuc9WJsB/0dUOP2fNeFrwyPQga3C2KLnRsQXjt+URXZvgH89q9xxFw+h
LfuK71/d3JfGmmTlyKsqNRh2B9V3zj9skohJwGCNYrmxoQd8jj2AyP8xGKi/NN4Q
DMMcYuehwk5sYaf8MQ9V+O72cBOLCunKVJWHdbq/JlAV1uYm6iY6VvawlC1VGN6Q
NZJUvSseiAGFSo6+a5I/OlB5OumDBbJoJdzrtHbsPA2XRQbMiPQuYLPIhQAKtmpw
ORId+XCqtQiJxk8EKu7igdzUsW9SelTl40ibMpQId9iM0l7YlvL2/GKAm6oe+3+y
R23nw+n+yDGQ7lWGBHlgxOJI/tJLNkVwzI6S7dJss0T2L7U0RR48mSLm4rkQWWki
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
BXx0W+TQRdACN7hJZ+++xkP62oO2kfrB6uRmSZCSwR8bIqR7/fo2+DWax3cQvrgs
9fj6b5cDdUKXiFoLVHy7Jxt/05Zt8cko4bvTL/mYATBzu/VRrYtXiuXIawTCp1u3
WCH0IIjS66oDC7KbIxWF1pr1EpSyx1PyxIYy7j7pM5Y=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11760     )
mHlnXncodDTxxjP09huzzaLRxEPGw9NHmVaYNtZuUyfZ1p5jemSiaR1bBbqbcHLL
F/ShlnCFDDRCXuDsC7AJk48Ze0hJuD/gIaQZB+TElsLTYJGBqnci+Nd4o+taaOPC
bL4/rmmlMa/efUKuoKnIki4hIwUzLboegW1YmTxRq5v63jcfxAGe/F1v3atlD5NF
J1wbyX5XwACMhCe/a6spuTR2+kwKTmhgvInrwOfe6dqNR6tf4RZ1FPvh1/QruMlU
NDvctoRFaiiPU4oVJJS66JQzkE+o053c+A15KIhMvFXXsBdogVnjSgGXS467An1y
7zZukpV+QtKfItUwbm75v2UnC4xSbhnyDBSovErrcAmgHgtHEWMosffe7y/BsyCr
No/3ZuedWqcXmPOn/6CJ7k4R+CA3V/4Ic+i+7YvJ9Jzie0ynQc97Hxw+QQDoV+RZ
MyceUAFcOsL5TEPdmP+0GpalygZMlySK03e9+iQihMyxfWXbNJ5guxYH5FMU8x1O
fp6+n2ZWH1OOQOiqRWbnALCv9SDskEhg1O/FjBn224jvoI0iBB25cJ3Y3clBMmbK
jg/DLpecuAHX1u78uhbeoQVMDIvPeqo4y5Zam0v+KViCdcXCkHLbo2XCNU/m7HhN
dEQjmxxGsygOLZWq4qHIJH8+Bnsk8Twh55Ui9yqTJIO3gesga5Z0dfm0XaZd4kY6
KRaeNZfsBCtL05c293KWksCeYQdTq2Vx+VrkOhraD73cwg9Fe6hLirJyWqJoOfHd
nzMVSpsHBthhDjv9UJQsErxd3dZ2Un4W/pjsCpHU0NAYxxIS0AR/lh4imrt4WRiq
TIJ/uQW3E7dtnYHmV+SI4nIBMvcaJYiQSTfg5gkAfNKnMqgAdO8v7FBLqqRMyK/S
o321yyrMLb5OlQQCi+rg6WWHV8shpqSE4UQPqhbXh7LU6Vk0NOQGIXC14ICP3sIs
88UkL6Fj7KWoZWEiz7a69eL9RIEYH0Ih2Nyoh2PZNY5uAQLDKH1VbJiQSWTn5P3w
XOUlq4h0AJSBhDB/4HNyHL6+vZ6o9gh1cieIU3oC+xUx6jUBxQfxLH1CW4c3vxgV
aQNlNObyRAS4iIYvfZ60bp4yPuDgZZ4LjkNNxSFtrXOeuKi20xLeTWkc7vtAkbLX
Lnf4ej23HpN0NqM1BkQs3xbeSpEHta9vXBEyM2Tsy4CUhDr/kNIpZL6eqDDu7XxW
gbD6jqLFaOXfTAg+5+tWyhDp/tP+S5mJ/4rBtyqLdMjiYxCat4f+/PuMhv25sMkX
7Hdb+JpIkLJaoV8nC/GrdBJ4V3Y65eTgbPvScGhyR1aEkukEBFr90af20ZeOLBH9
VfsVe96fj84ljVE+cVB8WrOnzmQ6CjxjlogoMRXfIVAVo2XmudSLzO1AKpQlyroO
ZovIzEIx8jVkoVqQBTKiunqP5ZjxWFGZ4TLgwK01u/yV7PZQRhthCFVLahzt/82Z
ZlFLGyxH/3n5ddjYgFYjopcHn5k6tsDFWy4c+FOWse2PG0scEBfkc1GzSDxVZGSW
g+IvFJKGtXToXYltnV0q3L02pbIt0LPoDZ1elk0zX1Eosr6V9ZPqPGhazHmzPuFq
PtQhcjSG9FHuevA+4XhzQuesYBg4Stkt6obMCliQg89S9v8flt0rcGuy/gcXabfs
ck4JPvz0sYrSzl5CGVN5GvgJHeC9VQ5oUAk3V79t2kDiejA4pOuhOw9l29LLYAxs
+o9TeY9a+rFDYkAIUw2ZD2VmdvTUqmRAsbTxPDhaQ7Y6c/g0ieURpiZWxwI88skB
FQlVmBA2KXwr4/Io9O+XjmjZFfdApu1RRdImecP+8GWQ3bdQDPMmJcR+JoQURvCR
03OAJ7dFI0sP4L7HtzZ9TPvyCKbR6FMuIer4033xEjWt7sQ3MQKJry7kIcmzpuuq
V20CUATBZTN64moudlfMktxDbtv5AC0B5BIUHGqOaE+vzm2JRfEKxVel//V24WeH
qsmyTHtzXXu44W1igG7cAt4/uq1AAOCNw/ure1dIAr7APFYkoSjuQwLFcFGmMnAs
/VSfjQTvZiYm5877aVXRw5OslWNHZQt8ocVtB6jdaHtUWbucDuoKZ+awMY8OlabH
DtxN0zUFkiaiOUxCpNen1R33YmlrFv7DCkh94hfosfYH/2N/0BUNuzbn6iKLHh3K
1asY4pX14SAGyMctiCWo51aDuCh2IFqKrXxie05MH8zR3f3pUqh3LV7iCpJLO34Y
oYpOy/T8ohxHZTXz/YmOqo20gNcSfXtUWRJwIIZKed0EQhQkAbuCxzKlu8uZf/Ib
qdNfQL7SGNGa0w74BdfFJBsUqDGzndfKBcQsnZljUumqLE32cNnk1iU6SEnurJNK
w/tabY7YJR9bJFF7axV0LoY7qe3O5T465sK593TpvbdwPDrJwqnP18bnJsEPjN4V
hJoeGphVxoTk/rnZdf1sBXj6ZZo1kcwPUpZ/MQVVHbsCddKKPjXQGC+LMJJ1zgwl
6Iy1KZBeZlBIcLQwIzfuAlvDCo9bnT53m4c6dX0o7LNcKvpGsJbtvwkMeONmDaYi
GohFtR9uUpiyJQNoErBiKmczOBDx9b7ontzNm+GhDRLw2yjRw5KoIecFo6U9mwCF
pAqyx9ldlFWekZEJyLCXbD3odN/t3Jo1rFsIP7fB+8fo06JmNucLNJVI5bUImDa6
55VoCsvSaaaAYBnCiaFHSf+rSiCuyJT2Pu3OeXJh7Yqu8hssVCzv23LlTvA95oPF
MS1u/+s5QKEAzN1+n19rCz/UqhGJQfUsNhUZC4xOZeuAXfZDyaNX0vsn704AnrHy
cKUmLyPSEMt4gUVUioVtD24bsocdNGbh8e8CuGK3Qfp6bB8sYKhgmXvmvVTumyI5
D15yaERxXb0o/Q4dJqm06WluesYUa+dXdGPH5LEXLuc8qihWcWNkndFkl8KdLGyG
Xk2OTykQxJoDNqN7Pan0DNVcBnwvafjLrn2U7UMFrmv5Urz74XzejOq6kXwCVJJD
NtXuMuN0uTbHUgttyAFjIQ0FW2leQfwO4yNFLlNStgufVrSlXSngDa35w8WB2Ik0
lljDf0Ifi8mKBfJVzb2OYeKAN/FXZeIoYxhbM7+SaqjR9u/hDqL7l7sWd8xtuG+x
kMDN4CN/VQtCn1XCuIb+zUr0NtMHOFkZn0hRdM8yxKsSf/tSC1YSG+fWqGhMpMv8
lc4viRITgQR+nGk4Udwz2wY1c1Oz/w4BEWDyGnqJTIrpE2/e6XOq72VlKT4qNM25
I5GpBM9TePdVb7PNizNqC5sxu22klGPZ35muHgPRmCLjwpQVH7zPZ12Pt45BxPpN
JEf2HGAIpPOuiEmu8seQHbHlnsz1Gu72TqEoRh1vCqkb0GSpor9SSTbWZ3K30gvj
VHiGxSFVmh0sedNp7SY+AWCnEx3n4Tj4H0B6W5v0UXiZooHK+8k2VGNTCCs3MVeh
XfK+xn/3Ua93La1sqnh1v0zdZ1115jwOwUizE9m1ECVXZ6f5ohDaAOSOvWf88aH/
2IrObAdDmDLKSPG2owYEYU/gaKzjSRTbYjY6qXwZdoahZHvhF4tDWIGQCtV9o5is
es2er/tzzX0j+0V2D2jYC0Erbp1k7w4r0lg+tQjZjcJvERszr/HHXRrxgcLxB9Dz
wHO3FETjvZxvpg5VXKWevfCDWjF1vxpRQDF2ObmWEQriYS7Gb7C57LGOGYmUiDuU
6vJ4Btw6RcXNURFXzKrDwBP/kE5ERWd6dCLqQhZVgyfiTMbIBV9YyM00H9YrIA7/
u2mmKT+d37E0k4vL1FAJs0K3JbAg9d4VWevq1UPTmY26X7ATC/wITQTJOEd/c9PE
4ziAt3EEgw1Y9yi0DzSeB6+Y05ic8WqQHpUevGhXDcgFbvm7AJGukHFnnaifarA4
397usHPuctxrjZ2Y1nT2sekju+iJLua5LnAnynTHrUr/HcQvlvtJQSryI/pTzRuQ
q490SS5okL6eSVpa53QIqUp9A5sX/J08zunrK55Mq6bzl8Lo1oNXqKADx7OGid6p
s38hTcUwjeM8HnOirdfGG27oLE5JoXy1K8vk9YNKJ9uHwwcfNxImPR3RN/zwHVZR
YnjJ2Rwq4b7Bj+vI/odn9YIJ1ghGPf9Q5u/XyQrMc394ZypWJfne6QeECb8LQUms
XEAOpU/LlID7vcpGSTJHkL7W5ZIHGzsfihrtT4LLkSx2srBis3iehHPKjwk8M72p
GdrQx5zlkW8q3tSF0AtgO4LvU+g20Ww+gTGIyTAYWZFY5Ir7ayjtAjmsoBgPimEA
Pk16p6zOJBYqaHnMwAtfQHQ9Lhv2Zm/DR3jJ5qqAdrjlTiJx1vCMWd0oAzO/Z1U0
QvlNZ1S/yWE1g/8MDdFDwVDrJPZ3VcDKcz4sO84JCcEYJ6SX6lcbu0ZasPAzeIYT
bQKJzvHKmXTbqf8FJ7PO3j4eHi2uF/tZfSXtDVelfWGmPmIG30ViZ7PejDb9cfU6
sSTW++kfbUwIdezJiQJaYDC4jAkjLEzjkadpeMCkB7ZDv+dBm3T2gG/A200lTYA1
FNgUnYJ0FPb6V598dlcaEEPgUyJG2SOsb1WE/vFK1HL34wRWnn+5GxUdyJoHFHQe
WTjlEoRHJMOMc2fR0S0PGRPyaRq2Uxp8345LrfvgzEa6hul7lzaK2cDeXlFcumL2
h/Q1HuIFgi3++/xElmXUFDGg6/dtc60rXYGEa/SesIKZdVtKzY2v2xg9mliYvlGm
wo3juYbwvqCBgz3pkQcB54HxlMcSX5i7C1Hmh0GpA9X/9PfWLturip8Jnpk32Ogb
Go6fBU3r9oXwKrdSzluqMIFhPtgq28VT+ngzru3ESSeYvPqkNcFivqe8JED4DIDp
JGTzYoDzNVHPBQmbbXvmBD3c0Dv8Tt6SdCheEN2dA/Zb3KoFAhVYsxpvNUgZqU7f
x0RFrLu2TTCiOrty0GPXaAr2ZjzmalEK3H4beUqJASwjaPJq/ZHyd98XwN0uY1VO
N5dqNaNg3eqTpSj3RZgCQCq9wUt2cebeiOYbguRpjChkP6t/gvO/cWUYVzWau43W
w05TnulIuVFaM67qSjpRI8cY3gaAybmRaqeKH/YyMyBi+Ss4eY6xd+xEoJq5OJhK
1gwM4Fq76wrYsk7EgW3JUjFvIiPPW+abcg+zjEdj6LZseku80cihypi+FroxSdjd
Kl0FPm26cqY7qgmRcFLSbVV0FTZKB2dY8QPBndWha4vO/QgHzs6G66PZB5LEFql+
6MXoiueguMrMb/Y7NOfbFQXflNoImeMlHwPaHe58mXu8i7sainIwcR8/w/fFWkU9
xVTWx3GO00bp3ll6eKUnlXFyM6Q0Jem0dXnvDnTIoJQic+dCt3tB9xe1A9UrUhqS
w60tbSaBZne/5c3qXNdd3+wK+JkC6EMxzy3vKLuCPMOSuSnlZnHByLS1OQ52UcKE
oFzq30lMHWOKnlwKxU6M3oLAu3/naa53kPYAkstYBMKslqi5HNaACsdA26lz4GAm
5EqiuncAjKYYt0ZaoT5Iv62Cf9Ffjhj5MjhSyI1BrsPndeOesFucn4lcElp/7AQY
x3K5zrjtWYy/tdJtog+ezKmJVHxEPl0WkVlxvjN/YbC3uiVebWfKwXNfUEv/u7OR
j5k0r9Os+/piqh8pqGDLsTVN9wCiDrogc6eQGY8tuUE8Qt1TjT61AZ4cGpTJXvv+
EOIE0Ez8x+5GWrzNtWBmi+RRMa5qjodx8WD2rcG4UhD9GSYs1ShNXrriyvI3FrQY
3NP5xS8lktCdaH0zb2CcQ25WO+n7u898oaVbHv8j8lh+ECuhs+xcnS7CBfGDe6E6
y9orRP1TDX3wSMc0evrcj3pit/dOBFI0bX4j3hl8OIxTu9dKGvbQUKpVLjRrFnUQ
MLuiRSvliUWf5m14BtCmgdt6SitpTo7NSm9MWm/4a2cPeOMuxdaB9fTQpZ/c0aSG
XDXHBkFKOFoaNDHyb2/Vq5NokSytVH2N8l8gPc+sL7ekcletSp3FFY+T0wNs3PAG
Fn8LLOxR5pvuajBjBzYz7FiU2wP686NT+AR52DvvMGPqj3ZCeNvCKw7zA9i34aJC
9RbR7BToegZVmXIwyMZQcYmnNKh6zitDRe9Ej3pJ+/3M5wjbpsyfPH+FTIbe7/HV
76SmBvaD9+hrRBK/VDuKcebibAqHzwjzJ3zf51s3L+hVMtu2aZpfmo0Zf6pSUXul
KlPvrkSKukY7citnz/xP3XXWz+/EnFQvszot6UlujdGNnJzvxqq4knzMOY4eeryP
KJwgsk90PQlynrXKXoOE+oe2oZRwdVLyhkzujjqbhqd8LK5Dg9OkJbLa2OLgxxwj
swG3oyql0lA895IKP2qzEbiLA2k1VXrqwQY0xt5IZwPw+2nw+lefwX1BWmaMxlAV
L7+5d5I5hrKOlOdsD7CTUoGoWjQN/IMooNe8OPGRbK757/AGEmx6jvm6XMjCoqa7
PlrcqJo5KmABuUhaJbAUJVY+ydYfhk/ZqvEEEEd9+nv3XCFF9vMrTB0VTYgzo3oh
3r9fQ5T8vSRepaOWNNvTNXXRtzB5fM2a/gvBn54ngpJ9NMTND7Cy6guNiyxMmvU3
7HXn32czC6Do0r2kqjtovdHRBdkkhwqPGvivV35FHbOcqEr1zOqFNLQvVL4AH4H3
MovnN/ZW7x+4D8/9YX4Fq8/VzW9GUNtm02XGTR/2CCS0YIidStMbwvUVKjuxfsFo
kCttryWHQQPI2+OalfLbH32wlUSj45nTs+fW6GazFNAz163z8Zrn1pTWc2XFhsWV
t2Bp/XftC0Rn7J4AKqMHQS7VoCak+/aDU+gPetCpQa/Vy/81zsbu56xZUGginDux
3DKdZaQs3HN8ZOtlBPTODCMsegI2Dd213ZnRMwZahrw7MfBafAUDMQhqjMVuS2Xa
sI1EmrM9tELGFcGb1/GTVRUt73yLlnSLz+Xu/3nQgnWyZT10DRu0wAhfWhy6N2hM
zEsgSx25wpIjgVJFxj5nBZ1aCRVHz7rAnJAJm+Vli3xKAKdP8FnUQ63LexYDR+pZ
yKeFZPyECo6rb8sapLEyhsyBzL4f6asSpE2dp8NLjcyVGXXJXc4EvJN0HMiMhS7d
bV268MUxeAsRXDO4OZcEVyXd7ISLrWtWSc7/R3KJjL1Ga8TwOV5eU2DkHgbFoZFg
bJRpLNd69PeyJQvZJ1fVvTRS2TQReHw8OT/R0OYBdE4MqtCOyFYpVB0/4QaqHJ4Q
e1Oo7gZYlYRr7bsjbBb+rzROWTdpC6KyKsbgDM1koOW9At8ULXAdOhjEb2KtYXcx
TKlu+0h7ac/EzLswkma5EOuudEMsOZowhRdPv4ll03L1DxLTC43LHVXv6wJUYLGZ
WvwI2/t1zfKu1+quuNRqP+2GqOOsN8aWBObmMYYM4D/uI8mYNk6MI+xVcWHOtYHq
KDVq/WJ7MuIo3reI1sptkyv/UvgVKOvHnoehozVMpHFCybnWT7+3GtXP4K+ti/SK
svQCTU4JUSWDky0jToI29+bKI/NAAOGDNi+s1wT9D+ZFL0AmdYajq0cOIUSzISl0
l7AwXPEoGCfBrnm8zRMzwNVCiOM+DI3WB4SEX4l+ige45NcIhJMoZuCC6MmUQvwy
6KwKvjxQRiRJ6YoXDyCU12LYqRDwrjZqu4+/pUMgH1gVW4Lrqr/7VyTs4yVDYHYt
bfTLDAFipwr1SUx0Z/YWW5DVfY95bWGe4oAx7DjfDIz9/fWzG5F6KsEbUAR8YSBc
+TcJ465Mr6XIfuYm9oGVjzOnEBcWcsONaHDFa/tFDf9Kod0U40kJpxDvb0RgbsKR
TvMjPgbP4mIdAuWF6KfOG9wKCSuZbBW25KvNoVkrdvuKa/G/7H/MHRkGmF7IEBGB
d2bS4h2R/pKjEy9ZNqszDz5bjNIvEeCU9N2I0btPpgsA0f5R3mdMEIbfgvVc0USy
XpYbrR0eynQV4yu+A4nT7eDp6nk6jJMupAoOHqti0pd38v3pCwpHH8Q/bhanTypP
ihuM3G8mhD1UAKjDwo+v35JspHFQ+HUyzhM60qDtBTepmMrBFr38xVrVTetML06z
/ufs6hL79ZoY7RpSnVZw9xgQm6/ZSbDb3Z9OtWrYBs5St0PlhAEMwElNGREN0A1Q
LMd15QY5Esd6x/iJMlzd6gQo2prAMk0YBvYwuLGpHHzr4tvgEQBv3kGg1+0twjFh
/v2LtGQF4GrLsdd2vEhEB1rmjPKu7FzN8UQ10Y+I+noGcVl05eILIvX8XXkyG4e/
XAzjLFmaaScb1kmv9jCHT9r3qS6SFArBHWCPUYpqYPl6ItYCi7yzR7UskZ2dgXf2
6I10ctd5MPUbonJtEnQzsxgJnUIHmQio+fkIEyYOCdg+ZT8vOK/jq1HDA2UtePK2
buRXfZoYXJUw2p865xFd955JAiniUf53D+KmlIi6UtTiz4Cs204felGROjimI4Wq
GQgGfAVYOwHLvCcdN12vcJaApYKI2UBqrPXKRm2oeIt2obUc8sj+3hAbLC7erLgC
LrELjDGNxuS8Fb8KUlVCgTOJGiuZdbnvtwBcTe/GGjMjUMBj73T2WH1VJk+Qbq8+
Xvt0hcgtx8OV0xghNIZZvAoxfUEqMtK9pcnZAxaNAjYOKr1ISBgCwdydnLCEc6Gm
2osa6IRPyD2Rk68ECf5qfZ66TodL8z2zBIxjBFrUhDoBpYy91IR5uQOqSY8VDqha
JcqniNyw991zD1EBTgHmbaQn/hyIuATWfTRVJQS6ZcYtV4KN0kEtsTyRZSolndly
werswEOJfZRAdin3PEPHihXLWuG76JrJwE8iobF5CouaG/5SDRKHLMJ4VzKdHOvf
XmRe/pQEoInvR7Pe12yHAWFg8UkEPj47JeozNX9YcLob+QI3HC6WYFT/4vabBY1/
Wkx25Ks0Ra/b6dE7l/KxcNB+bmCZWymsjOdGjII2/vX4p/7FRfEzSlJa/YG3TQXf
dHLVdbbu5AxEGaE560raOl5g/SBLaXe2V64iCYcj/NqEwCGqne3TgzhcnHnEgvE4
AC+a/VnIo6ObCYdq0ghb8fVF3bN5gdF3GAwHAQUaBqWx/cB10yVA0l+2MtM+/xLa
54EkRK7jw8D+5HVO1n+HdATpfob0OAMiGKWxu+RiAdAJHuxalS0+0rPnfBD8DoEE
bnR33cKTk/Nd6AHBbVkeGmOzKbCXJZ2vpx6iHUCPbZLRS36EfvQ+y2q7TUdRutOK
rbcGCUPMmCZEFOP6m8lB+xEdYaDquT5yf97XLpW9inkbklKVi69AxDqvxS0JZTKu
0n+yzfX7hD43LhUfW2/r5vZtgrwxx+xWQLGDdjz9S0VoSZtGA9Idu4IVjZa22A90
cnCL/yNwpbeEqtO7zPuiPmJkNHoY08mT7R3q218k7UPCfrlTG2nNbu9SWP9eTKmr
SjBCZ6eWfnb2XLcQjSndrqNqxk1z0pQbihFnkvcYPJhxdQA+/LGdFWwQs7EQiy+8
ckcwdEOoZIJo6uucwrspyxqr+6bwOIbHUchOabcWHTyyC/xGOZfOxjvwQOfU5f6Q
+FJUMO67e+IcFeKWmsL7uIwfWgM8/4VZStyOJrNpLGJ8NPEa0oHUhq+kJIuezz3d
9pGaTFsTPGXlH8ky4tiVmw6zEUZ+6h53DjUNE7WGeLS/KoXsj0X8lAc8AdvpxYK2
cRVCFOGwSUS9Oi8qVamRT6CECd/20Iz5eomWIepl9fHxHR9UGQlOtLQ4AldlzmCw
8hx2sVH/L3vIQdN1BhyugZZvm0cwyXAV1VhMaD+Sq8vRB8PwpqOMsvjWAvFsxS7W
vtZX0HlGqEKznA38kUS6v0M6ze8wIuAQiMw/p11K8AWDeFIBC5qXE9f+z8J1HPhj
28kIXZUcKE6e0Q5pxleNyOn2Ah3l2UWJATPnTWx7/D++d/ghRExuHrAFx9EVAETk
ixfGLxFt+Yf/nCmwrLeJUPdARfddXW6p1D2j89TZFw0qyTq3tfvM+/P9IpVKdJ+q
b8lU7gJUhfuGoieBdGR8kfJsAMs8LoZL6NpduMOyuskce+8V0zh30oMnbLOXjoEy
H+53VzMQZqEUKPgSA630Cpj4doEI9B4U8+FgLcf259qvVHwlXqP95Vuchoovw36J
AfdfB3f9o7Q3obUk88ODBx8eO3+ZOwIe2P95W3FBsvY+seVSVL+JDLpB3Ybh8kpL
nc/ASK+q00+fwwrjvaVwSq0NmSeRIA+yXiV49sHI7QX9px4JPSWO1pxAgSrAsJtd
Ood3vjRhb35SlTyuAZnGCkrVPhu7tHySF0bn51h+lW5VnmRpm8Ky7HCqrBUIwRjX
BHDf8iUTzxUDc1kLdra0dj24qTYDc3czcB7ohDBYtYxhiA0yCw02uyEIqBB5lNxo
JHUoMsniRdor90qqFFFUEYQ2OIsV2n96ZYYCZE1KbAq3W8mHiFJUMaeL0RXTfQAb
iEYATpLnQ2kNqEmaqH5oowSaUg9UbYnIidxxcZjYTje4zXdhrQnpqZqjykVhQlSt
XNZfC60WWKIKNOhkkVl8+Wtje8PNd1twpP8Q9790wKIKtPBpwENt5ogWLI4V7O3K
rJNGMrP11o1pNyJbUSEIWSEo+KqcYQC63jjavW6uxNT+uDSbsYopNDs9h43LQIyG
iRo8W72+XLJVj4nPktDdWlSFEENpxck3aitLUNdeTs8PU2mZvUsPBa+ZIdCkkFE/
6G8Bbb2Lmkj+P/ashfv5p7ZOtS1nWo778azjAmrIYBGU1bnCFFOlDFGU37Z/LNl4
obe/Q/u11Fl4dOGnNRi4heA8zNZXQ9WUs2i3iF9GPtqw1kMnCfV0hbCQJHAjnOi1
fqf/a4Ddivnlp1fP+oj7JyzX6wi35aZA2nBJQTuPH4OZZaNOmK3aEb0Qt68DFSkX
gjEfTc8j9ur/YB3IOKs2ocN2RbqtefDj8waVYqbmSGY+s0lsn7O0H7uwUlKcCAoL
7iTKBcIlzGVZIzdBkbamtEtJtBCPrXYZQQoQWTp4Ro/RDUJHVSTPPpK/04wmzdBv
wl6M3pjWeoIoBgsxvBo8K9HOLT4fmWtkc0/Ewe/QUbh4HCzPd2fybYZIcn5S0Kmp
qV8sUhOkRJKgQFvpXjCioskk96prUYlh9JvZoE9OGnyyHAYwI1yoAEycDzrn7UFt
bm8m5qVBU788Y/UA0VUfzqmz2vnmDSb5YTUpBvlxLXQHQ7u5h51uf97OJVSmSYR7
UJfhru3EDqycau6WCjtMtszprZ3/2S79h4D7Fo+T4YwDuLEZkZKiOD2dyP2m+hvO
V4aIT7qrH/bvhivQp7AxkW5HUfqrLc3j71NJ9N35WpOibTsmPmT1T6GF1ysuqGGJ
ArYXJb+p/JD3YFgs4erBna47bSvEDQVqSaY6/9jRTqXu27wF1NHK1V9eLz54EIzg
I7AVX7wtHHPrAm2O1AgRa9O+zPH+/6AB3phz1GHU/FjycVRuHM3gP5PnU3pNkJWm
0vxMP0HQqHO/1BeRlHP/+3f3tcbxf6lcn3wFJJIOrADR20jkcE1tCVu9Z78iL1tj
2cb5KjnHwMiYrCL83Lg2WEEMGGycxEKOKuQID5fptJTuj1z3UlC5dkTe/L+HC5C+
TYaoxH94f4tk4uAs8cKi1ke+CfHYhBRbEKYYPRACcG+C599ouVG04Zfud2rrWx39
sgxIaOYzxvBIOlMSgNiGXSQsOFxN8gdAeAjiiwmP1RiNXS83PXLenA2XkeVSqq/z
7T43ZNkfw28OtuS9IEocUbZ15cxXrOWtYZWQUT9xw4O28jsMYKojt7LQR5RVRk3/
Vniw/ZP5XQrcKeaOxTgPw+MyPFnD0jfU8IOst5SVWIIe26ggOHy5cQg8WFnJDPHG
3R9tRnZZt297BzkibGId/kkee2EBUxWNOpj02Ibd/ftOsH5ahhdGPSLDBMgEvPH2
u0uSaTUauPZqpp4jUV5BUVm0S9CKdigQVsx/YewWQby2QhQro9lYig5Fl5N8bnvT
y+q2YxojGtG/afGKPEpmzGBlHpHXsK2EnRtZE1+7BTo9/ZXCHKazOoYqM5+eCJbz
zY24sftNT/qx8cqAcsCCW5mEPexp1c7/S88vGyRADr1fWftu7UateBC3t4VSwDn7
1nfATzDLSGpS+eEnOsEYM4T/OYhvnasFDOauwwMZ9qLycCoA+/gl6vQNw2X1U8zG
yOWvK66YcRGINpijbUZWqjWxcdmK3s5xEuTjavOuEuel5xjIovGarGtt+fd5SuaM
4vx31gWY2zxPLz5e08dOQfYFa/vP+17cfA+Coz/sMKCRqhvS/RkkWHGahXKUbizS
u57PN4FvCsCjFlSa3S2e5NB/G8QtoneEt2X3kw7yc2myq+kvta5/A+ZzA/O6Y26Z
aaVWIDk39KLPlpBVmHi4cpYjfkdZ5NHNnaKdObklrzCGzW+fC6f2xdOLCoVHJQUb
T8uJihHPH8D7D5K8gHEMklMdS7tdo6JP0URPP+sMq/1juLYZRpapG6rHQCtEFxq+
PBMOCuGI6gctNL7Bv0BCtHXvYdYJj3Fpi/cxX99WoEeFjvFQCJjlWYCtsEFWB8DV
7YYhxV6CRELMk3XkOjTxtcp/kf1avpoOBW/gllKLii5LfBAsdLXZFuvOO8xX6b47
ybHlvEBSKZmn7FvRkw3S/5Ae9caIHfREWkKNTCwyuBohxvXDz+Gat68zjozSNVmX
EAAQbuKpaPGD7JOyalQofey1QdWPeUs7yHzzcyRLyFX5/kvRffmIJl+/NCSTzknM
YSIPnigU3ixSAinTdiMZIVqOQLzACXe7diU5UXR8SIIz744BOKZc+cJd2B3R303m
tAsQ0itUtV2HYvGWWX4TGa48vmVKk8vMFmUQrt2/46KKHmXId+CPYkdtcJ5LOaqh
MPX5xfb8VGNQXh4XYxWtrfQDokcWeNO0AFIhtNY9IhwCyd/OESsE4Bm/4Y0cMO2Z
jgm/d9C3RmLg4UZiyR/jL7ueW15UWxO+X+HM7o+uqIOmeM3CrhlZE/35wivw/gbB
Ca277AvtzI3KJM4UlAJ/gvui6hygrch7ATbzf+wOAiJH7f55WdStowSfJfzugUWG
WRvSBeZZeFs/toSZf4C9k/LDijdyCNKYn7c9+C7HAyINwFVa4L8Zd5dUQletL0fe
QOZL8W+T1e0Rky+cac1JWYOJ17JgCurTY8y12VPOeEbTj2ENEXac0rcB6qnH3PJr
0MG2fe7mCJhUqirIBJSBs5QNIZpKvnz1yH1aYkdNS4J7wQQ/h1zLxkBLjBhlgbaw
5pk/CzJ6gUq7pWdOrat1jbhJ3iajR+jk0hYPA1Q2izgma5Hw5Na2URA6LUQIQWqm
SCm1oD14kRxL8cBZumA2KYXdcxyzCwJ1rewasvNTTqHz0oJRnziowF0pDGXeKdef
1PjmsAWzvB+N1uA/4K9KJTv1WjQLVJ7q/gcx0s6XzVgT6vwysRIRRVi2TPlChnSK
ndpnRCvlLzdbsWz1TvZA07YmwtT4WrM06TBMCPaJEz5ds1hJp8xYObl+qOW7FEu6
Ovva1hSf9JLmexQAYsYvj90vNs7Vkj4jmBLWEvNCZF5jvNxDXPYTCllDI9snxTeQ
OHm8AgXVHqF9Dg21k1/5GMcMYHPIvx17odIUDdYmSZivUpIALcv2KicdOTtMdC+r
HVXLBa5riyh1xHQyjA9+XQfkzGYcsFXzdZ8nkZwxGkvPUAPXc1YTA5Wea6082u0W
0Szj63m9CVfW0Z+8NZhgqMspUCMVGJdT7bHnC7kgMBgopE+e4PmppOGSyCWR/kow
clHPRJeYRB9Y8Rf4IF7MIhafkVYTfV2q4t+HAXvjGIxCnvvbXUAvU/B2nKGBrjVR
FgSr/pJM9jLOTJgWo/9a2BQ+AeKWbR8JVCnJA8DbWV2MmVa9XNRr1taN3I0xCBdv
1jyrOZ7qFMcTFYlpUy9xK1C4RR0MulF/hL0UF7HASMkk4dFW3FpNns1tOMWUXpji
dAYXLTluViXCUpd2RnEmogk8+tE9sjPduucWq39kUL2R8kuGOnSY8NHUqbpr0GJK
ly4OICnM5jOv4KD/4jC5SoXjttjyzGSG3IQaB2ytMMUnqoilHk0mzzxudK1JNSIa
x1RCkJ9zE+yC+R1cIAaWKtmDKjR5QzV4t2uGO7wSi7ZU+rBL3XFj2ErRXPApg6b8
3ms/KIts+NTWSLIHeJrbAJ5kbwh069LgO6ZBGBHRe+9i3xy1F/dJysJgwK/7cPDO
ZaAWMxpQlNiLWGFLbVMXvMJMGxKw68vAhAhcTEKlfmIMnBCFa0fhtU981L3xc0Pj
YpjMHhRqhf9lmit+CW6AAXXLEUwLlHLO2uzLP60sQtWc+Ln+gUurVfxtop71ipsb
OFLZFy8WlTxjFvTIyx2JQ7iEyi5ScjiUF4nFSg20urhO9ujEWW210HZLGXsZYmbF
rCB9BqwpPcmTXibW32sp/8C2GcjHybA1uapkhORMjE5IOh0GpR7NF9Ifq+xVy9li
WwMgQq+FGLAKLiJnF+zHyBx5dDqydn7vkIn9kyqeGc5H4KjMJ0XjCqKxD+4P15c2
sJGG93H57oKZxZKJlUKsBTT0djGkik9PwawpXJckrmxy1FaDS+Ayh9imD2kdXWoP
xhXZgYG4p2NDP/9sFkYfD+auRi9Z9TD9v6mEqrd2bK7MFXYxygPx+DPy2uVNhlYi
/BRG48LlqIPSlpwb5jAy50GjbKUykQ7kcDwCDNMaChfoBLey+NmiHT72/UXf9D40
W0MpJ3kek5KtB2bt5gH3CA==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
WAVskPrdMkmDmZ6QRWW/2hSINLaJLIzmGcHM+bhSwS8AJdU5+LobIlYW2lmCAbYC
ikO7iK3vz8kXqzZFZTk7IFbWLHgBAijfop4XmYQozgyuoMc1oyDgkVY1LdUJ3Z+I
t6s/PsnLU+SqWjSTiX+198kSRDuuPRwgbmh0DvES4QI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11843     )
q3oqibM1TvXWcyu/EWmrzhsykLmToDr3ykt15R0ywsR1nL2QlsUuExDj6W1rJy+z
lfb0E+AQrw6xmuchZ9isDdf2RghV/ANs9L9IFe62u19Z/QYWWOr3eUZWXP3USM0e
`pragma protect end_protected
