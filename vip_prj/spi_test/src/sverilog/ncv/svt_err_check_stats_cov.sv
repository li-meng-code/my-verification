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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
uM2H1s0d33w8GFwuLaICSqXPYHscJ4OSeTCnouNDfOOaa0Lz5fdkWHS4o6YqlTh8
OidyDbpEFIQzxQkLLZ7PeafPXzQ/xk5Th0CcMlRGpGihx8zFDAFSPxpSb0iJe4Cz
74eYqiW15vQmk9rHK60gGbBshAocBlOJgDl6uMGwmjt5P9Mf9lBHMw==
//pragma protect end_key_block
//pragma protect digest_block
bX22VrQyZZHKfoNv5OWTbcfw2Ho=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
qpAzOLRbQXEiAcEF+Lb2ylWwGuY=
//pragma protect end_digest_block
//pragma protect end_protected
`endif // GUARD_SVT_ERR_CHECK_STATS_COV_SV
