
`ifndef GUARD_SVT_SPI_FLASH_MR10Q_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MR10Q_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Everspin MR10Q family in SDR mode.
 */
class svt_spi_flash_mr10q_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width durtaion.  */ 
  real tCH_ns[];

  /** Minimum Clock Low pulse width durtaion.   */ 
  real tCL_ns[];

  /** Minimum Duration in ns for which Slave Select must be deasserted in between Two Instruction sequence */ 
  real tCS_ns[];

  /** Minimum Clock Low pulse width duration. */
  real tPeriod_ns[];

  /** CS# Active Setup time  */ 
  real tCSS_ns = initial_time;

  /** CS# Active Hold time   */ 
  real tCSH_ns = initial_time;

  /** Data in Setup time   */
  real tSU_ns = initial_time;

  /** Data in Hold time   */
  real tH_ns = initial_time;

  /** Output Disable time   */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time   */
  real tWPS_ns = initial_time;

  /** WP# Hold time   */ 
  real tWPH_ns = initial_time;

  /** HOLD Active/Non Active Setup time   */
  real tHD_ns = initial_time;

  /** HOLD Active/Non Active Hold time   */
  real tCD_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_max_ns = initial_time;

  /** Minimum delay between Hold assert to Output Invalid   */ 
  real hold_assert_to_output_invalid_min_ns = initial_time;

  /** Maximum delay between Hold assert to Output Invalid   */ 
  real hold_assert_to_output_invalid_max_ns = initial_time;

  /** Delay between Hold assert to Output Invalid   */ 
  real hold_assert_to_output_invalid_ns = initial_time;

  /** Minimum delay between Hold de-assert to Output Valid   */ 
  real hold_deassert_to_output_valid_min_ns = initial_time;

  /** Maximum delay between Hold de-assert to Output Valid   */ 
  real hold_deassert_to_output_valid_max_ns = initial_time;
  
  /** Delay between Hold de-assert to Output Valid   */ 
  real hold_deassert_to_output_valid_ns = initial_time;

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

  ///** Assign refernce of svt_spi_mem_mode_register_configuration object */
  //extern virtual function void set_timing_mr_cfg(svt_spi_mem_mode_register_configuration mr_cfg);

  /** Randomize all timing parameters in between declared range */
  extern virtual function void set_timing_params();

  /** Calculates Random Timing Parameter value for #hold_assert_to_output_invalid_ns */
  extern virtual function void randomize_hold_assert_to_output_invalid_ns();

  /** Calculates Random Timing Parameter value for #hold_deassert_to_output_valid_ns */
  extern virtual function void randomize_hold_deassert_to_output_valid_ns();

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
  `svt_vmm_data_new(svt_spi_flash_mr10q_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mr10q_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mr10q_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mr10q_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mr10q_ac_configuration.
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
  extern virtual function int get_clk_parameter_index(svt_spi_types::flash_command_enum flash_command);
  

  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_mr10q_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mr10q_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
E9LDI/KaW+VfTR8xfNDQCZPiZdSpbjajKeuXErdTLvxu/ta0JljS+BVgvMK3qsfj
vccNzufnLYsOaPaT4S1g1FshntNjPDAmozvcJyUhHS+bSSVYdhbyHo0GVh92+yko
ZEdWBf0UkAVzbN0glGoX+1+v/LG5nfq7j0AvYr8U/PWeZUfYG15agg==
//pragma protect end_key_block
//pragma protect digest_block
eVRUijg7StHJO0w+oNRqCbBP6w8=
//pragma protect end_digest_block
//pragma protect data_block
/DW/72BrCcBl2Yz0BtR/yeKmr6yFNImVwTBYgi0OKmoar7DTmgEpShiNzOhw34j7
BHl5t2KCYt3KbO85+gZodTe8xbbPV6UC50/cCTshf1ehFjrIe05QcMG6vaRObug7
trqi0A32jdebWuYUlFujgD5M2q7/fybzQCIbUPqq4oH5kz3uD945qaEjlWzKA3kj
d0dA6prsf1qyji0iDpp454O7f5RSexyWdml7B7Cs2uoRh5njtqLN3mLuvjBiTgSZ
8trCKZeCpnMnrNvynDEXB0Flqs7f+niQy3Mjl5Xgtbp3XjevaGAH2BG9JCi/kuAg
4qHuIpMCVALE76BBGVexJXmYBIFCMi9srvjdMQKpipspvLPDvBxfYVSAUwfqb81k
Ff8szXNDCRfIUYklcLczYA0tl9DLi8RA7CiKF/m6RCNR65L6rIgpmbI3Q/7U2nwa
J3+uaYS333Y8swXZLTgiB+CNm/HnSmzGvX1rhvyx8Q6Sm3QHE8X0Kycx5FN9fDnO
O7GNQ8r0EQ8qHSsdj7WfnRJBwT24LxjSz2Y4l3B6Avm5HQPMpDYRLFxi057aVoOH
1jzB0p+f2ZyNIFjQVrW+S+VBGa+oRIxt9Knq6dWXyX0g0WLiCGpLP7X3dFM1S6ya
VJnNguPh9EHuxp6S9AF3momiE83gqTZv11611r3p+QZ+ssQusoyyEWgkcVNjDCzr
CViT/Gb78s4c/smkkNdnAm+qkcVaeOBNxd8NdxSuF4YlXefVp1cT8Ynfgo3Qojuc
gwnhjhCKdofCdCILvqElDDynlzo6BE1R8G6VKyW0OwjznO98+Qxn/a40fZ6m/BRe
dNC2gSRHGdaoXT/fAAF96NGHg5dGt1cfBYBKnLW0A3QK68JQcBb+rhGp0vhfIgHZ
iykg75CwVlsleNphW1NUU5O01jl8pG7TjS0GgOY/jGTa46WOWRgTHxZCSOKHnUaa
AD+tEuRpgaWvdHqrFtJ3SkI57f5o6kuNKkHh/Pfq7xkyVi4vUl9o4WP9PgivqSJ/
yrjglgyQRqGqBU2lcJd9cRR1XbDmDiEUnKMnyTGIc/J66hwAfoyBBTl19z+aXGwV
lq6dz59MxcEOuHHjEBxUfLiJLBFKVJmZVv5ev5n9CwShx3eskl1hauswX/y1akaM
7loY9oyP2Gn/0zl3BCWlxMXwl5/oRLLk7V0tS0gyeV4ANWLkMr4EZXhVc8CKqB0q
ejQ3kJ1dQKa1wsYARyq5uw==
//pragma protect end_data_block
//pragma protect digest_block
s/YR4M+6l2Atc0WSn9mO78v70Sg=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
i8Q6UNprzHg56HIL1LqB8u88wFcQfZnlxUpe1yRz7zs5kSxkr8hKK711uliRkeoF
nCqDO71MBeQgiUmveH8XCqi9KJvg01lGkMAE1tVm5P+zSdwJW/lQEJUDJDgoyzgP
Tc6ssjq6RCOKM4gI8IyVqj/ObsrpJb3k8sst+rd5WNSw8dprqwWA2Q==
//pragma protect end_key_block
//pragma protect digest_block
aD0N4K3hpLi1kwZWfpVkPWVOfzg=
//pragma protect end_digest_block
//pragma protect data_block
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
2JlDQPbMqnRJgHI3JVXMgw==
//pragma protect end_data_block
//pragma protect digest_block
icOloxRmOB2KN5ISLU9jWQem+dU=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MR10Q_AC_CONFIGURATION_SV
