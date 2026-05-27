
`ifndef GUARD_SVT_SPI_FLASH_JESD251_XSPI_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_JESD251_XSPI_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto JESD251 device family in sdr mode.
 */
class svt_spi_flash_jesd251_xSPI_sdr_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width duration. */ 
  real tCH_ns;

  /** Minimum Clock Low pulse width duration. */ 
  real tCL_ns;

  /** Minimum Clock high pulse width duration. */ 
  real tPeriod_ns;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSH_ns[];

  /** CS# Low Active Setup time */ 
  real tCSLCKH_ns = initial_time;

  /** CS# High Non Active Hold time */ 
  real tCSHCKH_ns = initial_time;

  /** CS# Low Active Hold time */ 
  real tCKLCSH_ns = initial_time;

  /** CS# High Not Active Setup time */ 
  real tCKLCSL_ns = initial_time;

  /** Data in Setup time  */
  real tISU_ns = initial_time;

  /** Data in Hold time   */
  real tIH_ns = initial_time;

  /** Output Disable time */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time */
  real tWPS_ns = initial_time;

  /** WP# Hold time */ 
  real tWPH_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_max_ns = initial_time;

  /** DS output active time from CLK */
  real tCSLDSL_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /** CS High to DS tristate */
  real tCSHDST_ns = initial_time;

  /** DS tristate to CS low */
  real tDSTCSL_ns = initial_time;

  /** DQS to CLK delay */
  real tDSMPW_ns = initial_time;

  /** DM Setup time. */
  real tDS_ns = initial_time;

  /** DM Hold time. */
  real tDH_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_jesd251_xSPI_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_jesd251_xSPI_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
f/+WUqaVb9JDsfT3MdfUsicqSdxWNGL5f5c7FO94KYvRxNQ2QJXUR7L9C4xlUM+G
3iOUvpFn2yXe+l96mRy4QUwPI+QSpwuPwqt1a9npQdS4z1JnGsoc7r3ds3LJ560Y
c7ASIn0MUi7y/3hvEVOLouWFTnqIDrh+Dkt6yrxXKVE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 797       )
DFzIojI12bwvHXlH/nBlaDnU9OXPbUY3/w0qeAPy/dSIG8mwQbUhaCi2SbuVuuW/
vG3QjG7F6TigHWf1SIRqiPc1X55k/IkgKdqfLAqGVN28Thp1bj1UqF3XCWx+PmBk
F5c4hrNXGVtR9XhPS4dn0gw7j81hGFMieOtlpCYIRUs6AtPeKRRrP85sBQpuH2PS
rwaJCL6ZI2XKkms6F+w76ulcnluDasUpTbSp69G7IW10GkKi0B6ss9dEuT8Vd0In
FH5EM+U4YcqU8lpA/U07juPYmcfpAJeGdZ7PZekkqGfNTMQdkJlKhWmuYFuXIA6+
09Z9RM1AFRXMg410Lh/LssOveDp8PTREJA/uhpsHqHkNx2r+caH1Zwm66z8RRhxQ
+R6YHLmBVlMd8opqQUPr8cnbyyOQjxeZSHruid6Hfc3tze1PEyOj2p8sSz43yVYP
8SAz8XjU5TwhDveEG+L1zIQ8nMojtuCBVx0zo3HpuvDUDRWs39z8pjrSuFpeTjAv
TcboWHc1uMCbu06zDHoAtTp9A/IEd9I5nbkpFGmd7S6erQSw4xTYK5UtQ+V6Hp8H
TBhBK7QJuBVyQ70DeYM43Ed7j2FC9GWOX7lpQ3c4GrheGM29Fc53OyFlGX9iLIdq
j8oo08b1gZvZzZAqLEPD/WTUxKk1XwuhMs1sV79tm4hhoLf2TojYYBOz5oVGGKvC
YsyGsFW9tukiSY+ZnwBa7u1a4RahwDQIasMsLJD/T88EwLwjGVm52QD0AfNZ1QSd
mOL4i1EkgVIf4PjUrgWGn7Vrbd3Fmob+a/kNWeVXnpe5f+bdF6x42BbTk+Bbi0nN
ZJpssWslIuw4OVhMWtiGn8AKff83cnVrCrxvaQpcdx7q8O6JDNSgrzl6BOjSFPzz
N5FGFEBfxlzHogbi7wkyl47ATJgkBUjnUq7rnc7905fEAIL4MO4fzHC47l2oDbAK
qk7OpyoPJCru5VCACbJRQFvYP4zeen/fmg93fuRT6YGt4Xw6n8puMDFYBMMZo4kT
WjTAIFtedNsQGXsHSJ8sS5JlqOSOvCx9UH9Tvql+5GI=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
oQDyuFBWMw93KMHevPl/91xwJHe4h7Xy+fDghCirL3gwit3XYnR6qWgNCKFZMxsx
6lAXTKg3PCzC7/VxLYz/WmwyXFzslsA8GZuUKY2Lm+qQDI5EWRa3qsi4hZGZT6qv
kFWLlv9pBH51fq99Yb/XNxVVjyHyAUP3Jx+IM6SOzUc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 23250     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_JESD251_XSPI_SDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
i5JojHVQWk3hDmTciRayjQAvaofqQo32zK6+wKWmWfye6hbfrKZfQGKUCuQLMHFO
F1E4WlAlMZQ2jjevKeRrIyu6SXgtMprIv6BBdqaetjcyC7u2aaxBoRLnrIB2ypTl
nwHas4qIicSxPV5P91KOq474F0mtGJL0Qxmbsqys1Ec=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 23333     )
uk8a2yaDRRQxEOTPwGDYoiR3GMtc0j7lNKquVFDz+aNgq6mAuwp55qhEck4wJV5d
u0UbNLnGbIl/3wcs/1N+V6ZJwyj1TYCD6tisZFvOwfhpXoDUWRnnx9ZZf2hFaq6g
`pragma protect end_protected
