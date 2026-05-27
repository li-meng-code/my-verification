//=======================================================================
// COPYRIGHT (C) 2007-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_DATA_ITER_SV
`define GUARD_SVT_DATA_ITER_SV

`ifdef SVT_VMM_TECHNOLOGY
 `define SVT_DATA_ITER_TYPE svt_data_iter
`else
 `define SVT_DATA_ITER_TYPE svt_sequence_item_base_iter
`endif

typedef class `SVT_DATA_TYPE;
typedef class `SVT_DATA_ITER_TYPE;

// =============================================================================
/**
 * Virtual base class which defines the iterator interface for iterating over
 * data collectoins.
 */
virtual class `SVT_DATA_ITER_TYPE;

  // ****************************************************************************
  // GeneralTypes
  // ****************************************************************************

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Internal Data
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /** Log used by this class. */
  vmm_log log;
`else
  /** Reporter used by this class. */
  `SVT_XVM(report_object) reporter;
`endif

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the `SVT_DATA_ITER_TYPE class.
   */
`ifdef SVT_VMM_TECHNOLOGY
  extern function new(vmm_log log);
`else
  extern function new(`SVT_XVM(report_object) reporter);
`endif

  // ---------------------------------------------------------------------------
  /** Check and load verbosity */
  `SVT_UVM_FGP_LOCK
  extern function void svt_check_and_load_verbosity();

  // ---------------------------------------------------------------------------
  /** Reset the iterator. */
  virtual function void reset();
  endfunction

  // ---------------------------------------------------------------------------
  /**
   * Allocate a new instance of the iterator, setting it up to iterate on the
   * same object in the same fashion. This should be used to create a duplicate
   * iterator on the same object, in the 'reset' position. The copy() method
   * should be used to get a duplicate iterator setup at the exact same iterator
   * position.
   */
  virtual function `SVT_DATA_ITER_TYPE allocate();
    allocate = null;
  endfunction

  // ---------------------------------------------------------------------------
  /**
   * Copy the iterator, putting the new iterator at the same position. The
   * default implementation uses the 'get_data()' method on the original
   * iterator along with the 'find()' method on the new iterator to align
   * the two iterators. As such it could be a costly operation. This may,
   * however, be the only reasonable option for some iterators.
   */
  extern virtual function `SVT_DATA_ITER_TYPE copy();

  // ---------------------------------------------------------------------------
  /** Move to the first element in the collection. */
  virtual function bit first();
    first = 0;
  endfunction

  // ---------------------------------------------------------------------------
  /** Evaluate whether the iterator is positioned on an element. */
  virtual function bit is_ok();
    is_ok = 0;
  endfunction

  // ---------------------------------------------------------------------------
  /** Move to the next element. */
  virtual function bit next();
    next = 0;
  endfunction

  // ---------------------------------------------------------------------------
  /**
   * Move to the next element, but only if there is a next element. If no next
   * element exists (e.g., because the iterator is already on the last element)
   * then the iterator will wait here until a new element is placed at the end
   * of the list. The default implementation generates a fatal error as some
   * iterators may not implement this method.
   */
  extern virtual task wait_for_next();

  // ---------------------------------------------------------------------------
  /** Move to the last element. */
  virtual function bit last();
    last = 0;
  endfunction

  // ---------------------------------------------------------------------------
  /** Move to the previous element. */
  virtual function bit prev();
    prev = 0;
  endfunction

  // ---------------------------------------------------------------------------
  /**
   * Move to the previous element, but only if there is a previous element. If no
   * previous element exists (e.g., because the iterator is already on the first
   * element)  then the iterator will wait here until a new element is placed at
   * the front of the list. The default implementation generates a fatal error as
   * some iterators may not implement this method.
   */
  extern virtual task wait_for_prev();

  // ---------------------------------------------------------------------------
  /**
   * Get the number of elements. The default implementation does a full scan
   * in order to get the overall length. As such it could be a costly operation.
   * This may, however, be the only reasonable option for some iterators.
   */
  extern virtual function int length();

  // ---------------------------------------------------------------------------
  /**
   * Get the current postion within the overall length. The default implementation
   * scans from the start to the current position in order to calculate the
   * position. As such it could be a costly operation. This may, however, be the
   * only reasonable option for some iterators.
   */
  extern virtual function int pos();

  // ---------------------------------------------------------------------------
  /**
   * Move the iterator forward (using 'next') or backward (using 'prev') to find
   * the indicated data object. If it moves to the end without finding the
   * data object then the iterator is left in the invalid state.
   *
   * @param data The data to move to.
   *
   * @param find_forward If set to 0 uses prev to find the data object. If set
   * to 1 uses next to find the data object.
   *
   * @return Indicates success (1) or failure (0) of the find.
   */
  extern virtual function bit find(`SVT_DATA_TYPE data, bit find_forward = 1);

  // ---------------------------------------------------------------------------
  /** Access the `SVT_DATA_TYPE object at the current position. */
  virtual function `SVT_DATA_TYPE get_data();
    get_data = null;
  endfunction

  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /** Returns this class' name as a string. */
  extern virtual function string get_type_name();
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Oeub7Vpc33rEhjyUipplU209k0eks3q9ynFEWTssYrRri8++u0HEShMM7f5alHhM
DQxRivaDDdjNHi4fDK1kzEO4XyLSwPVFEfwxVG/icMweU0OKIiGwjO/UYdMFW5IT
hBhgfBOzuXVT9DKVPSaWM9ZF3LBI9WtOXwROEep5DwM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3910      )
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
`pragma protect end_protected

`endif // GUARD_SVT_DATA_ITER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ZP0qkQ1qN2iVbMvxO+BYD7jkW+bHIIQ9msC4AeboJGTHR+oA0nrVrDYhTpMQlf+8
5ZsrV8mU2RbevheeWqkOBwWncPlOxWr0DLIHTHSLShdv8CvSWzWHCGVyUINtHbos
lEZq0EwkvnUdaaHkpVhoLoIZnoWG/TGpSC4tUZPD9ds=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3993      )
u9ye7GLkTaQBZPrItmt9dYLePh/wcXl4zNUi794mEWc7n6eqF6kOmgHUvKu6I587
SU0eI9hPOAEtLXjBqGY8ujlqoosK1skxeqgTNpO8V4fBm4XWYPX0TBO7ExqJtCjL
`pragma protect end_protected
