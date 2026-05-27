
`ifndef GUARD_SVT_SPI_AGENT_CONFIGURATION_SV
`define GUARD_SVT_SPI_AGENT_CONFIGURATION_SV 

`include "svt_spi_defines.svi"

`ifdef SVT_VMM_TECHNOLOGY
`define SVT_SPI_AGENT_CONFIGURATION_TYPE svt_spi_group_configuration
`else
`define SVT_SPI_AGENT_CONFIGURATION_TYPE svt_spi_agent_configuration
`endif

typedef class svt_spi_system_configuration;

// =============================================================================
/**
 * This class contains details about the spi `SVT_SPI_AGENT_CONFIGURATION_TYPE configuration.
 */
class `SVT_SPI_AGENT_CONFIGURATION_TYPE extends svt_spi_configuration;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Bit indicating whether the VIP is to be used in Active or Passive mode */
  bit is_active = 1'b1;

  /** Bit indicating whether an Active VIP should include monitor capabilities */
  bit enable_monitor = 1;

  /** SPI enable_txrx_chk bit enables protocol checking*/
  bit enable_txrx_chk = 1'b1;

  /** SPI enable_txrx_cov bit enables functional coverage */
  bit enable_txrx_cov = 1'b0;

  /** SPI enable_checks_cov bit enables coverage for protocol checking */
  bit enable_checks_cov = 1'b0;

  /** SPI enable_txrx_xml_gen bit enables xml generation for annotating functional coverage */
  bit enable_txrx_xml_gen = 1'b0;

  /**
  * Determines in which format the file should write the transaction data.
  * A value 0 indicates FSDBXML format.
  */
  svt_xml_writer::format_type_enum pa_format_type = svt_xml_writer::FSDB;

  /** SPI enable_exceptions bit */
  bit enable_exceptions = 1'b0;

  /** SPI enable_txrx_reporting int, indicating operation enable and depth. */
  int enable_txrx_reporting = 0;

  /** SPI enable_txrx_tracing int, indicating operation enable and depth. */
  int enable_txrx_tracing = 0;
  
  /**
   * This field is effective when #enable_txrx_cov is enabled for SPI Flash mode. <br/>
   * It is used to select supported flash part numbers whose coverage object shall be created.<br/>
   * Coverage bins of loaded part number will be populated in a particular simulation. <br/>
   * Simulation run with different part numbers selected can be accumulated to check the verification completeness. <br/>
   * For example : <br/>
   * enable_spi_flash_catalog_coverage["N25Q_1Gb_3V_65nm"] = 1, creates the Coverage
   * object for N25Q_1Gb_3V_65nm device. <br/>
   * Similarly coverage can be enabled/disabled for multiple supported part numbers. <br/>
   * Please refer to catalog for list of supported part numbers. <br/>
   * If a SOC supports Two part numbers lets say N25Q_1Gb_3V_65nm & N25Q_512Mb_3V_65nm. <br/>
   * We must enable this array for two supported part numbers. <br/>
   * Simulation run with diffent part number can be merged for verification closure. <br/>
   * If this array is empty then by default coveage object for only selected part <br/>
   * number will be created when #enable_txrx_cov is enabled.
   */ 
  bit enable_spi_flash_catalog_coverage[string];
  
  /**
   * Reference to the system configuration object.
   */
  svt_spi_system_configuration sys_cfg;

  //----------------------------------------------------------------------------
  // Random Data Properties
  //----------------------------------------------------------------------------

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
  `svt_vmm_data_new(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the configuration.
   */
  extern function new(string name = `SVT_DATA_UTIL_ARG_TO_STRING(`SVT_SPI_AGENT_CONFIGURATION_TYPE));
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
    `svt_field_aa_int_string(enable_spi_flash_catalog_coverage, `SVT_ALL_ON|`SVT_NOCOPY|`SVT_NOCOMPARE|`SVT_NOPACK)
    `svt_field_object(sys_cfg,`SVT_ALL_ON|`SVT_NOCOPY|`SVT_NOCOMPARE|`SVT_NOPACK|`SVT_REFERENCE, `SVT_HOW_REF)
  `svt_data_member_end(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
   
  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type `SVT_SPI_AGENT_CONFIGURATION_TYPE.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the static configuration members of the object. */
  extern virtual function void copy_static_data(`SVT_DATA_BASE_TYPE to);

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to, based on the requested compare kind. Differences are
   * placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is svt_data::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(`SVT_DATA_BASE_TYPE to, output string diff, input int kind = -1);
`else
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with rhs..
   *
   * @param rhs Object to be compared against.
   * @param comparer TBD
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);

  // ----------------------------------------------------------------------------
  /**
   * Packs object into the bytes buffer, based on the `SVT_XVM(packer) class policy.
   *
   * @param packer `SVT_XVM(packer)
   */ 
  extern virtual function void do_pack (`SVT_XVM(packer) packer);

  // ----------------------------------------------------------------------------
  /**
   * Unpacks object into the bytes buffer, based on the `SVT_XVM(packer) class policy.
   *
   * @param packer `SVT_XVM(packer)
   */ 
  extern virtual function void do_unpack (`SVT_XVM(packer) packer);
`endif

  //----------------------------------------------------------------------------
  /**
   * Does a basic validation of this configuration object.
   *
   * @param silent bit indicating whether failures should result in warning messages.
   * @param kind This int indicates the type of is_avalid check to attempt. 
   */ 
  extern virtual function bit do_is_valid(bit silent = 1, int kind = RELEVANT);

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
  extern virtual function bit encode_prop_val( string prop_name,
                                               string prop_val_string,
                                               ref bit [1023:0] prop_val,
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
  extern virtual function bit decode_prop_val( string prop_name,
                                               bit [1023:0] prop_val,
                                               ref string prop_val_string,
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

`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * This method returns the maximum packer bytes value required by SPI. This is
   * checked against `SVT_XVM(MAX_PACKER_BYTES) to make sure the specified setting is
   * sufficient for SPI.
   */
  extern virtual function int get_packer_max_bytes_required();
`endif
  /**
   * Assigns SPI interface to this configuration.
   *
   * @param vif Interface for the SPI agent. 
   */
  extern function void set_spi_if(svt_spi_vif vif);

  // ---------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
  `vmm_class_factory(`SVT_SPI_AGENT_CONFIGURATION_TYPE)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
6b9JM3miIEEyGiaekScZJ5Mx4DtOa9HIL1yTweVzCq1zYHtetNsSruZY3Fteahfs
9NDyopmgTsX/zzPbVrVKEor1nJOgJyCHERa23AdHjfRUBLaG8eKWcq6+ki6XOhii
OHNeHIXW6h6heCoGCB0L0lTC+lrqSoiOGfg7BaL8PnAqFRxbUDiX5Q==
//pragma protect end_key_block
//pragma protect digest_block
FBB6emACVJ2P1chf06L0CQ+PZEk=
//pragma protect end_digest_block
//pragma protect data_block
oS5QdbSHBwRqAbnMYEwxWB3wf/umP3lbCyA2/PYJe9LJyawRNXwyIIfr9tNiy2TN
ZUgqwVLp98zE3GoBFuKJ+qeiOO8A9Sb6H05gmjaxCujnWUlWR5B7XDPwDQlcmBh4
5HuldurSEzwTnQMsbLCOgPKZ2e5wBC6eWcO+5SvLX87Czh0p/+lo9OCR/dp6PHma
XKuPMqflh5g/y2VexWK7Z2TntbwW6cVT90DFSwpxSiqQJI8U38QjtPyxXhyXCgMc
2Iz6RDBXrh5opGCHgANOHRyt61gzfykegiMW78T7Vxgovk8hAXLq79Kk6XBJnTCb
Z0wahQxqWFXr/jOHgcVjQ3PvEpG2KisAO3ReMfxK2zKZyppE52xL6mffT45jwU1+
N0Zhza1NKDlC1WDoSmCVrENvqG5xx0IS2XNfb1FjwPaSKHVNrRfq3pJf+I216OIK
cXdBdQ0FWW27ijPHPZQ1epV5ilInmChZrNvPUskeGmGb7zU516P3PbHijFfI9nSM
DA9zgyt1WtxojJdXXG3Mxf9TdNfwnvcKfB/rEVfo3mHuFiL+TUHPtEJ/6n1CxGuP
uDlWE0o14y+qcsDTfGLUCGqcTzJnlOcQuv2TWIPqK0DjXrHjny0Xjf19uvBUe2Ov
N1F6r2IxnOK1Qm9bFaB50LOuSiD3q+7c+/oGcGnV86lvvuE7/sRszgXAscVsZkyI
3cajv0hNXZLWg/imyaPxPqRKJVH7clQhdcSPmxMDhdarG+bN+xn2TZpATgnPPaXF
W+DMh4xWLecT52qg6q6C5qwPg5azYr2GKjZkgqEwVSCtzO4Y7Egw84Rl3MD2sMpd
h6CBxcq6mk2fdMx1J3LDhq9QN/jG/eezAX/AONUUPU7IuKXIds+QqAt+bJNNkrz6
P1GLunpFBgxuFaCwd45MndkhUSP6JEYc3WL41uHGI5TEvmW3kTIcXjKl+Av8Z/J0

//pragma protect end_data_block
//pragma protect digest_block
KX+Jzlxf6VAba5Fi0EeIEYrXX+k=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
6b9JM3miIEEyGiaekScZJ5Mx4DtOa9HIL1yTweVzCq1zYHtetNsSruZY3Fteahfs
9NDyopmgTsX/zzPbVrVKEor1nJOgJyCHERa23AdHjfRUBLaG8eKWcq6+ki6XOhii
OHNeHIXW6h58bj2q9ecRDbvpvUOzMfXrQnAD1Rai9YEZ9s/F8WJTNA==
//pragma protect end_key_block
//pragma protect digest_block
lYo0YKcBPEeOIDHoUeo5sMUDRfs=
//pragma protect end_digest_block
//pragma protect data_block
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
JjO/NlvBzilrQxCfxuttew==
//pragma protect end_data_block
//pragma protect digest_block
cPJmFkx58ZEvxevSTrFNM3zaBmQ=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_AGENT_CONFIGURATION_SV

