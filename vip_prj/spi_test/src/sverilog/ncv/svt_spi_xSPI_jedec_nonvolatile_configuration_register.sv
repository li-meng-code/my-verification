
`ifndef GUARD_SVT_SPI_xSPI_JEDEC_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_xSPI_JEDEC_NONVOLATILE_CONFIGURATION_REGISTER_SV
// =============================================================================
/**
 *  This is the SPI VIP xSPI JEDEC top class.
 */
class svt_spi_xSPI_jedec_nonvolatile_configuration_register extends svt_status;

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
pnilF4L/OIF3JYptX6N+jHqYne0GZcSchInUV+kLWvUr/h96mckAcg4QVINjMRY/
6BsgidOnFudZiwfgFH8C6WeOffdpX7z87kz6CDGWSPCCZQjfjqIlXTwTIYUghzMv
t2LkYryLt+uQDZ7P7QRJ0eTTfUB76XWBKzvOSUbaaQwIgZe11HqG1g==
//pragma protect end_key_block
//pragma protect digest_block
GRd9v5EqVVOwmTIx5UONPNHdKwE=
//pragma protect end_digest_block
//pragma protect data_block
n339sOmgA7rtp2LaYpLYXyMBKz8uRhpBiBh8jUPdDWkFdeFdWMwqJcwX/KxUrQMb
zDITjLRaqY7mjuhdVx+ClIxlOAj8QKcmNZd/CqgYV0+NoKyC1W6elgjcc7S4XSKl
EXexfDzPOC88JkKdCTztIKr+ffzTBdjCJXhFwEiymKK9j4tUgUod7Y7gq735hEfV
QCT1H31zkKf2nmpre776RI0FJyfaHNDRL/sv+w2KaywhRwhQ6IP3FkiBNLz3H7fT
FASXQmpO5ksbpnOyMI/KnatyiUzoFVWPvRq0zxjA+D+ZLzVI+UzIu77NQbR1pbmz
az6+k+3Skc9bMCzMpDmHbHAO7ZSvECtusrbwgzMmek0OfUyoLVM/dl9IrK1JLefF
Zo/IFeH8O+TZjEGvEU0UtlIfZqzGP1JbE+hysg64t3FtKlIV0bONYiQ3cqkECJZK
a68eD2rrjB8CWv7AljEz4SoScHKSZeg8F65pKbS70JNUvkEU2SL4rC2KP5byRcBq
gJ7KwMBWn8aT5UEKHdKmSqUtmi+c7Z5KNKtmui8Vej60T8VighDsVDOJOL8HFkgZ
xma0iSoCjrszlmM/wlxa8YURTqW+uRZ1QYe/5KQnGMCLOOOu9EryYVCST04dahtu
qe7CWH7mOjOa5WkzyRba1ZeEkE4zqEpDOVVwkkW8vmI=
//pragma protect end_data_block
//pragma protect digest_block
pDNy+MSy+Q5+ZNTs0lhGtD8NxlM=
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
  `svt_vmm_data_new(svt_spi_xSPI_jedec_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_xSPI_jedec_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_xSPI_jedec_nonvolatile_configuration_register)
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
QdWfmNrAeSIMRJb0t2VpXuc4tjs9NB0iuacBhAUsglA8nHEsyIiksCnDpnfGSGfo
ih/TPW1qLKzoSNIES1zrIDt8rB3P8g8uvaIHI72zPCN47UvqRa5+nAel6GsEx4Wk
Vp1oN8fQauIfTcRjd2TJVdwerWSEJ7CWnogyDc5cPsIRFKH5/HaL6A==
//pragma protect end_key_block
//pragma protect digest_block
62sfQy4WnHTgYuJCPqgp4tBzMT4=
//pragma protect end_digest_block
//pragma protect data_block
sYbbVZ4Jitqvuq27w0Xm+g8UNMnEDfTVGKKcMSMpWJJhElJH9/WfAaM376aOxdnt
8mrydQBfu+byAjbIN+qaT8l5QhQwFEp/sFdsSKkXH90BQZ6Izf0phXj80d8jxOAf
qbKJSHH7Zu75zRto4RXTQjFHHI2q30HlZGCmpL7Ldm7P9APiP8U3GuSeYk3MpxBN
dN1xi0wUVxNXRbVLw8hSbA2P7VFQloeZzJGeVWzI+7ua0rbyiPwW7ydZQXusnhLa
XcH8Ux3bYW+Q1lRExV0QveRORwzFQYYpNxyPOFs+tM7UzpwbUxJFkqbrHSROhdLM
Ehn2PyI61Vydh/80P98Mph4t70MeP/mZKv86gRbfNRvOYswGqrZUD9QWjbHZuhgi
E4jyUUbzTwdioH+ICiTYit2fKbH/rl0Yu1vmLDDfhtgcLUsBMIOT7pd429Wck9AX
+PulNuaS2Pbv3eLIJ133NJ1xPv6XBDK0Lqj3N1pvxxE=
//pragma protect end_data_block
//pragma protect digest_block
cMnG1vLMv1btey47vsAEKYtcNAw=
//pragma protect end_digest_block
//pragma protect end_protected
  `svt_data_member_end(svt_spi_xSPI_jedec_nonvolatile_configuration_register)

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
   * Allocates a new object of type svt_spi_xSPI_jedec_nonvolatile_configuration_register.
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
  `vmm_typename(svt_spi_xSPI_jedec_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_xSPI_jedec_nonvolatile_configuration_register)
`endif

endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
9ozBxP2+JvALKdTujm2qBaldv3Iyamcrf89h+uew5fKHWvHRvLyFE7vc71WHFFw9
TijC4q3VnDfAPB64MjM92iR3TAhpiNOqAACqViPqUPZ2aThNYgZYO1Cg6PFLkKcT
xttT4YJHcqXooJWpsaaTfiJeme8gM98ivaFIt4wBepm0fFIVdLryOw==
//pragma protect end_key_block
//pragma protect digest_block
F9kzTALGf/52n7rO7F+Kwl9pNms=
//pragma protect end_digest_block
//pragma protect data_block
tzc3ONgqCuRLJ7NPfuV1jYMWykrR4GJo/3E64L+jQeHPD5jCk8Z4jnZBAQaDuFKh
YA/kLGyM/NAQo4Y/N4cInls9r9RZW2fDrZHfHFxynWcQXAtrrC0eQOr3j4mQmiX4
NdjsOXo1HOyoj14xZ0AzwQSpjUkFYqzHh3/GWsEUlwUYkSFvyGL44ZEH8b+xJet4
46RTwAsV7QnBnbbuGoeLJ9qc4GTl6HFD5C68G4V1kcr6KgEnhszPjjlyxEQRrv2Z
8Hk0yJgs2titXOymmJDl8ua7nothB0ndSoxGeH3ESBccCrIwLyFaGyf8A6nqA5yA
dGKl7w26gWsWNWSWbTE8zJYR40DBD1AQeA4y7ASXRYvavZdA41LZ4me7CntV+Hpn
ArL6x42TbsyKlBnj+tE7yqGekIkJg5Ndt/bxtDs18ZVtkCCc1NtHmrpAyhSUAmuA
GYs7MjkMbq8oYRL9PZYEcsxBEp+BiQ7cqIUBmTBpfj2sguDYJD2ZMjmxBkuW2qtP
zv2P+drcdfqgHpJ0cpB/Pp0qX9uRnhh7fy0oixq8qAnNgHlzb6N+7VIO92oSC3VX
dzTU2lC0K5G5P3R8cLrqpggaGaskG336ljmpNfmRdDrcwzkl95aa6C9aSlqDnwLr
IPsJti5gGe4FqqhWYfZW+bHQe/K3GH04cnJ3XfirBSR/LmuR7X0/iRpLjk5jai3+
DmIeTQZNIZteua2P77nR8wAX6hyB2D/yojQ6rrWI6NFiQFUuJjg+74dwXquWRs4d
ecnZPHQum/GokZRGN3Nh7Heuok5EuVMVJiNuQbTQN1VUhoOZ3qQIsbE5ufTChjsa
l/ErcFyUqudJcpRGt6a5shfVjOxz2wgwb/9/qi6R13NZIP37mrwVzqlsDAi2axSR
eFpSMrI7/qqVfxNIiuXvaZ7jYOZypyP9QbfF4BU5k7v9cviAgRZcvAw4zz3xWP2l
DIEjcEIqYQWsP5lZcfzGapVKfkTe1cqr3b7kWyaQxPFmE4TJF1DzK55LGTREi2en
FuIphg3WYn6yN6uCX++ImnGaOw57OtlgpkYz8zS/tA+Ap2A2pd7hLp4v73aguZAp
jB4aZ7/xBc5UxEEpm4Hu1/untRnF3/P6J1bMpj+/DCsAczV/JM92+8jWw6lB3Q9u
8KJCpKMDdwxbauXvsAIHhw==
//pragma protect end_data_block
//pragma protect digest_block
JXWBSZy5l27aD40wsnm5h3YgmwI=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
DI3KdEEHYmACxvK8JfB6vreRev11vyW0lBi/3A7y8E5+DFQ7i3NFNeulqOjp7bBu
4jSuxiG8VTOnWpPwT8K/vv6Zs+dNckXv8MIzHhp754X9IVj7+rNAcLwc1P/wF4Du
H+2vpmlywcwlwORwJw66YUCzxm5r7x0I98+Mdp4rfLISQVJjzc+nsg==
//pragma protect end_key_block
//pragma protect digest_block
sopcNY9LEfgemG22+ArPCAt926Y=
//pragma protect end_digest_block
//pragma protect data_block
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
RWq1ifJM+4HqxVYLJqwgAT3/sC+5r5S16+Oe3zIZuUxHTacxri1tCwUXh7OgTqQH
6fpbL/LxzHxCtpkUudUCqzngTX17v4o5HMmYtjK+So25YT5R2Wlrty6JNL2zy2bB
Un7lRs12pwj9vJwFYkUyU1oTz3YKoSQdwNK/KlgmxPVuixnXMJ1r+XZ9Ykrt6sYH
+2EhVyqMCPtcJYkAyJCBh2wBw5X27GgM4j7D+z6BX3a56np6Qs/b2aVaGruY6P0j
PHqRTwvM38xPNnk4pEsvA4pdyA01v4vDVK8/GwL1RNTHDZmpeZInDpyph+BNg3OR
Ri95eiNNF/bwM1AQvTXGZgy1i+95LjrurV6CnFvNvLrVCMem2WDu2ZGr20vkr33W
mnebreGrlP+Bm/DzvmpFnv+9aguAPGsYzWSx3WlhBE3BmBo7fkMTmArK5owEwbkx
D47QgttZmAPfN/4MGCbGzY692sr5QGBbRYZh9dQ5O1S+nzpyhuNfR2k08MTT0IFA
6O8xdzFOdC4i0SQOwH+WuIcs2k/EhgtM89kkKwkXejvMZ4xsFzh/soEv+PIfHi0K
85kwZS6T88PmfykzcJadprqx1onaap3GfYCSoDLrnZwHCd+wiNO9Ryax2kB+9+zX
6Tx89sOluwuBbD/sMaIYSANBY3Sfozjj7s3xuEHHmTKfFULfv4IOOU77pi40uq47
XCRgbbxQjbXlqaW792dDHKSbjVM3QP9Q0s3E4KEEOEWn6sz5NNTMkEkYVj3+0yfm
pMRfVZDHUPYFALWQxYgUEV+9g/TCSqveUsssWjwKLzJMf/O47TpZnpN5mPIqqQ/0
SXSvgIMflcBqRtYQ4ILM+bCqx/lTKIwRh/2umOiPqln6CL61VuRN1zGmg8WQUOuv
XGlrNTnp/LK+rLR/z9F1FlFi/S3izFcm/3kMbXQtPL1RPu5ofY1LvNHoZuy6dyJE
e5aoo0rcYTL8eeUd9SWryX0tm12qQupGih35OtIgQb7CtjPrFcNY0AK9xR0oN80N
ZUdQ+FwpbP4XKHkMBMNAZXz4NNnchPCyvap+XuelcsLKxOwVKrGh/1oV2XkYEeqa
JpbZOC4NRuD0FI7O5LU5HdF/0c6gOgePRg4fSQDz48j3kKjUs2pI+p9cPXdQCJAS
3pGxsY9TY+stzCvlqrQyX24mq+4KMSxPd/rPdnAJfe+spfBqXHb5MHZDoF06rmLO
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

//pragma protect end_data_block
//pragma protect digest_block
kh8qM0OFtzpmGNuuB5QMg9Js9iQ=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_JEDEC_NONVOLATILE_CONFIGURATION_REGISTER_SV

