//=======================================================================
// COPYRIGHT (C) 2016-2017 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
// The entire notice above must be reproduced on all authorized copies.
//-----------------------------------------------------------------------

`ifndef GUARD_SVT_GPIO_CONFIGURATION_SV
`define GUARD_SVT_GPIO_CONFIGURATION_SV

// =============================================================================
/**
 * Configuration descriptor for the DUT reset and General-Purpose I/O VIP.
 */
class svt_gpio_configuration extends svt_configuration;

  // ****************************************************************************
  // Local Data
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /**
   * Specifies if the agent is an active or passive component.
   * 
   * Note:
   * The GPIO agent currently only supports active functionality.
   */
  bit is_active = 1;

  /**
   * Minimum duration of the reset assertion, in number of iClk cycles 
   * The default value is 10 clock cycles.
   */
  rand int unsigned min_iclk_dut_reset = 10;

  /**
   * Minimum number of iClk cycles before the DUT reset can be re-asserted.
   * The default value is 1 clock cycle.
   */
  rand int unsigned min_iclk_reset_to_reset = 1;

  /**
   * Report an "interrupt" when the corresponding bit on the 'iGPi' input signal rises
   * The default value is 0 (no interrupt enabled).
   */
  svt_gpio_data_t enable_GPi_interrupt_on_rise = 0;

  /**
   * Report an "interrupt" when the corresponding bit on the 'iGPi' input signal falls.
   * Can be combined with enable_GPi_interrupt_on_rise to report an interrupt on change.
   * The default value is 0 (no interrupt enabled).
   */
  svt_gpio_data_t enable_GPi_interrupt_on_fall = 0;

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
iz6hloljxNICsbl0xlBO5oi+rxZTDeexEE1xjz9lzP92S/6cHRYs7gim2Z1NFe3A
g97wRCyVNiTZyspYRvs2mAqeqNt/odgbhQa86lVEXv8As+ysRYJ13CcQ71vKaYnp
6vQfpFMe+1poeaUrRLo5iaarbebDpsOm44Z90Mex/G3KtNkOFcU7qg==
//pragma protect end_key_block
//pragma protect digest_block
1xkcGWtCOposQgr/XN0bCP07aek=
//pragma protect end_digest_block
//pragma protect data_block
hXlmDx/9PT2Xaqn0GAHny6kIimF+cjzKFBoN1HfGGXnyC9YQ1cLPFUe3VH2Q7HeM
f0USk8WarFATfP/d+SIGSbCwnEU/ss3Pt9wCcpcDHptF3OtPpELBtEq/CfzXhFnr
T6Asb+ZJ/ljx16q5aHBthPq4SQuWlW+tVN5+TgfWPaGey7Q/18XkaG5SIHgQPAsj
NhnAW3eB/Ir8GyZDcS++CT0g8KcsJ6NJ1LSluMWZuMqrSPtVEuhte9oTt1FPVDlv
f2wk0TQrh4cjd9WEKoxPkcNnR5cReCCQndcqLrmn78/gXAotC47EHa0+DbcmrcOB
XT9Sl5UkMJwDxPInmmMu89bfnZ40lBVzFTupXPy06eZdYDjjdOQbBDcK03zKhClq
f+QHLUUqcEY5QcFb679WjhiCT+SJlHpXGvFPRz5+7Lt5p6il9qfmTtiUV16ZGn2L
Ce/7JzI2OEQmTfvd88YLamiI+BbEbOcge3JdOVG2QWhIzaHzj/dUHmJUZH4OGcB2
msnZfAbHM1gjzqVQ45aCouEdwAplNweY+MNGuJBETjuIx7skUld/0SKDvVcGQur9

//pragma protect end_data_block
//pragma protect digest_block
fsYVD2jj8HeFehifwBeo/TdT6IY=
//pragma protect end_digest_block
//pragma protect end_protected

`ifdef GUARD_SVT_VIP_GPIO_IF_SVI
  /**
   * Virtual interface to use for a VIP.
   * Valid only if 'hw_xtor_cfg' is null.
   */
  svt_gpio_vif vif;
`endif

// TODO:
// Need some constraints here

`ifdef SVT_VMM_TECHNOLOGY
`ifndef __SVDOC__
  `svt_vmm_data_new(svt_gpio_configuration)
`endif
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transaction instance, passing the appropriate argument
   * values to the <b>vmm_data</b> parent class.
   *
   * @param log Sets the log file that is used for status output.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name of the configuration
   */
  extern function new(string name = "svt_gpio_configuration");
`endif // !`ifdef SVT_VMM_TECHNOLOGY

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
  `svt_data_member_begin(svt_gpio_configuration)
//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
bGYo5LG1MDnfCbi9HDFX8JgAusgLvCaDGek2l1e6RjIHWWPwS/w4B432t/I3dJmY
gERwwDs6j2eqWwhHUxJfhvlPtgSCOfz3f5+E6AlTp7Fm4d2Bezuyz3JUEit6TGtB
4U/UrYlIvHdLLsvRXArsXsNSX2xX9WYXO80DkaDVagdNShFRPVTS0A==
//pragma protect end_key_block
//pragma protect digest_block
WdM17LYbw01LvFavfWxVvaoLbOU=
//pragma protect end_digest_block
//pragma protect data_block
gD9Q0mrG7kZvaOC7U2p3LM7GCjmP9TnCEWMkLwz6qlJhjWQvUmC2ryDmjprCV5E8
QjjSIYNL7SV1aK0KQ7YnVYPwYlOp2TUiYMQOBziWysJAXJEO8YsoleADMqg5FUU3
GBbnc0eWlqWnyszh/C5k1lFUEYyHNdcwcrY/ONI+b3W5KxaqzcHbEP46vKTUnebp
blcTKS/brjDIVUpp4wjGRuJFJsr5YlzV5ojKVlvsOC9+J6dW1050YwhY/CnGklcq
NIe5Le9aKvxvVs+nmBrD+7u/QA4qLYZdjztS5QySVzxVIz8ok37yKMQL4jibvq3i
jj0fPSpTTf0dFev6O9UYJMlxIc5KaBHg07mhd3Mok4o1HFke2AaMpT8GknhhCagB
HIXwosj5LpR5E0OYGuJ/Pi1AZPnp0+HVqNuSU13vxMqcwlCixPXENC8BRTKENmzc
4QX1iJlGkWXB5Da0ki8bsZ6xrBJeGK07lvt7rGrv8uvsTab/ZoaPNy+eP7WIH8ZB
XrPpbrlR2E5+YHQI+QDxNnODW6SVJlNCDCV7U/4JZAU=
//pragma protect end_data_block
//pragma protect digest_block
K9iV8UPDqYTlPLW8SEVVU4/U+eo=
//pragma protect end_digest_block
//pragma protect end_protected
  `svt_data_member_end(svt_gpio_configuration)

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Returns the class name for the object used for logging.
   */
  extern function string get_mcd_class_name();

  //----------------------------------------------------------------------------
  /**
   * Method to turn static config param randomization on/off as a block.
   */
  extern virtual function int static_rand_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   */
  extern virtual function int reasonable_constraint_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Used to limit a copy to the dynamic data members of the object.
   */
  extern virtual function void copy_static_data(`SVT_DATA_BASE_TYPE to);

  //----------------------------------------------------------------------------
  /**
   * Used to limit a copy to the dynamic data members of the object.
   */
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

`ifndef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Pack the dynamic objects and object queues as the default uvm_packer/ovm_packer
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_pack(`SVT_XVM(packer) packer);

  //----------------------------------------------------------------------------
  /**
   * Unpack the dynamic objects and object queues as the default uvm_packer/ovm_packer
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_unpack(`SVT_XVM(packer) packer);
`endif

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to. Differences are placed in diff. Only
   * supported kind values are -1 and `SVT_DATA_TYPE::COMPLETE. Both values result
   * in a COMPLETE compare.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(vmm_data to, output string diff, input int kind = -1);
`else // !`ifdef SVT_VMM_TECHNOLOGY
   // ---------------------------------------------------------------------------
   /**
   * Compares the object with rhs..
   *
   * @param rhs Object to be compared against.
   * @param comparer TBD
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);

`endif //  `ifdef SVT_VMM_TECHNOLOGY

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation. Only supports
   * COMPLETE pack so kind must be `SVT_DATA_TYPE::COMPLETE.
   */
  extern virtual function int unsigned byte_size(int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset. Only supports COMPLETE
   * pack so kind must be `SVT_DATA_TYPE::COMPLETE.
   *
   * @param bytes Buffer that will contain the packed bytes at the end of the operation.
   * @param offset Offset into bytes where the packing is to begin.
   * @param kind This int indicates the type of byte_pack being requested. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in all of the
   * fields being packed and the return of an integer indicating the number of
   * packed bytes. All other kind values result in no change to the buffer contents, and a
   * return value of 0.
   */
  extern virtual function int unsigned do_byte_pack(ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Unpacks the object from the bytes buffer, beginning at offset. Only supports COMPLETE
   * unpack so kind must be `SVT_DATA_TYPE::COMPLETE.
   *
   * @param bytes Buffer containing the bytes to be unpacked.
   * @param offset Offset into bytes where the unpacking is to begin.
   * @param len Number of bytes to be unpacked.
   * @param kind This int indicates the type of byte_unpack being requested. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in all of the
   * fields being unpacked and the return of an integer indicating the number of
   * unpacked bytes. All other kind values result in no change to the buffer contents,
   * and a return value of 0.
   */
  extern virtual function int unsigned do_byte_unpack(const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1);
`endif //  `ifdef SVT_VMM_TECHNOLOGY
   
  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>read</i> access to public data members of this class.
   */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>write</i> access to public data members of this class.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);

  // ---------------------------------------------------------------------------
  /**
   * HDL Support: This method allocates a pattern containing svt_pattern_data
   * instances for all of the primitive data fields in the object. The
   * svt_pattern_data::name is set to the corresponding field name, the
   * svt_pattern_data::value is set to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern();

endclass

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
306D9x+WdadPcJ8uQgUgIznQImSmcXjfAZ4xoVsrf2tKlG6KSdb0yg4iIZJil4XV
0B1hn46Jy4O1Ws264cXqd2h2kddmTxe5kdJiC/HkN1yzHXY010gLxYF33sgDYzRS
6+oHoHxieJmJYnas05oKKcODVYLQaNvG03VgO3MIjvoaT7HioJWaPg==
//pragma protect end_key_block
//pragma protect digest_block
QSvWf/5PXGS5hNHZcZDkWUD4Z+k=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
gKLV4JC8jqrwrYI7zsZdeEbrO0w=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_GPIO_CONFIGURATION_SV
