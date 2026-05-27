
`ifndef GUARD_SVT_SPI_xSPI_JEDEC_TOP_REGISTER_SV
`define GUARD_SVT_SPI_xSPI_JEDEC_TOP_REGISTER_SV
// =============================================================================
/**
 *  This is the SPI VIP xSPI JEDEC top register class.
 */
class svt_spi_xSPI_jedec_top_register extends svt_status;

  /** xSPI Flash JEDEC NonVolatile Configuration Register Class Handle. */
  svt_spi_xSPI_jedec_nonvolatile_configuration_register nonvolatile_cfg_register;
  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
RkAMUs/jIpyuX2hI6OZKc9K3oVcIhSVL+FSZpsmzE61LIelX/OxpbqI2bO6SY1Cm
z9VxtRHdf3K/VvD+jldc/JeTCEwahdHHezGJuIwfRyjMgSs7VEB9veFV6L9Ovxh2
qSprq2dv323b8HGQSkiInr6GqZu7x2z04+EM/ykOfOMJE3gN/SvOQQ==
//pragma protect end_key_block
//pragma protect digest_block
jlxXX/lH3CqOdt8yrzrsQT6twoU=
//pragma protect end_digest_block
//pragma protect data_block
23Hjk+g7NcPi8X3dlS7jpi7XbWYjCQZQL8u9nSOQ6RZKTWuotniQ2rfsXbKRpRl1
bfWE70BUA8D1imS1TuVggT/KnR5tfqgoXWptCFiVk22Y1ltbjB+xbyCQu9y8DBgX
Cpfo+HVnq/SzO8eXgx5PQgWikr9WXtOhnetjC5Q9nHwhtiPh4VYJCQ90rZ/Y1ZKS
Fp5fE2uJaH5PxAgY4sf8891LFGlURRtZ8+4AnKirWxe6XPAF/ebbNHjq0jmlh0Pz
lia5o5XByUwqXMGJcD5pH3pAhoa1RtsK5aaq8nxYcP8606o35QdKNq08OXPRNeWj
F0txTAXbWGfYQPC2cUmpnOA6bw/b2dw3fUftg5PW0SnwDvnE/C02uhR7oC3Rts60
u9EdFmULda50gM1T6LFxKMa7BNhA+dRBtefHMzCGaXCOC+f0GDvbku5AoqIfQohj
g5DcfmS87VkBerf9oHcdqh0QWd52p9ezvTbkfozGAcWyxfLX/TRPcQySGnvzOTPl
l2eQKZUBc32kvybznNRH6GiCYbbHCWpd0dJ4I01WThujpf+y3AXP0K5fVRpiAnRM
aqmaNLKc0ZVShu5+nuMj1m3G/c5M4sx5RkyvUC5gsWRlPvQbi45teBPFpobfZ9DL
npeZr/eFMF+ugnxhs0Ms8FhYDEl15KXDH0B2EVcCg5I=
//pragma protect end_data_block
//pragma protect digest_block
YNo5Bf54wRAicq/qjXdWUw3rd+0=
//pragma protect end_digest_block
//pragma protect end_protected

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
  `svt_vmm_data_new(svt_spi_xSPI_jedec_top_register)
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
  extern function new(string name = "svt_spi_xSPI_jedec_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_jedec_top_register)
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
UX3QaD3MvOJ05I30oUWendNiXcdMto769dE99AhCoIGW0iNX9VXr1qIYqOKwn5Mt
YV4tCWqn9cxxIkMNrd9aSvYjgQQ2CX3g9zObiWVv/JwkTZtKNsS6fh8LEO3PX03f
A5eUq9FTy3TV2li3dRfsMOLU7fYnbX7ilDeTX/gWIFkCUOeCcYa92g==
//pragma protect end_key_block
//pragma protect digest_block
HoTO2WvXMRGKgEIq0KrOOOKcIPI=
//pragma protect end_digest_block
//pragma protect data_block
0A1lqS8q5UBHXJ8fesfApud9clE1y3SOHZxmidMdjV+cbBUhPzLIhaLyJcRhSj13
CRVDh1qFQr4tNjzBXe+EQrvYeryVuJTk8Jht/it2mGrJeZ1SfY1QuJeGLMcuB06s
7ogRdMGWABv71qdWx+SZvxjPfz0EdYosGQQ/R/J5ZsfcHfBNMZL+56CcOYthJQNM
GoK2cCtH1Xxq+IX+FKXh6R+d0FmVzbWPC1neyzWEaZiX/u6PaByC3XiYaqmXcFpN
A+a3LZHn50cr8UYWsOdI4Vz8gIC4hDZ0ZAdIXG0LYRW++jpF009/7zdhfU84Ua30
qvNgcBTbM+GF1XqQkqiSRAAb/hh0cThpxwmqga2SO1fJmZj5hDaBZgGSbqU3YmHr
LnFVaMp0m5LMMafm2zd8IHFXPbUAIUdUs9UEBIhEOHnwabaq6wyShrZzFxC0yZDc
DUL3U1gkzG23IfVch86klIDLSX3kFXmc5pcG2u4YHi8=
//pragma protect end_data_block
//pragma protect digest_block
fSrVnZlaOghXBuTD7oBNearBahk=
//pragma protect end_digest_block
//pragma protect end_protected
    `svt_field_object(nonvolatile_cfg_register, `SVT_ALL_ON|`SVT_NOPACK|`SVT_NOCOMPARE|`SVT_REFERENCE, `SVT_HOW_REF)
  `svt_data_member_end(svt_spi_xSPI_jedec_top_register)

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
   * Allocates a new object of type svt_spi_xSPI_jedec_top_register.
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
   */
  extern virtual function void create_xSPI_jedec_nonvolatile_cfg_register();

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
  extern virtual function void get_xSPI_generic_register(input string reg_name, output svt_spi_types::serial_queue reg_val_serial,input bit enable_profile_2_0_mode);

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
  `vmm_typename(svt_spi_xSPI_jedec_top_register)
  `vmm_class_factory(svt_spi_xSPI_jedec_top_register)
`endif

endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
rk+wXehTIl/EuyHQEcGeBwJf4AG6a1+lj+8tUrI9N+kMRVRfKDoI9oAZKIQKEUuD
+bNrUjFLA/z/3OqxK7WvHQajvknnk/6iu2lcrm5n5dxpAAd/EO3TlC1TxaqZ+WEf
4YLzmfJOO+ybPjJy6l4N2wabGsjhEsE9xRI7r9lGmMuiKAaPnidfVQ==
//pragma protect end_key_block
//pragma protect digest_block
9p6N368LO9GAzsWKdRNyA9aW7iU=
//pragma protect end_digest_block
//pragma protect data_block
JjPyenYLKU6DyaC46YfyU2svE3jtVf/jCSgGMlPJUEQiJgMJpfDnSTXO2Ggyuop7
avNJSunfZ7j0fyPyOjMzdDwFGkp++AAoXOe5asnZa1LljJaCSN8zKuJIkKM+Csw6
ck7LZDAvr9aTOk8VEGmvtq9MEZTJQc+4unGiKvtwhqTq0NZqGWJhCUpFXX+Zll6H
sQku2HW1zty7lOdjxJtzJljahNr2jud6QmE0M3hJVlHNjqhqzZku5OVQsxR4DBO9
M2EAkEtgrfE9tqqGSFVMeSzrMqhNhUpQuMXn3sCkJmqX3UMinYhWuzcE+2j1HjRO
LZvfi26KXkKF2GT7yJboJPAgK18ZLE4X2R1N/RblHFeFOk8olafCCq5dW8ZDO+Bt
HfhRAe+Bu2ZRewRavPhiukwXYzSbc/Ju9L+EAF/AybhjvyvtfqPbkjotx4U6yNxe
QXy7Wgow72ks1kihmewNK3q16e8m80aeiP8FbemKm46lUsanF0slU/+ojURlmX+1
Wtp9/kACe184mZF2MeJIPwp1BGfeEJHExMc8+9dZKRSJBX5s12W/yAYchIhj8dfg
65/7vVvqsaYmYx3lx6HFQaQOioZ5bUGAwBoGd+YyjO52sr/NNowAKrIPLl5nO9CA
J7k/mynlK9Or4tCqZJADKeRsRp2sl91zHS59hxufGkzoSy/sWWwO9fKyoiRQUaPF
QwXiB9gXUpDfnJnZQLO6saVnXsHJBaqHIqgk2d3gdhl1wKeohhZWylPlQoahP8Rg
SZMuJldYBENqnzu9fLZXLsrOS42NuKmVsR0dDOlRJ1FXL9sbzUHzT6xoh2dDOEZl
4BFEQatYX5mwJe9w8Fm1pjZAxVh4ijjpsQpoyjK+5wWw3+it+cc1+kKvT1lyFB+V
3v6ijyDVcfhHdWvT5I+XEjRO1jc6iw8Ag9ih8ynCuTpAah3d28cwdilS9B4I6jto
CVC6Ms6XaWriHz3cmP9FvQhx36p+XLxjxE0Q1q3n0DE4z8nebtnn3w4yEqerl6M5
Xs9iuEEfcfSpFy+k70PoDw==
//pragma protect end_data_block
//pragma protect digest_block
Lq4xP0YBH7mvvl0KaMzENimMtig=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
IDh3jHEEERyl8XXszky7Ms8P3HpObZkJNkH0SpKkLphFGXKBlLzVlIP6EZWdM/3Q
28UrTlND6w6OBkpgtOPZ5qZEGOdNFMnkanXM30IUUQmu+kBD6cfQvmJBzhPuk8fw
urCkx439sou3ijhKey6++6QXvPCgrImB82hG9GAPkKwrsMoRKJJ91A==
//pragma protect end_key_block
//pragma protect digest_block
H0jlLyaqyRbRI0ErNIyq+oPmmpQ=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
XZQsd+2ELhIkW65wuml0d8DsI18=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_JEDEC_TOP_REGISTER_SV

