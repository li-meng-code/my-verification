
`ifndef GUARD_SVT_SPI_xSPI_SPANSION_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_xSPI_SPANSION_NONVOLATILE_CONFIGURATION_REGISTER_SV
// =============================================================================
/**
 *  This is the SPI VIP xSPI SPANSION top class.
 */
class svt_spi_xSPI_spansion_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
bFibZULpG/1bXslVJW6HtaWDV5UmokC1vjke8IpKqWgtomKRlKmRtla19XZqSDxk
nbsUydXsKyb++ktblw2hO3TLQ/BhI7KHOpol/7RypCEaUXzfrXo/yJ6cOq2uKAOH
7Kv/kbisat5epPZh+XWXWsQsL+YlbN7DFmWRLENjqew=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 336       )
5GrfCB+oW+Fe4wLgLRJxy0HfJBhmByVCokICVILl9fEZ7JhXVrP1/YpK+PalBAQE
vbuGeqe9oHNMpC6Eo+F24TnNjXKkSc8msG18ROrDRwziwx5c9dblspSfZO1AhqVP
f4qPlsIexX+P76OMC4+ICYii37pyi64CLDO1gcyCmqHLfmsi3xacH1bQdcA4P2v8
6cdGuo12URCBjW6PLeJ2ei/aRCxNH+2vwplwtoIMDD84mm3xoXyg6NrOjTooi/UK
oxvVSPbztBxVntE1A6zWBs/efvbv6C8ayHN+ie1MeHwLjh1VdsRkTwG7f1LJCt/4
IZmBkSHmLQ3DtIalxYil6gaokOe4w06Z0Wzxdr4/z41l2XvotLCvV+tAwsv5ExKL
A9bAMCRKUFdxqOggvJHJsbgHgBkyKOZ4+d3pqdOIM2zQn7kcqO/y5PRDuk9z6h4E
4vQ72mWw6GpFS+IHFRhpOw==
`pragma protect end_protected

  /** SPI Agent configuration handle */
`ifdef SVT_VMM_TECHNOLOGY
  svt_spi_group_configuration spi_agent_cfg;
`else
  svt_spi_agent_configuration spi_agent_cfg;
`endif  

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
  `svt_vmm_data_new(svt_spi_xSPI_spansion_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_xSPI_spansion_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_spansion_nonvolatile_configuration_register)
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
IqXE3hb7g7V4QCyAQIZ1g8DKKbAQGSW7LB49b/9PfH1wijVDlWxVGVLUT6aBCo0a
nZtUo3JBwIy8/b7PNanKK9A7aYNnhMo8/osd5XY3hCTdb7ysNJeL6q47t76BHAJD
35xTG1NIoRSHX8B7ZIjI94ufJpVSZoEt6Mgr1tWcwac=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 539       )
vKAPWPL9u4HLgy03AyVeadtT70vEGdBdckHCPXzS6ymWa+tfNkn/xBlrlH4WLZtG
X9G+lPnGuBWBt4u5nwb8PIbbQbA7tT11ug+siv5mWhtJBaJNxjtjV5Z+9Zvx2rw5
eFqhdH37y+ncL47ngVipvfR4GG2ZN9jdmEJuUCeXMRj/RJD7QdaVb+f68bRLsCBf
2qpimPOOQWl6CpPK5+SPeMeg/OLpBLBLKqw3JHXLZwtaX5hdpjmMftsuKejrV805
p6TGuMKVNm0dL950pTQSUA==
`pragma protect end_protected
  `svt_data_member_end(svt_spi_xSPI_spansion_nonvolatile_configuration_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

  // ---------------------------------------------------------------------------
  /** This method sets the configuration handle */ 
  extern virtual function void set_cfg(svt_configuration cfg);


`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_xSPI_spansion_nonvolatile_configuration_register.
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

  
  // --------------------------------------------------------------------------                                        
  /**
   * This method is used to pack the register fileds into their corresponding
   * register using the bit location provided in register field class.
   *
   * @param reg_name specifies the name of the register.
   * @param reg_val_serial specifies the of register
   *
   * @return The 64 bit width register field data.
   */
  extern virtual function void get_xSPI_generic_register(input string reg_name, output svt_spi_types::serial_queue reg_val_serial, input bit enable_profile_2_0_mode);

  //----------------------------------------------------------------------------
  /**
   * This method is used to update the register field with prop_name_field
   * value.
   *
   * @param prop_name_field specifies the name of the register field.
   * @param prop_value_field specifies value with which register field is
   * updated
   *
   * @return The 64 bit width register field data.
   */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /**
   * This method returns the updated value of register field.
   *
   * @param prop_name_field specifies the name of the register field.
   *
   * @return The 64 bit width register field data.
   */
  extern virtual function bit [63:0] get_reg_field(string prop_name_field);

  //----------------------------------------------------------------------------
  /**
   * This method initializes the register_pack objects with all the regsiter 
   * fields of the corresponding registers. It stores all the register fields 
   * along with register names in their respective register.
   */
  extern virtual function void create_register_pack();

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
  `vmm_typename(svt_spi_xSPI_spansion_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_xSPI_spansion_nonvolatile_configuration_register)
`endif

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
PA10lEHKJPGwwCmconXwz/Du/jiVNQCjMORG9Lwz8D4FC80EOxc5T/u9TIUJ4zI+
vk49wTNIBSF6pUUfRDzF+Ky8VDrB9bG49B90wh5US1LVWM2bMeYOVdsxSmd/3cDs
vx95GUzfY4W1fCZz8ym4z8dPjFpq736pw5zuLEZisI8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1257      )
gm8LgCBrdR6C4equRsCEd25UpEEFZ/FkzIOSjQElqq1t4ptZcwHOFxCulrrOznSw
BhG4WWc6GhP30WP52eb1GPMy9686OjD3VPmk4SohUiNz8RC3OLky8tZaRI6s2NqY
GqhN/qaucdcQ6RQc5ydhpaLju8NyX0nAPvk2eZUFaE+4Pg865lKNFShsPI+H6A/I
i2y1bwkC6QSoQWwX6Ha76ip2qY1rd+pXMBeeAmcwwXbzKw2I3QWWIxhBKa3vx+hk
Zl0Rufrv7eGhI9YpR7cFde923D9+Kg/YnZGYirRRiu+uHhT9hjX9jknutAQ1zkPv
88/+QEXXlZ2I+gKQDh4PfeV5yi9MGX84zsLVmyVFq5Ubt50ytDsLfgMXBWbP74AN
Szv2IWsmpvsHg9CCcIhwcuMkqX+RB7xX2Cgm49Ea5qmyr6TJE5PSSfMaIr0lGcVj
ly7A+mNK0wgI1McsIeebl53CVqc8uCs3Hd2wfUk+Lw1iFfBrcIv5bQ0E5bqkOPdO
kGvmRW2zJdw5gEsH9W72iVB3vhSwH6wcL6Y5U57Lj0TH7mH5bLv8360p3GziX3nT
FA4RRRNCzB7BoKQw7+VLoJsRQ0fkX+U7ia1DagzkDIQir4v88Wbrf12UBnqigy3y
1VzefjMjvggowgSFGn4YNiB+eLOfGng2R0uf8dl5cq6ZwjZ5B7rvQBao7zTywACV
4VnQq24hlm3CL4RVCq10HORejcP7Eu3PZKRostrnqaIYTyvbXhUOL0EsdwTCbd9C
/501jJqem9C68XeKjd142Y+VwUIxdP76rqDoktjWU+lw5ixZQ7rRoAxQgUjxY7FF
Hu6CMaftgEBVDN4jG/aFOh0RpAjmOCGpbOOeHdr4xfzdegzftydjS97W3cnOS4VZ
hE+NvktYSaW0IvhFK/O2+Fvl4jTIJXmVKmED9fMh27y68H/gAfcMehDtCkMFzQnw
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
G9w4xADDjuo6VPvoUtpoVEuCdVdYcY/VKNHVRkOGUvvhWwuvQlT9ybxdvucoUd/D
pmZdAH0ifBS9/zbcLHnZbgZMnQdf3o5YyNut52shAIUhKL/TOI6fvM5Cs1IVV6v4
6iCMCAqtktFewxrNlCoPRfVXsvcnPr9xHCzfeSRx3tA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 18166     )
OVGDgGs/FsJIzjuwBma95LVBpBGyYst74MForT+Ne/5MnpwkQ6EwnvdrFeVtZnT8
I9KVp3btdpJlZfwgApvVw17Myk1PN4TAaiagdudYGwxCsxFbIkJk4ZjoVcEn5RUO
OcBy6qlIDXPgDKwViiiT2jFZzh1Ulls+YaczRARhzhvexFXMZBnH6urRR9MF+J+S
pg6UamKAJPva08s3Q/NH2UEg9vToK265MLtxQJmkth7HIO6qr5/4ttMxERt9XVsn
iIEf2MSKOERzgh6vOcHK5XmcsPY3fkuWUQGikqFuRsJltqKETdNoRgbvuFQdQQAD
qMM2+AXckNKMmDMv39MNzSN7MeIt457lisq3InLUoqYip/0HGN/Z7B6zurXdpZhy
tzMLw/tu+ARodOj+VogeOlr0+3TYoiFVh4NUvZyNfuMqnbfE2v77zEPsE3MpQx0A
1Ok4wEXlMc+NgZGKjWlHXp2mfD1EHQd1Q8IqcS6dxj5jvmqF+QiAnq6qTfQA9y53
G+v8Z8/Pvobw0HSk5pxLhOd3BPHJfDSe8fP3Ap9e7pxOsFHBj9wOS6XE41dpzz4M
ldmMPZfr0E901nxdcrV1zMsonYNPYLP5FMR49Ky2q1QHG9N3sOUjcNvAdod96gHJ
LNswqHozQ2L4r+SqylxvnDGy1bRI8NrNrZaqSWqfK9LrawnkwFKcWdbvs1WOo6Fd
s4C5Ww6YP8LVdOyjmMK/+aGblD23+oGappy3IcLWRLQ5ktrM4m0voMWhT00FlEXe
QNq660wr95uubTCVyHCa9A4gV85RvVXXH2n56tbFoN6qCyonbiBHR4LKRQf2gXXE
+jKEGJ2sTCzEtzVITVOgiZinaMttUyX8xoAtk/xZ35HDo0FpMvoWxFr2vdhKNgd0
voqPA4ZJ59J0Lq3auniGEFNmeRbTqiK8/w2S2AzVgUdaQaF0nZKmWRK7asdgr1bH
AE46+D5Ye0nTMXy0QnYPNU/guoDNE5Jf9VW4gMPv7Kl+qqrqNoGDQSC6lHE6ITBq
pTUu7D8zBF2GQRwTkEFFEXg3I9mmr+jfVdyX96nmdEBlRPPMaQKpCl0nEjQc0MDZ
+puKqdBUjnRpfpdwLZW7iBZX37WD/IErmnvgUxtD8JXaCjSn/E+CreSkFH6lMd8m
+zDAokO34umCSHl68KarDET85P2l5iUfju+Amc7XowzKwZmzM7mJRoLKz22RF6Xo
vpIaaeKmHZ45TNvYPFiSCyjUpBmkff9ApTNP8XjdLTwGRHJ7kA6LAyplZCQghiEp
xCK2wLowYStW7LCZQa6PbCnLFdZAZUlW53nNGElRcrT7GFkpn/wZpHi/sq+sS0GL
uuNtkoh9kkgPABL0IFMuM7a1hTa22OUMkUueagQFBqsWGfOfzp2kcu/iI5vjnl/+
VblZl/3iJHtVqF/Ajt78HOS8d1ln4ZlYNK4eijUIw0K42jZ07Tr8DnRYIHmoe2m/
+HI9qFUC5v4jG0kgE+SC8jo9Lhf7biUZPEzRFaThrjrfJQu659J5z5paifubFVy3
0QO+eKpbXE+fpaYHCQjP6BX9zaZHlMNCvpEpZmQOmbWjFQjm4GM8a5MdgqiePjdu
HxP0+TDBC6UP41etIGaSaNqTMil6iveF6eVZ8yS5zKVfIqywEG5o2rqy5KPlB9Aw
hyeg1B3X5nM/4pAIpqqhStLZ9kElPXE4OChMvNL+61jfWiwc3QYYYsrD9I2ArhvG
hpa0dkZYL32unorK8PB94GWkFaDxxqqWbge/IDvfnSW9gLuttitdOlq14dsgo4Jz
QwPwCFXcD4gNRvmMOkkHSa09LfT7buepWGKi1VSgIonq1tQhRcc4fKCbkyBl9XOE
dU7gF4wnEb9LubHk+xxPR2WvKyrvpfejpT0+/9oGEYsfqazLTYJKfNLP+zGQitVT
q+71FM4DA0AbLK+6wUh5rMVyMs94U3WDNKoBhUy+qz/eAUJWJi4ouSWB1zr9i2Hr
O1aR8ygQViqT1yM2XpcQOg6yUZO+L/JarOzBqctii9qwRlHi7TYVEf/qm74EeUeL
+fjpfA36u4mJgwwrW3snMl0k7xsp1Q/SDk48EIpQxGWxP2p2nA98CISo08u0Mr5c
mwih6PYfIZelrMx5ecPr78HCjkjeg8pUSGizWY9bwpzSMm9hOQsTymSp1oCLuS69
MJslU9P2bk10A+9muK/bX1w86LAhOhhC510B0MhMuf2y2n6TfhDzJWLCq1XAr2Jz
9LKezBniza1nTR2pXBFtOWVKaRcJT/15cSXFIv9Wxx62Ul2YrN5PwSQyS1hf67RW
wER00RLTxm5AYuS6PNxdP7aFYb57S/5Lmrmp5LqM1uCeMNePbxRjtvbCdkRP9De7
PVtKYYtayrkZeU553ZR87aWjtjeUCCGix8NLKbq08EXgtOBvbVLLETsri+Nii3P/
UbH1TjI1i6TX55i0TPiAMJcpfm5m4Lkj8ODC5Pfjru1iXXCt9DqbhkLhXF/Z4IAV
Ysmc89/0cWqvEgXMYiFSWcgglW2FxSpTypBFvu1c7AdR1xU4eMR3hU/GgJc9soCz
B7TbSeDyPWnPtSVYC45Js2aoCMmxXddgTCV9oVlAfisBH5pPiV1kNPGBWrLPbkYP
dRdXoVh4s5TxsqIC9TyxaGeoxdLpWWakENk2eg2EcM5/cFnaIEhU8PDx1gVNJKGv
pH6GDumK4gTmrQH9fUmmu9VkwCPzm5YI7DQFpJjzoOWf7iiSAPkO9ej8sRGlVVbv
lxzTOT9dVncU3YY9Tjy1EzyBcVga3nqQXKwG7D3R1D1RA6EqdMK++hza9Lbfl5MO
yVecaGkv/HibpENqEDysx2TNwk8fg2wcYyXZvYbMM5c7ELfz1/mr3ZF7p6guyPCF
1GDd9J9z+wVEBzpW09YcsslR6tDDvMCcJOu8pp3LOV3Y/vUnzNc/Sb7V3C5hYvlc
1+rFKVu59QfrL/Wi1Zj3ILvEnSz4L5y9hNmLFEN5oBdxwBBTRuMP4q1IxwjoQ9cI
J0RaRQDhnQs3NjA+xxM8Cva0BJiKUJbKngsb0bm86lQYo7paiXjAXZoxUDNjeGpy
uVm8klc1BBb8xd++DzjRBmmN5AM6jZo+NJguUSuC1BwOcW9gsix8/L/UJysb/vzI
udgeQbC3flPXT6m8JM1Sz1Vp1iVSKmGo8pqnd2SoyvXAo5XTlrsOwplravkHArKK
jOuNbxxFX/hDO7vP+Kenp+E2zU915Ru/AU80mo+f25l6IaBjvnm7FcOMlAxVyR7r
bkFNLnyR5xOrkOeMxYZXSQtYEnngLsE95uuhHhYl9TeRj2ImM9CbTS4YI3H68t18
3lXNhJ2FqpIgCBvbfsYRpsEDRWSETy49yY5AxCWf4BTHgxXCBvHb5NTdoKd4GErC
bqJC2tvDjJW3UgRxkpBq+O2HAwVdu3Hx4ZJv8yuUMBZOdXcvbDcGPJGSaT710u7S
KVUZM/iR+YYbEkyFuFGx00++tNUrOOu2MDexSvq3qFkDuocFh9y5FlmMYrfWUv2k
uRilzxR/p9mVYno3YPXH9eE9bVompYPrBfUTwEaHYfeqawOZ5KLYpYlZnYJuv0jb
8f1n7S3lxEF+ACCThKdW9ECvvqYvFUvXMpCZlVbOXY013PsyJ24PMMgQvMCcPUyD
mEIdAFyaOEnRJ0OGGn5fzWfzC582jfbMSJZ9CW/kV/xtJ37mgnipXSh2sCFs2DBS
7RFKwrljdbDBWq6qganS+ndbB/J5PudZCHeojnlmchX9kPa6FkVgSYcVtuZcWQwv
+u5yZmnXJGX0Sa8WlnJ1BcDovrqupELg4hRlTUTWW+658179jPajtaF3dCUjyWiH
Yrs7PI9SN44Jg6nfDXGnH6IrleS4A6XHG4Fs0ymC1FGr4CniOVHHGwAQFJqnglPy
PtUE4aAw8O96Av1W8Xrk1PGoUZwW2TYj4MSybd1HIVMD03c0w89nXB5MF63djAN5
iUfSxdw64QvDCQKs4ZhI2wBP1qzj9Lbi7neffLS0O0y/PxFld4JdOdL5Ox2BZNrk
poy2dJtIRmzJ4SHZpaezdP53KJ04/1dDA6Lj2PREB91LqXja80RuGWE1o7qOHtUF
ttekXf6xAivPHiGaeAz2/Rl8f7M7GQvZDD75DpzMYocmkMIADs07QkXemP2uJwm+
BuCGzF3dvHMzcOveXvP1c7A7e1OIxYGAudNYtw/lOYPqpcRMoNpxOxjwXMWSjwIA
T8LLKBoxqKJf/nH+J9WXPrqQv5VRp6oq+xK8FZuAa7dDxrjKOmYiukOMvcJjNXAo
2X6UA+HlLIP05utaFZwQz+7U+m78W02Jsya2nn0kN/5ke4EgRmcLBa2W6BgfoOUU
egkkm5HRZOpBtBunmYuwra1mhv56sGe1DL6R9FXXBxDEcRgX3sZX6OJHtYpv87p4
8AOODHTCA7T2tzEqDgSb6VzVtj/8VXlryDk/YAw5Ty4rIymSyuMFkZ9SrbkibQPW
iHIRC9IeAq8g0V55g7pMQZVSE7o6ltXy0G2i9eL4kx3fXiTNAd+PYXaohd8lKuDd
epNWXQnqx/drNUtPolBZA4i5I4kGFqGDR1Vu/4LrqpgtzZQHlp+yAe9XNqtZ6mOG
W+7RVpSe51qQoeV76HOEmsiuqqd7ZyY49F1t5r9RHCRDfrX5zx7rSk+aX0xt6RXl
Wx007aFZ19RQNNkMa3EB0izTh3gQyobMtiYttwDBFi+ZLtiB0/RN91nBlh2K/twM
btVSnw/kovr6Frxr+GuZsiu23pOMVPZuEdN5aT/vZCqO26nOSrn9uhoYgp4Sfxnb
+x6Daf2n+twGHm5fc+3X4Y60f+tFsR/G0pI11Ic1DtqtQRGKs+d33OuakqwqkJHG
vlLCUrshOKe5oNktrzRzEE53YjjRpFLUMAUXz3vEyH7pyab+4E9F81Eq5MjijoFg
remuYNZJJhRMbWEckw3nxbOJnOyNvYGF7Hab8GL2aXCMqcjxa2XWqUutzNN9A2ff
hV84EbCT4wbaSG06yig8R2OwIYogqO+qAFuFkBSaRCPVeWEsZ5BsuxnfvDi2G47G
XHTOJAX1UWzYUQNejIHGohOD5nxbJB2vI2oMNJvsQHmNX1XzYCxSVQku+CopOWuM
y/srpfhsTSjXoJcIFxVX5LtMOu0tKRbre5OT/JmhnCjPAB7LjKHnSpT9TkXygJlx
fjLpMyvXN5O9El2t+TJvjF501W1YgOllvCuTic1pQhNTVTbDcFGt+NV2lvYBI631
PKWacIgIEpstKrHW1bk/2F60kbYuBCAmiuEC2Q6zXkHAu2zvOyWj7RghGLsGjS0O
Xnu8jfD7Foj/qAkMcZeWW224GqSGrf3CcM0gF9yFIqLwtXA9AqFNmaWtqWXaWysJ
y9j2haLUHROJHuCvVekMMCOvyn9YLU1GIx3ZPJD6901eMVNMA1NabGdFZl8XY+/E
K6CTmTGWrmUsCbgxWZaV2S4rX9naTAajFJoxN5Dt8dyWkuzZpREzmig9C7qFReD/
ps4ji3mSIq9Y4xq/a5gDhIRDxdpTWP6Is4RXSpZ1Kbui7mGzc8IHYsWbSKIhEe+k
zqadyw4WmUa27rCKw5eePhPUo7Vy9dfpMErX3ccXgZAYIys3YFDvK1kAmHX9OO0I
1Or1jLNVUq2Ur3srWDPsmIb8D9Z/Dkn3IJjuurtm9/akJgzr2wf1/UMH3hx7MSRR
c8E2zj8bM83ybaZpECA1ybUjpzidDJwgm8G+JFERN4647bGkyN/AF2f9/cMx4Zko
wozasYIlac8bASWy29RIYI/Hl2rpr5qN37CV9t8o1cDELm4xpfof4tTF0wY4sURf
Wp1HVxnqlPyH+9poAts5JXyDMvUTbZrzJOvKjXV5zEIR7/i1RF7nYvT3S1njSUkB
6wf2pEHalHSQjMKzHWVLZY+hzQsavTbraDljHpk8F/MVyjGynO9OED7cVfbBqW++
WrJqpuo/BjPTBXGxWt90PN2FVW1Vh31NWnySnpXj6wmnCKpYpgZlxgQNLEKDK/Bv
IneqZOw1zHodCCX9zJ2QyHrJgjE7HcFVIqSu3Z14ZJZJH4QKTOvEVEdvCxlf59Nt
ZyrXOU7PxOjPykKRXEiodxMhnOoeP+Zl18hYBfyKzka3wE+a93I6/VlhWdVnKpI+
qchUeWC0g1b2waqXkYxGFlyekbDbHzKdlF0Z4BdVPp4zOZZ70690GPMJdnbxVMYK
FGAcFFWjWbP8hQbBgW+2JBOHnR4DzkJxroBOg4WYmoTvtGlIvtgZLMsChA/zceXA
IffoVGf5QSrlRRPBPCfjPZVwEsSAgVatr4OzrvTgtvOzjX3Oq1+PkofIj15HPdYE
WbdU/FMwJbzk82Lm9Hb/eZtvsONJ5/XW8ZcGr/YFOgs+d99gLWMkdV61BJAkqLJV
3fetxDho1FIrXZh/7W70bM5KbRpwd6rFfN6qc/igEfZZG4A4djAGR8KUOCfWajs6
Xf3m2Q3wkp14Q8X65xmfq4ZyM1nEpQyYdi3rD8zQJ2FHhukdO+gtZyUVQVK0hsIN
ucUB7eeKovywNsGmC9SnarSQ+xNY9rdtw0z6tDcfDhwUdTQ6hASkZ8IJhb6GVN/+
UW5dE9kbDjaTcjsLjPMuxkwohMG5WIIJgtwyjOFexDAMy4G2S01DGv5AWAkVUytM
X60DU5I+UzB+w10UfFF3v8u0WH5FJG5H563ItvfU/g6qHaTgvEIb2Q2p415RloGM
u5g5kX7JFzocxFJ/fki5qS/fW3wl11hPshwOkBCITOcUAOJW0f+WS4FsZumTp+G+
YkqClRgqxIy+2ofmbt3G361idJtOTJSQZkcSBFzUlSrHcx3xaXyh6qltGuCJPoPR
xrge4dX6zmxrqUorgyAFAcvFJkehaOTP8pjGngXiiwxMBOIe1NYocwpBzRgGpoEO
2EbEBqHsBqxSIgq8gEFaWq5Foc+6gVwfmVXyMGSYH7NzPCtI2NRAG7OAMqRkeSXC
VfyYzSxXSlJxSc+yAyKPOoVPHHngD2KtkZoxtw+rg8YCvKl/W2w6FL5LlbkFYs7G
RJnL6L8s1gV20v6RbX5wmsM1k0jBq5aXFzOTUD+6WBs6uPY+BTneoqzuTqEwGKJr
EhKz+u3X3uF545Q/BGVxTJn89XbN1Xtehx65SwKYvROznLVzXw6ysVCzkpi1p76H
6n/1vGepLHZ/g4CV8sT3ZNtyKSCJYdOPlU03QqTIiBsoQbzlXUNh/8NuvNz6ONsS
yaLt0jnvkwu5xfT4pcHLMBIGmVJbPJYOIq0bGEhYADajlegTN99S5g0f3aJzyMcr
v5dtmsnWi3jem+g5R1WsseKwMtIHLyFqT0Gs1kmRwfqMEL5pxGHca7r/g3Go+XWC
4MAuAVZp6uvYTWeL40tsbg5/VaN/hX5/XVfgUbMu2q14fiQ52Q9GdjkvL8rV80gv
4avrCMoJabqHB0LmktayRos6cc9l0VOBjhzoi/9JS21PYokQHdy9/2aDTcbc26N4
N4kj0fG7RoBX6Ok11f8H6MBWXUUD3RDYcWCzuXJMTqz3A1gp1AYRXRbCr/LD2a/X
jhWTLaJqnRmT1OkEPwwpookxB6JRcI94Ia59joDVo0RVoW+0+I2XPbBVDnIHCnsA
BVf9jw/qMnAkJe2zoHOve7fSh3yGeWpAQwVadN13HhI0Mq9c4iKcRJd65RNVh8t3
f5bAQYZYrq64HTYcndc7FqwtKJjHAdL5paez3reH5KBDE9KoTolbcTXDIlUO9bBU
iEx2RJ/sJZ/PqWxjkEnDfMGyF3/L9dzT/c7ZrErkLyhKLb+fQMbRAK2JRUFH+aTy
iH7+cd+xuOdhb2nPOf+LvXhl7bdQbpG6sCWmnsIjxfxrS20jNuxkPWljxNtf7N2s
U//9zrWSZkyNqxUNh9okEMS+Dr+M+xTvsaDfJ0Slgx3RJLte2c1iL0qZWgY4bwao
FNrf944aS4CaIrZCQWtSANLzE6RUyksS0Yr2KfRzot3cRJ5WEnPWJJZHwFJleyZJ
zmkYk+IhOZXLqbw3isFcKacu2RBaEpRXW6B6pTVx1gHEb176rx5RgVp7QM8wfOnt
+LwpUBsrhMpw4P4KxRIufXwji+GmmernfPvqC/PRED3RiMKKmTYqh0gXvT4jZQOM
iSA6RkwDKZu781fTsxSr7C50PeQ265J6g/AjyC8hbpZaaL0ppxZ0L8OG4Uq791M8
AZkjT7spC/fZI2Z/fM4ASLZUGp9OtjiPxudbPLVGNOY3hEP2O9se+TyS319C+VdM
zyJjwC8QbK9gOAszpMALUXLarD5QA1i+buA4qF7FJz6l++vQQ/R4frA7ObD/txFd
teM3962603PUuEDMkdYYuur4BrP130pganN+oWh3eWAzAbRIvmzj/pS/vYVZ02ab
c04b7I8fR5jnbE+1/mFulU/XJFYOhVHwpm6FH4xjZiG5TJLYhFSADKg7u3j+Cr8J
p4cmFBfXQAtVhU+74ueCL6MzWJMB6JSwX+/C0y6KO6t0pgL21J0SE20n5/cq0/Uo
ghdVYQqYn6DqPxaVAOE6ydouG65wTCM5rbK2pefcodQ8yt3opPesEEcF1NUjozpl
wzO/LuA4gTj+4UrIrTUFpaSVo0Wc7MJ2utyc8JluAudbqP+9PebS4KoafktI8jLv
bOwVKHYLqdkM1eNEr2D2Y4taKIWiomna0wAY2tDCau4cpfnB5T64wlfdMSaZKT6U
U8oPiwNvSM1iN5TT4BvD3rFY76lVOZc6GLKqAHk7RXgHBOu439zUvxdrhlky4UCB
jF4o+2YZbL1Imn8nM7wfDC0IFngN7VrAgz83D/DrFdR22F1PPrXhm8ahzJFiSsaU
ZNVx0zkHyEW/6pufyPRK6qOVw+GVwlhRBcgONpXZmfVQlpMJbGIigywGIneUTufU
7Os1ZRgMkiqjhVQLTW9ngVv7F5ofr/xebeHHRyLS03wPCytqcYtndbpdYhtVhoQg
cSIZceAv1nSUXnW0ajAyNQ73NeRpe5wTIxfMSZvs4FE03+RC0RDzEHRp+9XcOu/u
6c9TOTHR9+BZ8sGdW07FeqMrdncsEl6K82FSXMtzhr/qotk2cOlF3lFnBFjpD0UU
suhz0fok2FuiUr8IbHzaLFNXX3AtiVFmmilii47ZinSDIVso/HNaw3/GbXe6KsCW
dLd4oXVegYpD8iP3DDmQ6gp1EVw1Zbv0Kj/bY3qPbuJ8RQ48xL1qUIRktW2HPhjH
JIKXEvMUTer7DoUEUrvCzvFnZjV4U9PAHfoJjPxLnZpv2cDzHcHuppmrHFWkDJdl
zJDVA+rP+oVZmZctVa11W2ghnfWUI7LvqZlvkLKuyH0Ya+WPapc5OqjJFOsQSSwc
rPwYReazT2ND5Qp09iqTD7f5ArtTR/qkNAvkj1xy05DDURzPXzb5hfFWcSwWAb/A
EO2aaLE9Zu/ED79/G+/cpQr77mXM+Y+VTehFNNBxMn2/XWcSLBaktH8dkpomJK2j
rmPpezZ6ik3OXr9GfIs9yWJLvXr4inlpXsoZYFNgcqty0sW76om2XyCAtyRqGeNc
UETs8TwrXgWbjvtF2Q0S+uwAzIfPIRg0cSsUdDf+l64toZV/IxVccRNDtQBKk350
isPMW9vO2nvwn6neiHgp/eNv+iyh/9F+5KZXyfFcx6o0n9JRO7Dsiug0vQBE7SNR
hnh6Nehoz0G0/V64Smlt0M0FC7l2zl34CMOQiFMfCrV7d5wsUiBiaL6/RtIQhFjg
7Ac9wtfDvSuKpGgZcvqSev2WXpyw1T9qu3xSSuZGeH1ArvTETNE8Na2b1zqKQO5B
9FhVDeWdRcAdGcTkZ6tMDCxTPQ9elp0ZlqMv+zRcG218evfXEplrzMjlqjhy5JHt
1wlu8WJsM4Gus4goiqNLa8dvaBKByj4f1WD7N3+0bRUqS6rMLdyYdiZUWKB6/Dj+
m68PQwNeqp/nWhw7jOfmv/fgKqgXOdHCIX9Q1DNUldILN/s2+/sWgu9XsgG72vf0
MhtvPDqYNRNBzbS+Pq7DlSpUms3QnzpGJ0CgmVZlHf/t7tOj7Hx6xohSAbGzkh6h
RjBm1OHj1CBXUxse/b63AqdLgw5Q0zjWq1KmNWKYdmt+qIsgZdNPrhTEUTX5pg07
jN9BTWkOGHcrOIn75UYSt1Df5nFbASOUcBazDXUbyJxKb68bkLQTpJkL+dn6GSJP
M7qD+xEjuFID0st3qWvALSrE2VZiO006l81367sLl8mYMZ+PmIt89QU4fcRfe5dJ
oMJZOp5nHrmKmpbXrPUoOaC9+oy5DJBZRxazQ03veUI5l/oKLYmMX+JZnj63Vmuu
6oWAQdTw8NvqfjTcVaEPjGJgAeW089ygyq0mE3UbCRhlRIFMsXaptR4LGYKtz1nC
E5Aq2FHOYehf3wz4F1VMGpAPcS/x/IIba6toyxYjF0KZvOIqW6JPeTrm15ERCUlf
g0KpDgzBhze7Q6JUAWYIoPK+LVYtroY81PCWr0hO3jZ9IVapcX7spr+hkjm7Q1rM
F4dSrDwxhwQVQR0mYQi0XYoJ6iVVpGzz0oxa5BuPu7nP7YGqVnh3Oe3/G4xYDfe7
WU+qMLJi248mGKtJU970H+YD7zGb2HfO+enT30NT/SC5Sq+85kCi1Frlyw+MxU3A
AxaOhUgep2AAacIacVP22gzArZmu/5bAPAm0NYnJKC/9ktMPkcYfLY9RPxCwIheX
eJroQZvKW/Ac+XyOpM0Jc25d2TkwUDBWXgjlz5gzV3x9N6ZLJX39TbxLjwyQAANG
Y96zbVaLLb/cs7exNrInP8wjgi/NSUf2CXs3C7lTO3KVuDqgGRnLUCCuyEIzk6n6
HgJdpB7KiKquvNic0WLN5kJGQWyDOy9/VuCsuDBJH8dr9OZdf+lHvO+dXRgQr76Z
bpsA55DvyA0jnYNT9LkdxI6zz0n2ieXs/1aXr/D1KvBfrWP0lMyDzyBZLOqOj+SG
lcm7sAPAWXOLzft2Gr72U3AFz5GGBYjPUpxMEorFFHBQIs3jkkSxzduuJX5qcgc9
X6EjRYDi0PT56oYm9jRXTPuHuEiuNDiDJg5OIIt/bRJe58AT5GPxfWQ1TUXow6yM
1jzKOcExSiifKaeiFOKmHX/R/440MKKyG3MtVdWDepaTt1Eb2AoTnFKv8p1wiBDG
fDco9nyoRYGyExI2bRrgf4G8N2Xlsia/Y2WcNqmVaeR4nfRM5rGvqfrSDcz3YRT7
1HKoaZ7IAzuQhueE7DHnAhzsihyImO5eukvDXLRBRNShNyCPgRWCcr7wfeqD6feP
P620qMqNbraCWaqJRh37kI/+0P5rMjMv6vdA6sat9MuQsXq5Rg95gpKSKVHuT9Gb
7WKZu1ppGp4FclQYf6XHUtjlpM9N8ulfpnnIGrOniRAC1G0kaGMXKTflnycdMSRT
cHWZXMJliSZtvduahDMZNqsrd0Plr6jImTwIiAuaxjmJGY2T2ALdqVjokWoGjc/+
MJ8EkIJtLGKLOrRFfUrv1gp1skgJRTf/N5F8hVKUpQa9wG8CJWoO3EAfObw9XvQw
tl8D0LqFGAg7cFon46fD0hjaUK9iI5pSQBHuSBEMvuHnnovtrpTD64l9LDoVZGX8
SUEzoXn7YVe64O/REOfGQIgcDE4OnrPHgrCjTn75NkHe2vq2GeqhUekW8kr36YQO
3BONsoU7lDotA+VdZpa69J3paQ0MuXdfHfgv2JMj5M8ZWp7OBgCIiOwmbGnSrjE/
uMupyG4O4/xNrUkinKsvu/6C7iez/zSgsA3BSeTBEyCszUuN1i0qEyfwTYVG/etu
vv0nzCr4T2HCeI/49mdo14jpdynwSfmzyy+BLhbSAdkoZSeJiPdSb8adNYOSmXao
FJxOZ1Y3plteHyx47a5CvHBjPrqIIMBRNi+HQ52EM63Ey8EQlznjlD84bXyEz8EA
8OAxhNBVZrDBZae8NxcTZgKHsl6TT0zHuCsJM4kr/XNANDXGxYygrgeMZxeOAW8Z
T+EwehMTRyvpmQGQ4kKMHiq/rB4da3wgZ6yBIprsOVk6p5yo+/fjROshi9vLRhy/
X1Urn4iiwuByvnZ/o7tVWWTDeZDxrZ6mStMMf7EpRQYooi3z4L5R3wfwrqFBkCW1
m6mkuz/Us+Q1DY7Fn663CoTSE7Sn8on3KYsFybVye8GFTein0OAkuxMR2KA08uli
pagwXykHLiPVbKEVOWVdH3wNUsdVkggxwC88waPQlWNcoznFtSCQdPEp0BeLNErV
a/idh84leM5HdZfHvcid+m5UyC6CuOqud+2oEISIyOeUwmuJu++VMA6yJUT9NdJx
aIA/KR0pLwnS3A6kQm4VPY7I4ler2+A3GBxDOcQPavrNCQ6BRDOPnh4ZF7050XH9
bbtB2sfkhM6eyBIY1uVHFkdNRZxQjgzy5QlthJVCk5e6ko9CZR0DdCKkOSCihgzw
X7DF7jIydrYMlpbttBrM7CPWYZRKn5E2US3qw4rAoROWSKQeGpTQqQ94RejFuXyc
QHRyGZehWQdmRa496gPyd7UJdv6COq8sWr1MCuYrTt6SR80U1ZvRInI/J/pAMK+t
8GdbVj+qSOeLKOkdv6tPp6ujeFmQpy9cE0K5oXdw0MVqem/q5BsTRLbBJrnHzlu8
pWSt2/n2pEKM2tkyXjPsGFIeFygbLuZ4pO57YT7UOSu7B9B+gSnx2bq7CHj6Gn3g
Nj85K/Diddv6jxTTnICPu7rY1t/724i0HvjC/loPjryzVd5u3LyLjW5R3HSMfY6w
Fv4mh5P/Gk7D21MsdcoBLztfj6PboNeL6lHIJNrB3F3lXr1HdwbRJaTLdxI/NTGv
3fibXq2uNzJbmSsy7Cz15kvnXeMi9bModD0J9tOsLPV2lKEJbENlu0IwK/xfXqap
3bixVwF/HBi0tqLE9Ok92g/UzzIh3ICyLaq1emCziN3fKZtw5NncLLJwdBrU8LkY
ZO7NKLOFFlOWYRD/iImkDN7bzzwywGOeeLrwhtH0uJTid7MgJO6x8XLbSNcF/ujA
a9EAqKeg8noUdCM5926vdLK8ggnhHPvjWgm+7+gCKja0zBlLKWN+YfMrIiIgcE3C
4GYK/pPL0ObCeoxHbAYAY8pnzeIvU0ij8VN/UQ835Zb0xH8XSl4L29QzM7Y8N4mO
HVxPLMTkiq+ndX5DVUrWioOAs+ocslc1pwcwereDa16jr0xTfXWpoGloZ7fOhdGk
a2C4MiTuTPL3JyAnytW7L9EeCe6EL+jgEJpWm3a5+IdxHzoou+q/e+s1Gd0navU+
K4fWWVz4Lvj61fD4G33/zDrRGHa8mxlcFhvZqI/eYyb9TbTRxwo3fYoGAJZ1i+9y
Q/XLREDdTBrLBj30N9fdT85smwkN2I1Q3KSSjSK9Gb52nDgY/mx4XuD3yHmU7DLt
eYNgNwqYNqRLKpSmHW/3uJfqrBmBYsR133K4oJvzpeAD8TyFZJ3V247KFk+sMTEe
/mZoa58c149rjhMOc4q3exRTWY7YgJrrOymcoTNnqqEbDC5Juv2deO70TnqMWZjC
Y5CFuuLjVuK1vwjWXX3upcLoVsf4tZjD4h2oC3xOpiIAV8jFl0bECa7fyk22TQCM
akrFbIkSF4tIXl/1O11o68wo40Faa7fjAlFRtPw55nt9eoUh3LKaByCTHCIDrPmH
A3zRaYOE25XIsGZyx9RwA7OTcwspbBzEIH1naBXlPXgfIZhSHYUmxS56G33xo6fK
WkdYuwJmpPOaDon0gMdqoR+myPyPvg5oTNGlMrvHTT6+nKPyl2ZT6oV0TvhWZf1H
6TmiLMsy5pz/luDZ1ObJC5HOP/SrGlLwatbVUvnZKGIipT2VaTuUNMyMDi0tvobU
CIEVqab4sHcMsd7XaKXWim1ixnkusIA0v8Yg8nU7ZCA166qW9zRToCwhSisjB87q
WDK00ZXW58EkdI3GSeXeLq94yv8CortM71Lttjf1hqU2KDvOy8XQ+U7N+FNA5Tyy
nC3Mhdkx3RWf9jObxFtiV/e384sDj4VLN37933IiPUBZnTOmLloOtO7Y2NKiEgDC
YwCw4N9YN0U6jIj1Plld5o1vWizQdRINxd9sbRAJ35HzVoKOi7zThQHrboJhHyPZ
anNGeBX2HD6Mr8jhcdL6GNs6ic6/p8k7iVe/e5/o7TXEjyqFA3v3JpnlieSH5ed9
QFAd6FR+9nPxwT6MxWz5pgyZd/EFW5i7wJ4uOAdKXg0bj9LvMJIdvvqzJlXXxd7Q
hQtVGgTkWs2HvbHKXia6X7/ZVtFmi9QYZrrJWkLDcHoPxcywD0Kq+WPYD0xfyiqZ
Rs3Sz5y8r5IfXfVumIVUE0OCOXVwXCJbcwoeracwEv7/SAvjl5/uBF/Ij94rQ68J
cOlcolx/jxU1WYcGJMyguN2++tK1Aak6OETo5jhHffBvB+77godW1U/hPLAx0iIK
kHzy04BDD3jAGfTKq4b35vMAROwwQ5Q8aw2anJq2Gt2og9bFitYcTCXxkKI7SJz6
ARYpGEG6zlU0hcXjIrvBcYoHeNDWspcgHLkkHJE/q6+5V7TfMKwPag1wfFI6PX2C
4ic0ceAx4g9wO3J0iVeyLS9PrIA8JqFhUn0uYbnZD1iy931c18J9qeImzosVXl0w
rCk5mkAc+ybZ5JvoaOk/sDW2AqkvNnSSDP7ix6lEVNeeZTqFF5dpQkvJ8C01npK+
zx0AVrvqEb9RQIV1ZhBBWy2A14xF3To+cr9+NUSEx5LNAjxpDTpSF+buqYO8GnXJ
HVmFl/VwaJ4TEI4bFWKiXQLTZJGcYnsCOVLqyrA+lGBWJVcKDS6LENBrdp6N+DLg
DZpwOiJkJmtnxk30/OBsouvBlA493jGZtFQKlSKS0IAgl92YeNX6YznJUpT3BUnj
KyAWbLnQE8VsblsT/t5CxQv1GWdub2yvmM7GgvYBye3BYebq5VoeG2jta7a+E6VA
2AT/03bdh/ZXU9E8CVPf4VJBBPeg7/qAIbpXuHqrlIBYT3HafOlQVvodDRtQep3l
Imjvlcj3/br1Ei8jRw4eLlboCoz18XyHlVdYJTgQdlSQPtmMHxNKKZe5foK0cNFc
MOJsQ4XBQBs/1vaZIWTNkzJ6sgKhvrLdPF8QBlEjja9gnSaPak3lD11I1pBrl+lb
Gj1XVYwXveDVtp1LFypNwuSRt0+/qJQj8N6X8xmFgzB4ZEeA3sCiQV242hV54VFd
7GsbuJEkBErHmOXybYIJg11jNxpHUjLfdtiFAwOF37tnzkOcEpvy2lxHMQImyXaL
ub4V2cK6N6FKaXfTRTlnIJINJG+7iVEAlSi3nRgLWk8A29YdHWkTNzBVhxzq4SJK
IKtg3wgr82tgyG5rwruf3WJ+QfrXPoKHxe4tEQDr+f5M5KdiIGLEMHz1gm0rqOfJ
XQhTCZrrYhI3QRTwFa9suhyL3aLdSnwMoo6K5sIV0H9lgXGt+8cNle6ruBxtfgZU
Pm58qkcGxORltwSg8/1CSIrBjDi5rQqBJW/UydqN2iG9kLLBsOzByo6eIuo1DCbO
K65cU+7V28kLs7ahntWEVO9LB6HIWbHF34bMioVgQ0Pg5f7y1bwUR/M+LhBfMAjI
mha02Xj7wpS2zoPXKmCtbkFC78qoIUnJol2xFitfD8OoUetn3d1au0fvDtqXJ+pI
Wh/eqlnKEzr8m9NcR/N5W2wNzEClePVw/mwtndDfQy4QMkDI0EJ3Uu5SmyXjc5Eq
ejeDjnxGAs1bThwIazkTtbD8un7YOWfuxqKDd97jiJD4pyEKPEkeZH+Hk0KUdAXh
GBwbPK6T/3/m8jAKA6QJpj5DVUWBsdpgnLc1RaIxbnQB8fn5Ab14z5HglaXUbzos
SwIHz5Vo53F8GR7lqQFUrG4wvR6E6M52MzyS3a43nBpnXDywLCU4zr6Cyz4xqzk0
glqWbZW/3LqwXnYfHx6QEi631B6fH6+2yQhrlxijUMuuFbigy7LPc2CCStRatqP3
uNebicpKh3TC0+Ha61iecLkPJ8aoNek8qE6E1HcxRm1G2qlGdhXbzN4YeH/cpZ0N
9hOFLDWnRjwerw+5ipQGqLgX7FCuMX16UovNjGIT8pP/VlltM98ZPxAINjuz7h4q
jgEZ9y34h5TSiPJPHW+n85/eeZflcGP4d4MGmQlQF6/6IUxyvvZBcL6XLPSZA7UD
3fxs8HfjUHXPgoQtCe8rAkDho5YzbaS50An6Ixz2zk+Jm9tmSRpqw/SnpGbernWw
YTE5HNWt7MHlEWAruDU9V1CyKNc2oARwgNyBmiNjIlvecXrFsvpGm/tVF1Ur4Rgr
EgGB3v36+Ydq4Fo9c+vCCr71Sgo5jR3wHAGdXBc+dF7es0O21P+IV80u4Xy+OQkE
RaF8wR2IW2fZ1Op0c0b7Kl0BD/CsxsVdFU3/l80hjTYyhBEXbzCi2e/7cslErSBO
Z2TOiIppGe/FZGrLKmCxFz0boBI2tKX2rjA0PM/denY4kSgOf3iov4dZgBUFIfHZ
ncu0AK9jx9hFVtMrdre//kvjUoC+t1XhXK7oJZDCk/QsS9x2iqncElXVi8UJaSXt
VYh7uXH+u6cLAdm+wlIyfErbtcoY4oY8DtQZTKjN53Vn9DfYOOwupAV/vb2Cy6Yc
zmqNiEoNTZgZFPgOILoA/oVq7FQRHnmSfAFhmebXgghAdnDs+iyZu1at7j1pkOc0
0naByKkyqXOpGIDljwRKsq2YQqipGuXho+RgnOCtrNFTTHPSH/jnGVG1nJHIBXec
iJTVbSDTzrYfaRNvkZNlkLNbm8e2FIBp3gpYY/GlaNbFiaYDcO7yU4Z9fNsjshbQ
lTdDZiqYnVjaAl08CbDBHDkMaO/IB9oxn5vXg+dy+7TBq6jp7P9bvr//8lCGD/0A
jDx7vy7DFfDshIzMMqc9wZqM9zl3/x8iKbuqBULPRrbK5IhSNcLOh/NqkbhqBh3l
69AqhKFVjRbn/CZUBYPBqgyQjk1AmkH2E0BkwhWYe7DbZ4X4dcwF/fGfCPpyA6zk
LAQvhCExc80F4KPgOfMfsG904aTLK3+EAiNorL7ri3GQrXS1hffcWX7Kc1XiIdHZ
DArOjuv5BHSzY/vW0YmuENbaX4/N6agUBK8JttS+IyOWL5R+ArDHvpDK+SaXjbub
UlWprlrwpY9NdIVa1sDM3xv8yNT65EU4qE/Cjr01KbSv3pbN2kV7clCGz28ZMl2w
sjsQZsyAfXmnnvsUSyiIp5iCD66XhxyE32c5SHyWPHOIV+hb4CZ9kdjbr2wdq3pb
+mXgkmSVInOEUvOLxlYRcm0YnNo72vS5yTMw6oQWuiKhOJ+HijcMFlG6yKJ6k6Og
5lPUjlLMYZ/P/mcLoopIf37p4RR0g4G4ogZOovZ2s6gqquWIN8geG5lEuz1eDEK9
OzEjgpxTq2gn6VYQzVR7Mqa5pekKer0bOxsW0OYpjK1tiRRK5rb/4CfP4MzCehC5
IT11Irgrz6KNFp+mb8wgN89G74jciSOEYV3zlN/XuQLxmYpwYGTiWyRicNPi2rYg
kIk3HnNIT5C6rjtu6DRjBv9lb1B31FEeHjpdz+zQH0ECO/NRfrCKze6hXM5ii2Pm
KHhOD8aCAzJvYAI/vp9fct9gvPjidfG+HpYLEfG6eBJVj2s/789IEITSc5HgCSG5
jw0Q68XMAbiCm2ASjizbMz5otpQSlQ6JNO9UIj1F0Kgca99szN92g4pS3iZNZgm5
AZSnQyr+ExtX0jqNxvpXdQdyL11M0iiSIr5VuWXux/T4vy1QKFg6e+4LhbdB1zUb
gp7YCIEmB6YwOWCzWxmcJW2Jz5Kj/d/iTLSWkUTbTAj7c2ctY/y6a05G2psSG9vg
muwuYqPwUQxxYuzWEXqaf9MNGtASU1bwr4uRvCLwAh5Ik2urz+VuAk5vaGNOkiwR
oawvguSAJwlRzne5pofL+Q0f2HwwudrRN+RcqZOkU0acqUrVMCTcpcV5Yk9Lg7pm
9ZOiiaKU4r35wPafGkkQBD5PQDPw4L5ns2AUjnJsmkqr0DdJJ1/+JBmiNiNE3svg
roFlOyuOWsv5Obw2b9bav+IX8MosfrIs4UZ0+jAvRivUuEEQXsByKECDeH9ZJtNm
hgLFsmUvmwj9gvqH/SNkbyGNpUNZMo8DYz4Q9OML8mRz/E2RJcYGrHsRxNGkyY0I
RD8CMWuXaneiPGQ9hLxOSCwpiZZkUlkRogqAf69HXh3Q+nK1B6XkXycvLCNNaejU
a4lIWDlIdcdlfRLkvKPGqYMb/Pny4oPrEfrYKtwBOyebDdTv/HiPUiOqexu4ZM4H
CH5UH7m97IEinaqCcahvtrUky+sa+rwXGW1ghimFK2X+1OqrghJto7GZjR/UQuVu
BgAmQqhDjb49xxbfdSqLok2mllfcdB871suI9+boQG9OXOCvrpbRBmtKk1FjUO0Q
GD/Qx3AaLWT6E19DJtjKJbXNRMNkktYRX7IuI03eEXNjQUgLZlWn0lOtytL1HqIW
sOOqgWj+9DuEeuOcSa6/Y5epa6QXG0xl8jgGL6gjamER6DTT1KK2Q9XEShp02BRr
wjvKB1Ak/f75RYHQQFLhndMR/IAcD8a7wf7AGeNwoIGKos6Tmn/Q3yIF4Yk4PSa/
C9zR0JXg018zTy2thcEtKKItJ/DVv5lcjgeh3PLsmtRUrk5B+/B2ub12MpuGx0aa
pylbdhKMX829Jc5WdqeaLt4/GvMGTZo07tt9PNxHt8stgzyhhfttTdS0N4djQWXP
9PA1CgTvMOkc2Fiy6xEsM5Qf6tA7/OeLGJcN2lUejM4Gkgb8Tk5t6QS5HFPQpeFj
kgKgY4MOBnPmS3aTATOFsaLBH3ViaSOwezAfwkPQOo1qFp/4DdNQ/0aTfeMLepS7
BEgEOCEMaiO09+F0yW8spClpj4I4tlkoO9laasTshoRtOxiBQng4RhD5a12luDkX
LLE8xbLNLWAwlZAoyvVj/GxYSbUgN0C0Ea05WEzICOLqg8LX+4F1HbBtc+peQjwr
pnXOiWKKVAm/EsOdNezaEBwTsts97cH9PthFQ6X2WZdMv9mV7w5lbLP31D+PfZuv
oXceYqe5YL3Zpkdp9FUzC/miIijHQyAEK/kmm+5YuHz+KSazBQq4NQmDaTkQ+eky
1l+WkKy6Z+Ylyk7uojx1gHRAhAYBu3GlmCeZswfndombKTrIfCF9ER3WFU4IcUVu
O1Ud/+9SQnaqu7bwIBc2rm6xC/HJStexxl2t2k2g6V5OAac+sHa5dRB0Fq10pL/G
viD5JJQdbpcm8nSKC7z0ckDX46sUNGy+A1+/7BsyrfoQZkJmb9YWEhXRr9eiQixp
XY5ij5vkshT07/tzV4qu2W13GVjQ3HEmPPpymZs0MdmRRXoNy9E6G8SvwPvGGYzV
XU/KI5swmY0coVa5LrQ27Mi2VE2y1W6R6phrr7dWgm1LvNt2xht9Ne16YslgXxQM
ZI+67dbBBIOK6EmYYyL0VRynoJQA6nkzdtCbisTsAf/ecRYV3+nFv4nxU6dfMxiL
lNl6JmHZ/I7qSjkIEA+Ji2LSz84t8cyam2rLNsjfm2s5QYqYmid32Ot/vTiVwTo4
Z4VirOcJhY9OyAbwAD9jl8b4Aw8VAbN9DaHxCEIyGSunwgr2Q/Z3AtLztGYKSL/o
t3JL4QZ9Mvx9ZPJsigctRa/kiReN+MmUFYFqPwfqCaeBFnNVCLaNox/p8dDobeX7
HFK4yAadtuk9TdDZb4mA6fsusr/XPAhs540A6bPHSm9bKpTY6VhNQGsXLgQSXQnj
NTr6PZF+dpZVv8UE8eL3HpMxH32k0fGTf1ACTD/4tRr+p96AazSFeoxPT9IBd3bN
um9w4sa4XcVWzdtWyzdqmqbmxNAmfL7hZIZq9dWmZ/bFwr5sZUgjDRPtz8fOJYgi
iWBjfHlPH2cD0IIu4FwegMUCNUtCpJjnpUg6c3RlDm8uIk0ewZIOA55ZLJjFpm3r
N7MP80r8R3CGm+dYZbkTkSKxeqhL4Nw1N22/EPXuFsSWRgMSGEkU1YVWkUN4XsSI
VIQ09IPU/x9QsQoeLMCW8wVWhfAYpgUbeYRJ5G29kwrxVp8N3cT0Cd4XXkxvMVcX
HpYuAsGliOzmFquUKTAmuTFbtjtSzTHvV8nIxCLCNGl0IIpVvfZJ8CZ2YY+KYwj2
MnqNFsKoOnfBfPaskB2Y7+6/G2QajxX659houhIleAyY6+W/8x27ISBBb5feD2Ln
UXTR9h+jlNAquy0Iu9xdFbJpiDeqKTOA0Lk74p9P2RSieSRt45ZY+PYxu4aSVJb6
JvBEulE2D07oWD967H0exVQMs/+81B1ljRi3lnj8SE8wI/NGYpdJsq45rZA8dAeq
8rK+3wnh0TwdZVUXZcGMMKuprmysAaHcFpHgjCZDEsp6CG+1Y/hdNqfR/UaU/CfI
mW+9ED5L8ERtAgkMxsnnPQEN86EK12Nrj33ui1qogc5Fv1pJM/mmrfuaX/HBae7s
DAMEQy7IvkIDhHfuLNngU85KX5Umz4B18X7BHuqmDjCRs0iHV+Bjx9sFNwk5o5Qr
chX+S3BK/KsZN3KN1pkApU3dNKVbj2xX5N1ud6y+BW8A4t+aukcHQtNyWcbc5303
uTH3p5o9ZHuZ8z3OnAN/VcceddNEThbOuo1Fl+oWaX1+KJoRamLXDkfjhpMFWDh/
c61rbJsDLwchbSh41Efosv8YGUToJirGAz+HRGQBbI5zDupML/UnEzEHIs6iSgU8
FANlzPgnQHW9jtc6kOe4xv2uCzCvPb2UgjMH5qELig/WIpVJm8cZlAh1MtgA7kS+
G8OERKbh3OYi8RTTsgjdgnY9awUn8LT9cxuG68PnIzVhNZJ8drJ/RLYav7ov3LbK
GV0JlQOOPwuLROR93JGbo+s6CdcRWMSvQs9dhxjMfVepUd/QNIJDoP4jua3so91z
XQB3DAtILsOravPLfxTJ47xfkwqpyDbv6qOXMlGit3cAcBd1vUV0OaqVPCPStXT8
0FpcCD21rAdio7trGxIP4gOexjzH/Qr2xWvxkChDYEP6mSaFPxU6+FKNSA9k3YLX
UEvYbPb4E3GHGGr+KEHQZneZenOeVXJiA0LcLqmIkdYzA6q6vu3818iN7Jkj4w+k
pxDBxs7zMKWF4q10uUXfSvOeCaQ+ciFx48wxQy6GujwOAMYLosIbslMJ9Rmj1WoQ
YMhbcETBlq6nhTniTxGPNFGNlSzY+7CPI+3zjDrQmof6Vv4kUfPu+3M943LUQDQX
QWPm5Ss2HgYtRXmbIJabRjHfurmq7PSeWQAuTsUDhi4PbwO2Ftcchzxc/7X9RHhU
56FZ75SaOF4iZtLoQwR+9PXbT4wdzng5pAMj1YZg4k1ZxzG20jKs2UQ/2Vp2j44D
2FcIQW2ebZlHjhAc0GlrFeb2RNj00unIPRgn/oUnXn6sLeXzSkOPczYjWWFAzd9t
PLYQNeigwvr95m8Bq1+B0W/9QIoBkGqsrxw87LPV4PXkjQwYBAORzQKzJAXk597t
pJwSEydzf+BPGqdGbXwvsMowlkLKYJzBId/GLmfZp1sCZFDjr5F+bWNOrrndxKw1
HOPL6oEyD4UmPr0ZdlNhvjPAt8aa/AJM4eFsWXgVrvv1Nqrp8OoVxVTKwFnvSLvr
pJ1QI79dnyRxXyZmIzhgqnlxJhe/GD025jdsYhMsLFmV09LgEdknHGGqMb7KYaTP
gi0NRU+B7TJ9LS3m2WmJAwqUo1wP4BcaiZUFp3Umd3Is4nu8zabjHVAX+Ahrhna7
XZ9jzMof1p0lGQGdQfhdDFOqc4JLYUd0TX7fpNmgPhci/d5WPuAkxp3UUhAoyc0X
+ZS7FmPGOghw7Nn6FExyR470JnenOIRqC+uQT7JKDYo6I721dAptclvun4sg0r1Q
Y0tXJBD4AzHseYO71S6LEuCkfNx1tguiLtwtAwDuHAud7J/Tykg6NfbiD/1iAELb
LO6pW5o22Jj4yiftdzyrfZp9/jgWBXVibY6lpER1TkoBjjVUM1U8JN+TgKF8PAO7
I5oV8dQHrro3lA0npJHeQ+DiOngfGXyxz2MldrmZgaiqWnU63Tl3UZHgrquSvaYh
pOJiVpCdqZX69opTSXeUJwEvbZxxMDvipSG9H5UeEKeCS757Oy+56NkjkSooAJfY
5kqSHtSZ2PyajUfdms61B1l2gBZZUR101MCMnA/Vk1/2GZdSAs4vj3kPwrksUKMI
VyrtULja8DAlG2/WCgEHr4hSwQI0mtXHnG5kV297XKqg7IjnJ1qfnhLPrK4qz43l
Ofm3ak7pEP+Aiy+dP9ltjlv6PIGc6d5Mm5elMekIH84tSZJwyoXs92ygqohhflCG
eBv2ZgvfWQ4/oZawJHrEjXrmz2NPgdf8nonHCJIMcTz1scVE1FQWbZ6UoMW2yxJI
hdJOJoyLnJ2Ch/QwelTKAe9+mv3X8PZbshtKXAtgu6VOXheYDS4mbPvl4DRK6hxb
R+oKMARUKqO0Bz7732V2Wf4tYqQNkrw1NelbJm8OUgFT1glW/Ou6scsP00kvEX3J
TC6eAFSEEJX+/3tcxnHhE1wFxgBFeGEc7b1t6fkUa78UYexYaPMqUfHjzXxu6aAi
nYoIYgTVwOgEXasLkoab2Q==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_SPANSION_NONVOLATILE_CONFIGURATION_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
i4tkuUzezAusMCgPKnQ/RmFWBI30gsS8hzN2DOy5Z6VXwbab8V1wfW2JncOm8WIT
Y5qIaZh4EVb7KBuD0WMsXd1qwfY0SviZqrf8QTiCHqO5EGoPdqhzuj+jdPfXPQLN
Inca6ag4zEaW+RQrDJUNeu+TMuN1n9lZTHyQnqINxWg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 18249     )
wC9lwfb9bHMzpul9gfh/qaeJiQR+o/fOo5J8xyuTWFRLjg2EuxR2JVDMjMpU71uQ
TeIrPoA30NLWpHpJxFAJHJnpTHR0XoUK42nFep7i0dPFsvNSOEUgt8Z5RzvNSDNw
`pragma protect end_protected
