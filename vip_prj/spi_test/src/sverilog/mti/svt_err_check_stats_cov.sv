//=======================================================================
// COPYRIGHT (C) 2012-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_ERR_CHECK_STATS_COV_SV
`define GUARD_SVT_ERR_CHECK_STATS_COV_SV

/**
 * This macro declares a class by the name <suiteprefix>_err_check_stats_cov_<statsname>.
 * 'suiteprefix' should be the suite prefix (e.g., 'svt_pcie') or a more specific component
 * prefix (e.g., 'svt_pcie_tl'). 'statsname' should to the check_id_str value assigned to
 * the stats instance by the developer.
 *
 * The resulting class is extended from the svt_err_check_stats_cov.sv class.
 *
 * This class includes its own base class covergroup definition, as well as "allocate",
 * "copy", "sample_status", and "set_unique_id" methods, which pertain to the "status" covergroup.
 *
 * It relies on an additional "override" strategy which involves a call to
 * svt_err_check_stats::register_cov_override. This call establishes an object wrapper for the 
 * svt_err_check_stats_cov class extension so that it can be used to create the new class type
 * coverage is added to the svt_err_check_stats instance.
 * 
 * Usage of the "override" method:
 *
 * 1. User creates the svt_err_check_stats class instance. 
 * 2. Calls the "register_check" method for the check.
 * 3. Call the svt_err_check_stats::register_cov_override method with an object wrapper for the svt_err_check_stats_cov class
 *    instance which provides the overide.
 *
 * Note that the override should normally be done by using the SVT_ERR_CHECK_STATS_COV_PREFIX_EXTENDED_CLASS_OVERRIDE
 * macro. 
 */
`define SVT_ERR_CHECK_STATS_COV_PREFIX_EXTENDED_CLASS_DECL(suiteprefix,statsname) \
    /** Class declaration of error check stats coverage instance for the protocol check statsname */ \
    class suiteprefix``_err_check_stats_cov_``statsname extends svt_err_check_stats_cov; \
`ifdef SVT_VMM_TECHNOLOGY \
`ifndef SVT_PRE_VMM_12 \
    `vmm_typename(suiteprefix``_err_check_stats_cov_``statsname) \
`endif \
`endif \
  \
`ifndef SVT_ERR_CHECK_STATS_COV_EXCLUDE_STATUS_CG \
    covergroup status; \
      option.per_instance = 1; \
      option.goal = 100; \
      pass : coverpoint status_bit iff (enable_pass_cov) { \
        bins pass = {1}; \
`ifdef SVT_MULTI_SIM_IGNORE_BINS \
`ifndef SVT_ERR_CHECK_STATS_COV_DISABLE_IGNORE_BINS \
        ignore_bins pass_i = {(enable_pass_cov == 1'b0) ? 1'b1 : 1'b0}; \
`endif \
`else \
        ignore_bins pass_i = {1} iff (!enable_pass_cov); \
`endif \
      } \
      fail : coverpoint !status_bit iff (enable_fail_cov) { \
        bins fail = {1}; \
`ifdef SVT_MULTI_SIM_IGNORE_BINS \
`ifndef SVT_ERR_CHECK_STATS_COV_DISABLE_IGNORE_BINS \
        ignore_bins fail_i = {(enable_fail_cov == 1'b0) ? 1'b1 : 1'b0}; \
`endif \
`else \
        ignore_bins fail_i = {1} iff (!enable_fail_cov); \
`endif \
      } \
    endgroup \
`endif \
  \
    extern function new(string name = ""); \
`ifndef SVT_VMM_TECHNOLOGY \
    `svt_xvm_object_utils(suiteprefix``_err_check_stats_cov_``statsname) \
`endif \
  \
`ifdef SVT_VMM_TECHNOLOGY \
`ifndef SVT_PRE_VMM_12 \
    extern virtual function suiteprefix``_err_check_stats_cov_``statsname allocate(); \
  \
    extern virtual function suiteprefix``_err_check_stats_cov_``statsname copy(); \
`endif \
`endif \
  \
    extern virtual function void sample_status(bit status_bit, string message = ""); \
  \
    extern virtual function void set_unique_id(string unique_id); \
  \
    extern static function void override(string inst_path); \
  \
    extern static function void direct_override(svt_err_check_stats stats); \
`ifdef SVT_VMM_TECHNOLOGY \
`ifndef SVT_PRE_VMM_12 \
    `vmm_class_factory(suiteprefix``_err_check_stats_cov_``statsname) \
`endif \
`endif \
  endclass \
  \
  function suiteprefix``_err_check_stats_cov_``statsname::new(string name = ""); \
    super.new(name, 0); \
    /* If client has disabled pass/fail coverage, then don't create the covergroup */ \
    if ((svt_err_check_stats_cov::initial_enable_pass_cov != 0) || (svt_err_check_stats_cov::initial_enable_fail_cov != 0)) begin \
`ifndef SVT_ERR_CHECK_STATS_COV_EXCLUDE_STATUS_CG \
      status = new(); \
`ifdef SVT_ERR_CHECK_STATS_COV_DISABLE_IGNORE_BINS \
      /* NOTE: Some older versions of Incisive (i.e., prior to 12.10.005) require the goal to */ \
      /*       be a constant if it is set in the covergroup definition. So set it here instead. */ \
      status.option.goal = 50*(enable_pass_cov+enable_fail_cov); \
`endif \
`endif \
`ifndef SVT_MULTI_SIM_COVERAGE_IFF_SHAPING \
      shape_cov(); \
`endif \
    end \
  \
  endfunction \
  \
`ifdef SVT_VMM_TECHNOLOGY \
`ifndef SVT_PRE_VMM_12 \
  function suiteprefix``_err_check_stats_cov_``statsname suiteprefix``_err_check_stats_cov_``statsname::allocate(); \
    allocate = new(this.get_object_name()); \
  endfunction \
  \
  function suiteprefix``_err_check_stats_cov_``statsname suiteprefix``_err_check_stats_cov_``statsname::copy(); \
    copy = new(this.get_object_name()); \
    copy.set_enable_pass_cov(this.enable_pass_cov); \
    copy.set_enable_fail_cov(this.enable_fail_cov); \
  endfunction \
  \
`endif \
`endif \
  \
  function void suiteprefix``_err_check_stats_cov_``statsname::sample_status(bit status_bit, string message = ""); \
    this.status_bit = status_bit; \
`ifndef SVT_ERR_CHECK_STATS_COV_EXCLUDE_STATUS_CG \
    status.sample(); \
`endif \
  endfunction \
  \
  function void suiteprefix``_err_check_stats_cov_``statsname::set_unique_id(string unique_id); \
`ifndef SVT_ERR_CHECK_STATS_COV_EXCLUDE_STATUS_CG \
    /* Make sure the unique_id doesn't have any spaces in it -- otherwise get warnings */ \
    `SVT_DATA_UTIL_REPLACE_PATTERN(unique_id," ", "_"); \
    status.set_inst_name({unique_id,"_status"}); \
`endif \
  endfunction \
  \
  function void suiteprefix``_err_check_stats_cov_``statsname::override(string inst_path); \
`ifdef SVT_VMM_TECHNOLOGY \
`ifndef SVT_PRE_VMM_12 \
    /* Set initial pass/fail cov values to 0, since VMM is going to create a dummy instance and we don't want a dummy covergroup */ \
    svt_err_check_stats_cov::initial_enable_pass_cov = 0; \
    svt_err_check_stats_cov::initial_enable_fail_cov = 0; \
    svt_err_check_stats_cov::override_with_new(inst_path, suiteprefix``_err_check_stats_cov_``statsname::this_type(),shared_log); \
    svt_err_check_stats_cov::override_with_copy(inst_path, suiteprefix``_err_check_stats_cov_``statsname::this_type(),shared_log); \
    /* Restore the initial pass/fail cov values to their favored defaults */ \
    svt_err_check_stats_cov::initial_enable_pass_cov = 0; \
    svt_err_check_stats_cov::initial_enable_fail_cov = 1; \
`endif \
`else \
    svt_err_check_stats_cov::type_id::set_inst_override(suiteprefix``_err_check_stats_cov_``statsname::get_type(),inst_path); \
`endif \
  endfunction \
  \
  function void suiteprefix``_err_check_stats_cov_``statsname::direct_override(svt_err_check_stats stats); \
`ifdef SVT_VMM_TECHNOLOGY \
`ifndef SVT_PRE_VMM_12 \
    suiteprefix``_err_check_stats_cov_``statsname factory = null; \
    /* Set initial pass/fail cov values to 0, since VMM is going to create a dummy instance and we don't want a dummy covergroup */ \
    svt_err_check_stats_cov::initial_enable_pass_cov = 0; \
    svt_err_check_stats_cov::initial_enable_fail_cov = 0; \
    factory = new(); \
    stats.register_cov_override(factory); \
    /* Restore the initial pass/fail cov values to their favored defaults */ \
    svt_err_check_stats_cov::initial_enable_pass_cov = 0; \
    svt_err_check_stats_cov::initial_enable_fail_cov = 1; \
`endif \
`else \
    stats.register_cov_override(suiteprefix``_err_check_stats_cov_``statsname::get_type()); \
`endif \
  endfunction

/**
 * This macro is provided for backwards compatibility. Clients should now use the
 * SVT_ERR_CHECK_STATS_COV_PREFIX_EXTENDED_CLASS_DECL macro to avoid class name conflicts.
 */
`define SVT_ERR_CHECK_STATS_COV_EXTENDED_CLASS_DECL(statsname) \
  `SVT_ERR_CHECK_STATS_COV_PREFIX_EXTENDED_CLASS_DECL(svt,statsname)

/**
 * Macro that can be used to setup the class override for a specific svt_err_check_stats
 * class instance, identified by statsname, to use the corredponding coverage class defined
 * using the SVT_ERR_CHECK_STATS_COV_PREFIX_EXTENDED_CLASS_DECL macro. Note that this macro
 * relies on the statsname being used for both the 'check_id_str' provided to the original
 * svt_err_check_stats constructor, as well as the name given to the svt_err_check_stats
 * instance in the local scope.
 */
`define SVT_ERR_CHECK_STATS_COV_PREFIX_EXTENDED_CLASS_OVERRIDE(suiteprefix,statsname) \
  suiteprefix``_err_check_stats_cov_``statsname::direct_override(statsname);

/**
 * This macro is provided for backwards compatibility. Clients should now use the
 * SVT_ERR_CHECK_STATS_COV_PREFIX_EXTENDED_CLASS_OVERRIDE macro to avoid class name conflicts.
 */
`define SVT_ERR_CHECK_STATS_COV_EXTENDED_CLASS_OVERRIDE(statsname) \
  `SVT_ERR_CHECK_STATS_COV_PREFIX_EXTENDED_CLASS_OVERRIDE(svt,statsname)

/** @cond SV_ONLY */
// =============================================================================

/**
 * This class defines the covergroup for the svt_err_check_stats instance. 
 */

`ifdef SVT_VMM_TECHNOLOGY
`ifdef SVT_PRE_VMM_12
class svt_err_check_stats_cov;
`else
class svt_err_check_stats_cov extends vmm_object;
`endif
`else
class svt_err_check_stats_cov extends `SVT_XVM(object);
`endif

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /** Value used to initialize the enable_fail_cov field when the next cov instance is created. */
  static bit initial_enable_fail_cov = 1;

  /** Value used to initialize the enable_pass_cov field when the next cov instance is created. */
  static bit initial_enable_pass_cov = 0;

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  /** The value being covered */
  protected bit status_bit;

  /** Enables the "fail" bins of the status covergroup */
  protected bit enable_fail_cov = svt_err_check_stats_cov::initial_enable_fail_cov;

  /** Enables the "pass" bins of the status covergroup */
  protected bit enable_pass_cov = svt_err_check_stats_cov::initial_enable_pass_cov;

`ifdef SVT_VMM_TECHNOLOGY
`ifndef SVT_PRE_VMM_12
  /** Shared log for use across all svt_err_check_stats_cov classes. */
  static vmm_log shared_log = new("svt_err_check_stats_cov", "class");
`endif
`endif

  // ****************************************************************************
  // Local Data Properties
  // ****************************************************************************

`ifdef SVT_MULTI_SIM_COVERGROUP_NULL_CHECK
  /** Indicates whether the status covergroup was created */
  local bit status_created = 0;
`endif

  // ****************************************************************************
  // Coverage Groups
  // ****************************************************************************

  /** 
   * Covergroup which would indicate the pass and fail hits for a particular svt_err_check_stats.
   */
  covergroup status;
    option.per_instance = 1;
    option.goal = 100;
    pass : coverpoint status_bit iff (enable_pass_cov) {
      bins pass = {1};
`ifdef SVT_MULTI_SIM_IGNORE_BINS
`ifndef SVT_ERR_CHECK_STATS_COV_DISABLE_IGNORE_BINS
      ignore_bins pass_i = {(enable_pass_cov == 1'b0) ? 1'b1 : 1'b0};
`endif
`else
      ignore_bins pass_i = {1} iff (!enable_pass_cov);
`endif
    }
    fail : coverpoint !status_bit iff (enable_fail_cov) {
      bins fail = {1};
`ifdef SVT_MULTI_SIM_IGNORE_BINS
`ifndef SVT_ERR_CHECK_STATS_COV_DISABLE_IGNORE_BINS
      ignore_bins fail_i = {(enable_fail_cov == 1'b0) ? 1'b1 : 1'b0};
`endif
`else
      ignore_bins fail_i = {1} iff (!enable_fail_cov);
`endif
    }
  endgroup

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_err_check_stats_cov class.
   *
   * @param name name given to this instance.
   * @param enable_covergroup Qualifier whether to create the covergroup or not.
   */
  extern function new(string name = "", bit enable_covergroup = 1);

  // ****************************************************************************
  //   SVT shorthand macros 
  // ****************************************************************************

`ifndef SVT_VMM_TECHNOLOGY
  `svt_xvm_object_utils(svt_err_check_stats_cov)
`endif

`ifdef SVT_VMM_TECHNOLOGY
`ifndef SVT_PRE_VMM_12
  // ---------------------------------------------------------------------------
  /**
   * Method to allocate a new svt_err_check_stats_cov instance.
   * Needed to support the vmm_object factory subsystem.
   */
  extern virtual function svt_err_check_stats_cov allocate();

  // ---------------------------------------------------------------------------
  /**
   * Method to allocate a new svt_err_check_stats_cov instance.
   * Needed to support the vmm_object factory subsystem.
   */
  extern virtual function svt_err_check_stats_cov copy();
`endif
`endif

  // ---------------------------------------------------------------------------
  /**
   * Method to update the sample value for the covergroup.
   *
   * It sets the "status_bit" field. 
   * It calls the sample method for the "status" covergroup if the "status" covergroup 
   * has been created. 
   *
   * @param status_bit Sampling bit for the covergroup.
   * @param message Optional string which may be used in extended classes to differentiate
   * 'fail' cases. Ignored by the base class implementation.
   */
  extern virtual function void sample_status(bit status_bit, string message = "");  

  // ---------------------------------------------------------------------------
  /**
   * Sets the "enable_pass_cov" bit for the "status" covergroup. 
   *
   * @param enable_pass_cov Bit indicating to enable "pass" bins  
   * 
   */
  extern virtual function void set_enable_pass_cov(bit enable_pass_cov);

  // ---------------------------------------------------------------------------
  /**
   * Sets the "enable_fail_cov" bit for the "status" covergroup. 
   *
   * @param enable_fail_cov Bit indicating to enable "fail" bins  
   * 
   */
  extern virtual function void set_enable_fail_cov(bit enable_fail_cov);

`ifndef SVT_MULTI_SIM_COVERAGE_IFF_SHAPING
  extern virtual function void shape_cov();
`endif

  // ---------------------------------------------------------------------------
  /**
   * Method to set the instance name for any covergroup contained in this class, 
   * based on the unique_id provided as a representation of the associated check. 
   *
   * It sets the instance of the "status" covergroup to {unique_id,"_status"} if the 
   * "status" covergroup has been created.
   *
   * @param unique_id Unique identifier for the covergroup.
   */
  extern virtual function void set_unique_id(string unique_id);  

`ifdef SVT_VMM_TECHNOLOGY 
`ifndef SVT_PRE_VMM_12
  `vmm_class_factory(svt_err_check_stats_cov)
`endif
`endif

endclass

/** @endcond */
//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hBjWLP28hnJeHKw2BrNM0TUw4FZx0BMaAda3Zez+TrQXhM8TIXzX5vK1qUgfJySV
bbFKzmw9asRGMD3SVW7gTYxSY8Tst+LcN4M3t/IHA/31ag7QiF9w1dLnax00IMn/
ZGK2B3tyTI8Gf1+ku9/6LEANgKUGqkn3zokT3h4SULA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3359      )
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
`pragma protect end_protected
`endif // GUARD_SVT_ERR_CHECK_STATS_COV_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
NzS6naQ/e58cDYfdvLncsMfTktBjFCtGr242G0gl6/BZ3GI3iSrwvGrJJYRtmogi
hr0ao9w/95aV6m98AVPPMni/yW4aHUValbhSbkfRi0LluTHNobJUnltQgS6J/3h4
+oqRAPDaQYIXnFno8VlU7zsrpVdo7tRk+rVgCKRGGJA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3442      )
dx/p3KhiuskBrd9il68lZXSd0FYvV6qch/UemiqT/ftKDu8jZG2B+Pqx5ybcIt0N
uR7EurAJuDWPHA7M5O9NfpHo3SMYh5kVeoTgYUMiYqvd+jfKgIKaTQ5kq/05CLg0
`pragma protect end_protected
