
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_CB_EXEC_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_CB_EXEC_SV

/** @cond PRIVATE */

typedef class svt_spi_txrx_monitor;

// =============================================================================
/**
 * SPI TxRx Monitor callback execution class which implements the cb_exec methods supported
 * by the TxRx Monitor component.
 */
class svt_spi_txrx_monitor_cb_exec extends svt_spi_txrx_monitor_cb_exec_common;

  // ****************************************************************************
  // Properties
  // ****************************************************************************

  /**
   * TxRx monitor which implements the callback methods.
   */
  local svt_spi_txrx_monitor txrx_mon;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Class constructor:
   *
   * @param txrx_mon The component supported by this instance.
   */
  extern function new(svt_spi_txrx_monitor txrx_mon);
  
  // ****************************************************************************
  // Methods used to trigger callbacks and client accessible methods at important processing points
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * This method issues the <i>pre_transaction_observed_put</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>pre_transaction_observed_put</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's callback implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  extern virtual task pre_transaction_observed_put_cb_exec(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component to allow the testbench to collect functional
   * coverage information from a SPI Transaction that it just received. This is called by
   * the component immediately before placing the SPI Transaction into the output.
   *
   * This method issues the <i>transaction_observed_cov</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_observed_cov</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task transaction_observed_cov_cb_exec(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at TX.
   *
   * This method issues the <i>transaction_started</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_started</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task transaction_started_cb_exec_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at RX.
   *
   * This method issues the <i>transaction_started</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_started</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task transaction_started_cb_exec_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at TX.
   *
   * This method issues the <i>transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task transaction_ended_cb_exec_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at RX.
   *
   * This method issues the <i>transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task transaction_ended_cb_exec_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a Beat has been Ended(Sampled/Transmitted) at SPI Interface
   *
   * This method issues the <i>beat_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>beat_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task beat_ended_cb_exec(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when Flash Command has been Detected(Sampled) at SPI Interface.
   *
   * This method issues the <i>flash_command_decoded</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>flash_command_decoded</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task flash_command_decoded_cb_exec(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when Power UP Sequence steps has been completed
   * at device.
   */  
  extern virtual task power_up_sequence_completed();

  //----------------------------------------------------------------------------
  /**
   * Called by the component when Power Down Sequence steps has been completed
   * at device.
   */  
  extern virtual task power_down_sequence_completed();

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
cO07k5ADF0rCwekD9Ef1N76YoVL5z5vaqDf2vNNPxfulko+kuJa2gw7ZZziquJ2i
KUAKol+wi6f1z32+3zuyM+tk4Z8bCd30+vU5dAE8hzXObuZIKhXvcY7ylZKnV8vr
+Cu6vtKzcxiRDo1diDiMafPlQZh+m6aeN7EiEY1YXLg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 229       )
prZv2mGoUzPEGRia4/xtBrLLc0o6vEJgOe4b8j51puqcSagbaDSdYlbB1FgJbHQV
2GQN3ct3qWoZ1a2KZmzbpvyHj2DLQo5drOSFBPB0dX8z6NMcjLZefJxyWPZ0ApVG
CxPdwhfpeQhgzyaC90D1tKr13E166EM787Ku+r4jBrXQ8a570D37bMs1pq0IDBj7
0tMaKpVr9oc7GdouUuop5rdJmrh3Cq7t30BfpxFpGFhRmxAlcylUmJbtccvsUmFZ
5kasK3a1DivCD7fQdEDvYowPm6F6mbVIlT/IDggBMsJBlkjMtF6tThC4n49RS68f
`pragma protect end_protected

endclass

/** @endcond */

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
TnU+tknrH7B9Y9X8zXX9tAPnq/wD30Q2fvQJjZb758zsusmZ2v5qDnLZcTBDfxe9
OSwsZVy3/i+FYmiP6H8opEt40isVvVPAb3P97pdPKFLMmkOwUpsx3J7DsEPPpjRI
jerI5lJdUdV36bjM1gjJyVqslsDpMvnZcOIOdAoPrpA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 556       )
ftHlfDhkCvx97QnalFjZzId7PFLNo5H4iuS/RuX/TEodG3WEbzFo+yH22fCPv6G9
e20Rq9DNlIRvhLsfbw4502iOqVwxy7YCtf+MIlZ/T718kyn+uaUk6cZWVoA1ds7z
9OtEPkWe29Yq62cucpndRYaZjrm7xmDlEbTLHFjUnvtSHKhnU6eZMJ1v8dxtLw63
3wm5ncdHeVQ+/GdTaPlj0PTIrFmkHamwxyCtSfND7oT52MU7sFXYQomOhqq0tKk8
CUn7SWTSlseD7RylCdIbCxu6EUZrsWoZzCjHZTlhSBW4KWL8g3t8ofsFlwAT89m/
yVKFe8y+bv7v8ND5/K6afz5H5hc0Y6CJjzn7ghYLIlSU5dpCZudQKStn18n23+Kp
3qNCyIAXr/gkqcHxgDmHvk8fMurJr1WJSt7VB+A6HMWPHWWKsN7wFbHbeoMkbCHo
`pragma protect end_protected

//vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
IMeMCBN9PgpuIQt2UobaN+28iR/zn/ECenIe/gWMi0gls7z2S1SDFYVsJ4oWm5OR
RlZreDPuslfcLw06HlrEX+2xySPTYp4po5zNBuJeiNqCt9VxK4h3VKBWIXJUtHzs
J+7r+q5wR82ME7UOYnfpBPxL3f9WZLPF+Co8xUVVCvw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 6376      )
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
NhqquNTyRaH4vdCymcBi3A==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_CB_EXEC_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
MaH/8Vk1p5ZZ14YV1++lQ5Ybtnz+DhduCCTvJ+j+8ZS59NV+h8QqBNieJKXyrouJ
UFUenFfr81flT+yUJwWHLxS5DqTqJhYxLfNM0itp6UnRGRbmLzrV1CmZ/Pvkr0Y4
rhyGQslBIlLsFrbAmPAGxhj1Y4IveYhZ6Wt8B7Azyg0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 6459      )
MI5TWUTtvL2K0PdO0Is5qEX94Gm9Sx2mhflraZeQwD1pHh4aLavaqVHf1ZuCNlYU
4j32eC8usQuImD9BLRIGfzgddaYfHNd6FllWZrY1MvdcvWqwdbpU3xTHNwwv7XiX
`pragma protect end_protected
