
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
WK0CX/3rt8MvElEyS7xMdfjWSlooNWdAPmzD9/ON2oQNCUw1NpzcsH9vceZghuqM
CT+8fHUIVrIPR5ufV5mTBJARUvsBT/izi+byuBV+7W/zV478r7mSND8y7Ri+RLut
zBwHoUsaExWhXDHgT9LQFkAcVTUCGZfMrY6IVOEZoGtBFx/X8F0X1w==
//pragma protect end_key_block
//pragma protect digest_block
2FV5HbqWoOto10KQbW4Ig/Sqzk8=
//pragma protect end_digest_block
//pragma protect data_block
PZorcYGNhVPtxcwhLGqlOw57OwmLxX7Fnm6ellN7EtaEfxMNoNrEpkfxBVVZ1nHI
NNqPF9QH2Wd04Aj1eHyEwhwxEiKzxJxD2xuxKAfyholKYRO2S8k9/guAAeMWlNOg
AzUMxdPuEBVZDh+pooFTeZWaQE3hiXva94tdmqx8+/EAwr1I8j5Ivrf/1ZRDC3qZ
4SobLTGWxSOALMgCOvWX2QPc3yHAXEbPUNKUGptSb1nt1BTwNIdcP3MUGJSaVYmf
R+MkqdAEFBeOz8daAzK8DQV23ZQIbWMoBLsL8pp7Xo4KaIhkqvZcDSwIacQtluLF
EoHLqfglt82EP1bblUbvjglE9hLqe8iBSrMChFlZjx/d/L08jcKj7YMWyKjs4UO7
yCUUHqpOiRkvjlQyy+XGPZLXuTCiMoMiDy6H89DdB4WwLqEAZSiXtDBBgX5fVh6V
uEHdBVU0LEDnhoUzhrri483UPJprJOfglu4sM+NkcZsv9QseQsqp4ZVid+kcs/K2
xJhaQAidAVudBmKUrIwh3h6YNDZ7RDeVvRL2OLT5dlTy40mq6FucIari1uTY7lHJ
3o/5JqjTf90kZol7rAO7JGGv1TIgqvDq+hiLe7zwEZfqtpJtYXdL+bn0FmMonP11
Ri2g6AIZ+1J32Igd46ySeU6GhSoKFgiUtijwNFr0swc=
//pragma protect end_data_block
//pragma protect digest_block
pz/u8Vbw6lvvNNDujuop7UQkUCg=
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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
sJlvZrDiAxrDCcKGKUjPrvNem6QytLrxIQBRjyXvZg9A4F90EiegBcTen4XcVTfp
c+MFGSgwmI+vKL/6TLkCxYMdRE3agfNWikCrwnEMUnh3pUvjPJzd7biuOZaKgPIw
Ol6nJRf+ZEAqoIKjj5ELp1rlbqlJcUJoKM4fwyFOl8BEvAATYxzawg==
//pragma protect end_key_block
//pragma protect digest_block
BGE24fJfTLEWC1/TFjusC0UwU7E=
//pragma protect end_digest_block
//pragma protect data_block
L4wBY5VOuT41nre9Vd5w6DMh39m11RDYfQBMJRCO19oc85KfHSEcLjtGdX9vXJGR
0Zyr/DhZcPr1E7uVzikcAMfoXWE2kJq0tuMp4QUCBeIP0gPjlqFhkWFaKLKinwob
b4EXm+INkUnmcc0MG4QMBG9olJW2B3V4Ee0UlGsUu8b+9Z0gAOJaM0iYlw3J16Up
TMAOw+mTvrvCXVc0qDD8ntJAlYG+KCGY6BDwuo0LeiFthbOK0omDD/Zr6NXy1IUS
E2VRKlH+ZzhTE8vEVHauFR196xeVLKfKjzK5NoN1sCGyQHD1yzier1DQA1kvtJ63
zguJP9xjKslDgodRYZB4+/EH+yQ4yx4pbS8Tqcr50Ee9JHlZOnYDn7TPuoS4jqe0
GV/l2C/KZbLgRduF6pSu9vffyKzAXeW9U3X+F6Jdpz/8WtHhhD8Kqf97lPzSVG/n
X3P7cy/YM1iIfk1pjspnbJ939ixk+fv59lT/AdwWww8=
//pragma protect end_data_block
//pragma protect digest_block
QJBwUP1ZtnAv8dc8+v+HAZP6gKE=
//pragma protect end_digest_block
//pragma protect end_protected
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
bFwYUuK54VKNOrnbSvZkuy00dybnqDVfLZlAb1bn7b/inGmcX8a2ENHreRSOR5bJ
kEZbrfHqPS8omSfpKV4RMPsPXrxYaIx6DoZv3nb1uIoRfw8sOS9tegOlLR8DVy1v
6Bda5G29zrZ1fgLx4Kl49fTc3gboaUdJ0pBvPCiFLbIl6yT9+zmUYA==
//pragma protect end_key_block
//pragma protect digest_block
Tzxn3kl8VJAeb7yAC03s20H/i6k=
//pragma protect end_digest_block
//pragma protect data_block
xjzy9a6DbHSwdnqa2AHSRoQjqXKsDSyGsXOp+YX7aYtYYg4SK3xjHkQDxixrTKHn
XjeQWmEpdP7KjHEiIYBQDY+bmTZ61MkegfvrC6vuOfcQTzCOEowGSETvuBQr9gfy
BDrmgNzy29FCAID3HPvAmDkt+sh3HryTzKS9OnozVn5xrzgYlu/V+H5qwdfqX0KR
gNeUJxOy6mgMV87zKJ0piPL7Dsuz6V2TL56Kjes2dd5HGz/ylYsBZ1e36TPEG+0U
LrADRZe07YNk5qsYuh1xVIcDekUf80P6oOrEaAWXQI+4EZeGgoyzD92+Mk7AKQ+0
npWvvGbKubVr6nzbz8lQegOAvYHAawudlzdyBxwIasy3niNHpTTltUWR0CNeKXNL
pk39FfLO8jmclc9DMCWzvGLNBFQQlSK3YmNXqE65koQYNauPYMvyI1n2oOfe6FvD
f7Tzhkx2FXRNeE8Ld7eC5ypZYGQahCaBSwOqs0xOuSjnQIyUnO2XcMFmbdIv8Cvj
yDy3jXnotYYCB/a+JevxPmqJhS/5TZ0Y8CiE2bJLHiND4usdniG5RYzilw2+sxsI
catI8Zyg+HqyJb+CwFmS4ZL1cyX9A5q5t8UzBpHEV77RDrAJIdH7kOp81lRy/WmJ
VHodf937WC7ng7YaTFq7s5yxucKxjkoUgB3WQHuBT3pU9hKnrhxNQ/joaIBQaGot
tZgr/LDewT/mGyebjrTauheGZwb4iiuTKEAS/RL4S+e2kBvNLkcspAEQZ3q99dxu
y4NHf/oT9yY8TSCNl27YVVJgACAOy0bEG9zbXI4TTx5bGR9C3iQgMlaRiGwBje4H
9tp1UWeDP1YaNWfIHfzYgR4wzQAOw9fECmsv6POH26Bsr5mlvpZksSZHBdtjA28s
bv1zYjNo44agkMV92NT3MpVIemFoJ213KV5MBuTLWNaxtJQR+dDMm0Y6nIcnmpZp
4pGe2pOQvdjMi/b1DBigOVzJaxPmwWtEvKXXF1oKfePBQ7hFTm+6s+T1EMqvVFi9
StdtKy67rYycvJ0f8lwuXv8H54Xqpu0bA7N+yzwULMh5ecxqcfk6VwYCk89bA4F8
ZfHvYsLRdTlqLDATSKjKznJPo1WCkNwrbdgDuqgFLB8igLE2+YVPf6Gb4BgQDLa1
b7Qy/tj3+RVNrNE2YNSecbN5t6E/1RmxNlHbj0XxOvk=
//pragma protect end_data_block
//pragma protect digest_block
FHV+CE54Q3VeV1Ujj/H1ixlXWTM=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
2F8oh1jb1KAMC6S0h6VDqN8ta7L0jBlUIfFZuOGL/HyabIhlz7Cf2Ni/gC/FaOZ7
qHwXlLGoqCM81TVpokpCwQVUPmWLTD8alnbBQJ4NQaEJd6Fu20l3KojsQi+gDHAl
9Xe2hxgttzZQPokV5qvRPU/T1063dmoV0a7XG/CrGRPIKtMUuxKpvw==
//pragma protect end_key_block
//pragma protect digest_block
35OmldNuHlUUfTWPHQYr2c15u8Y=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
W38CAr3j6bg51P8n45o8VNqrZ7E=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_SPANSION_NONVOLATILE_CONFIGURATION_REGISTER_SV

