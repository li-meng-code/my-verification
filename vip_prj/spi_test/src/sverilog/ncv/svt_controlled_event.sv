//=======================================================================
// COPYRIGHT (C) 2012-2017 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all authorized copies.
//
//-----------------------------------------------------------------------

`ifndef GUARD_SVT_CONTROLLED_EVENT_SV
`define GUARD_SVT_CONTROLLED_EVENT_SV

typedef class svt_non_abstract_report_object;

// =============================================================================
/**
 * Extended event class that allows an event to be designed to be automatically
 * triggered based on external conditions.  This class must be paired with a
 * helper class named svt_event_controller.
 */
class svt_controlled_event extends `SVT_XVM(event);

/** @cond PRIVATE */

  local svt_event_controller controller;

/** @endcond */

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new monitor instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name
   */
  extern function new(string name="", svt_event_controller controller=null);

  /** uvm_event method that is used to trigger the suite specific trigger */
  extern virtual task wait_on(bit delta=0);

  /** uvm_event method that is used to trigger the suite specific trigger */
  extern virtual task wait_off (bit delta=0);

  /** uvm_event method that is used to trigger the suite specific trigger */
  extern virtual task wait_trigger();

  /** uvm_event method that is used to trigger the suite specific trigger */
  extern virtual task wait_ptrigger();

/** @cond PRIVATE */

  /**
   * Method to implement a conditional check to ensure that the suite specific logic
   * which is used to trigger the event is only initiated once.
   */
  extern local function void activate_controller_condition();

/** @endcond */

endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
8NkPjgaqNJbeR+Iap0EWu4HCsF5v60aW5Mt0eHh9xhEReGGjPE5jlVNQyeZaWI3h
GfP1ZXt+SzTinuQKhDSgZfE8na0FGOS0criFxWqAvdyZctFjSjy3lGCy3uqrWSzF
i3GpS0CoZlJm//ptYUE1rLgoRoAEmEVFD+3N3gmIfvl9/hhzktd0jQ==
//pragma protect end_key_block
//pragma protect digest_block
4XLrc2HjTgD+nQ/vJf+P4p7Aars=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
cpiTxaYGPUXbwiKoHZtcMB/6nsY=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_CONTROLLED_EVENT_SV

