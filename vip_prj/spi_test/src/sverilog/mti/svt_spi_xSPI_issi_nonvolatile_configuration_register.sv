
`ifndef GUARD_SVT_SPI_xSPI_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_xSPI_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV
// =============================================================================
/**
 *  This is the SPI VIP xSPI ISSI top class.
 */
class svt_spi_xSPI_issi_nonvolatile_configuration_register extends svt_status;

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
jQlQGqiw0QnfYWG+GGWH8LK0S4UglXO/pVZju8dIPBgU5UVOiwCPNw1Sg0qHhqAw
11usmmt2wrBzreXVNMlChYXkgdAdemXLjTcv7kNxt1+7LvPLrb/AcRxDAhgwfIXb
zwU9FXDOVrM1dSyGKY1SrImyUhIpBZppr6oQE1U1WaM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 336       )
1veNDQ7CFP1NX51j21q6zo1OCWIVj2rq6XfdrrzO1MJDncSKhIdJ/KHLuINbelRQ
ITGk2Y3rI67t3Zq190PaMldgOib28kWIqEVh4cLMpRAg7Ul8V909LmxJTy+8b0Mk
yFuolDJ4K/I0q7v1TGof/JC95h0osC2LRRWHSYYqwBCKiOoeFtN6AOYrAv++Avx4
yRPufN/aQAoNiOD5jQh1yeWcP/zRlt/IkixfzsYXrtAFbZudwMbGRQUGDJ5Q+99d
xarQ+ROBeREWEa0rLvO+30b9Qc6XxV6NI6pMGeZ+kgpfG73vRqGvlj/HKZOh3AO0
ESC1me7c0fBloIX25cretkdCSEng+P3wCvE5nR0Q0Q8KabfTpYxGwwoj8jFquB4J
QoQ1a4sLI/K+OyqDRz6k+BO4aoybR3rfOmFIxNsrbrF8iewqicD94T9lklx1RY+u
rKly8vNpFbbouyDetGQWng==
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
  `svt_vmm_data_new(svt_spi_xSPI_issi_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_xSPI_issi_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_issi_nonvolatile_configuration_register)
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
mBQiv6H7Qm5z8rvhX1jZBoA3m90SeCdf+gQtuZNUv8LRaeAwjHp2mODwj9rCSIJu
uiiXTccCUi+px2vqlr6FHSlS6UBaX579Ar/eB7XrNadH2M2z2zQpKKiVAebyB75J
9ZDNfTf0H+x2Xaondn7cnC/67022Fr4sa5Sb606Z0u4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 539       )
+d7cvw3DNuuoaw84SwxdGptOgX+l04hTr7rn74f5KdHPqPE0KO9yYvtvpA/Y37BO
BcNQMsaqgoAg0/Na/BioBGvZGGBG7o7H5HBB/C+zChIsr4tLywq6mBmR3qY/u3EF
vTNK5R51tXRBPe9ar944KWgqdsRAdlNvTCzd86kYo0L8RjyzSuCW+AmXpSgMuXIi
4Q57p4+842B/tCRfBDkKe1l8FiLfIZHPDcsfLVIcjz4cfg0hRrQytfhm6ghEXi2M
C9WvESwUnNkaVIlBGnjY1A==
`pragma protect end_protected
  `svt_data_member_end(svt_spi_xSPI_issi_nonvolatile_configuration_register)

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
   * Allocates a new object of type svt_spi_xSPI_issi_nonvolatile_configuration_register.
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
  `vmm_typename(svt_spi_xSPI_issi_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_xSPI_issi_nonvolatile_configuration_register)
`endif

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
L1baoSxebDzQmkpCDuMj5bG2p79AQqp97GcQUCbeN3gYJn/0pwW/oVu586SCK8O6
l2X6sBfbqk9h3iV5D24+Pjljki9Ztz8wSKxG7ctCrd4Ee59jOHbD9avu5YyQqWa4
jUXt1z1xCcZwM7B7GTtA0ET8WQ+SgO8lw6CsVVzkL4A=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1241      )
1/cP+lBqIlUeNt/fNq6xHPV8B2mdOMnZu5tFU0pN/q7qfv3C7iItjGFjibnzC25Y
29oTCEvuDBWnfW1ABCC1QxxPuSpmQW4Jpp8EUmbjzKI3Uf2m1FPXOHGzCmMMh3av
3e3ykV7UvoiryqLVZYFcF/CzJU4hOy90Eza9OLAFE7JCxIP8glp59QR4qANknqSb
RpdEo9zjKPp9KrOqfhZhq5iwpZ5PNMWZFFAMCrAvl3BbMNhbRe2zqG6nEdcXHHwL
OJoGO4wt9gkoyUV6Vr/Va1kPb3db1diP5UwjIeUcIja1Y4ml5ehrmuxHGyfIo8fy
3Pglwuli6lew/WvM9/vl/CcqefMqrvRWgkDdqiuRwjVUXy9xzt9K2qsnM+p5ropK
rfIxvqSJ6i9CZLoyrwR+NRweNdi2WkS9U5LmXvCOFW+O4BTuTVyN0i+QjUPzvoqy
xaftL8PhJBVn8rIkOheZ0pusGp/1SZxNDdIWYFvLQgOu7PLKoUSPNmcvVXqf2w4d
7L34YMCtuGccx+awkzKjAFM6PClslLTkPov/R+AAWZ1Hu7ZK2kaIhuC7WY9GHoSx
VRiCILMWodHcWfm6iTv9clMqngfV3Gi0QCRL1jp8iw/yMEIxFYxGuf/4GVwbxsc3
gnGuXi+GocvYylnwLFNQekCvnCDJzcCaDAxZvuiQyZHVAJOr0Dd1ufW0D8a/vKem
00ZW4VdcNKS1NYQjW8UJul/E8gbIvUYOJiOiK5qSVQDwGJpZZdDE2r4BIW8DsFs1
LM+B7GEio4OgskkhRPNb/H6nmmUZCRq2eN7T7kASEwmqYbrVulpKN+p95I/u77B3
hLjgUSALj7qMiEMnSTlgPIAPilFgN/I7pnVIE8nXms7FDLiXZYTZtZpAEjvmu/zd
SCBwNu404M/Sg6a8nnlzngaPmR99BJtahyyISnnoJ4k=
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
PeM4BmBqxjurhX8Lkso1KvTIFNip0fiMFf2SClvTkcJlJLF44AmzEBzmw8SPOWQT
4YZ/aB7oARgV2oB+nNQhsBWXgJQwqgqvCne4nvS6nsc5XblFvMshMDXtOjskD3JY
WtPm374zNzX4XAxFWxrIW+LiOTcxqp5PE4XdYkQWI7A=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 18046     )
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
6yuw6J4sH6pwCOclZlJLOw==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
XDWz5z3FlT5dOJFFuL4F7GvEVt963SQi5ncWgPF2dFWM7xezlA7bNByFdU86dtl+
aXmPFcH5CzcfV+ykk2yXt+Jd5MFmjTLmcooc0t/6jIMbOynig9ZxiBZ6O+zn3wtl
oZNGlBuDDWbcJE3+hzEb3QfM9JazCyyR6DiZHgTgeoU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 18129     )
BD3z6u5mmCkjlDiIf2V7esYQaMVSs8XZtFNjTbhUZtGc3giXDgro/HfubNL3XKrt
1kahekpZhR2p4A8mCJtdLDNowuQHwl+lc0YZwCTXX0Ea3agIm9A9S1purF6ieiR6
`pragma protect end_protected
