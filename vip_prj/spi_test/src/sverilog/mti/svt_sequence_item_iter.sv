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
YiC5bxFmSnenbOCSO09fI6zn5BbHl+L3+DuCxojrvayXuO5H40cga81LkoK4UTTR
jJ86rTwxAJHkSoJ9XKci0UXjQULj3GRLh27ZND0z1iYX/PRC5ojFS5JH1ymnju7S
wLSonRiZlry9pfm7YC88dTStYPL5MdfgG/S9SJ56ZFI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10721     )
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
`pragma protect end_protected

`endif // GUARD_SVT_TRANSACTION_ITER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
JoYytuGDbGXxuEeQ8We+V5MzDEbHL19NkVwX0v9oPTpZ/hsotKxlp962ardPd4Xt
rKRrltTdZ73a1OUWw9NVPmdx95gRKKWocYI1sq8X6D+vM5HePY7+XaLm7hs3RGlp
vjKdZeEmf2GkmIbOMC9EIbkzs5uUijVlLTDEL18FwrA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10804     )
VV0Z92lKFktsx+3NewYo3125A3PCXHC2+98YSP0nPvP6XssFmFGaA2dWrjGZUarn
GkGXCXDiivQzd93xk1ViSVKrqP216OwB8N4kOgA/ht0YoaY7VeZGq74yReZMWkzV
`pragma protect end_protected
