
`ifndef GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto s26kl_s26ks device family in sdr mode.
 */
class svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width duration. */ 
  real tCH_ns;

  /** Minimum Clock Low pulse width duration. */ 
  real tCL_ns;

  /** Minimum Clock high pulse width duration. */ 
  real tPeriod_ns;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSH_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSHI_ns = initial_time;

  /** Chip Select setup to next CK rising edge */ 
  real tCSS_ns = initial_time;

  /** CS# Low Active Setup time */ 
  real tCSLCKH_ns = initial_time;

  /** CS# High Non Active Hold time */ 
  real tCSHCKH_ns = initial_time;

  /** CS# Low Active Hold time */ 
  real tCKLCSH_ns = initial_time;

  /** CS# High Not Active Setup time */ 
  real tCKLCSL_ns = initial_time;

  /** Data in Setup time  */
  real tISU_ns = initial_time;

  /** Data in Hold time   */
  real tIH_ns = initial_time;

  /** Output Disable time */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time */
  real tWPS_ns = initial_time;

  /** WP# Hold time */ 
  real tWPH_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_max_ns = initial_time;

  /** DS output active time from CLK */
  real tCSLDSL_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /** CS High to DS tristate */
  real tCSHDST_ns = initial_time;

  /** DS tristate to CS low */
  real tDSTCSL_ns = initial_time;

  /** DQS to CLK delay */
  real tDSMPW_ns = initial_time;

  /** POR extension clock period */
  real tPOR_CK_ns = initial_time;

  /** Power-up reset time */
  real tVCS_ns = initial_time;

  /** DM Setup time. */
  real tDS_ns = initial_time;

  /** DM Hold time. */
  real tDH_ns = initial_time;

  /** Maximum CE# Low pulse width */ 
  real tCSM_max_ns[];

  /** Read-Write Recovery Time. */
  real tRWR_ns = initial_time;

  /** Refresh Time. */
  real tRFH_ns = initial_time;

  /** Refresh Time. */
  real tACC_ns = initial_time;

  /** Hybrid Sleep (HS) cycle time in microsec. */
  real tHSIN_us = initial_time;

  /** CS# pulse width to Exit HS Time. */
  real tCSHS_ns = initial_time;

  /** CS# exit hybrid sleep to standby wakeup time. */
  real tEXTHS_us = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
ZeeMpL1H36sawvjpJQpYho0fn/P0F+se3t8qr0vkXZptBKzsY6zHXWK1EvXyD2na
i+31BR8cQNgSmlVn9ucJrhoAwfRPhrTjZHe2555BWE7hz47k09Iy1n4eXo/21mLR
VkFTCou2Xa6FSBKZi0uG9RFHTJsMWUIJYnc/QTuHYri1X9UODNDXJw==
//pragma protect end_key_block
//pragma protect digest_block
UGyYwCaNIANG/hNutIWyQaVBNxc=
//pragma protect end_digest_block
//pragma protect data_block
ZZV0fFPCavjFuRVaE96GXhXuM8F7KT3b4oywBV9CkQczaRHuFzkBiqLd42iCwzQn
FkUN9Qq3Af8YlNN31RcH/jFBL0o0/FeeCFEB7HPPTRj8xujl0wv6Wrzt2ja8QnWQ
Ov7cr6xwhtLXsbT/SmvqQMu5yE5AmdSAOBAqQ3UsgTO9W//Xhr8e43rxnHnKszor
7O6m3T+YR9uF2+YwN1c/o8JRLd2RKC0BZ45HkeT6SOsEyTjC3YZth/WyxKQ0FJu5
byxQBY48sKSkr60V2XPBe4uQ/OW7uA0vcqntlkPskvve96PwucDA4wXBvVDkflGf
MjQd0n6mQjc5PhrCeXQV1a5GPOSQ/yzAfoEESkxlIMNbvlqAbatY4Y5FldsysBDj
ZAEOuJVCcamXVa4j2InQRwFoo1J7eQbMa3NQsLULwstgH0E0gGfGKX/Jq0jEGG9V
Tz/C3TdJzEC6HwX4SdVYPjhJhdmMRUD4Uv/eZmkkIFQwEJdkPWFn+mjLni1XiYk/
TQ1aeYH5R0B1e1YNFpUl2Q1RhWyBziIsxezyZ/2sOEnSJValNqGbmjADb/LFqBVa
nZVv1N6uYNhPAtR3Dr2n0GF84+LwFbYnHz594ZHHR4lDEaxB7cCcwCl0je8mzNUx
vjqXtLw2vOXol0dEKBHuRFxnXx/RDA24WeUCn/kiNnZvmthsuBul3AqTGCalYSXn
y/wdhjRcGc4c166xuAVi6DL2RtrfDBm7DOcH8hVzgrJG1szH36LHbjJw9BjnYNyK
mZsxQzi0HsRfjAVeHg4HmKlaD66+ZGMddxRs4wSB876e+ezV/0IkzLgQwiAItWfg
EIGK7TUMJqUxd1p5IVfmQ3bqWoF4iNoKqrT8Doh4+q7a4yTmyUcc7XblzGjd1fin
OjVgI4q1+7Vel2Fllh7Zf8/d+nt/J6UevPHH9hlgP2YO57Zmho6o5xt6X4uKbTOF
22ofxKCbs1yoCfWr749kGw97Ri2kgAvNVZufu9n50wgACzpYqpf20qp9mcfd7zxp
GN86zK069XOyjDCXKnpcUluIb25POfb+9f6PIl1w7gJPsC3KknptEmcN5r+EHs7x
PsCzCAZQeDsafjK6dI7/bR/T7lsc6xcGfdEmAjZlbhn7ZGsjlbwjW5ZuTWDlXqLA
ySQ1EOinWjK1ux8M7yNPzLzq+CgCb5MGes/u7jbmRnAsZefF5BhuuuMoMx/3H3Gc
KwJz3WGujzP5HFcU6/avn4xPiL5YxT5JF+DHztFckpRbQwZ2Vj9DNzkaaoW+Cxye
itL8PNcSxRWXc1psp17MklT/JOPQNE9/bPduREmTIaY=
//pragma protect end_data_block
//pragma protect digest_block
1nDaUnKnaWcylYecGhzY448R1aQ=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
RuugDwOll70g6j+14j7tymcYWibFn09InkdVtsO6EWs39IzJwhX4FUG2P4SpT9I/
lmofuNx1ddZ9WHmdUsKg1MY6PNzmNzllxaztPGT5IcfsJLGo3qpbpxuQsfltMHdD
An69hg2/kgBLBjKKZqKHnRKBNtBuFRN5SOZHZ4U9IPbsMbxnx+pD8Q==
//pragma protect end_key_block
//pragma protect digest_block
t4LxrXrbUrdj2Svcpr4WL5FwbiU=
//pragma protect end_digest_block
//pragma protect data_block
sKBS5qWAMeNssnK6BZpfK9EbaFZ4Eq10YQVQvfolwteW/VvfiwTqW1L02MfziddT
kEy3TkXhahN46l4s44QHP1qahMlVcWz5TCpG068j7B42gFurvgnwlEDeUI/Td1h6
qsS2lQv/5hAwxg8sPc7S6Ijb+MdEH7zK/KiDr2HPqkpIGxMB/sgQAGLEfmEX3HiL
dGzcB6WAE4UQg785G1FJ9JM+Oky1eLql+aa/oBquSGW1jgv+MeuNU8MNl8zdnKrt
Qg51SgmvoUIdkgS4PWeDUgAwh5o9nDJjOlO0P0AJu+1HPM+NrIvEyO9gNGsRUUCJ
ZDwPmbNGloJQdT5S0hGvkel8NJmSMTqMGDumSlAtZnYR39VxYpB5Ea0lwEeWyBV4
YKfAv0TQ4s9A+KWZPJNxd173wtPmm79aH4gNuFvwOVBkd8tZEyjE4U70kZXLMxPY
O60eLqBi8bfsO/slyb3SMcbhhmnJ0Pl2hIhjAiDz62t9AnMdBf932Rp+xljE1Aw8
jy/IqWttByFnFX0bB0FOkjMeefi3fICFOPN7aLiPPW4v6hDV8odBJ8M37tCeA3wJ
XSnTapdVR7IxPJt5GhD+Pa2rXFA5FjFJMdumM178nc1DqShQRYdDu4oEMl9CocU4
OxLyxSAisSS0qHXh4fD+b5Gy//odsJYh+HScE6fixeUZZZ81OqCz1m5hf9fKnTw9
mBBPjhbb0+wBZkQgpJV9s6AfAg40B+OrCz6sUl2cxQOOmhc+oxMMzGP5R1xQHz/R
zeatBywbVTn+sWn8D1OEOEmGarE7SPimtiXGl+w8R0KvKRY7SOJ4vSOh5QNX77EC
0BkBsKDc5sw91ZLyxAB+B7xrRGn1d0fCGT5qfPEzBYWA4LoAMAvXBibICxokptt2
wRFKIcusSEeQ9vGyuBoZf2PuMXCEiXys/n12uP4ZzgdsNcdjv6o3UAPn5hyIS7wt
L08cZMf5qmVDXR7WBtOCf2zf60errPeKLnJEPIq5dr/7/XoCZyB0DreMmyK+aojr
kPBLf7a69fMdvoy2VyPIXB84ERjVwfTX6lEm3VVVvC16brTGR0w3mHZebx4iONMY
q7QxfJ+AKiIuTtg6Ip2sYnBFcbBW/3ofKBX44Rrs/5z/BsqtIPQTfr3owgoxcPM3
HU97DNDBi3ALaMNfgrTtlHYde+JIYq2GowTUjttfr9oOmjSEg4Spx9lDy49WGUss
0IiBLlIgWIgHLO12i0dF0HvRgbMyvp6Io0pzcA5NtU3fh1RWXzyyw8XPNYXLPB5y
K7N2Url6u2cJSzkfLIkhuEskuEIIyZRh8MVbSHTVXgncyxLSVn3n/Y1rip4mJN9q
PKuZwlODfTyj8c8Eto0kf51gpinjv4JKm2BT2UadxiySwvwtI3Dmw9sxJqcDWw2y
9oooNwSbP437lZ/z3bQ6p37crwb8s/2vyYAlblhz5be3YuXMzqpV5ETUeML9VHod
O+9rx3/61vQ3SwT4JYBodeJCDayRNCKZiW9YhRVGZkYAIr4cQ0oUd2wa23R7aMmw
7em5a/iqZjUmI/V3D+cN/zpriSrbvItcwkCq6/76r7RvsYGZ0P4oGpuApFcnIMO5
9BqBsXCBXt8hD4YHhxFsCoV959ZmootGJQkZB0UvRFVhNsMYbYLJVBaivtEgrGW+
u2AwPZ5QOPkgPA+pH+XLpFyZJSGJ5bjLINK3OQ8vkiHLU7M3w7YNwpCwfNVUaNwy
ahj/qOu8brB9pu65koAtn8jrwYpF877OBsqFoy/QQHP70I59rQPTV7cmcQt91/R9
uemFu7vf3/sceikGOeASI7KxxxyLxXFu+cuoLfgOVpuIx2FAe8ijD5Q94R97jWi4
fUCobvhVa4nC/vihqHjZ0XjBaAh03FNvYZQG5dnBO2eQ/aZ4lJRHBKka2ueKx4Cq
pn36Rmgf+A9NRJcV4+/VUFlKMiWuBdY3IXYLJ2X6KOnCm1PdAwc2zkgxDM9Y/PhD
ZoU0fA+EZNzF6ZhIa3snN1f2GVdNVc5jT5te83nmCl+Z7GvxK0XBfwv4nSj00RNA
VbUZ3bMDeBch7SkLenS1/Z+rQO/cakp+BFoMbUROdZo3rg+2kFPaYUarDIdP4KmD
XNZjpIcCjN6oc56VzLxXbP6IuiBRhYgwuVLp1nbVS820caU51DLxaNr+7TQAaWDX
mqOWfnQNUg+AJWfWff2HBfxadfjE2bXHA1nFE+9VGQzxVvx3rL0FPeZO2es4Rm83
AAGJ26VUBiX5C2xbrKIEumdyGlxbnp6gzyEkDIl+1xvBnBFfXZcqGxaw62XlW4ws
DT3OI68D4Yx9Eohmlj1ICvuFiPh6oabeVi4mchkBruQs8yf/U9y4Xy/21rRovuX2
ivH3byGCdOa5y3BZGWigLu0t/yiNJED4byz800f9G0GHsOijnQ6p2Wc2PUPWA57z
itGSVNNJMokoIP/4HNsOuMWv82sZpxslRMWhOcRo0hVK2hyeFNwjeHL/O795Jq9i
VGRb4Up74Oqz+NDk6QIJJjlnjG5FsRdYZc5uOvR5ITTrg/ixhCKEmZWbJ4BEgvbm
eiw4Dd5ovLfLxPafuKbtPWHOo7XbHWm9fM3ASGPok9My8efI9DdZhtgop1yy5ji0
EIsTVTrkv5c7bs50NuKpRMYmQ+aZGM8IqpdyGvMCqBmItMk8hiT3w3JqQAa5sNmb
lMkYT16hxMvE26WI3RGkSxb2TAcfJ8tyXB5wM6KdOy8dcVJYJwazLjqkHYYQkZa4
nMqR1/KdgsQU11P2uavKNxy5J12s4aMsGuAFRHWnSVOTlza1OWaSdaNN8Ik91BXZ
7orsNBwZZC7ZLESEE6VEXVBU1uOrfALCrUqsc++zp9egFEozwF6O9ZZmt3zAhCJi
f+3a8mmQ927EiHS1Burv0G/12MfC0UIeujE6cXHiWuONbl1WioUA8ZrJ+Qy/ARkV
r7E4sLKgl6/P6Aps/0X3m6N0l993Ij6u5P8HBXJmhHsstDiAtu+RIlAkhMgdNdYZ
M2uReoHW4+1VXjck2OI6MYIhBKrO81GkgYvzXTxZWf2wQcoVEeDQu/KGjkGaW8QY
Y5JZs9CZM2MGVuFdAcCgSW60LZSHsvapKszWMpNu6RTiusJPaCF4v6fKMQgTyreQ
uNCL0/8ogATJoOWsWFJ89O9D6m0WLYQ158iemnXU0jGCmggC7wxGl5xCkXSi6qbB
jVxXFhQtkWq/UVWqcsQKwEyISioIIWwVuqIv8YoXmlPg6XO9+60wV63wVoG+NI2F
h29Y7fz18pBuk+NQXOLPFdJKCsPqh16391rZz3fhLMLtByRJSkaQXdIbPpDWLwsM
pHQ5sneoyUTcE1CbKtEXPoi9VzMG6id7s1BcOorIHIENWi0TpmmYcARRTcCeXMAd
O6Mu/pXFYkYy3SeyIJtyYEX4evLuFPyZUZMfGlTbpxeKfqjS3ab5h35x9oKkYPfu
OR1R/eQf3XhOZvUg0grezuuMK2s5NMlMkGQBXUcAjEsfxGQjJtqWN/0ZXBZ2znK+
/jsFJlZI/Ud9a2I9UdhwSPQqcx3tG1hph96YvMFBuidOwAkwRQR42W1O0IKS1RDm
djdDN/9WPxC2hQhtYwe1XvUdy09sCvMby2NseauGj5iEldJZXmI4Jfx7LK+kE1X4
g29V1xPlqNPbZ/WmjAULxp4rH/AeFXDSs3bjUbpMoGz+yw67nr6IZiQ8EH2OUdcx
T7LlCdVFa07mHVzJa9XFJ0rRs775aVAsrQ7L2lNglYtinbneIZA3VLda7x4O36nZ
O/aZRQe1BTIF9AsECo6bFiFCb7JXUmvJ5CjV8yjBX4i+arn43PWH+tsJ3H01ssRy
8XwNchy/hWv1pPh1mU8rCSsviKEcg1neqbHnzQ8TIjI/5fB77umrXhvkLjT7GgAc
IQvFh6YbgmVv0gw9qGm/sSGgNSk+nJTW0UbfGgXKGpZOzAzQtoIpkDIo85ExHmAX
qIcG8jeHnhufWV9lkrwYrQ/95FaBGyNUGvgfxNl4hQf6H6jvPlwNAMou7wDqPI7E
yt/z5VkskEvUSE+ZWpjkwlsDVMWP8AAnCSo4mFBjiYtUbrdP4gQ7kisb+OS915FJ
ui5f91/wHFs5lebgi4mgefC4iygE8QCewrf8Cxfg+TJVtH9dxWIl3fyk234M/y9b
h+JqWyX9+XdZleJogj6kBBOVw+ELOSEPJHsmW4op7EugyfDBpvODD04X1H7E+3UC
t3VwUy/kON8uSn+b3iVyTfxBxRzBWXPJI620nI92CsjojQ6WTSaADNeHlcntYPPj
G0wzjjmSwOQ0u7HwCAB/w+QtkDtvq7nquovnKQeKYrl2d28TdbHuw9hL3gc2Dv+e
dyG2cDO498d3gTFdMzOYQnrlLtyocbj/3SMt1U0MGQH7yMcZbyPw0KSRqLSzny5B
zB5FH4NCmHFY4gsrG0XVGhMTpGco7KK8N0SUKgrNHIXt1v0d7xtp8CYKJYFoi335
hv0dLsAsJyahi+u86Jzqjgv4bbJVDKjFyUhKfuy3WQ2JnL3Sdb6bPnng6QfOgOvB
EPZfykDjyVw0uUuYxX7s2ZEIHWbEI/07SoxEvIgsv+kg4rjSQVkUisId8dL+mswN
w1e33Co2D8exXyFesXkdsjmPKRrf/Q40Ol1YUykGZfyo05cYwyaFRwaUsheDerUW
Yq9ShboExj6LxJfNQPnSJ2LI1hiZlBU0jzsmG157YPh5pwRgtxNejbro1UhL3hEZ
o/i0Vea+DqdXXBU5YAXXd2HpAQ/QHE6t++npXs3Ls/hUm/WF1mskYAV5tttt7K5N
DQeGeMhqTPPw1IkeaZ7BmeQX3gDkeoTHeNyah+oLRvS5ia2wrrvTnwV3I/7wFjpY
pQXSaAEppA53mmtA5/5KZuq7r0FcdoHiITGieHkHWT+3lGdVKS9qgZVPDkVt7F00
NlhWEWmmhnq+Vy85vo6q1F/TiJKWHUheToUh8EQcmZPN6lE/DDKiY5lfma+BFoft
D62vevIkxF9MFYUYX6k4BwiT1sjgpa1lwrs4ZEw/hAooKdpHUm0/OrGYusimg9Zu
oPbopSl7PUybxYXmvuAfQ9B+tP6LK9O72ZT3FHmW52nATHpa5yxmUr+MJLwPzSEw
OzlBTRcnKP9/5GMS45az0oROY0Uf5Ln03tluDp7E7YgZ3mqoylIiQv9z0vAzd+Gm
rfS+HWDOU5AsiB/CkS7bVmD3GsD/PIAXL2LeJBqXAVLOpKVIqn7KqO2sNVbEV3gg
iTwbBMTRP0jHRofJ7zARYapFnQpky9Q6g5itlJ6c3T70tbI9B15XjYZaWDRin3kQ
QoJffAURWfX4GLhxKx/aL8QPwTR8vXy9rUeRznrhjVbq943CJW7a9xWG7k10ES9I
Bli2ybkucJpUOQzysBlHzHptmSnLCAlQYzBG/WK+589XFsh5pqCW0ieanv56n9Iv
gj8zBe0NWy1AaUy4goDrVJXDzhV3UkV0+2JTJkdbQ01wZyr0uSsKV74Rh31k4xnE
KTu2LtVsJ6T32ECk/rRebg2U8F1WFzosIUdP/GGZE1hXls00UCN7valCAoKNN8A3
NoQKavmP4Cao0Qk4AFVnTCQawnb7gt1dp8LlLQffjeoXBSc8GqfhL1G4rTQt7EXX
nIBU8IKqqs+H7hdvSGErfB7cx+jOROia3cU54RXmUI4+aGaaP5WEo+D+N9pposNJ
2d5k/DdSoezE84vfMEIX2RFGCL8Gd7xpMj1IxdvrLHtmwY6qxSidrRMPa9geWsff
780aWZZD4gvFwJKgWwNiNAYtK95DHeZw0wf2dnim/f5YCgLaajPVUclh3LUVwb2N
h7eJoJx/2Hdw1I/tX4rHLYrwe3pvlT+J2ieN+9NegDISI1pxOs1Ba5UVWtdjvzKz
9eljmw2+bOyppW4a5nP+AQfCUw08AZCL+HSZplLsOqjUS78Ge8VSTqUiBioAHWIp
5vpSaa+SKKbIbwVvXMwwbM3zRhWtH5y0oFbXakaG0KBkMzqCHloQVWhf4zAHIOMh
ZhskR0KE7LwZuUGHQbpS/AXVIDiKC/HFggHmcVc9aO3WWnXyK/AsouNOZVJgnoEK
x1IicgYbB9kE4JStmQsdsPBNTxBkOYvshOrls6JR29laGjHVd8XDJ3OMXuFGgnRp
snZzwiHQRcn9JVJyJAySWcaBobcpfzkp2aBnNy5rTkZxdTMrHDGNE5nsfS9bCgnK
1QfK3K0FdJogY2mUiYdKmh5JsVBwy6KNe+98WAwDwEzXyfOvC3w28OLBgixOo9TW
KBL1gWod8UZR9ENBSK8Ynqhn/h+LWu0G5SUCE4ZiaAJya3tQAC8P1Kh44Qripnfd
OxRnyM8DKkY3xpljerMxWQM6r4ZK5q9C/J1z+fzQ+QKufreHFxqI+28MCKbq1FZw
F9pBtSYJTKtDzTKJnk2aMaeUmWhnCDdH8v0aLmUDM0d3iV6BwPVBEeL6UUetU68l
pWATYyZvPV7HmfT0t1b7IzVT6klevnLo49sQ+i/r1isWewe4bMfpYjky9iqnkVKS
b2kCvEL53eAReEw4Ad9To+IjGLKzj/16To3I8CqvQp1EidG+k8X8HI4h/hoobVBZ
iPs5UxSr73IIv8UPhADgiIWbc1Ycli6EnXjsqBs22Pwmm9xN+pqKJvIOYW6uScYD
nCF+SOVeZxltt3KJ2BrLtZOucpJwQ9ob3H/2tAnZAxNEMdh2EfeO6kjSyIKH+n8M
ggCbdkWv6LKHV2Hi/aR9ohqoZF9XKnjZ5m299wiHcSdlfq94HH55zXgIWbj1FN2D
XGT30nvehULM0gH0A75/dpp3Yr5mFenuIdLRDIjrVSpUbg+yBEBOtEhqUcZIcOAj
oCr4aQLx2VWuuD0FeKu9V5hhZYGdotQgZcZIdF1NZrc9uwhyzI3bf3Qq+TUX8BwM
Cy9i6iGwOaCIDcgVlz/TuBl7/hRsXvwUPBfbFNfuwidxDmSMIdrs9Fqs/eQZLQ/f
uBnnNLDnz0Z/FKde7kOVYQXNZLYVkRI1X9DnHKk3LEcr6kzyyEV3rWkfPOxk/Dh6
lpQOVQ8uk6rY46ovwiAsA1Mcf3isEKQQUWqdrV7eF2psUCa1Qi6TBkFthMmxNOY4
3o/zAI1CQd8U6tD8SZ+3YqM+mrUoWz1wrTZ4JxmtpDLDe0gDP+mQQPOvLi8K/8vR
NJAYmCzGLh79AF3fvpv7Ma3f5HbU32aee3x2ud4TWHW1wZqqNkosXXwT+yMHIwEb
cZBNyjDKIFunMii56cStO5zSo/Lp41G3uhqaWlUQUNhPEd32PvmtLcAZivRdohP+
yJGJdJP3JpkCy7PFoj9iCHeKt7P2egnGEXu+JO1K+2qKg/CqljXzhAGhQN+uIqfb
LWA7xwTR31IEzrLGZN/egC+FxMKQEN+yZ+FLhSgB7vpPlVW6b86PcWdWu605zsFU
abntyV37B6g1D6NNfq3QaweGoA9yeWB6ujuSpUxgjl/Ublo+QllYAINfJHm7nE+a
E0KBuwzdU8PTlNQygbg+ATOoCybeLGGl97gqShdX4MyyZvbXbXTwWhZpHGDTDMzG
usaWJ7WbZCHEJDKX49sJkmI8AykX8gPdQDNFD0yzj+3Z39+KrrcR2YnddnQW6w/v
rYecjwIkYHcNTsMnpySGSsxx+u5jBHJFN+vcFG0F36n2DX1R/sUcvjB3CgEL/mnT
//3Y43G6UTCypkrqyXj3VCNkkSWRAnkGmA7/jwOkZixJ+p/b9lvwqObXi9s2DFEA
S8GV0eIy+YCw7KLkLxwpP/bmLgAmuetRhBXKwMaDlrXBq4Wl7A/GOC6W2mQ6FsfS
mdbRaabyidU7y5QVNn+rUtrdAYTXhWZuIL/ihySRgjOJnnw75qZAlY6M2q664N2Q
3VVrldgk6mN73JVX2h2NUVA+nkbQwgo3irS3LH45XZS3vzboKdQd6Wm7dEjXNG/m
4+0vsDEpp7gaQ+Xr3vZ4v87hUuVE0BmMuaRPxgTsSKmhRGksuvAGlI6xtf1e4UNG
y4fI5n/C3OSdK88NrWQ7J8cebkxCDfi3B4MGqMjbZ3dCjolcYo912w7hBVmd3K5t
RcaVlpGyTTMGRQRG7enFS0a60xKjDzY+6ATHtfRxOUSkIEjpkGB3LleqPUQOREbM
hVEyUqjB/bnxOfCzFv3jmfsl8+utojOftB/328LYhdONF1A+JiC/vFD8t54qIAHQ
3vXaNjyMTqVJ3VBDETYg1PUx0p+cHhoUwAgkb2Um3A/0MY7oy/WUgPH3gsgjKu/t
eWxcWQReZSEAzyI2y/zRzT8BBuHddTtdeGpFPXnsOSHfu6jtOxtq99f77s/u0aOj
rwxllthCYoGhYSbJE6I9LJbmzHDjtYpKSDCnoiaERx4F2bX3J2KAPSx8xeySZ9+B
xUNAWIYzbAQ8bbBQ50GwxZq6sCIqLzxMCjXMnpo0Gb8LMGv8S9c0XeEQrczTqvRw
FCUE+T3doyKM8Y0aRX4ZFx0i9tRBmpHzjqHwpWTUJNNQ6TRCAAx6ctKzuubxEz17
IwdltOsv/HaUiCVxYCx2PCPh7CLUO2W6hQMWlPGq76bRza+VROgJ+LTHAU/aNPkO
Da3R9py2BLBNXqotJrhi+X73YDDOuzfNEtWHEhrbSxsnVsByZDnqvefJg4jGUjTG
JtgyNPByqTgHaSuctcdCMDVMi7nvJreiIDWyt0cTvtmyF85azAuYHU2CUEtt52Q1
w89NQy8w5edv3RXhbSQss1KEdURZZbFtQzWdhQlMP0e/0AoKeGl7e7fhiikbskQ1
UnncsnUIGLQrA1BGnkQBOU5CwYOB9oH19g4qm6vapF7mKb/Kjszt8gnCmilltQz3
9zSbpiiuUGA1Bm/YWhq6qoGpe4KmKKeCIucuCPCxphuu4pQ/S79YO9CxaAkGJMEG
+p70QYQz6D8cuBQ7LTSg/CbDgD9DdGQIQaHBFI1I/0EVeAo6IELhTWIeQ4hkkkTI
KIRzcYOPM5wNUaqe8ldbAMW4UQqa4JNQveWw3V6bo5rQgtouLNGitn/kF5U9O6mU
FOaJXg2xvUvXyrLQpsK/cY0YC8zxV4FlKjjr/ShMDxhTB+FuBkFOSD5ZUyd+QVJj
h3EiFAbU07QPTUmpFcTKkSpbYFr3Fz7x11IyqHYNwzbBfBvBaL/l8Y7SpshZWBJv
Sj8wtkQgPEYkQ3gyViN2qjV/8i0+gJnBjeWJhTheXf8brdyl6A2LSlVxpaNB5ksT
CRGpcOH+fSfFQ8v7fSrsqqJlJLFTL0kiYQAv+MMqFIdC0hhH2UombHztLziG1sZE
s263g7Ml+hbILBclbnCiVSwSBeiYLoFYcGSlbSzCk7YZWjDogagOt2PBqskU8xv0
Npi4vG0u+/CvfKkT1wHQbfM0AovmGRA3ZeKmyr78AGN6GMToQmU9J1vPxbsRP+qu
wXj6PEuPB2r7IQGpBsly539KdwsDE8qGGpmTntY6HfZTkLwleJqDhiEfgLIF2fFT
ouFVl0+2W3WugXMcBuPqrw1NhIPHn27nEd0FhLKGvxgZ/5lheAF/cCNBMvXpzFPQ
89/QKGYk7ONN3W/dkmXXLG7uKIJKahCnE8Y6U3ERBM2jlawWnt6yXfvrvlra75FP
HD1zrBv7plC/g8bQPZ12NWNAwEcEBKpmRl61FtvNyKVLYFd1g3brqHFh76hUZHy+
PUSzNQf8foS9HblqzbODVklU410LxkZiFRVuzt1YELvO/GZ17ETTe13RcWGxoBqa
9H3zWeynOXcUcLoag9DyE3V4TLoRJ+UqJDSaJYktWxf4F9BaCHO/uEistYyDUulX
VRIb5utmIzItAJAmbSVB40DVpDzLhZFls0KDRmGvTISOFPc/BFzM7cGP3d5k2rlj
prh3GrjVEuP6KTVFoj66+22/VvaFm6oTl18KBzFyjTTIOK1yhbnqqYQPGnH4xXZG
mBb2Blvtg8EonYCVrC4wtUCJ+4KrDcVa6JH6OVrcRlghM6LfK2LkC32RhIuUw2rn
E0cDocOih2SIkp9ODqVWuYv35l6SKK97Ep3Txt1I4W4AyDJ680XV+mUQSRv+MR/g
2qO3EDJAn3sgoOZ3pmR0TI3CdC38tc9Gg+1IeZBbYXjdA9Ly19fBz1tmKEqM5CZ/
ZLPWEE4o52pPbbkRxO7TkFOfWZxYF6A4DhwmCSReSKKfzXf46P0ftpI9YaDi+K12
35fDiJtUlPOsfcsONXIkTcaYIsvp+3k97d9SiwcnEPEtqHpdktTfu8nsgkW6qcPm
yWsYKGkEvDrEDwZWwIgFtxIS3MtCvrefaL8BFy3sHFUD/b6cH6p3QaHyBCJGrDBg
o774q8U6Rf7MvcugRZnmNcQsZW9SxNeAzGsxe0YArQ06cKWI0WhXjjGr0k3mbZky
1mjr3xJNOzRPdv92CgrbpUP2BEftH/FO8oTh64b4vxIUkjiLP9b2SNQljQ995o/2
0SCC5lfUXtK8gDko2RvGkMVJGWPKgaQD2oXRMKGbkPfOKgz1o5PaWEZKT1r6aPv5
VBbxFMaCuQG98F6aEmRt8K/zQXZ1MkxTcEzmjDwV6Fp2sX+Z5RcbtUfeJtONjUPr
OLMvME21jBM8GYFKVfUPI5kZUtpQ+nZKioN1Nn9L72JGYeTRmNIgNohQuA/rFl5R
2EX6P1PaugKgJ7kQTW1SCYA/eyLMCDNmr5wYDISRk59kRipX7H41IVlnNs+JrSlo
Yh7bwxsE92ocPfY2okKxLsfWc4uwfeo+zP22AP2cOm4QKYclO5DAF5QHfH+uQfjU
VW1Kdc1Gnd4/jpWQZM5/o0yDuA0LtPzoV2NMCsPt/2hh9pvhb86T/MdqadhrMmkL
+/6dIWx8CTf0zYhNsJKRkyM4pAp9QF9SZqIoaCv+F4KKwjqMFoa16Da7puqpQEAb
kpbp+WwEM950jLIDvdjDppNX+TRnYNATuLc5iyZD0pxRh/TJ530sX7mnxbyEHTfV
/4uQrZHa3Ph4o77imXSV+1j2zKJ1oGcLvrWtztyh+CFim+LToGpU6Q+xCxea473+
4V4cWnU1X/5GjIr7grIjprg8jaraaJHYdk9z7QgP6r51CFWp7njaU7rFt8pjyQs2
2CzEBompIIQzbxXy2gIsUtihAPygAFLZi9Ittc6wzpo5SooboVrZBGDcGgFdKBuh
xC3nsZ7YHiwXyC4PpPrct9zFdgGH9R5p6WiAU6pj/mzDrTb9xowk6JMsMY/1Nwth
KfRALcKj17LO5Zk7xnn3/5/QujZGOcLB2/YeDepa3Fxn1ImX+dHdGN6VvtGsveA3
1jiSEukSYkC/qvxFpbC4QkCBq5WDqae2KoEG/BnbREZniEdFCUX/nhMeIjDMe8sN
RlRJCHUkEp19xr3CN5SHiRLRIWV842Fb9y0UKXhdUblE5qm+PPYR3Xl/plHqP6kj
GePirUK1InICUbpjVCK4fjIUyXF5884QUVlb4SJpxPnJtKBcEICQ03h5NH1qWWHN
uBWv0N2q95G+5ZsP8kyaMEZZy5qw+0prDikV7s7/MWpYw6erXFzkWw6/Y74Ico+e
WsQpIdLccORfjFBKwXuLwIAtwmXgRvHLtmV4uzcumCivov13i2lgGgzxd6OhzVFq
H6Wbyzyz2DInGjjeGjYmSvzcU7Rn7kZ0SWoef5R7rCAw5ZvpNgjlVErS4SAnapH2
psBHXOdWBMKmtAbml24Gb84A07l0iIvq67XNUFHKJ3mniU4IEuKIHy795tmi6QFk
nKVddGwnnLrb0C3CR6Mro9cEDIfE/8WQGlJ0uL8h/K3xEI6rQicwWEohCiFult+3
2v0LP/vwGcQEIfeiBel95ra1y0K7vCnCEp0Jf0Sm2fBSiy0FMMeQkmgXnP1l0/iI
yxtgBSSaiVyjjn0OWrjn+sl+DSwmBvauEfpQ/ol2eFDsXpw79roP9SMsKKZSiqMn
qzXfyAahC1Zmq20oRMC3QKe0nwaH8hqfF//ENmYa9dF05gDlFCmukt3gEpy7LNra
av6naAZAAHhfv6EwzKVBAsRwN0U6Xt2zwU/bDa7EPdy7wpj757aW5+APgQvrzjsF
18zk7h0H+uQNYossxhHtLhrWUk6OOt1TtJ4iKyKk4yuxlmPjpt64IOja1Fs1FE7v
OMZfj5F8YiHwvoG8fOVS8Kkhn4/VUsiXD/tpzzaMvZH/ljV15u0sjsrMTk+pgcyX
LTgOl0YPQHTVQOQQlBALwMPL1wJIYXT7ul3dGUHls5DKjp5WxsFvqvD1Fflt3NS5
NVmD9ZveIuh3qU4LDhbyx+YAyrAe2EutfYLeWXTpgWTNjV5EFfMbq3Ih0YT3P6PB
8X6jJMiGyXv9tl+tnMR1MlhLTB3GkV8DPbWiN8p9EZh09fyK/xSDOwHcXbXra2Hx
x6dpYWsFtsHWeWtazLDvk+0e1N+6+WL5o0dfqRno8aHLC75QmfWgd6EF9F6On/Eu
HDZvYUP4htB3SzAGoKJq1F7ZcYZsJxCm7Q9Z1Osv1ZsRQ6yxJCbdm6Vh1uDSLRXc
g4n4btu5zA2jsa5p79C4Zfn0R2Bwc0HIQMGEX71BV1huCBl1IrrGXl5f/eHxPCba
7yLWolvDUbIwnNz/49dVUZZxOF1iZmMRCiRMSZL/B3QA4MPDvP5rgfrTkbR/ApoB
lKnYyUcwSIwm/Lx+i1TWaZH0EmYSU4cBRobor5E3fQWxr5PXgw9xIWajjUhc8ktx
JRM8dIau1ka8sVyzDP2O/2atAdQoixSvdsxBlDaBtYPTM27Alj5vjNVSp0sogGRT
oi4xuX9aa0Sr/vCFNP90+Ku44s9bNn0qIerh7L4nYyOftAcauLc4WzHkJopO2+PN
x5BGCrofqgegJV0DUd1C5/7ffj3JgUqT5xVQnSP6r2IM3UAAED1VtBIstcrEuV8i
KqSc/05voMNQRonzz6XkGBkNxZ4ltSJiQ39zOWmoZ026OHnjwYoFzNdKBo/cou+z
R/NFdjSMBH6TVXh1D2juD5KdNX6Ko1joGOizpFwUTm2oLqQo25SO9B397IuK1wCz
s4AtVOpnE4VK58qCL5Wvs0YMQbIzpiNyKe4Y/CMmYx02yYO9WQ8BBQ8r8xCDg2W5
Dghvkiqtibua73cSr8nTD60+LZ/KeDImXvS5QrW36x/YCIhbegqa0ZI3RH7Qe4H8
Ei62MiY1ND45YHtbi05fTrxOuFI4VqMpA9cqMcYdD9Yo7IyG3bGZrjZal8iwV1Vz
aIsNyvaC/Ih81CpYw2Sd8g10htIplOv/5HNhtVzxybSEgnUJJotdb1/BOTpcirCo
75EJSpCeIAdB4fDRTrtkOQhYAB8f43vrQV0XFrXeZG4Bg2HAYzmj3YKxBW6QEvTo
Ux8wqQQuJjd9COcCSPeHuZrc1YO98+Lflz0wqPAIpyepo7GVcxRJSNTj3ZcqClrA
gWOeVie0EkgCnEkN8QsRRFu2IMKZoJSTETfElTu23OP947LEv5goZ48LctZph/6W
cwGMB3XbnQI1z9Oe4NzvSlCWFlIg5swpyvXeb9AvQUwiOssC6emFxyoFzMcsMfmQ
Gl48DCmHAh4FnEPJpvSrMJxVyhFhRR0gGGd2rA9DTDPg0N8wG1RBRzUSSezzAi5X
YyPnFUCIVwZc5Cdu/0JnDgS6c9RJmFEskYdaJIiGRaSIsfQo/VRrBChmvBzLUp5l
uUVpcmkL+os6ydD96uipTSwOcNC7dHgrJ3LnDogoza/AA4efiQcaPIAVSs6/5f+p
LHrFEfCjHpyiCvpVXc3pjbcw0bmH1C/+zNhgTsDA6MrMOQ2/znKIIvZTLLfAW9ew
GZJOday/i6FUmfaB1rXwFkljvlQXxPqf2JW84fM7g/XO9oaaGT5tmxjUJY2AOHLa
z+E41kovhstOEgf03ujlZr5Bub0yc2DXXZHcA+PMdG1/nrr0IsrTAbz5t2Go0q6T
+WB089D453iyfyvnrkdPlu+9D2YEj6Gz+QiZ8wJYQanQtLNpddnsdlXNLMPb9+X2
j3oJ0edEPeaZfy8HPmaIdB3mC2eABCNMKFi1bjjMWJMafTQPZKH2DvmanLqPTxE/
1u8Zm6SyPRu1j5zCrmyTa56gal8oWX1zhxwohNjfNVGaO2wKVsE/94ir2Jq0zTIb
FFAWDY/3iGT2HiEB309zit8OosFSJkaBHQJRY9zircFwX/CoL3A+MJORQUBsxYYS
q/7DioqZD023P3Zr+c6xa1vgNQOUFnyVUIajnCRTDYUXV+aNdDMbTTXkBDXnUFsc
uFmzKQoY6Y9kJAxWSoIZ6fBP2k2VTqS/PRmArovebgt7Op1LPoNg8EoUI6EximXt
F0RYDk+vhaEsHtYffITBymosw+9zQeG8rePCjHke5HKOMvsj72AWwr/lP2z96jJH
ppAYEm9KQ5CjH4SIAAWMqt92f4uJSHysdEnENPEC8j3dYT46tirm9nBREbZOU5Mc
9d42f+3yg6Y3axpVQLU3gvj8H/3DCPfM7gnyAHV5eJ1FsB1/kjjy0KsPFHmUkbl+
FLDS28gETlWQtGTA6O55GQq9rRrSzBcbesw7z6i91K028MRsbv9NkmsKmUDKB7dp
ibyXmCDExG98CtoMkasd/fwfCgZTxNv25Fr7ltG6S8QEnWrfeTSkoVKzoENrZnn5
V2iFBi7hnCuRQGLipg8jE0t6r/n2oxjhVUA2B8GJabKm2467V8xaoskqr4hISwYU
XX17nzG/QeqNIwgrxaI1PjmAeb4YRezJrDBp8UXd0ImQudU0dERCPLNPu8DNf5EE
ucKCvcCIpjIj6fF8Sri1ijepE/kmw3qo4RISZZLI8nhCMl8XTTA1ZQbQCz48WJeh
05cRpbCtKu8Bh/tvVvFO1eOBNHTz0deQGah5XsP5iar0Q6YakjmceJTz5p4hzaKM
Iqgg5+suN62TVNpYdcFypuPfyTEeenOMG3Cd3+zo9edz/JJuPj7wf7vefvpWpgTY
14/6moHNi6HpnF4daeE+DBITzW1TGatZ1NZyJ99G6aPov+IRkT5zEh9cixkCfXCZ
SnNlcEQTVhq/yhhho1TeB9Q4WwLXsauXEmPWj83vh7p2w2u/1txYRgET9N3SQYzA
OcdPycgiZ9DE1bYwQ1f/CKWJnLjdruCh61ODN2/YgDkKvljs0xEomaPClayLJCyw
hdIz2oDdoVfAmUbBFht9NUvK8/q0AUtOYE71XUcEDLmydbu797zaj5zRivMTuzGZ
ojKY+G0Q+7zFSjnpt4udEwLHgt9+0c5slnQlEQtOvcgA7hoenHJ6TZaUwE8OrK+b
BW3BlG+aamI8ksd6PE47NmZqdftrO5SMeqdK+IqttJOC0iG8mDaA6T0Kte0keuuG
gfBfNUTECVB7mB38OIsg3gWWORNzwROYONkNR3CuwXS7LDiKodIN4zumXFrioq19
hkWPUvRPx2bmcX7jBFSYWfChe8PPBLrPszu0HvRuGzo4a/xE69RLolnWL3NsDhlK
kaCu0YAzQO7V0E70Q3w6GMfRnBniEgAmzDMqOZFmQmc1181GG/8Xzgwb/yeVCrp4
dq5SZ6FTGGbusGidUxRcMLWlM38q5bsdum4gbI1ctDIWmFLouuSXxGdkAQeTTFfA
xIKzIA+CmpjcEEA27ypS5XT3GylDWcYYSwf5EgGuY3oDnnv7aC3jo6NFYhbV2t9C
HGCP9EN/NO4lhYENWCHWu6bhRWHZRm+N8yppwgAvUGXDP5l7XaS3zhKwiXhfwAKw
fQHg1vRspEoqrPV98y9erpJnGVspJ9NtMSj+uyWY3ohbx2gyh9tGT0qXXAxhJsfa
vksjR8woQdfOrKGxetvcxqkCx+YKv4lc9n8UBJsjWdG0H5fAYbVktkWQdyx8Hsyp
eW3K91CEWFmiCzf0JXOkHNBmvjnKXbukS5RYSs7x/wH6FmqYnHDMq1dVuoiEA54F
bl02sKa+WLnOkcPnR+BgCsRK4/FDXd+Y/fp/tZCWvHqNME7gfGmLty2aRaGqm61k
b4i5lcoVO6m2jAC2gthv0XdzEQFLB+2f1SMsDll4txvMz92Mxi0sb2hojDSqCtKJ
kAqCiZTMqs2aPCvIRbT1eI8ZrLu5lGa69gsZQPgf3mE9zQFdFdDmkmUIspDbtot6
ZNeczg+Taydhg10NXlVoWAGCOxUikDZTze2OdT+9QR44607SupIltAxP4rORqDRl
sAVfrKvJK3fgmsO+1ktQQq9G5WOcnQJOa+32hw5BAARvquXcmvh/3mBVEtMLUH3z
bUdwd/23x2eVGFRXXcjm1Q/OXb22ULsPFt06yh/+ISvQJiN4E8vK4fGN5rS2Q1kR
ROlU7lOdS+yk2/hRxt55id1XHee6D9eIlNwx8Y0HOBHGlv5Jvx/MD4E4JzF2a0VZ
XgCcW+z8XYl/SN5/ntOtId7Jq37o07mTqSQEfsMo7VK8fMMLEtxDmqoJyuyVS+Sg
JllW6c86FhoKKR0AhJu/d54jOnvMIfuSGKhUIacIj7LvDJQpV4sTyF4BWhujVEyK
VBrLUVqeFGc9/A2D+lSvSCjoB2Rk7aZH3+klMSXU+VAzx4ELiBkq20dZN7XtzHgA
EplhAgHBRKKeCOh29VWKX0+Gb/uGNoHqosIEOv8NbudmTeR+SEzLHOqNo3IhV5s9
5QoRVublw3NAhGSvHlyAqtakWDCg2FR9yrLAyMOy9q/3dUxADR8oxZOyXoY1RG9r
Lz4rbgLQAsvs7gOdlm6jLpQ6Pp2L7gUbePZPXmz60opJk2UjnSCMSICwBfWECmK7
VBVb1EhgOWkhni7IKUCp6Znt/J3uD/WAKthKW4XxmXAyQm+D0bgoitvwgFsuAXt7
tjUtHST0gy7Pi/CUeYFeQILuO480yXChxhb7hCvde36JiqiX5CYN3lSCZAmcP1Fu
qSuhKGmjVm190yTRk97Snh9x8OpWhS5EtfCITCTX6UEjVIGk3zkl0m5o7McbUkAr
5CNZuiiRali7J5i/5gktR7W3y1rNQbP05UHgH5sfRQf4U+hLQIXsPJJ2txPLybL6
2oQRt2hEBvKx46Ig1JYBdiNdI51W5KMGCX7F8ygNuP+4RlYeaHzmRVxEeVEYe1Yy
2qEWVgsEDZzx2jyJOyGoZYohx5ti7Ch6h7YlrWQHP85ITy5rSdxphxF9xSdv1bog
BYl5T8TzNCzF1AUj3NUdWT0eH4iuQgKQ4eHBfUuHJKHOQYRISjxDe1KrjUynln2W
BRJXtsNYdfm+dhHpMHEbjsUGXRBjxj8fpSGal4ZUU5zITHvgmprvai6+6Yjurw/x
OrvTQCsNzGo/BkEsLGz2wpj5+oX9xF1F4HafzNZz4PhBJlhS2Bth1gycHP4iK2Y7
4fPUaaG411WVsr9Exr9/1x0qWjNJFgKhxxp+grmTVvO+c/pSoNhCmkQmiFjtJ5iD
j4mxg4n73SFKw/y38vwSQ0tzZMBOjE0zoUHlQlXp3CQD+yXEQQAaCWHwWYM6lzYw
B3xrgVnwyHK6oFHeoSMGTkLh15BjYCp9QauYKZ4R74h0rKpQNKJfVGKKDby+5tjG
k7rL0FyIGQKahgfA92KN+5ee4WT6AI8zaCTjjG+9WYCO0CNOkWsUXIBugwkrTiii
sZFrUpH20BgOOINkVhY8iTRKal0sy8R69VRvkokhPYcNhqOWCnBKB/k86vht8oUv
ulE7WN5G3TEIoT3OA7uVNmNuFmjFFDivxJtBzb3BeTG4UozKx3bYvGSLY/XmkLUi
ESGKuceFsOFMNSkyp/MBBxiRf23eRQ/VcoVpkFOO4PFbUlkeCXNZFNB6YbgNA4HR
17pi9V+7d+T/18hHtxzExUpDQPa4jtdmPpBOAvrGHCsfgts7H5Cx/R4oSu04g8LU
RVqB4gezJQxRxw2BDH6jIGABSoKOVctjlTM6k4JGvIoHT+e+p+wTRYDqlDt2g7Fh
aGURwv6iz87rdrmZh3fCJXGtLmTTH/oKSioEiGuZIrAL9+6YnnwuNa87gcp/Tr6i
nHLGcbR6txy0Bh4aDHrcx/oiL2Gj6lyUYZFIQ14kubjCnSRbTUZxayRpbZvViese
15FEwARrLVzygX7gscg1h0xYNZEeSsg4Q6/DX4gi3snsR+K8vmtjrzfml5NOj8g6
tEBoSyoZDxxK/qPrnxTC0Q5uq3vaG5ImsI3coEtK2rA2CrPvktuvLGe7ugUWn/ci
iKCXEKeR93jgkvv1BkGxtjSbn+4VslKTeIVZTXFTau2hPb7zfq/rvvcay8FXQlq8
d1f5R2/WisrmiWthFE1VOIbDRAZsIjPVwfOUZXnyQ6QsnutDkch37PMrMTqi6gab
T/UnN+tx9z7e8zetyj5r8wwDgMvKYPiAtU+Jz1i/UVPXNsqemRTQuV9d3CtkfJQJ
wnelJEiI4U7MIC9WaQG9kaNYQixYKymI9i19/1urmswCWaQx36vZmrVbUIV6PXSg
/dv33id3n0Y1lNfQRt9xPyxOq3SlMDgH4B9ECn16oZzgH0M4PRGljzK17KuRs7EL
ySDPi+RJC/1APiLveUttEh0BFM4tiaRZt5CsAzdYCwjXyI16/kPL5glOY98LhI01
8SkUZGdclEO4QB4f9DqVBBPP4uaoT1+QR8s6VH5aiBswsG2gpQ3+CmPHKQwpWmz7
tQ8q6RqPFomeNiBO4msQrwZwn9xuZHQALAoLmJe87UxbAWIMrwJA3hI2Eh0F09j4
OMie0IAcldcBlXMuPwebkhHLFL0qM+yujirc7qyUvwzmzF5dXm4sJEhcxGyhGEiC
bNPHZe4yRWABx0vk6rosBbiMFD6lHNTq2Y4zH6Q/5ZaYgJOGjtm6NbvE4I8bJZkG
2sRZ7J+l9E53BnzmH7Iq1f0VFz0fgEh6ral6mez+dEI3pmS4oq50Y5CvtClHb2EO
hBUmEB1KY/K8fpq21hIhkiLPRsNwjoJeB69iCxV6nu14voFdUUg45Zcx3+VAonZ6
kNCn7gLs8V6P86loVckxPg/xJU2JbyRfi3uWvLf1BtMurYYbUhajYI7vcj1Jb9B4
pxCjZDih0oJj7N2ivjzPlo3TJ33Gg3mAch95Ahsx8rD+yOO6wEKYhhXdq9iYK7gO
tctMEjmWRBx0zT3BltK0rRYZUlgPAzw2Q1kJxaTR7XkD8u6ZI3/oJhdLXQu7Dwke
6QwjufIO+g9L5vZLomCuYpu7hAJZzGFzVF/X9pQ/uYw6dCumMwtp3AY/iqj+Cazc
sqrytAiwn9XJK1Cj927YigfjALSw+pJoKaQvhZ8EKSSX/Vujp2MqEwqRfHr0f2YV
MnLq2ztGxi0Be1fmevNWzuDZ+vH6apGszCdaggM9Qnf0dq4vpfdf3faN4XJ9J43b
JAMNg/PthLVGnCajn2os/wFrV4SHEaFvqINIHQtXnW3kFIAr53BITtah9qAzYtGe
jT8f4kmq2b7wzAkiPM4wstXjq/+xzv6x1H0wc2na8SDM83r23H1x1vuE2VtVpzlZ
5bU8MFJAy1wp/P6AyuopmcmFTlfRH5yUGJ57S+6nhe7ezJRjXDEqGmtllkiEL21f
IufwPRzNTdB1JLuWWrRzZlQlnhZWHU7eczCj8y79e1LnxxNZszlGflahOjGbuICN
g1DzTN0NOSIibEZkKHSMGe/VNyDJ0xxsb7oD5gyRK4zze8EMej4v1aNON36/n928
SFppqgRIFrowFuJmMuz9VE73WjCl4dVID84OMUWp+mhOMc60sCLVonc+0TAAt2XR
wZi9mur4hEz6/Hxdw4P2XQ1Ar5VRb66V0pqSZOkt9vGXR3SlFuQ+v9bJ9a5RheOA
c4Q1KZbfhrFJvwNl0QI8NB6vyrJ0y1LNpJLGa/pqnUrOqpyxF76z74ZNRK50PNKh
SiPO6Yibj+bipKXSwUzGFdnQer6KaVAUpq0Asb3vLf5Y1DC1CyRRoli2mwHxejUU
qBALFiNW9g06lCmiVkOTWV13BNRoqhDKOZNSzRbBwVAe63Ksb/3MVv3NCp7sdawV
/Z5u681LKuYIUM7826CGcjreBZvyNrOG1d+rZJ4vfuOTNMoCDAMApU5UchXxkf+z
SaOj8/VEYqghozzenYn/GiiQZrGWikK84kk4tQpslEl6SxRPKE0UetWWXScRM93I
FlT7NDYJ8EmLCubagAWf30+dqpIxEwF+2pafNznUf747j16kdWHep3k36eWP2Uqm
gIk40N5ieORgASSy0qtbJHQj6Ca6xg5RhcrWkKPn4eZawiIkfhZIfeiwN1M+LIDh
JppaDg+4FuxfY1n45YaE27dQOHbB3D7zMvY96gZOnFxDjPwrVg1RH9I5F3sFgPSD
M2Crx/oCPQQSBEyxPp21FZFmkp2W3WBDznVFiARBzjSsxZ1FmIzmtuMXK6c2wCQW
YAP9pk1H+BL2nrFx0Tx4PLZeMx3kXIIZ3+yOpNnykU+HtK09dN4Z3CXtnmPaLwQz
Wmp7f5e2dxNGGB/hsxTY7u9Ow9/QWs0WLaxZolxucFtE0w/J6+dkHViUonAx8O7y
OhxAM56Clx2tROh/JjirDSq8VatEhwyReB6VIx/FmoaMnvD+LskKTPDwBXB3Si6O
KD3v1MHmZiSCv4sKl5sac9Ge2Q0TrRnimwZUdb2HsgvGDEfhLbVO+uk+I20PBD0W
JzYuhaYjtCtJvq2RdLDZ4mvmEzsVLC8qWH3Z/cwiymNVxM4L3/IyhmRp7NYl5T8C
YlaLUoHEh5nF43YsUb8MxhsCvLOrNREnGJYTl1haVinrQHDGXX7pv+LttUeK2LHg
p3Sf9vDCWQlHgt2v0CbQz+sOaVv7VLcZ6zj/QvZstzIPiCD6fSEBfTEVkJtyWNzs
t5qYAcr0JnR5T62cn4LVa5Xnkl8ziACo9l3smuCe2rlgimYcERbeoM3Bsa5iZMD3
SuzovVyA6tsZ/dRkLmF2BS+0+5eHASNHIBIn4WTNcsH5r9AYuHJh7n2UeJJjkUiR
Lg7s2YMwXjoTqbKHPkmlWioPu5NmCY06bmpuoon0+WyW99SBHgGhxMXhaVhTsDix
0lmsNHUOWh8DrhMKYIjjyeGuPKN+/rhNu70qX/6wMN8I5dVTM9u0IoXAkVOwDL69
0Dgi0/tA2Z8A2tztqFcNwvIxUeJJ4wgMjki3sHWAw0zPEIEDB3nlS9bZrw0TCMWs
LlVRA3EgKMcLKYgf6ie4wC0b+MIBq+Ec7l2iR8o4QkMv/nPDMS934rY3QNRYZ7jH
HUByVX+SrKlef8RJHefshrc9D6ZO67/mcfLrtjYP35n9o5Axsbij3TRL5AGxhVls
OHM7qbEMz6bwWTBTBn90tmHESs7oMQzBLilVZbpI44SSV15Sy7ZgiMwZr2dDj/r3
PjcqltxyfIECuRf4P5bL/eX8hJMZQX2D4nlKO6zVfuIgRAUvkRCaleL54TDzuVal
uUkKsKkWHzPlDtOTS9jYoyMc9LNQ7SZvIOeBujdg537PLkyfl5AxVUWI3C/YTFf0
ucc4vP3Q71Qaw9WmadZfdzFWZ9B4WgfyoTtT63OFTTxV9GmNqgOl3YaDarcMFpkF
Xrk40WJkPmYOvd8fvCLeOTctYDXglqfWE2vAtiCcpum+iw4P43gyWzjcMMRNZnff
tRrBrLMeZj7CTX55xBtJgqv3xXd+OfKa8hShqRQii2cDqsOcLQh4tSPMLcbu9zmB
WJ+rHRldQHSgc64y98sW3tgfwIVtuexr81uHIoonuDnZu87UxRwq6oF7jDbsfq45
NF5k4I4sHo2b7c9HT9W+yns0CZZ3anBwilioE4y5GwaBIWQzb0rOgnhAfQ73sZ0v
W1IwLiC4twWuefo+fergapKdpDThwjPz9jYpvrNGuL85yW+pwvS3RirhegeeHpOE
7D2B9FzsMOUdYnyIdyryPGiajB0iVuh5t3q25XLt1T7ucnM5ZLQUGTqC5smaapQY
44KktzUhLwyHYvgUmwIPycVBAZ6VMpSGTE98MZF/xYXyZ+J85iJQTbTeLX9+iKz9
K5h5HUjH9xSLXhpti4BQ/qOd0EUio8JcBzR3o27h4f2barVmnbNf0hZ618Xto343
thoW5rYXh1yZ7fe/Kmn5a6rDOBsuHkR7UzG/9O9ZpdO8sMqXnalvZAGuCAwQaKFS
tIFRGPGr9evrAT7Hqdb/8o7cIoCyX/xV3OKDCIaf+0X89AZKwr6rDkY9OBNAJW2i
z3mRIXBtxD0+xsjx6GAOdI/tX1z3rukPBTvZPZ0nMhg8hQyDoKP0ZiLC2SooIKhA
kaa0NFCSOFNzk/JDyRfX3enwuqW2z4GzW0lzy+QPB9fWA2gbb2obauXWF6yp3lpX
/I3FB38iGSax0jOrpQ+8RaZerq/OgR4p84+QWyvj7/YfxqBm5XTlSjJHilbJoyx2
o6LeNeOrYzeh09zkwT/iMSVKK4INkAPaPNOV1h24QbhHabuDHCmF+QHhKNfYD41a
QmCu+ip84GjuOJdiNRW0zBC93LsLEqjLVybw1IbXscq/mZwBrWNBQ069+bzqndUR
qE/OIsycA0IhfnrlOalVrCWO7MIn/LC9uWpx7cumDZOit813p7qc8gIYZDWdywRi
gFDkkjv1lx3uXLL0/N1+dnqfMqrxF1zXK4EHdbVucuprwbro/ZrIxfyce/P3FVQU
uEFeaCDSdIOx29JfBmxeXBRNsPBic0mEIBIREFH4aKqh3xwBYQHGRR+n1YLKuW1Z
g7zhg1QcQkipdO7LDOgZ8aOqKJa9EEtKynP90Qi9q1yDvAy6CxWJmLg0ZLJ8MzpX
uShTI0KuoaXdLEUCT6vomaHkSOU3ExIKSRmQ+iEbUjgskb+97f0iyD3gha262rBm
4+yzj7axKRAYFNd55ogzDnJnZkyekYqcfaVU83xhHP1mtBKFBZVHDxapaGmQBZdM
uWVTEV1HmAAkuwzKJmX+EWLyZmGPTp9q8gi8vdRYzg4Y1YAnBbSddbTlJKAyzItt
HuqiAq1aLEDU2BZaToND2fkCq9gGA4jvMacEWwF/mcazKr91kG5TS4AHsq2HDpGN
1BguWodG0QYWBwzz0DoVckTRfbGgxuxE6G8KtVpJQStGLuE9y4J0GIQe3duV9iBZ
i5GUcqXzx/raCeyrMQDiPmYiQ/2fBHnZG/yGiX7/1OgXgTLIyIO4w5SuiSxxY/Gm
VODIsy+kopoFwNbOYCYcwv86TVs9h0P2rTq8CV5D6/ap1NQguZbs8hlaYhBtgTUC
gQgcVnIB2kMPEniOpbBTmotgfy5JVo7u+bgDk0mjUL0mqPRPmUa2kpG6f/n9lXW0
bhE3Ocdw8J81ia6LgU+3280QoZ7EmScbLf/WansRf/4EW9+ZXW8LDHbDitxxzkgP
jCVr8aoTIdTkkah0XF/masj5RGM3JJyvc9GYfiB47K7HnJcNOHgsToMDbIn8zBG3
yT1mcrWUG/OjjrWJiDg4mLhi5kXe/kBxhy3KilLk7kSbGo7xSBAKqVkrR06IFuNI
e4/w2CkggRTqO8NaPNrEUzae0J0kxm129XxztxkiDLnP1zDFMvA4zJEweKYgwMD+
/Dt/Nadtp3QfPwbSTbeYPMCyG/8El73pRN5FwThhNQRT6YNAgQkWHd6XFO4MmMJN
Pf9UWgiODE+4/erZSFZu1CQnReWgJ64tzdkN+Qc8O8HqQo/q0ksYSfAAF82kJRPI
F/FtUoqzlryyq7cL3Djy61Zrqrr2p5xjU2l2vdSFNuEZP6UdurWE8byu9o/Rv6ey
gAKR/syfttXBtvYRdWGEiawqXEiRL0aznkjP4X/zY+/uif3Wr2JMZM7H7Urjif94
CHSol8RSe+jRZGtomMDwkNJw+eBm51cY6BGjC2cdKXLrWeDn+pLfCqpQgP4tEG7Z
ADjGUllb4//vd74zzj4oG8rABluIZL1wPtq8eAMBmPK0PBGgHZczdDKNdbPczsWK
8rD+gascP9MxEoYfvXm5o6SeuXJ7GY1EL8sokfQL22zTIBHCe9WkbhC/YHP7/C1L
mQ3fHCEl5rJ9tHItvara+pZ7GX+P4dfMy259719OJ6ScTut8DE7BV/j2qoBbo4kh
oPMzigBmxIWwagWE5GIghVmtRPozSmPC3YpKAM9sJ53DWTx/FNyg8soKP5x601uy
0BMRORr/LhhUyVAdJISwiPosfDlnZJq+VW2hixqdzw4hW6wP3R0R4MFkoNsJeadF
Yy20gVfFfYWEksqxUEct4wUYvWPDw8rTqd+QXo6U5CkoB3DO9mhaOfnPPW9hul2Y
zL+RhrD2XUrVJ0ldFe9Gi+Fd7eG8BlaZ1g7Kk6ah4NCQMu3QsoN9MTmDb3VQQ/rC
P/oWePK5RH81UY2ZKai/CDq6d40xz7ncq1/gPnSi7lRbeRYIVxXBfV4Ty3sv2+fB
W6fNw1V0nSnupz3wRrwFV3q1yy0/Rns/EZkp2+lCxHeU/LtyzdsFNoaEaX2f8EIZ
HrJ4CptnAKDt5NLt4LVkq/A4OFAyV6U0hu+f2hUK7Ih6kNkhh4oyEaLEK2S7SEGd
zG1OG7TTVSNqSk97VfzTknxylxM55KZaWxBcwjLsh7B23N04kMjLr9qo8HCDD42u
yVTro/xTgcEt8uPiK/RX6S+2y3qqkkHcwU53oI93Q3dhmzDZvmwSygwp4QX93AE7
81jj4swMlO3SJpGdG55a90+vvun2JBESISwBYeaxMl7rLqI9W1IA/B4vW8aiZnby
u+huv8ixBV4uPvZqwGm5BUDo0W0GNQ/trzKxpTdDMmsMCxEeLEOENJYnmXAwu3XJ
aWaPNiTUOMf7OgNkOI4x3jdvr9GAwDGRXBfoxKgtIhOp43BjXdGu2lgVdPSh7Iy3
N4wmpwjywF2M+xrJzR9rnI+SEyF/r0jFheOB13B8J2gAqKByANDDOp+6gyN64dYc
0JAxSV2skUEYLTE3SN5XA1GQ512SzffKAg6R/sj4G7uve/FcYF+y+a9pJvJAVURF
auFaWv089y7bslIuZsLUCz56IbgsitUUU1eWMF0e12OtzarhXfpIQ2rrrA/Q60xR
9daFKzYtyp/UUDOlD98vY+O1wzj0ARKd8/LiU4h+jp1J7vAxBVPM52bo1nTkgoEU
jdfGEs9Hi7AKpkY+EpC1K9rHCal5c1O6M8DNWxb26yxl0hO3OW9u/8cduiXeZN4Q
wUof2OtJHc4zJRWdMNvVGAnSWhTbVdM+ElZsfdnCEV7x6v3WQk0+6Sy5bbENBDCv
+DsWD0gFjVP9CWefR2hxaj07EnD0WMe5DR+k0w4z7C+mdFsJOsClMO2FLTI0oPFs
pXLMshpeEY9Qfqz0FgeaHAHZirh/ewAQK7G3yYfnyhGeGeHOs0YTyLTSLMez38j5
aCZuk/Yfphgh3ZWXokqr7/6vs79kXtrxFT2cDC/irt7GP26EJr1KRcrfyzF7vxRO
g7wc0LNOQYHTAuuk11jKqCgcjY4ZnfLfMgNSnDN6nkVFl3XFwR1O/dJBYmT49Bvr
jBIDLhCEWK8pvzCouc42aeDTxOkCkKhVvAR+R4iFbPP/S82kCcRZmY6d7BwOUHsM
RdpVBQhEkZBjcesyHvruE1/xDbPbZQe2QysrIiS2UFIJ6PHFEWadk0QexxcRbcFw
aQ1CN3flFJmcZ8L4Ch7qkeY0TLix63BNJgOczgo1//qi8bNuEiufsaHJWpLkjnU9
TK0ewZ7vd/EBhqrCxvfVw/ft5RCcfQi9nQ9SBtj9AtQVs5WTOWwhXtD1xLjZDVXt
3Lux+e4XrlXJSEX4L9G5ywuuCIRKet1zAZMYaZ5KJHK3IOwmFMicf7UbiDtWPn+L
H26XV5Lnr+EOdukM+vvmWSs474X0c1oXfPafJ5aeWRMz/lBRoeNbcF59A67475fp
DjLkt0Qkj6qO8a33B01Cx9FV/tiXq9Dqsq+MTDBhxGiotA5/cXycffQiJM1ez7II
U2BjzGvVwpOYSx1hsvt6Zteu+gNSh6HUneQjBHfYT4q7Uwk/mFG1+HQ47FyjuZz2
q+lMNsneZzJ99RrEdJG6gO8nqAJd0aYm2wGK4r6XZc9zV0PFV4/qVRHU9ZE6oQGo
KJpYr2fMZUYByKl+7V/it/noIZu1L/RZrVWSxL4P3CA0mDNGa2C7lT43OIcxg2fv
RiUQPGAPm6pUQklt1wmxlYg6XPk38gbMnM92+W1r+NF1ST4i9CcEIML9T9CXShtB
fuV1x63WO5jz21aP3BO6YMwXNiy87u9gnOVNHjNK9InUvzIA5V+IdGlAYo2h87tC
DO/RBKrW0ejepiq6QkEIrsC/96/j05lYD4fs5R2570b4a/Ft7iHs84XehbSZHqEz
a5L9wUPwXnxxIGQj1TmO2E9P+7YI6x1gqwoZKSk4njIyvtEy/1SCR8UJupeo1CNa
JP+ZHFroYGGhR5eA5GO2JVMr8b07MwAdddV6W4eRXMVzgrgReN267N7EOFA9qDOg
V6ImbYc0mNVcNXD5xe9IZ40MC+q4b/TkZKSn3TYn9hj1bJq/iSi9f4O6uqLEsdYv
kroPu7KJl9hOo31gl7W+wz0235LWUSs3T00aLp/F2RxP3Z1XWT1yi2+O0wREY02S
fwGG4gl1AqKxOWjKwKQG2RZ0Kn7gatRs07qU4qOGOuRJxzghZb9mzypaets0TMxo
BgFXewQHFMFTKI3+v9JMEU7vtDxi7/QxyhmdDzGtTqQ/bEeAzg85Ny3mTlGT7R3p
OF1bJ6m45WlIwWR1J4a+eFM8y+owv0wdT+MJjyNIeyExybVISGz2RRxTsfnrbaZz
oo4vbE+PLvoSWqkYWX97/nH/fzSqMJsHyP17seVlaZKHdQT4KNJPeADSAnEDQlQQ
MZYPuVvNEgwWzbs8m+fg37wS+IP9rOfxmCssWYnoJw+S0oFndcNS9C8rita5OILw
sC1tSVZXUjRmPib+yRHHoiYqwKbiPWlSTEAtWUHsX904v6PJU4ccUL/F+z1WfPHM
OjGThR7Ylw1Cm/z6Ua5428rexPefZWRwHin6qR1rbgzZLARBIRbcew09vrDymDT/
ny3w9WuspCXo2xkffK9qDJt/Td+HPXzT+XmbBZejp3vyaSiXRAy1Upfo+uqPLpFS
iFYpKB42idne6kaTENOYn0om/nTKXYjUXj/MeS/15AUU/n6dyHNLIsroN8pZNwec
L4bKtYItr3ZDAS95xtvGcW43u7ExSP27wuwaLuZIyfF3iUOew5eDN/9mXGVSgmBl
G5fsXKBHDswxvGf0r7ZvTpkMiWWXOkpEYQHVDIk2497CGFnvdLrkE4apOY5Gvy10
GvaiKfhsBYSmnIpa9+osMMv0WBXPl2P3YgDPhVNnA/CcY3Tmc/WMFh5A8lP+UPLL
dc3N2/i3N9EA2rcO86EcOlyEM18sFPxs0/jANEyTpasmXDPRRmmBs9twU1hCZmMK
yN3IsrZRE8+9nFLN7iSOO+XlBpXYJEvkyTZDBWTl4yfM8r/oieZNEfsBRMNbPHK7
zrYiX18tZ5V/2nPCWbHYJxSh83fxBQ+76wi8hgXHInCzR0WbVqz7Ne5bXU5sDhpV
VAEfUblVx1ZlCFGO5zJjBPxbWh65hpUwyaxxBwpmT02W1Hndnb3jcOheaxeOVpmI
5FhcDQyjdiAZ38rEMj1gS5ITNS6nG4s0PrECL+096LKLWfCjJ97oDvrncGpG3EcO
eJV3Y9HjNWxorG3OnshjwLQHNlF3G1c9BbSge/bio4zdT/87WcTlm4O8uPcIDoaA
ULwsEFOq9peTtERMugf2GrBavZYoQg5K8/1pigabVD8GzJ9wOhy+ortYZf8QsIuC
gmXekpprECTju0Ihd6sR1t6VGJ99ErU03LgVwW62Cr4b8pO9WWWf8WrUgA6m306W
CTCq8V3uUfXGPLmlmKQo+ddQLmdwK5smvKPM59lMf5yEMnwU497I6jIKrXCPbfYc
H3I9/71en++lBaPWEfOzEvhCSXC1Mg7Jl5mNh1BTp+DRQ+h9R8eBWFFfUO4VueRk
HUGsAMSg/5ldqczOvVJHQcSRi5aAPGplMiYcnQ2XCYrR1TrjWdMiOKiXFr65PB0Y
kIPaF6meDqOTr6j037NBdbQKJ16dTti3kzku+005N92SIShn8bhnNIuR6FLAUs1Q
jDa8GSfaNIMpPm1nfnooQVxOHS9NtKTdeWs5E2V5zoR5qArD4JUhu7nU5F5WUbmy
ddvU5DcItiIs2nIbSj/XXbDHheCjud56nuhJpOtTGoVWiFiOYf8Q0cyTUro4JoOG
PlCxw/2BR1QEN7aExj5ANiv3nS0wL9yq8R7kb6ZQQ7fHEsIDXhPWE8W10fyWOeTJ
mmuUHHigeMUsmTSNl8MAP8lbXqaqUXi+XOpgXYOgcx1KOHtHJYROMPssV+uXcvla
jHVjHk+SHj+tfQqOoRRe3eaRsn1txehVktL+4aXaFDCAc/HQCeFXpFzPwA6ZarPx
qrHp923qvTifvmejtBBCldTomiGzGDXG4QIYhIMMxGicgcrblti43IFfWkTbNqin
hnRKvq/RWnSB3eP29h/N8ex2xqmoVYIGwwRVH60o6zh9YlWwkN1rURDiATTL/vcR
BzX5vmYzj2jh4/wiTiOVs3/qjOiwpl1gMCCBNqBQPX3VCfk6jM0kbxhRNoAJPvUN
NAZdCnBWFwaWKRZe/fcGqQVddYisMD9n28H2jJp9h9X9CloxHW/VWqHfxNF47DE8
qi1inw8TPjRu6cDfyLh46B+Tb/itzqWcygqOSrlqRNelnOzj18rya7elRTEhY00z
eaVgs5zDsswkgLAEssdN84SU6b09tRdLjQLMv89BQ4SHJMQT+ysvCPBSboJriiSq
a4Z7dxCo4LGi2Ei9jnYjhPCWZLfE2w6LkJKDLdtov/xPI85b7loQEIVz7dq4Qw9+
J39JdKctcvHY6vQKBgOG2hhDw7fSD5yblpFh5OEbbSheyFmcTp1tip7YEDROX/qs
I8Rt5OLwjLurFxIDLxAOZJrdAFrjsaxCLsQG3sJCAvwB+65WlD0ZGPtWNT9l4Ru2
4bcEXqjE7LtmmKQctuu1EIZ18H9vWPe8+V+LuH6XoXUOxA4/tNkVxvMmvrll9lM4
nrBnhGHmx5fTSZqPUPryEJax7/HYAeVbV2kQVhdQi4HuI6M52FXWwcyxQNmjpfSa
qquKKX4xvC8A10irOEuCwgtpiZaA+NefVhwpI29+B0wtWusgLlbtX3u7tpuoSvhA
ClcJnDKC1TWChuQTWofgVoNMBqbsKKG7jwoKACvD+gGvVw+AQXOrzpbBM+1CRfOQ
IYMl2TIcWNqChnZc+H2KmjcAueL1SAwiwp6e6XH7f0S8jWmPGjWTnzftfPPIR+qX
2y+e8TpF31YgotHTLvx7nYQcHq75HavQTI9YRu+x2MKy74N2YAZjZYL8QNMuQZF3
8ubX0z88U25JyS1TzEYdxg1OS66vzmDkiMIqACgsAPD7x77jTJWW665iTiiDBDdz
2f5PKCkXhpPT0Ymgev8Opn1mSf0ARcYDfZQRktn2fiv/4Kg6Rm407Ckgh8RFM5Ai
8japcFnT96b+ltdzXku2bo/lIjmv6EY4k1KI64VWK4fzvBYo60amGb2kKygMO6cs
m/RoCDiq3/agZH4fflXUOE+maXXFEBOaRO45g7GtldI9JEhMiFWo1mk+kE5j9a2t
2Y06RGj6XGubomhq0Jqe43S9vYn2paYOs6J0JJVuU2az1TrmCdh4PolcfVBJ+V0d
wKz8Z3ROdqxbT6PBnD5Jmx53SVb/eurapVnDmY4UjdJFSGSY2+FOEahjJtVok8ar
9aFmXGvd+7B2FVXF+Jp2rYvz3jWfEH+Q8t1WV2FSSLyesRSJkndaViYkv4bncL5z
M7ovAfheQF0rWoHvcNcFziNfnoFVM0vbG2b3TkN3fG043/FKN4t47krL3JeKrl0e
i2Pq9GJeHnaFjMC7CwzGPU+x7RieEEViG26FfsaiuqcdWRMrhIOBEhcTET0MXwH1
KreDTALGfvwNzHn7nn7j9FCJMHOufcQ7vRzxblSji+A/h7RTlrdIQEZ/gCXgETsO
cSHvPshL/j2+a1lek08jqQEiSi9IG4TPcevVCkbsf6R+u5SM2lnr+Cuav3h1fSM3
apQTmhlFPcdXuWKP8Tq/8zUaOwvxRzwGYlc3taZaMbDrgApkPBCr32zH5O1zinWL
QokAp/RCbVZKMF6GGOjwCDijcmPh0F6TNwXeLbZ94POSbY9SJYT4wU1b7lv1Rs9c
3mQLO7306k/Mu9KlpsnooBHYNU+AgYNdEhAQqJfe9f/AlxT5mg/6V7TLtnBAPdwn
hQo2lY+Td82AsOmtztkoDgdZED2WP5h9UXkGpzTOn0uItBlJ054eXLOG/hkYcT7b
1nUe7Env8hYWG2HOL1XbYmtDDsD5PbjVsgUWWGIHjerbogwbpXN1DxksTbM1I1xZ
pzaaKTs0RQHs2ZON6CExIXUeZaM5QZy6+izdCvPTN5AXkLaHY8QfGmgpk7ASakul
WFYfHzvz1Cmgh5gaEn7fU3Tgvppra2WCHxmrG05cxjsews3T1qHb2unXrbNB1sMN
MrI8TIbmVzUlCnoLiM9AXzU5bK7XH8wa+WYiQQwEQuPlmnHaF8O8913BjzuTmd6Z
kwX1S01kB9QOW9gDEdYbGJdpmoxdyKwF1oeW29OFOjNseiXq0fZ4x7Xnx6Xo0D+1
D5mW5pZQnziZU6ZS8qAXcjwGXboYj24K7WSEUlp3JxtF9qp44L+1sNgRthT/l/TB
g9b/8lrouzhrojdRnFemh4zvHRvqrZPjSmGqkVs9YuIpgX8F9XInaXQpvWcuAqzt
kUdPx7bVCLwEw3xDdcD6BLlQX64cMPy6T8S2KKqiKo1UgSeUfVfte9UAM6jfFWb6
nU4yCGMnB78IcB1svDAOS3BbvCgTlDy1+JXmhOe7F6dRVFnEf24DS2gUaSyW3a22
boJMGmjVU96SICKhegihFS1xA+QhWM/9qLKOfaTqs81GwKjF50n4Tgy7pAMqqBnJ
Y23p1L896fcf2p1A8a4O8jvyFYmyuJ9QJboi/40b0tG5dZq1Vcyhzs3c43zsZ88b
K+7xdH31dg8O9qw/QqD+zMxIY3jABlcMvHql/3FF1BrdJHTt0gZaYyhnifVqbzFM
6Um1FX0JJUeV3jEaoFBPrrMlk4dTZWosfzIkJpBw268naUenY80UOViL9dOF6QWJ
ikAYQy0uiRPIhkM9udcy888l6kYTsN5jspqePAgA+23O7C5eVv7mSml5NRRsSE26
xADsVz9b0NzA5TPNSummMX7Dvb22uRQJS21kprYIApXba2VrN4i3nJvjGYeRxkFG
16/0sQgx9XP7fPboKLHtPtuB18A4TQv/oZJeIOIH3vpgxcJndGB6ygodvNKrh02Y
KB/ExwVR6IkE4P1nTBAWZmVXVB63UxyePu7Bbe4FO4mtDFvzFxklklmDO2k9QLG9
Pv8cSFFqPViSIhOCqyijqjrr8RCZeJLssNxpOnX3t0ruzo4f4hlSyxVwOMsxiSYe
2rlD2iQLj7aIeN+y+TYygFvueSg/RVtkBOchgnf6H9t6iTsHNHmA7kuC5fyAt3kf
Apwu4j6jvVpFfiHBcP3/KLPUq77vwaN1jCNMdC8RNqEXLIL40wo7WtprkE2cck2H
wQTyBTyQAaiR15ADUrT4gwFrTMOvooM7l1oJHwyxdOBrpPfCr61lDm02tQEh3bv5
p7hRzBZS/fiVKee+Ddaq2NklzCVHcpkKYBdimQTeVsotEZ+sEKA4j9WM1jlOeZfO
bUhwIKdkCLsbRjTU7JRzZtL9r9Bd6bughVdBcTgl5wPg9ZJYLVu+EdrmY/JSMgeu
NE5T5VLVO2sdNjvnMVMJU4EQmb+O0858OnY+sPflECxyRvnMEay8vY8Hy3myr2If
JT8iSGzaAz/HoyLzRJ59CJlVBIjpdUHfOjc32ADFVpG8qOpU0LFcG42d4SIrF58e
eY66oE2yGKW2xejQKDo0G05QSfdPLBd7znPFtjhokAanVZIhqUa4IuDhX5tI9WUk
5Rma0sPfnTxmS5i+i3lzGjDh+ZF8bJkk3EQiDm6awwQsCRopWBSN6aZY7hIJ4kzP
cfgRFR4el7JnujkizJI7SlvUTAXlqCRZajLT3wcBpBaJs8JS9uqvBDh/InrGTSJ7
s+81lVLvwaivZ5+7EttU02Zswk1xIY3Kkx+svHEyMr89/Ezrc64z8FqLnH9tGY0B
zCtMHLt0cjGIFJlQdarT2c5ljasW3JHG0Xn24CZhpY/GP+wSQTRQah6/cYAaojC6
KHfITE8rKyG10To9aDD0BbvDEZnWTrODi2ziDRat2AAq0tVf3FzYg+BTScFgSrmZ
PVmP9KX/j0PQ2hbxGa6Oh7kb94yeWJNXYSY5kT+pRpyuJXxElec3cxL5RNnvmMrM
i7Bm5jU1EpQS6wpbxaQU4yYjyy+e4abkDcd/vl5mrIAvC88q4eqq01GrOGjQ8jEa
zQ/FRZYl5WtmPkcraNQNUjTUTfr0doNKwdYpXdTNwQSEEe9fBinBXMwYUg/ZgK69
/MxpzA70FNnGTT/iv8VinfjcwcDr/C5gwqQrLh0qjle8gTBoseB3SljNPyC7PQ7I
4cWwVKZoFtBL1ZU5rf8LrqyC9Dvv38DzTC2R2a6Fv0vpoZZsFlaF2Py7PrIU5p+g
NiWPW0cPOIsFPPesXAF1imuAxN9AecewAYvhzlyuZ30TQ5/R/9/Aof9wcLnnDt57
MpOO4UL1F6ubfsKyljHiNXpTRnhQ37pX2awt3HCBFi4N/YlGZNLUD+n3zoimDKYt
KUYFl/N6BQ/hGsS+BXgnKL5jDaT09FblASiZPkwcB7+gq6EHz9tiFRM2LKvYPjXU
MEokIWF+2+TJTFYvWnSw4HSZc+Y+oo29LbpCS1cVzpparNS24mvnxhAhBkBa/xOC
PiRZ0Hs76BBZQMentWleaw0fjVjj9F6UKa1zk3n6Uo4dZLgnZk9enTf+KTqifwDv
GuVKEDhvvHq5TRhuUYM27eCK2c6uTXYWQSA9XYRjXpkOtZ03BE03Qom1WmZgpXn7
VPhj0at+VeOI/y/ylIb11xp8PTSrzWXPKXZiIbI2uu8CHyQVeIEKnuv/3wMVIl+5
Ibrvlv2k/A7+KF6FpUMHKt41iMs1YCmZryparGLPX8U25RR0OOfMOpykEjrJp6jp
3yXKCydHGDzepDm/Vhi1PKQxTfKiB0X9DIaJa8n8mjKHC1tK+4tf1pDoG+jrylpa
0y+LILryiLfSHvyf4EqD3EEk1U8qx4li4yzN+aTeqQaHVoaPgLiipYMaxNLfckc/
DtpD5eVNpa6/xomd1WR05hk+Tf8zjDIkuRstShILbUj/nt5invXInJKRv0YuelaJ
B3QX8Gak4BsDkWZSAWEVdN0G3eYr2bb8hckpEwVG9sixvy3xwgmVEH0ziKGANgXC
dPZjNCVj4elXWlpHxrj06wcJVoVfWq8bG5HyNO7soBoyVBcB3k9HK2YIO5wdXKr7
2rrscEiq0JpSIyGXrH/hFT05maU1A5KfK6+ltYwhI3wCaL/PTcJPzMe0JLofGrpp
dXjYfRfPI26RWhWUWbWGuvCH4T7zIYbuiIcagqRr2l52uUwUfHGNNt6D4WKBjcwd
6ATMzt4uWva91Y1KiRiYZrUd4wSPxCtgnIonuEeM1cca0wwIWjGRL4/s2Ynqtbrp
/YNQQJZ/DeZnaLYNlwaaYCyEBjmfPjyl02KGJZa4a1RjBF/V60D5IVg6wOHTUBct
KmLrKIDz6Wz7nHe6thrM41pJkFoyobMbB3dgqCeF4rKjESSOelgbbFIs/0O+NjrZ
yvx/ibKtHTNAhvJ7+V+iGmVc0b6VXNx92JjxM+RgzECRdvIRJwhsqTgkUhCIcCfq
ty3zVXr373gHGrpQb11qkYkG5xZd+xwf1OmNEVo3SMkqVx9raecRhwy+6N04HC70
wT+po1+ClAMXNzEUS/1Xh4mM1/Ej3xskiZ5FP8UhxmuT3BFEHCj4z7wQgGDslvX9
Bgh3KsMImiiDl2qwinKWJJJQBldg/W8uieqlfb4NLuSpk7mnXdnXkeLPoJBwQ0vs
rsz1MkO+KvG+rfbVls/JvpcuSEyCwZ8QnsDD/+bTdkGrV99YIjJKEhd5N1hA4ndq
HRt/tQ9i4A2wNTgDmOUkdUhQAC5b1j7B7pA0CuQGZ7uNQDks3mi7/IdVrkVUyGwH
1ycLC/Dtwyw69Et8qP2Qm0JIgo0zA5O3hlUhaoqRbI6Epp/ttJZQmZ0sIX7CLgah
vLFDWIj3lPG57mPfwu9tT3Qtf7ZcKRgpLQ7bMf7qyLC0NJhNRGgxFNeqKHzy3i+W
AdFxWPNNzkUe0OMnoArIxekjugtNdcX6MpaICSc+FYF99iKFv6xVbyHKcKM7D8ua
eDz6AotsorfHsW1roCQzp6r+FO0pmXHgiwdUsrAoUDVL/eF89qqZEjfTWoTHif3e
4SJ1kZtSiQ819oxnS50PQfJscP70hcmc+8Kv2bxRc35fm/Sk7FPFDtxVjZHQwpbs
AvW+FO2u3cGlXbhsbJJgQM8xdkX8mhfJMNF13M9XHi9jAoefdIk9W3dHlTitxTpF
D7mJpgC7m5EQjKy9b8+0Tyu38EGwRMw149Pb1pujg3DcuLbujfwrGUXF+S5FXboD
jKXgL0dRs5cwYo2zwsNqcFtW5BgL9LQ9dzDfPcZO9E4BvKzbteg6sVBVKIyCA2SO
DGtiykPmk+iAU/QY1f0goxTS2wfdrtQ6J3C+J3n9olF84tzBGkdX2wPkqKa1IGSG
quKkWoygcgutrd/ixaXFsJbAWqTVjkRVrWU8VPuC7HIdAxmkdfeRJ64gxcO0z69x
nOerhMVNzEif/Jj5zAr0JK6loznpUjInhgISJSvjpDNOY+oe+DyAyVQG/CbsHGvM
OA2uqnAVlXpDIAvP6f6LXZ9UxXaSfJTpcrfUhnH51NdNWMMGL4eioww0qXRShkWq
HyRhCVoMI6fkgaj+t4dm9399EF56v2z46YrB8mGzdSawDSavV8CMs7ZbQYxY8NXv
l9hm204qhr3gUgrHskGoDwnbkciH7Hp/l/nXVsABOe52MyTXhrOs8XGU10nQt34i
4HwVs0vNOgOTJL+bsC9HtNE+4CN+xNxrZVrLfF20HZqcZg4Bss7Q6AGg0QGgrsm8
q59Ga2zy091ym0W16VwNVnqsFg9THRUfq12HNgYK/MRrkBdmbq+F77InysAfaZp7
yQ+y1/3aTC1O3JcbszdLTLtVjp36a4iBrPdAYa+D+olefwLLrHKcXc1HaFmznsHK
c+3Bsxp1v9Nts/DIRWOmQpCehUm0+rkqNdgWJqBAHhYJ/Q8UOlzZpJ19IOfcqZ/1
SV3sgHNizWp7gwTMn8DU10pQY6F5yiAoSUC1jQGLH//h1exDaFmt7dhU/hzgLE9F
ckT5VVdKjnNcXaEQPrM5rV3vietlLMX6RHcz9zRsrQH3pIpYrQ14an17KDqJp7Wv
36+F/OcA+xTNpKKXRQ89LZEg7i7cteqVWjfRfIqD0LaQzZH4LeBUL6LL5vWwcIeV
llpl9TB4IqG7vzu19nvllqwpX1XhdCKGEpaePdXKS3yX8G5XAFhnwx/DhokDaKBQ
pS0xFTIL+cIowh76TpH91i0IkTrwn2WyCW3IfResGBIbCWwwQuEM62BQUrYCZrg/
NVsgps0Z+0NiJ3rQuIJUXT1IPYUPDSMDh6eOaaYfFEiJUCWJwbAcdf7spYl4omE1
3P4Z2tQ27WHUkR7aEjNk5Sa4TBS6SKyJYxk77CrmQOnfdFRP0dQtkrG5b91z8O6y
6yCuF7pT9gB9TW9IZZ+6XQ8DEwLlf9WXOS+VV4rWap/PqFMjSJN51RjNsL/DSGuG
QjmrxpsS+6BXWTYnwkezAvHx0AmqdClqyId/hnEfPkC4+I4gMVYQz+/jWNBgxPuZ
Y9Qqb+s2VveFmzf/q5pVJrO5Ri53v7RLJ2lbLcGGJ0jtc5q6aCym4MSET3MFYntF
kAUsURUu5UbZ2XQRw5Xv635vfxQzYrF3MgPha5cISzR1cBFrbQXJ9k/oZs2knRMv
K4G9QzL1CF6Z0Sv/FohzzptFnVI/MiG51b1TdAM2jjA6j1jc9meDzy9bBsWwwxfv
GdMaE4QMG6bc/R7y1gIDEReU52TNXqrF3h+5nWNtSURZ0SFcn4UJCkbh/G/ZRQXc
HZUPFYhFM66pQQRZni6lFbia7VsrcA/D9tO7x3rapo6/uZHyXXVGLKsXn0uLmi11
eY5pdszcYaOqxeEuTSNmqyin1ZrmW+lXJnKP/TCeTGLI1iXXbcFVper9tArlJjwA
klaiGasVzfgoVRqtJRALwO0vTOY7/PEDrbcMymwDpwWKo8vfURGgg8VfeiE3x7sn
wjabWhSJW8azHmfsOVtOFtHFlZQl5iSnJ6PD9BhTXHu0qpKJWt644JgsODtCRAA2
+B+uBhBsKaPk0TIsR+JlC/QfHwah+5NBB9pAZcSb5QeafrS7S3vVQHwOHF2g4oTz
wXocn5gwsVS9/WWE0kJFjdTeAh/TFMRKs2aw5ttQRsbsxG/r1yBOAwk0cHn31uVB
g8cmR/CT3DiTmoZcoezlDL+3T+I729/jM7A0zLH9emLn+ybE764nAcny5nhAgmCj
z+bP8xtNXfJa4cmM6HVjtjGdKR9VtF40ni/naP62ujwcqTnXSN1eF1wpzfR755Ca
wYxOJQXArmoAwWiQqeQ90zRWs0NJarFHmzr9ElRm2r6BIMiJlw4mp2gew4ySK+pJ
G/ehAjp8Nn9XtL0ittVQDPLXRRuvZCA0c61M6G9tP60=
//pragma protect end_data_block
//pragma protect digest_block
fmlzViUKX0IUdihNtpQbCLbVX3g=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_SDR_AC_CONFIGURATION_SV
