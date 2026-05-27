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
54wQCspOTIQD5jqf4TT6rESWplzsj5ip7pjHcyUqh2n/RKPWEyLWDlIpFiSk4scB
+/K6mhP9m4oZtSJZmUEpnet3Vxo4kbAdceWGMUb4e8ogbeQBmY4QQxJ5blp/LMU0
vvwgAuyZv+X3ZsWvvqRdVVMRljm5KCqa4buOz/EU5Cg4GByiFmvnrg==
//pragma protect end_key_block
//pragma protect digest_block
RHCKcgQhnw1rgSUZdvZDZdsBKWk=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
PtD/GdzNeRD2PgM/LYUkRncf7Lc=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_DATA_QUEUE_ITER_SV
