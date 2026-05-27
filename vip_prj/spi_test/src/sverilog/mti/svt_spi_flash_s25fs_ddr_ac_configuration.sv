
`ifndef GUARD_SVT_SPI_FLASH_S25FS_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S25FS_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S25FS family in DDR mode.
 */
class svt_spi_flash_s25fs_ddr_ac_configuration extends svt_configuration;

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
   * Minimum Clock High/Low pulse time for Fast READ Command (DDR QUAD I/O) command
   */ 
  real tCH_Fast_Read_DDR_QUAD_IO_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_s25fs_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s25fs_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s25fs_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s25fs_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s25fs_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s25fs_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s25fs_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
DTkVTFzvq5ozglBLDMNMaHIzJEto05K+VC0RAlZWunon70fJ8HJcoGbbqTCXJvwn
/nEk17psepuflUAcy2fSphJ/DJH/ZedriqEtU6hBPz+eiK+27yi6bcl+1w0r5PQB
7SP2INfPw08JEiQnLf/Mo1ojWmnYbM14ejd75HLquNg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 769       )
72Ua0OZ7hD19eni+rnVpiI2u6+z9sdhxtd+T8f4z0l94fN40yAA5zBl87Ohbp2cb
wdwW+oRDMCPq/pov2prL7NzuoWk8QgcxgPDT8sxnGVTy1Ewvx26pOpKWY/P6KLQJ
dlMxCNKkym3RMzsjj0gXzcOJRPovsxdUEeVz0OX2F5Gd9iMOgN1X/hxQySNzNlWc
yXK1Tlk8jGmBKuZNIIDyS+Z0HHAhtOua84PsYzbxqJ4yaHVQ5uk4/v1dw/+yMTNw
4NMbnbLQcDq7wo+0u/DeNvqHBTSI75b8t19F/jsgNPly7QLCYSZIsKk4EfLJYES5
N7hQM/Y+uAEfLamT3RkUDmoFSyfYELQa51XLXLG9AP+UUcQuUfROYeMHh94IRNO1
g5jCUbEht4BBTwaRQuul38BkmrwYHrdxy8zZDn30PuqiQRJjq1UMVIS/75uwl0Cj
gtX3ExOml5go8y/r0n53lyvDn4WT/pvC1h9x3yzpLWaGEhJlPri7kVeXZ15nVtTq
z7F1lW0bgFCd313CuBxZq2y1SjLO6yNXS/9tVoN6x82vcaWKW44Y+EwkovDjesbY
meL1afJoCjxHfTnLPMTrUARanjnBysOYwbXMo4gBw+3i61DUMOxEMiJeqnVlcWXe
bEsRhhavMfu1D5txOqnnAw8zRlVwjEEw+m+OLoody+XygCOdFdVO1FFJzLtpXCsf
u1Y4OpygHE61lLISNFNrAH0HU6ll+8UVScY0tJfP4wSIAgGimMf/gQps9dLWeciO
2xa07ftJAEReeirK9M7/YntUP6lB8DbgMjfG5w91iim9NmPVvR6+D/rZgORu2gSr
PTWl62x6LYiGfQ65Br7H6aIwZ75sR2DI5Pxx7rkjGPHR8jRRrHHMEE3mCPKXWJQj
aAcH/ryDsXG7CNhIN/DR5c/yOp9HQ4ufBa22+7avV57Pdw/PzON8BxEAOfUrHW/W
na4HnujSmaPNi4fpqeaErnWDJxwdPkMRGBgsL4U0fn45JImIFGfe7QV8yo7clrpU
nycwPgKhmA1Qtyx1FVzALQ==
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ONkUEjYBqDeb/FhuPO9bN7xIfsvqyCdI1RGapnAhoqCIqs8sArjveSqcMpUobEET
DAnP7DgNnAdJq7Ja3aCrwuLVnmzb49lDpyfHRywJibYMH3HoDVvh/2rWkQblmifz
27wAQluzNIrEZDh3KuI3qWa7JcNPSGkdJAtXw78Su2Y=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 21136     )
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
+j+zkMFCWiS6luAGj8wl/A==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_S25FS_DDR_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
BWhncKcK9DT7lbg2f9y9qfS0powOALJUssPd+gGeatJU14fHfpCZV+Bh0VnUB0v4
QcMZybwAdQQIOpWnuRWzcCi+l430L1pxkmv5NQxo1WxeanPHVfB/HVwJ8+Hva3HT
aySBVQJMgQkoPk5bWNBeyTxhZvSZNIaCGJ9rosdBdrc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 21219     )
1YlX433PAVlD7O/ZWAR48NMLbHpf2DvtZOnLQ0X/5NukSXzhrq9NkCxKCPR5sJVt
TCzgSuIz30Rc3MCzhRA8KyEVrsrAx9mUU9wctBOvK62mKIO2TGnUdwofE/Gdjt6L
`pragma protect end_protected
