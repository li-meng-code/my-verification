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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
VG2IIW87VfGPGHM7OXt2UN2oS8JV8gV1IcuqXNSB0a5G1DLUOw+w2/VUxF4Hympl
gCXVQKNKgApgs1LF5r9fI+/w5KeqncntZK0QZeThAcRSFZJYCoe5Rw+Dn1bUTFLu
G1jBxv3B4kkC08Bp6ZbRTLbhMCQg84vICpN1AkC5/Yn6btN88mpafA==
//pragma protect end_key_block
//pragma protect digest_block
RJvfop/dvsOiMwVSUuGtquj/4jY=
//pragma protect end_digest_block
//pragma protect data_block
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
JbaMqwczxKPVB22nCgq1ug==
//pragma protect end_data_block
//pragma protect digest_block
HObzGCTxu8OEC0rxHLtduYVxgWI=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_DEBUG_OPTS_CARRIER_SV
