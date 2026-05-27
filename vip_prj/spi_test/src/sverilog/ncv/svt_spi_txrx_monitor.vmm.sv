
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_VMM_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_VMM_SV

typedef class svt_spi_txrx_monitor_callback;
typedef class svt_spi_txrx_monitor_cb_exec;

// =============================================================================
/**
 * Temporary class definition used to enable VMM based compilation of the layer.
 */
class svt_spi_txrx_monitor extends svt_xactor;

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

  /** Event triggered when one beat has been Sampled/Transmitted at SPI Interface */
  int EVENT_BEAT_ENDED;

  /** Event triggered when the POWER UP Sequence is completed . */
  int EVENT_POWER_UP_SEQUENCE_COMPLETED;

  /** Event triggered when the POWER DOWN Sequence is completed . */
  int EVENT_POWER_DOWN_SEQUENCE_COMPLETED;

/** @cond PRIVATE */
  /** Event triggered when the EMPSPI Negotiation is completed . */
  int EVENT_EMPSPI_NEGOTIATION_COMPLETED;
/** @endcond */

/** @cond PRIVATE */
  /** System configuration handle */
  local svt_spi_configuration cfg;

  /** Configuration object copy to be used in set/get operations. */
  protected svt_spi_configuration cfg_snapshot;

  /** Shared status object which allows components (which each reference the same object) to communicate state changes. */
  local svt_spi_status shared_status;

  /** Handle to an abstract common class. This class is extended in two different 
   *  classes to implement shared functions between the driver and monitor (in active mode) 
   *  or monitor only functions (in passive mode). The containing agent class will construct 
   *  the correct extended common class and assign that to this monitor.
   **/
  svt_spi_txrx_common common;

  /** Technology independent support for the Transmit-Receive features. */
  svt_spi_txrx_monitor_cb_exec cb_exec;
/** @endcond */

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transactor instance.
   */
  extern function new();

  // ---------------------------------------------------------------------------
  /** Called when a new configuration is applied to the VIP */
  extern virtual function void reconfigure(svt_configuration cfg);

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
nCpfVWu43Aq0KiEcOWVKtpsHDVMfs8XdYRhg//Vb+6FEWjCBPomqPb8yf2ybvx3H
7sooh556nbVzyXTa7cTmjMYsUUSnlJmg9W3w44YMVL2vnQDjqBhH8HEpDinrFDgI
lVk7Zrixy6A6AdXQAHQEcXlvoHzsqUySCgmpT77VJ6t4DZzNBBOEcw==
//pragma protect end_key_block
//pragma protect digest_block
j0fx5IgHgDUnhXkBd4rWh08uc1s=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
S7s6TMh9wG9DQM0dpo4qZVOTANA=
//pragma protect end_digest_block
//pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's callback implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  extern virtual function void pre_transaction_observed_put(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component to allow the testbench to collect functional
   * coverage information from a SPI Transaction that it just received. This is called by
   * the component immediately before placing the SPI Transaction into the output.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_observed_cov(svt_spi_transaction xact);

/** @cond PRIVATE */

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
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
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
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_observed_cov_cb_exec(svt_spi_transaction xact);

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
   * Called by the component when a SPI Transaction has just been ended at TX.
   *
   * This method issues the <i>transaction_ended</i> callback using the
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
   * Called by the component when a SPI Transaction has just been ended at RX.
   *
   * This method issues the <i>transaction_ended</i> callback using the
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
nwwM9Ha3XDOqx6AynKIfGf0BVZCAvonxgau3gTym8UGpl33mHKIft6iYJK/o5Trp
SVQpmE5ajgjFoPY7yMsWcQeqfcEXPQN1urQMxmrsq0NmkSdogIjVM9K7hTqqs43T
9KneV+TdEH+RzZXuoj2hwymK80cOiO8RgZDiv1Kol1r5EoxloAhiDw==
//pragma protect end_key_block
//pragma protect digest_block
w1e9oPTi4lANzwzGiqImfDG8WZk=
//pragma protect end_digest_block
//pragma protect data_block
ctwh4kif4wn1XLFopWr/vFwo/9yfBWoQxiOWpjQL0zyfHRG3U/zQg4eaoxdz2ymL
94kLDyqisZDAd2bv6AD7DaaWPlhB667vrcSOA1oti4X973cfHZncdtQpRgFOPT9A
vComfUgmszMccNIN01g0gpYPx8+u5TVYkQgHW4LHdnqDAaT15G2/nO4rTs/cLpTt
Ud12P63bXVl53HVgWYj8KXXDdEKuxam/iDRCXowr3Vvk0Wmg3R+ABZnP5qA3dkxV
IFx06tOY8fQLgVfmxZXeyKCHz6OE5tZuFnweNUnDRRC8bnuePqX+ZEQPVtg0f6OO
oRdyjAgq+qs9J5TAanzUkm3A6dozeia0In9zwkFzIEmwgCxpayQAyQ4033PSXD4Z
t3EZ39r5xfQnFAN/XngyTEGb6WwJ+5/A2/GA18qclRiyajv2OhhBLAaFNUvxAoCX
LEVCBQckmyWYmDlrPCjFAHO3I/Y6CmRzL0HSSdyM5boNo6QEmDy40t3BS+yKPyqZ
GC/qZG5hjR6TZXQ6h4B9InovbNGFw+JzkN8wsfLec1PEBPe0/zsJ+M3ZejLRuBk7
j/UcnfujeM1cSBu9kf7m2aEwGigA6l81EdishFVFubM=
//pragma protect end_data_block
//pragma protect digest_block
XRe21noP3s26vVbXtWORQHgP+eg=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
NXGsRk+yd9ND6nWS18pggmB3LLxoRfuxpgx3pEfcoL8OgImt8FlYy8O5BQLNy8OG
xkrdXrhCrbyN/OCF1sVH0wyRcQQhYaQksv6LBpaBUXTC3bH0jTGz21XYoeGXkTyA
ohyoT+vWcqiq40BosgILd/BwB0ZnMpOfwz/9CndyMpP4bcsCHki3tg==
//pragma protect end_key_block
//pragma protect digest_block
5ecsp9owFRx4amXX4NHlNTO4WUA=
//pragma protect end_digest_block
//pragma protect data_block
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
TZGLnhi9m7OIfrZhlvWfXQ==
//pragma protect end_data_block
//pragma protect digest_block
s2m3hNm3sZkRLoeZXLVEcWtVpIc=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_VMM_SV

