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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
JNC5Cap+p4mBwvAmgzs0Pdxvl6bWJlsIIYnFMeE9TrNx4iNZWZ6vp2NgX4qywvie
smk/Vp4uN2qHQ2Z6yy115livhmoVWlWkqL794ZZTJMfIVY7wwOYMDAKYdlqBnQv7
n+S0hBWe+2RtxthNZUTrb/FfutDe6NB8vuvm2Clliuw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 793       )
kDGEJT/8Or0r7rb7OspmVb1SiY0+dHVTQUfWiQs0+zC08tNXuftufCC7moGZKuqY
JXX35Plg5jXjVhmlbZNF+nWqXMNKzmKZtOWpOeZpSSGjDX3SGbWS45doFrHrCxAW
aaH6YbHbtwzScnN12d0ArvCMcb3cVaQId/gD2/t4xSQym3UHo1csVQ4g+JeDzalC
bL3UK5KpXLj1vbpU8lo8IhM9z5TeXkSqA29C8t4qKbmOzwuHlTVTU19bN8HAMOeT
XQW3hILl17gHhHWlQzuQplJujvBSiHZpub+0XZQFLCVZETAmVgV4taud0y8PoiXM
HqBr6iHDzt6tFDgwc6kaYBi9QLzYSWC+9FaJ6yaN1fQ5zSXNqkbJ6Txmy//N+6oX
chPFL9HZ057drPcDXD8h33RtXGFP+Tj5gCxVhY4vVqAxXtGr2zDrukOAQkAQDIfy
6O8M9P7AuLBpY8kAdTV9FZxyfvEmY0Ff9Kk5i/7Q16ctVyq0oPLRM3nMX9lkxoe5
/VUOY0rfOSO8iFyiecJnYEmTLrcmBWEbRxM4C6LyddYIIuKKN7axqJMbUKcEDmQG
NEf6PPaXkGka3BZC7Z5ZOKSEpomo3YzYQp6HRKZSLlLd/d+bWJRST0+dO2u8bKTD
kj7ryZsWU2UVKwPirR1IEmk8tdzNfp99gP7VlDuePE6VowjijGZV2asp2dxWdNdV
1rnRePat2ezw42iGXt7/zghV9oLyupYCVBSPsJRXKFjem5KCBybuHBqCCRDhBwdh
o6mQy4TfVqkcqUK7Jnc41wFBIHwAg/jrgbNJ775Wc/KWGPZw0y7S1aJpEbF/65qw
itZgyo/qZ7siQafuJFKSnodoM/gVIO3jFo5YlzdD6aJTnLW300wEW0I0sJsiMunu
cAUbLdMC2nX6f29eGctFBuF6IdCyKmTDP1fkSdUpnGh0rkM64xjAtOezDujcSbna
euOC+ESp0FGOlPpZKTGb/pO2roibGCjOqJjGjv+vR9Yq95y5F9lIIRFOWYvzj3Q7
WBHNltpAJeTVi7xJhQbexXFcZtsxgeCpMJkhN6NKeno=
`pragma protect end_protected

`endif // GUARD_SVT_GPIO_BASE_SEQUENCE_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
jYt9bsPYw03CByak4TdEsqt4Xp1r+qmzIkBKMMksipt14EZg6Vi32mkqRd7t0awF
zDC57Q3+eJgjcTGsUARRcJdTcygGv3/MqasqDIFolgTg3BSOAiVkjyGKf7E0A8uJ
e/J9q4jeAlsGIJFGNKtBn9laenDBjZjnPJck4nsSvUM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 876       )
Mb3OlOFFSZbzgGm0fTPJKew9b33EsxGyZliFSxXihD3KaymETM4u0gBFS2IfW8SR
6NsJqyiwqykHF0KDUKxLMqTPwb935rdChpLiu683plpQv/as3b4D0W5TlLqxDRhU
`pragma protect end_protected
