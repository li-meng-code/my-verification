
`ifndef GUARD_SVT_SPI_FLASH_ATXP_XSPI_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_ATXP_XSPI_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto ATXP device family in DDR mode.
 */
class svt_spi_flash_atxp_xSPI_ddr_ac_configuration extends svt_configuration;

  // ****************************************************************************
  // Local Data
  // ****************************************************************************
`ifdef SVT_SVDOC_CC
  /** Workaround for SVDOC CC circular references */
  int cfg;
`else
  /** This is a handler to the SPI memory config object */
  svt_spi_mem_configuration cfg;
  /** This is a handler to the SPI mode reg config object */
  svt_spi_mem_mode_register_configuration mode_register_cfg;
`endif

  /**
   * Initial value for all the timings which indicates that parameter was not
   * loaded from the catalog
   */
  real initial_time = -5000; // must be smallest then all timing

  /**
   * Minimum Clock high pulse width duration.
   */ 
  real tCH_ns;

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tCL_ns;

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command in Quad DTR Protocol
   */ 
  real tPeriod_Fast_Read_QUAD_DTR_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command in Octal DTR Protocol
   */ 
  real tPeriod_Fast_Read_OCTAL_DTR_ns[];

  /**
   * Minimum Clock High/Low pulse time for Burst Read with Wrap command in Quad DTR Protocol
   */ 
  real tPeriod_Burst_Read_QUAD_DTR_ns[];

  /**
   * Minimum Clock High/Low pulse time for Burst Read with Wrap command in OCTAL DTR Protocol
   */ 
  real tPeriod_Burst_Read_OCTAL_DTR_ns[];

  /**
   * Minimum Clock high pulse width duration.
   */ 
  real tPeriod_ns;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSH_ns[];

  /**
   * CS# Low Active Setup time
   */ 
  real tCSLS_ns[];

  /**
   * CS# High Non Active Hold time
   */ 
  real tCSHS_ns[];

  /**
   * CS# Low Active Hold time
   */ 
  real tCSLH_ns[];

  /**
   * CS# Hugh Not Active Setup time
   */ 
  real tCSh_ns[];

  /**
   * Data in Setup time
   */
  real tISU_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tIH_ns = initial_time;

  /**
   * Output Disable time
   */ 
  real tDIS_ns = initial_time;

  /**
   * WP# Setup time
   */
  real tWPS_ns = initial_time;

  /**
   * WP# Hold time
   */ 
  real tWPH_ns = initial_time;

  /**
   * Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_ns     = initial_time;

  /**
   * Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_min_ns = initial_time;

  /**
   * Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_max_ns = initial_time;

  /** DS output active time from CLK */
  real tCSLDS_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /**
   * DQS to CLK delay
   */
  real tRPRE_ns = initial_time;

  /**
   * DQS to CLK delay
   */
  real tDSMPW_ns = initial_time;

  //----------------------------------------------------------------------------
  // Type Definitions
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------
  `ifndef SVT_SVDOC_CC
    /**
     * A helper class that can generate random values for non-integral properties
     * 
     * @verification_attr
     */
    svt_randomize_assistant rand_assist;
  `endif

  ///** Assign refernce of spi_mem_configuration object */
  extern virtual function void set_timing_cfg(svt_spi_mem_configuration cfg);

  /** Randomize all timing parameters in between declared range */
  extern virtual function void set_timing_params();

  /** Randomize tW timing parameter in between declared range*/
  extern virtual function void randomize_output_disable_time_ns();

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Constraints
  //----------------------------------------------------------------------------

  /**
   * Valid ranges constraints insure that the configuration settings are supported
   * by the spi components.
   */
  constraint valid_ranges {
  }

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_atxp_xSPI_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
 
  //----------------------------------------------------------------------------
  /**
   * Method to turn static config param randomization on/off as a block.
   *
   * @param on_off Indicates whether rand_mode for static fields should be enabled (1)
   * or disabled (0).
   */
  extern virtual function int static_rand_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   *
   * @param on_off Indicates whether constraint_mode for reasonable constraints
   * should be enabled (1) or disabled (0).
   */
  extern virtual function int reasonable_constraint_mode(bit on_off);
   
  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_atxp_xSPI_ddr_ac_configuration.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the static configuration members of the object. */
  extern virtual function void copy_static_data(`SVT_DATA_BASE_TYPE to);

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

  // ---------------------------------------------------------------------------
  /**
   * Hook called after the automated display routine finishes.  This is extended by
   * this class to print only protocol kind relevant fields
   */
`ifndef SVT_VMM_TECHNOLOGY
  extern function void do_print(`SVT_XVM(printer) printer);
`else  
  /**
   * User extendable hook which is called immediately after svt_shorthand_psdisplay().
   * This is extended by this class to print only protocol kind relevant fields
   */
  extern virtual function string svt_shorthand_psdisplay_hook(string prefix);
`endif

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to, based on the requested compare kind.
   * Differences are placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is svt_data::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(vmm_data to, output string diff, input int kind = -1);
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
 
  //----------------------------------------------------------------------------
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

  //----------------------------------------------------------------------------
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
  `vmm_typename(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_atxp_xSPI_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Ka8PKIZW3wBwKa/ye1t071L+4ditCzGY6oV1couFBRDKDCRabRV+IegFzAkpYmqf
AbL/kv+jFU7r9NdypPFfhMs9MuE19CnSjYdndYixvJxs3tfSPTxxFRyiFeJLUzFh
5j0YwJwJe5tpkyqNkHbEIiUYobqQoV1rY00QbqXtZsU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 785       )
yzzgeLLdkdxKiWY5hky5XpWS0iKnRdfQQpaR8tJNqLrPuakqTOzbCzaDpLZGr5eq
8EKyCI9AR3VvD5WV97/j1bl7zRKN3nfVniNarsy00U2kt73EnBnFa2nsU1K6i/oZ
Ctj9bDhqp9oVWON8ApZ0xp6ga8bo97wpLAsZPEvKIBntorojW5WTU3ZBPFTqe287
mNXz4qEc9Qmit6Qc21Ci/7/18YRJ7+cdnH15Kl3u76bL5oO7htlHwC2HDjwzBT1j
44upQQ3OcZ5Abj3x4ZuEwTHxEh5rhFDC1bIczaxVe393x+Gf1fD31GIrujhY7i3P
+6Js/d7BF9FVBApUcWAydc6XQIonMdeMEhWZSPnvlNZgd5YXUNX6qop7SPUKqNX5
ZQvr2FltthdQgsRZ5miV5ezFtBC9YrE1HZdHTSO82rpb+XSmiDxQQZ5yVRlKYCVY
gJjNWXC5RaC6Fs3hfHc/1gRWkHXU9yKLiM0Ud5fRaH7bQ/Op80J02uWyYWEN2iha
F5ZEph29NiTs1SfyNCGDxpBFDF7ULYmxeHa4aH7SdI0vRDOM9by0hPQzpmBzDBre
uUZEb5Vj2OvY2kH3Im8JpbaOzxLhkk7lFeTYBNrCSgiEEBE9u7W7c3u6VPhG7pXE
FhAlfeDxOewu48fwBPLhClgN8XfYDAUFrO4WUDPI1r5Kkg1VhPjk5BiSKCkaYiG5
OOg4an0fvtV73/f6eC9B3GEsifpGLalYEOwqsZ2E0K9gFo0VfySOQu1Mn6w0y8xI
clPZuILIJvIRSavIFMS1xO699ickWJfzv1e6ihpa8RQ09khFtWJ6lNhLje0EnZDO
6Zea/l9Xvz7WhJGSOpTE7UYPh3JNymyT4N5m2VAdr7km79BuAxMSY48J4ji+YlX4
++oSjUk/COZUWFDGFZdBgXbdrRnrGWJ1pAZ5JN/N/dk40HTJ89PRZYhbJcQSJeBL
pkvEO8zY7AwSuc9QmMn01/6XwuuaEsod8JxJryrfQ+jGIhEKpcAxGLohmZZjIW+X
qttMoUKRM8Lj9xxGeex7KzTtw+F+dwEkAxUh2x6qVvs=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
TimGm7BHeRfXHM1kwJ3uZC7KUowLBbQGImEUX9AXqQonZVBLmDbOpp9v4LdF9jqZ
4aUFjB+oppW0BqmhXA/jAcGWAV9g6EFZmo+kP4+Qa7gpjTXLzZ5DkuXQ2Af3w5RA
AK8VlQdIzhBifCm4PDVBCF4xhkPXODcLuKcle//eKZk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 27330     )
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
RqjtWwvH9Jr12P5EJx6KJA==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_ATXP_XSPI_DDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
KJUZMTibsybWlZRXgBIMweQLzjZmJT/tchDhwgyAxrK6cL4/4nee+GalyIeAqUA6
qJHainBd7nrUbY3PA2r5xpUdkD2Zr3dTdDSE5nvFW2/RFcE5uEbAolO9d+ODWqIW
72hycO2Ln3EpOQk+7T8GoPrjVSokUx71iQOIToCfK4Y=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 27413     )
Ft9heGbN/kiOkGLZst3R+TopKiBfQyYeBBloVd8sVnJuoaR5+q56G292x9KXZm94
2ilmiewIQV/mxbActdyDudfpraU17rpiFkbgDKdozXqD4SmQHKh/s5b851xu7mBh
`pragma protect end_protected
