
`ifndef GUARD_SVT_SPI_FLASH_MT25Q_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MT25Q_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Micron MT25Q device family in DDR mode.
 */
class svt_spi_flash_mt25q_ddr_ac_configuration extends svt_configuration;

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

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_Fast_Read_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_DUAL_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal IO command 
   */ 
  real tCH_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_Fast_Read_QUAD_OUTPUT_ns[];

  /**
   * Minimum Clock High/Low pulse time for 4 byte Fast READ Octal Output command 
   */ 
  real tCH_Fast_Read_QUAD_IO_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_mt25q_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mt25q_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mt25q_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mt25q_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mt25q_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mt25q_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mt25q_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
V50pk7Akuj9CvuAf1fes+pg1RpRILfJcJic6Je1BjjAXZGI1lAx1r6Q6pwCwlnJ9
r3+EZ3QQXI1wF9lAGkh+fOsxBpLmXuesWj3VBJkKJDCxnOMJV++ONLMW05dMcSMa
MkDLJkuuMC174bKN3DZYp2x4ct/STs9xQf93inscmHE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 769       )
rTIozUc4SrHxMkEVZd9QH2dQVG5Z0A7gwpEjGOQYepr7b4j2PoP4CVd0YXxf+5Ih
DtYEIylTiaoyni6LuiMDH3o+fFyeNPD5R1hYIIAF9MTnEDxAsFACTfrVQz2mlXet
bPZ920kHY7qup0oVoCEaQFtd4bJ1fIiuUb0Suazei7JuRLOc7GONJD9aEQXyjE3j
Jg9vXvIDehQWHsDwYaVKbtQCeoQmvLGZiXlyf25OL4SQ/g11DmJ7IMTBgF5tqvpz
E7H/nM3UKO5Yn0D7KZSteTIXVY8ObH0MG+9Dg/Yt6fyxkUPQJtXt5AgwDupct46W
+aC8LcO3jGp1wgJO40ma+6WtYvefQhOzQBwDLPDPMzq8p4KPoDXOx8Tu3E+RFnZ4
kKPIs760lmIRsKRzz9H5uFAKFL/7ZgEmjlkSpM94ISqNFDLwZDvSKV8cTxJm1qNS
SZLpqXngqdSYcDo7A0hmY3VGqUUve5zWX1XvZhMyohgPYRa5gfv/OJr2pr+QjVzC
i8k7wzTD8jVLNIWjHYV5XAkegDx7k1sUE+RTLwSCcMvXa+P7aa2DM0qM9+OCjCIG
1H7pEyi7vB2VNjljzHXQubBsqEzJydI6rjK1PEA2buhoertKd5ysTZHZAPSuzKXQ
EY78K6ysSzjLb+MHj0/FpnwS7rng/RXRRhn9n5R59ehXB6J43rVgzvDnUB9qDCVC
E+d03lYTwURvePLO6BNflXo/+fFNziXeDITxwddAdl2gOIqXPQLinDVdEScEkopd
FnAv2m+fLG+wSQcqDbsd4mdA55hCNIvoDLbHBiUxvV1z+swUJpi+pjLOy95b+9Pp
jKFoMATrNEwjjY/jOlJigDh+E8IVq1Hp/UoaqMrKH+/8K2rZQeLoaqfxXfrajl6O
q+jiyMYo93kiAWRku8x0DuWKLnuq3XLucaq9LlD+GDdI/5xR8qq8NROeyNKfcHxA
G5utbYkpfloBEHXDIWGet5hEvKeZxyCNxrS6oVo2JPdQnKc736J+qZ3A8Mj80r5/
97Y4okHuCnmcEIY+eDyc+A==
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
HZkq4+mLmbG5IyPhNdZtpsOi2JoSPwN6Ojv3xHS0PXL5jMlyD/3Hc5sfo9WVFEDw
VSfvIWUYLQFBgn3qmRW2N7LGXB/BfVdeoD/fhbglZTWEQgC08/vOGWE5puuYnZsm
15DFbp6RE2krB5es/z01OvdHTF5ecjglBoKzL1x6fFY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 24976     )
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
ztcbZiPmZWdU2rgMUTricw==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MT25Q_DDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
bW3YJQJicXPE1sxkJpwCW5JnCmGCeHvU9BxNK3nC0lbQq+Jr/bhu61kcQ7jf7qrY
lxA8zxpmce64eYVzQmoXN8OHGSXcHFVsrymFvu776P8NUTujGg25epJv0HBcb0C/
yISGdmZQng0lmsOXQuxE6/E7lFyGSTgXr3QTZSvie0U=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 25059     )
n3+fwi8+X5GuHKZbVD5Ow5blpUzc+2t5skBqJKpnxLDAxR2R7x3QE3uevafVjQVi
RoRlSohPE33WZTS7RZtkgFrM7YcbNUgnYsIzvzbs1KGle8adZlnhNkDhUffie+7S
`pragma protect end_protected
