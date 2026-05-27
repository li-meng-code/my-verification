
`ifndef GUARD_SVT_SPI_FLASH_S25FS_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S25FS_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S25FS family in SDR mode.
 */
class svt_spi_flash_s25fs_sdr_ac_configuration extends svt_configuration;

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
  real tCH_Fast_Read_SPI_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (DUAL I/O) command
   */ 
  real tCH_Fast_Read_DUAL_IO_ns[];

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
  real tSU_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tHD_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_s25fs_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s25fs_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s25fs_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s25fs_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s25fs_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s25fs_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s25fs_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
nbTxbJdQ/tky867+i7QUcjda/VFOJvwU4o9gkVa6IQ3BWOf9LtubCoex5ApQc6z4
4jGljhkyYKYVo3TLQvF7XGW32Zrqr/CUBr55ERukPazM02Fp9npI0nKRGpaSHslJ
8QjJ9FWMwlZQREFJI28tv5ZRfBsct71bLDlxRhr35VM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 769       )
D06/KQMabcbu0Na3JnQbuGGVuv9nL8BNm02kP1333/qjsPsmG4tZaGNjviL+vkPS
Y+Cb6yuxLXuFj0RtJyjSqmZ7eLUEpM5gSS83lTl3sqWBfrD9iVzj6rdnOE9PFNnR
jHRkbH5InemrhGpFyPraz85Y2e5qzdUXSeIAmCDKOMtOMHK6ykwhtdd9MRP2thIM
yATajt7TNvSVnLVd3I4IRW88cI8PiKDJQUNkv/4YFN0/YL3EAGiJwTP5dx0sP9Rs
z32wpcVCexkH96DkPcdMm5931pi7wE9lw6VJnO3T1+q7UEePdFKSK2LTo7tTyzHn
1/9+oRnd+TlSFAfHkniQgANXTXO8GOsYoeqYwVnebfN4Nz6IwC/FSvpz8XNfhdXA
oWyug+zJvvMJlscthw9N87w5YSDQhHVM4rlxfbB/6RlCkih3+rmR7nnuCJgLohvB
pOXjCJc650W/aqnH7Ju14eFU6f1xQXWp0feQvra3St7ueyDNwwMS9D/ku/LqLJFY
PKYGDd1tZ07jWjyqJMRv0CaDbhwYEdI7YxNc7aZj5r86XgRFJUhnh5xeK/XKU3eV
pFfEiv4zncda5I0K+hcvWwlcExUqc1/UIH6075VFigkn4RMbl5cQnGr+HYYCLy2s
6NCERFIRr5F8wL3GNWwmj+JOjgtNECr3XgLH0GBPLy2z+lNxnFT0nFCrtD1Hys1U
JXxwrf20bJkrNqakom7kWumkNhJc2uBay/0XsHAGTUvo0gWTMRfkRpQ0MG5t2jGk
/Ms5Xs3YPnHS8zthfzvJc5b2gyEEMPzAA1yqrDL2ZEEFiaILNy3NCOoJiYqQqpfZ
OcwwfkBYVGh8KChof3Xe2VqksR4Uu3ZlLDZqRFcFIIOHcL1dN7Zc8H6YsCpLHhLW
zV281uIAUiXBCaYEdU2Dg/knI2tcp0NKpih3bqPK1r2MGkMqDiCUWce1D9FIh1uz
rmTVWVNopMeya1BGMmHH2A+dDHyoTjfUNlmqIo1kBGgfKTBTWr1dbUsruClpIzXt
KxoRA1co7AakT+vekW847A==
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
mPHxv+2UUiZTQpoHBaDuAVRM/c0zIG/ORCVQI8NdM0YM6HfMaL9ivQG09JSto1of
stEtOJ39y0/Z/hGw6mvk3xZyhylYr07+q0wXd5aeiAss0dZC4XeQ1d3OaHi0M8/o
gvZuO/FFm7vKPBELYDnSAmEAIr+mDlsXYlTsfdoXLDY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 24354     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_S25FS_SDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
OPO/h/mNEaPOIE9+NulsxiDQgeI75p+2+tK8ur0LzI/VznvjnL1QEob0p+1NjPmw
H2TtfmGqOc+B3gku/0Wv/pgjwGeXf6YvlH31xcr9g/A1YvlA20JkXrUh+yI9fG1B
QITe/jzKUr2NTw/ytPzZ5d/qh/SZG0GoNVcEjEEGYwI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 24437     )
6UIoXF5xZR+JuWU0i8jDPwFrdYRFnsOn1A3J1KGz4R9OznGBJMqrpd74HMEUV8Kz
MHs0n31wXogjiTcKe/n9xLt+3MsDLUZq6geRlZNK0jmx4f9YjVT5V9axO9RQlRZK
`pragma protect end_protected
