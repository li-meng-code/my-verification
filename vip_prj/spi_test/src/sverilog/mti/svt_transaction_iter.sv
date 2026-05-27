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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
fNIsgAYUDpg8L0TAz16+gtrNwtmaq9PcY15CmcRHqx7rxQqTcM7aO+fX2rDbsfmJ
fM411lmyeHyfgF/Maz+7G5Kh35WPZWnKgIRKlGVRsmnuMn70vVFnCtdJh6RUTnBZ
iWc7IiWLwb9JCV5Y+jiYR+kbJC/zDYC4bEfPjdRCI9Y=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10721     )
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
`pragma protect end_protected

`endif // GUARD_SVT_TRANSACTION_ITER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
f6cuCaj0hdPJP/R65TgZjQCeMo5qC0QtXoCkUqiOuGgwkO+jwTgi/tj6/6cObfYQ
QXNsPnys4Wiw4ACaoEH24MpwuzlaRqjXJ3QaEx2vdtR+eCyXmZkDSd9yreLtpN/E
BoxzDTWirC5eBl3o4Ai5X5elqVJiG3V+svv9RkuS82s=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10804     )
CgPs3W1dvoIq9L5qyVBBOiO28xTS5CGvXHgSoiglOsI1fT0p+1ocUBtA9BjKtdhi
0wzhJnUaTDnG3x+DxkKFpbIU6KcIplLwbe50mIolYhhdDs5FFRAHKs42Yi2bNmHg
`pragma protect end_protected
