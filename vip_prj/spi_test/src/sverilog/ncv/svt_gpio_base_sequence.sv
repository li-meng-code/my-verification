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

`ifndef GUARD_SVT_GPIO_BASE_SEQUENCE_SV
`define GUARD_SVT_GPIO_BASE_SEQUENCE_SV

typedef class svt_gpio_sequencer;

// =============================================================================
class svt_gpio_base_sequence extends svt_sequence#(svt_gpio_transaction);

  `svt_xvm_declare_p_sequencer(svt_gpio_sequencer)

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

/** @cond PRIVATE */

  // ****************************************************************************
  // Local Data Properties
  // ****************************************************************************

/** @endcond */

  // ****************************************************************************
  // Field Macros
  // ****************************************************************************
  `svt_xvm_object_utils(svt_gpio_base_sequence)

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  /**
   * Called if the sequence is executing when an INTERRUPT is received
   * on the sequencer's analysis port
   */
  virtual function void write(svt_gpio_transaction interrupts);
  endfunction

  /** Register this sequencer as running so it can get notified of interrupts */
  extern task pre_start();
  extern task post_start();

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new sequence instance
   * 
   * @param name The name of this instance.
   */
  extern function new(string name = "svt_gpio_base_sequence");

endclass

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
AhLCTEv6XrpartGik5Spk2t0+zXKQWc/ebetClY4/ftUhVDPbST6MabF+H1zXGHV
fSjPXEzrj5Y2zkMOGmaHO5v7AiGoS2KLAdTu3CZRsaNt7jfhJXcXg9nVkh+8b5l+
aeMB3a25j35bO30pfivnU4mZbkWPcSAH9lO+QN1/CRvSt3r4jSYGJg==
//pragma protect end_key_block
//pragma protect digest_block
iv03ZqGU0mflp3xYmrczPorJQJk=
//pragma protect end_digest_block
//pragma protect data_block
rDH7MPznSe1WyugJU9ETOhFL4upZab3uPlF2eX3kM+zwT3Kx9LkNE6ThqxyZyUop
zEgMuVKb6/opIarVGnaxLb0FVnSCwzIY9e6sayWuK46NmKDh5/G7FFtEFRjq56vF
NKtM8MlsNjWN55hAeVH31ebDaUzrf+tqnQTBpdl/z5KGO/3tQjHkujxgdJnWbqoP
Kc8GWpo9onfe2g09ha2gQz0jbxVbEUDzNofGF2Jmyla7SkhG0WkZyaI7abjPNyZZ
Jw4uxCB6aKq8djQj3rIoUYPiW+SqtnwUKmdHM3CGECK+cWHHEZ4m9wsCmJtDibY5
TELeE31KnfvPIR244nr21YqJ3t55VPHZWiAKcfxVNM6E8Zgi4TK0+EDcvd8EnMrc
rWfHdIb4XlGg6BSPd9DcsG8tjOX/Ryw8WUXi5WuxlquEfwws6zYc1yykO3tjqc5r
Gf2yXbCYqU5xVpC2XuddUFA7DP5gJ2jDL+6gRPqDuMgy9dH2Ufvi+mht2yys1soH
X0lZB+4CWdei0S7ThmKku2mXH5xH7ULQMZraFK+iyqjstKy0Ughka4y8X+B/RPK1
uanqnBJASXWzziQVZ6pWpeHNPyWqPmV8DlApez3xXQq3n+pQN2qKKIb8ILxlgzXL
JAsUaJnaEanrTJCwB6PdowXVMrQyzawTniMPZlfRsJhTnAuYTBSxobgejFCCGDu/
itqwAUFobjbvOT4zz86uGp80CLpnrsUieitgAs37dHMmoSBYrhNL/Zh0FtfBWAqx
ikIb+O3t+AF+ig9Ew0MAKFwszObuHNNdmFcZzxNvp29yrSK00wZ2P0JU1QJgq9ur
eyk9oU+btGMmfWknRauXz92i8XhqfiTx6vLnMwqhN7sEIHWHtVtr8ms8SHAlRahe
raO6mHkOQOGAnXcq0RhLdCyD2EhuzUlsfZan7zWlxgE8BUoXds6gTV67m6VgnXHb
SOvGiLFMFcutCVT6wpMlQGw8fxWm8PTD2NnL643Ej0x0HYuUwWuhnjGdd9pyKYJI
n8vEiRflU41HMWK1LLTSDB5CikMuT//tas8/kd5w9cpYMMp6LfXU3TSRTqAmXaxf
j84C9ieqsEV/rE9Tdh4o6PUyMeSFgy/bAXrcsYO8m5bsJwyZrTGolXF92HL1ZrA3
ouqZo9D61S53e59RXqNlxYtxFbTsVghy+YJiqMfyq9XiKP6uJKaA019EZpFT/ygh
CXj3506qtsfllgQGv/QpiMzzGEqcJmTurYREus2TnWT+xDtaoQpWz+2N1lpIumZM

//pragma protect end_data_block
//pragma protect digest_block
AFX68BMYZoW8a3YC2QeQ+kL+iLo=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_GPIO_BASE_SEQUENCE_SV

