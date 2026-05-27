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
jas3YjZWDogs0JrNHv5GS+MTKZr0ZwSWmw9MKXU7MQDxrOQ0TwYpaqt4x+lKwxnZ
goXlPKGUKYK5aNaFJ89P1llhk7edrmiEBCBu6gDg5H3UBFi+EXp7uIxFbFvY5HQV
qsUqcTtTx2fPv2uWYuKbhat7JsQ/AzpGuKWDSqBitlhKK1Hz1AwrlQ==
//pragma protect end_key_block
//pragma protect digest_block
QzbJ7hCkAEP5mwfHv/QmPpegW9s=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
p+OeZCIejhjmHdv0ozaWt/H00YQ=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_TRANSACTION_ITER_SV
