
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
OJIi0VP51FkoHpjJiQ2EB2vVdrL4tvO6U0QzV9OkpkHLvPgvyDykkydXEpsFJB19
LB+HZNGcoWhnPjWw6YM5y66HUQU0Yw92Zmza5mlDaSyFypebdasqHAl52KU3PHQm
PgQkedhTrwkvzyZaOkkB0i1r1M0ujTx8CA16b+OZTX8VSr94Xaqovw==
//pragma protect end_key_block
//pragma protect digest_block
rf1OuX43M52xjD1Yp3tBZYdF2B8=
//pragma protect end_digest_block
//pragma protect data_block
BM/RGrpgo8Zm6Iz+t3i5GBlRUHsWuFYL6nfCgCu+0npp3L3HVeK5C/OoJW81VmEP
jZ6fO56f4MBOW0e7DxW7nqLUMM8Kl8G8qy232oKrfAR/Yj3GqYltm8QXZdJ64XKY
oowwUvw4voq+Wq4W+FLxAtSg8ulpQCDkq+azmKVjMKPunefBqZGAK0ZxC80ZbGs4
8uYt6AxTs3r3bfcOAZ2X3JNvaDpw9cXgbbzaNQu8ZTMT8h5et/tfyokkOig1u839
xPPH/O5HN/xjc1SGpgrFKFq9JzIBcW2JGGz7PXgGqKsKOvVxB5ZJR1A/rH3Azzff
P9vF/oI93MEVoGJDUhUJE4BAgpwZbQWrzIteCnsHuAtdtwoC0QLq/2qfFodOqoj+
MXrblhCVEoVutZoRIgHrXNuyMioNf7LqC+Wm4eS+gTJtYAcL2WK0UOKt/jj8t0W7
gTriM4qWhgUovumUs18vfaUu1K41hoNEZwQbz00Pp114L8MxhTap1/JKXW/B3782
bwTwlLJKhpXWt83IyCxHbOG7y/apfdr0Tt04YpDVWNvC0AJpmg62E8Yvf5yMpWYv
wKmjvW5NKc5jizXlEZgWsg==
//pragma protect end_data_block
//pragma protect digest_block
Ny8slGqNbB/uM7yqlzUf8Vo0yr8=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
FsGUBa0ETfJ7c5i4WJRWExI5fbAx5i24djbNPIqohmZHwgbe8WJkiR3Pqkmwb12c
avxB0tERMG9vDR5Pja2jcpCJSMiTlxfmAJa91ppFoKTxeiFsTO+7ct8NpuXHLD46
S7bkAzyAwM/eTJ8h1E9aJ8WUT8aDr2JzgIMAUyGTLeOSx3MbV7Fq2g==
//pragma protect end_key_block
//pragma protect digest_block
kU5oSKCqZzKRVC0tZiQmWlEvEK0=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
uzEvFiPxy1LrC5zuAZlx7hKDFbw=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_VMM_SV

