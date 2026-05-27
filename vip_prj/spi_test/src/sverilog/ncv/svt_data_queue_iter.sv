//=======================================================================
// COPYRIGHT (C) 2009-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_DATA_QUEUE_ITER_SV
`define GUARD_SVT_DATA_QUEUE_ITER_SV

`ifdef SVT_VMM_TECHNOLOGY
 `define SVT_DATA_QUEUE_TYPE svt_data_queue
 `define SVT_DATA_QUEUE_ITER_TYPE svt_data_queue_iter
 `define SVT_DATA_QUEUE_ITER_NOTIFY_TYPE svt_notify
 `define SVT_DATA_QUEUE_ITER_NOTIFY notify
`else
 `define SVT_DATA_QUEUE_TYPE svt_sequence_item_base_queue
 `define SVT_DATA_QUEUE_ITER_TYPE svt_sequence_item_base_queue_iter
 `define SVT_DATA_QUEUE_ITER_NOTIFY_TYPE svt_event_pool
 `define SVT_DATA_QUEUE_ITER_NOTIFY event_pool
`endif

// =============================================================================
/**
 * Container class used to enable queue sharing between iterators.
 */
class `SVT_DATA_QUEUE_TYPE;

  `SVT_DATA_TYPE data[$];

  function int size(); size = data.size(); endfunction
  function void push_back(`SVT_DATA_TYPE new_data); data.push_back(new_data); endfunction

endclass

// =============================================================================
/**
 * Iterators that can be used to iterate over a queue of `SVT_DATA_TYPE instances. This
 * iterator actually includes the queue of objects to be iterated on in addition
 * to the iterator.
 */
class `SVT_DATA_QUEUE_ITER_TYPE extends `SVT_DATA_ITER_TYPE;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  /**
   * This enumeration indicates the type of queue change that has occurred and
   * that must be accounted for.
   */
  typedef enum {
    FRONT_ADD,      /**< Indicates data instances were added to the front */
    FRONT_DELETE,   /**< Indicates data instances were deleted from the front */
    BACK_ADD,       /**< Indicates data instances were added to the back */
    BACK_DELETE     /**< Indicates data instances were deleted from the back */
  } change_type_enum;

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /** The queue the iterator is scanning. */
  `SVT_DATA_QUEUE_TYPE                  iter_q;

  /** Event triggered when the Queue is changed. */
`ifdef SVT_VMM_TECHNOLOGY
  int EVENT_Q_CHANGED;
`else
  `SVT_XVM(event) EVENT_Q_CHANGED;
`endif

  // ****************************************************************************
  // Protected Data
  // ****************************************************************************

  /** `SVT_DATA_QUEUE_ITER_NOTIFY_TYPE instance that can be shared between iterators. */
  protected `SVT_DATA_QUEUE_ITER_NOTIFY_TYPE            `SVT_DATA_QUEUE_ITER_NOTIFY;

  /** Current iterator position. */
  protected int                   curr_ix = -1;

  /** Current data instance, used to re-align if there is a change to the queue. */
  protected `SVT_DATA_TYPE              curr_data = null;

  // ****************************************************************************
  // Local Data
  // ****************************************************************************

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the `SVT_DATA_QUEUE_ITER_TYPE class.
   *
   * @param iter_q The queue to be scanned.
   *
   * @param `SVT_DATA_QUEUE_ITER_NOTIFY `SVT_DATA_QUEUE_ITER_NOTIFY instance used to indicate events such as EVENT_Q_CHANGED.
   *
   * @param log||reporter Used to replace the default message report object.
   */
`ifdef SVT_VMM_TECHNOLOGY
  extern function new(`SVT_DATA_QUEUE_TYPE iter_q = null, `SVT_DATA_QUEUE_ITER_NOTIFY_TYPE `SVT_DATA_QUEUE_ITER_NOTIFY = null, vmm_log log = null);
`else
  extern function new(`SVT_DATA_QUEUE_TYPE iter_q = null, `SVT_DATA_QUEUE_ITER_NOTIFY_TYPE `SVT_DATA_QUEUE_ITER_NOTIFY = null, `SVT_XVM(report_object) reporter = null);
`endif

  // ---------------------------------------------------------------------------
  /** Reset the iterator. */
  extern virtual function void reset();

  // ---------------------------------------------------------------------------
  /**
   * Allocate a new instance of the iterator. The client must use copy to create
   * a duplicate iterator working on the same information initialized to the
   * same position.
   */
  extern virtual function `SVT_DATA_ITER_TYPE allocate();

  // ---------------------------------------------------------------------------
  /**
   * Copy the iterator, putting the new iterator at the same position.
   */
  extern virtual function `SVT_DATA_ITER_TYPE copy();

  // ---------------------------------------------------------------------------
  /** Move to the first element in the collection. */
  extern virtual function bit first();

  // ---------------------------------------------------------------------------
  /** Evaluate whether the iterator is positioned on an element. */
  extern virtual function bit is_ok();

  // ---------------------------------------------------------------------------
  /** Move to the next element. */
  extern virtual function bit next();

  // ---------------------------------------------------------------------------
  /**
   * Move to the next element, but only if there is a next element. If no next
   * element exists (e.g., because the iterator is already on the last element)
   * then the iterator will wait here until a new element is placed at the end
   * of the list.
   */
  extern virtual task wait_for_next();

  // ---------------------------------------------------------------------------
  /** Move to the last element. */
  extern virtual function bit last();

  // ---------------------------------------------------------------------------
  /** Move to the previous element. */
  extern virtual function bit prev();

  // ---------------------------------------------------------------------------
  /**
   * Move to the previous element, but only if there is a previous element. If no
   * previous element exists (e.g., because the iterator is already on the first
   * element)  then the iterator will wait here until a new element is placed at
   * the front of the list.
   */
  extern virtual task wait_for_prev();

  // ---------------------------------------------------------------------------
  /**
   * Get the number of elements.
   */
  extern virtual function int length();

  // ---------------------------------------------------------------------------
  /**
   * Get the current postion within the overall length.
   */
  extern virtual function int pos();

  // ---------------------------------------------------------------------------
  /** Access the `SVT_DATA_TYPE object at the current position. */
  extern virtual function `SVT_DATA_TYPE get_data();

  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * Initializes the iterator using the provided information.
   *
   * @param iter_q Queue containing the `SVT_DATA_TYPE instances to be
   * iterated upon.
   *
   * @param `SVT_DATA_QUEUE_ITER_NOTIFY `SVT_DATA_QUEUE_ITER_NOTIFY_TYPE instance, possibly shared.
   *
   * @param curr_ix This positions the top level iterator at this index.
   */
  extern virtual function void initialize(`SVT_DATA_QUEUE_TYPE iter_q = null, `SVT_DATA_QUEUE_ITER_NOTIFY_TYPE `SVT_DATA_QUEUE_ITER_NOTIFY = null, int curr_ix = -1);

  // ---------------------------------------------------------------------------
  /**
   * Initializes the `SVT_DATA_QUEUE_ITER_NOTIFY using the provided instance, or creates a new one
   * if possible.
   *
   * @param `SVT_DATA_QUEUE_ITER_NOTIFY `SVT_DATA_QUEUE_ITER_NOTIFY_TYPE instance, possibly shared.
   */
  extern virtual function void initialize_notify(`SVT_DATA_QUEUE_ITER_NOTIFY_TYPE `SVT_DATA_QUEUE_ITER_NOTIFY = null);

  // ---------------------------------------------------------------------------
  /**
   * Called when the queue changes so the iterator can re-align itself
   * and see if any waits can now proceed.
   *
   * @param change_type The type of queue change which occurred.
   */
  extern virtual function void queue_changed(change_type_enum change_type = BACK_ADD);

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
0b+r0xXPhN0FIOOnGeL9IIOz/1Oao0nDSHu5xnWusTbWHlgxBKGq1l5SnHbJ3O/J
7jLUeowKcb/UyLT+jPPZWJ1h6Q9tdM4Tt1q60y7l2SShWBOi2gKJU6wGMzQqG9qO
nr8li7On1VDNHFkM/yU1FKSj26eIcU8yKYNL8uXC2mUZy1rvgWAZng==
//pragma protect end_key_block
//pragma protect digest_block
SIoC6MYOzCbfYAgtIKUg5z39rb8=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
RuLca6suTE0MYhakT9mrDzPTgIo=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_DATA_QUEUE_ITER_SV
