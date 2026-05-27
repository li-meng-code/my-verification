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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
brS/uD1N80C0MUfIHar5TRqFk0j8yPS8m00vnEpaBeyNApW2fJ30IAL3tzDfTQPn
X8tlk1CiOjdL9TKFyh4MaVyAux1+xhLWa5N/f9juaGxK/kwK9UTYIMJzfolK8y9l
tRPBduUrvRTuHbfC4rjuGW9cvdeQApGh4phHagf3b7c=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 14706     )
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
`pragma protect end_protected

`endif // GUARD_SVT_DATA_QUEUE_ITER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Uk4COQfSHjSlccIbVKZZ4k+mSYaXcMztr/9vKUplEqdIMU9fyLvtSVznwmm4saGo
6lh0mJYP8lmreN7SrVH5/3AlNTCZE7Hk29knF+M+2Vlvdh6NRwsH6T9zfMYsnoCR
e8C1vj8lb47AZkqzKg3HqyNB+SZAwGChHEge336PnvA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 14789     )
EJKROS+tf+7ZS7QLiwnvBAFvzAObE1JyQyEBWwNl0Wc9bydT3Q/4Y9cuOb90+0ZT
ZL6pv8MR4YTSV+NvPDlQfI43AvZnpj8dNipiygvhTp+A+KBBOYqwHJmbr6b/5YHf
`pragma protect end_protected
