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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
cjI8En+D6tkR1QRF9PFyBDcZk9apH13g1ejlieUF9WYSjWCBlKnr3WPKPA5Wh+Rk
FcdG7nrpcPM/Lj78VTVf/R7tohxjIoqA+RLWDTPwd7Vg3TOq3eS3Od5Ed3F/9CT8
xoj7XwuWRVs2XiXg76ecGzaTbDhs47Sn0vhZlfzMuTE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 263       )
G2YnZS3jLiu279GKvSLDOZSln7EFlIydMh/00Wsnx/2iYnTKvvg3pFH7BpHEbwwJ
um1Vyn6CxgJektxL49BybtWYOlN+5mL8DH3F/naMsAkwJCFBf1InBVCrSe5UAXYf
CKleU91rs76vh+fpFQkwhcOIIsFLucld47JMoToZ4lSL/hezHKbEko0KBpxKyz3M
KPeOzMbWqEF0diqISJc5LTKsDRiM4raWFqyrhLLG2taofeIG9T97NhGfvSiVSdjV
w/fsOsQd3qu7RLHR1KgHXgSh4yZOx1KUOcSWhUsV5ESy7z2Gd2fDSokbY900FW+j
i4sbW40vTxmIQywgnGanOzmMXc4mSHO7AkdbV/NTa38=
`pragma protect end_protected

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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
NB2Nutst5e1hF/z/X/+Emm4V89J8ue6KiIsdATYtXuBejY+PqdWEbVweXGtkG6ec
jyOZ2Sr1wjUq+/S6F6gNkgoyCI9u3/kNZ1c9+9Yynuk4pN4Dh7Cq0p9r2XCY0VKo
Wl5FfUb1j16kMUXQsxHAmbYhllJnw/wuNkis3Trh27A=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 505       )
LjPWuiUwLEBs5WO3mBHnR0aizjzsGXoP+46o0NtU87hltpwoJlUeAn8fQACgTtUa
KrEEUVssRWOPbHDn5tTPpBbVgb1jS8IzY/NztAOLyzWPm4lGeHw3sVqPEQ2VAEGI
x2ezVrxESfOLwmG94fcQJ13Kk26OASxOjkLOnBB2LibabnTjXA9PIfrKEen8L17R
0JhUAd8BPiqECJyqDmn7SHPj7/+Qot+t7kb+RtwE11FPKH8iacT9e7+enk1VUVGQ
rqcnFiHzpVzLFXxuqdlulL5O/aOsMV6k6UMX9CqxFN9Wns/4CnveMnrKri1NVn93
OPlDoI/J8wfH4BVlkMu+0g==
`pragma protect end_protected
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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
IXoI1fyr/hP2NYsvacHfxpugDxczTNSmx5xXXNJTOqRdR+E5iOh4cF3TGDcZC1pt
bqJVWpBn63rgtaITOtlVdpUlgKA3F3l/FYlrm5fdZ9h4JbslGN22wzhgDgWC02sH
C0QRLlaBS3lx6b59+dm6PiVpzGJc8wcwL8brxCKIAuQ=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 15060     )
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
IFJyRvo+XCNeSp1DOzmPbPrX/fWvc8D75obz4fJPPlGwTg7IfBLv1p06NmT982bv
fURfjThFnyrixwvOAqKfKV3UZ4hhvQtL4yXJlIhNjWkcWr10YQJOBMFg/MLJJ5Oz
l6T/PqjcBKO9NJgaFBiLC9scfiXVMB5VKLp5NikrzS7PgNlitGFemdBahhk+eJ0f
J8+msnthfMhHHizhBsemCCtqUFRRyycB9vsgc3KRJ2cVuGWFDUSZSgRgh0qO/ylE
ekbwMonT8D+h+Tk2StS8GFm8qJOtPsck3ZtLvl0q6GTcSMeK1UEAVO452NNEipLl
w8nPapAxLIvIP4n9glZKCJIuFZkooBVFsMvCAKeW656qMwx0YF66Knn46tJnNzw6
Bo47teEktyqZDqlANqpkwiIWJNc2aScm9pWFNgSLK4CRpmqLYjBBup6byJiSku8y
CcNVRXyw+OsEd51qnK2ny+gJdJVZ5SWU57HkLa1B05kgzFgIOuS2HD3DNB1hELRL
XhhJXhpLxU21Goex2z0jXsERb5MsZDSEoouRXWCYUbY1HWfiPaFJyQahkq1oZTjN
1qEUPGl1wHSQ3qngzYAF3miQrZe24fQzSpoJTIFxkj3aI9WsAX0Q1pcwcJY+Yv0n
iue0Xu18P+nYd/1AQgHFhINwhZVcWr/uh14DsUSe5XI5LSeSI1hqgLNOs6YzOGYv
zNbCnjNLcmLwWnaxeJkg3Nj9MlyFP+iFILQU+KK0bziZceIY3o+NSKfb04GGdPYu
aM29Ja03hxSr+IbYum0W87a9w1o0gzOwjayK6glmjLzeTjPxFyC6sc5JfWXrcJAy
mgg5sgr14kEWtju9BCHYZ8Bft/1jD7c+CsRTQXwYYKYfAlx/QPyXGK5V8f2JGYEc
pLlh3SFdvofdh2Ocl4wxbdDfS3F84HYgmHfSbjRXwtk/4StMeyhmZFNJIdAxw0mQ
3mbUPMprcDOiHE5fJqT/1cfJKjhvYmPRHBsHEd2Rvc2QMz/02YotuDP96jUY2HLM
E57SmZ0yDMneGOFyt6sxXmSfvhc2/XinapSenxwcuWmX2u9+mdeg36x7aEjbq2I8
NFDaUkGEfTK5dbPkJfHmgXXp1DP+OtAD/OqrwBWEf6kW4hPmls4pzLZswdda8lGb
W6ldJ+m+Nik2ly8MoY5+yg==
`pragma protect end_protected

`endif // GUARD_SVT_GPIO_CONFIGURATION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ehXL+3udWMR0zUMOLdAM3LEqYWclhTHTV1Loc/V3SJpwr501F7Yl7AugkeqCmDih
rikCo8bxxIP8EqxymOGs/t5RwF3uXMLG286iIlVwjAhX3xC7yRyo3FEGea5VuL2e
HRj03CBOOjOePQWhU2xJP/+HMx8YzHtFZJzjgPu/mgU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 15143     )
9MVyOif+U6o5U5ZXYc87vnN1aJRqSbnsfOzxy8/tqXwFYKHV8ozU4XfSti8jk3+T
iARY3T0+ArYG1XBv1Gpk3pEWcpu1HJoNicJWtvC4yqN7IP6XUk6OibGa0zro1sCB
`pragma protect end_protected
