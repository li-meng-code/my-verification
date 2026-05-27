
`ifndef GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25UM/MX25LM device family in SDR mode.
 */
class svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration extends svt_configuration;

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
   * Minimum Clock high pulse width durtaion.
   */ 
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCL_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_OCTAL_Read_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tSHSL_ns[];

  /**
   * Data in Setup time
   */
  real tDVCH_ns[];

  /**
   * Data in Hold time
   */
  real tCHDX_ns[];

  /**
   * CS# Active Setup time
   */ 
  real tSLCH_ns = initial_time;

  /**
   * CS# Not Active Hold time
   */ 
  real tCHSL_ns = initial_time;

  /**
   * CS# Active Hold time
   */ 
  real tCHSH_ns = initial_time;

  /**
   * CS# Not Active Setup time
   */ 
  real tSHCH_ns = initial_time;

  /**
   * Output Disable time
   */ 
  real tSHQZ_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration.
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
//  extern virtual function int get_clk_parameter_index(svt_spi_types::flash_command_enum flash_command);
  

  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25um_mx25lm_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
PMvr9n7tarC9ABpbnLEhfkQDtGDeaXbMj7phnCvToPSPf0KTyMWfJTW+Bzoyry/w
1b0Nf4PKUqlzxcSiEsFZbYZMSsBCCA8v6/CSyFoS5vbI+Rv1F+zgaDAUomF01Eje
hvglcMcAO91wFsQOMVBBH3V5EGO8TZfWr02ktnqPIw4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 801       )
NlXtzHhjnUCzDIWH4lRq9exNg39QQe37VyQkCRd/BlRjNNJVw4CbS6cghxH79bmL
IZLBbB2feSFIj2Urn+sQQVmmTxgO02pZVDyTpND0RNTAwGQYZSg2F62QLrHUfNft
J9t70gSCgVEMQEH8/IDIHd6Jig7GxgA1+xkbvSw+jPLgIr3TqdK4+GcRQcwhIqQS
K+Wy1bzxhv1bYBXib72js1a1W4W0rVyoppBgPtQloaFjwbMoldAcKFvVkvtPl64n
MbMLSjFt6R7zpR4KjYSclNt8isKOJIrKvQxdFgb9vFpWf1SnleVByBBdBOhMGs7R
efVbw+CMWe+Uka3DpuEmC0Ere+CIqRRySmp64fAZ8PsQAEjrsdIIEic0BRzhIeXR
DF2muMs3RtbDADbjPlO1cBBNyOCP8wQ7X3kr3XSJnaGx67DfK5qvSPehqvNVBWmd
794J3/WoPB4ivNMOiz9X/Nh0kBAdyXu1EUj6pKpYrV0PGDbXtkB5pwJhcUYDxyFi
dzceZY0mW9TOrPU4gF1DYQrfEASJOTCTPOHytjiOpL634KfhN2+cU2nBEuizz2GO
tLlSpKPBVv9j7VNq+XFZlWQyC1kJQ6biRhEZr1eCFOPqbkknVTJAjN0ZeBEHuTFj
YwF4OvOGp6vXN/GOGTpEE07Rv4yKL0ZhcdU4s+CuKwzlCEdHoEUm71GRwQTUuPfq
nRrvZIvQ7nzlQmT5V7eP0gQtVWq2HdNklPUlazNQXf7gtkOJgO+CSkf/cF3HGf1V
wqHuK5bu6C29i+AGAXIIQg4o7Jar5ln73a+JPxzRsvj6ea9XdtCOKktJgxmxURGl
yHxcUSSnBFVogfn5kb+3iM+80iEJvGeM4sgkBa+A5Ag/HgYkAXBeHNn2Q9FNeRW9
ZdVZxI+zZRrK8O7s39UH90+0jq8qHI/meXQXXoFMmM6vgWIDn246nM1CU+/zSxK2
Gai47AfdWHOZH7Z2mvFcgxuqF+pxqk3oXqhGCE4ianW2eJk9pFt45iT7qUnW20zV
T9WAcn8tHXskgXVUs6fe63VVr4y7viXe2lP78SYwPbNoBUeSzsqHoucYi+5aQD6b
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Nlk7JwSFwIxT/O/Q7TbVl6zVp5aalD3bG80cfjQRoPS9dhbuGrXHmEa1NUDeaFZk
dXLLXpMssehR6qZP2jcWKkNNPHs5aurQEdiG1CtHFFWho0aX5/QHtWlr8BctBP5C
oJtr5BnBjcBuHG37npQGZPiPau7fBF8ZoHIGczLrh7I=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 21386     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_SDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
AmO0Nsm1B1wkr/GBxFkrl6AgyQYHpGpcRyXysp0eg302rGqI8D6T7A0GSd4EV43r
RDdf6nYtZWiTATgLM9uZBhfHMGBwzFpecn5MUaspQi6L2l/4650Rvv2NG8P4fRLm
AYfUVUZwpGnMLRQAmRSBzLzMes2J1lRhoTWKCPzCA9A=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 21469     )
fqu++HKj/U5YccqwkvthxtTkOwhd9VtVy6fXsn+ZPMQaAy5rl0VvUMpW7ns/1V32
ImmgztPCM853BoLpeJCQFgtvMsrHzYLs21q08qvVtizcMY7r8CYzpPJiTol1tSqY
`pragma protect end_protected
