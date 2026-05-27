//=======================================================================
// COPYRIGHT (C) 2010-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_SEQUENCER_SV
`define GUARD_SVT_SEQUENCER_SV

/**
 Macro used to implement a sequencer for the supplied transaction.
 */
`define SVT_SEQUENCER_DECL(ITEM, CFG_TYPE) \
/** \
 * This class is Sequencer that provides stimulus for the \
 * #ITEM``_driver class. The #ITEM``_agent class is responsible \
 * for connecting this `SVT_XVM(sequencer) to the driver if the agent is configured as \
 * `SVT_XVM_UC(ACTIVE). \
 */ \
class ITEM``_sequencer extends svt_sequencer#(ITEM); \
 \
  /** @cond PRIVATE */ \
  /** Configuration object for this sequencer. */ \
  local CFG_TYPE cfg; \
  /** @endcond */ \
 \
`ifdef SVT_UVM_TECHNOLOGY \
  `uvm_component_utils(ITEM``_sequencer) \
`else \
  `ovm_sequencer_utils(ITEM``_sequencer) \
`endif \
 \
  /** \
   * CONSTRUCTOR: Create a new agent instance \
   *  \
   * @param name The name of this instance.  Used to construct the hierarchy. \
   *  \
   * @param parent The component that contains this intance.  Used to construct \
   * the hierarchy. \
   */ \
  extern function new (string name = `SVT_DATA_UTIL_ARG_TO_STRING(ITEM``_sequencer), `SVT_XVM(component) parent = null); \
 \
  /** Build phase */ \
`ifdef SVT_UVM_TECHNOLOGY \
  extern virtual function void build_phase(uvm_phase phase); \
`else \
  extern virtual function void build(); \
`endif \
 \
  /** \
   * Updates the sequencer's configuration with data from the supplied object. \
   * NOTE: \
   * This operation is different than the reconfigure() methods for svt_driver and \
   * svt_monitor classes.  This method sets a reference to the original \
   * rather than making a copy. \
   */ \
  extern virtual function void reconfigure(svt_configuration cfg); \
 \
  /** \
   * Returns a reference of the sequencer's configuration object. \
   * NOTE: \
   * This operation is different than the get_cfg() methods for svt_driver and \
   * svt_monitor classes.  This method returns a reference to the configuration \
   * rather than a copy. \
   */ \
  extern virtual function void get_cfg(ref svt_configuration cfg); \
 \
endclass

/**
 * Base macro used to implement a sequencer for the supplied transaction.
 * This macro should be called from an encrypted portion of the extended file,
 * and only if the client needs to provide a 'string' suite name. Clients should
 * normally use the SVT_SEQUENCER_IMP macro instead.
 */
`define SVT_SEQUENCER_IMP_BASE(ITEM, SUITE_STRING, CFG_TYPE) \
 function ITEM``_sequencer::new(string name = `SVT_DATA_UTIL_ARG_TO_STRING(ITEM``_sequencer), `SVT_XVM(component) parent = null); \
   super.new(name, parent, SUITE_STRING); \
 endfunction: new \
 \
`ifdef SVT_UVM_TECHNOLOGY \
function void ITEM``_sequencer::build_phase(uvm_phase phase); \
  string method_name = "build_phase"; \
  super.build_phase(phase); \
`elsif SVT_OVM_TECHNOLOGY \
function void ITEM``_sequencer::build(); \
  string method_name = "build"; \
  super.build(); \
`endif \
  begin \
    if (cfg == null) begin \
      if (svt_config_object_db#(CFG_TYPE)::get(this, "", "cfg", cfg) && (cfg != null)) begin \
        /* If we got it from the config_db, then make a copy of it for use with the internally generated objects */ \
        if(!($cast(this.cfg, cfg.clone()))) begin \
          `svt_fatal(method_name, $sformatf("Failed when attempting to cast '%0s'", `SVT_DATA_UTIL_ARG_TO_STRING(CFG_TYPE))); \
        end \
      end else begin \
        `svt_fatal(method_name, $sformatf("'cfg' is null. An '%0s' object or derivative object must be set using the configuration infrastructure or via reconfigure.", \
                                       `SVT_DATA_UTIL_ARG_TO_STRING(CFG_TYPE))); \
      end \
    end \
  end \
endfunction \
 \
function void ITEM``_sequencer::reconfigure(svt_configuration cfg); \
  if (!$cast(this.cfg, cfg)) begin \
    `svt_error("reconfigure", "Failed attempting to assign 'cfg' argument to sequencer 'cfg' field."); \
  end \
endfunction \
 \
function void ITEM``_sequencer::get_cfg(ref svt_configuration cfg); \
  cfg = this.cfg; \
endfunction

/**
 * Macro used to implement a sequencer for the supplied transaction.
 * This macro should be called from an encrypted portion of the extended file.
 */
`define SVT_SEQUENCER_IMP(ITEM, SUITE_NAME, CFG_TYPE) \
  `SVT_SEQUENCER_IMP_BASE(ITEM, `SVT_DATA_UTIL_ARG_TO_STRING(SUITE_NAME), CFG_TYPE)

// =============================================================================
/**
 * This report catcher is provided to intercept and filter out the following message,
 * which is generated by UVM/OVM whenever a sequencer generates a sequence item and
 * exits but there is a subsequent put of a 'response' for the sequence.
 *
 *   "Dropping response for sequence <seq_id>, sequence not found.  Probable cause: sequence
 *    exited or has been killed"
 *
 * This message has resulted in a great deal of confusion on the part of SVT users, so
 * by default this message is removed for all svt_sequencer instances. It can be re-enabled
 * simply by setting the static data field, svt_configuration::enable_dropping_response_message,
 * to '1'. This will enable the message across all svt_sequencer instances.
 */
class svt_dropping_response_report_catcher extends svt_report_catcher;

  function new(string name="svt_dropping_response_report_catcher");
    super.new(name);
  endfunction

  function action_e catch();
    if (!svt_configuration::enable_dropping_response_message) begin
`ifdef SVT_UVM_TECHNOLOGY
      // NOTE: In UVM wildcard is '.*' and match is negative...
      if (!uvm_re_match("Dropping response for sequence .*, sequence not found.  Probable cause: sequence exited or has been killed", get_message())) begin
`else
      // NOTE: In OVM wildcard is '*' and match is positive...
      if (ovm_is_match("Dropping response for sequence *, sequence not found.  Probable cause: sequence exited or has been killed", get_message())) begin
`endif
        set_action(`SVT_XVM_UC(NO_ACTION));
      end
    end

    return THROW;
  endfunction

endclass: svt_dropping_response_report_catcher

// =============================================================================
/**
 * Base class for all SVT model sequencers. As functionality commonly needed for
 * sequencers for SVT models is defined, it will be implemented (or at least
 * prototyped) in this class.
 */
virtual class svt_sequencer #(type REQ=`SVT_XVM(sequence_item),
                              type RSP=REQ) extends `SVT_XVM(sequencer)#(REQ, RSP);

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /**
   * A flag that enables automatic objection management.  If this is set to 1 in
   * an extended sequencer class then an objection will be raised when the
   * Run phase is started and dropped when the Run phase is ended.
   * It can be set explicitly or via a bit-type configuration entry on the
   * sequencer named "manage_objection".
   *
   * If the VIP or testbench provides an override value of '0' then this setting
   * will also be propagated to the contained svt_sequence sequences via the
   * configuration.
   */
  bit manage_objection = 1;

  /** SVT message macros route messages through this reference */
  `SVT_XVM(report_object) reporter = this;

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  /** 
   * Flag that indicates the driver has entered the run() phase.
   */
  protected bit is_running;

`ifdef SVT_OVM_TECHNOLOGY
  /**
   * Objection for the current SVT run-time phase
   */
   ovm_objection current_phase_objection;
`endif
   
  /** UVM/OVM report catcher used to filter the 'Dropping response...sequence not found' message. */
  static protected svt_dropping_response_report_catcher dropping_response_catcher;

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
VJiiL2bsAAWZSvTiCx1YDTcLzaYVjimJ75OVDDgTwiichIMtA8Ur5PgNDquZUnSq
U3CJo+X5ECPVKSjM9F7WYSGMXTB9iItg28yy4EcQYiHmHN7xuAfssGNk1KVf9OCz
yvjYG1Qh22tDBeNcGpApaBclWV4TIhVI0dXVm/ug60M=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 606       )
C5D9XiFVKx7UfqLYKV5xTvrENkQQFErRguLHuaAD8DWIEkBeFLeUqedtxzUF/dpE
hypLkiMGTOXugpXCSw0yEkSHHxyWhK6h8Hgr+qH7xJ4h7+0jYI1Twhgthoj7Ekps
pjE1QEFnqnlUA5ZlaT3ZVs4vW7Lm46sOIoHNZamFMcn7RzNwyCJa7nhOVAJKTwuB
RFbjuUeum1vXVjaGMZjIKLzyA2a1dnCcEFrk0Lt7q+zmwCbzXPDxXiupV/rhyCKs
+UAs/JgzNawSpcSx4wrsHdY/668U5aj7wbaIhV7oCrFt+I8g9RIIANh+RhMvn1/Z
ekOZf1D1IE5gQMJuoHGHXuceJGJS1s3X9bNGvuD/Xe3muegzttwJ1jrEVT7EPUYS
+qCK0hfueKIkhfd0n1UDoKAVwb9SPDo94rwlZMsVEXn0Mpiw9Iw4NVxfvKUguDnn
jg/0exvKSGLXziKy1UX/7gI4zWIYPUpfzpPTeuDChiVgwXXhEg5PnlxBNG2g9bFk
HGyjSsuDHfzNTWFOdc7GKMuEosJ4VnGiQkXdcpLq5Pqi23KwxEhMvwaTDwZSVBDD
UbwT/yFawsLgkBG0aCUxkS4cWkgM0DrkheureM2atHwk7I9wAZuFAOMHC9pwiG4C
+mOaLPYsASVP3QAhytFv/IrvxpibhUWUqD5BOvV/uK2XHIz9RZZO1PVFY4VZF2WP
BPeYI/ydFpkOBRQhxrEeX1uBgAvokofb3/rRMkGY/fBk4t/WtnfSlO3MW4yHnOLA
xTGWM6xRm/40GfkoZ/txWBKVoRlQvrokvhuglwrIO80=
`pragma protect end_protected

`pragma protect begin_protected  
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
pBbDIWrztSFvzYwiWRk5e6ZQ2HTLlpLX3Kpu8x9EqK8oWQBN6FTCCsSyU/yew+5T
jhYDcjCTr9Z5LjJehlltNoNmqLb/XVBvY4QeHAO65f5enWnrvNjc7NxQaC5AhP4F
5V14NHFnLP4+KiMemsXJscUfyx41T8MM7y9DQJ+J9oc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 788       )
sTpY/kZjhUqPni51lg86UVVTvF6AUe97x67quxdKEVv41piI36plCeDnSxXKt6IC
0yE/r8B8ALhT+VFNNc7lbfDuW1DgITiYH0X1GI9URFJHfo7sqEBdgE108SRPkJ4i
n+UUbLhvoVXei7MZ+5NvpLuQVxU3TVfVjRkn0InIxXgtJ86A/5BYshEBYLlwFVMr
kuSL2gRbBNaDelwTF9XfYDrILtPoW9W9SkBue63OeVUptlonxpPkO10N4e6PzxKv
`pragma protect end_protected

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
PIT/Ia9zuSip1+LLgpkssywRMNN+neYtIzjSYANizLwbz15GOGjt+DCixJsy84gx
eQaapjC+FaLanixcS8O/wDx8/KbF9AYZOhOBfbCC15ZvIA7GaFLS5vXuDuM/HKiI
bvPnb0KTSkUE54/pIdr8G8LJP49bGwFytzqBiuC96DM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1211      )
MEveYa35xtZL2HNIg5mwg7L5nwghX+tUtP3sb0HC2c2ko8axn9Nlar8Ix0w+dSd/
wvxswRwFQ4GEe7ixSCbNIxS4nP6VmxAeIss93W35w26zCq4kw5SyRHLn3xq7qRgi
62LOf0OGsY8/yG5Yo/wbojJLDKGV5cyuNk/rt7LUFyp5szVJOGUWXszvdti9Zi2Z
Kl4Y/MskvubS3RVkXsMR+oHkeV3xIx7w4w7ikO4P5v20VtD3wBajvUnrwBpFjmr0
ggXVpd+NJfnWhw3er/wEkezJkXonHSrGCpQdNuY6tDC/Y9nRd9Go1bgeKDrnvJXP
E9imhEexGFIt8ZoclkfgrjbrPyP1EBbF/tL52SAgJ/ICixCQmT2QdX1w1yBrhn4O
UKxnJTtm60XnxAShgYgnaR9TUQ07CKfOdcH0U+soWj/jD1SvtEK6hWGFFfprBnL4
SBmFWHcsD6SYNYwr7MX3DPQBCtBPQmt/lrvwSsrxrwIKrHuLoIgdEuWRHNqYYIqt
c/SsDXCqW8UFO4A3g6+2OLg3SptGeI7If0ZiZqNMnC+xnLnMXRk34nskyhedbBIM
`pragma protect end_protected

  /** Class name of the transaction that this channel is customized with */
  local string xact_type;

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new sequencer instance, passing the appropriate argument
   * values to the `SVT_XVM(sequencer) parent class.
   *
   * @param name Instance name
   * 
   * @param parent Handle to the hierarchical parent
   * 
   * @param suite_name Identifies the product suite to which the sequencer object belongs.
   */
  extern function new(string name, `SVT_XVM(component) parent, string suite_name = "");

  // ---------------------------------------------------------------------------
  /** Build phase */
`ifdef SVT_UVM_TECHNOLOGY
  extern virtual function void build_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  extern virtual function void build();
`endif

  // ---------------------------------------------------------------------------
  /** Run phase */
`ifdef SVT_UVM_TECHNOLOGY
  extern virtual task run_phase(uvm_phase phase);
`else
  extern virtual task run();
`endif

`ifdef SVT_OVM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  extern task m_run_phase_sequence(string name, svt_phase phase, bit sync = 1);
`endif

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
agYBDsv1r/wDfHxjYygSS/6gpnP0sCeyJ3kQ/RyfjvCYzl/ai4/mQazmTT8UMweV
Hebu9Wq/FEUKGfIaVKvvqY5+m5hJotAmIz9L5KlUnJSJbttiSv++PsM1M5EPyGTh
2HqoqF/I0ybZ2wTI4ADj6W4dAgPHabqSQ7WDY70+eng=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1614      )
zLPqd1toJA06KymRGRNacKphEB7toHdh9dv4Wszx74RPOG7SQsrU9eUBorxLlubE
jL1LqO8agaT3SwRWCN7QjH2Ovv+FN04SLsIu7yw0rlVUXIiTLzInSMXJ2Otoh9P5
2/cLL4VBIrwh/Mntwpv42IIBeD3b/b34sGYBICkXPqybWBTdZvuNo4qNNKBB0Myr
E9yVwtAvTtZLLepoETzSPZcZJHwl4tUCfWZ6iBUyyzFsbAaB4tgZ3dL0vMzLL84w
xdRYNzZJO3w4Jn61JonBEkJ6rHQf/0ZFqxIyRIV1fifgPYpJEKS3r32NASe/dw42
YwxCXUFQbj2QyA9M5qN/LA0YwSODGQGi9G+WUIE5SFr9muyue0L7u1iiESWym6Tg
Rlx9tGD5Uec3pQQ3M8h0X4JMfyAmtM1eQSheu+g9r8ktqWITXlu//814RRmdXlqj
2JHTP+zB+j1CbCsxRBCBwA9DmyuIiNIuLsF6XjGvef6UitrkqilRYA5yiS4tNDTe
H0KXXRNtk921ZdK22dd9xLY1DioL292KB5+JtK8Fr4g=
`pragma protect end_protected

  // ---------------------------------------------------------------------------
  /** Returns the model suite name associated with an object. */
  extern virtual function string get_suite_name();

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
JhaaVoogxNPd/Br5kKpmAK/CTtszcrlluSKnwjey47Vms6Cpvi/yWk45WRgT5L2M
/hoRU4G2crLFWj3JgLWrsGWPLSRYa/rflCJH0plpSXx3sllJnQ9VFfo0naZyW6x6
VFam0binpaW1k6jU2TMPErq2VQNdaHDRohuXUbY7gho=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1982      )
FtlFLxK+HQhPiLJimbDRAPRGSxQqwHoutfts3ZzgnW7a0BZrfoD6k04gQNvQJ8gb
6QREOsNGKhmZ5PPC6qCmWNHZMJDu0z9f1l0PFRecjMRn1xF0HVTHd8xxbz/E5zpm
HG44GttWKYhP+HQ+wIIkOdXYkE1K7fzZyCk6NAOTcPKLKg2gxOWIRjb8N7eledPf
fnhpEKan1ssATappu0sl7o7cjsbyuPRv6L62/X9/pWVsad43avfXQP/zZ1nnKyw7
quxXUoGf9JbqZQBH/eO7BlVlwnRobCkl2AVt3R2hrrQM4lXybMmJcUMQ+S4HcoxH
hKzrCwAZLkC1ybU40PlMEo4Qwy/2tDSIJ38e6FSIijagSl7H0NtLUPR9Itjtq+Ir
eTU8JzqgxnnReL1Ob3O8YDSfcBczmcHt/DYNVkVlI7YXIW44WnSLXYBmbGwywfdx
HvuLD7aq8DbqktCb2lvYWRbfX742I13NU2Wgje+kvQjoQkyy1pei4I3eBW2AElnu
`pragma protect end_protected
  
  //----------------------------------------------------------------------------
  /**
   * Updates the sequencer's configuration with data from the supplied object.
   * This method always results in a call to change_dynamic_cfg(). If the sequencer
   * has not been started calling this method also results in a call to
   * change_static_cfg().
   */
  extern virtual function void reconfigure(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns a reference of the sequencer's configuration object.
   * NOTE:
   * This operation is different than the get_cfg() methods for svt_driver and
   * svt_monitor classes.  This method returns a reference to the configuration
   * rather than a copy.
   */
  extern virtual function void get_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the argument
   * into the configuration object stored in the sequencer. Used internally
   * by reconfigure; not to be called directly.
   */
  extern virtual protected function void change_static_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the argument
   * into the configuration object stored in the sequencer. Used internally
   * by reconfigure; not to be called directly.
   */
  extern virtual protected function void change_dynamic_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the configuration
   * object stored in the agent into the argument. If cfg is null,
   * creates config object of appropriate type. Used internally by get_cfg;
   * not to be called directly.
   */
  virtual protected function void get_static_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the configuration
   * object stored in the agent into the argument. If cfg is null,
   * creates configuration object of appropriate type. Used internally by get_cfg;
   * not to be called directly.
   */
  virtual protected function void get_dynamic_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Expected to return a 1 if the supplied configuration object is of the correct
   * type for the sequencer. Extended classes implementing specific sequencers
   * will provide an extended version of this method and call it directly.
   */
  extern virtual protected function bit is_valid_cfg_type(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns the current setting of #is_running, indicating whether the sequencer has
   * been entered the run() phase.
   *
   * @return 1 indicates that the sequencer has been started, 0 indicates it has not.
   */
  extern virtual function bit get_is_running();

  //----------------------------------------------------------------------------
  /**
   * Finds the first sequencer that has a `SVT_XVM(agent) for its parent.
   * If p_sequencer parent is a `SVT_XVM(agent), returns that `SVT_XVM(agent). Otherwise
   * continues looking up the sequence's parent sequence chain looking for a
   * p_sequencer which has a `SVT_XVM(agent) as its parent.
   * @param seq The sequence that needs to find its agent.
   * @return The first agent found by looking through the parent sequence chain.
   */
  extern virtual function `SVT_XVM(agent) find_first_agent(`SVT_XVM(sequence_item) seq);

  //----------------------------------------------------------------------------
  /**
   * Implementation of port method declared in the `SVT_XVM(seq_item_pull_imp) class.
   * This method is extended in order to write sequence items to FSDB.
   * 
   * @param t Sequence item supplied by this sequencer
   */
  extern virtual task get_next_item (output REQ t);

  //----------------------------------------------------------------------------
  /**
   * Function looks up whether debug is enabled for this component. This mainly acts
   * as a front for svt_debug_opts, caching and reusing the information after the first
   * lookup.
   */
  extern virtual function bit get_is_debug_enabled();

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
BvpvQ3Y7BMzwWKFHcB0XE/i2md9BN4fEp7C6yqF4yHxsxDM0zmqnMyAQZP7TivtP
VSlw3tDM1PswBgfr8t1smVnhXOchxlo4U7ElJ++hMojW6TrbZHsnK3UdzO6lJy0f
lW82+Aaui6hka9wLQSaDadQZ5O7/2TbwdkRC0AY45+4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11916     )
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
`pragma protect end_protected

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
KuJTwVp7rdvMQmtRbNr8XerC4fubxo9C3lfElPdTw404hhvTcHnTQctpTRW8/9sb
p3eYQEE5KCOHpi6Z/OWk4exhLLtHJLHURucfX9LexevBUtHgGDS9yEERhzR6F+bY
pwKUb+c6xvlmHKHbpFWuq9wxxBmM799aWZjnmeDooGU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 16427     )
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
`pragma protect end_protected

`endif // GUARD_SVT_SEQUENCER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
lFBbEGqVRd6APq7oow9NeH+Y4qcKXslzWU4+p6PDoA5KK4gOi2hfq8xwm3C/R6L/
bI66dHNlS9P/2u+Obrvef7IofG8cwfG5fEdOD48mK6NHvRbCwTXgZNIcj2qIe2DD
hc/Tm3VS2QDTsbXC8cSjTiXV2HGFguIR3Z4lMHE4pxE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 16510     )
YlRy00Qe5Xyl1ZiTo1WHNpzdkfuNWHUPLO6l0TVWg6yCsdPsOg9GxVy9U2jogqvQ
eju5I5fqxrEi7W9x7M0Vz1jWSDGK5gHBHk48KCi38/zt7eleHCncicl4zbL/DxG1
`pragma protect end_protected
