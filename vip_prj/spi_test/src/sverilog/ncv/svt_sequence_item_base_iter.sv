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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
nwuTPLrCfVzBg4Jy7Q183jcmsxloveOjo2B83IQplyAery4KhqOSdsLrrJEU8bVu
lXffBnCjP3o/24uUKTYBXFpjUo12RNHKIuKdj2z6hRQuq9GURGFC1tUz5QToCpKq
6hFi9kcRgBybt6m4nN0QA/be7FN0hA1xkq03LzBMo3qHs0aA7GcoKg==
//pragma protect end_key_block
//pragma protect digest_block
PbhApmq1pm4FiD/YQ8oCZYc09Wo=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
KshJB0lZfVCVdWoYXntnMTSqCVA=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_DATA_ITER_SV
