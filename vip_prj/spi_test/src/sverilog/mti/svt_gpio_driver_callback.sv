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

`ifndef GUARD_SVT_GPIO_DRIVER_CALLBACK_SV
`define GUARD_SVT_GPIO_DRIVER_CALLBACK_SV

typedef class svt_gpio_driver;

/**
 *  Additional protocol-specific callbacks
 */
class svt_gpio_driver_callback extends svt_callback;

  //----------------------------------------------------------------------------
  /** CONSTUCTOR: Create a new callback instance */
`ifdef SVT_VMM_TECHNOLOGY
  extern function new();
`else
  extern function new(string name = "svt_gpio_driver_callback");
`endif

  /** 
   * Called after the traaction has been received from the sequencer, before its execution
   * begins.
   * 
   * @param driver A reference to the svt_gpio_driver component that is 
   * issuing this callback.  The user's callback implementation can use this to
   * access the public data and/or methods of the component.
   * 
   * @param xact A reference to the descriptor for the transaction that is about to start.
   *             Modifying the transaction descriptor will modify the transaction that will be executed.
   * 
   * @param drop If set, the transaction will not be executed.
   */
  virtual task post_input_in_get(svt_gpio_driver       driver,
                                 svt_gpio_transaction  xact,
                                 ref bit               drop);
  endtask

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component after completing a transaction or detecting an interrupt condition,
   * just prior to placing the transaction in the analysis port.
   *
   * @param driver A reference to the component object issuing this callback.
   * @param xact   A reference to the complete svt_gpio_transaction descriptor or interrupt
   *               The transaction must not be modified.
   */
  virtual function void pre_observed_out_put(svt_gpio_driver driver,
                                             svt_gpio_transaction xact);
  endfunction

  //----------------------------------------------------------------------------
  /** 
   * Coverage callback method called after a transaction has completed or interrupt condition detected.
   * 
   * @param driver A reference to the svt_gpio_driver component that is 
   * issuing this callback.  The user's callback implementation can use this to
   * access the public data and/or methods of the component.
   * 
   * @param xact A reference to the descriptor for the completed transaction or interrupt.
   *             The transaction must not be modified.
   */
  virtual function void observed_out_cov(svt_gpio_driver driver,
                                         svt_gpio_transaction xact);
  endfunction
endclass

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
EMC08snt5xYvT7mektLXwYi3MRTNvwj91xkjw6/ADak7+3oH5yezCoxL8pXpOQ1L
zFnkZ3MYTKNdtaBwcUCmtkSMLvz7U7nmmZ3f3yh20h27gCIDaAarx0ZlLHvgHTb7
QqkFmNVKp8dpjEoHyLqf6C6XCc8By7Ymd73Wnp9FQ6o=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 430       )
zUHJ+NkWTvSnazdWg8d40rJjyVuNq9HsZSWWdrkyHJjhJEgUl0svASR3u/OZgwCu
lqpDR8jUiYEUfAxeG1HcwKZAUpnevsDrfeGbJ6sCRSG0hTkMMe7ez+Ejho3GV3j+
yQTVibcFRpX91bRDoFehCZWL/swlHiS6GaXQ6UY8BWOCKrmjFvOEqovOQtzvgXKX
dPu22eniYRzVuLZZ31kf9FTmOWMiwJoCoBenGXKu7d1UGZWjsJ0ofVCZ3g2Wpe0T
XDRbom10LSWCXreis8Y+ijVYzaZ+o+2MVKhJsvxTKLZ8rxSKPS2s0NvMoNoohoSv
oYE1Dx5qhQqH/TAqmT4d+xej7FN1QpyzZafqSOj4G3Lvrq752kghqlQGcZSvhh74
R5/IpSgrcdoJTsC18uMvyWAztW2V17ydfZnj272JtVkiPTN8iCgQqlvOAAW//L5U
pNj4+z5Bc5MexGywDGCpg7ORHSpwphnuDEDeqwF3I4FpmhMr9piRu/WrC4pe1112
5uPR5NCZetJMMdcl3jDJiQZKv5ndD4b3VLTeyPorf0LQqkC5Lr+mN8Mf2SDfj8Cr
`pragma protect end_protected

`endif // GUARD_SVT_GPIO_DRIVER_CALLBACK_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ho6GJNYIV7QnI8wHrP7cu5uaUGInYAHj1sLJDwwSYAxPgpQSRBpdPraadvJEThMW
atsVXAIFltEIWqOuWQlnWpDzqoIwGiiR6v5W6Ua1M6PfF9+Y3tx2D/cpF8/jHxbF
eyoVRV13L6jQTUCcuE6yDD4cz9MVCLamR247Yi+eVMs=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 513       )
qxib6K+VAGcCrJsye4rU9KzkFbkfSLK+04cjBZz3WmWj9ybBK6gbuZ3M5ylF8lle
VDkdPycoZIK7U1c+ZTp/EdczZDOA6RtuT7vJ6Gh93lUPdE7T9vxI3keveHIUm+ij
`pragma protect end_protected
