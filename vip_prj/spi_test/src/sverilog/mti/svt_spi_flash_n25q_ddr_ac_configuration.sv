
`ifndef GUARD_SVT_SPI_FLASH_N25Q_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_N25Q_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron n25q device family in DDR mode.
 */
class svt_spi_flash_n25q_ddr_ac_configuration extends svt_configuration;

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
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tCL_ns[];

  real tCLK_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCLK_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCLK_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCLK_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCLK_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal Output command 
   */ 
  real tCLK_Fast_Read_QUAD_IO_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tSHSL_ns[];

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
   * Data in Setup time
   */
  real tDVCH_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tCHDX_ns = initial_time;

  /**
   * Output Disable time
   */ 
  real tSHQZ_ns = initial_time;

  /**
   * WP# Setup time
   */
  real tWHSL_ns = initial_time;

  /**
   * WP# Hold time
   */ 
  real tSHWL_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_n25q_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_n25q_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_n25q_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_n25q_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_n25q_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_n25q_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_n25q_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
mnCVA8V4oe2qHz8jwgCAueVzTRgSe5MuWTuqoBnCiKiaymS4lCuleFV439Fle1od
lxsdTx/vahC/+ipdAO7CRFWkJKlUFZO3wRBfqd6XkXder6bgQ7dRUeg3E5ITaE61
hGRDh5SqqY96sTCbue1rq1Gxu5FzXFzSvJtt9po/YMY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 765       )
OHcLX4M1jLSVpVJgpgr69/mmQg1mq4DiI48/E/lLIstNcidtYBYE4+27zTNq2Kv6
F/KUgRi0ZKUXps/1JH8jEOKXG8k/X6/iO+wpzU3uWgUr+MK8f66WjN0KWUkuKbKm
mp+u8lf7HkHlcQrfpHK2+3pv+VNhIzdMBqFw22G4bcqS4JAemUiilenIbz6CTOFI
tSr0ue0kaj+ccpfgfr9/cwXoQlIzo84jd1BXba6vahrX9gb/IPtGG7Pckj2NN/66
Ts2AZKLkVMHVTcQsYzS9XNbeJFvYTH71I5pjbVDBmuTHHsS9jvanZ9+zhANpMGjt
j7EYLVDhQNF8Cw8OG/lghtvLympnSWCMgy3XNkj61tPQoAW1i3Eq8xsMCb2AOsYn
qch+CQxB7f/CUDnnJEELr8w9tctnsOpTxovmIXiZtLx0BpEHH42a+ELVv8xttiQP
rZN8+Fdek0RgoZjZ+ZkEjNiFlDTxFw4aJUr2n82UVe5jwLJWsxs5hryLq1NM6cAy
tL7fA+yBb+ZorYXT0SpnTr4Ad2ZjxiX8FLTJmcQ+JkWZ2cxypo+9GpdRXpJB0p85
wfco681NQWG7Urq/U4PfVmgax1cq8XyfNlI66921Zwz7hpdR9UbIqe0AWeKLfX+X
q5swFHxd2anTBNMLA3T3pUJ0IeMAssEaJNxKW37hPJzppCanEnsL9rD4ON2aveSt
1wRve75W66CP6dWNFJJBi/4Ipfwng9izCOrUmrsuB2M9upJxwnlC+N0vn0ljBZ9z
WJ+05S4Sti5BOMZxDuMWSu2OveNa0JRX4ZoFCeXrn82iQBgMR5p0gIjQNFY7YEt2
6I95RewJGas/BMHCFrdb3CuNSnOdfpN5Q5RzJ7AVQzCUP5VflSSUd+H+kZc3c1Pf
T5ynsbTU4HYWTsyUKZrUC612V3qqXIUeIROA39xs+jBORBhoPvQPyTjt3D7m5XiA
VFbU5jROyxjshCGe7eJetgPBetWC77K20GKeCgsZ4PjNo9zqPdcal9TYoEfkzt0B
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
AhY5zHzvwgSAhSLhAgFCdjGK+N7OWvpMaZhItp42FR/DBaX5EBlUhyV4wa3Vd6v5
o2SSATLrTwzhWk9OMkPHnlsTnmOha5eZfAQh/AnDA/D3Nw+2hdNUB743bLlQ3bKv
U4VWFDvdd7MFvQNAJ7WPmNYMdZ9whWahdsJDNqX8r8Y=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 25772     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_N25Q_DDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
P5sqTbGKoTzmjqrVZS8UOcxhHpPsszsAOHHZczbIXevF5cfU4tySJmAY6Grhs6yO
dOm11J4gEhaUatsjdVWsHz1Z6vDFX17z5zNR9hUL/Y9kG4Ib1T6L2oZvu02gmalC
LbbLxf1OzLYSrhXRrCtDdwMj/iYjtt4019Yx6DB9J/w=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 25855     )
EQB/Zzh01r2Jr3cqf01zbA0eFHNfjx3k0RFk2idOUcOql6baG8nwWwyldoYPOZff
TesdsIIuVnsHypTy4IpznxJ4xzforZMAUA3rpNnISuNkr5gthlFd0eKbQeQH9TW1
`pragma protect end_protected
