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
WyJKtrA1/tmOb0WmzCJFmy24F70AAZuSBCxayx9Nkq+fksD3OEKb4OZZGW/mmic1
0+gCekJcT6/UgDGJGcUTdJO0QLwIkYcaLpBFbC0VhfPetg7UrjTx5lpRNn5xI5c/
+q0Wa5yX7ptXgXErvJiA1IdgY7/N73dtj5LoUOWqzfE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3910      )
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
`pragma protect end_protected

`endif // GUARD_SVT_DATA_ITER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
dYsjGak7cevqdb1AvYNmQBNkPRz66FoqDQsE1RE6y6spjKmBXNb96JKkZCpszS6N
kVzwCgG/i3R5y0E2d8LdzCTUOkvX7scDd7g9D4wEYpR8CUq/MyQJva7WKbXSPFSQ
wzU2/Yx7+j58YloqFxALkPyiFhyuMhKXwyx2R/lchEk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3993      )
NVvYJ0Xr493ZcPy0tGUmoajqWni16OgNcT8Ovrk8spf8LU2r2O4662KEVMRlk3+C
LH/cU7PfDRHfs7yM87jfPN+UKdsd8/O8pQTWoae4p+pGaQdfPVr5FXC+Pnvxhwxj
`pragma protect end_protected
