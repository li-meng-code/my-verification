
`ifndef GUARD_svt_spi_flash_s28hs_s25hs_sdr_ac_configuration_SV
`define GUARD_svt_spi_flash_s28hs_s25hs_sdr_ac_configuration_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S28HS and S25HS family in SDR mode.
 * For S28HS, this class contains timing Characteristics for SPI SDR.
 */
class svt_spi_flash_s28hs_s25hs_sdr_ac_configuration extends svt_configuration;

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

  /** Minimum Clock period/Highest Freq support.  */ 
  real tCLK_ns[];

  /** Minimum Clock high pulse width duration in terms of sclk.  */ 
  real tCH_min_duty_cycle = initial_time;

  /** Maximum Clock high pulse width duration in terms of sclk.  */ 
  real tCH_max_duty_cycle = initial_time;

  /** Minimum Clock low pulse width duration in terms of sclk.  */ 
  real tCL_min_duty_cycle = initial_time;

  /** Maximum Clock low pulse width duration in terms of sclk.  */ 
  real tCL_max_duty_cycle = initial_time;

  /**
   * Minimum Clock high pulse width durtaion.
   */ 
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCL_ns[];

  /**
   * Minimum Clock Period for Extended READ Command (SPI) commands.
   * Applicable for Read, Read Silicon, Read ECC in Extended SPI mode.
   */ 
  real tCLK_SPI_Read_ns[];
  real tCLK_SPI_Read_2_ns[];
  real tCLK_SPI_Read_3_ns[];
  real tCLK_SPI_Read_4_ns[];
  real tCLK_SPI_Read_5_ns[];
  real tCLK_SPI_Read_6_ns[];

  /**
   * Minimum Clock Period for Extended READ Command (SPI) commands.
   * Applicable for Read PLB, Read SR1-2, Read ID in Extended SPI mode.
   */ 
  real tCLK_SPI_Read_volatile_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (QUAD I/O) command
   */ 
  real tCH_Fast_Read_QUAD_IO_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tCS_ns[];

  /**
   * CS# Active Setup time
   */ 
  real tCSS_ns = initial_time;

  /**
   * CS# Active Hold time
   */ 
  real tCSH_ns = initial_time;

  /**
   * Data in Setup time
   */
  real tSU_ns[];

  /**
   * Data in Hold time
   */
  real tHD_ns[];

  /**
   * Output Disable time
   */ 
  real tDIS_ns[];

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
  real output_disable_time_ns[];

  /**
   * Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_min_ns[];

  /**
   * Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_max_ns[];

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

  /** Assign refernce of spi_mem_configuration object */
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
  `svt_vmm_data_new(svt_spi_flash_s28hs_s25hs_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s28hs_s25hs_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s28hs_s25hs_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s28hs_s25hs_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s28hs_s25hs_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s28hs_s25hs_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s28hs_s25hs_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
a2rN1De7z7rTG4r7c003/hnNYILOXq5AFXGdeCkqj0qDzvRkjV3e9R0aN3lHL6oS
zKZZ6c9vZWeAVEnDdo78K30JNyq6KlltvD+5gf8h02x9N5UrMWyDotTUzfpPT42C
YjG44zepmDdIh6I8+/NkDek0t10koBU/yyDgsU1nWLw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 793       )
VKBBGpUmKuANs0o//kfpFfMsQek4zDD0z/UCXFb7qYUhTP5/6JvrSSwcaeyAfi4T
3FcqUTOsp/1pTocZMWYDo8fpNJkRsM/D1PE80jz8ckBlUbHFZKDvoKOM5FzTrEfp
uu+dyCn+3n/0HRwGxHiZbqy4dogW6+y68TGRu9Xn7qRd0F+9iJnqslfFxgaiUsPD
ttZCJyX0vYzWZT4vyxxeDwTFHQDh9qPsh+vpPLgteo17QgYyAi4AJUffOIqNE4/7
EAhz9J4up2xH6a1yLJgEQ8/hiagI3vGh2bU5YAfPBNSmNLnOsHVzRuUfMVRrJj5e
xI+lS8n9ZONkARJkFef1PYFGfGoyi1Usdh+PrdDFgnDvMKHLTD7IvNR7f7DSH2k9
9D89b6JTAbMpQEv7mq7YY4ZecFDCIpG+l8qPkP9bpcYwHn95mgZQ/VYqfD1c4JdC
nEpFAWRPwbz85oDFg8+17FdiiTHNeLrg7E7obXmKUwnsmgPvxnCi0ZPUu2TpXp8U
SCFuyZadYFy8D9v0oO35GVKsa2zLeOOf3secFRDiH0uoWRfm3lPYaujrw9yI4dy7
vrmeb8xpEkpZ1sQQzgWfsCi6Bs8jnvdtUzKjwfPKAWIN28PoSbWHmdOkSdP3YwkN
ikJoMJscWwg+4HZFvmmsYSCQlzRH/nsIwqLObFMiXjFI80pDWnxHwh7qvhwSpaQ5
dl1oGfM9kvtX9Kh/fBSIzmyJrAtngoFKdRKL0Ia9hJM5RJBHlB/9BRbqv1Jr+pJ7
aZArXXPKwNUuUkXQeyDzPPeye12XYoJxuzfBZKSZWm33lgDI6d5ex8RWCNVkrM9A
R0VAL4fabL6OsIlCwmeoODXhB8Q216B7AGDQz62vZLgFQ8sYV6aOQoezktw3F0NZ
YTKPjL1OK6xSi8qrnWY4sHh7jT7y2unynHdlDA+qGBok2zwlqaUP6UtXLxFL4JVv
i5wQ/jUSvgYLHgX+IQcqJb/GXjneaWLd+eZCCxeSw6IB5ygS/MgB1qaWQ7ubjTvR
o6P/1liPkdxvsjPGzTtCz4jGui5/P70mLMitAvHv0Qk=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ahct8vtvi1DsYMrzyAPZ8FMmQ1JX7alyMY5XpALKuX51q1xd+1OyHNV+xdiDsnFH
vr9bAAzM+v/36ihHcyHEQKYFHspMs1jt4r21P10NuLhjZPezw1o25OINhjYkg0kj
/hvpdgihtfrLBnc0zCY4cO28GgkgSv81bCBXRIzVVpw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 31619     )
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
aG0h8DH3VN6ndaBMoynuFA==
`pragma protect end_protected

`endif // GUARD_svt_spi_flash_s28hs_s25hs_sdr_ac_configuration_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
aBBGkf3I31JGdanKqWIsxVTJYEBD7nnm37Xh8KJB9rrcQQ1AypeuJKf9qQAO2IRk
6ThAgkhHg0zP5T5wlCULUvIdnq6LMdOoBEmsjVFSL3QYdEjnrPp+LWKY5K9f6fDY
cY38xoWWw7KXgp3Iy6bkO9qMYP67ns97oC7rDUMH8Fw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 31702     )
ArxCqYlEzUsrmF3Tq0U2y8k5vwqi76sx1ep80UigRQU1ilIxGlu/avi7MYDYOeN2
Ul2fHWbiVeYZjnz91nwxwfx0F+hHgp4uaKkIb/mA2qSkMjhswSxHnxVahDpXjVTX
`pragma protect end_protected
