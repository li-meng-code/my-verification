//=======================================================================
// COPYRIGHT (C) 2017 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all authorized copies.
//
//-----------------------------------------------------------------------

`ifndef GUARD_SVT_FIFO_RATE_CONTROL
`define GUARD_SVT_FIFO_RATE_CONTROL
/**
  * Utility class which may be used by agents to model a FIFO based
  * resource class to control the rate at which transactions are sent
  * from a component
  */
class svt_fifo_rate_control extends `SVT_DATA_TYPE;
  
   // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************
  typedef enum bit {
    FIFO_ADD_TO_ACTIVE = `SVT_FIFO_ADD_TO_ACTIVE,
    FIFO_REMOVE_FROM_ACTIVE = `SVT_FIFO_REMOVE_FROM_ACTIVE
  } fifo_mode_enum;


  // ****************************************************************************
  // Local Data
  // ****************************************************************************
   /** Semaphore used to access the FIFO */
   protected semaphore fifo_sema;

`ifdef SVT_VMM_TECHNOLOGY
  /** Shared log object if user does not pass log object -- only used in the call to the super constructor. */
  local static vmm_log shared_log = new ( "svt_fifo_rate_control", "class" );
`else
  /**
   * SVT message macros route messages through this reference. This overrides the shared
   * svt_sequence_item_base reporter.
   */
  protected `SVT_XVM(report_object) reporter;
`endif


  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /** FIFO rate control configuration corresponding to this class */
  svt_fifo_rate_control_configuration fifo_cfg;

  /** The current fill level of the FIFO */
  int fifo_curr_fill_level = 0;

  /** The total expected fill level */
  int total_expected_fill_level = 0;


  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
`ifndef __SVDOC__
  `svt_vmm_data_new(svt_fifo_rate_control)
`endif
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate argument
   * values to the <b>vmm_data</b> parent class.
   *
   * @param log Sets the log file that is used for status output.
   *
   * @param suite_name A String that identifies the product suite to which the
   * configuration object belongs.
   */
  extern function new(vmm_log log = null, string suite_name="");
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name of the configuration
   *
   * @param suite_name A String that identifies the product suite to which the
   * configuration object belongs.
   */
  extern function new(string name = "svt_fifo_rate_control", string suite_name="");
`endif // !`ifdef SVT_VMM_TECHNOLOGY
   

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
`ifndef __SVDOC__
  `svt_data_member_begin(svt_fifo_rate_control)
  `svt_field_object(fifo_cfg, `SVT_ALL_ON|`SVT_REFERENCE|`SVT_UVM_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY) 
  `svt_data_member_end(svt_fifo_rate_control)
`endif

  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   */
  extern virtual function int reasonable_constraint_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Returns the class name for the object used for logging.
   */
  extern function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Extend the copy method to copy the transaction class fields.
   * 
   * @param to Destination class for the copy operation
   */
  extern virtual function `SVT_DATA_BASE_TYPE do_copy(`SVT_DATA_BASE_TYPE to = null);

 `else
  //---------------------------------------------------------------------------
  /**
   * Extend the copy method to take care of the transaction fields and cleanup the exception xact pointers.
   *
   * @param rhs Source object to be copied.
   */
  extern virtual function void do_copy(`SVT_XVM(object) rhs);
`endif
 //----------------------------------------------------------------------------

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

  // ---------------------------------------------------------------------------
  /**
   * Decrements FIFO levels by num_bytes
   * @param xact Handle to the transaction based on which the update is made.
   * @param num_bytes Number of bytes to be decremented from the current FIFO level.
   */
  extern virtual task update_fifo_levels_on_data_xmit(`SVT_TRANSACTION_TYPE xact, int num_bytes);

  // ---------------------------------------------------------------------------
  /**
   * Updates FIFO levels every clock. Must be implemented in an extended class
   */
  extern function void update_fifo_levels_every_clock();

  // ---------------------------------------------------------------------------
  /**
   * Updates #total_expected_fill_level based on num_bytes
   * @param xact Handle to the transaction based on which the update is made.
   * @param mode Indicates the mode in which this task is called. If the value passed
   *             is 'add_to_active', num_bytes are added to the #total_expected_fill_level.
   *             If the value passed is 'remove_from_active', num_bytes are decremented from
   *             #total_expected_fill_level.
   * @param num_bytes Number of bytes to be incremented or decremented from the #total_expected_fill_level. 
   */
  extern virtual task update_total_expected_fill_levels(`SVT_TRANSACTION_TYPE xact, fifo_mode_enum mode = svt_fifo_rate_control::FIFO_ADD_TO_ACTIVE, int num_bytes);

  // ---------------------------------------------------------------------------
  extern virtual function bit check_fifo_fill_level(`SVT_TRANSACTION_TYPE xact, 
                                                    int num_bytes
                                                    );

  // ---------------------------------------------------------------------------
  /**
   * Waits for the FIFO to be full after taking num_bytes into account
   * @param num_bytes The number of bytes to be added to the current fifo level 
            before checking whether FIFO is full or not.
   */
  extern virtual task wait_for_fifo_full(int num_bytes);

  // ---------------------------------------------------------------------------
  /** Resets the current fill level */
  extern function void reset_curr_fill_level();

  // ---------------------------------------------------------------------------
  /** Resets the semaphore */
  extern function void reset_sema();

  // ---------------------------------------------------------------------------
  /** Resets current and expected fill level and semaphore*/
  extern function void reset_all();

  // ---------------------------------------------------------------------------
endclass
// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
HYxRuUZcKQRp3+j/GG2BNmTRrFXCJ8VbVbt2S622wl11e70uKDOIsFCclZa54Txi
/wpxMiB78VDaRwANm9eIzXCEFIKBgBhy8jvNQv0+5utSXUeze9VPHbojsNcPYU4q
12kZnVWDqVr9lq73IAgA7TSruDXcrqqeZ701xxdXEhwrVC/mVE1J4A==
//pragma protect end_key_block
//pragma protect digest_block
ccjO6HeCxwdkz02mjRzupX/A494=
//pragma protect end_digest_block
//pragma protect data_block
Cu5ecz4OpEkn8m2ODDPu0XphNFMB80KHbw03g8PJl1YLKvQykKprLjsyU7vrzX9i
jiz5Obsp+XwRpR9zCBtIlsStKI8TdXbmfouP87n3H3RzrtwfK5Q0cwKR760wyPSi
2ibW4FGyvwW/cMWPBcM//CKUTodDhiV42HGFBniqcKe+gbZq0OtupHNLwXd4xsUX
p//FhsrUpjcTIgaOCjoHKGnOqfDiNBz9Dm7igscEewdkH7dbbZ+i668LJmC8xxzJ
s+Eb4iYiof/uboUlmG4X48SH5uQ8NvXEoYKUmQtlK3FRF1bK0l+xhle4mJ1bArcJ
L8ry7JTOjFZpCCcXWf0/6LgxuJptObL2ZCztPonU4ClQMwZG29AUQiXEPytFg2Mv
QQ7hUP5Md7Gksoc3OtSYx0VTrUFaaO7+7whZ8QgGzfay9gXq9pGRmf+/Z1KV4leh
umajvo/NWmeQ5kDn42oiaoM1P0MlbLkfZmo0VAtd8dxiaeRmltTaEKcc43DsZZOX
Gtnvjn2zKC5DAzfh0aryfSDVxcrQv/o2HhSj0tZjaQ7ZF0XcJbRz6kX/h6Z97x1Z
gX3JS/atWIOmAikwgMjxmFvTJNaum3nScYqioeyIfKn5QAv9HTV+nHt1ijCWiwpG
rccvUQoIRNivoTiOxDBmlvAKozOWNe2MT/rllDfZZLVolBynY2TtTzTpt/xYcNno
kpJ5viFGx2qji6izuRmM82G7uS8NPhohqB4Ova7l7KTR8qYxVyAcOltagDDGrMM8
rAYpDZodQiXTrknE/G5WxlXwFyO3sTdCVHcHmkMgO1cZn0784Zb8nFg2g63G78s1
4FomHPGGSfWXR9RCfz/1Qe58AJOss1Nu/XHoY8k3iTlGkoctMt0M+xhFJoQYk+Q1
K1qR0R6aVoYdFCOXxjSkYA==
//pragma protect end_data_block
//pragma protect digest_block
vEsTTv+27FfyWhONsOcIzLxTRlI=
//pragma protect end_digest_block
//pragma protect end_protected

 //svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
kB25WFBjV/odO0l8EnUhCQLb4oFTyclKSyVRX7yd5qsaJORZXxATLvRCEV88qCk/
vyEkPwdQlNw/VSGXvODS6BgQ5GZDFYmkNbV7/UYtM8UWJ1k4xfVLjZYn+s12m0lG
tTQzRIO04oRkwpjne+WwBRH4W42jyX+zUfCsuhezvTUkQR1xXxXU8A==
//pragma protect end_key_block
//pragma protect digest_block
RVrKPOajArvrHU6d0sjOSW1bdVM=
//pragma protect end_digest_block
//pragma protect data_block
+XWemzsgfjUMvsI/olqh1iO1MjRv56Z12R/Tcr4cimiJnYqdSw/lA9PRrnJNCP71
kKQ258nxEJ/QwJnNwIvw/fbsFJnULJicPOrkuyIWivH4GFb6C+i5601zmZAyfIJM
JLLDRB2EKqpgIWlQF4yULeHcq6aYaGO6Cun0dppIpVJspvDwwb4bJ/i0cmW24hzd
cHhbrdEascA4x57BbWeK1owXylEw47bn+m/gU8Bg8TjY0BE3iE2nF36E2RPot6h4
MKt2GDvqzUtvK3iMbD8ubPa1OhXSCjsBBUREYXuOSo8njyGfZufcQiUodO3Y2RLd
EeWqbi8oGr0mK/Q/LSTvVaI+HUhmqmNBhZI+UlMdmWeDdoqZfhzvLLhSufLofXl2
u64NIp0aQ826iGHIVIpImrANcJMu3PIo1tvfO7+vmDtW8gdhD+Ax8UgRLoYOV1ae
DlPNNwhIbl8Ib2WYsDGgcLFNEytAWFD6tqjlbRmoQERFNJbOOIhuYfchyXkkusQb
2nuxOGvQRrBb7TM5mkPdgu8jpSr3vzzgTawN8dWe2W0gBDoGDqJd2lhDAYomhYc5
zcGBmAGlyJJFfebtytarsTMEWvjEZ79G6cbJBFwYpDJmXe5qMK13qEPZPulFTEWe
DRanY/P0L09tHNMh5BHj+lNfX5a1oX5Qwo7Ph8FMsttQay68iK0teo9U6I+kELlM
N/Y63yTBbzoRnZac3IrdHBuojYLOuIQtEUqlq+QiEF9wMvacffBkY0o2MV52HF4S
ivHsw1251iBBJ9fFpXgpsO0FqKb1QJ7l6yy6z8fCkYdKYtr0UDx5m4+SaPBNd1Jy
hdBpxnJtnPiEmS5AcavKzWbKdMhW4V7Ydt3zkd9ncW5e3dgEOq1sXaNwCIHDAfl6
P7mBLDGMN5RVnoyw5rBn9KuCeKf6sCclPUUx6iEQTeOnrSvjRoOmzVWAVYN3rmv6
M/CIST2U6LVazaQe35yV+U3dm0HRb/ab1UENqr2wNtq2DfnuAtM4XAgOCMTDtdGI
6/ZQuRlStGLlFfY4iyi3Aibuw290H/ozSmhO+I7Hdq/OxTqpPI8bcUdjo5bbacI4
f1FSIo1Ljcnii/w5DfUIzwOGqC2Y/MGnHbz9csI9S8WOVGyqioNmQAdkGjbH/nCm
lajKemCWRKJTs4boM6LNfzwchVegnhNpyo8NHgTr1Y3GIDP9CUds8mZmDOjMb6nA
tFPXtt5Ep5FFLErE5IKd9Vk/wBsNWfTJQoukfaqvt1lTC2P+OaY9igcbbgfBCUwE
+IuZQXevTmtJ345vu1kDiEzPl+nr9dlqnk6TRBi875VECrnP9epDtMh8OsyfXrAN
jQPsPEpQ43PFnNNYX65/30h2yIQXp4Vx9Zkr2mP7SWQkf4NPpYNPaHm27w1tB1Ex
bEGkLkDBwsHElHDKl/C7K9dxvGRWZrOu+fiK9TvoRkO+Le/Gdd1XuFghi+9NBTUt
jlu8mF79G1XGQZjjQOWxNSDAjmLod6QzqyiySuibWqzJbCJMEBFkJSDMhCo1M8nW
Fdim/tVWUYDY0nrmbDUa1KkP4Xr5qxqvhHL6aByE/CgEua15FppXq2AxX5FwSSFr
H5irZg6yv79F/4CHqkUoW2b4YlX3la0wXa6+rVSSE/0WPn0ae4lyboDCSEyjfxBD
EYqefPBl6xGZvSbbEBK9O2dXO90R7N2wU+bcV0IPVjlHWpzQt0LxxHNZWqWf7iky
8jFNRHMcngERNVrYFxal10eO6klXmI7QlpSMF68oLWmUnGZUnyp9TBOq5YxStEdi
pR9ZaulpAz586Jmi+aLbU8kXDY0Ql2MVxPjJh3aHP6lg170EmAFD7Oykdhg+4dRL
w2XNSu4jtVt4NEW0Khlx0oSLgt4Cfvm5LU0Oz+mnTSH4TptHCyoyGYbHTONOcD6k
TNPB7gsj63/fvXQp9dLUNGq0YEsZkgLGQJA2QPRK6h3HiY2HiS+YXZs7cUzUch+f
Tm93yVyyTZAYcyvuUlpHrGLfHH96Vo0MA11ZlInjd6X0sVz1eX/xKJAJhz4CU1Q8
sthX/ygRAFBxPah8ZxECt59e4UJTkDM34F5yaAgmLVUK9RTrCJDXXvjI1Ap/rU9l
o5Gt+3/tDwAUoqHDoN1mc7IQ9XvHU0Mq8EzcZG6w5OD0XTYprk0+YCarx8wqkwWa
Bn3uh+0tq1FXAvHmAJLyWmJtwfAei1eRfW4H5w4kkIlTbydM98NrU+yAaV55MfZr
XP61dXKR9i2u1IB/LADkIhBxuCLS/fqmYffosiGgNueOzgDG25zD7ub+U3XRRDRk
Hd0T1/cDNuCnhtDT6wgRMSjkXSdN25mgxPXzB36XUoBm18ILesA/AZbki/UHx2S1
C97N5VcoEMIrBG224OVCRmaKD0dX/2CdACgfRdwDjzeoKBQ1qOG5OTi6PMM+bSaI
pa9c59+mBdqzk8/3Yii7Fxv6tYQljPuwhwNeX/b9CvMkCdqxyMLIKaQ2H+kpBXM0
zMH4A6jsstdNI+bB/sAnTJYoDlqzbQFXnKhjhpqrNZ8dTzJUayWcyTDT4ruVdddf
HT22+J5karXievXt+oqeOu6Aae30TFdHJLNr18D/2DPuEcB6AWQbIN2B5mC2hSXT
8jANL8I0ezlECs8W6K4d1Z5spr1Gx2sRgQxW8MgAng5aCK05KlBw2qZ5NuEX/85j
D+CIpgfi9xQp0u1JV221B4Qvcf7oY8oiULfx1etgqEJvlwSbTmTV8NbKs2DdV09G
LpSEzL3AWbHz+EeQXSgchN6e3pC3rJpJZR2RQHdSTUmTpChA+L8HRkJFqvzOQ2VD
kzzxMd5vIb/dOzgH6MhkMSinoTABippNjc7dM12xQHlVwnDUMU8/w4UHcVnDBAby
ozpMYRiTefcWOSrKhG5L6kyMpHoIv15wG0lzHHiYhTRGxIPwicF+Lhc7uF4l7qRz
UjVtO33cfiiHC9nqd2lfTAG2bERDziSfxqfuMSbvnWgS0zJc2U27lJXCrdnsL4Rh
FmQlWWOYAm1gsNBDvjes8t/BaV0/J9RuyjXCZs0T9N1XacG4zQFXEVqEHgKGzWNs
CAnEtaSdFC8ThAG6M4r3aY4/nSVL7UoF7eSaeL1K12kBztOO7wR62NTYi0wO9QaF
JN70qwW0aLj9V5keHGN0IiK1FOsGF8jdN65CR97ThdvYVfgBZEWXzJOL7ud/JnLM
Ys1KyFCW4C0uVliz/TgNwLisR/VcnmVq+V2bv9SEed1eYgq7EO+KyMnrQ+QJd07E
IuqH1ke+4tp5tXA2ojBQbdls9VietBI/WatkdojVzP4yHhCKN0p0DUjimA0Lu3G7
N8+Cq62cvFL+BV8clOuK3jrNkKrELUQv/ommFUTslw2ItZNJ67yIOEPsti59trM2
Ks0oWC62JRfy2I79g/OWTwiPXxJto6wqkmIRyfe1ywp71mmbzycvd7Ip/ezs2JBG
2HZM7NzEXQyefUize3chFnhr+6X1pjK12vpwb28lBzSJRNYubQN9Pn7tbEMbdHGC
0Se+qk7iiularuDTOPuCeGZZ/swqoFBe0u+EgNVKCQhZlgYya2HddPMg9omJ3/uS
Jn0Es6CHisjwfWNRUaewcfV5fq3lTYITn/EgIXvzqD0uQQNaUTtjXtYWxM7Fxs39
2HK9jW1zjI9YTqLeSHNoXyC6F+WHAW7InusY6AUzKV16NBauCLLkNhfAgc6OdNy6
AHALxj7w1O4oZN9Zjbjzi/YA6yn3dYuq79EJYEvV1P802vPpmFzyiw2RZT51QMZD
7n29WFKQ3WNhPPz4aZRHi3G2cGrJdLtkrQW8kjcYy8vo/9zFc0QyLSazvQBNGbZf
D0lZVVG2jDJDo1rkdmikBVGZexiOCy5USNVMoREkSp6+mtndmy+9tLChpSrqEfxU
9QMCuKSojv5uS5B/n6y+AdBRQKkTYziyaOpwiF9elWAr68czmVf55dVqppKlEXzy
6KBIgHCp5JnlI0tJX/6fYXqo+biddaN5VkoZQQjAkPXFpnPKGl2wiE/4N+cCi2Zi
zfYX27ddv1uDEcsT0WHXFdZuhi/IZdjKhrhJ2MKNa2iPj4aNWemkyBzqaJjNtR5P
oGQ2c0kQ1DD0uxLSmYV/O2kOQkJho9Tw40KV7ijehAnBETzNidjUK68Avh5pNsot
buvNY1vVP1czZ3hUeWIannOA/rOXKZOyHgWbRdZ4sRfDnHAqQdJ46GBl7OZ+f7tG
cS78icqYDy+2bV8wByJcbxLUpsBQBW7C1fzSpp6E0PAQ4f4GBACbEYwxY+cKJB5S
F3X6AmMWPp43EpkOtDq21VahtgqiazN/It0XsVbkdm9DU5RcXP4dwy4CuaRArRE8
k5S6ly78tZDi3V0it11yQuR3duTAqAWznJNxSZrerl7Rb1zb3Ow3jUkXskXst2yD
RR66/645o5Bup7+ama2yuPLrxty4Pi2u6SkxMcSdT8wAQdlrrXOw0WGEx3GUbG0A
1gO02uy1YvInuPX+qo2UE3if76/hkRBNf80VtRkHfgs7ynPIeePhIxRBBnEYHpTh
rTnQOm31fBzbfpoGQ63dX4VcFJ33V0aD8ANmkaHpmjGDMVSwuKAIK41nlgmxOZGb
Cfpi9pGVh8kz3Jd2eGJq9Fb+W6iJ9XgJS8muuDlVZjo/rewDF+aKumPgLn1hl2xE
hSkQueXUKvlSxMG+2SKbFh5cWZFmRTmJYWSeCUF5F2Pf1fC86OX0lsEzLbu2XmZk
KISY2f0MqJMxWVUkXh3GLDouEQk03+ozJ6jfTpcAqeFUqDfCF/YzMkn7S6ULh3i1
EKdcKDDkku93z3W/2M+PfiEcddRmo1y003vcXASe+iSuZKaIIrGuWPaCDSlMj8Th
Ylpz6zBnjjSZlxt5h59t7A2XxqS+atgllGzR4f9iH+Eq8kDSfa3Bm4FdKjibn8A2
XwQlOUGk5AgiPwGx9AWfA0jOKkleR+/i0cR6YsI55gLAoeyTuLVh2KO+aPHz/zfU
BP7s21LUllJufb3VEbcoyDMTA6hRBR11/NoOPq5odnXYhdHtCECOhU22Ad1ZIbhk
ROuPLTFcSq4wFbv5ljbrTOnPVrtitj697qQKGFu1upcofTmucG68g/BnX4mi7ePd
52trL97GZ/TBk3U75q5kKTiKFNcsuZ/8nS5PLoED6Eck0831wN5UstXnQXOjmKO2
LWXV/0LAgjKXd20RiX32Y1HyPbiXJd84YcS3yLF5vYPoqtQBnIVrGsrbmCuvbnsC
4Xxg/ol7IGeZU/a2rXWBE8bEwdChiHkTKQsLJpyiA4B09QdyAIsl/dk72n63w27P
fOVugjsCGfJyIQ+ON4weX16ywYAkStWpTE48svtuoemUCFPcrdYcPZqrchEpSqux
jWJO64BdP1id3EWR4l2rxRFisXYQ1sdWIqpSfFzoXYAvjVfs7P+Q4pLoL5cdjnpF
YOgguA4L4KNMPmGIcenC3aHt3tItMIzkhTDTB9SNyvKv+fi3m4OAwDBoXXEccmnK
zwfMeCHmLoUR1Kvp9JxIEoJ6Mdmf6AGFZHfhbo7uhNEDOb9ZBR8oLFldgjhF6rxs
h6et28AfxPyS5odsEaxKfdTETGp4JbLMF3tbGFqsyN7/AzY1uuejqtwBrMxcbR4/
y2Cq8CrdcgClKBPUTeWLU+j565wbTCyibJ35iVnwsJk+PxPAYdC6s5J3jtizMZyU
M+8j4N6PDRvwvfSUYZfEmZBR5xpxgljVr/u0ULI4K2OU5gIc4MlQS7sACWPFxoMk
zgFCcE45Dj7Ehs7Q7W7IeOjrxYz8i7z40xb+cssL//+jSOVMKoTAuAIgcB58XINn
/6Up+mJUEFBJyrnGq61aXLT9ILQX/LS5LImC0utjiEIbq+r5JD9N5KFNdYQHy9Jl
BhY/jLmy8guNQjlihwXfP77NKT0j7e6/mXbaSBsU3++c17wQAq71Yqjc7Sg+pkSh
KnotarcIpl3avdV2T250EeLx4BbxxWC9ZbiWNZH1VgiWmgbHdmE+1kT0QHYXddiz
uzfwPbDxW9q/rbrHHCGkkegiLbATM08DOyTEcpbOd2Ql+oFPPLMLUuBfJMXAJzGm
JKuYJXeg87mcViomm/byYVLWbTdfq6BrtN1fB9Ix8fNKUzHSHoOhgHJcgI8+pYn+
R4WvzqA4h83WB0i9ghwx19OPwmsEOAQY3xosWTgOti7Z8RrZ9iQCdk/CuJYknTIo
3EscsTLgJ5XfvFMNifJb5Kgq063ov08ElNzqWXjgf+7pg0HvQxHinfoYzUwMi+ns
NIatkCTxCKWDv8k7+sWe+KbmWeW6OzJSJq3vHWnY7cG5uCIDIrYfAXvt2Ju3qZzC
5rPsaxwm93PMqL5WoYk1goTIdG8RdLPKgv1kxOX/L/oTEHjQSvjv1wx/otAAwFj/
8+xuGC2fduZMxAoyXdw/8DYidAO+1z1W+5wU+4opDvuKlUnWtzQcmfIwbhOZrs1i
Ru+ErrbZxiCFhCMHhMdyI/ipBJia5CxYzzwXyfvPdRdmgyaa4rc7NhBn+1ubPvin
nXeOmRHoM4ZqI14FNzBy1mlPZtW+yVfYrVeeWgSwN+A46g+opBW6GUwA/X1ZXYLP
DX96iZJSAthAdFGsZteI9EvlSQuU4W5KUj29yTgJ07Wwks++ZMN7m1Vb6zaInuzJ
GSwunpYWO+PSsUPCBcXC1nkaTDFZYcI/kG15hVe26l5yL7v97msQhPnoYG8hSZMA
gZp5Bi/oizBErq3xO2MS6N28gpE3+NAiHV1+fKsFl02M+7ft/hivaIL2INEJ72s6
hDKAe+hWXuQ2tzXgODyIG6VGmcWGTOGZN9wGfR2yFNtc9w9VvnkzkeTmkdq5NT4l
mOoo9u8wNT9NUaOAb7NYacHnlaQvoHhG7CWULMjS1xKwPqt8QID34mrwmHdqr/v1
pyZbt6Ro9kDtzsSS9dGd55qCRl3qsByR5TGZpzyKVGXvtFikiA8ooZjVaNsF8t5D
LY7Xye4qeWD+sl3XL7G7+RusYp2GA/By6O/4HkZTzL6MUCWiD6gyJevtKMPBTNTR
BqyOdv6fiW7ZfF2ZoUjNyvY7NRKPh5vmzXqYavYAG9znxMbDMZ5znZJbuxHJgAio
7ZNecj6z9s2HqLcldx87WiIRnc/mlrysYKWtAlzg9pGg3rrcClw5Su4zwDv3VVsH
Omd5rZ77E98QWAN4+2QqxkFLfCSkMy9lXj+R+bUUBWY9Wz20Lxvwd+6uvWuck6ef
AaebY5+VuMskqVXfbnmzjr+5i8FEwl/EIJelV11StVyT5il1lNLGdpr/VGQrM4B/
+jdnOBey0qTdL6t9Gex3gplN19dTjaUCElvRKDcIS1n5+ImTfM2jp+PsuVTvEJ0w
+4Z1rgYc7rXylWsyxL3vfKfK7DjcdS6e/ChETlM0lyV3bJL880e12kLEpVtedjPV
OcqwUc7bbx/FfZjftyCb9W67T0Fg3TnvbUMLx0aSgT9OiNiPxj9uIzw+aLB8taI6
n7QnryIBerGCzDxwbnpQxRZEj9rIkXWKtbCeCM1cqQB68CwGk+HPeAs5F4zwl9HY
l8UKttN7LG4Nbum7iAxlF3WcZGW4QIjKdiHi+5NKNub1Te6ltifKGHrDVJWppW62
/tAM6xWa/rnaf3c6oPwfj2G+V3f7lZ/pUh92hcMoq/AfyCIEXjCQj1fJjaCnUYmh
M+H28EWQDyoYkefbfdiw+MZVXosWofFyTd26rUfIwiHFXEd2mlFSnzJcvikqzJH0
QtRgv6fWcI4tbQbEAJ5yOeprRZj65jlURP43GjCfiHvhfHU98n4u3nM2pGa40lVM
6Ve7wNI3Noay7aHj39PhDu80GluN6Vba8HFvMZ1nV3aYvh6yKDisOAXw6c7J1ekl
GP1U1C7aC9p0WETMxJ+QO+i5ITCJlOOiXRYDSf9M0pcKU/WVO1oJwBMwwtd8lhB6
x0qEKgXrh9PkR1vjS3mVCeMjae0VjTpyMJqe4Apvr87ei3gh9o55OpzHhxZMg0uP
caWscpvAfbTOUBaOXf/Xyw5rNI6OXMKAuZgJ85QkSV9U9gzHO3/IgzNrUTjorf3r
IV+opuIOMG1oAJRhwV81Fe2MphXS28J3//K0g4A8YlWHMRbQwNp1hjyrgbo63fzH
B2h6ww4nRp7eTwSlksZehlScx41dqHTq8ImDZppk/J3QJ3YAvBXIn8wLdBeQ3Xka
DJaMEaPyhyVPQkJRzlSQ5RaAcWSov0O4j9r7xhEKuCh814AHvWjXZYy5Jczl4acN
3nhp5P3hM5laObwGcFyRA37578VuDtxgdmJff4ztBfIi2sNQGWTjDqhxEFGfM/Pb
uLEvH9BRKaLwE0f5wnSCSYo/GLjEXBHKHJ4tdb9RVQo9A8Yjx3VhUSmKcaH+lzKV
KXmXS3dlwK9Bsf/RAUoAtgJ8uq+WvOUWnBmZwLcyBrrItxe4+m8jlp/Ooa/eI1BH
FMmWon4vJ6LEgT93P90CPtqwx/SchCjXH1V/2I8nFt0Hi2OFuVl5GYMAmSSKxlet
XNIRn7faN83rERB5+9D3QRSs6knA4A4FUr0dX5p3onm6ncqmdkRlIzD4AG9HYndL
CRgS0IvgFn42rwdmsbrkKUVxPzPaSeqoYVVbSKOJTeoE6dEiStNB/NE+nbyjwXQK
2KPpkNu/t9gQaSBcGW6Xre8ltN+0Xz3ZwM2cwtdDW8Ve4kQDd7CvmGS9av7UYlRC
A1x/I3Z3mAs/SgmJ1sLhiMELEAs4czKWfEhc4mcUTKRu1NJiQWihHvkcZVezrT0/
kmzxq7Z5Jfx81X+XANgGoczDEmsfd2O0Lb70i4Y0cn4Bf06/m09vBmaKNFZuunZW
l4g0jHgsLkFliPMquQLgNYI0+ITeiNZDXU7Ecrh4CCKgJB+6gfXmSHYuEfy45tn2
5SIPw08aRGiOAnKcHNQlIc+f1aaqmzHFPVxnFSsvNlQq8BI0TgR+AIKrjBwUPYc/
ce+eDSD4LiX5cnBE1wQtiq4rP0NF/E5BSmor0CtJcvWMHDQuDpxqp8sxEBrh5Efn
+ReQ5JAvADLai5QxxWc77L4iM7V8mKuBjAiJOVNPjNBD/6ZdI/Y9n03H9dVuaX4u
+9pw6wcD1fhmFEWk8rxGEtap37KWktB2kTwU6MRwLnzmpO8/7fYLpMVtHj7BvdBC
dMhj482kauxOiQ2Qq7ZIs9u+MaQfTv6hot1vOKIJV+GPhOVaZvArbRU4vjjj6XPf
VVz202WBZeRqwY7iTgQKvqXStEBzGmfVbsOs02uhtYobc6x/xKoqMnrPXiM996Fm
pSGf329826LPIq2KSfmmj0Bhat7IA1nW490lxusg6bccrhmMum9qx6Aih4RDwCjw
mixUhOnbsp5jwTWH+eK3Y31XMTc1RDJboECGeTWfMk3w3DfpMU9OXSxgYkLwj0KL
MJM6UDxK5vmHCQxgKG04mlEItGyoQF41JI4rR5SHZhf+2zS3FyUwQNoIzqjF6d/i
aBkTzeYvaEa9d/juRcJ9TqZRHZJGybn+vZlO8VajSJr5iR+pKCkWzhT1Z7YaWcvi
LGjQdWHdzITBtW/k12YCnbSHYEw7onJnKFi454GHM+ZEmNP/maEaoN299lq9RDlJ
zoYvx373WRY1NHamWrwB9rVXZSPLPpAfdhKStlYbGOo2pFIJuYzCiyoyj9ExoMxT
03xLYClbRNiL9cnZ5TlzO8WUQZb0OqS8bckUIfEbRPVZfcvs05g1MoB6v3ycbw5s
aM9wxhWc9WpD2qYUvtjqxQXTDIytcqe7VlIjdGZGLF5J8ewmc4ZEGMeRIX0NnCiZ
++9xIHIM56+AfPYVhMY8va3AapuaZ13yYOpTr9CaxnUZdm40h85h5Z9I/dfE0I0p
H04P9HeYeQC03aMf+CHtKp8qB4rSrfPMcX4sRhWphv+cUmMq0x5w6kNGxme+8mCW
YdRTE1DY6sRZvYrKU8KpTGVxunO/nkMdJwwunDg2hts/sgIu7q4Rb3vz6qc5IxiE
OF2hpUCjc/N/KAS7eC5gkejgaM9RzxvpedHy7GjM96Se1QZ8OuogrVM5V06YjmCu
N6bZ9vGagb9VE1pUg/bU+ddTRALpgHKnmMsNvocvYZWoajiR3ytoeHzp8Cw6G+zh
xIB+zeQwfRPPWMJKiELafLg7VXc5v+nXE0RfkDQ35JJqAiXIlI6ZCPQY9vpX9wrW
DvalSTxAypWufl3WFKQJnlBRDl+9CD0bn3KG1n53JHE4MlOI2FMAN4WLZUU5OqZQ
Xt1063xbzzbYW+R7CakHhOLRQvuLiStMTyOeO6bcMMP7UbwDnKD/P5aFa1xbS+vv
TGQKZGYSYVpK0FAAOE/ebJYt9bAm8XsyJZ3C/eG3cBLjcJduV+u95ZpSH2Xxr3k3
vJ+kx539OM834XZnzispKnBcBRrLpY5/1mcGOM3RLM2G4QwIs5glk8nYY4CaVirt
ATd07FSnmgVapDT68T5WaTUTsZPzibhC1grQysmr44xCTB6yosmZQQ/ezJeHDEjk
FXpBQyBu7FUifky30oqW9nVsGr7vjykB+pl9trrWqI2+VHvPXf6KMcuCvvM833iI
Kjrv9hp157U9aYh638ZXOxHyI7B0EiZhN+mltUbJnXfMfD3qxAmwE1tFdE+E16W4
NMi8yPTdwUTFRs9m07nU9OIXikn5Jn8wuIzS16pL14fBhFkQOhLkivTqEF9Y7CNH
x5gmuIXoDfaADu1+hw5Sefd80N/W1fVU8KLJMVEk9RCAj9wcVBvlQt97ZAhXjqTD
W0eONMNz2B6lTfpkeMwMx+eXvKkZ7TNlslHuHQABYUUNBFx14Bm27r+/JUlqcXXw
0jBQhrK+7PGMJ7e6Q0JYOrMHa2sKTZEX+rE2s12ivvGkJtMGcvBWOqOkV/Kp0gW/
vmiGuyOScpNO4MSmUe12j2gBNvL5kWiqsKl+l0nSxI2WIknhaEH/EhuKmdrBuUQD
82Awi/8AMdWlaA9/xl2jLAQEw0vyHl7MrGrAVFgtISob81VSz5iIgAYgZJdhgU8V
/vVU61Z/vQgyDfh4lKDZChjhvYzGFn0oSA61FzAvewYwx7NDxcnSKSSu2/oAaVeY
qAwcn2hQQMNyr080yOaGZOSC37MuXo9SxSNB+EZBIGjAMTA8vgtj8HDTGF8wuvBO
Q0R1xTwqV4oGq0+lQkHU235IZibUPG0iXIoDq6aZ2nVS3byf4rmiAA5q5GnV7N4t
lEcvKxZkEagQlVwqH+/nqo5GqsYbDyzowyrA+XWrj754Dg5wKOCo2s7hV0ZLpt5B
T1c4SlSHRHGSGSSHPqbI3RUOnZQ2LiaVhFIjFRXID091y6337YyuBQlIPSAiPJc/
WcdcKUVtnhcJU8GeG9Yb81a0zNnHhbk6ckWRnUw7JAlRhcKZnrga7me7QjG9B2BH
7KXHW1baBM2g7zweg29FHQGK6oeJegyHzT5VbCZebO9B+Jh+foflG+/o+bWKSvSt
z3le8lJ954dl1qmiWDt6N2JxZ2yIbbuh5iQToFzhdCivUh+pFUs4LwEeALdvaavY
1I9KYg2weWaffvGL/G19r2/eNLPn6+U2RMNwXeSWS+ppkSeZgkUZkbIKRJbq7NCF
dRFFBo/a5WH9SpypNxR4V92bI1ETORyUQm6oXvFjl3CxIKGAEFxIgfmZSx9lHgT6
EvSGDA6Ix99fJ9DbGLsmxlWNaH1KSczs1WKuw0ctDzWTBwCEhYnSlzMnZr+FhWy2
DPL0kKtCr8rekYaKpuoBOUOxyQaBcrJv6eLu7vjrGbtviF7/lbzb9IyNmEY0Fq3z
uRUYxRI05cDB4Ppjl8boInCwIG49VJe6gEJ42BU4JhZpgVLEZPacFGaJ/LauyBJh
Q+3v7xqHD4CabE4KebUY5Bu3thRJKYSdmdzzt1xsGrLyM26a/zII1bOtBPRYkU/l
XbUNFNqjzotQ33PM5m+RZMWvQtk6p/mCe1yaSshHa+UbCUKz/ivuM5ykW7fOoxro
l/r27I8vcb2UqOOc4g+x0MGXPCMBWnP8Octi1ixjv6cBPe7jSd4apwpXgJuCWp2G
zvxeMr9JiNj84r6QDj8PKieJlcsqFM3My71GlY5NYQIfbONoAvuTka+kY0GDw+Pb
qvrx+NAYeH5T6xtlXteq7j2rn1yu0wISyipD6bZyYIgZbnBiQem0zz+Dy3veeVmE
hQLGxoQF3P5HxXxnXc+RD8A8f8btOH2kxRsfZh9hk9tMvbsyjrhdGYwd7+u7FGu7
ucYNR4sSuZGo6xIh12UoDtzHh+xvjlNouqHdY7xAakgzCyeglyRtERR31Kf9Ur/E
NtJ2wgwT0jTkCxtTs2VQ3dOtIIMU/8UxdXtB3LhSNRQdWwTjhojsVBNz7sd9ecsF
+21VzSEq3XC+Mt4BiAGddssJtIpdhVqClCv+z9v60ssTK2EMd0KQ055M8tc/JnAI
yapnkaeGfFEp8kEz5GF6rbJuiyuJx7Oh5Fj6j4ddKEYtq+BZz9IhV4wKDJFrpB1W
LcUr1b9j+2ea5x36c6o3zoG7DnhNC/emELmYeLi+gQESTPbtT9dbVpzKxfmEeoE7
AEiAk3Nko0hKZfucGM0uefUkeCY50ypuxVADlTD4uL8hn6IYVK869zOVYZwvnNr+
AAA0MJQdN9uM4aGtkTwyq+tZ7gZoQOOHGm8AfGKewZieWF9qHrHiph7BHXTNuYK8
rz7HbPE98lA7r3al+CYV6oogXgmXIAMX9zXyRD7RRyvBWkDtdPkmNyhjEBpT6Zem
R5lxICipAs2HJI4sBGH4UMd/NCS6/mfWTN+lEpzK6HIojCRIQ3TcD1CXQM9w6gCA
wZu0iXVmLrwhJUFr7t99Or+41E+h4pZ6FKgwu9pFjxjBXTeD9MuIdkIzDcfejsA8
CJMlHk5+FUR4Oqg8Nyk0i7+KIi9VkOTEYg5j0wmxhr7bCKwXuoiXcj6qwj3i8cEF
UgJIoJq7qWS679AXTdpHu460nUFQ1p/ri59EiKqPnH5gapAsx0pRE1+3ezTFc0Ok
YDx+Uyb1+sxS5xMNvLqbgoBfWhfGbQJwYT/Oi6H8QkmvDKSR4w9gT2ooXKfdT/y4
lx5hxC6teErlfp7xKLo5QCwe9A7f6/61arS2q4mbe9awiegJ1m3kbzFlr+nr6P2W
I/Ttg7VI7OJhdEz+qhnDcV1SS3RfvwCaVrokPMokrnsf0yG/zFQLSxGoA9kdM8tG
hazPJbTjEGTrj8i1Lyl+oyH0rVG8KbeXsfqPy+Tsa3OGCy8EOompodygaJg5veok
qMNEIfDEwtL88FRIBYslyh0VngbVAk7IhlgAzi84dKgKLZVozJM5Tywru2vlt2O3
NcBBCqLHNnOfle9UTm+Ycp1b/R/dVjlb94XoFskoPTmOYy46QNMSwT77LmlhhkwI
GCTSMnaW81v4UQaIN3aIDaIZhcX86NVM4X+h7qaD72jC8jMIUSc5M9gZjQRbgRAf
vk7BlFODej6oMkfzqmKPKXfUqt6NgFo3kvSKXx/XMFyA3N3RpROAvsv8AD5YjkkE
wl2udrdvhag8obsYIRGP9q5FmVutoMWrfrN3D6IvTl2R/3gACS3N8UKzUsTEa2PY
fJK2Srk4+vwfpYA2xVpcfgkYqoSwtGDMqVzKR4hEZvVLutRrUEG3JaMC7swM9qlf
walJtO8Vq7dzs0asvhdpmW5/dlC+hODTu9+hgH8LB9xtJK7GD5DRJoDmytAgtMPT
2pFphqHQYKdNBZK32C0vo5kibIHMW/Fxi5uKTrFPgqhTYTEepq2NPVxvEPhKNlZy
PbEMrUuhnrL2GzNcZt2RVjMkUbmhsF0UmZGqRCpM3yLYMbyyJqJAKbIE8qZGmHRn
PpVn9jQw6xGjnTBMD7YC0TrA5nSgC3nlsDUvuDfHF9rPk1qE9/hDzv4BarFXv0Kq
LVYuSF78sedd0DTjAGfukvwSIABDlkQJmPbGTR31lahtVgAVTjeHeuECP5sb433S
44OQqXYmVX2U0cXEa15Q0V/f2GPyiyEN4+lc+4yA0VA2nVgxzR3EWZ5vquaK2Aaz
FRHOUXa8AsrXMFp1AgXDnSEMsx2NF5CcJFR1RboCt05A/SZus6NNA9ghsDjfXyG7
2H/cWj6Y7ekSxKtuA2yeYc95Of1X9aCTDNMjJKxrK+TEMs8/wpq1oDT9QoFyaOyb
5xCEPU+4sWvmq1ejTttkcdGfb4FJoGi23VnrnUo+vYnROzl8P3st6mYbxsKkodeT
IDt927rXs84w1uclok+2tW/pQ/RWk4Ytn6FP7KHy62+FufDzl/v502CgkBXx9o+U
PA+ohRPLRehVln5JDF5dLUzcTKmG8qKvMbak/YUBe6jLYkzfgz0MlCA/pybRnee9
wAC8eIzUULoCwOnT8UANNd2FgXjgwP15aGodSUhzPN8UY8OyXhgECLX3YrorxcC2
73Vxt92gKXWHTz0vUJgHfSR8R2ovbHeg8H3G0NiobX4SwLUE5LvueiE3ylgyvGe7
3+iGZJTAAF9Al/ODSxCNSjqF+LpBuMxC/FFzRQMgOzc+gem/8/1TWduKE3GPiMP6
95ExZ308cKEMtZjrX6QF7Pn9Z6FreF03LRfxcoadIoJ00n11y7fFqNFYgTwIIdXM
tFdMGkYWlb11jj2SfanMtLI3637cJX0N+2xc6C3j38ZpdjyRmJ89fJ0gmJTMmxJJ
Xd9HisdH57crmFAzfRh8FcDZLZRT2RYx1pQgcs5Mf4imEH5boX2E7U4KWolOb5ZF
JXK8/zFqADxgJYgyQyOtAHPm/uPWfkK0X8WUgk+kB+uYmiXpUeA2OaG2iyVXBifV
x3/ZsbqSxSZYMKThgliy3Z1Xi1g1CdMsnTPTJaHSPcrt1QGYIGq5EKSbv0UWUAV3
FEGMZLLx5GfEVpIz2m2JcSiyCJDzMjmYmMm7+aZxRwdh5M7P8r9VnZ4Na4oT3bft
NCSYZUyLPRa+0PDQWgzAR2K4VmFwbKspU9+GArQjE/Fy7QDPYlTT+FAdi2+IM29Z
qu1grKitIx3E8xM27CbhAI50Do2ojjFgcuMYdAn32CS+0HAEdeRyk26ZvUmbUxu7
30plYK5onieoQjB72oGg/2Inph/6KimKkpWy7hohxvCYHIPwzRD2Ahqe3OzfWEuS
KU4DC111cQfEoh894+vG1vhde067Fl9zJp19j4C18rqokSm57T/u2tGcCYyKntuI
ecgtE2oljkg0FRwveQZmLVV3ZEtUzu18hRM++KkKbwYg6bV+7Nsj+CBlRc5pgLDO
YgJvJomuyNZalb/t48HbBqsp0YA4P1AmES9J+mNuz5HRFkgj4ngJ06K4Dw2GkIUu
6PxoUM98YQPAkhRXg+GMmdaZfBbsXYmI0PbfHmLfHgM3Xqvo/zQV330QjFbxlleC
rI+bdNusBD2ldd4hgu3hAgCJSFjiUG8kQLSsDqfgQXM76cVzPRGIePAXeCddc9vO
7c2qvfShKUSgXHMYiMWrMpVtjU69MAo2EX5U3otGn5Six0lZnB/v3dNJpjitE7lD
4cyJPvAIpVO21CwLn+s8/gBKfY2pxkkHg61sjKQBeG8kjZZ4H5t6W+ssLLSMeijm
pCxPmiZz4xA3s6u5CYIxdpL4JeDF+zkQkSSzk9GVZo90wiNITcHQ+Uyjjc0LY4Nh
QKDidPWU5D3xuPvvAe94q88QNLnLKf+S0CbjRekFwgxzneWkIPHjwVxzCnBL2Mks
S/FN2EFiq5Xm9Jja4aFrZJe7DOthokvIztPf+f4zESaF4rLQR/euNtMaeTW5lb8U
G8jsedpUp6OxDG62Fngt2VRyKn8Vp13v6+nffl9xbnDdCehH7x4F0d+dg0H8eSWX
F9HEkZLzQENiB71XZhXsfQHJJKrZLB1L0aOGeKCrGKIg8rLMw75YEL5Y/wvJArDL
rAZkHR/haENGJtoFRoFRCg/2Jma8aFI/HxA5mg02br/nAD+/kj2ZSWGCOEQskd5l
iVbgArsG/WOpbnbagB/sVFh/Ug2v8/bBmLW5S/aFnooj/mZL5jMQACm5QGE4BF4w
nCpm+uSIFckhJPCGk+woMFWqpUL3zW3MkAtoStXETV56MeQCM/62RDrcJiGOFFkW
7pMD7bNGETeOpr1bSGrchdb1wcYOOrm1rRRCb4ctkFQ2Y+yfJPMmLjKrHWTksAlU
rY6BAApZgg47tLQ2ko6gUYeWVRhzQiQxarbU27ptvNm88Al+m4VNz956sZxcIHfl
eK1Bmrlf+N5ZQgnJCcpjn2qC6TKWv4UP3kF09hOP10k3R+/AjWwZNF8P2YqwkFni
RycnRdFJGpd+Ro979TdhfF300BdvikDem+2x1Lg0Nl23Jh8TZfApJkqYMkVJm8Kd
xzGK+GwwD1I3KJx9AbbL+bklfP1q/MdKLAC6nBvVjhqN67roMoE2f/y4pAz4Bppn
b1GyFBosPWR4/ydcLJ10PclHdEEM4qbPk6tIGQo/ikaXErl+vSAacRHDmg4NG/hz
R5idU0AjGSqXdqrec6+tnj2XQ7GSfg+TAHdlz/gPmdcYlSysQtZIpni3EWeBb3DR
2HsFZPUEQCNLaL7/9tKukpxZzuDPugBX4E8jSqLdiRc+lwr7CVn6Oqh3lSayTtyM
Z8ZvFGptOJxeqrL2i/fx6Sj45ggi6WKhDKRp1cWtpOt3n4XIYq15wnCvKybWkzFJ
j/2ohSMp39KCdTBNtZ+YM5wcxKprQBpRDBRmsoqTcWfe40h7Dl2HTs1CxSUX/kOa
PC45x6wyznqrz+SFfcu9H6wrv8IN34uZ2CRbEufBEzeMKueJX0zkI8uhd1/SQDwD
ZWxeqTAABhG1+SqE8+IqoJEnBo0pBVdz/k7F67evJ+ScDvaEz/JNq/fk0rYasqHG
APBgSxdeyFbpVDuEL7xngHvy+6WoHSk952ooEOvRs7OcebWdbzLs2dltB2NphmG+
vP3hoA36Cee4/e5qEkdbhvU+VDQviDomybOos9CIxfaIbIOa98NjmaZcczmVi1rt
ICR2Xci7AzHs7vWK6wYjucul4KRthSwnu338ZEDc2c2B481i/ggxxo8DeS5toB8J
51IKAbSX0l/11HHVGUcuLiKokGbwAwCKDauU/RYRFMUx+b4PtCkXJIBp7ezrWkUn
ghCTqgs44C+kqnHIq+HVx2eJjLCG/lvx1bI/75kymZ4=
//pragma protect end_data_block
//pragma protect digest_block
ssBQarqnYaXdlXkv/spXXlcFMaM=
//pragma protect end_digest_block
//pragma protect end_protected

`endif //GUARD_SVT_FIFO_RATE_CONTROL
