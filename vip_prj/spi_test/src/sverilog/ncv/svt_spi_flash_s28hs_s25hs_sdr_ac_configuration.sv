
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
2cyFIXpZDr/SZZad1QzUQjyn8EOABqaKC5HH3vq7dk45ypMlMSFiLegz6vEZ75UN
PkV+8Ba9gU5LK84Z+udzpAIwu5KhTfU98NMcrFWcuzImoZBHR2qUPsvC7QHlD4nE
RA6bT7W2aynR4fdeWh/vemi2gFy/qwwag27lcNfWdGag+g2OfezcAQ==
//pragma protect end_key_block
//pragma protect digest_block
onaSG2C7qTf4xndngNgE446HGaM=
//pragma protect end_digest_block
//pragma protect data_block
5hgza5pnZU7hG+RjnLNMxILsBHL77hAFrrRE0p4WXsloQ37khYxSARkRf7FFzkDq
hue31gXED7I5+3vvjohKQ+jYZ9kkHsmoBhjgbCmRC0DR7d/4+GA4MsxLWvBUpqb3
iFFAc4FPVzM1RtIU2T5fHhw+c7AwHAUPk4gbkO3Q3s9SU/rJvX9eeVy4CAUgZf3F
J/X1QDanB0zPp1CzHgiZhOJ66heAXCKfTJDBM4tsM3m83AdB83UwtpU4qFk8dE9H
NOWfcoOM9pqocNJLaUCm/buSl+8uxYKZBgid4jB6jHOcLfHTIEAeEWtGHa4ACqjK
yxDJQP1VqqzbXgZImk2l/AYIEAe1vAQyHCC4vSTtINQssv9Gv0+Bk06r0qbQpUe/
ThY/+nY0IRKEiQs2FC8/bM615Z5rmusqPBVzp3kMip5AuvJbOxqBjo76OhuW+SD9
05xa2zkIoCVV8n6s7mlnnyvIIc+Y24Gz8o22TLcTuwCr7n++2sME9OUfBw357EMX
wCdKfSB2sPX05PNtO8bPzKvvYCiUvwlP4pgjb5dyyAepynvDtjoXgFpYjvJHsguQ
SACDxWQSjdvjvQ1xiVJDxCZ9qTpMNyhoDKszsXBqjm9Z1GYROthAitKoFithi6AO
WXLVynNyIcrb+riNcHRgu0Rm0D97Aa6D9Zm5QClETGQyo/K6EoKtFJE21PkfIloI
t8PGRiXTZK7Td+mvN6jsOWXFa01X8odwUQJjbfPnlQhmO7OWmTgICcZ+GfnZKpqK
O6ThS40X/7rFu0/mnTdF3WsE/IAegG/v8BSCyLAR5JUANfi1iSHqCZUhfdjijN83
Xhj+6MOBU3qXrUoVoug+M5EOaFHwagkc6wZ+LXS0ZBA0ea267+J/7UYHtY4XNYMp
7aDMuA7+xtoeVrBnCzWFKlUvgitTJUoDZuAYQBtgfvHa9R1fqwsMOKCTTmr45UTR
Y4vYQfejBYiK8Zn+NazMpLGbT8QJXHZd+SJpL1/JFsA+7qdtIeYU0otQtsDJwe3U
3rBl5q2HECJl8R8hGrUtNtezVpeb1/T9x47wqUtuCHzuiuJpWMjVAcUneOoUxVmM
B6E/0XXQME3d3fyjgY3oterEs6aLDnTfJ29IDfdP2ZeD3KWEDJVt/rKDVQWbRX+H
Hv4srWwzZ4qBFSip9OWqNVUM+0XXWq8oXBBH2+ybkHvvN7Nbe7fZ1prOmFxEMgRk
AhNLIznQuU4dRs6WJwOYpV9tytRqc6347Jev4f56BsG/aUF9SEuLlC5ejyTfIf7d

//pragma protect end_data_block
//pragma protect digest_block
tbS+MH4r/2rLrf4+fimqei5MWho=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
mjZoZ0wf98jhIc3UXYAYHVFQdVGtOCHABREZ7wMH2Fwv4UWHN5Mr/d0K0tUgHxCx
6Hf13e4oTu/TTNDe5U9mWfoF9rEVRBhjj3ptyqt2F77AvToIBZtKh9/Yx5gYmH53
8NwCMEG2Qf2KoVKXwm/AG2oLIFAzrzHZRBesfy0w5LgNBkj0vLQ/7w==
//pragma protect end_key_block
//pragma protect digest_block
OvApeuXrqU6A/Hdo6r3/hDwQOQY=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
HYGb8Bf33PX3ak4utLw9i287ozE=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_svt_spi_flash_s28hs_s25hs_sdr_ac_configuration_SV
