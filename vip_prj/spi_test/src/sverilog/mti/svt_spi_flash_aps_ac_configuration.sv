
`ifndef GUARD_SVT_SPI_FLASH_APS_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_APS_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * APMEMORY APS/APS_OB device family in DDR mode.
 */
class svt_spi_flash_aps_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width duration.  */ 
  real tCH_ns[];

  /** Minimum Clock Low pulse width duration.  */ 
  real tCL_ns[];

  /** Maximum Clock high pulse width duration. */ 
  real tCH_max_ns[];

  /** Maximum Clock Low pulse width duration. */ 
  real tCL_max_ns[];

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

  /** Minimum Duration in ns for which Slave Select must be deasserted in between Two Instruction sequence */
  real tCPH_ns = initial_time;

  /** Minimum CE# Low pulse width */ 
  real tCEM_min_sclk = initial_time;

  /** Maximum CE# Low pulse width */ 
  real tCEM_max_ns[];

  /** CE# Active Setup time */ 
  real tCSP_ns = initial_time;

  /** CE# Active Hold time  */ 
  real tCHD_ns = initial_time;

  /** CE# Active Hold time for Enter Half Sleep command */ 
  real tCHD_HS_ns = initial_time;

  /** Data in Setup time. */
  real tSP_ns = initial_time;

  /** Data in Hold time  */ 
  real tHD_ns = initial_time;

  /** Chip disable to DQ/DQS output high‐Z */ 
  real tHZ_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_ns = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_max_ns = initial_time;

  /** Minimum Read Cycle */
  real tReadCycle_ns = initial_time;

  /** Minimum Write Cycle */
  real tWriteCycle_ns = initial_time;

  /** Minimum Half Sleep Power Up Duration */
  real tHSPU_us = initial_time;

  /** Minimum Half Sleep Duration */
  real tHS_us = initial_time;

  /** Half Sleep Exit CE# low set up time  */
  real tXHS_us = initial_time;

  /** Half Sleep Exit CE# low pulsewidth */
  real tXPHS_ns[] ;

  /** Minimum Half Sleep Exit CE# low pulsewidth */
  real tXPHS_min_ns[] ;

  /** Maximum Half Sleep Exit CE# low pulsewidth */
  real tXPHS_max_ns[];

  /** Minimum Deep Power Power Up Duration */
  real tDPDp_us = initial_time;

  /** Minimum Deep Power Duration */
  real tDPD_us = initial_time;

  /** Deep Power Exit CE# low set up time  */
  real tXDPD_us = initial_time;

  /** Deep Power Exit CE# low pulsewidth */
  real tXPDPD_ns = initial_time;

  /** Minimum Row Boundary Crossing Wait Time */
  real tRBXwait_min_ns = initial_time;

  /** Maximum Row Boundary Crossing Wait Time */
  real tRBXwait_max_ns = initial_time;

  /** Row Boundary Crossing Wait Time */
  real tRBXwait_ns = initial_time;

  /** DQS output access time from CLK */
  real tDQSCK_ns = initial_time;

  /** DM Setup time. */
  real tDS_ns = initial_time;

  /** DM Hold time. */
  real tDH_ns = initial_time;

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

  /** Randomize tRBXwait timing parameter in between declared range*/
  extern virtual function void randomize_output_disable_time_ns();

  /** Randomize tXPS timing parameter in between declared range*/
  extern virtual function void randomize_tXPHS_ns();

  /** Randomize tRBXwait timing parameter in between declared range*/
  extern virtual function void randomize_tRBXwait_ns();

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
  `svt_vmm_data_new(svt_spi_flash_aps_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_aps_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_aps_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_aps_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_aps_ac_configuration.
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
  //extern virtual function int get_clk_parameter_index(svt_spi_types::flash_command_enum flash_command);
  

  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_aps_ac_configuration)
  `vmm_class_factory(svt_spi_flash_aps_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
bradxgexfqaVMHm19MK/Eph2w+yho4NDPrNHlrjwMqHpwChEOB0apAqPjsqJQuam
FDjEG8PKZLnbtZ74ahE0e4f51VLvsUtNaRxOBBsBDzMir32C3ryW/p9uRZbNkros
E7Md0GZMksu7ziqGE+hwWWouZumgp5ALgd4/F0yi0MU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 745       )
tpSYC6YeWyU3CeHpgRWDVSkMPdk+Hy3o2QZFiSJisG1nTv3xoa1SQZAwHsp7WTk6
OYJSNX1vQFUiQ/zFbdB+pL5i4nqONdoALfFHNs0O2AqL1NJINz9IjhJBYzqZuapu
s1uC7752Zzp+dFw8FCNtDg8GftGI6lF8/P88/Pz1a+TK7lBpg2q1n6piOYs2e1CS
Nqp0/1xgY6k3Qzbxr4KT50raZCqKpop9/9UjYyjbbGf1Wev7FkDL3RBX11vjySED
C5cEVJAp9tm1kbgSfFucv2rfh737j6hO03NJwgmeQ0LW/GSXkn0wNSB8ZJIkshlE
gu/k45d1K/GYFsChKvzOM8cRSDmCCEfvI8aayWp/pZKiItZ+jY+MoB1BV4R0I2I5
JOAEkmT60qv6NaUZZotfxt+O1mO37jxsX37YH6qDa5XeKmt5NONHwukA1gBcCMe0
AfKiLHmmmDLd490tlJIx2H2uTMqkQp2sINjD+ro6ff+eZJKAD+Nz2uipE8KQovHl
rj76rJpMOq5/7D3wNqGpADBp05zjXywPuKEdumpiugGBro3MAGtQLCTyDZOO+bdm
2pHOhOekZ+iTAwnkhckxNixJaRyQRVgHbDTkYewst306ZZGUcLfuq14OhePY6JiA
fIENZYO8onq5+0g2rXhfsiCKKXXc33K3pWEdSL3OX+zca2to9YApw7Jw99bTpnIn
L35xTcNpoMxVhWk6B1FykAYZOBmbjQiSmjwZBB43WEW9YUEwf5jNWXqbAUd2KmOP
WVYN3VtjAfaihp4LbafmAhGsjYjyGRsvOPYKeUhaQoYuFxNmXfjUzbYf+TWgGBux
kcozJShNDGajUB4O0T/hGOME1/+YYYm3tY7GaR690H3aQD8haB1EUrYgY5iTfemc
jqQubrMlYs1iiHCwjWHAY1mTzldZbYMejp61rC+0XE4mrgp2N7ZpvChkMqkpUsx/
lqcDEnPA0pCBSYv2jGWfS3osIb/hUnFEsR/tA7HeXFI=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hrFh39QtHFdvzJi6Bl0GF7/JpdOG+VILY3r0sn9h2o1lVbNzeUlzLZi3ttiyKYCf
rnhT3bxL0GiJB/mugqzdhks1UIV5ylr4gmJ3HGoP5A5SnlbAs7N/WAhG46I4ZJJL
ZLDRgAP3g4Ywek2Aa3K0yLL7odv3m+9LfwwOAOjnmTo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 31857     )
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
HKSRZjnxpZlLqVS5NqhcbQ==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_FLASH_APS_AC_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
BmqTFsxA2Svdni3Rz9eU2vX8OenXVNe/bnXZkJaRL8H7CpybV+MNZ9u0+fu84xc4
LgT7tZRx83iGL8NR75vqtfAm38hC5+UMfpZHWkOF1J4NDKFfTsz+BR2tCtDiTg+X
mCzjnN87unNmN+NuEPml8L7Y9eleRPe0C+A9FMdboOQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 31940     )
bZxpsyyws2hEAPhnSowoqF7NS9xOrR2LEYsuiCcvkBXycAmf0l74z4MhPgu22vxk
mTEwmiQTrMzXshgdq2GflDQNixUT9sA9z0SMIf3/JnDgKeddNzyOAo0ij5h2Yy74
`pragma protect end_protected
