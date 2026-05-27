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

`ifndef GUARD_SVT_PATTERN_SEQUENCE_SV
`define GUARD_SVT_PATTERN_SEQUENCE_SV

`ifndef SVT_VMM_TECHNOLOGY
typedef class svt_non_abstract_report_object;
`endif

/** @cond SV_ONLY */
// =============================================================================
/**
 * Simple data object that stores a pattern sequence as an array of patterns. This object also provides
 * basic methods for using these array patterns to find pattern sequences in `SVT_DATA_TYPE lists.
 *
 * The match_sequence() and wait_for_match() methods supported by svt_pattern_sequence
 * can be used to match the pattern against any set of `SVT_DATA_TYPE instances, simply by providing an iterator
 * which can scan the set of `SVT_DATA_TYPE instances.
 */
class svt_pattern_sequence;

  // ****************************************************************************
  // Private Data
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /** Shared log used if no log is provided to class constructor. */
  local static vmm_log shared_log = new ( "svt_pattern_sequence", "class" );
`else
  /** Shared reporter used if no reporter is provided to class constructor. */
  local static `SVT_XVM(report_object) shared_reporter = svt_non_abstract_report_object::create_non_abstract_report_object("svt_pattern_sequence.class");
`endif

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /**
   * Log||Reporter instance may be passed in via constructor. 
   */
`ifdef SVT_VMM_TECHNOLOGY
  vmm_log log;
`else
  `SVT_XVM(report_object) reporter;
`endif

  /**
   * Patterns which make up the pattern sequence. Each pattern consists of multiple
   * name/value pairs.
   */
  svt_pattern pttrn[];

  /** Identifier associated with this pattern sequence */
  int pttrn_seq_id = -1;

  /** Name associated with this pattern sequence */
  string pttrn_name = "";

  /**
   * Indicates if the svt_pattern_sequence is a subsequence and that the
   * match_sequence() and wait_for_match() calls should therefore limit their actions
   * based on being a subsequence. This includs skipping the detail_match. External
   * clients should set this to 0 to insure normal match_sequence execution.
   */
  bit is_subsequence = 0;

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_pattern_sequence class.
   *
   * @param pttrn_seq_id Identifier associated with this pattern sequence.
   *
   * @param pttrn_cnt Number of patterns that will be placed in the pattern sequence.
   *
   * @param pttrn_name Name associated with this pattern sequence.
   *
   * @param log||reporter Used to replace the default message report object.
   */
`ifdef SVT_VMM_TECHNOLOGY
  extern function new(int pttrn_seq_id = -1, int pttrn_cnt = 0, string pttrn_name = "", vmm_log log = null);
`else
  extern function new(int pttrn_seq_id = -1, int pttrn_cnt = 0, string pttrn_name = "", `SVT_XVM(report_object) reporter = null);
`endif

  // ---------------------------------------------------------------------------
  /**
   * Displays the contents of the object to a string. Each line of the
   * generated output is preceded by <i>prefix</i>.
   *
   * @param prefix String which specifies a prefix to put at the beginning of
   * each line of output.
   */
  extern virtual function string psdisplay(string prefix = "");
  
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of same type.
   *
   * @return Returns a newly allocated svt_pattern_sequence instance.
   */
  extern virtual function svt_pattern_sequence allocate ();

  // ---------------------------------------------------------------------------
  /**
   * Copies the object into to, allocating if necessay.
   *
   * @param to svt_pattern_sequence object is the destination of the copy. If not provided,
   * copy method will use the allocate() method to create an object of the
   * necessary type.
   */
  extern virtual function svt_pattern_sequence copy(svt_pattern_sequence to = null);
  
  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * Resizes the pattern array as indicated, loading up the pattern array with
   * svt_pattern instances.
   *
   * @param new_size Number of patterns to include in the array.
   */
  extern virtual function void safe_resize(int new_size);

  // ---------------------------------------------------------------------------
  /**
   * Copies the sequence of patterns into the provided svt_pattern_sequence.
   *
   * @param to svt_pattern_sequence that the pttrn is copied to.
   *
   * @param first_ix The index at which the copy is to start. Defaults to 0
   * indicating that the copy should start with the first pttrn array element.
   *
   * @param limit_ix The first index AFTER the last element to be copied. Defaults
   * to -1 indicating that the copy should go from first_ix to the end of the
   * current pttrn array.
   */
  extern virtual function void copy_patterns(svt_pattern_sequence to, int first_ix = 0, int limit_ix = -1);
  
  // ---------------------------------------------------------------------------
  /**
   * Method to add a new name/value pair to the indicated pattern.
   *
   * @param pttrn_ix Pattern which is to get the new name/value pair.
   *
   * @param name Name portion of the new name/value pair.
   *
   * @param value Value portion of the new name/value pair.
   *
   * @param array_ix Index into value when value is an array.
   *
   * @param positive_match Indicates whether match (positive_match == 1) or
   * mismatch (positive_match == 0) is desired.
   */
  extern virtual function void add_prop(int pttrn_ix, string name, bit [1023:0] value, int array_ix = 0, bit positive_match = 1);

  // ---------------------------------------------------------------------------
  /**
   * Method to see if this pattern sequence can be matched against the provided
   * queue of `SVT_DATA_TYPE objects. This method assumes that the data is complete
   * and that it can be fully accessed via the iterator `SVT_DATA_ITER_TYPE::next() method.
   *
   * Does a basic pattern match before calling detail_match() to do a final detailed
   * validation of the match. This method will also return if it makes a match or
   * completely fails based on starting at the current position. The client is responsible
   * for setting up and initiating the next match_sequence() request.
   *
   * @param data_iter Iterator that will be scanned in search of the pattern sequence.
   *
   * @param data_match If a match was made, this queue includes the data objects that made up the pattern match.
   * If the data_match queue is empty, it indicates the match failed.
   */
  extern virtual function void match_sequence(`SVT_DATA_ITER_TYPE data_iter, ref `SVT_DATA_TYPE data_match[$]);

  // ---------------------------------------------------------------------------
  /**
   * Method to see if this pattern sequence can be matched against the provided
   * queue of `SVT_DATA_TYPE objects. This method assumes that the data is still being 
   * generated and that it must rely on the `SVT_DATA_ITER_TYPE::wait_for_next() method
   * to recognize when additional data is available to continue the match.
   *
   * Does a basic pattern match before calling detail_match() to do a final detailed
   * validation of the match. This method will also return if it makes a match or
   * completely fails based on starting at the current position. The client is responsible
   * for setting up and initiating the next wait_for_match() request.
   *
   * @param data_iter Iterator that will be scanned in search of the pattern sequence.
   *
   * @param data_match If a match was made, this queue includes the data objects that made up the pattern match.
   * If the data_match queue is empty, it indicates the match failed.
   */
  extern virtual task wait_for_match(`SVT_DATA_ITER_TYPE data_iter, ref `SVT_DATA_TYPE data_match[$]);

  // ---------------------------------------------------------------------------
  /**
   * Method called at the end of the match_sequence() and wait_for_match() pattern match
   * to do additional checks of the original data_match. Can be used by an extended class
   * to impose additional requirements above and beyond the basic pattern match requirements. 
   *
   * @param data_match Queue which includes the data objects that made up the pattern match.
   */
  extern virtual function bit detail_match(`SVT_DATA_TYPE data_match[$]);

  // ---------------------------------------------------------------------------
  /**
   * Utility method for creating a pattern sub-sequence.
   *
   * @param first_pttrn_ix Position where the sub-sequence is to start.
   */
  extern virtual protected function svt_pattern_sequence setup_pattern_sub_sequence(int first_pttrn_ix);

  // ---------------------------------------------------------------------------
  /**
   * Utility method to check for a full sequence match.
   *
   * @param data_match The current matching data.
   * @param pttrn_ix The position of the current match.
   * @param match Indication of the current match.
   * @param restart_match Indication of whether a the match is to be restarted.
   */
  extern virtual protected function void check_full_match(`SVT_DATA_TYPE data_match[$], int pttrn_ix, ref bit match, ref bit restart_match);

  // ---------------------------------------------------------------------------
  /**
   * Utility method to evaluate whether the previous match against a sub-sequence was successful.
   *
   * @param data_match The current matching data.
   * @param curr_data The current data we are reviewing for a match.
   * @param data_sub_match The data matched within the sub-sequence.
   * @param pttrn_ix The position of the current match.
   */
  extern virtual protected function void process_sub_match(ref `SVT_DATA_TYPE data_match[$], ref int pttrn_ix, input `SVT_DATA_TYPE curr_data, input `SVT_DATA_TYPE data_sub_match[$]); 

  // ---------------------------------------------------------------------------
  /**
   * Utility method to set things up for a match restart.
   *
   * @param data_iter Iterator that is being used to do the overall scan in search of the pattern sequence.
   * @param data_match The current matching data.
   * @param pttrn_ix The position of the current match.
   * @param pttrn_match_cnt The patterns within the pattern sequence that have been matched thus far.
   * @param match Indication of the current match.
   * @param restart_match Indication of whether a the match is to be restarted.
   */
  extern virtual protected function void setup_match_restart(`SVT_DATA_ITER_TYPE data_iter, ref `SVT_DATA_TYPE data_match[$], ref int pttrn_ix, ref int pttrn_match_cnt, ref bit match, ref bit restart_match);

  // ---------------------------------------------------------------------------
  /**
   * Utility method used to get a unique identifier string for the pattern sequence.
   */
  extern virtual protected function string get_pttrn_seq_uniq_id();

`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /** Returns this class' name as a string. */
  extern virtual function string get_type_name();
`endif

  // ---------------------------------------------------------------------------
endclass
/** @endcond */

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
csDVCWskpNlW1NCWF5HBNApqgOIInULQH53YBIrgX11q1v9H4DDw76a9+QCnkpUI
7TGtD3LW17NpwYGRUJ1UOCrtywc5xzssLKDffYkfxRPuDzf66cmgY8pUA5C2O38E
iBDpV9z4DoB35yyn6AB1dzqL7Lnbbp2ciBm+k5N6S+3FK78INEMOrQ==
//pragma protect end_key_block
//pragma protect digest_block
phPDGLQmR3QTVdB2d/1hYyMyf1c=
//pragma protect end_digest_block
//pragma protect data_block
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
e39W9hasB/wDdPzsBsAj6nXg2TM+37Rw91vuh4XxQHIm1J5PrfSzWDms7BqCU+tq
D0DSGfaSO39h7lFQ92qNNe9IpccGQEnjWmidZj7uEUAXuUQ5uDi/QahCdk1rtw5R
h0CyiExwXbZ8VdyyrJyT7JhGyL17ump4epaweFDtNKgwEluHn8aILEbj8rUGDShc
g53ed8R6rQzv6YG+NfmIisPbhXGRdlsWhhbhmwFfcb1ryW9BXHdX1XZM0sD4qrvG
PIUZIlIWxJfAkV2KdFGk4EOr0vLX37ATrC51GcqQQ237mMMjjFygNQHEm/UOKKFn
txiXRNoryKuq6lsTHipyfOwyV6icCEbg7YIahVGAbJ5thZwdAh6S/ZRB1Krkr8Wq
aq48pPVZcDyca+FWvsWlKsoY3PUwy5Bbgy188h2DsI/cIklLHOxsClJY4Ni2Yn2b
dwvlUd2guWDy4j2/4i5PBYlUOINxM5mzUS4sXsddULx8TX51Lt0sOObFFPqU8htJ
vG0vgeE1L9YszWGzStnDQLcGPYLjUf4gdm4P2nfuiB8shFsgGnynMj9QMy7ECv76
CVl3Hu+/Tcq57rjXa2Z24F6OoMow526X4f97OZ2PYCvRCvn2HtdwIOXKeyP4Herm
I9xpzkxFhj40XvZPailpwwSftNX6sK5Y91U1dQNqMKZ/221UHML/mrnglX4tRQPS
ezrxpNpdDBdhJWnF42M0KwJDmk+dVRmzXEQIUTMknh7tAkC5BEKWeblBo/vzxCuM
srEhPKOfSQ9/N+Viltcsv+u8fO2i6o98KEpr5mlVq8H3saWwrQt2rcmNtKxW73ar
bD4OnJlCC4eaRhKEk85ekEnRJihDG+gPM/wufy7oJNb085WIwxQFak1KxG+gnmO8
eabNWRBVfRqSiKjXrQR9jRMsGcatIx4WzH0MqFxsLv93ovZLB77j88fPM8DNbYkT
p6g6+MSMp57y0Tt/krPvUd49Tykgkum5xvCKmXQ+rLJgus7Cudouc6rQKtDWg/dd
1kh5+UIfhAC0HwshMYAtYLm4aA5ESR+HbtBtySu063Ibr+hFy30EINWzCz/q9mmj
SpcPQghDmHAFScEckFkc0U01QuUAN8lU1zFxvBFd6Lo7VqO+rrIwc1isMGPg0q+w
oFeBljiTdxIaHC0ubDim/E/YzFQK2RM/9TBQqSpnVA1bOJkPWSP5+zNJivDFy9O7
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

//pragma protect end_data_block
//pragma protect digest_block
H2ccHSEiiVe36vexqDvKOd/XTq8=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_PATTERN_SEQUENCE_SV
