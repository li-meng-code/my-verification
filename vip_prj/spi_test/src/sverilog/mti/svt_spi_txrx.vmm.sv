
`ifndef GUARD_SVT_SPI_TXRX_VMM_SV
`define GUARD_SVT_SPI_TXRX_VMM_SV

typedef class svt_spi_txrx_callback;

// =============================================================================
/**
 * Temporary class definition used to enable VMM based compilation of the layer.
 */
class svt_spi_txrx extends svt_xactor;

  //////////
  // Events
  //////////

/** @cond PRIVATE */
  /** Event triggered when the SPI Transaction is first initiated (TX) or recognized (RX). */
  int EVENT_TRANSACTION_STARTED;

  /** Event triggered when the SPI Transaction is completed. */
  int EVENT_TRANSACTION_ENDED;
/** @endcond */

  /** Event triggered when the SPI Transaction is first initiated (TX) */
  int EVENT_TRANSACTION_STARTED_TX;

  /** Event triggered when the SPI Transaction is completed at TX */
  int EVENT_TRANSACTION_ENDED_TX;

  /** Event triggered when the SPI Transaction is first recognized (RX) */
  int EVENT_TRANSACTION_STARTED_RX;

  /** Event triggered when the SPI Transaction is completed at RX */
  int EVENT_TRANSACTION_ENDED_RX;

/** @cond PRIVATE */
  /** Event triggered when the EMPSPI Negotiation is completed . */
  int EVENT_EMPSPI_NEGOTIATION_COMPLETED;
/** @endcond */

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transactor instance.
   */
  extern function new();

  //----------------------------------------------------------------------------
  /**
   * Called by the component after pulling a SPI Transaction
   * out of its input channel, but before acting on the SPI Transaction in any way.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  extern virtual function void post_transaction_in_get(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  extern virtual function void pre_transaction_out_put(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component after placing the SPI Transaction in the output.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_out_cov(svt_spi_transaction xact);

/** @cond PRIVATE */

  // ****************************************************************************
  // Methods used to trigger callbacks and client accessible methods at important processing points
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Called by the component after pulling a SPI Transaction out of its
   * SPI Transaction input, but before acting on the SPI Transaction in any way.
   *
   * This method issues the <i>post_transaction_in_get</i>
   * callback using the svt_do_obj_callbacks macro, as well as the
   * <i>post_transaction_in_get</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the transaction descriptor without further action.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task post_transaction_in_get_cb_exec(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * This method issues the <i>pre_transaction_out_put</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>pre_transaction_out_put</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task pre_transaction_out_put_cb_exec(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * This method issues the <i>transaction_out_cov</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_out_cov</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_out_cov_cb_exec(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at TX..
   *
   * This method issues the <i>transaction_started</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_started</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_started_cb_exec_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at RX..
   *
   * This method issues the <i>transaction_started</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_started</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_started_cb_exec_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at TX..
   *
   * This method issues the <i>SPI Transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_ended_cb_exec_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at RX..
   *
   * This method issues the <i>SPI Transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_ended_cb_exec_rx(svt_spi_transaction xact);
/** @endcond */

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
pNT2Mp9SV2fqjS89uQK9wqyuy+fIEJoEiv6HF+9flLcn+MUU643OgLjO0Kmk/m5O
2SyPLni3ayaP2rP8qgyy/o81aCWU+o3DaSDm2kZAG7AcvEzeYwYsNYQLyEX0LwCV
huqW7OKcyFnbVw1kfRJsW2YwO03Lmyaw6fctBfAvBgE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 283       )
WIUQzPFGDPqXQ/vysjd6unMFFi7t+DohzeYN8BwWK2+dro4KKTY7bXbdH4jZ+/wk
nFLNvsEgog7lF2A23XUMEaVgDfAunGtZNxQLIPINtbWA6128Ju2vZJGyIzJB76hL
1k/HJSU3CRNULGZDkMQKbi5SwhZb2B9BI/1pRqF43kJOc+3poZtsCA36/+CZOxw9
yF/QkgTA2yxlsYdC9UKaCnqd+K1J3Pv7KntgFR3DQ7FdaDFJMWJXvo4g6N8ohTnt
uNyqmuitIS3ZYLwpBUOtR3RenNVU43nfu2Olym/NgEgjKm/ojTszCEHgQGw57HnP
VBspsAzm5xJzqmmDFyrtqP2DetDJvgxmYE+IIXgUyqmyRz1cl4pM5KLBEHyEItxb
`pragma protect end_protected

//vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
AEGaiLTxYA3oZw+M5bZZLOf4vTtCor9Dma2q3V48+XeCsyfJLGr53CdeRpl8Ghhd
+4ug7AOLokZA9mDlp4W2ZmlaB3mdUiqXJ1ZYxG2z1df1R1Rl+Sl5ZgRqqg7xgfr3
ZU0HRE498BjFH3j0hN3JrgS3oi3eqFkttB8s6wv3FYI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2453      )
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
5+F43JCVr1RNFskKjUzWhw==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_VMM_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
OGLM1+rR+l1uOkZr3ZAE1F2xQv1QWmSBJkSU03XNxNsRQAA2ecql2R1uuTXon5Pq
l8BHq8iNdiHKMDPdfEXB4jqzXK1PTk+8jwNat+Iqk5lr2cTPHumB7JuEl4/3iv3Q
bUsPL0H0EQ/wS1KmQxhOcWcTsfB1NhcTSmqXBYU1yJM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2536      )
NT3/bV+fKwSv6gIjY3Ar7lWOaiJ5Hzqil+jPbUaIjY+G9JYT99p0f/tP0iFTTpF5
56gUzohtT/eSpMJDGEQrkYc3rKO1+Eihyh7PpJWnhOXO0osZ5agXLs9a5mwqModT
`pragma protect end_protected
