
`ifndef GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25UM/MX25LM device family in DDR mode.
 */
class svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration extends svt_configuration;

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
  real tCH_ns = initial_time;

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCL_ns = initial_time;

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
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
  `svt_vmm_data_new(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
TizB2tqVDzrW1ZoIc3tKaNlzZ4VTbCoWirnzz4lAH1RyMtl3tzIxbWmZoWjxuWfK
YuD70m+QfFuqgKKJf9Usx77JuYnEIyCap1LKUWER9TVatISWxhM/1FE0t8s9Pr0P
TW9hKY0AoTTPZM7lus+zLReF800bEYCr+OcRX4YsPJrj7MedzRs/4w==
//pragma protect end_key_block
//pragma protect digest_block
jbsLOmjmSZKw8xAMH0gH6mVtWZ4=
//pragma protect end_digest_block
//pragma protect data_block
exdb48Gqw03AEgKPrfOgzJkoDbmNQHfH5A3Xi3a71FOa3sTmlCStv8VqVkeMjVer
Y8Zs5CNj0s+sCMxXSgZG2YIX5CKiMiZ7Xu0vMwgjJWuQ7SkgJluM/Vie9hLQjLZ4
sHkXGGeHrwMU1Vx6BQh+ESfj/hmz1r0j39hAnWduBlWcgzLhgwaROTSN8YweC9Nj
sKNz0M82wqeGbku0mHbpobLkwv3piKsD0EwryTrAthQ4hdT8Zl4sV90jKKYGP3fA
4VrmHOeIzCzHy47dt62fwJlpPU6fkGOC/6HUwTS5h6cz3SPd9P83yseaR5mAD/cm
mPn0BEpl5YwlxebdoWfELjhKM630qnFLx5bmekLKOKLqjRLIr6lS/RputUPo0sDk
gW9UDMBXgdkXNE0qU8xZea5ALw3rD137ig5s6oellcyRSYTuhlWwkkXpcyRU6TdN
78qUxz57DRXR7b/2Auxp3uQHxspWvBahQHIMvuFj7pPKhgaKYpH9W38Q2motiAmR
1l4s3S/72NeyIWaGG7BFzHkk9iezfHhfHfbj3ql48jnTy4CJnWN8Kf4MANpvab9Z
eCLs4HN9SRguYJSmWxetyBrw4GpytqWpQO/nl0KpQqxItGFMC1wdDfzrlFNx2xE9
JLFSKuRsUf5OHyHoIz28xDggmwzamSVsRsH2Ri5ukv0Jk/MVS8ez+Bup876PdIeZ
mGeBDFOuZtVBtPQpCpTRkV1pojPBT/OPd9995uSlYSC23VeWy47MnSz5F0pYubmW
cP6O163nrAQCWF2czo+Q8xjILP6QLMt6pz9hXI54PU1zJZ5ZWA7lv2/ocF3LABpa
Wis31t+30IZZumkLV6zy9sb4bZDH1V4Y0GuknuMNxAYcAwuhPr1WfU70e7iVS3st
+bM8v24l0TUEHEo5smdXiUeDX4ON4uauu0G/yDD0fu3KyKEx9aq9IOGk+Fhzr/1q
rlymt8VEy/lc1+cEMfAFg/M4UFM6MBjG/2sNoQlLZcvCXIOD5AWQ8JT8vxaHvn4t
CAhqmKsXSEzPBQozlOyOopnH4aKJHjczSf0Z6MxYpHhd8f9ivlctd/oQV/Fvh7NO
kVS/moF/F4R9fCGjtvMKJoIQq+3VPTlbstIhMcw839sV2UZCO4axZcR3bXsLH5LQ
TzsOnkuOs2TVcjikTtrVwGBSEMDelUNQF8NFpDh+IkmIoctPcKfphySrxOSkZhZC
4UzJIvEpBTmhxX1k64KxQ3VjSjXsQYrmSN3mP3qrEgG5gFWMu+0wQ/dKUHi+RUBL
QgJxUoNKDYIt5SUrCtbg5Q==
//pragma protect end_data_block
//pragma protect digest_block
ip0BL8AcUgPZk/d0gPWPbNn4fo8=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
TaXLaITvTmLSzSw8ma+tDsgt3kaBh92imT8u4Zu1sauifelQvFsI8qasZWvN+shU
HRNcnbj3/AUyrtWDj/GQTyxeOcsmKojYo74MjNM+Kp/zc9anYC1cOANVmVCxkX/y
DKM97WYAT9kqKxXOO51TfjkJ5GD2DKAE2i2xGLizsElxwQJbDRlUMw==
//pragma protect end_key_block
//pragma protect digest_block
l5nou5VkLvYm0YZqqKUMESrUwaw=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
MvgVCM9QqniF95C2lSa4Fv1jJcM=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_DDR_AC_CONFIGURATION_SV
