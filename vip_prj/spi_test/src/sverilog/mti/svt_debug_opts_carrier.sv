//=======================================================================
// COPYRIGHT (C) 2015-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_DEBUG_OPTS_CARRIER_SV
`define GUARD_SVT_DEBUG_OPTS_CARRIER_SV

// SVDOC unable to refer to class scoped structs
`ifndef __SVDOC__
/**
 * This macro needs to be called within the cb_exec method for each
 * callback supported by the VIP to support 'before' callback
 * execution logging.  The macro should be called before the callback
 * methods are executed.
 * 
 * All arguments except for cbname are optional.
 * 
 * cbname -- Name of the callback method
 * fields -- Queue of svt_pattern_data::create_struct elements
 * objtypes -- Queue of object type names which must be presented in the argument order
 * objvals -- Queue of object references which must be presented in the argument order
 * primvals - Queue of primitive values which must be presented in the argument order
 */
`define SVT_DEBUG_OPTS_CARRIER_PRE_CB(cbname,fields='{},objtypes='{},objvals='{},primvals='{}) \
  svt_debug_opts_carrier pdc = null; \
  svt_debug_opts_carrier post_cb_pdc = null; \
  bit debug_enabled_w_user_cb = 0; \
  if(current_method_triggered_counter.exists(`SVT_DATA_UTIL_ARG_TO_STRING(cbname))) \
    current_method_triggered_counter[`SVT_DATA_UTIL_ARG_TO_STRING(cbname)] = (current_method_triggered_counter[`SVT_DATA_UTIL_ARG_TO_STRING(cbname)])+1; \
  else \
    current_method_triggered_counter[`SVT_DATA_UTIL_ARG_TO_STRING(cbname)] = 1; \
  if (is_debug_enabled() \
`ifdef SVT_DEBUG_OPTS_ENABLE_CALLBACK_PLAYBACK \
    || svt_debug_opts::get_enable_callback_playback() \
`endif \
  ) begin \
    debug_enabled_w_user_cb = has_user_cb(); \
    if (debug_enabled_w_user_cb || svt_debug_opts::has_force_cb_save_to_fsdb_type(`SVT_DATA_UTIL_ARG_TO_STRING(cbname), objtypes) || svt_debug_opts::get_enable_callback_playback()) begin \
`ifdef SVT_VMM_TECHNOLOGY \
      pdc = new(null, get_debug_opts_full_name(), fields, objtypes, objvals, primvals); \
`else \
      pdc = new(`SVT_DATA_UTIL_ARG_TO_STRING(cbname), get_debug_opts_full_name(), fields, objtypes, objvals, primvals); \
      pdc.add_prop("uid_count",current_method_triggered_counter[`SVT_DATA_UTIL_ARG_TO_STRING(cbname)],0, svt_pattern_data::INT); \
`endif \
      if (!svt_debug_opts::get_enable_callback_playback()) begin \
        void'(pdc.update_save_prop_vals_to_fsdb({get_debug_opts_full_name(), ".", `SVT_DATA_UTIL_ARG_TO_STRING(cbname), ".before"})); \
      end \
    end \
  end

/**
 * This macro needs to be called within the cb_exec method for each
 * callback supported by the VIP to support 'after' callback
 * execution logging.  The macro should be called after the callback
 * methods are executed.
 * 
 * All arguments except for cbname are optional.
 * 
 * cbname -- Name of the callback method
 * primprops -- Queue of svt_pattern_data::get_set_struct elements
 * primvals -- Concatenation of every ref argument of the callback
 */
`define SVT_DEBUG_OPTS_CARRIER_POST_CB(cbname,primprops='{},primvals=default_lhs) \
`ifdef SVT_DEBUG_OPTS_ENABLE_CALLBACK_PLAYBACK \
  if (svt_debug_opts::get_enable_callback_playback()) begin \
    if (pdc != null) begin \
      post_cb_pdc = pdc.update_object_prop_vals({get_debug_opts_full_name(), ".", `SVT_DATA_UTIL_ARG_TO_STRING(cbname)}, current_method_triggered_counter[`SVT_DATA_UTIL_ARG_TO_STRING(cbname)]); \
      if (post_cb_pdc != null) begin \
        bit[1023:0] val; \
        if (post_cb_pdc.get_primitive_vals(pdc, primprops, val)) begin \
          bit[1023:0] default_lhs; \
          primvals = val; \
        end \
      end \
    end \
  end \
  else if (debug_enabled_w_user_cb) \
`else \
  if (debug_enabled_w_user_cb) \
`endif \
    void'(pdc.update_save_prop_vals_to_fsdb({get_debug_opts_full_name(), ".", `SVT_DATA_UTIL_ARG_TO_STRING(cbname), ".after"}, ,primprops));

/**
 * This macro can be used by internal cb_exec methods to resolve some design issues
 * that block logging and playback.  This macro can be used to record internal events
 * that the VIP recognizes, but which aren't made available to the testbench through
 * an existing callback.
 * 
 * All arguments except for cbname are optional.
 * 
 * cbname -- Name of the callback method
 * fields -- Queue of svt_pattern_data::create_struct elements
 * objtypes -- Queue of object type names which must be presented in the argument order
 * objvals -- Queue of object references which must be presented in the argument order
 * primvals_pre - Queue of primitive values which must be presented in the argument order
 * primprops -- Queue of svt_pattern_data::get_set_struct elements
 * primvals_post -- Concatenation of every ref argument of the callback
 */
`define SVT_DEBUG_OPTS_CARRIER_INTERNAL_EVENT(cbname,fields='{},objtypes='{},objvals='{},primvals_pre='{},primprops='{},primvals_post=default_lhs) \
 `SVT_DEBUG_OPTS_CARRIER_PRE_CB(cbname,fields,objtypes,objvals,primvals_pre); \
 `SVT_DEBUG_OPTS_CARRIER_POST_CB(cbname,primprops,primvals_post)
`endif

/**
 * This macro needs to be called by all classes that do callback
 * logging in order to support logging. It should be called within
 * the class declaration, so that the method is available
 * to all cb_exec methods which are implemented within the class.
 *
 * T -- The component type that the callbacks are registered with.
 * CB -- The callback type that is registered with the component.
 * compinst -- The component instance which the callbacks will be
 * directed through, and which contains a valid 'is_user_cb' (i.e.,
 * typically inherited from the SVT component classes) implementation.
 */
`define SVT_DEBUG_OPTS_CARRIER_CB_UTIL(T,CB,compinst) \
  int current_method_triggered_counter[string]; \
 \
  function bit has_user_cb(); \
`ifdef SVT_VMM_TECHNOLOGY \
    for (int i = 0; (!has_user_cb && (i < compinst.callbacks.size())); i++) begin \
      svt_xactor_callback svt_cb; \
      if ($cast(svt_cb, compinst.callbacks[i])) \
        has_user_cb = compinst.is_user_cb(svt_cb.get_name()); \
      else \
        /* Its not a SNPS callback, so must be a user callback. */ \
        has_user_cb = 1; \
    end \
`elsif SVT_UVM_TECHNOLOGY \
    uvm_callback_iter#(T, CB) cb_iter = new(compinst); \
    CB cb = cb_iter.first(); \
    has_user_cb = 0; \
    while (!has_user_cb && (cb != null)) begin \
      has_user_cb = compinst.is_user_cb(cb.get_type_name()); \
      cb = cb_iter.next(); \
    end \
`elsif SVT_OVM_TECHNOLOGY \
    ovm_callbacks#(T, CB) cbs = ovm_callbacks #(T,CB)::get_global_cbs(); \
    ovm_queue#(CB) cbq = cbs.get(compinst); \
    has_user_cb = 0; \
    for (int i = 0; !has_user_cb && (cbq != null) && (i < cbq.size()); i++) begin \
      CB cb = cbq.get(i); \
      has_user_cb = compinst.is_user_cb(cb.get_type_name()); \
    end \
`endif \
  endfunction \
 \
  function string get_debug_opts_full_name(); \
    get_debug_opts_full_name = compinst.`SVT_DATA_GET_OBJECT_HIERNAME(); \
  endfunction \
 \
  function bit is_debug_enabled(); \
    is_debug_enabled = compinst.get_is_debug_enabled(); \
  endfunction

/** @cond SV_ONLY */
// =============================================================================
/**
 * The svt_debug_opts_carrier is used to intercept and manage whether the baseline
 * pattern data carrier functionality is actually utilized. 
 */
class svt_debug_opts_carrier extends svt_pattern_data_carrier;

  // ****************************************************************************
  // GeneralTypes
  // ****************************************************************************

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_data)
  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_debug_opts_carrier class.
   *              This should only ever be called if debug_opts have been enabled.
   *              This is enforced by the SVT_DEBUG_OPTS_CARRIER_PRE_CB macro,
   *              so clients are strongly advised to use that macro to create
   *              instances of this object.
   *
   * @param log A vmm_log object reference used to replace the default internal logger.
   * @param host_inst_name Instance name to check against
   * @param field_desc Shorthand description of the fields to be created in the carrier.
   * @param obj_class_type Class type values which must be provided (in order) for all of the object fields
   * provided in the field_desc.
   */
  extern function new(vmm_log log = null, string host_inst_name = "",
                      svt_pattern_data::create_struct field_desc[$] = '{}, string obj_class_type[$] = '{},
                      `SVT_DATA_TYPE prop_obj[$] = '{}, bit [1023:0] prop_val[$] = '{});
`else
  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_debug_opts_carrier class.
   *              This should only ever be called if debug_opts have been enabled.
   *              This is enforced by the SVT_DEBUG_OPTS_CARRIER_PRE_CB macro,
   *              so clients are strongly advised to use that macro to create
   *              instances of this object.
   *
   * @param name Instance name for this object
   * @param host_inst_name Instance name to check against
   * @param field_desc Shorthand description of the fields to be created in the carrier.
   * @param prop_obj Object to assign to the OBJECT properties, expressed as `SVT_DATA_TYPE instances.
   * @param prop_val Values to assign to the primitive property, expressed as a 1024 bit quantities.
   */
  extern function new(string name = "svt_debug_opts_carrier_inst", string host_inst_name = "",
                      svt_pattern_data::create_struct field_desc[$] = '{}, string obj_class_type[$] = '{},
                      `SVT_DATA_TYPE prop_obj[$] = '{}, bit [1023:0] prop_val[$] = '{});
`endif

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************
  `svt_data_member_begin(svt_debug_opts_carrier)
  `svt_data_member_end(svt_debug_opts_carrier)

  // ---------------------------------------------------------------------------
  /** Returns the name of this class, or a class derived from this class. */
  extern virtual function string get_class_name();
  
  // ---------------------------------------------------------------------------
  /**
   * Method to assign multiple values to the corresponding named properties included
   * in the carrier.
   *
   * @param prop_desc Shorthand description of the fields to be modified.
   * @return A single bit representing whether or not the indicated properties were set successfully.
   */
   extern virtual function bit set_multiple_prop_vals(svt_pattern_data::get_set_struct prop_desc[$]);

  // ---------------------------------------------------------------------------
  /**
   * This method modifies the object with the provided updates and then writes
   * the resulting property values associated with the data object to an
   * FSDB file. This implementation is mainly here to intercept the request and
   * pass it along or discard it, depending on whether debug opts are enabled.
   * 
   * @param inst_name The full instance path of the component that is writing the object to FSDB
   * @param parent_object_uid Unique ID of the parent object
   * @param update_desc Shorthand description of the primitive fields to be updated in the carrier.
   *
   * @return Indicates success (1) or failure (0) of the save.
   */
  extern virtual function bit update_save_prop_vals_to_fsdb(string inst_name,
                                                     string parent_object_uid = "",
                                                     svt_pattern_data::get_set_struct update_desc[$] = '{});

  // ****************************************************************************
  // Pattern/Prop Utilities
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * Method to add a new name/value pair to the current set of name/value pairs
   * included in the pattern.
   *
   * @param name Name portion of the new name/value pair.
   *
   * @param value Value portion of the new name/value pair.
   *
   * @param array_ix Index associated with the value when the value is in an array.
   *
   * @param typ Type portion of the new name/value pair.
   */
  extern virtual function void add_prop(string name, bit [1023:0] value = 0, int array_ix = 0,
                                        svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

`ifdef SVT_DEBUG_OPTS_ENABLE_CALLBACK_PLAYBACK
  // ---------------------------------------------------------------------------
  /**
   * Used during playback, this method is used to update any object references
   * with the data that is recorded after a callback executes.  The callback is
   * uniquely identified using the full hiearchical path.
   *
   * @param cb_name Full path to the callback that is being played back.
   * @param counter_playback Count of <cb_name><_cb_exec> task triggered in playback
   */
  extern function svt_debug_opts_carrier update_object_prop_vals(string cb_name, int counter_playback);
`endif

  // ---------------------------------------------------------------------------
  /**
   * Used during playback, this method is used to update ref arguments on callbacks.
   * The pattern data carrier object that is recorded prior to callback execution
   * must be supplied because the pattern data carrier object that is obtained
   * post-callback execution are string values, and so the original property type
   * is not available in the post-execution pattern data carrier object.
   * 
   * @param pdc Pattern data carrier object recorded prior to callback execution
   * @param name Property name to be obtained
   * @param size Number of bits needed to encode the return value
   */
  extern function bit[1023:0] get_primitive_val(svt_debug_opts_carrier pdc, string name, output int size);

  /**
   * Returns a queue of prop_val elements 
   */
  extern function bit get_primitive_vals(svt_debug_opts_carrier pdc, svt_pattern_data::get_set_struct prim_props[$] = '{}, output bit[1023:0] prim_vals);

  // ---------------------------------------------------------------------------
endclass
/** @endcond */

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
o1zAuMxvxI7/qpJe0rJy9kxaCouzExrQ1x33AXqa7YP6YxZmdr0rPIgjslB/4UN7
dBWk0nfUEAlcxp/rRwCSW82wpAUGUUFSvsBgT2FjD0lyc32POFSzxKf4G3MlL6Vc
/WUrsPIxG6S/w9ZmUzbIWOnfiLD3ho3+35o+yyYLZco=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10075     )
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
`pragma protect end_protected

`endif // GUARD_SVT_DEBUG_OPTS_CARRIER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
lB7rCvh61aM1dlNx9XMCSKGfyL1d4d9Ndlq5+BgO5Um/N94VWnAtaZCFDpWHtXko
DwwtE58Tv9mBMsqb47y23pMPiibvySSoHwabYgfvh7sGhfSTIk3X6Am98FUbGpzu
0qOglMIrM95f8mY8Xug02dMF9RuxQY1vV941C1S+qN8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10158     )
THkpxtXj1SF0US/qIhDC+NA9am9L+/zZCarXuqOrZ8z6BGfkuTLPD9g3/lT9wBAt
u39K44XnpqnXBjDcyO7+Hz1Y9vXcZGVAS/KNCMomu5pP8T2HQAE0vVd4zNaQSQeK
`pragma protect end_protected
