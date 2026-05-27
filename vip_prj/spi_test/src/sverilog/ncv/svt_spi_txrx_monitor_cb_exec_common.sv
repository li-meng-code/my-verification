
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
jTfmgwkm2IM0baxI0JixXNa0Th0A4GAuKPpL0I8NLLi5yg152awV8ub41JJVp8hp
uzAf/RolLqabkC/8KLcRW5EZ8KvHJtgD4Qn18ILMbJgzxTVwmRNmq5np8RBFvf8x
B+nypdC4pjFngbw7mCjdBuYTUOksKOh5J/ifCIbtvQeyMFTPC5il6w==
//pragma protect end_key_block
//pragma protect digest_block
05XSOjS8ptJbVL535Dzx730+cPU=
//pragma protect end_digest_block
//pragma protect data_block
/U1+ekBKq9srkZG/lHDxW0FUnSWXSYvuA3PW5PhVHG8SwYXdCEIOc12mJXirv5Vr
hRExbFryVxqZc6gnvVkCpRE2znYBkvzgGZYNmCsc0yeV3vmh0fU1Nd5ZtS65+NVw
HMTEqAoYQsPNoHUKQDJD0GPjZ1jkdX7rbodPBvb12jpck9WpbrvN+0aKT3OFmLU/
qstSVLD66rIjGOvUOFDCv2o4pq6e4c+HZobFDwqkNA94N39Xf/eaJQKJTWXYA7sW
uD0dhYaNSeTVkSnUDoB6/MoAT7za/MLFZdQGWCaajucBiFkRvm1NNELoXHFzNMjD
6LpRXhU5auY0mKcCmGd5b3+swXnQTKnKq0pa6d+LP/wKB1Z/gn89VCi55VSF+E2N
K2RXr9AvgKDZn31pFdpZGrZ7LbFGk3jn2/MyzhbTLiA2hodANeuEhttcQ3LZ/UJs
fwt31McrBBjMle49Z2P2BLHrTsu4TIm0sJ5nkHLCeHcdrbCp+twy3+uBQBPmQept
tyiuBPh9SKCftDKcOfw3BntNryRrQ6RnxNgty0mrA2IqraZE/OQcAIl6zQOI8vRd
S4nKsPISSJysW46QL20ijDE4yAtX1KibPQrVMW5/5Ysfksf/jhkL0tuESetqPXBF
Kd24eB1wciNnrcRsTcknIgSXWuct39VAruvYRx0PmRE=
//pragma protect end_data_block
//pragma protect digest_block
OlCC3PV6zPV54CWpdpLQauMy+i0=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_CB_EXEC_COMMON_SV
