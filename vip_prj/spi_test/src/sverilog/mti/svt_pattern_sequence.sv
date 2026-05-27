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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
BBOucJ8lHMoTgKHVHS7qU+8mDQ8KjSEYegjIXu+Co8X0rfhihLkh2oo4V8krMtc3
HWTx7xF7R+uMHc4o0ObY8hKF8KWDgAlvfAk2JyiNLzKTwHmTclfcUgeMM1GydxuQ
1m5kxjlgbvySgIG/vSA7hMTZ9YxLvwksD5ET3wSelUM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20368     )
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
`pragma protect end_protected

`endif // GUARD_SVT_PATTERN_SEQUENCE_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
GPwtE3J5dgSRE0KnoZ9cUBKEZRtlITpOjYWAScz5QUjIQps79btA94nG1Nx0CxUh
+EqmL/mVgr6Vqgq5G7cyDkE2KwictCa5uMnk5pETNDRM4yjeO0j7IqMmAMbinKBG
nOtsRBqpJvTOJmbrUm3O0RMV1exdJvUTObvNNPGV00I=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20451     )
G3gEQh7ba6OJOl04TKyF4QWBl8NIYOBbmPp35h/G4uotjuI40J+0pq3PwneLbKEn
1YaPzYWd5DuIwG7NshhRLJZZE913z5H/JTREEkOL+DsnsAvV5Z00jlZ4zHaJdIok
`pragma protect end_protected
