
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
hJSXuHiQhARx1bhTZDQaRb5meRaSkZzgA/shPZWOsXpnMYeT2Mzlim1hWwsRDWLU
8LMbYQ6fzTXK0YbQhajz2ZupeZJLy1eadjSP8Jl7s6dyMQLc9Py5YpdzzwwKDify
PUvG50OfMnNyJSWs5wbxhaHm/LBKB3U/ciTu+InnNkj55k7+tkhSMw==
//pragma protect end_key_block
//pragma protect digest_block
PhsTzuavxr4p9OFjt5tddcP1wH8=
//pragma protect end_digest_block
//pragma protect data_block
Izvq98XiyfSNee0npxmEMfnIf4SPEsfclAx2qbMbS8Sdo1UQrKovZBqcr1miL1VP
vP91eQvRH012Oe7csE7b3+yzQ2kKlcd+nO3mYBY9azp5gARfIDmX8dh2OOgWJr6h
92hErzMoTjZJzj3QOprqMEVsDHMrvq5nAhHrLf8ErZZG7wZiuXYKLfWRqosBaWKO
Iak89VHThGuDEMOoxMCf2K3Jso4xW+0K2m9Hmi27X1y4y1v0zp3rSimPy7kwAIAt
q06NzvoDrXmdpTdYYDR5Fa2VveQUhVz12X2CzP6TwasWL5gV5Tvpldngx1gsuOaX
ATtUR9cgoeTUdickYjHrWeXJUpjRciTb6n7bl6DnIYyFv+HsBhFZbTtHODk8iHVp
QN+kw+iSJHr37YhQfBbZ4NuIULW+N+HBEDQtIo+a0Zdii7U9wpRnHtQwwQ+CVeYF
9N1HuqtvmkTyrDiQp4EJwWhFKxsOa75XMu6eNxvX6sGLLOZKYRmMjIYlN+MA1cfd
Mws0WstjSgavzWikqgboIs+IM+AUgBPzSSduqfr12RkKrFMkC53VqqPdyzkb2jzV
NZgEzfvNMZWt5cZ25cRIH2O3ETOsoTadyQgvGlFa2qEUEDgtFJ3m/CLLQphRIDYu
vmM3Tlat5AsWkiUv9JF+YGJJ0vJ5vgQqX2VDEnh3FA4=
//pragma protect end_data_block
//pragma protect digest_block
34MoI3XAsOWWd0+Q64aWqgXJofc=
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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Oj3N07Q3H69BTrMkqu53452Yt5wW/DD0pgNp1MZ2TSLZwi4FUDxMBVq/E5w+16TV
lxj3fyOBXXwp0eJ85/OK4qSOxW01AEXbu23iuAr+v+Z9d6CA0cbJI4YJm57Svpgl
8/wEXbGwSAf2PptfAxKKorNwCdV3nzJy4ueoCYlS3Qw6z29AMtns1Q==
//pragma protect end_key_block
//pragma protect digest_block
kDWN9JNsYyRykPAgju/c5Ql3AgY=
//pragma protect end_digest_block
//pragma protect data_block
NMCGSNf7Obn8hqH9OMWdqp/ITX289QMiMpI1OenDdmH71nVMbN7LJ3PDqlajJWgb
vIo1R/wK9AC8enbJTl9WV/qs4bZRfy0yRJ558srxDkT9Gm5Ox1zJLChtj61Djn3M
rv5gakhdf0yUDm6TRBoyUGBPD3AqXB29kMfZnzFQsIQNvZSvKtvBo1D281AksHLi
KcUv+lie8vEx6FE6NsHMjFJjmJHaLElmsuf0u//pEDCJ6X659NAKTy6JxVKJQFIi
RrdL+CqDKzKweNCdWvC3ywD8f1G6wNUJez3TqZKZsTf5gcb7TSWVHaFxuHKee45c
ryJqBubQPzWq6qu1EAddBi0b8jUuCcBPTiiNLLZNmNQRQI/RBmeN9UsvpI2+h5jx
sjmx3IV5VVDWT5VAvjKMG4vPkcJMrk995QT7FSbwnHOaIvGC2+6pQl8+Yj+aOG7f
KNOpNazwHxW9M8djkx1fqI5RimKZf9dImI6HHHtz1j8=
//pragma protect end_data_block
//pragma protect digest_block
BXaPmLOssbCiSjF9RPkZ0zD7TWs=
//pragma protect end_digest_block
//pragma protect end_protected
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
jkWewI3G0M63c4YPWyo2eYTL8Bf/Vx+CoQHBqMviw+EIq6WLye9dhrDDOBCup64q
AaOrQSEVeUhFKayV8Wpn9l59zTIMn+2ONjUOobhMxbDUlQJnD38uBKIbgT/5ClZB
c4sfh6wNbYKm4kJeIf4a06H6Flm4AM//9A9tHxLPhnCVIwt5iEybYA==
//pragma protect end_key_block
//pragma protect digest_block
vqEh11QuEMeYV0zJdiqZhNmVZ4M=
//pragma protect end_digest_block
//pragma protect data_block
q0obOQIgpa0yENBPRfRINp79ZbHW4mrzW3BkuGZqdjYGS1fjiOLTkKxnQJB65xFM
DI1R0OwQMRg+xzl+OWPzLaXtDSVX+GOQAN94+f6pOicz0q+dfr3xwEXHnjaGy538
pB2xsWhO+gEslgB8/Bkx/BzYe2NXQc5qvrFVXnJSw8uMozDzThSGkH9Vain2A00w
Zc90E4HxgpFkq41So0RHanfWE3tREKS75cvYZ0wewrF2cY94ipbz+JfbyG1GZ6Tk
bbebALy3mM+YKfDxtv6pz18xrV7pN1ovYTioNKH0MuoiIevgLldYQmmxrvctzLPH
4YpP+ICbOFERL3mRjRmsXLO9mnnKVGzFrsOHh41Yvyc59vJaSFmWbME6dlPIw7HZ
wuFHKGSe3Vb+8YFcd4rkBB+kvg7nSjV6jWDCTR/oNqDY2frapNVEw5fbrjivS4SY
cusSPGeByNgIiRNIx85k9tgiINC7CBdzJV9EjJI1pbVD3fhALhAJi5ir0yGJ20DE
qpUMzIDMzLGGdQRmcjQXrLo9RavQ+CJ3o4HElJOu2ChbO/Y3evw3lFRchynFode0
u5zU4W821QSoE0HffeZsAVtIQfBZKhFC/+jWnyVE0QQ8edurdUwIA/Ji1gjYvERf
wEvMnNcQtYJT6QJ2y9TMpyZnk3sNwq5MmksnwdqZ/w3Fbuj/o9DDKdlTo15YctfI
IrUyFBdzSGAYeVPG3Vu+e0O0KjG+ppO6Pi0F7tLm16fl8MwwcMzcDE69TcRvAVWJ
h+xCoeEYUYsZgkqX9213f74mMlqhES+54WTzjnlXKggOIUIplMVMR3SQVEipolUT
ce28FF7tv0gj1n/FqrU2C2I8XsqNCpHx/0i1DBzYg4CiytEjLNAsiRdy/gLsIQIk
VxL6Gwreb3zpmH6IXn1G0szVmm93PjEXGUr5ydDhc9YeaqKq2h59NkuVhW49LPFs
J5B2ETmyE+FcnjDkj5i1h3Mz15OAq+QFAz0bTzF35TqByH6vJpGJehTKK2XdDS5z
dN7vwf1tYLlNGSkqPph1E1GZOLL0520UIWhFVz/PcVaR4+rqv2PMyx9vM8tXcO+c
919LmnV38P5v5Eqzq7NdTdrsMnBH4L9N8RaxxeqN6UyOHdRKg+PMac/sjqEvi7/s
pc3pg+r5p/fnwzLPKqXacw==
//pragma protect end_data_block
//pragma protect digest_block
Wlf5M/IreLGe1DlaGHAGmKkFDxs=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
R6EFU+ukuBro8tt3L5MXSccvMZuNR68MBRSV/Mg+JqkdKftT3QMhjI/AMpEJcUyA
bTBuzN3+Q/DAXAl/Vpdy4yRcnN8DirAd2ALd5k5KHamkYt4mNY8v4vFbl7pyfFi9
3lZIeq/LrWC9SJhSV2u+xzFg3WiZFhaJPee7qTAR14TQpfduXV5vUQ==
//pragma protect end_key_block
//pragma protect digest_block
gvXi+wYKcVh3LbRweWLVK8az8Ss=
//pragma protect end_digest_block
//pragma protect data_block
k1yZ/JKYH6hGQlvYxpKYwnDWlL+BRyHVTg4GwWxRnxQmJ57TF45z2UwkCc6SrzfR
DQIC7w4Qj6TqrIGvMMYrTDi4EJD7TNRmy6kKvEipwlTLVMrTFScIWzM0+rEuZzcI
dhhVOKY5xpe76RHiLyShesRgkFolQ0d6/L5uQWbb68fRWm6wyj8ispZctdDFW9lv
/62E9ruJIZCqM30vfD/YerkT2GVhUcSRsFwB6Ja92BHi1s2Naglo2w+AOm2SGl2n
wKQ7b2dg2kfM9EV0iLaPcTomlalsIb9qRMHQghwlUArcS2c2Sg7ejnLLYaugya8Z
Li8JMDsopkgizbS2081dkeZgj2liFBejHnXoIhEMsi6oniWgW28io0AxCwIEiDj2
2GBj8YmfsaPJy/dYJK5Apc+2bPH4zw6BkkmKTfsDSbhwdx07nEQS8lG3cLsUmTVe
gNZnQ/KpPMKkFESgZUpULqoez8TPoezn3w8QWr3qWF6r93yg8iQaNNOwi+hABvjC
R+pUl8gB7YtUqwQhTFUp4IoL7G6VDxb83LNZ3+DD9k8Begg4YxLLsuFOvO480kRu
K/CwXXCSzNQZ36Fa+yY8hNPryiMNR5M6zsdaQMHsgwgITborm/sG3YKaiR1+qVOV
He0YXCnorLxF64/E4pAijsybpOElWkNwUWcsgVnaFIb9Q8uLoZhW14CE+Z5ioxZ/
EhP/Ym9AeHpSVX27/NaB/Vlmj6Ne+XUqyNGK1k1vDgSmTbawXL2lxy62INnGJi/B
MVXKu7pjKuLjvpWFh6CkPObJ4PJiTzk5C2Gnl94rqPnJZNgCv4KeLLf2FLbSAdfX
rLH7/d6QoSTZJP10oCnch5OfnkdvNXsaZA02DNM+fGW5XTNsnNdYjHcl4Ywm+0MN
YefS8dFprQNgX2eJc64ZOfcE/PuR7fFiVXC4HiCJGdTqmMBlY2pgS7O3X4htsOO8
gxnlotsyZFnubYeF7nG0XSXbV4aJaDMtpb2dz+hQaVLeICf+UI7raYYTBGjG34hX
8NGkn+dXlQfdbpaw06SnYAxwVJJoKuwK68tvkfd5oBakIwT+R5A/x+bEcZYj5lSM
P1Qy5JSSxp2gIzOfQdgbRkX4Ds5359JDG/jzOHWZAzGYGoaX9bAKkeLeYsEHB+tB
GVsdf7p/1US63YBLvfwjo5d8elNVIafuU9+HBpiybHwfWIy4062Zaz7EoiE8Hu+4
yZroczajzVjMal63plBcKloZLCsiHNnxsAVV7LHqZc2eXcCRmdUco97WCAKACvNS
HDtr7zAi0CYfVZFJ8CbOMkf6EOGoDhLQq9KmJusGkjlycV16alS/iiW8f3zaSnd8
1tJ+vv+c+JM9hKp7x9K2c6azlVyaZj/PMBMapNr5C/DBjJOMhsWfWCjH5oo6epWt
ru2SB0+CH3lx51e+NiR5UdrDw2k4Tsi1IAAIrMRey5KTR5LPlpMMlFax8sbl69v9
m//DBFXRzW1N/iEYC8TJpqLkOgjsHCM2KV+r/2pxPVfAhxSBgDGUU8jacYlzauIM
8mNOZDbvS0jtctLrE160XJ2bh5xwAMkl4tidsWuH+9ZBdAIaxayc/ZFht3Sw5wAB
Xdu55owjLrwRVid2D0pWsMy1ibAyrY3w5h/qDJi9aKETu4ZJbKGXYibZe4MQfGw9
xGZDnEHxKWT9GLV6vlBPGTuNY0rmRpuycdgO5C4A67OqZVXL5nnt4SzL8SJi3lna
I7aYilAc6hMRQnw0s/5qy0Gpyxbn18oUDOI8DlLJ2XG5UDBiUlIvbCq2gRwmrkFN
Zp3015fMBxiuU+5gpRI3IPxtiQgL3PzF9/N3SlBsFMll4Yv5ckUumcuwnKsV4Pvp
mPyll4A/QLb54AneawRIkchbaY1HSUDNfXHBOcGsw8qAjxzyXR1Uqj8KI0QNliGm
3b4fUqF+zEi9WwspHWuQdS4U9zpZ7x//6JU1h9cvPCSOLx+JHLulNYc/r55I82wx
gORZksgCh50iO3BeHwHp12V0K90cJqrUfmttYUBbNKqFBD3736I8k01THu1Fh+oq
vpxQTb1rDhFLMPuxCkrL2qEtq/SVFL4HUfZdUpA+Ou0ZzvKIOMQnVlcQGaCX/3Jj
FWtOn1mGPr2MbSEBzOuISbAU8KMUA4T0mGyERCqcYe0fcKKwDV19Jf5gaVnbHSg+
7BGGYqZtAhyBUK2nv9EBaTZ43sFzX11gUG4c5Q2/p/+Z09gpeQMN6Z70MTzuWAHW
BDAvEof0aXhK18a2qdKjQtDzNs4r0vN1wHGwxCBiNeYf8HollsMxnZEDtI5dy41a
UkCT+inSFDKclqILwTSRYeR6qWScqzvAAwTgZLF9OP94tMvs7N0Cw0OVs+TtaQoM
k2ManSisznvq1yrROpP+WVvAzIsROedQU2cvPC5Z2UCVY5GONDtlaXSBr2IJfUvR
ehH4UjVH+iLa0RrmG+RIeyMJumbaHOcLRsPnBBV6ZEvZK+qbWH0e5mxGsdtkHuj7
bKVTxJj0LOQkjCSaxD1CEPaJVr2raec5PiCSnsmQ6GXeh6YtAU6M426nd+qDiVXO
3BhAC763+Lr8J2EPQc03xLOrlWtTB9aAjxsX72h4oiD4NQZ+XZ/axjNdGGIW4hZZ
gj8SYxdkiUZF5qksYE3H/hh6er5bLW7Qr4fE7etls1bU+7Q6zbg+ALs1UmiJcFak
N52R8P+Of956x8W8kJ7dFg/rRVrPTmH1xV8P3m3g53SxfPBIlOiaVsNypa8Csrhf
CtWzWe2fbESfBTgBlvClxnsuvLW3MrFRLmrx99+6MMlP3Wmq6kGE+yKOFpG7iZV/
y+DUPd9D8n80awaXe4Og7E/md+WN7BFum7rEWMPnkMQsJJcDKWPsASstiqbqDFGm
TTD+ph3CzkVcqz6gQ5wlNlWVuPuTl65TX5OWrimJ7XPcMlwN6jqt+kxsJKTorxDK
774OBYHFSvJusPLdPyi4jSvZJMrBQTgXRXlI87vOw/B6lVRnB/6cXJlqFnk4ea30
ZRA1xsnSz4E7XM+BHKVgWKpEsGakqy0ZlKnWndP2fiROMUf7Cn3hzAaooQ0idKTo
f+jQ+EFtjYw5QEXy+H5xe5jayubvMBNpVxcKoG/1S3ey7If5eusdwyrO53a3NqZg
yQXFQa1hOIiYtEM8RP3VJK71PCJn5m5txdfgsjn/S0ZpjeaJx1MCivuw8JtaryU4
ob1F5xFZ2N5PXeXu1Y56Y4JyP9hOlMfipwPzkkt6MHb2fXu+OKWFHl9laC5akjrx
dw42GEm3KtyrIeRWxbAxeDEqc+gSk2K4YC/v6QdwGUEM6EtpQbrrP3KXVYyax6/P
QQKggn9d6CFynCwRjbIVAEtoNVod9DVsNmimTsu3SNbYBavD0MF0j6CxTcKXQc+W
0Ed8HERwgvCWHMQXiJfiA1Mat8NSrXIvLudso/pwFZndOkx3Ig0Zsi8najVJMtGb
Uv5hUYblR5mvQpBdcUb78cAUyjm/POlZVTSOcoAYVzSnfaKm5XWNWMTmqBZxTcEH
WTC9f0uQLVVPv2Rvu8p2d1wexM0toEuoOvzm6hB24H/GHM4LfTlDLOJ9Y8hY5GC1
06qsnyATEoYkJGZX6xDn5Ob11GQVAkXchzAw/RoSnTvcI1tarzUnBE0ZWBe+ef8o
QsDgk6oHGiBYvLkTGxn8JeSk5uWkmO6CiAMUPZCAogivSMdraisW0pkZJyM9EJ+g
yuVnjex9PCWcaYwktO0fA7f+OWc7YlKLnabahbnmZfjdvdDjGTebwpN0m1hUDK4q
MMdD5hT+4fPsKyUhrO6xpUCY/OYb5Jvq3UuqsX4HPK8Ez/Y5FbUns3iHirvEh+dw
QrDQbAbDbbNerCNTMVVmIvEOKSD93NqrPWv6E7RFDj4yfFfnMeH2vYIRAD3cNBvJ
rkh4KiPQW10a7A2wLbpUa0wrdZTBfqeLVnlLNPYjCAuQLqa96ynKjrS9dpYViga9
o6hfsx0hkzx7G3tdJsZrB4yNsR0mRvyXHO1Q4fJel2v9bQffLf+QGIrgQLzQI7bF
P4+Mnh/Lz5tMnw/Dr9Xho5sFnj2sU7r7lAcPdBdewP0LVYQ/ZgZ6q3ySLsD6W19q
Iyt7sWyZlc9wkQA6+bexqS8ctFsl2Dc+Lbs2bbnT7NDc8c4MaLi/gh5HsRejxzNE
mG5usV8UVbvKdJWC8Grzvn7VUNf/GHSfMo6Hl73k5/NsdnGUq8pvpX8qwEOg1BZq
a4cZZX7Uzi3zjjabxcggl8FFWrl+ZX2f7LXdzGOy7WmHN7mXPxBvw6EWkVAetNSC
rvTeEm/M7HqMNfKZceAXjfXw4ieNMERFOqRYuwdHTWdFOUKi7XaQ30R0VrJkbSfQ
YoF/vP2zbJTXXmBAireZrlAViCKNOfQsRoEqywEax+lvjzbr4n5ptMiHAE3i4LJY
nb7UfXkpIJGJV6g56qB+zFR1HL6FEt9FbfdJSz3VI1y1XR69Smsuh7dn8eYeElyq
lY0ZPcJLUpfbmrkYN6rFBhr94pTnJ4IgflOvBVKwu9AFELOuFf+5ojNW4nNsF4rq
/G1qHgueZDWDQUYndtqEeRaAQ0GQ1rcayEZYeSpCHRpcPIwW64z2x6I4kc0+AZwO
iQ6ui001gnmNu1hzWFqtTcIJq94oRFPrt7reQS98f3XN2hsNI0eAAldUzd9cVq69
4vpryp34S5DXoJJA5nPrFiJquiRKo+2s2klkI6LbksQ7Za333GDnilQhFApaswND
k4OB+Tfh8C7LLTP0XRzQhVfZ9XOeyVGwPBJ89a11RnUlZLqmuFlU5m6ZCwC+jYA6
EIH06Ok5Mx7UzELl6kQ/E969n1jlsNrPoSOKoC0dV12mD0BoMQ4CEIOisFTZ9Jhu
VJt+rbzzJNGQWBFoAltk685i31GzawQugU1L3doCkQ25vtk0LvJgLK1++0p4rV1J
GTQT1Ch91qtEo1n8RfBcRzfn8cLLVdwVkkEu1SFV/dCbw/ZOjZ2x0C/z6qr9ILbV
/Ai+7Yt/0voWAExdU+ux+xIzqZgIP2PJMC6he9yoqM85/fVEILLhJYPcFpVDRIK7
yFw/Eur7q8fKyILTCpNwtsODEOmmJ8fmYd23jZIBJShbt6UuxV8CMCFm0Db+EmGw
6eufI9BauaMxJibJe/C3ri2kkKr6O8yQ1/abMJPjH3RYhW4I6Rx0Ceb+N6Nll6Es
2L/xL4zZ9bigBils75X0GrT1huT80iZ0kKbuAuinFQ77T+qwUHYEkfPBd6yFli+2
905b/+ltxQLzfjxqzIjznqeQDCrKjhB8hikiVitgpXdST6zuHEA6ltupTjDqvT1w
GZPKLeiBAoigQ6DVcJoc66Ncq5inT91+E6ndTUpM+D7BGjsmzCSUQKGqRFyudSmh
IbS+m1PaGxs9D2oI1tn/Ouv6D2KeMy13njkeweF9geZK1kdFEdGx4FR5vlvMwZ+t
YWk00x9fu3mxkvQbEyJokpfoWZ9CXBE49k0gb4wckfthKY97igMZzeUnlfeoBywY
R37e3+FsumoqxVbQyg3Rwu7Kw1XemST28PeJkMyikcDvsdYEUR9mOxwo8hXXUS1R
13RKT5uWr/2oOLVwVcJZ6Whl2gVJa59JEu1a1sK0g0uQ+skb1QonNpV0YngdVWjZ
5vfWyXgnZVKsP0KUq8k1/IYLStGGOre8iJuvs7iu3kcin82bf+rjx/UWgm4ty7Xi
Hy1K9ldcL1h/Q+dT7cYIKTvoId6QZfJMCQQkM37j1fb4GoWBJAsjdgTUlCxPLM29
ODJ+1I1BM7oI933CnNXPJtaaUtkx1btBt3O8ND1nCMKd0rw2ML/AA6I+H3lfbNTg
IvtD2T1EBiLfXPtfTtW0HNCzjvpmx/e73iEgNBY6teTboHRjgylmz4I0Be5IIx0Y
wNAe5FrawtibiXIKXaMhsyDO4BPVQryrcQEyQUcLBGd7LzAh/XXYhbgyxILrUv2H
G0qTJNr+MhfqzP3kuwUekrQpoL5yLFnfef+dGfExYLMtBWb1BH3LDmSHxZ3RJaxo
3Ich/M2xEAlqtrr7m1kFq/SXaKJHxjSGz8ia6aiXjZFekWLJu3l43BHCk45HIbqt
+ouj9SxMUsbA3Hbz217LzeBfXlpu1hpy5LOddduHkWzRzR+GZs+SU5KsPWMkXahr
s3s812PYisSDcAcwTzLC0lixMILgY5tSepJCtxgXXptg2bCqadiseMnNiaMQEOZv
SGsuMEbRKWiKCosLbNsxmqN7QqmqGEIRYavc7SMS3Q1vnrYrA/arJ4WDo5aaKesn
VpN66CIGQWRiIWd5u9x87DBcqACAA29AoB1L4qE9VURQDyvLhGmwHKcchAJtKGhN
+ehuSHwxAohyUkNK3BvKK1FKp5+gm6ufQZhSny/MNrhSscd1WjRbxK2PDzRfJMyo
HUS9gR3ZdLHOXbBfcXXWx7JkMYdMOd/F6+JIqCThpjdbc0HH25Nv4DWSnw2DFJl8
frsVOMQM0WWvftTJ+7aBXc14A0eRp3ugEujHo0kdKkc9JenXWs+rwg/EF6HvZ1fa
AqZhWTwf0heLgJnQoKttZFk3zO15xV7u5Qick5oTLgME0SxVgOIpMhM6OFpsKEfv
M8+YEGjwQq7tPvIemjV4aibuAeB/Zu/TUvtAKIakpaU8+eZq/JoKg0gTzZe7rmWH
9ARQCaejgCjaG54xUjld7XeuQvUFdBfShglGewlgoDMS2RW5X4EUs952uBqdyqGU
kue8jeyFnN7/JyiQCqtuRX7b4MZlPRpGoaoPqgKeVl1LMfRR+AjMyk8flJ3ZAoQi
AylWfLk/mcNDeW5UuDsTMklUe/IG3bwSBKZ1B7NgqnIDtuq/OAiWhOcCwX1b0RI4
NQagG/IrU/gYV0X+VybioecQ2+29bhgEmpvoyrqW5KsWmKUrVByLytzexZwaoMM7
AzjGT5IbK994VEY0AeU6/l0lURa+vvUYsola9dFI1h/5Sqo6WAIfT2dyEtLuIHtx
ieaO0sN38ifmKm3HaTSJLeXI2iyzkakr7vmx/f+o2eZQXJ5mgg8r0TZEEN5RWJDg
7wIXM69gEYa2Nct7R0kz1zUyV0WOLhhwUvyA6eQFCBG9wGeZhU+uYjjBmWVIxnyg
8jIfOfROl0haI5vPYLy4cxBBSNj1t+geW8fKUSyiECLVIkWyI+lSe6U9DxCsHdoc
637A4hPXECEZQInRGBLoEc1RAVZ80aHKZII4NXy8SOfnkc8FCPj4KcnH3Lwvl/Y+
qG+vUIYWW+5qXJ6JnZ6avsv1odbwFV+vajnQ5WEPdXjxeU6xhrLTtw12quMcQss6
E9s2i4OX3fMzJFyKHub17hH99LsiuBHunTim1uEc9QSMFstAQRhf/4pPD1YbzqYp
kiGJlMKzbEBudJ+hIsIWf1xh+whHjlx/nYfGYQO+2nV6gCLGs74tH2Ery3GQcTPZ
W39KiBw8I/ViKRJa6s60xVWZONkHEgDyVFpYIshFgjRhTy7NAi9HfgIp7ei6sKTD
XsA/DCW0TV2cUF7lQbezb2rt6zhQtIbQRDcGxECKPUeId5aw4Dyy8SfsRcSrGZE3
hlXWMj65IzaZNDpOs5Pm1oWuZDzhBbUbQTh7Xn96emues8zgpJv24Ktc2hFnoCia
IPfRQMzlNAmMw4cVtoVmucQMPXUHEh+xUSvtQAyh0KWKh1omMKPt0iBjj0M1UJIy
HVE1oZRNUKyFCAoW4vnX5tRYPfAgJyLDidCxjRHbxiaSGsg5TrTRUV1VOiXuT1f+
kAScpZzemA4hguFRvTQzaLAwgiFhJyLV5TGqIFFyLRHASdDI0BHlPd+6tj3sXVFr
qUXtSydlqvlhQNJdW7otOc19NOligHqb+9UfTeZ3LOju9GsaHXxxBwHvZ6VrldfI
31rCk4508K4Qtnn2IJLIKZkXkbZZbaHvI0WJwwan42NLyDvSGcT/t0TCZmOHokzl
mGCLWyBs6SiAcenzZhnsH3EMATVp9mLDmyBdkVoFrHRicqkJP96lxSgkVauDK9Wk
at/6CtMTz2JVTxBzoFOSkvmw0TEL6OJbLA/WR8rux5Tfs4iZZnJa7lFrf8c7UPE3
hFG3DjHFmK5BFGQfHWB6fknwgiI89YbgZ3GefW+InRXaAhB2IaXVVxjpRqGSn3JU
8BSKIf3nsEhMGL09NSk83IomkyJ+UT/2pnrwhNmKayIfjHHe2kfNwRguXwuclm4/
VRLZZJuHCK3vGSXVS089iGUjyMjkiC8fUgLropaxm/jYfBULFo3+Cmm+6f6FKYgf
zULfn4QnrD9Wdn3z/V8xK5v2bbGiO0ey6g9kgoWxFBdGBW3gRnv8KryKTXMusqXo
1KK1OB44mNgpGunqtIKGNeIu9bW/5mxHADkwgTcLgMilR2myJDSkZnhT7m8F5xoX
eHjbAJM/XVJF1wAZ9vKEYXreLKKj2SHsu86xg/zRNaBbDb1S/t2lh7NiIOZyoYdk
i/F8gssB/Pit0hUwV+mMormbrl8XnDAVCySv7R9fFgYd3STA4IY7M+qG6W5TXhXe
QWxxJP0XHQ/HG7iOT5z1gTFM+RYmbSDeFtQMgOrnsIO31HBxWL9yy5yEFXkaZMY6
fnd/Vs5tm7NXlyxgad8842KTq2T4YHCNH+wtOtXxUuPmI8h23JSFv+We5CcVg+hl
0h5X4jqKa0nI2KuX7KW7LWFrJ1S3OvLclJBli5Pd2u6yiUuibia8eFXUStZQZlAU
fOpBOiAdV5m3KZrQVs+TS0hrEmFkxxHe7W9l2Xw8KyjnpDEbQvErTtTE2i0XoWPt
zouI+SGmyfGzObGcHNEIP6sOO+lFP+mCflBgpra7iD639hdihie5M0uYtgQlYO1w
0kYBi0GZ8v3+Wx+lzlp+s5gHY8gBo5BYh+JIzzkPLmgvM+sg+s68go+lxp7d4v/a
I5Vj6u/EKHWU49I5GrJV9BmqGXBZ3h754aUKSUpTcGADZz2mAWmJWEP8W4BnsOCw
0tPaDlAQJv5IGDcrtv2rCcbAv5A1os/Hho7WtZSAl0/4lYEYo0h16fvVybQafyxI
cAEsMUr4eSQwdfsOYonUCNVpcJkVZWMQY8ugCuzEmaTIGbWWyKRMGl44TDDq6CP9
vwHx3fmkB39tMVViyuYCqrkRXaks/vFkNNTmzga1IitdtGEHkLeOos4hKVt/2dBg
ri+2rym53cedCM9jNYldoznjxhajjn1f+OxxMSVvsNYaD9lii7VE97/14Ooha3gD
7J6H4njvq/hjUj3PqgnXUIhHFJTczRNfmN/xGd1FIXPOQaviIX5iZwVN74l9Wx71
To8HatuTLtEdAmPC6kB7d/AMWzIaHLjPNAEJsN98pPqFdXQdfwG+4sp7F6BLg8h4
WNlAv0qOKCthVMQVg0Dygy7pNjoCVNkX30WBMK8Bmcv4qoHoP4UImQdbEeU1lzvW
bX2db6J69hgad49J1jBvn4mhYG4h5UNOgnGRp1paUaYP8bUjrwot2ZjhQvWtfyJp
fkZ/LIgtYnPmKQ9gywuF4am5FVQ2cr7GKacTySgaWHQM/oeeV7C38r277ENJbyKQ
nYwNV5C/OOxv9ertKtMUAdbxPSWydeHTxj+n8Hy1pxEivdlaj4ZAjgGtOypMeTYn
eKUYzub3a7zVr3cDBhCES4SaqlHm74qcJzvHKrrDoJxIkPEcgPwJ7u5F/Oela5Cr
bj9cMeiKPzut1uFxMFfLpDUPT9hYmMnCEPQTzi9b/Pv3WhCbr74qHpn5nPRCqs6l
L4EYQxjBTiADWIVJ5UsrPfUPPZH2Rs4OljnveAyWmTcyOK+lbBEG0/Own5Zsi0r/
5moam9lGv2k85NiR5LIzeTDSsXMcqPLAD+dKBKQ/wP1aGh4YPtp+Uvrl7fkGDRiB
kjcWx5tqB5R0ilHyk/oeQg7LL4YV/1FNRV9bzVql1ejTmR1QI+o49z9f297X0fxn
r6YbRfOL3C0ho67MSxdlRHSOQNK0Yph2c+UGxXPZnaxcyl8+DZ9lqZxfha1JmRws
dPggU00RSRQVUOivCOKTA8Bhb0lsngrktDWC3W205cu6cPNbSuRb0XvpT/iFmkne
HTNKe161dMfe+jj0XChCPosYlzZvdoQaSbSQOk9/o34IpwRMGuBcqUfivRRtpwae
eIhg2bYvXHSG8tYz/3x7+FNPeH/7IFqeVBLXI8ubobpccaybvcLtE7xwJQMcuYlC
kYHQzdqt9AV488hbpDGg+rOjbCaegmOWXXUzlsXdWDUbcGqxfFHARR1NgGE8e8WP
LBeMTDr9Pyy9eMQBuxC/yhdEluaZboYnBaVT08hMe63RG5jei0DCDIhQ37T+X16S
VPTqkgb/SdmJ0+Hpc7sd1ft0WzlfpzgiKEQgP0p7FJezynIp/fhxyyPLsssqk/+8
0vvhqq4Mxd+RCU3cdH/RlsZX4gQ9Q+L66y7xVID8qP34ya4KCYHHFtRSjd3FMnLQ
pfPRP7lNgWEm5sFCSuAzSQ60jlm7VIChmDiqgqsw4x7Q1HT08ChOpzBR3dYNOScT
G7YpSGk2ig3b9Zs9F2IgD5Us6tNeZ1lHucKChJpd8FMBbs6fTynhKzjXRq6voPpu
aCT4yRdBABuyrA1ZKqWT3u6Z4RyJxOEbqfi2ce+afrPVgJjf9YvqJsn00O7wuKmW
9/cBNOqqa191IpqhYr/+Q4tXRclXz1kEV7MkPOI/wTZj5a8+l/DPS2RRwC9hh1s7
Gf9pUdgO+KVkliXMKvU5zl6SOp9A1rhNpDiZjVvE5XzD9M3jFm/60jFu93P0LTsq
gryBubrCdZsBd4ONZcCOozi1g5UrRXRnsS2Ujy4Z6f3a9ofkgzWQsaw/jvVlTUyY
sIVzFBKSEPmWRZO7xCnKMWOWLEybgtzq2ROdRsQf0DmQKCUJdQ+vp22nodmQGrCG
vAxmxrnJYttK7rx/2PFifbGJo4bLSSGqM5HitolgAzJ9bLZP9cZm6LuxY9DD9nB2
AliYkrqgK4vdCv8uHYoHbeO9YTlIjjEV4aWrb0TiCmWexF5D20yUHj7cCF7kL7MV
xoMaBVhPqT3ckG/qIRFPs0nc7n6qoJkvqq9ahVdrCfi91PieXq6aXF5dFp969raS
8S0oN6k51F1lXjzLBJfti0MObA5kgS/NjW+fKP0vCDUEyeMxIw4iHAVJv2R8WLJI
8DR5pLceGMPtdhzpHLAPvpZbnFWah1srcoN7OT8PCZls6aozP8gfoWt9mFdS/eUT
0/6lWiwk0jCa7323xXAvLbqpuCFgJ8LtU0QVK5lTKNzfhRBzPP1YOBCsLHBTo2ih
rIhk6V5NOBb9PXuQbi4G9QMBvwSo/njeHYkfu65VNf/qhTeF3d+R46ttgBtg75GM
u948rIKh7z7pyCGrzDfndAjWMblChLKEgZzO0TYdCwgXoBu9xNpUZ0qS/6AlKCrK
OMuMtaBL1Fqky9tJrMxtzf43p4ALryrDG0llMt0jbIDmrNryHooS3D7qYmyAAC7v
Ppqrk6JOxzzpaXKY1OxfJw+Yz96xIKsX5T1Psa5PIR4oysaN/TEYx64D1MsT4xzk
RzQ73MeJCvIgV5nMvXKQxY3sctlXn2ylcdH6VQOvQnt8k94Zt0KAuNIvTsomv9/z
/G0uBMOIN6itmZtGmlGDrBiTqklZh4IXypOyfpnmCr1WHmq2MNE5DJtHdXN3MKyf
Rimig341st7SJguOYuLdTghTTNg1M/oo24WpdQckMCVTQ8Xbs4r3a7/joBUI1Aly
ugENt9uiuOYMIMbHPrxGOe4e8G/1axydSumJDuXysl1fLrKyYnrFOwvRkCtBQeb7
lw8dIoU53vfdEkG6C5Kflb3/63x5jE1P8UlsATJUFP0zzPvF9IjTW0XysQy/zwFr
VQ0nIr5kCGuHxTNXNSwnhY0YmuZgxpReux7Hkq/yd2Td64P58wit3iFlW2FswAUp
jDhLdWtQ3+3ewxrrr3YywqClunBXpbuc/dGQIw0f5k06/ckbD1HIjzJ52lnu+ApM
PYdakYdhSjfYXx/cxTOfW4H4uFcht34jq+I2dmd86sTNOiPemJOO64U9nC5T2ScJ
XrmSJ+JDt/f1U2XXsxLahBl9T7RHEiigXyzBj/aivWcHbbjRl4JDtktp2mUwXzCi
cEF+thlgkEAaYUNH4sEBYyiwIvRklxO29iOHW1PvnS+hpEPZLsZa7pxc7sYaL725
tjMpQ/+PK7A+VR+qG+bvIb4ly5N/LF/1cfBiLbSdI2IJwvDOy5yeWr/fHk7O+eCr
KrEE9tst9hCYssGwSFZWnoiRDhdvf87YKMc5abGtHaqO6wUBpTeMQm4ETaA7cPhY
u9Y5C7o4rp3q0yGcZOUCfntYHuDvWLa92JjLT3Jz+CpJwQrUlGaXwF7Dw8ndtmf3
5wp7XytYhpmWPXRcbhm1v2CMC+Vzq8ISIzds+FoLTsrqOe9WbB7rWTwTc17A8a+Y
JuYkWuf6M3okKy/hknVCEpjANrUYn90dJ0XDQzWu2E+/RhSQGajM4h8dLssqdWPn
dYyidPuMby5vJ+EaAXf47vov/j/+ObiZJC5nhfefTTLoXtczSYMfD0yRkF+PTuU0
MDYM8c84GT8NncachpwkHWpocsjhkIsiqpqI0eNCyusHyi/q7EsqSa3gkDqrODQ/
gGzIUQgvBRNhYeOTDRK8nsdIBNMrd/dgH+496K2fW+IPcSQWfeGmZSZAaQWFJGoh
Lph+6kF6xRibKXDQmdD7qXVfu2mkNm9iae2eQ5o9CPc2UoCHJy76mY2eoDG8fzCH
SRHH6IofZIVQYgYJsmoqZonLiVH1LhWPkr9uSK6G34+PF4ccT15qpLhRqTmJpPg7
+5uGIW+g/+wV19Teo8syn8n1CFIo7MZyj7Fbg/unSFoXz8g3ef1xqy3rI6wOYWRD
BQaO7Mvue6hwrmrYTCvACCwOqAKvN0QrWBXyIluh4t5e9i+RnfXOSNYNrsjyW2XC
1kqLHrGzkfhL0rx8lXjjD1AviwefrDqeoQPEcrymZgN/zOcURJ78S/WlOB8EKXo9
/ZEZfWVrTOhkp76nxI1ZNtUZ5BuUyKesshCP24fkgFRjj4nJBwp82Ah0xnyt0Ki5
im0HITKqMxxoVUiv1Au0tDx/G2uk2+FW2GZqZvOVjQwKG4tWHxRdFn+YqrDi8pcQ
Nw87E11LAMvdkwifR4XNGp6mZxsDw91Qb15QC4ZzZ5PmmJO97jzjtGkYK94zBbVG
VjxMzxaqrJbKocE0lPZcjn9llziUPdgSlgTL1AKkoTMb6cflH6/h3nRBkdfHtct9
QhwN+vrOKefLeDCXk2f368D2A20HOPJ5vXFG8I7o7hJJfkAJ0KJzBA24gZssH+FZ
WnyVCO3DdAU2cNp1DRRPeFFtsSEF244bFedk8PH4GnmjRJKhRZ9Tp9dr5TBiNjAw
g4rbJl3w/Wd7AHIcAupTOzqUGBb17OfeJ63QE3D6iHQmAd7+r6Yk1ItlFe+o+Vn7
e73lGsDosFN0jLujDwBcLWgC9gVH2oKNWufdWiBETg37W86QXRgSbNBfuOVO1DD9
Ps+b9+dDUrtMn+3GYpGKQcAQxzqqDZVmr/6tB15GoFbL2m8r2SyOo/8kbIs1P6/j
Ul6yP7GgRz/rHNQJu3/cJ7/t1p9m3extTev8+fhazhV2lX0GGHmqDImQE7PwGqA0
wa5DT452aJexhlwOmLx7QpNZw9Jr0bAtNESwXjFvbuG6+1kvg/fJnjMM3jutfWe3
FanQ0APYGv8JxXSjvRNpoaTU9cV5/sXb6Bb3Gmk8Uhnl3ACCWHJQHLzgvpPpCis8
SStGejHbiJrprf78r+7EmEmEka0pWvT5gohsndN37TPf1HlYoIwXLKv/1dMPuXBn
3nApLQe2b5WSoZzCxPi49ViXUVZaLb2Gmtoe14E/Gl4YLXhFDte74VmSihEQOrmz
BaRiQWb4zbb4kGtVfhTKp7Q2/z3sxmNLuHqpirfQlKy5OFxpFzet02A2+lEcDeRY
icvSAJvXJd6p47g2BZx7ZNMVXbQpdxA3FAVIoDzgpA5yUSXf2Ep1eamS0H7/FvFm
8MLrZHrWS3YpyN1LJ1f0zPfShFrAbitu+zKc0TJuXbGHTNL74NifESo8PshDfmFd
Gf+DBo2L3AJ9zCC9NoqPr4jQwzeb5ZWta4wi127JNDVrsj66KBtU8kxUMg8Cnwhx
y9caiOUD4vH877sO9Go3Z1BPgqErep4keez/j75VCilFrItATWC2Vnjs53YQNwkW
V7iXWkj6FuMRbzxnQpxov6kjmNcUIEi0n1p6ZRboGyNAFhjYrtegjs/dlpNjxAS6
Ah1yO78SivqjB7H2+Vt5liHBao3WK6j/J2p5u9ZB0zzx4VjcWpeThIZHIVWI56yQ
EIG/92tvrrkDF2daWWKC/eOSieTFmSxRqnF/UASFFAVGDd0SVm6uUI6SLQ2nxNfj
AUDFln9F69hMQzYkA1sxPjTyS212mVsPKNYCHoss260ge+saXDbfQrkhK+PnaiY0
IanilsmU+U0pR/0vprcvbZWql1eWyd1vhP9bnh95IfYxXiLu1mOHCfZpCGAeoS+q
BPzu7rlHV7JmXmIzpi0Vcg2MdcXGLAqmAzw9qjcxUQWw4nyOfauaXN6Tr7hfXDbR
kpzr9TN5zWw8jcoSXDWphTGc8ZqcQUKAZ9aYCpAxM2S+9B+ecU7ueWpuhkYr1lg3
4jk+mEBiOYCzdbuvgfdb1RXEs03xgcLJbZWKHR0JDjQSH1nvu8zHJn42c6D49pnF
iIL1FsDNLHx1h9vEUHi0r9l00DjEcdmXYqtts2ibdqZWbce8LZnTUHiQJkiXiR6u
NolQm3+bn05bVYCHY0F9E51L4VIUOIY/Qng2yA2JbHVn7Upg7KlAyBECenpXR/mG
K3PafYk6jS6XHkXoR05xSB1qltj53MSC0rtjuZ4WzCHgoWwv9KW6U9mp/ht/XaeI
yLI8TmE0WRH0KPRmo6IMjfJp5J7Y09FvzzG1fZLr24Q5m6XQZwY3UkX4ohx6ej7H
tFKSqcS/EGAqWnrF5ARHos+q7uHVXPguLMC0ygr36Q8xR5jqZFUPUQxuY39FtG7h
+PlO18SFAcAU+oB4N/LKVbfcuKfNnbrKKFBzz/4D2BbyBmnrmR+2yUCVBaeMfPsS
OqTY05xy94ot8tNpUVn9mSNALErW8knuSor8hxr8BzqkHgHxDnWiUIrgKUQpGqEd
gMV7NSPH36PSTv6fQPo4PXxR2UMFb+H6mRFl/GElmQg/gtsZRRr5srz+S4KTzPXO
11SFbdPm4Q2i8hdJxAcPDqEHBhOwLIvAHx4VtV688Mit7B83ND+9D0zH/UyTKtUP
v1BeB4UNy4loFvWwD1V2voXtwXnMe1o/KZ89AH4vCN0tdzYkpn8S5N1aTDv+e3SN
qwaXmMzmgvm62FmWdVZcYqSGjbjuHVtb866gbArPONXnIhmKIgGox5Klymgdxs07
tnHLjoZK+9ziiYJUp28Cz5/ip2SC3H7nd5cXQ1/YDdaWS7Ltnd/jgEdidO4WRi+i
QCMkkX2zNVldkevVcNl0VGFSbQk8OL8Uvc6yqnHPOOO46YMCp6IZMqaLZXlNyEQv
puZo9g+AyTZfB8zr/MbTUMJRQcLFvXIgiSTw7iHs5SupOPBvM8XWpvpAZ3IumaIA
mL2llyqTg8awjC+IPzy2zf/Rd8VqeXJz+jp0Y8EG3a8vtQQlVCoyKVsj7eL0cUrs
AIvD+pYcYeFtTuOs56/LdiLxuqQ+WWXtzGilDL9pLJCXvSzJqV6M5cgDyQB6auGs
jIs9ElPJWF49awHr9JB6Oi+1dhpizPGJbIwlOCeyZkU6EZQQWYIKIZ9S6EQQT4l6
cBjo/I06eB1Aw4not9SxNUMuwtndwSqRr9jPNl5lozMUnpyhDRDNYtcR8B8mNw68
S2ODufAJzitMw8lrOD/c3Bnb3xhy2755R2O7zT7T1N+BguPIlZ/hRYLKulRW+rJs
0xBEYTlusMPdP5p/sWAfTsUp697wNpb2lBuFTN8jxSKPXbx4++fR5ZRn6K0jarP7
iXTrtJ+gbXxg9jZ8phnY3WkCr7sNg6efdUeKpFK9jSlu8Kxb/VIA38WDTpcLR1Z0
l3j46P+IRJzpSh6yuTXYR5uboPVtD/E3UmVYMQVnYjU2wyh6W+Aqgm3wYFuaMusZ
nzkvEshgmdPTQxqswUeYraM6MvwoLNHr8GCGbYqcNG4k7h/+iMqVe5qo59SqbawR
bZV7qIZeofbOoeVV+xqBMQF2nUesaW1VCbjDGsMc6240241KVI6Ifdd085GSC/4p
mOrbXRRRFZlnAov93tPx2nFX9OdksK/AFHr1Ge4kUVzBJgz0LktlHsTogmhqUsuG
/iO0SZJMVxJLFRf6tbSy/lLCqJ4wCP1W/4M90/b0AD/PU2ScWBNRYzwzB6j2lsqr
W4iG7q0X9lf2/wnYTX418HpL993Qeu6ReF1hS8JWRTZn1Kx9YIXjBJwA+YSxW4SR
N7wIaVvWxMtAqXiMTjG377y29+4aaKF9fGNtTQqtw+FKe9jDyyCJWs359BfA3a6x
EO44EItKyf6IE3sapCEiWC2bd3c8xdppcjs+slvus0DcHDQLxC98TsXOwOIJGBXi
bN4qyehJsH8pftPkHSJagBWhkmwOzHsqGvfMpqL2aCKUPfVCbGSgWROp/eKY1Zpw
x/ol1TJlKKHmLvPPzQjrP8qeIadhQClzY2h4ZwI0t42uyjoYvqB4vkmD0Q25AqxN
xMk9lssGzKqmDnAZBns30RUJTobkwUjiJ0GGk6nxI6ku7WCJGfHnmBm2HIisxijn
fzq1t1yOFfvFmvL7pPCSLYOw0AaV352XD7+VMo08FfKhbgvILCbFbvnZmP07f66S
8a289NMazxe8mmoSse69CnVgEsWD9Xv2EVTHi699pO3r1xCKgxDQm3QFiP8X1Ko7
P1mT4uP9AfgCDX4+2JEG8bXGMYyWFM/b9ANzyx6oPs7t1cH6FpYLRO6J2jXwhIFP
1kuPoLOLkbCYdBhtHqot2idikLB4dAJRxDh0WTVJuth7YC0M3GR3agMCsNDtphU3
1NmkAnd9ROe47UQDQv4nh80PKRJcErnt2J1yT7bOqiwGjQeO5GywK1nWAEcwxwjG
8kXmC6KWzWMWKy4uWy6/DY9ALgrlbhRafnU5g45+9tt8Lauuh71aDCgjCatqi8IH
nN8pNgS/RIJOsKtm9bnKciEV2YXreDfWiXM2o/mr5F3tmYoYrQDBmxaxdpWHG3k5
MPqI7YWyY75BQ6WMAt+fxSEAE16X26wxGCvbiAL/OoBhaBbS47+LWF4pZkLbYjDS
hez2Twgpad/nwhcVARBm1EJPGrKrUadGlDc70rzlQaK6RnIOfTnmhdhTp5sJnMH9
kNVPAVFUFDZ506H72I25k5wVMko8AVp/1aDX4yQD5ZxjZac15HZZzG2AyGJscdK3
Q9r0GQapY4YaiUsxbjwvDhE+ZEFZZetNDXEep5Jq6ohLS1R7lGlt5oEszZ9ruC0/
0Korx0gv/ITEiKhCfjA7+Qf3ulJOICawWb/Hea7pSdgiBvpXGy4iHcTAAnBnovbw
VDEZvkdR5Qpfyd6P7TZB5I9eITC5E6d9M1CmY8RJqLTmPa5E0GejOhQaRF3/NrdC
AJVV3l78aSO+o3xEvKQepscSyhu0s5PpcP5snJQz/nPsSh/+qCWZrWGgcYLACNk6
Rl9YZNCf2W9RJpA0607sHAM6/dK/AUD4msc2uBqvPJmZrmWhYbZADP/g0dWL0sk8
Mu01CNSNzqInzyFsyQPaPJY/bvUj+HbQkTGvkO4LwikkPct/yZMDyMIRsVzzzat8
pDUa9+ShHuJcMiXmhHyIFTRoswWxh30h7/j33umim7sbgJ4Y0eDV/sNWWQFM6D3K
UyzM7KDWI57L9Ymx+b0o4t35hE4AXYyFkOa7OnWCi+9e/nE26MbGq9SXFloJ8Y9J
YIsdekSqm84F+LnW4Ua1ZMqVC03/Wb9b8L/Cvzf6Pi6gjymbgroHFruvDvUrVIz9
qPPA93NF2XAPGasQg7BuyqXwZTKPm9BliMqiCHxqzAE5/u3vmS7OlBUAm2Y2x8bD
mCWFWs1qWzjUcnU7lDpFbttD8FXLkHSeIQ9lErd/Z4eUNfq0suWflkWkK54mMRsG
K0Z9yZY08x1cz3DmUHPrwaV7VPhHDQy7Kx/fVBIbU0WvHYicQXwnuWl9XPybDnki
TuHc6yCCQbduYkQjMhy2C+1yYOLD3PmYVEwEThQvlgnZRKJeEPZTKBRgETkzpVod
8ZUOb2U478sh+QViEgxoccM26f7KLoQ8c8A7GNHt06pN1hxPu24Cbq11XkHUdXSo
heV4Ad5P2pGq5PrRKZG6YltyXxlhoaYgy5/7lDize8MbinACHPyy3AW7+LHJ0t0i
PWOKZeucmUbkP+rdcEy5gsNV0avJ8u90gXsOtYj3J3lBuKbqcK8j8NNojUiSYEt4
NOgM25Edgk/gKZznTTbD3DlV3761AN8Kw/fwizu9jkEdee0PLh2BpjBeoDh4Dhmi
EnwBLj+WdszFIzK6gGOTDc/LxA5RrIxWjp7qVfkFSfq7PmR72QLQyNASTe+QaGrL
uAJWED0iNpzbqsmZ7qKbuNG9EVsYhXDiVZI2s4piDceSG25ZPbARgGXN7mJMNKsq
MEl4NgJ4KlPvLqtHS6b1kEbGB7hWSkD+Mk0q3wUY3iETTE9nc2qmcyNDFiQ8LabL
nBA+05juOi62oIcAYg6SIliwKZwXS63zrR3dYWGuvqNs62yu7yUMgHawbXiL81S4
nmnajn/przpZ9zAhtzNMb1ISS3QTtXqmC+ylyeT65eLzSc1J4IJPxuShLMEn+b8t
5+NqilDCXd5l1ajh4cCbFmO21BdPgaZHi0jIpIh734QXYDXLtsTPpvkGU/c+K2E8
oTM0gVIO0w7UN+VVE15QIb5HVMMILV8VgYazw53q/gCgre13ZnhJd/kHvnFv38LK
I3ZUQLbJPtZ+2XcrGck1rkz9GMA7MVuk5XT4bhlQsNDbLEIdr3RzXBTCBT/UOa8m
Om3clx3CAVfdLIZE3wGRTqH0vJpglugZjVFUZe51WCzlTlXqH0odTQOFy0bKsOm0
38CIjdP8pULL8kFgVSVXyw7Vy+/OsrTq+WJtXlnf7+cWlina41bNNagCJA06NXrS
sc63jBPKyXriBQAyb7vk/CEwENEWW6+ZCmvazqjmpOiBOi45JmEcf4Sqi0KwHXqd
fvfo/83vICY/W1xRzR3bDaeiXUeCfJfnmvqRR/K98cEsVG1DRi0wLRgakFq+ib2E
UdKX+7LemqjcmhMlXtUV9SWXBiqdNbqlBOwJHCF8hj759T0TuBgLslsY4KVN8NEv
5MfT3swd9tP2Rg00RoFtuRqIBFOk5b24otEWDUAYjBpJ+v4b8jj3MqG063q4gXg/
AKo/kxHoT0D3aW841YSQD8Lp6nus64luY/OWrPA51aseRLaULo4B8k3WwrK6tjLY
X+V2kUcgXmuKeCDwtc/ep5TcoO6j7yhuuMKRzbSIGxaPytub7MSMYDE3Qx0Ns1Dp
rSlwMDaxQP90ScsfyI4TiV75xSExyj7nsiVrh4klH09IwHFrz3CNHKUcJiLkiMAe
Aovy7/KvF2j0kyB9FHI2VB1kdk04MiJpLqAZ3pLH6urVONWFf89u6wCDOpuSw6R2
kL42VvvHVbAZIsLzGl2ICCpk26ocH9/rmIbxyvAGhAISrmD281oHFVqmsdPTTaFI
zH5iOsL1ZSixA15BFHNfPBPBX3yFZTwmnrSltHb7OWO+XnnrYTSmXZkxXbkO8h2O
XuQp3j36XuRSv3o/nqy1RCzv+KYfICb1nv7tz1rEVnrai2Lq6fn4KwNaofwaPEhK
qCWTTl34ocKMo3drO+ejEWokZEActLIxhqCzBG/kujFfa6ws+Q2pULQG+GUe2dAx
jgpG3IYn2o8r31G1Rsuovj+Etk8Ubtvw+CUU8sqhIHE4RL4t5n+oe+atXbG5L2cT
fQKljka7welVh5bN7xcSV8osaEn3SRQvTS0xRrDzevG4Cfgi0aPVblpFETYnfnfw
g9I93VGLB4byNG6LiCpAh8l/dxpk+NgWMRDqEHSXj+n3hp/U24BP6PPyhBPoqfBJ
KOLXbAIC9oq/Ilrg5l03cZrkMS4H7irpN76Y4bCtb9orr/bBAX+M+drp04FfvXJG
VTu64d1dNG5BLfCy9y7qxxxkBrGIjCVycGcubjmzblyLyrHNHNfAwqfn6RwVsx3w
uIjAhDtZX67+3P2I1dUtZC2FC9FMbU9zrdQN5Bv1Vz8LQH8R1uVE3vA/FUQMEeYr
t9Ek7sO9KZc7tlvEFKbQNt7TyXSe6T9ruZMajOYZfI4qSAoVLnYnEh6mTVh8K00l
AjzkCYHTIfbrTnPJ3QQixroOFAGAnJUrMJFOSgunm6mAb3g/GfAFb71D3exnrdAy
YRHpv+Dc7uLPnAuV7L4HzJXZzS5SEiwMG7JV746LT1qJQJpuvTdWVhZzNzk9a7c8
ZQHapKDe+2jQjTK3QBueoq8LlwzDSSSB6ZDuNY62OIYGx7i73E4wowU0bKOzXHZz
/LjdLMteTXjLakLlkmKer72CJYNRpF1r8Uwl4FF1pMrrBt2H4DycG/MyHGKHj2nH
F3TIrqfueZvZ0M/VZm0XiAkSJT6x0FKBFengCVXXLbFfSCRwud1EgmKQEXZsfD+a
9ZBrxR9jxcq10VZTdwVGEM+6ufHEwkq2xV+AQ+geukMl8ggrAle/vdKgsLJ1fAhm
6it0J+jonKLSr39QN+lAmob2LqnH0Mf6w/vOtd4OU6A+0gQqeMlpunEPAW4HNXsr
huR2LrOYUveYgTafxFNcGoisb7cgt2RBkLr16OVk14JUq7O5xGehdQ0rtcVUSwXt
0ctQujtvfB3Cqfo2O89+4j1acl7dSHi8l21iymyg7nV0eX+sO2ehw6OEe4W5PSUW
6vPhRmlWyvVub3PbAhL34q5Q5rqyB6ByXoAy1nrX+VtM2G3lHMIgfhc7HGrdB9Q3
L5MfFfGBMDtMMxBsq4P6wny8+x2phHNNAxPsVKHZMmSjS9wRSEgLAyUokIDnSsa3
YqwMBVA3clw+joyL0XYQQw7DcClPa0DTp40QzMfExnWrEAd4AGBU/5H6n6apXxBy
Ow0prDXIwHuKt4nCTo2r3b8IMre8iXKRUVSZaRGWTsyUbzSS07LoA1SBSmtUm7ef
DhDC47Xyzkp7qaZai2c8F3ZFY701uRQO5HCZiaJQAaTyXijoOaROlxLVXZRDWO3k
Sznb1MoLjjOkyKh5CxVM0lviLQi8Ku3qmCxcuAjRl8mRV/y+XETakofxwY34H593
Cd2Fd8evRnmiyGyydc9mji2vpl08TYnubtDvF5Wn3MbNAtadoVnt8V5sD/MWJjLW
BTgGyLqnRq+wORpV3oakqAc1+nML29r+u7d6O8iZn3/6IMlYQ7bfgZ5Jkwl9c5yZ
cOE2gw1wVVeCkl9IFF72SXlnVLXRn0VJpaaj+86pnk26Nwh7fGmHJGOePGV0HMNt
GbdMbLqyG4uZqWDiJAzCNhNla+XXTz439K0lSwOkZV0zvojSTAJQ74evE4vv9LLW
n2AB94bwihOc9hDhcL9tE9yXj+G9GwkY8+Xz7kRU2ip3JPEZKypOZGK3HZvyTMX1
4KNzc8knBMu6yn/n2jdu6NWaPrsFDGjT2R1mR9Ccd1m/eOTrA+ZIodd8tSDk6m6Y
N9Wcb8sPFSTwWDUS2b25qrA+nWQfb1w9yI2jPhm16/3a2jRASe9XxbGvl7o6WB3G
91pxwfxwFsaBAKnuKhT0VhY2maHeUrEl6Q4XYWB1Vlw81I5SAiiVovPW8KBfVCfc
6DoYHrN882oeakcHCnoP59Q7BFfuhKswOfIF81K4GxNWre/lmP6cw0pIdL7vdlnC
t+WlBulQ0Ad2lb0xpyvJfT6vhUM5ipkhQV676j6AXQnCL4ROFm5g5ng7gStA1U6G
f3eY3cU5i0ZM3mKOmQcqBEgOAanm44C8TRzgbh5tV3djsCIBdEEWlOGXZdkBeDbx
zF8Gz9IbmKucau1Dm839nJnIzBognTa1kcmLLtUGeia4IUkBof0IGk8K1y08dU5x
UKQJVjaNZls6xZHBsUWI+P92PvqbOAatjPzB2MhxbAgxz3cLszwj+NpvMtudh8Qe
IoFMeT4n8Y/YTq0KsZhsgDM50iw/UhCAl5s0fItKLkBeAskjiss5wwhWoyDWCx/B
H0qzJOkjPRJDipFGeCZUadoxrt9LvAh5Qx9KFLkd4RmdnRh/J9HDdcGriQRkXWZZ
4rkgdFPYMM2M+FZ9ovUFczsdGHdXo/P32Y7vgGwrjpp1PLcWcax8ez7i2afdTPrp
at9mDt1SzV2S+e8LbZe0wu6wJrAtk8YYLCAoF26I0ODfF/8DojUMWI8wEjUceh2a
rmWsPwR2KPnezluBt/P8IrErjFJ2+ZA2QPQ4pY4I1H07vGZaL6F7evJsL/PKjyON
KlRK4vPSYNeSRX79ugDLKT5VPSmNUW8nECYFGZPVBK6+mLP/g04O8igQWM9jJ7Dz
nTyn4OSgT6xum9WjGTYT4KhwwpGSYqy1KbjXGG9cePnKIbAINAewhrMyQa4MGJTd
Lply266zrhxguyFF2aDmUiRoFSJXBC8IrZ5Tlz4qi48=
//pragma protect end_data_block
//pragma protect digest_block
326xnS5JK7RaQfh+4TOYzgEb1yE=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_ISSI_NONVOLATILE_CONFIGURATION_REGISTER_SV

