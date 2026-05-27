
`ifndef GUARD_SVT_SPI_FLASH_CY14V_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_CY14V_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Cypress CY14V_family in SDR mode.
 */
class svt_spi_flash_cy14v_ac_configuration extends svt_configuration;

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
  real tSD_ns = initial_time;

  /** Data in Hold time   */
  real tHD_ns = initial_time;

  /** Output Disable time   */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time   */
  real tWPS_ns = initial_time;

  /** WP# Hold time   */ 
  real tWPH_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_max_ns = initial_time;

  /** HOLD Active Setup time  */
  real tSH_ns = initial_time;

  /** HOLD Active Hold time   */
  real tHH_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_cy14v_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_cy14v_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_cy14v_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_cy14v_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_cy14v_ac_configuration.
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
  `vmm_typename(svt_spi_flash_cy14v_ac_configuration)
  `vmm_class_factory(svt_spi_flash_cy14v_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
hQfkQwOaq9Z0nM/w/G9lItshNb+J+xplPMsiyY4VNxoPobjjkpRIH1U2G0I1DxEf
7bTnmfbe1eERAyfI1wyoYxBL/y2Vmw9XWcTObUiWCFrlg7ARMHoCpsGWKtnzOwog
fZOrwPpcFOYlMlE3Apd9qDNgYu0Dh3h25AsmMJ53dSJ85FnpJH6V+Q==
//pragma protect end_key_block
//pragma protect digest_block
ElrC+F1hmW+m6lO002Kh7UxJH8k=
//pragma protect end_digest_block
//pragma protect data_block
E2nxEKsyo0mmj3RcVrcIwkxMoZp6zSvIYhsN5CI04EZDLhX9MrY8A/JwBcBuLDSs
4rHHWOYM2JXMuRPRnWW6IroN1aMUCVcMANbhFk75adnuTnItUKTd0st6Vxls6dAq
XxpxoTuvivoQymkZ3xsMwoZDDe8oAEgsZ+Ms7u7qaigLxLxT74Qjh3FtLIhkOgxw
Sl+vVZsBCx8xuVnsr46Xrqz9xclELrxhJfalnCl4RwUOfRF7g5H44SM04joxnPR6
Nsw6yUQzRUBTV3yBmd3MMVcIcY9KU4y50Yd0uVcAkWa0mA0hTq8sBKOfk2F8WmWz
eOvuqr73/CeoCgI7tvnMetTNrKebjjC6GA8TUDdDlXldUDgPC93/N5ODLeJjm2vU
jg3g5Hp1vV4Nf04kIkprzcgmiL/6ip0e2ADZOjkrDpqjvRdFK92o6zw4mFsyv31E
5IZvC+JGbmPHvd65CQEddv4l4HvK8jM9to+jLtiXWovQTOKd7W6vhs9YQ38VOqpN
+xaMNY8663BtOE6JpipUU0LRaYXctPDseCgkFB3F/lD7nod3Qs4utrPpd8nk5+Lu
x1EpGqmeW8YYA4+d4FzPUEyIsN6nqkVNtBL8L2E6J56bw0hbxzccTQZVgLIashg2
oXX37olAWXQF9o0XawURIw2eIBvFQtenRYDLhM5oo8LgH1EM4/vc+8tNr+56a+8E
klxhlvCdMueXU6Ji+nYBVJl0NFdQjZdH3VAsDv7FqQEdpUh62GhU3PiIu4nHeF+b
9VJBXbsCwm/3Htj2KeZ2wxL6NcwtLzWqfmokL74mJzXQGtx7JePxriGC8MRW4tkS
CaNdK7CpWjh2PXzy1jjTkpYXCFsbrskEVdLlowKufd/3KEAPqHzOoIS5d8SxMn3O
PM+DQHSzL1AZ7G/HXpieJf0tJlErXEZbtSMMAGaRmJW9V9GC260+Pa8mL06Zj8ZH
zIu8x3xXAPx/IATZZO5SP3Yz+X9VgBkPEK8ul/rlExWY2HXxTAH1wg4/A+Gt/PuJ
+fCeEuJAFehb1l6J3CSYvJaWhjx6mOFbHn31V3o0dDxfTGNP8JCRlvSQINCJ5pDD
Vx1ih/nPlEEks2gsE5kcRYKOU91tF3zCGW2GrKJnNN3qEn2Hwt0GdcvEWoGOq0Em
cUnzLbHFaSxVqFZcTE5m8lHVkENWmKBvgRiZtPu7HUbM9Ivl49rElbVpTY42iMua
7GmUP6bjwND2sDdEXR6W9g==
//pragma protect end_data_block
//pragma protect digest_block
jNQHWKC+jqm6wfs5W+HO6b+8jcU=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
DX7uFvLH7pIbem+x6Lm8Z4xtcW49189PVyBjNIoGGzHnghjyksSPdlouD4lMwhgU
f6kpAdXJROrUkAMrSd8Y9ONkIP1F24N6G490c0H5yPrdQgSBpvMW941i58D9hIWN
/ArADpO6OKxfzSwcV17+Tq7fxiI7q3jhF1cdc9K0u+Y9IdBpwkGMMw==
//pragma protect end_key_block
//pragma protect digest_block
7Rf/5joHcDVAZYDRwfdKnInL7iE=
//pragma protect end_digest_block
//pragma protect data_block
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
69YZ58qQ4dvnvFEFWUxCvQ==
//pragma protect end_data_block
//pragma protect digest_block
gHYY3mlx2SFACNWQlxGPh52bLgs=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_CY14V_AC_CONFIGURATION_SV
