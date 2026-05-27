
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_CB_EXEC_COMMON_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_CB_EXEC_COMMON_SV

/** @cond PRIVATE */

// =============================================================================
/**
 * SPI TxRx Monitor callback execution class defines the cb_exec methods supported
 * by the TxRx Monitor component.
 */
virtual class svt_spi_txrx_monitor_cb_exec_common;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Class constructor:
   */
  extern function new();
  
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
  virtual task pre_transaction_observed_put_cb_exec(svt_spi_transaction xact, ref bit drop);
  endtask

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
  virtual task transaction_observed_cov_cb_exec(svt_spi_transaction xact);
  endtask

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
  virtual task transaction_started_cb_exec_tx(svt_spi_transaction xact);
  endtask

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
  virtual task transaction_started_cb_exec_rx(svt_spi_transaction xact);
  endtask

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
  virtual task transaction_ended_cb_exec_tx(svt_spi_transaction xact);
  endtask

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
  virtual task transaction_ended_cb_exec_rx(svt_spi_transaction xact);
  endtask

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a Beat has been Ended(Sampled/Transmitted) at SPI Interface.
   * 
   * This method issues the <i>beat_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>beat_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual task beat_ended_cb_exec(svt_spi_transaction xact);
  endtask

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
  virtual task flash_command_decoded_cb_exec(svt_spi_transaction xact);
  endtask

  
  //----------------------------------------------------------------------------
  /**
   * Called by the component when Power UP Sequence steps has been completed
   * at device.
   */  
  virtual task power_up_sequence_completed();
  endtask

  //----------------------------------------------------------------------------
  /**
   * Called by the component when Power Down Sequence steps has been completed
   * at device.
   */  
  virtual task power_down_sequence_completed();
  endtask
endclass

/** @endcond */

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
jEEI+uh/sUoKTdXVMi+8dFR5gKwLMmggENOuW9V9M4Df8TVOAcFJwArN0aBoiAjl
HsnEcQnmqBcpImcgAxJdqe/EXQHkhWZyz9aMBRya69ac6fYAkzhNMTkbXuA1kn+f
dFN+Bt9ACwMEf8ri/QG+/BtcrdAbZCKQsWm6nXpTJ98=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 345       )
IYl5ST+GdbsdCwCeTS/ijHH8jY55hRlKjjShdATOHtQgtEsczk9PDMROBuvbat4s
/Wf805nIQ32amQe53+gSTKNcYxECz+t1LH9YolhNhUlMLGOhZDElkzTviKA4nlds
fSceDaGhSMP/epDjKxSofyDTw+JXeo6JEJzvQPTI519iJXkTqPWCs8iw97JkcDJx
l+F4Z59SnvYo0/GYpFcZzifbk/gTVhZ/d5Ahw9LeVzIlvX4nDjtnfUItlo3+0s8O
X7m7ZHJZc5WJJbbiTijE+ys8dyZsh89dbXFoJuwEUlLzzKOZRrD/w/g0hqLaPBrS
lcUkstO+RwDenLli84TWRwDGoquMnioJmgJSbg9J+gUaVHgnrVztQBq073/6wuqs
CmX/Eq38WejTm+4/VcDhAkmpA3eW08WEW7LGdQl5z5R225Uxn6x+cqcfer/n/xsz
0LyvOh9vsa0dPDETkf82AQ==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_CB_EXEC_COMMON_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
MkYeXWGkAgpDUH33rdiYn69elYRs+bhHqtz9n/eZRNbo/6duIwfQHjp1kqPz15gS
wMgjgOPFNXf+CIp2mYaQ+Wp/SQXL5CI1xNI5DdMJUOeTuz4MlCHhK1nm7Zcq0ek9
TV/ycktxrYePCweWXmVrMruGDo6AtT2gygKKUGU4Q7Y=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 428       )
HQOxn21rmC2fJQfsTf2d7Mo46nChCFAXbGnwLg8OU50RYz4B6PTlFv3rhNnSDIpX
Ljlo9VwaIelx2jpKrm6+26OGdY3qBbH+F4rM4kSJhWbXqh5587Sevbaf76arPDs/
`pragma protect end_protected
