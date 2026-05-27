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

`ifndef GUARD_SVT_TRANSACTION_ITER_SV
`define GUARD_SVT_TRANSACTION_ITER_SV

`ifdef SVT_VMM_TECHNOLOGY
 `define SVT_TRANSACTION_ITER_TYPE svt_transaction_iter
`else
 `define SVT_TRANSACTION_ITER_TYPE svt_sequence_item_iter
`endif

/** Macro used to pull the data object from the proper collection */
`define SVT_TRANSACTION_ITER_TOP_LEVEL_XACT \
( \
  (iter_type == IMPLEMENTATION) ? this.iter_xact.implementation[top_level_ix] : \
  ((iter_type == TRACE) && (this.iter_xact.trace.size() == 0)) ? this.iter_xact.implementation[top_level_ix] : \
  ((iter_type == TRACE) && ((name_match == null) || scan_name_match_trace)) ? this.iter_xact.trace[top_level_ix] : \
  ((iter_type == TRACE) && (name_match.get_class_name() != iter_xact.get_class_name())) ? this.iter_xact.trace[top_level_ix] : \
  (iter_type == TRACE) ? this.iter_xact.implementation[top_level_ix] : \
  null \
)

/** Macro used to access the queue size for the proper collection */
`define SVT_TRANSACTION_ITER_TOP_LEVEL_QUEUE_SIZE \
( \
  (iter_type == IMPLEMENTATION) ? this.iter_xact.implementation.size() : \
  ((iter_type == TRACE) && (this.iter_xact.trace.size() == 0)) ? this.iter_xact.implementation.size() : \
  ((iter_type == TRACE) && ((name_match == null) || scan_name_match_trace)) ? this.iter_xact.trace.size() : \
  ((iter_type == TRACE) && (name_match.get_class_name() != iter_xact.get_class_name())) ? this.iter_xact.trace.size() : \
  (iter_type == TRACE) ? this.iter_xact.implementation.size() : \
  0 \
)

/** Macro used to figure out the first available index */
`define SVT_TRANSACTION_ITER_FIRST_IX \
( (start_ix == -1) ? 0 : start_ix )

/** Macro used to figure out the last available index */
`define SVT_TRANSACTION_ITER_LAST_IX \
( (end_ix == -1) ? `SVT_TRANSACTION_ITER_TOP_LEVEL_QUEUE_SIZE-1 : end_ix )

// =============================================================================
/**
 * Iterators that can be used to iterate over the implementation and trace
 * collections stored with a transaction.
 */
class `SVT_TRANSACTION_ITER_TYPE extends `SVT_DATA_ITER_TYPE;

  // ****************************************************************************
  // General Types
  // ****************************************************************************

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  /**
   * This enumeration is used to signify which data collection the client wishes
   * to iterate on. The supported choices correspond to the collections supported
   * by this class.
   */
  typedef enum {
    IMPLEMENTATION,     /**< Indicates iteration should be over the implementation data */
    TRACE               /**< Indicates iteration should be over the trace data */
  } iter_type_enum;

  // ****************************************************************************
  // Internal Data
  // ****************************************************************************

  /** The base transaction the iterator is going to be scanning. */
  protected `SVT_TRANSACTION_TYPE       iter_xact;

  /** Indicates which collection should be iterated over. */
  protected iter_type_enum iter_type = TRACE;

  /**
   * Used to do a name match (using `SVT_DATA_TYPE::get_class_name()) of the scanned
   * objects in order to recognize the object the client is actually interested
   * in.
   */
  protected `SVT_DATA_TYPE              name_match = null;

  /**
   * Used to control whether the scan ends at the name_match (0) or if it
   * includes the 'trace' of the name_match object.
   */
  bit                             scan_name_match_trace = 0;

  /** Index that the iteration starts at. -1 indicates iteration starts on first queue element.  */
  protected int                   start_ix = -1;

  /** Index that the iteration ends at. -1 indicates iteration ends on last queue element. */
  protected int                   end_ix = -1;

  /** Index at the current level, based on single level traversal. */
  protected int                   top_level_ix = -1;

  /**
    * When doing a multi-level traversal, this will be a handle to the
    * iterator which iterates across the objects at the lower levels.
    */
  protected `SVT_TRANSACTION_ITER_TYPE  level_n_iter = null;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the `SVT_TRANSACTION_ITER_TYPE class.
   *
   * @param iter_xact The base transaction the iterator is going to be
   * scanning.
   *
   * @param iter_type Used to indicate whether the iteration should be over the
   * IMPLEMENTATION queue or the TRACE queue.
   *
   * @param name_match This object, if provided, is used to recognize the
   * proper scan depth as the iterator scans the objects in the specified
   * collection. Whenever it gets a new object, it uses `SVT_DATA_TYPE::get_class_name()
   * to compare the basis for the two objects. If the compare succeeds, it goes
   * no deeper with the scan and considers this the next iterator element. If the
   * compare fails, then the scan moves into the corresponding collection on the
   * object which it was unable to compare against. If this object is not provided
   * the iterator assumes that it should do a one level scan.
   *
   * @param scan_name_match_trace If name_match is non-null and the name_match
   * svt_transaction class has a trace queue then a setting of 1 will cause the
   * iterator to traverse the trace array instead of the object itself. A setting
   * of 0 will cause the iterator to just include the object in the iteration,
   * not its trace. If name_match is null or it does not have a trace queue,
   * then this field has no impact.
   * TODO: This currently defaults to 1, but will likely change to a default of 0 soon.
   *
   * @param start_ix Optional index into the transaction implementation or
   * trace array, used to limit where the iteration starts within the
   * corresponding queue. The default value of -1 indicates that the
   * iteration starts at the first element in the corresponding queue.
   *
   * @param end_ix Optional index into the transaction implementation or
   * trace array, used to limit where the iteration ends within the
   * corresponding queue. The default value of -1 indicates that the
   * iteration ends at the last element in the corresponding queue.
   *
   * @param log An vmm_log object reference used to replace the default internal
   * logger.
   */
  extern function new(
    `SVT_TRANSACTION_TYPE iter_xact, iter_type_enum iter_type = TRACE,
    `SVT_DATA_TYPE name_match = null, bit scan_name_match_trace = 1,
    int start_ix = -1, int end_ix = -1,
    vmm_log log = null);
`else
  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the `SVT_TRANSACTION_ITER_TYPE class.
   *
   * @param iter_xact The base transaction the iterator is going to be
   * scanning.
   *
   * @param iter_type Used to indicate whether the iteration should be over the
   * IMPLEMENTATION queue or the TRACE queue.
   *
   * @param name_match This object, if provided, is used to recognize the
   * proper scan depth as the iterator scans the objects in the specified
   * collection. Whenever it gets a new object, it uses `SVT_DATA_TYPE::get_class_name()
   * to compare the basis for the two objects. If the compare succeeds, it goes
   * no deeper with the scan and considers this the next iterator element. If the
   * compare fails, then the scan moves into the corresponding collection on the
   * object which it was unable to compare against. If this object is not provided
   * the iterator assumes that it should do a one level scan.
   *
   * @param scan_name_match_trace If name_match is non-null and the name_match
   * svt_transaction class has a trace queue then a setting of 1 will cause the
   * iterator to traverse the trace array instead of the object itself. A setting
   * of 0 will cause the iterator to just include the object in the iteration,
   * not its trace. If name_match is null or it does not have a trace queue,
   * then this field has no impact.
   * TODO: This currently defaults to 1, but will likely change to a default of 0 soon.
   *
   * @param start_ix Optional index into the transaction implementation or
   * trace array, used to limit where the iteration starts within the
   * corresponding queue. The default value of -1 indicates that the
   * iteration starts at the first element in the corresponding queue.
   *
   * @param end_ix Optional index into the transaction implementation or
   * trace array, used to limit where the iteration ends within the
   * corresponding queue. The default value of -1 indicates that the
   * iteration ends at the last element in the corresponding queue.
   *
   * @param reporter A report object object reference used to replace the default internal
   * reporter.
   */
  extern function new(
    `SVT_TRANSACTION_TYPE iter_xact, iter_type_enum iter_type = TRACE,
    `SVT_DATA_TYPE name_match = null, bit scan_name_match_trace = 1,
    int start_ix = -1, int end_ix = -1,
    `SVT_XVM(report_object) reporter = null);
`endif

  // ---------------------------------------------------------------------------
  /** Reset the iterator. */
  extern virtual function void reset();

  // ---------------------------------------------------------------------------
  /**
   * Allocate a new instance of the iterator, setting it up to iterate on the
   * same object in the same fashion. This creates a duplicate iterator on the
   * same object, in the 'reset' position.
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
  /** Move to the last element. */
  extern virtual function bit last();

  // ---------------------------------------------------------------------------
  /** Move to the previous element. */
  extern virtual function bit prev();

  // ---------------------------------------------------------------------------
  /** Access the svt_data object at the current position. */
  extern virtual function `SVT_DATA_TYPE get_data();

  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * Initializes the iterator using the provided information.
   *
   * @param iter_xact The base transaction the iterator is going to be
   * scanning.
   *
   * @param iter_type Used to indicate whether the iteration should be over the
   * IMPLEMENTATION queue or the TRACE queue.
   *
   * @param name_match This object, if provided, is used to recognize the
   * proper scan depth as the iterator scans the objects in the specified
   * collection. Whenever it gets a new object, it uses `SVT_DATA_TYPE::get_class_name()
   * to compare the basis for the two objects. If the compare succeeds, it goes
   * no deeper with the scan and considers this the next iterator element. If the
   * compare fails, then the scan moves into the corresponding collection on the
   * object which it was unable to compare against. If this object is not provided
   * the iterator assumes that it should do a one level scan.
   *
   * @param scan_name_match_trace If name_match is non-null and the name_match
   * svt_transaction class has a trace queue then a setting of 1 will cause the
   * iterator to traverse the trace array instead of the object itself. A setting
   * of 0 will cause the iterator to just include the object in the iteration,
   * not its trace. If name_match is null or it does not have a trace queue,
   * then this field has no impact.
   *
   * @param start_ix Optional index into the transaction implementation or
   * trace array, used to limit where the iteration starts within the
   * corresponding queue. The default value of -1 indicates that the
   * iteration starts at the first element in the corresponding queue.
   *
   * @param end_ix Optional index into the transaction implementation or
   * trace array, used to limit where the iteration ends within the
   * corresponding queue. The default value of -1 indicates that the
   * iteration ends at the last element in the corresponding queue.
   *
   * @param top_level_ix This positions the top level iterator at this position.
   *
   * @param level_n_iter This sets this up as the internal iterator which is
   * working on the internal object in support of the top level iterator.
   */
  extern function void initialize(
    `SVT_TRANSACTION_TYPE iter_xact, iter_type_enum iter_type = TRACE,
    `SVT_DATA_TYPE name_match = null, bit scan_name_match_trace = 0,
    int start_ix = -1, int end_ix = -1,
    int top_level_ix = -1, `SVT_TRANSACTION_ITER_TYPE level_n_iter = null);

  // ---------------------------------------------------------------------------
  /** Checks to see if the iterator is properly positioned on a data object. */
  extern virtual function bit check_iter_level();

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
lHlzR+t3Sm2c/bNwBQfjdhoK5jWDzAnv/jrhEFTKLaXkTiGQqpFmPG7mU5BbTycP
7Py98qDLjDqTDopMkCOsHm7zdCLDoC8RPqeQm3OdF7WM88ZbE7PaUsFTY7Lma9yX
JtAVPNE9YKu4x6Mg2jBLwlX5OmMfU1BpPQRW6vRVtCzzMrEUaSl1ZQ==
//pragma protect end_key_block
//pragma protect digest_block
3ID8JVCOymGlQku7HHiHwHLW8m8=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
HCHPuuIRt1ER4hmU5QYGVhoVa14=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_TRANSACTION_ITER_SV
