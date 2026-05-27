
`ifndef GUARD_SVT_SPI_FLASH_STM_TOP_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_STM_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP STM top register class.
 */
class svt_spi_flash_stm_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Status Register. */

  /** Used for enabling the function of Write Protect Pin (W#).*/
  bit status_write_disable = 1'b0;

  /**  
   * Defines memory to be software protected against PROGRAM operations. When one or <br/>
   * more block protect bits is set to 1, a designated memory <br/>
   * area is protected from PROGRAM operations.
   */
  bit [1:0] block_protect = 2'b0;

  /**  
   * Write Enable Latch indicates if the device is Write Enabled. <br/> 
   * This bit defaults to ‘0’ (disabled) on power-up. <br/>
   * 1 : Write Enabled   <br/>
   * 0 : Write Disabled
   */
  bit write_enable_latch = 1'b0;

  /**  
   * Indicates the ready status of device to perform a memory access. <br/>
   * This bit is set to ‘1’ by the device while a STORE or Software RECALL cycle is in progress.
   */
  bit write_in_progress = 1'b0;  

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
  `svt_vmm_data_new(svt_spi_flash_stm_top_register)
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
  extern function new(string name = "svt_spi_flash_stm_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_stm_top_register)
  `svt_data_member_end(svt_spi_flash_stm_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_stm_top_register.
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
  `vmm_typename(svt_spi_flash_stm_top_register)
  `vmm_class_factory(svt_spi_flash_stm_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_stm_status_register();

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_stm_status_register( bit [7:0] reg_val);
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
AX+3YU8YG1Hu1G8bvDZ/wCvZR0vFkEmNwjBJNL1Nl/EqwEN9vm3bJoVpREOns42E
nziERtyq6IS0LiuyE4NrTpJ5c8rcL+Phw6AO68zc3Xhy2KpL2rfc97kUOWrNtJVi
raynzgVGZui31NTS76VjcWTDIbLHTQxjCdLQynUypUU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 614       )
p2QjJHgdWp361h01MHQc1Q2HOQ8eSn5//beefmedhD4HXGcORgjU6y0OTjZ9LrBd
KyUJCz4dgxrIFaTAWZcsJ/SCp9okH1TtAJ07FRWs6QnjsGQO2AZyfd/77eCcz30T
GkxIcYY/Zxy3xernvKGdaHCZ2lOzWuFtUaiV53N88d0hMli8C1fdOoalnwUU0PXP
6uxot5iOAu2JvSOZlYNt6qVGIV5YMmqqOxel9GDIQFUkhqWcMm+UspaUF33x0+pn
PmPKLfaOp6wlSOZgQXhsSGMv4HgcatiAkqaHNcoWnn76BV5mXCwRLjYwgigWE03A
FcuOomw0hli87x1nnJ848OeLUHtRErPS3+7VJ8rsjlLhP0eCL8DwKtPFTAMgWrT0
JdTfxtFYGFj923WxDSPc3U/3MgJmrT0kN+ZLe0LEtJm5Z1xjuj3nFOANYDD/rEI5
o9l/uYPXorYUZXAB9K4hIjiqfjrwDT5s8gqwT6UjNqV7aERc7iCwDIL/qVaA9PiM
8idpDv1lB3cGImfAQeWN22T5k6KiQYUaQaksfRjoZXtzbKCXysXvUKw2X6+jRPkb
oWAa2cAu6JI6OZ3eZGWt9t8gF7lmyfH0+s9Pi9fDSvq5i91tyI5EhxMllTfocG3z
qbXm+UDfxQkduh3zt/fqM7Q4gNvlgZ4m+pgwgwfNNBM1nFEYhFiehNUVZRmUEOSi
o4epGCF/A9SYNgMHZCakojoSHEg3flB5sDa/N1Zf56OVC2x0/vUXmuNZ7FisJGcD
moQ6fBh6uPCF8wHgC6sjwROgVPEEDQ34ws1ToGbBQmnUz0+eUiJEWWvlHhbMrfJ6
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
j9ODjgBlosKN0sC8maIV3+25eIXrvnCt9d1/DnnKdkskayiPMis2YhkDtrh/jn+h
qWbFbjiCOb4oiwBwcwv+BqguN5NsQLgem0VOWVmxIgo+bENVFu3JCnsN1JH0lelS
97Gx7TmH/G/NNVvH8IGNG70go8uuOSTW0k0JEKgs0B8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11336     )
vecXIwPoj34oGV+GLHV3c74iqLGXBbcIProJIWo+SU4A4n+bKsyd+Ywz9eFJJSFp
+Bir2OgxBWuoiuwb5xRxuYEgfyzs01uazgwQmYWJc0qIsPX3NFjOcb8+cWpp6Yb+
cJhzrm6zISE/DmSGlgpiCzcoelIeuJTn1zMexJa5MZFVHQAAEzac25NTz6KFbbyi
vRWWQtYz27NnMwLJUrD4dgMLrq/JQu61n9Ryladt1wgdB87KmSC6iLEEyqwBLvvT
VOofTbQhmea6LF6b3QbuyNYBPsQRh2Cm0mRooR5rZnbfkafzmG/kRN/j1xdHNiqf
CkkkKA+ouaY/FqPuVl1oT4oZrq3JNIVz/YltEZK+Lmz408NsBa4iupHWPNViC/nk
u+aB3m4usimBaWjoh6zHEuDyntMJh5ItEy7tOj1vNXBvmmWXcWO150GIdMhm5a1x
n7JZlNCUmKO6ItVsP/QMrXiAcKUcSv1wJaZaRnlVWIRun+V4LBXOLVQH28DhcDLK
hrBTNLx1qu5Vf4iOCltfpqeCnzRkB+NkBBQnomjY0/RMWOpAZRCZ+EXd7BazhJw7
GWyDiWbTzPGkuXf3701sFNGLv7uZCN9XylpsgU/FqnrsXTNWcdXSKZw9jy7R1oZ+
AsGMVsilXsucUZ1lJykLxNtA/xoXUMJD59GI/ariH0SKGpnfcFygsGnxIFrxoabF
C3H+RCCLRIB7sSxQdGz2KsUv09hpk4ktM5gdvAkwFRAgiHCrLH0AgRgnbqc0xoWx
ozFjZbfQkiwp3ulMEdNQoDqqodUgnklE52f1L3n/xRmn/86+eiK6Cz1ZqH2/OHG7
CUO2txzMIwNKBXa/yo+T621fvzOVKK1NmTxU6jTZsoUkU36ecFZ25ZcWzyczy2R5
BhTI7mQO08fUia+L8FEfon+XskNR8VCBdLbF6JTLwnbfGusU4YOic5xSLv24PtVt
X/a5Kx2hY4n/rzhZywv9euHR1GwbQ0sNI3Db1T7MoHQDZhG7eK97Iah6oj8o1jgv
/QeTp2F7fQwzoyPPGOcWw3HX0K/7M9hZObpxHwwZthGFAAPl3wTaBY3tlkLIMMt+
G7EJbDBNzCtgIOZ2w0kWB9g7foddXQiyI/yDASb0pZ1g5/Cri9kgwgcg0xKJwZp6
x2Bv0ZyIqcGFd1L/iGe1QkcUQihKxAZX4Ag4s6rIOYgEBVvM3/Vw1YVA1hAhbxgS
epNbuzdeIyHmieJpQPEnwlmBjHFfVIhuGnwGm3u2NrWInUydLczwDWuDkh+Xf8sC
ZnvhXv8g4dNfmAf4okp+4kZxhgt2P0sEndjxjpVzdKCjKtLl8gvCPHCBwBtx8sEo
xcYDJ7dN9ovoVkp3TpHwbkYXo434TCB6kp6B44NLHtgeACI+OUeUTRp1HNaNRsoz
VXhlJrAL7UonZB5tU4LRG1rg9rfTH8HKxEcwUO0ZcBKpLJGTPMmlptT9GlQPW2tM
tmf6K18eBJJhXeaQrqFcvsJ8v0dlgHKheAaYVPnuTz8eOH14NmE/Key8cpBDhBlX
Vt5aGMK/2ZOGUdmHPqcNQXn3bH/NuuH/DY9UBYIR62ECWrH8XUi1rZT0GJa4H/Of
e+TOFO5SHdPPqwShFAQOb7IfWlwCYSZE9t/xGsDyhuDi6nD30XM6psT6OElZm8HG
0f+DVtKFj8LuaoSbCOVXNS3v0kVgPJe/loC4ahroT+mqAgPHQK1eLbDuVQ/MDG7d
kmjF+tbSJ3DB0ewC51Ls6VEODntSwzDC8bW5w5Dd3LKTbU7RxcCAAj2CavE9SMul
Q9PLbzWXuk5VSxAWA1LAEzBL/QvAL54+g2YJezGlcBWB+C42Yqn4wZ96bxkrpZmT
HuFiX19I2hFCAgUp58FP44aPdLSLIoScyAOwrzVfHAB6LmboGr0gGc/IZzoQnBsW
iKV3RbcRRf2sXaE16qjLm1YnrFBbjVww+pCpDhE2+rhtGaV7atSQczEd1B4/itvC
w5qGYQ0PyDobne8qkjUYMzyETJ7JHm1jVKmyb0umtllsLId9rQMwRZvvmKguvL1G
JeYnnfxyGOCYgLpJgVFmo/0bKd8ESbl4UF/On92BhWGdRcQ9AzrjFZ02CXpjv3I2
vCy7mZTE1Ast7kTZzDj94NkOMqsJS5SCBwn25pAauDYLhifGGKYhenevL7Pg8LFq
Nh+yN+/MjFWeffuKYFbVeKN9jYz/zt6MWkSWEtEvsxL1RpUdXHqlAb9wGrkF26Td
EtwX4DJYgYkJhVHsZMIzkzS3PvaZcAoHA5qyqpWHEPA1to26Cf4LgZleoBMwO2ga
d63zE9zSvVzWnvJs1b97q+2OovXETQwNl/eIFgItpn2iDm8a3uEBoufrmu5VBP8v
6s1wRFTFOUK7qTNLY7HmB3+7XIqKxSW39278Rmc8vwNh3XP9PVOV70JF+t10Z3AR
ZteDFQ5KVzpwuFquSyCQBgI9DZxkeu52ATQTuwIqTwgLwnrHGWesOMlIakKEvmML
rzfZPuhQ6aNeOt+Y22YMM+vk9mklyk0vAl22TbQlmaszHhk4VfbvtoEcU3uXnIti
tcF99L+QYamqjxmCVHmbfPUZ0taCMQCU77d++0F052DVr+3h66UdBX2kTlO4h10A
Br+phgsuH289nm12LWTCRtibrpEj4edBZI3HCgxHLD7Rx3OiRFVlRVpwaJwm6c4g
PX+mhJv/ocESWv2WEdXzmYEgSTvcwUlw/0RayymqD6ugw5Q/MQFKYi2jYPnxQ2cY
A4IeLVcOZ7WuVM/0Aw5drkQb12dMiV18lhgat6tpURfs0oP+FG31ayRr8fnXd3nt
uWVE9TOVZ1bBKY6WpozqsapydYeOergUKi8YySmzmyTaDEblY1a958EWD72mRHyz
xp7NYss+jjg6Z5vjK3yuAYxOiyIZTdGCsW43WR78W0soO7yfd4cwsxHZjL0fFPyf
OtogFh+81k7aZHQf3fEi4krm3Pph9gv8tXQSLw5rA/QyUGflVUl+EsNsKOVuvy1B
ujpfZAtfalTog6MzWoRTEnur2gG2VGaeokLYCkMLBVXXMpCTOJzf6beJyxZ580uB
aUoPotDf6Xxnm5LgmMurYlOzW8ylCVgiHmIUf4AulSEl4BxsWVBjtuyXAlRn7F63
Rom7XTVnsb2R/MkgvGMQSq+0oNoikkWGxyJbSW6WMUcxNCckGHEkpCnlibL+1xfJ
enT0YA+3LUINj3BUqB+xQWpegGkYtzcgV1ftdAARc1qigfbKHZp9s+FFFLuaEtbk
0EFugTK6GsNTdoHnXppuPPI/XZ96wUzMy02nTn91Ww/vSQC8BwFg9XzsvKj2moQo
qhE7lA3MKI/IKSn2KtbDysjZhVdS3jiUOB+Te0QAIBI90yEuFk0kxReXpTtjlmxk
rtzybFCKjCdh1abiVcCPdJEMy4VBUQNdQgTVd/NFzIpusmCxCZWUI7guBe+mKFdt
vqwC/W2F2LJmQh4cdB57Wtn3GirL4ukQPzeO1NXVSC1XOimbZVhoKw8pvzy7UZ/q
DahqMpxuKJG+dKfhr0IJnkWFeLgjbqTFTDLJLAebvYtGym3jHrl95v+RlBHngEIT
Mo6lU5+rEVzNzSJ5s0wciI25DDPmHp44Gpxth6N4fz9tJfZQSzwmcWhudyEyDzxa
Pysdq0aZYqb0ABUzyl0Rq619bYQIkRylQ3xD6QuqVmHDpAQuAgocwJPa8O0M8lQG
o8tz7VoVqP8AFzJQGpVmQ8DLkKHEXBWeQ8jd2P8VpebmOqCEr+iWpHMtf0arFQZt
NATkbFGjQccwC7mQHl6Ge94tQ+mk5iEbbKIZ+9QwTsGJ2GrAlqbHwuyhSRwa4KHf
PV1MNgUfX8Clzn3Z+vaZ1W2AzrOvaGxWx6H8mX3gDU1gWd0prsla8F5kYeyhZbeF
YK5JaUQ1y9jIal1MrPvxRFuZCnbWe+DJ79jYIPWxFxiVbd7zMQ2S+dY0hpwXggWX
whpwMIZ09ouNGCXhKiVXvdh1l+Q3EH3ak+BBQaESvVaj8H3xKjmPvvbVcHs/sPDi
5qS8l4B82NBvXWWpHFBwqtU6GbJr090Sh+Ql24iH/Hpdg5SCZX98IidwdfAqzLtK
gIPnEIWlw4757kkcl9fhx+q3Mh/7rpCCwZR383i+o1J7S9w4crRWK9spwUQZYXd4
4Mtawe1SwUEooB1uzroGbPBDJZu2OFFlvZrDs732ql4e9xy8gB9JCc26l9bbkOuV
bRYmEle7CwRi8Lxl53UkyuekxC76+2MTjmRNf6ikuTTTfA0mJqM5Grnf8QCnVatg
onch1UqusI9C7dj2W+27U8neHaFWH8pg2SU10fcumhXM73Ftn0tZ+ZotfBJnIcb9
9Gv2HYrSRi4+2tAI7RFc5m6tHJcz0QS4zUb24JnKHMtWSNbO12Pc+KTc4QmO740Z
YvHGxYXaoza6WqZ2PG1frhpZnP0A5m9RiErcM8ZZQPUp3Gs0KPwtii2XdGoprjJy
bk536cPU9hAwpK3sRr0IyOuzsRlGhO7uk4A35uv7JMMFGQT2dIQHImwfl1q3EvgB
lh4kMp5ySoNkkffBIHeoWAI5HljTJi+IRpH0lup8XOCB9YnK+WCgQ4IlYcsE4j6J
/sQoG6uCNXiqIEUo6zYjildVaBHuM2LQbN8vXe6rRrMOJeh+Bga1dtr6QUA//79k
+sLIVb/3e9yx5yAK7dPJH9rxeGWsqJ6DLg8XR9Gav6C3u7GvhRbYu79zsVB3czIm
qGfFJVgj36SsWMpCKUi546X1czp88PeFoDAS2NAspJHMZse8tN5L/N0L7EUYHkdI
23lI7lsYw8pO/BhRIqH0Hgtgc49F85DS25QH+o4bV925BTb6ujEdbjVYabe6RuuM
1O4bT2hn9EYqBMS9KyeyaI7knVWh/PCzhPYhk1U6e7T7HiyQF7j1kfZvuQG9ozoE
tuP6Q9SyZjqsPyVwJUCXCynz14oodOdWsBzuxnTlgLgYvEk4romfG0Fz1JJp6F6n
C5NP5ecxkhkMEppbv+eV1Gmz2MvNjQlMo3AMi1iAtgYQo/Z0sFGv3kKqPHQB7J3i
ZOZjFZVPzC69i6K/o6buM/gW3D8G0UcPAW6MIGgoZ+kTcJ+zff/sh62gxPGeeB74
HEEHIMKTgOO/gVT4WWVlGn1OrmxZUxv3vgqfOrJV7p3z+g4bTdcZJKL8sPfEy3E6
xmzpODb3Fo3pmrxVzihfZJ3FJ3gQ/dEO5KYoBaU6DKYIoUVM1Je4kqr2hUDrNCCN
LNu3RqqYSk0As5aYKcDmcX0LlTrTLpGnFF8TjOsLWL9sp+21L1SwR1cwO1JkQiPc
8MBmiS9TPQQIr+bnC0bSLHRdjZGcKhbPTWRGxAdnVuPcDYoRciCMq7uQbGQhhfRG
6mnYnFASAsQo5PEjBVURtDKOuLmgz0OAIxbIa1P+Zd2nJd8iw0Bm887tVjuZe5n1
QWwKIjVfSl1/mEXVnE5yKCvVHthgOhQNWo7jtwmnsw2FPMTnl7EyKZ+L/b606qKK
dZW6tWgSw/Ak8Ur5d3pWULSFIkWWD2GYJBPZw7cVQivG32uzj6DkQGR1RQFiv7VA
M11cUtvXDmxdVog0gjfr9SrpNQeTVrmiGWY7vmXhZb0/dckCQ40XbPMiUMPDUag6
eOPXmRze9zppQdOnpu0JATYNt9ofv8cmpwW66v2Cj75opxWUyBBmpSiALo6cY1kO
XLgCRhWYmYmA8PcqvQ+O9dGTtnABXpktsZHhpfz2V8m76juLIDlWrv7twGfyo3Go
HnaO6NKVt7+/10K6KWxKDALnFQHqISDnazZn/6CvOSK+iYOoK3KGKRZzrVGVYfPe
FpSqqn0YAxlTB6t34atnnjpTdtjp47xfaHQcIuuLlS1ZIRtXu9znBpiD0o8FkQUi
Het/ZZMcnL4dhJB7eJ9JWKG8Ezv4PGZeRxPv4avR7FZx5s+YPbraodilx59pz/XV
u4QLfT4pUDrw/mxoX1j7aJAaf3ln3A4xbKOfh6+j/cuiPMnZqBsGSFTd8SDFulLA
q4GOCB2yyUxxob2FCELmzwECFmQSXJ7BMVSmjVJ0U/mBZJyXRKUZ+6ptSpQIakgM
foue50Mzgs8/1OyNkq6P+F0Z4zFrs/NdWsjhVbdRfIuQ3A+Vr7xyeD5EMXKV8Kvk
GPHt83+itIqEJjyeh/G6DmzZgB+M7enzYON23YjEZJnrJsT2f7URzECePXf32Yj1
hxLfgLIIq6E+dUR8fPB/ZOcnuNuCFbA6SFDS++GpBK2/K2p/UCY4dqojlgalEWhj
MhtYnkwTFnlHvF22VQfoAO9HQ56vXFkADX7TDVHiaH0UR/Ai1x3Y7FC0oz+Qkeh+
H9MLhNLL+hx0VPTjGOR2npRist1a0lBIhHXGPozJ/4mikCf0jdjRDRFg0o4PwE2e
y7FdnCX2sXirU0tXV6/OX71hee3VMd7+WxpirJukjsmzVUOzILRg2s2vFqnmMTAP
gmU8cMAt5lhP6R4wr5NwQ0E5jk90K6t4CpOyOFLTvuAiU+EA+Wb/kWwaWoWuxesB
zsH9XlPJDLHkeU6+ct4pZ+vrb/kY5A/Zhi5XwuSz9qgPZ92qgV3aZvhQxUQN7GrP
v/2V5MAcsgLaGf7S6jsd7Sv27whWYl+f+YWbiiNV7KWGzgu2+s0ZMLBRpoYzsWnz
GvN4MaIJPK2XETMM+mPi2BFJE+OQVOdMRl0nkRPO+0pt/E0+R5PqY5QzJxT6u/0F
fSmkoieoFgIhRp75eRT7XhhUQixmNYCrB6mpqQAMQDasv5bbO0cmXH71OzTJ/HIT
Pn7tjrX5iow8JMjxTJnYGFpXT1H+lM5yYKZFjjSUtUHzm0Y1BdbocfU5K9oYL7B0
d+Mi7zbWFKDLyetwcvDrmRnNSwRmsy/xXZgk69nuYuBHG/sI50+fBiRDp6r9peew
VXEpvo9CyoHMEygUvLJluhRPFIISSNYJmQK1PRq1/xsPwLZl6sLlbLfvrGg/UFyv
Kh0t5gfbm7rKv667THD1dzLaTLW61wgHzARtg/BwiaFF2e1C2b94MfvDVLpTHRp9
UQqpg3CI2DZpKgLL9xBBzkNBiUU66EUQ278PbhdzlBcKKMOTkUNgBqSLb9mrUyYX
rbQbYQq2kKb/Mu0rBlIMFvi+Zc6qKr6mMZOa3GxjhyroGBB8sJ0Mjrs8x0+jvSec
IaeLOQrnXBCyqgSmRn8uHyXTVfrxq629TA/TCpZ/7P0j8lVGjzlF76Ku2E+Daqwz
y3CcXTRQAuXMh1n2iCKardrpLx8mVEgcwt8FyQ6qAeVuXFje/hWU2IpsqKtQHi/1
T7OarufJpmboyqpP9+JHbP+Xp8MW77M28Qxx1k+HGFFNQfAXo22vk3waWdTW1REp
RjQC+o0iWJlyNx0xrE40tppZEBI9eaavQBv2W3Z01OAIXOgPDUqjO3vG8qtIHJYP
RwU6Vp/ta5kAymx7iGL9sN3agz9EsiOz6S4qs9Ny3HzkWufF6M1nbFJyG02Obeqo
97qaxzgAPagWN/+fHOGAKx5g9o2vtEzoKU8ZOrUQPJFurnUFbhEmHd7wos0h90Gi
sZLzPYMhQLHngaVTNpX2UckMWPFqGuS10ID3DxsBLUgPch2ohRVnTep2mRZ1tyCv
QdVaNW70dOSqjU5K6QHlQaS6r14s090BH24tquziOCw5Mc8N4rxp18hudWHmKvHm
vkK2nf/yGaFZEoc7s91uXJMQD8a1hyMcPSLoSc2zAZzq867tJ1cVKrND+yjdGOyz
CKol+bQq7iIsLTUEwZCmNolUaXu+S5TpS/iV6t6ndcARoUW8o6gZMQtdFW+ssJ8D
8juAU8gi/QT0xoUKd9biwG17+DDD1sw1XyDWJoh6p1cuHh2qcFhf0ezjoUYPE2Pc
xISCDvPHAztiRtPqkrL8jNTZvpXfuupYesbRP7aWvUdMx9mXdOD644pRbZWA5im9
u+k6MN6gYDV1hrJ55wyQ9WPW/P/EBKriAAxnlozRHr0sKHX5KQL7L9LKGJtluqFn
MNjytRYl23nuXuwvD/hc0PnDqwZHNyySlYNiQdFs4RgVTdQ+LvuA8KUkykbfaY6d
sKCPH9ZMQDO62ALzj8fi9Z9xXEsV/aZBHWfe5g1F7CPa3OL1WyPQuTqZ89QSZpv2
Cmjs4ZgAuMeeoT676y1zvrG7qeI03bqwjncU+jDSCRQFgCvXIwJVYEZ5TdW7QABA
RmLtoqMlKFYw+JDHeW/ewPjSdGlrvAZsEWPXpihHSyxWdY5T0DMKmJ8NiCAn+YJs
z17iQO4hZtUnXtH6/7pg/oKSTczZWo6Pnl+Bi3kPLUHICxDOnB6Q7awEd39oixGw
xQ6N7rA/nOjCozPhx2LOEwCLDzsth1h5a63wHHedxQvizCsjieaT+K1QwU1Jq+HY
MJyFTP0V6hLqQgo/F+9fRmujQByDMoUkhtaxZrnAR2LQZ0jXYex4BxXhzIJpjLby
Y/uKqpcCFlFGIcoW9YeYnRTI8pzJr/wgTlOzxXb5w4N8Zfn1CGEEe+XSYt7wUK3x
QtTS5I0DCxfsS/5IIf8+rsykEA3ZgjId+d+Lt0+vFv9HcdrIyiXTvWTwczIkL6Ha
wiZwQd/fWS22oBfhYVr8RJtb79fyImq/F/38kwpXe+O4VCwzyEXJZ74Lli+XNFGF
KiGkbSDsLfSvFV7XGMNGSmaC9VwSa5mxJJiVX24Zy+Vl3/5qpNCkSFEtdlSveQB3
06WscWD0SCRHkjVaqLZ1lt993/OmLkZP52kl6LOkrYKsb9BPQtAW1Ivyf2BnbxU9
0ZjjxEYOq9JdJxr9Co7gd597+LrpGMq8WfdpEc8g1yvmYU5Lvth7rLaSPieCfQjT
FTxae9FoHCZz11ylaDVJ20ZB1YXLa5x5N4nBL38uHEE83dacPkpCnm2gjYuveXQX
jSyy5e8hOveF7yFdzOW6EUARFnUChVbna5b48kaFWe0lmtUZ7oYnksdwFpAZZNPF
7KrHc6X10ncNV15gtrXA8JazuqDCCso8MLTPDz+cEPk0WtzVWN2P/ivtAMDZt+l5
M77qU2SKAcEL90VkF0ELcRckSZJlEirH6pO1LFO7QIpibbInJnTQDBQ6bPJPGX+I
yEDqhB3s89igzgEKLL8j6Py6N0xdxudCfOkCW4u4No1iC81e7mRcclRJEGnc2AfG
kc8K7mH5B2k+RjgNppVNT+03r66HjBUUQ6Olbo0iGy/YBJC0n6+QGvIQi2iGak6S
sCw0IMr1GEE1SCTmQn8UohYhEvIjDDz50sFGuyc0Q5gn5RdmEsjGOa6O2vo+Q66r
uWXrjN9EeT7NEDgpXU7drqcSNhzGqRtMkRw70hidqsGJaeHwNP0cmqeY3O2itxfZ
/1xiRum+Prq6epW6VFR/hkGIhn0ztl/eBt7e6MEMDyBfIQbiqhScI0WpV4RBFx7v
JrB2Sz5hhkUleljMLNhmZgN6EZgpgqlQmG+eS8xg2HDDHwBhMq+rzgIPjPig6KRd
4BpJZlFQhowrQnma93R3WBSFJ56AarI+arDTZQtXJGEV8eREYSYc3XRut70/Cjsp
sdeW3fA+rUA7W+CUdRnlTiXZQwmyNTnUkxorLABkZM2dlrfTmRYfuurZEfjtM0+E
rAsJChRzHbV7B3v/gUFCQLPdS6VP6U07bVHOyWdaIQ0SSh5XQ0AJUYZi3B0zqpqf
YP9DTx35LMJEbwwmHgzfiItb9X3XlR5FTfDcvhNrFkzLXLbWREEIpLbqWhYaSHX8
ppTzvapst8Mq9H932jv1UCVrxYRjcislTzidjskYNMDGR4obYJjsS3DiHPq7hCdn
w2yGOEnx616YCEiM78DjEDzBegFBeCAHCA/yj67Qe/U1g2KxM8hdia/ijiQBXCkl
vfEVnsdL2NRRfLRalKlSbDd00fKmmyogK5/TqvAtLI0vD0ocUVS3+25lrAECzGNL
wB/c1attJ4LufsGfnIvKz+oFImaO32hPE0Sfwd/EPi6anLCQ1DS2xUUuuZPeUWOc
cXwiHVpeEpKQgGpRbpOqIa2SbtB1rid4w55+lSUqiaSsRjyp++iJW7I5s+WOLq93
iySW8tJFZmWu7uRYr71oTl6ZLpRHOibSiGmGOzJxwoGiR41STjqNWRAfuP2AYjVG
CbBQSbVOpUDPjV7XC1lDFMUx7aYjVGgqyF90fPfioooxl5mc3rtHXUOVt3+uRazp
drXsAX7x7uerW+MYTkyQjuX5NbQuKwAVBWUeDZRPKamJiUk5yXe4A0CqNoiYFwHa
qZoohZ9Wq3+z0VBpAJSKRPEH51ghmI/LqkcOpPfl+EuKVieMfBIWkCJOXc+EvFm0
JGo1+ipn4a+/vAjt5L+yS6qxsUw07QI0jRNTv2DvLBFI3mP0LvT7OpWCvhVBfysq
A14Y8/xmvIQGBKzbjHcI3SIzReWRV0eZScx67f9+E0vPf8I5YX+VP7PVMK6i0wHp
3B5JQKfoVEpEtSiLL/ekHtFHks8rx8Ll1S3YHW/qwdNujtFsYHIMgOy84BQKqOnP
5wUZ0VHZVpzqH85FzfIU+4nfojF376iaMriC7RuExObVeEJBqhWcYJWNsdfKjVvm
EeGFsCigI2xcMFP1Bq1hfMesXRxX6Pz+icDdNbhM8Jc+J0z5tAqEofoUUGk0eCPI
lShpYrRRbfksAuo6B+dvH7pp8FqGxKf6+KmI0kudi6yk95551Qp09NajWgzmVrNG
x/LTCFumNWYQCWBEjSFYzSa/9CPxIgOcaJ+K004m48y4a2OMSW+YK9Ojj+lZxS7A
0X7ntYKFX2G0qoqcLqcc/CR+LI8O2iKIk20vXh/kDs38fVj79nLK+wpXBRWSxkP1
Aox78uKEO8/QNLOunwPtfS/NlwKBoqOfYPAm0d1jpmxSwdS9QWIX8xVNaU/o/ujg
LQ+uQx7d4daOU5CHpFbU2or7ZvZkPb7AfWE9mIECu22rESbyDWasCjGUfXoh/bHc
MkBuNynMQZalozSXgrnoPHaWJ/4QCXD1yv3pg4a+hxXgG/OjMWxpUMuaBcyW63xu
lA9CvoYZc4PJNIPKHaDacfpulIONgKpfnBxzlYbArwJNPDKTPjzA9dBwcSxF3N5Y
nVOHnb/OB9Bz7FGmyhatB0nh2bivwwbucYbbkDA/P6UHKzxvdVKLtmbLiIeWTL2U
BAH7C3/kiDOAQ7FaFHgYBp/92MngFzwuK3szR73cXEO9LVrHHEiDIhL8hoh4dsWx
aY6h8qTs3znQQC/LC+iZor+NZGXr/efSJdR2t4PdEMObmiuyX0CT8RwhCj0LlJLM
u49icCdwY+pBuSKbKzQcYc403vrWxxRp1N15NkOpTlcHTgbM6j0pZDcYuwbU6170
A6eW0fJwNYfc5WNaFAgPtaVGT0IHYNT9ez9iBVdSiurQNGewqOLjGeeVY/N9dZT9
KcTHA/lQ68Hv2gU1eEC/0DuTxTKErsHrjrv71Z16N7PkFFkFZQ/ER8RVv2HRl7yP
Ub8Ba102woGJkywFxgRlkN/4p32ITpG8QEO9xJuEMgrCrf1koHQqrPPMurnNycbA
12vtJqSfNWRJeFPLFp6ETBNMhc9w8C5lF/eDxrQPZPb4Rv/P05lbJqrrm7RYJ9W7
7q8wiYvjvjcgzLWxHxFgGOegkmhhnfY1y9tVCTU7kSEVQMp0J3AcaZlvLuQ833k6
TkmslP5BkLX0/F01eRMdno1q795EXhg7DoKmperLvwAbWCRw/q1y0v3L01L4mUm+
tJjtQuAwWsZmnCxhETYIbpBKMYl6+RMKuR0O0q0OKqyHcCNnrren1JskJuuYmBqv
0eePtvU78M6UeDEdpGaWLQjQpg2BmIE1sxReymfIF4F6ZkW6TMlgxbQ3S6s6Y6jf
3qeSbkPzmHfmTh++odN3KXHSYvxfYA8jTXJ21I2YtUXea+rjlbvftHb1T831h3wH
1qGxGIQmYLpzvy9GvlzFQUe34HboPeQquEzAGiSBez6yObmHsg6Qi0/6al/RAQpk
g9FbLRfHdyGJ8WkOLN03mkA9r8MWeEFzoukNISNJWnNrcRQ29+MyHLTttb/8HFVZ
85azjDt4DCQ5dCPz+0DfXdCP32dPEBi0E1zjJrFRWzfjxuUUMNI2ogWa/YvFB6Am
FvpQTxP9ZDE8/6agYVt6js1DaM0WbI2rVxLkc65bjS0JPIIrLR6HotzNhaPkialz
nPGe2ufT28cv3slm3QNaZENhJf4YutEnlucJOJU/QAJABjaBNEpaRZmORbXGWKw3
FHukW6caK8bw9RDEBNYJsPwf54cKNfC3sSmfuDt+JjF/3nRKTsinxKf90UPfEFYR
nQpDKCeSwfBX3YXwe3nKiozNI4dzdIzTlzFlub82DemuTu+UbGDn7ae8m9QXgwlU
HIXglQdjzn5w4PPWv0r3FxpUW0GPp4BB7tI1nEZMDEd1WIoZt73n312xf8nnJDac
iONHjWs8DRWSpgsmLYlf1QxYU+/YaTJdXL14hFB7XrkbheORlxoyJ3f1sqjSk0Y5
J32WxB7H4euewjE53P3yyiqrwY3VPRQAvKIUHCrHQLFvLwxke7Y4YsvqnlXSrB8S
BZ0KbCetoBrb/QwExtShHjqO2jJHPL1fqUenba4+1zSdF+iYO2FBepEusBDzTOKg
gMQvCLLyMjrnIPfVJ6JY0y/aaEDf2qmlJiV5nrIAB+lNYroiKhLC7tA00+LW/0P/
5AvcU2ivLrzPdu8e4VopmVQYbdq8ukdOSiWlCTNPBwQhvJ+Zx+4QqdjeQ/c+osyT
hIdjroD2GBdA/6RO7RF4f0+RtEHqhvu8sZ2KV0g53tPOYhfRJiYdg2IOF6uLTcuc
aVMdyJCusH6Nv9Er6bo4pN4RlwGWghN2BxwJ12hslg5OOENIf3grxRSSZRmOYlM+
5Ef0GWEedw8L8trsfkFiH82psGMP3olKG2us2VgoftHxFRrtD0SaVIPesgHboqFF
MY2y+twJtQzt3xNCjX8rNt43aDf89AANyhPi3BySsXFIOX3nOYWG6SAHu7sMi6rS
3sqYD/C9M6vXM06aGxMQALkvTDrrG6+zwg9WZhJtO1/G08OXZep9wO4uFELrUws+
lKMmQOkj4UktZ76gS1Ea9L8Z4TOL45tbiim5dcgoFErgd7c5mULjqg0CCWRV2Sds
aiRSjbanFxcHOCrqI+lQNaMp7G4Csr0W5ye4M67xlNX6IjXq2qKyioOr3Jzjldx2
3/HoJ2m+1n60RRIi+9LCUC9yv0GRnI7Otu93xpFL2d/+NZMsulizxEDxFaSQthth
cj+IlJmA77cZcOEkuW+eA9eIb11fj6LPAcPlaUoIEbypZg0WyqHMcOf6RSZFei3I
5r0r53b3iyPvRKjlTGciqPEQY9ln12E41fm88AX3L8zBxysgr5i8oQnCtYiSBhvF
AjS7HRKMEZLx+q+VPD5fcUXX+lNbulq0PB66HFeG3j4VP8ED5pCotYPSkST9i+C6
ODnG8LV+rjpUE/W8GkKAKYFH/W0j8k9SdM3FknujfCcd6YufDzFCoFfCtUCWbHoe
cBJ//vhO0CvgFpDNp+mZ7jCPIoISJVYjNm4SsD9LRKCS18XF2BapzZRmptyOqaB9
S/z/jcxESOvIXR6juDZOLKGo1UMREccTPNILyT2PzQAcny5D540ewHF5XQ0dEHoj
DYNbp86nVSY9HOjAkDhuVXvBuzQ9hBGjOU4NzUFkHX9m2tZX8Yh6w527ZfIYF6Tf
xPLj1cJpruhu3PsTexRyOIGprmn88azmi6kkcIrwaDRHlmgZcy7krb1hfQXnN888
/sqj7FmNmdC8GHx94hUGDwLva/FYoTsJiupzlcl4JbBFm8boGwYLov9EWwa2vWbM
8Oech92wLsg4GSuJMBWathhD+0hfcmORANNAp/Ocync+I6NKej8gMW/+KEzjiamT
Zt+nMQ6Zzd80p9HsApAiJFQJOQ1D/v4r77AH1J92bwyi9m0O+QgbR6cD8R/a9Uy8
rEKJqS+PpnbKy58x9fqE13iIkekUU+VCqXhJ/cYHZnqUza2OB/NrWJD5/wDgPLuS
tLP00XnTqasXP333K5vMRI9TuAK0TCv+gFw3Q2imsXQEiwfd+bSzh6QPi05fH4My
MLhETMw1BhuItQiSR36ZIDHBs6iHZ9hf5WXZ7iAXIAiZISORXDfPvcV/Oi+dbL6W
ITutPX++8Si+7wp27LIIxAvSMLhvkM9sk7edbcdXTzXi+Szu3jciBDEUpfB/PULs
lo4tYDSZtJ48H+xqZkwJ2xHo2Wbb53urEmZs43DoTF4/dSzbjFTOvDxZpiOM4PDD
WEfbPfSZ1cy8kJLsHAbKIylkpE2chvFpTgUHTKJxg+Y=
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_STM_TOP_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ZpWUIDbCzuhYfGi/jkOI8+61JVk5W0Gtr2nr8GWOd4lVmZBg2Uw6baZfTdH5JsDy
Gd8dKjwGZGPQAOZP8Z7YHEeXkdULY4jeExmluxXsF+Tcnmd0d3dRwjTivrFMnzfv
T/XZTS9rK7Yu17+94FQNjVeGulxf7pWxTW3qIqYSoyw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11419     )
YoiyeGA/Cv8IsG14tydCU92uGLcGTUlCUI0zC8xy0f2jFEFxvCo5OQJj3a1RV0SJ
HDWuDFfJ+OXTrq7TjPdGaQXYt8lwO2y7UFuqARC+F9XyO+I5RflonRdwuHVjuPrY
`pragma protect end_protected
