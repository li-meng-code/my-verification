
`ifndef GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto s26kl_s26ks device family in sdr mode.
 */
class svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration extends svt_configuration;

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

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSHI_ns = initial_time;

  /** Chip Select setup to next CK rising edge */ 
  real tCSS_ns = initial_time;

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

  /** POR extension clock period */
  real tPOR_CK_ns = initial_time;

  /** Power-up reset time */
  real tVCS_ns = initial_time;

  /** DM Setup time. */
  real tDS_ns = initial_time;

  /** DM Hold time. */
  real tDH_ns = initial_time;

  /** Maximum CE# Low pulse width */ 
  real tCSM_max_ns[];

  /** Read-Write Recovery Time. */
  real tRWR_ns = initial_time;

  /** Refresh Time. */
  real tRFH_ns = initial_time;

  /** Refresh Time. */
  real tACC_ns = initial_time;

  /** Hybrid Sleep (HS) cycle time in microsec. */
  real tHSIN_us = initial_time;

  /** CS# pulse width to Exit HS Time. */
  real tCSHS_ns = initial_time;

  /** CS# exit hybrid sleep to standby wakeup time. */
  real tEXTHS_us = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
E9JU/dGEACX7TCM3SOPqVhYgyIRV+cQclVixADQyj80mwyPmmS+H+RqQ98igFuhP
tjxw6W6OcDP0JXgpx1XKlM7RU5KmX0nTZIzfxJo1bJhD9hp35qN8LUUhi85qj09w
hV+3UByDbMT7mAseL3IO9AiXYaV8etJ8ltmjNa37MIE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 813       )
BI35FtrmYkmGMugX9gNmOlHXhfVXFgDSCJPAszzEL2m35vhSwXDVWoYZBeoKKvPE
GmqKwnDezmXCuPHWJwBVQOgxnITaUQR2gdxOpKBZ1ncTCLh3K/TIgUrLjAxr1oS7
zk0o8SiYmKV+1jalQzGx6jTCxZ5/lHfiJTNAA7g0tMgYe4EgO05Vn/jvsl2FOYAt
R7EVMDQ2PPNUhBDEcZrtA+3agkaB6+/ztJi0gZNEn1ed8Igv6hHak5C7S40s2djE
e9bP73K4r88dkF2A7lQRnWhL4Zc9eGTSMzEVu0Uxid+f0tmsvek0cIIJQl5CgQDr
CFbL1DlV81zo2UbwjOeW5kNVSS4OyDQTQXCXoRg2DNo9teEMqabsjkE47yVOyvDa
2aBdWDp34Uf8AuepXR/6V6KpqrOpOb5Gh9/hn8t1tWOrGJ32exEa5PvZzdtOaMO/
7y4rR9/uhCzC6nBqMMucaZy/i9YoZrjygi1zWGw0xfPHHfN3FCWJkWiXS8RNu7iw
dOCB3zYv23m36ZmH2Lt7STZBgkmQ1YvS/Dw7dQN56s65VpPaPKCr/LlNn1Xhxj60
lZVuZrbYR2Zvp6JOBC37EibByF1YnUmzYJzC/c7aTgOKIwIvG5tJSVzJcCWVAvxz
QKlbT9bywhkFz78Iyps043z6p5uDSn0l4ru913k1FVeKYsywATyO3dlF3YtvhKnc
NkY4E9vkydlh2vuu/4O50aYBGTdtpEdh+w4A4L12K6wU4A27VdeNBfumG6SVL8DD
vZI10nHC5s7O8Dz/AGGJ/PaLUD3SM0UyQ+SIgr5p452h05djFFOxd0ut9eYBS/fD
FBBhQ1SilVHRbuN8TB1elHfzaw5fA2Rxg71bSuDkFG+i+8dmJ2zdsfRv8DBmWxg/
LciUthjpjpwn/Ynn30hR42GLhJG5XISWRaXJllyCLHFVGFbN4xmyFnVqQUy5VpHt
Rq2eNua4z2uIpkpAlBiG2sxF95X1G000SlcM6Cpjfsrc8pqyd4Mo+RVKgqHh7yAs
bQroZRQcUDJM3v54BPh0e7NhS+OppqjVeMJEZaJ/xwMJHkVSi+1M8aOws/qVwl7z
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Dw/w+Df1qQnd+rhZ8dnNRvXc7C1EhSmwlyjplCcRAg8Hz+G+16Z8q+krGTk8l1b8
eUHvRr82euai2aDxh+zRv0jPk4slShdijOspzJmW81koBrHSMgu64ziGqFMVdnyb
ektoi+5GJ4D8I+76VOvBhkM/I4Sz3/BMhH8XfW1kiYc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 28125     )
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
VDRq8fo5M7yCJGNPGP3gMg==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_SDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
g+HGw3jU8EhP8WU8DbKeJ+Wue9PsmIiulG5GrSPUMY2R2SZhnQxw6hlzDE/fKEJZ
5V/ADOcluebCCrkSSBPxkgAyQzd28QsoaYoRG3m/1AlGfT4QMLa5wsaOG1Z5SU0O
RPy8bbreaHn7Fa/AUxWGjJIwQDA42WZal5tJqB1/oZE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 28208     )
VqGvLoj80OcZnE6k34VfDEJYV1JuLQpOqYQEnreFoAhe47TH9vVFOnw2VMrTaRDP
RT6PoJYjrWsd4AyIQ+2qbNBEiOG52kQ4svHz6G2m4JRpaLeRQn4Fc+SwgICY3/q+
`pragma protect end_protected
