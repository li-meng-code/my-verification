
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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
RlGruC+V5pSTD+UZafmwyBYWCWiQN52NoErE/xiA9v4OaRxaFEghRIP2+dIdFolO
6vPUgfSf+sOVW4Zb/M5zSAj68k+CPl1kLAFqpMRAWb6LsOLO1beRL4dCVikeNOT/
02D4FuUHwUtdneS9Y+a+846Zx+Lh/ijDvwwzgF2zbrc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 336       )
nBrgTcn33lgFtdTegxD4+gHVor77Gp6UfbeS/IAFlBskuMqm+48e97+ma6ck1j4k
4bClhb/7ACjpiSSVyu80GjhBmVehLDUd69cbvdw++QlY+GCtCsTZDXiU7aKLwzQt
+qKuSmnqQEL+K+QAPf4fYP0/Y6UPeu7lAd4RxCpqZ/G+7rveNNVroy92nUEm6F6Z
f+0QAPnydGC93rY4hxKgmULXixFuHR2Met+/Nrgi/5o4ZWo0E62nZ19MaKlum6fg
L80c3sgUCQ44pJuolOcWoANkJqBY1htbszNy2T0Fmp65SPVhq2wCGEKxrcRjO+OT
/UcXAhZNbuFJURAn2n/QmrPRGl//MPw8z3dzykmGoAk2yVSnZdfcuIjAicxHxn3z
NyxaXSui5skiLej4FMlFMBuoNHt4XbBavqWj9Z/OO4sMmJkm5tZZQ43904ptN9KG
jz9L5jqx9hRaK4ahuGctjQ==
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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
X59+xrjiHyfPYiuFVcFlHiHhooWsjjxbgvbT4fI6aVEJIdFdD8CyR2XYQF2wsgeg
y2xiv5XmB7YvLfq7uKUwDKQUjCP5Ine/32p/n1vvIuCXaSIxnXFNeCY/LztYZyzd
mb5wUK7YuIy7W66O66NjDT8sxkWVYKEJbutMN01NRUU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 539       )
CNRhn7JFGNCdKB+Ne+H3GYGg8DMhOSHvg0LFdOBJDwevp+I+z7RK+kuBZh09U6uj
of76xGU/CYQ925NlB4rzIwF/Ifo/Q+naJqei9YSN3hO57D1/wSoV4JtZJRZJ+OiI
wbI4i0EnqxXdM6Xi0Sw1tPNDeefU2vB+DOz5b/zPBaBhVWrjWhI4VgtJh9ZqUXvE
xlx2rSGfTHJwyahxZiia29HzrSOcrqb8qtFmJpymhwNpPpIk7PSd2og9v/r80AJN
+oDsNN3v0TKtFypvHYi/5Q==
`pragma protect end_protected
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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
O4msJ21mJ01yucQz7lvC7pVZ1mZvCF/rwZlvYqiAj/jRIEjiCuRWsEqSzABgUwCT
T9V9h1VIX8PcoYwVw6g6zB7iDfhPRlE3HZoq22kOZgGBnX1g82fbEgads8DQToL5
1vVLMti+IOB1ckrlFmk/qe6pdPRN2H+NvuImrAqJKlY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1157      )
ectJif3j7BLvfS4spLokGN4w5fm/amujnf5qrB8zJ7nVEesXBm49CV5JhpSbRGOt
AYncQJjGQVtAPjcf1Dt1MCyjTqBuIVdKtLqgpmGzWMKKaCI8bo3H3edegr6OXju3
pdvwa750EYrfbOFGRdzjpAEqMA/U7AFkb15QdvLsrGw0I8n+F21jVrPpgbSPtDt3
GoPz1A29HtkoZq4oJozG1L4ITIW+ZDLW08tEhowEKtGU1/9iatMawiKbKiwST7W/
hsEsVRnj+VhnYFmOQBFBvzJabtDVmokKQucopHGSuZeHJcIIPEeBMVwmrPUALNmO
P2E5LvDQn1w+vY9tfIH3lOEE3sj2XrMNfLtH3ohm/yXfM/tSoi1wAfSD0gHv20n3
Tek8IR1VI0Yehr3o1oR/59F8ZC+dmsB/h6O8apewAv/0VgFp/VjxO8x9MNPGBfnK
ogLj/NNA7Z8L21sNg0zb0IWgRDutmXeN8s/AT9yixFQ1QmU4S4MthmxPsDWzE3MP
THIatcyD3qlYM07qS5s9/JcVLSkb0e1rTS3yaTsrGJjoh94hZXGVrNo1J1LBgdUq
C29g5Imycm8D5ACF46kjdeOMb6zdODhfSznTOZomUQ1LLWD46dnXU/5T6raH47B+
UMuKBRLIwZvuDW/cqhPsVUNN6LgCxvekHDZ8+MT+zXjBbkM+saxQHNLNBCz8sAeZ
xE42y5gXbQ0wwCAYDHYJmfajNEMAcX2O80ebvUTVERCyj2uHXyHnSKj7oZG/FPia
ZH78iWmcGdV6DfHL+txkWA6RTWYU1frzg8VsMjTq9uZOIMGsu74fohwg7vqXPQ+C
`pragma protect end_protected
   
//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hGMjnQv9vV8luvNlaWe+SBKVWeLNDn0roh4cd259LcWZzy+m8izkDKe5OOcRrCf9
Uy5DwkHCT+QmxwZD/iDS4i/j605+R4zbKeaDatSnR0pa3Jwh29JH08Q6o6Ju8i5m
/g1ypUJ83FDmUAin0jetJwUjBKwyz7QbtDAflef0DHo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 16781     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_xSPI_JEDEC_TOP_REGISTER_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Slk8W4B/paK+m/bvyX1Eh5z1QxZkhKY2ul7vnA8SawhkM8pWE+4HFSkf6SFjbDkb
HqF1e8PXU2zlTxukw3PwuzLCUUAMZ8/M9kUqTMeOZbIHgFrHosr0/PeQ0byugW5o
KMEAuZE0QQ09n0FvOA24RDePNKHy+RBGvL6Mk+gSFOo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 16864     )
e3ynzphDOw0rZKpBge928jHsteVSwFLe2lk5XuSlB52YVDJm8KFjCVlPduTiGIsX
NvLW/A/NTOB95PTOX9gpwwilllWyJX+7AA5psC/VyMIjvrJnfiM7g6vyUeKmj7rG
`pragma protect end_protected
