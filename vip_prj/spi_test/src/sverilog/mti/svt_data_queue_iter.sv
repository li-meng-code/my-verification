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
UwY9NYibhPX0verpBtKzFhWGCLm7zWFSejAzhcDJGfBm4rGkr+TObohpXUn3cGKu
fDee5yGa8q+lQW0w0r/ZDWZHO1BplVCHiiAX5z2RGncUs/2T0TKmEPeEJ+xovYQ/
KWr/4Xn9ee/vPqqZr5hWu09QACiaR3jwTZZnazG4aDo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 14706     )
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
`pragma protect end_protected

`endif // GUARD_SVT_DATA_QUEUE_ITER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Mz3NopRenfOiuldjoBPesN+sYZxAdVor7GAKi3qaggTIYnIMjoF5jGO1F6/yQ7rL
bTBAXM66Pf1xlAI0muddcD+eu2cLEfpTu/sXh+Gv/k4t6fBtFXTAtY9dUTfPotVd
Upi7UpL4YclRLAvbO1bsgnkYlS+WBlCQEQIVP0Fyz5Y=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 14789     )
0jFuGzeCg7+XusoECv9IWvmVbFjXtsR/iWD4X89ARku37N59hT9LZF1VjUztoeOY
jb7OzCXc5mjxZmrIwY4RSaZ9OHCFuwRJ+aDUQhKKWwIR6aYg2vUsjvxeVMa2WLTb
`pragma protect end_protected
