//--------------------------------------------------------------------------
// COPYRIGHT (C) 2013 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all authorized copies.
//--------------------------------------------------------------------------

`ifndef GUARD_SVT_DISPATCH_SV
`define GUARD_SVT_DISPATCH_SV 

// =============================================================================
/**
 * This class defines a methodology independent dispatch technology for sending
 * transactions to downstream components.
 */
class svt_dispatch#(type T=`SVT_TRANSACTION_TYPE);

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  /**
   * Shared vmm_log used for internal messaging.
   */
  vmm_log log;

  /** Channel used to dispatch the transaction to the downstream component. */ 
  vmm_channel chan;
`else
  /**
   * Shared `SVT_XVM(report_object) used for internal messaging.
   */
  `SVT_XVM(report_object) reporter;

  /** (Optional) Sequencer used to dispatch the transaction to the downstream component. */ 
  svt_sequencer#(T) seqr;

  /** (Optional) Analysis Port used to dispatch the transaction to the downstream component. */ 
  `SVT_XVM(analysis_port)#(T) analysis_port;

`endif

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

`ifndef SVT_VMM_TECHNOLOGY
  /** Sequence used to dispatch the transaction to the downstream component via a downstream sequencer. */ 
  protected svt_dispatch_sequence#(T) dispatch_seq;
`endif

  /** Semaphore to make sure only one transaction displatch occurs at a time */
  protected semaphore dispatch_semaphore = new(1);

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  /**
   * CONSTRUCTOR: Create a new svt_dispatch instance.
   * 
   * @param log vmm_log instance used for messaging.
   */
  extern function new(vmm_log log);
`else
  /**
   * CONSTRUCTOR: Create a new svt_dispatch instance.
   * 
   * @param reporter `SVT_XVM(report_object) instance used for messaging.
   */
  extern function new(`SVT_XVM(report_object) reporter);
`endif

  //----------------------------------------------------------------------------
  /**
   * Dispatch the transaction downstream.
   *
   * @param xact Transaction to be sent.
   */
  extern virtual task send_xact(T xact);

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
KtUchgU8BPESlim1z4MwZRgMbzZqHNeu9NE8svbZX5nIsWFwugDGqf3aOE54wPGP
m+9tMyE4+EbIW6th76SmAk7+hR0ybBONHcNXrRsktWatVnUyUqm8SDXKxsPWByQ4
XGOtHRc1bpcm5SeIUEAEjb7HiBaq5GsX9IOUJweNM+Y=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1827      )
LcWS2TH1CH4D8sGVNBXtAIj1qb92q10j/VA5OE+p8WyyVW2ODvCPTqXGLMD+KhFS
XFryhCm54fThomwtkx+UIC4MKhWMXfoi3I1llw4lxYG8F5S+AX3yMFyTdmCkCKwT
whcSw4uhqmkXOZqkoT05xVBlw27YtA0RZ6Ce8EiEpGOl9xnvNj6hCRH0HyLlsM6B
oH9xJrdla/NvRzO7pVVDkuCEE3iNycDbj9U6Qvv+WV5q8NsCP3zZi2rPuZ2jPEDC
W3SkiFHvFTL7msEBSF6HLDFSAlD5lEBYl4U9X42vUu1DuuZtgD1MdzXqhshnpqPL
+yN7l9BEZVoK3DjwJLbaltbBgZTLkPiC6rayXcCqd5FJm4qd7AmXZ3j73UnB0sRz
jo6ojsyFwD8j34io/4bcfU7fD9W3+6ZhFTcMUz1K4sPQMWSbJ+A4OT3BSU8c2K1e
9Vo4a8bx0LjG1RJ8jGkAUHT8gcev3f99meVnHiye5tgWPLqNqYSFga7H1drhsz/Z
iu0IFxOx/QOBQC2s+2DxOC/YdvlygbfuUyLzH/U/zjzuLpPj+L87JpagcQ2s3gj/
m2OhTHIFe/rLQGPMGRj5T7cSda9La5xh3cCjTIdudw/g3lXJWx/nHlMuuOwdV3Lh
4EbcT3FzanMoaBZoWbPWlu6nGnh8t/GPwqrHRqYmtn+Wo2rPLOrV7K9oE7PdJ7bK
eVVTlMMO/eVE55hnm+ek4sfyM2sTI6g9DFeYMzcTgmX1jwJAwogOvquMhsaHfL05
xSLjZoSZw+eIKHC7WP6aRaunlz5NsYQmOpxrhTJEWqhtQ7EBOPnECfRfRkzrC9B9
0Fh/a+/JId1ZTfGILSFwa4ZlTyzdF/PegrRvwj+KB08jH0wD7Yp6vwLpNHs/TShx
Maq+gGRMPA/5wqSSW+bUIH20VBJ8Hacy2VuVJ+RMu483VcDYP5a2+D4Z7yBQ9i/3
FFkvN8QULDNio4Qn/x62sPCwDLEr0qpwESH2qll05uce3Hh6mbAg0lrGgFACe6+d
ICos8lUo/jdpNhPsQCD7ubW6/Fuy+xcsVKq4vS3jkTJbZOqJaa+MdQpNH53ihZrF
9B+IBbMJ0AjJF94/a7i95/HpCCwHv/AF+u/3UX1roZAWbehfAeyBVClYDWXB00VF
MlbcddN1CjkDwBeqxkAHgIy45SPaVIo7rtzEHA//boiV8/8FstH4X7Fha5cDlO3N
MwXa2SrpDXv2dtmti9o97v5KWmAIpwk8NmqkSJLp0QXYDhkf4PMU5zlpVWgu7quH
7sazqLVoz/j5W0IZjaN79lm/yAIen96q8J1a9yAf96azTljF9m8FO77cdZwk8kPR
Fn41MB5pm016Plf31SJg2tTP887aoYlCLmg24pvK+8bDhA2gZbIC+4SupWMd04Zu
51bqQcPxAJgYJBQpuXo6X2g1dr4YcXPKsUBhT/+6SLhf4XYIcFT7/2BrmaI4lQqq
hkCQCZkwJLKslAKJoWT3n/WmXhdqE4dnl+L8QMc+V7yCI2vdw5iuzPJb/tGh0nUG
l6FAwiicaEpQvXtMUm3JRqDo3ygJCnCt5aQZIz+U37EAxfkNEKjfEhDdXjwYJw28
HJbzvbRVQfih54HHHTrhkAdxxzDkzGSw9gzW5BrnmgoxYWmljwjYtfXPT5TWF+ZH
+677g6WAIfeqDqh3uqJMhn0C0tDXYfvuwwXW0UR/8d52VFu5FR1vimjHk5/em0ug
/9TjoBxiarA7iE78kg0pX/ccwRANVGn2SqNZtqbyuvE6ONuv/8r4fnmtU7F0jJsR
JlYNYCe2k2VmAraGlYs8I4mmAFZX4QFo7aSgKkCy365OWyK1WPJ3kPzcb0Yk6dpV
MQd5xxUsOZ2PmXwp92J23lsZziUUvbL76ph45xRXm5kdfP6ALd8sRMRmqu6Ysb2E
zO+6FxIrKHkUCRo8vKRIW3iG/x8n3MKYEoN3SVRXT3m+Cc7qaLZG+HI7wOocIyex
WH7stsfh6VVhhhev1CW+vNoT02d2C+k+ckBvRiduNspjLcAY3BDhOwNWTdSgS3vZ
CfxojeiAzuueAfn548X9OVtcXs6S5+crECV0h/wPRBvQx99qpLQLDc3hLrMYQZP7
yEHtfJitvN1W9S1B4vI290ZM508dweoUNOp/ENvX8dKBcm7PUHjlIst28OoWL3hi
UlRLIJGjhNpBKrw03Z3WZIkZ6tqQPkX9cVe/f2zWCXxPul89G4aik0xf3YCuZ+aL
jw1RXw12R4799DWybi3ejRAlFmClsfCd8kzWmuCbXC6XNe5wmg7QRyvBCP7xFFmp
JYo10i0jZY4v0MZygN8j9cO35wAoC0ULDM1NQwz/oKAuOtd7NpJeBl48Rn7YQi7x
wC+Uin/ebRIZoO0mwUE3+LTO2kuPuRTdmYuq8pFzX73qDAxmTg38vIi++gUpGnWi
HKeqBTWms/7+vTuURmjHiQ==
`pragma protect end_protected

`endif // GUARD_SVT_DISPATCH_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
HIe9+kWapdWCQjf/jdkBi65mL2G2qdSXfShXCEfEBvJWL9ehOY16d8cIWhdkPKjc
EC0SbBEyCue6GkTQMM8fiwtXem6KAw3LiVJQ1hHWJNCk5i2kxzlzDiqIjipUd2S+
az31I9mUNC4vQAPIeCpQEUzsFgkUoSNoNAdmR6zM5ms=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1910      )
y60s395EMUh8OXablWqfiugGFoH7mtqSoPDdveBJS8SHH0V5FJZUqsMnAYsM5VWU
ErHZWm6n+1udZq/xueF1pFkmy+Ppr3ppmjFFfV5QIXkXfCx0LBRcrc9FckbpU5TW
`pragma protect end_protected
