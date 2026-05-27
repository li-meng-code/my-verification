
`ifndef GUARD_SVT_SPI_FLASH_WINBOND_NONVOLATILE_CONFIGURATION_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_WINBOND_NONVOLATILE_CONFIGURATION_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP Winbond Nonvolatile configuration register class.
 *  This maintains teh copy of Non Volatile fields that can be stored/reload based
 *  on requirement.
 */
class svt_spi_flash_winbond_nonvolatile_configuration_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Status Register. */
  bit [1:0] status_register_protect = 2'b01;

  bit sector_protect = 1'b0;

  bit top_bottom = 1'b0;

  bit [3:0] block_protect = 4'b0;

  bit write_enable_latch = 1'b0;

  bit complement_protect = 1'b0;

  bit [3:0] security_register_lock_bits = 1'b1;

  bit quad_enable = 1'b1;

  /** Output Driver Strength */
  bit [1:0] output_driver_strength = 2'b11;

  /** 
   * HOLD#/RESET# pin selection Bit:
   * 0: indicates the HOLD# pin is selected 
   * 1: indicates the RESET# pin is selected
   */
  bit reset_hold_enable = 1'b1;
 
  /** Write Protection Selection */
  bit write_protect_sel = 1'b0;
  
  /*Power up Address Mode */
  bit powerup_addr_mode = 1'b0;

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
  `svt_vmm_data_new(svt_spi_flash_winbond_nonvolatile_configuration_register)
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
  extern function new(string name = "svt_spi_flash_winbond_nonvolatile_configuration_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_winbond_nonvolatile_configuration_register)
  `svt_data_member_end(svt_spi_flash_winbond_nonvolatile_configuration_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_winbond_nonvolatile_configuration_register.
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
  `vmm_typename(svt_spi_flash_winbond_nonvolatile_configuration_register)
  `vmm_class_factory(svt_spi_flash_winbond_nonvolatile_configuration_register)
`endif

  // ---------------------------------------------------------------------------
  /**
   *
   */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);
  extern virtual function void set_cfg(svt_configuration cfg);
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
YSjpXzmNNM7N5W7iQ2SfSwA6AWSkjGLKcNNd5XVCpwHdUtg0IZsnlIov21IdiMmQ
+vbOl2252sH+nbXJAWry/GzPAul0Tgh8+co6vhq/cQU8r4SYwwelbswpoD+ThK9x
Ty7HBCmwg0y2bKx6Q66f6Va9wKKv3t1GCi94Geh7zPhb1hPg+18FWQ==
//pragma protect end_key_block
//pragma protect digest_block
LpcM5OdD2tneZeFmEjZOA/PsYLk=
//pragma protect end_digest_block
//pragma protect data_block
xMuYQNFjuYoMbZxTxXU0ETXWdv1vl8j9sML1DV0SmS4UQyVM75/iqka3ltSufOyn
JgnnnmOh9tsnbasvHsI/K2RWxEzPbGc9xu6kyUI1xYXPbHKgt8BFgw7cHW3bLbo3
71ZOAOWiFM/oOhC/x0fSt6Dp/9t6Lg4vizNl4A7NzX+RFLMRIeC1MKt3GG+4ooQn
RzblPSC43wQBdp3eblks2DJKe1jqFvSQXs/ORre+ca+HRGwcVl7DKW74/iah+2UF
E3lIMVqKVZxl/EIrnACKTPgaAg2yQhFyOyfypSEuqx+kNnPst5nPVUQtnGsGH5vf
Twbam+8xclhxUA8sKsRaWl2G62XdqOZEo+hwtLCJGGrZIfG330qlUhMQnHZD0uf9
xobPO2qRbm+ctyE3uaimcHtI8zRGMo7ZBK618pePjQKvcMJA5N92jMvpXlSPVAqb
oqT8LMXHiA3/aUde2xCfL8qlovc+nk1SBMJgx6VHWsIKRlQ9TArZblRBcctDCiOf
xTuPeQQ39m9gPjL0jCNI+5iUXW4gtHKV5KQ37EH8o0tqgX0z78noWZJ+jTE/vDIy
Do7qpXi6vXdjPOHiuHb+3ZTgbt/eUKL3ZrO6RRF/TzA7beZn7QWHKHA9aDCrtyV1
Js05fgL8qZCfV4Nlb8wMT7bw2DocKXt1tS+rGpZhcI7XRKHfrR4FtxN4ntXSHrAI
ZkODrTMeQXaw19mgcQZOsUOUFfs4dr25Zweg6uWNF5LLRrxyLX+XHXKfe5czB6ZW
EuMXMsqV/jmxuZFRGxNy4Cm6EFEjtW85G6AGzGSMwGVrCQMw5y9DG215GaQw593f
hAwOVLefh/dkyRCw+5EHNOM3q2vVB/vFFWplsq5gGP6pn9FFyxw37JJrwr+Fx9HQ
qO4+gBHEp0t8HH69oRCRqH5kXCyLzxrIFNx2s7I8c2it573cbG1JooYfd/UVZLSL
+saFvn6INHl/U9AAQiNF1Nam36hwSnGl8GbhPfbMCQpML2hJE2ApJV4ETN7oT1aJ
vtJHNWukxYCxpQrlH/FPJHlP1epKBYGePhQrjVz4Pmf97znIv9hhXswZviwu/KiL
O0YlJ9lYnLDu41a9nkUph3klUqH13xTfCAtd3oqN/61KhwsJcNhm59tbve9NHRjo
KsUrwu/4ww+LesoOB05epEPH3aI9i/1P6UXdrpduKFo=
//pragma protect end_data_block
//pragma protect digest_block
DQbms2m6QKZ00YColPzJ5FbCCVo=
//pragma protect end_digest_block
//pragma protect end_protected
   
//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
g5RHv6CE3PVD25+XimMRGxcMgqBicMnMDmEDEi/jjpGe8dZjt6OH4WqHOPEQ/sIs
+oJn5JKb/7OQkUiaCdCLqbIM5ndQHcepXKeSJVHy8xYnDqtQLQyAWAJBOtMGa5gr
sP07wN1ifbhGD/BuCPBwB979C70JAlk2Y5r5I/dLwByO36029Ps2IA==
//pragma protect end_key_block
//pragma protect digest_block
rKLMq4RX0mblR2zTOa6Tv4zl8GY=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
WuD/+Aov2TuIQ6ukyk0iy753Rf4=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_WINBOND_NONVOLATILE_CONFIGURATION_REGISTER_SV

