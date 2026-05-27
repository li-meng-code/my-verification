
`ifndef GUARD_SVT_SPI_FLASH_ATXP_XSPI_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_ATXP_XSPI_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto ATXP device family in SDR mode.
 */
class svt_spi_flash_atxp_xSPI_sdr_ac_configuration extends svt_configuration;

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
   * Minimum Clock High/Low pulse time for Fast READ Command in Extended SPI Mode
   */ 
  real tPeriod_Fast_Read_SPI_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command in Quad Protocol
   */ 
  real tPeriod_Fast_Read_QUAD_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command in Octal Protocol
   */ 
  real tPeriod_Fast_Read_OCTAL_ns[];

  /**
   * Minimum Clock High/Low pulse time for Burst Read with Wrap command in Quad Protocol
   */ 
  real tPeriod_Burst_Read_QUAD_ns[];

  /**
   * Minimum Clock High/Low pulse time for Burst Read with Wrap command in Octal Protocol
   */ 
  real tPeriod_Burst_Read_OCTAL_ns[];

  /**
   * Minimum Clock Low pulse width duration.
   */ 
  real tPeriod_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tCSH_ns[];

  /**
   * CS# Low Active Setup time
   */ 
  real tCSLS_ns[];

  /**
   * CS# High Non Active Hold time
   */ 
  real tCSHS_ns[];

  /**
   * CS# Low Active Hold time
   */ 
  real tCSLH_ns[];

  /**
   * CS# High Not Active Setup time
   */ 
  real tCSh_ns[];

  /**
   * Data in Setup time
   */
  real tDS_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tDH_ns = initial_time;

  /**
   * Output Disable time
   */ 
  real tDIS_ns = initial_time;

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
  real output_disable_time_ns     = initial_time;

  /**
   * Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_min_ns = initial_time;

  /**
   * Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_max_ns = initial_time;

  /** DS output active time from CLK */
  real tCSLDS_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /**
   * DQS to CLK delay
   */
  real tRPRE_ns = initial_time;

  /**
   * DQS Pulse Width 
   */
  real tDSMPW_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_atxp_xSPI_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_atxp_xSPI_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_atxp_xSPI_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Y/CMbsrF3l6ewzF5xlWAI349QKB9Eh8g0dW69wsBJ9xcWxCXym89VFspP1xtJrUJ
jtEzhqQcmnMTIwwYWx6rcUWNKtWRv6LQyV3oGDGipzhx9F6/NVCAIabILosbI5UT
WvG4i27DJL8hRknU2LXwmq9Obr1IB84EtfGhxDay75rohC/gbr9D5A==
//pragma protect end_key_block
//pragma protect digest_block
cOoxigv18jNkUFPdGvMhIGd4BuY=
//pragma protect end_digest_block
//pragma protect data_block
rYudMjXp3PHyig+UOBv7O57mrbPWvk8aBGRvWnqTGfD+wnDbZDtGVhVLsPo9iSHi
BsC/lmQR6LlFmPbUJ0Xyq8p6ZO2wk6t4JcwExL2IdlFfhMmtwAIowDbR9A9MCv4c
+0h/s5TvitPKbndIVaxj0NUq6oCHF6co1yLBduA+ddWa+t7UA8a103v8g5tmPXFq
4Dl+OoaZe1j7x/jqJ3nCIoHBEcIiHkDFRY0hsObXgs/4Cx662BVkn2jegyMydb96
OFstnsEp9YGD8eA4QBN/ofiYTk6lBz7SBS7paHxLRDvIQyzZPe5NjJmTPjEJ1GIO
KV4XKz0wPDz8YkxIk66+TmFA+CTBe4qLIGniiSsQVv4pRPSWN3dCHD4HYunlZe5B
p6AqfkU9YAautTS9eFbUw/96XEY0l0dWFiafeCjNWMmHS7n9ihCyd1u1XVcDDwQG
FjrmlT/zx+7ht2ZLhcyesGXMBs+cCYkfwlTR6SeX2mOS5cNP5Q9zXh8oXNiVY4zg
tYbhwOtLGD5gLJsqzPJgNyF3pRygtfvy71zI/+fhSMlQ664puxWo4IKauQOPN4cI
S+EkZ3ajkH0glE45brWg1v/35j8gIGqUW2NPZaaPy/Hx33F/hUANiS0Uv7WV7RXy
vCL98AfQ6+qFmNvUyEjPHa95+t7BI/qlM21nPC1Rz3QWGqi0XFG/YRIcYIjsySTO
qwLQXIUB8W4jSwNcN0tIxrBNTr6eK/x25/6r61HnSm6f+aEo2rZurnH2TeCuXT8K
VUPrkuQL90xf4xt8Zpu9ldTngh4tL6DewLnzokfoffQ19UITIfr/q94ucAgfSxpF
WwWw12l7MR8qdrdR4e22jWNjZek1ckYz/Vd7K7nBlwOesxKuiD7Abg/4bddJUWsg
YvotzvDpMSjjJyZp2oELA12l7bGmAOL/P8QyW1J8omu9+lKUp7Gc76IDDyO0AAeN
aeIGca8y4+TrVvaupBX7/x4J/+1G/uvWByrqMUADZvI6bUXnwPJdQJ9HT0n9mMU2
SGY+tsFp19+73Pk2E7359uqx9YEjk50fh9mVdrWA7VV6th5LmJH0AgVjGJP6sacO
yxjrEjfg3Kv1ku2uqqGoW5D5M3je3Ra1/SoOKi9ljJzEOYuNSKPsK7Q5idjjyLML
FpmdUAjqtoNFl+4t06QGPl0+/D2nJ9w9RzkR4CyeyGMil9gQFp+q6xP/fozODeKQ
ktvBatlUFkEw4iovfb0vpciTbocryE/SeQbw9ET3cRaJ8mKpf4q4MBim41a+kswY

//pragma protect end_data_block
//pragma protect digest_block
00esptBFmzdVkbA7+kFIkK+9KzQ=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
AyzpOlp0JEg8WeFONBn0fgghkV9sYHHYDQXfyjLPZyDZly+XftJWM+bDk9tXIDky
nOkFSsezLsTpQtuPrUTFlaOihhoFhAKjRffxvjM14YmS/NSeYRzFE+gQM4K8hLBh
SeT5UoAZCtY8RmjnH3BDeF86GQpiTyb16UQbUrNt1LZek3Od+SwRew==
//pragma protect end_key_block
//pragma protect digest_block
vi9X0PuuT5KSNQQkUVtu9Xa5oSk=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
n4I32U5ddjMYMFmkYYRp7d5IZlA=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_ATXP_XSPI_SDR_AC_CONFIGURATION_SV
