
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
u9DI3QUKusGqYylLwC/Uydg9KH9OolBSVZVCkD80OX+AbUae96lTz2bIpp9ee1L1
CXyZ9MoesxaD4FdPf2igoX8AYLSwL36b4J5RhAfWmLH+vNAUNw9s8z8f5YMW/vH6
J0Vx6q6wTQN0l4hSZW/ssgjBMXSB7INfabwjxdyE6a5BCFYLjFcrkw==
//pragma protect end_key_block
//pragma protect digest_block
k0Rcv+RtKIYHzp0EclO1idO2Qk8=
//pragma protect end_digest_block
//pragma protect data_block
5WdIeWPs3ilyCi0z5lF7nuUs4lRSsb7neYo24D5ixipA7OKsIaJ2jzM8e5vr0+iI
jUdIQFeXruCTXWHWlSe2i3x/JOPhDV3cG0ZnX6epiAzoC08uzBkZ9a2dleZuwv0y
dg5DBENAeXl7/lxFnE56NaWoM55fJ3aGdi/Q9hxdweQ6dInOc0jYE8/cc/3OUBTq
ob3+m+jey8CI9gArBAzXAObzNxqJtI82khYtaGqCBQyfC0xsBCOS8Lx8JN3Db310
caJTIAFDlw2YC+Ca1wQYu+B/yLZFsdsQY7lDcNNQCs4AAfmNWW+v2XIZ3ni2QtR4
91+cfi0VDJ8BMITNJ2bqGl36Cl4ruHi3wfm0rRSB0sjyKbYUc+vTBRKsnWQbnzED
wU1m32JUXSkzHbhRQRLjZmB6N36Jw/0JFZovurfCzitDgm+kPmid0s44s0pJLI9d
Xc1oh1cyt0dUgcbCpgh6XhmzfDGeJSZPRbCTGA5eR+ncfH9kpFVHWO2cMcjGQveA
9aB1Y8XsKw/Ou+MwaRZi+g==
//pragma protect end_data_block
//pragma protect digest_block
yIeas8iNfQjIxxrYqKlYUrmLBD0=
//pragma protect end_digest_block
//pragma protect end_protected

endclass

/** @endcond */

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
RrV73EHQr0a3U86mkPfK4iVRH1tt1sCcNAx+rdLLpwi6v+U/zHCpN/eDZKRY4PV+
heW/m5ZCzsxv1BhbGXVzjooNexIsxqtHg3SqVmq48tqShBNbIBHX6vMufTGSEOME
C/Uf/6uYJ46YtBfRRslrdKJsQGfrlXn31d+u+AUoj5h3/1AnHa33+w==
//pragma protect end_key_block
//pragma protect digest_block
0Bpaqww27eoROsUx7FkKEqX/Y/k=
//pragma protect end_digest_block
//pragma protect data_block
xKxCiqe6rGPThYk0hrTVynuJafDmehqOF/kBxR3RLFNPfXKi4PTUnEtKbK4Yii2y
A568yYO+5/KdHPXvsT+t87ztjRvg5BcoqZrTUtm8B+Bk8RI8MHs7DXndqheaj2kh
V+xYB3g9H55osOGj05rdDHhOdX71fQ6Bz9dhj1dCjMKrXtcbwxNmzCC6YhphwnZ/
ftcKKz//aLDG1pPs0VEdTj9O85RRtA7StiX1rwKhDzS4Da7SfK3nAhJBnVdVefyE
lfFP+FpAiaNT8jVUfJmGpiKEgmidXoNOW97XGR+8v6B/S5dwp048U8nFM9yaIZ8d
BM5EIipZjHiTc3m4XW6vEsvwGSKcyVspYGlZQRihQo3BUYf8LbkxExzLJavdoTsw
iI9xfePO45JV21VLtnGS1YS/NbE/LSVL2AYLyGoBgxU6res7xyf0caerAiMbN+cz
CW7nuf1zh6Ad8pRgNeWnDfQ9KdSmJoMxY85cxFSxnqHYsfjizGoP2l8CXgKvwLYr
/KL3m/kexs3/nGYzrStyX4lbITKxBMUgaFegz7T3DvHgCZNAsOGHjUaEmnIMMtK2
Bep1oxPmmul7D7UlR9YAWZ5wc9/8fHDQbBsqqHFLpEJGl8AUwpj4JhVV6HhxKTY4
rISEyDyW70/gD3qoXROIZQ==
//pragma protect end_data_block
//pragma protect digest_block
HuWQVIJUGt7q0tNe8Pzc0uuAQ64=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
c8eEuMk+RPs3adZ6KXFZAzG+KbSB4/HCtKThgt0qvAoe4vsC7TfdJ2Een59a8IE6
Wv6G/kGhqW/n22NsvO5IEWzdrz6XUGDcv9Axyda1n+zXaVtboQVZjBT8pDgoZvtO
rWETMZpKXDPzTCeN4SijkRVLzGNFqQ6k7f7NPIautPVMk/pnVTRxbw==
//pragma protect end_key_block
//pragma protect digest_block
kNvFTFZ5AVc6dRh90mooiU3LYl8=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
S+tlPOpaBx+7NvNvVrTuJmXtqJ4=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_CB_EXEC_SV
