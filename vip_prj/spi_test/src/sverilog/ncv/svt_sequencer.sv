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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
EtaCBbtnOuks+3JUkdiW5/ssh3C/VE0CbKWtDM9Czl3m9AkSiWmwJJHzscfvNdd0
tDf8nLd7SiOkjV/5F3IEYfCzkBCqv+PW/ekSPd8FO2t0WoTX1WnlKEY6697mqAPJ
yQ69zTs0mQ/bkEMI1lB5bhcgN+4J9OdvfPVdSTUSncTpstMyP7JT8w==
//pragma protect end_key_block
//pragma protect digest_block
dvGByIZOk9+EUFArqovw4NeNZKY=
//pragma protect end_digest_block
//pragma protect data_block
fXsOj9x0mxkzJfiy0W6x0co+3efrZH/XXLqB3K9T+9fXYISpwLM7BxBiM7VPASFN
7kTA/hVHzBb6SWIU7Xn22GQDieUZCi7pPuIQs7+b3iQcfeC9/2QTUKINPZofDQS0
vTAnRlsqbSWOFKIfLD4WDdkyBMKffEBA303FAA5Uiknpl4dMm1u8a+o4LZbcsuAP
1rOBLacBow+fpKsftGfUXyy7BdfvVlT0oFHNyN4Luv2ZpJmmKQEtwO5qqsf2BbN4
yaSlETF/htJ06Wmqsx+mQVbYCvDky0UnecWHo/rsp4JSPVVf3qtS/49zo+EhBaSj
3w+ehfg8ZJrL+4vfeWY8IWR0ajGgwDmOszzayItphaGVXagKjfMUWuhyophddw6d
aiXdq+oztm2QZLWsYqg3dMY1CnlvkB069GnnL+jmVL8Hk445OG0qnqHt10CjhIwL
Xbcgy3LfLS8yo4X1kR7od15aky9sWXM9y+oeNm1m2IZtJgaogF75Bp8l73WPgTXr
T/GVJMZ/eBbiy+IU6LqIQPv4CVsx/9oCLSILyDotC709tHAsmRdmvr8jDKPmaC7C
LlgIzyijVy/2yziZLxwKOB+w7snSm0YoaltIN70cygJvANCg3aVejfoRNJg+RzDa
wtLyQtKF+9laaZfgS6f7y/4K1y111qjwcpirU12llgrvsYcY2GBOY5PU9o2Soi9O
QPhUnOGd92OA706jZZtJzABUq2J+bpErBtSm3PhAlEPS4nNDSv53mB6W26ntuC2I
Gk1EHP6kyYW+JkQn7EtaVUVsoosnMBXYe5Jv3DPGEXqCApc6ZFMX+6pUzlQ93Rxc
lKgfz6I9frRRq4+YF2jbfOgu6gHaLNdzNG02GB0fZVgA2zZxUF4pn4nTMBuTwiNM
eI92pb4dZFvCKDDPutJ+s0WRN7Ci95CDWKd6/m0l+uoIwbXeIUqd9clk0UuXt+oR
iNvdY7YAmAsPJrsT1kQtDU8EfFuOkUqRlaZ6PrUcEJ330r6AhHYs92ND7F2yDnut
L+207zo6o2MgoXctF4LeAQ==
//pragma protect end_data_block
//pragma protect digest_block
cjNs6Z+RrSO+2FI/DXhbJW9oy9Y=
//pragma protect end_digest_block
//pragma protect end_protected

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
2YvFb6Hbo6PZoBsdYfIcQh2mGCEQPFNovmNEiSv/jWe1rI/MPW0STbTwEhVLTJgs
2yufWXtUWam6cWGarrU40M2QnFVhlFh9amKX7gNGso6DuLrAvj0p8Vr7JoyPuSCR
vww2LX7UVwpouzDkxVGrEwSpz7WWkkZV9c8S/tu5/0QLUNL83qFAaQ==
//pragma protect end_key_block
//pragma protect digest_block
YLrcrCGCmgEe4D0NtsmNajn6xEA=
//pragma protect end_digest_block
//pragma protect data_block
lj6TMvTCGLCqmyLqYDuA5VjZR9iARSc/1VcTXQ1NjF6aaESUMUD+Kh1lZxkokl8L
GQRp/gw3W73BTMXEnBZunnIeQPW/GiFJuDBqV+YaYWfeU59HxL1saUhIJXV2vlnX
Q68wNOtlRAwDRfC04L7a6/mTTdDVq/RRVw+0GgK7hhoNkZB0+Nymz/+93twn8LXE
XVl8RH0bFU2PDLyaT1LiKzMOkC455iGGvJorAlb+ckEnhOW6pTjGfkz8VSB6cxlg
9KftkFJyWFFN2NUZUu59jII2S5z5kc7syp1l0A8CRFCXg15VxsoJyEy82zoPfSds
ik94n6y1qMur1pdFm3WzcWnn9pH6g5A3c7REuHsSZeJ3Ek94ij6Y6+pPLAQaYrvW
E/HG74fxvTyaUD8nBYFqkegQcuqHZE7XNquwULgbQM9BnzHWrfboDhGfBUc95/2U
W0rxDFt/Gq79N7rZEUCO2A==
//pragma protect end_data_block
//pragma protect digest_block
Utu5NSPXa8wmQ4dTNsLjEjk6Lqw=
//pragma protect end_digest_block
//pragma protect end_protected

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
FXJb2C55XOxmf4bbymvPz76hyh/lUJRXBFMDsUDDPd3fMxRT/9beoJ5kz8TeCy/Q
ID/hUbjRDoMnmNvxSsvIoUzt8Y5B1dzmhnvLDYUQXxettBHU2cLFeytUsohm4eyh
9L0fMsoGcA6e4MArsEVJzSdDF5XfjusEPluU2+o0FZhnxAvXvZ3uHQ==
//pragma protect end_key_block
//pragma protect digest_block
H6CYhyJRSmQqpKleMG0B7AaotkA=
//pragma protect end_digest_block
//pragma protect data_block
ncXfR2Ww8WG0aGatPiLdYrx+BdZAh2ZgfneZGoj+i3KwecZXMNLqLTYYzQBZ5DUJ
7y56xnjDgvjXuNF/ZCRV8Ko7c6v2xyRGSegOttk9T/NbDDLbJQdVWv4O/WxStJyW
600YqbiWJ9/SjW88C6IVN1IpCASaNZFj53LrhDUgFhKxvpyeQCis+D1cLWgkTaZ7
bT0ae6e2iNZSG9oVUgz0NLoiEB2M3GEAA/AflewsqlkjOHUZkrceQQgdIVhc/lfj
UHwBK9VHL26VLATW51pxOoDHYIVRcrX5o3mb/WN4glndlDzrSwGp7zDY7m1Q7TCp
WccVxOlr7CAnPM3nIi8fTLf4VKnyFV/dJA2390RnwgbAVi2AnMH3n6ifeFbrDT4+
9um2lu2SIsCPZJjDMdTXW6Wx+58Yc/XAviHF9/b3zJkOVQJ4ImgKjN2TUX1aVK9Q
E1NUl2n1fK60wOmq7eLx5CqYvtZXJe5Xq+1Gu9mErrOaR6ewvcWuekwGiPKNilFW
SdsZliPM/4/FqNiqz/aHFnU7qwHjRkpYG3ScfXIFinMWlHnUQFWdxCH+1sjRuvFQ
Yr1fmevWLuq0PG5rugGmilLUb01DhDigY+L1hgMsLatVeF85eJfjQG6WaDKq1iPq
v7D593IAaMhHEukvXhlXYa7mCOlVGOrvO47JCEzfmyZSh8S43nf9EaATWbCAb3PN
uroOU+JLggIfnIxEh8nFopxvxDFtIPiboXKJe4BCtyxlEDqOfeebrFpC1vMf2gdf
FXsL7Y/xuYUCwBPcTxRvPA==
//pragma protect end_data_block
//pragma protect digest_block
S4qapW7Z3bzO0dLzDPurJ30bVWw=
//pragma protect end_digest_block
//pragma protect end_protected

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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
1y0npxujmpDdfjsOQ2ZIASs4opJDFRR40Je/Vt0fBNdYfzdxNd8f/zu/bcj2JGmi
HVkmLE61LJ/tg0fbjWDZn0GImkWBnYwFXcgxCNRBXGI++JVu36qN7Mj1lyWPxxaX
DNaxuBM2FyH8EyCbu0DmnPGnmLG9oGdKKwqBCgP03GAYDvooUS3J+A==
//pragma protect end_key_block
//pragma protect digest_block
GxKqSQ592molW3VHOl6m9vIUtHE=
//pragma protect end_digest_block
//pragma protect data_block
lA0rpa8LHll0ogoJM6udQPvVDoA3nS4NBSnkgxgJh1lpJjPJZBgrua+seXyBA81D
id71oEJDqDHSfcZo8gZv1UcCU7W5F/HYg3cQ/iZLPTu5pwDDFbBSyIT7RcMcTjO8
qGMZR1YOQ4JVIzhZyTQ0s2Ozqt2Ef5c7hDvLslzgIAVLIVyiOkTpie37mOb/4/5P
fymD9ZifOy2EkPVXdUVg6S8TOI+xjrPR+dtIW0oIOAUY4BaWDrt3uUPKIjGrzOCm
rBkaaJ/yYvmeJrhgDPkseZQmZzANUlrAiZlrwNH6UTKklIZMatG/hYnQO5ipKy2a
hnh+1nbcPqq9RUfA/2XwGkiE+yLgAFEI8mlrMEvu650JpKvFA0o0by2DyvXRIrC9
CB3GBt2Jwm6yhIcGihlm7ZksnPah5PSM3jJarHGskODBNy2KPCxZYXBcW9++J3QN
V7gsr3kaWpA0MP+lbYiTBGyc9VkGhBbRg4qelJYHwh6kUcvGts2R5LOf9QVcaFNt
FgjpwEdgp7j94XsNhPUovYCrtfXDVvH4UIqhFtaiVusvu47GNj6AiFIvEsz0x6Pm
d+u8V9NiiWx6mTYHe4rKUMgsbQ9mzaBol/fLZRB9MTaHze1iYIT8izhzN5Ti8CMA
Nj3TEOm/zMj/vFeqx9D3nke/xZAXckUf/3t551J4EamXl3tybtl+l1OU9uBfhKG5
3mjvSIlObnyZs4XGhqkKtZ/vcjz7wqF/4LB0f5QIleW86r/Ya50RwKmaUsOOW75q

//pragma protect end_data_block
//pragma protect digest_block
9P8vIENOejhOOsdW0NMTLGVcAeE=
//pragma protect end_digest_block
//pragma protect end_protected

  // ---------------------------------------------------------------------------
  /** Returns the model suite name associated with an object. */
  extern virtual function string get_suite_name();

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
z8jcIrLhaqgiO2Rkb6SEttug6+LBBgmUxEkwJsympmAbxtd0jrCQc8EbF1JxyOkH
QVDGNHCs4hzyYD+HTp6HuJEBDZDUbTADbfZarN7pO3WRxTogaMLsJA6B8lBh5mdZ
Qe2VWPs1zHmhxFiJRE2uQhJSpp0ek3Qe2xUGSHHhh5TbylzP8/A9Rg==
//pragma protect end_key_block
//pragma protect digest_block
x9UVN/havxB8JA4Id4lIfzfKKhw=
//pragma protect end_digest_block
//pragma protect data_block
MuU/2O+ZKjQcBSFyi5Y1Nf+l+0a9MPAzvg0B0pLnsAiow3XFcANmhCumoFQmGhx0
HVBTNtJXemOFzbyhWOMnPuse6GgAPY+6Wjv1b4hWHouzA9R31xbIGECkq552bDnf
HjsrH/5E3zFp1/Fs5ZeEICrWTshoDQjTD6k6mpiA++DBK12zLLSmp1kH7N98v4+C
e8fHblSHZ2xiUxO3GCxc8R7ZH263FYqYNyLmMAm4f6+nFLWFftah2pBfkQuRHBn8
rq6eonrUgZjXtWZ2yzE1kGqgqXJZ/4GK1Fg2mzxk/FA27OUb8YDtTXwCk8y29gHF
y+b8XJ78dTVK6TdW2AER7+LHoWt37yj6b8dyB1rrP+1OzIEOqcO8PBZtxe54coLP
b0y3PkjDRN40EdwAQyShNCsm2rHsQwDXLu2dm5N9eHX2ZoEianQS6j9kVC3GOfcr
XToAbUvsQ7/o94ZzK+X+jWrievNqHv42KhqmPSI4TDResKWbnSVFj4W2qVihwli2
HV3/VSL4CJ4+Fg0vVGqqwOa/JOLXw73FCk33FSfk7QvmM0rSfPNBggt4YVL3unnE
ihnzyZUJCiZUS8dXgHJ3Q553VHh0xSsTt+VdFoJHFTqX/8gktBeCR1+eQdspMX0s
Sbpuj5EQimkKD7GYAv+TcqJtYSDBiEGua67eYgzCUDW5EOP2Vih2nKtsJdeE979K
SwIIB5Z7+Pnx9vAtfBnNng==
//pragma protect end_data_block
//pragma protect digest_block
rKgJgDebjs9b+BGZFICyzUBpumU=
//pragma protect end_digest_block
//pragma protect end_protected
  
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
4piJbUcyuF5EUBygTR9sBYsoSHD/eGrVKNSfwvlkWkGlkcWI3e2KZb1dqCmZH9m2
8+7DN7M0+yi3Vrk1+Q7o7nh8cpLq+8QhWMvrz1sFHGHZpOC3IEutDbCV6pG1MYyC
gYbNvPWWkB9vZNJ0JvIrmkBecUMVTfehMb46bQbOJ5pUNN3RbMaVsg==
//pragma protect end_key_block
//pragma protect digest_block
VmjN9UPHbMfop6WKUHUYAL4+N2E=
//pragma protect end_digest_block
//pragma protect data_block
A6hy0aEMJiTiBtzrOSyQ9ddXLK1XLqZIuQCL1ZZ/K8S0aMQLew3KgKbyLOnwD0kQ
lTTL1Ky6U/CPzy0KGZppYsukYYBnoR9YaWyV7BbI8KpNoRgbTKRx05xoiC4pxJ0R
V747LevKFtdZncuinVdWJq3FEYno7sJKk5UBNUItshBmM1G3IaBOQ4fiwXF6VJsb
k5KgJdzK+1hBvquyPXU3f3LgzBEzow4vLEpRPBW7RlwZZwaIVmUP5ZC1t1vIZX5K
yPgwc5ZvhrwAKHRdRx6rVt3E4PRjt48tfUeWMpoDjMRWysTtQ9BYjoSxifqH8Ra2
YcJoDmGjNhkU0xepeDpsueKJZO7I3IAEHj9CZHScWRrGrKgrVDdA3pdn2WCtoA0x
4p+MHxYLjb/A5hpjx9LoGRdbgt8T4Xexv8zBjJIk+nIcvdcYxMEv/nMyZrIIMCFa
O8sSJ0QSzTBhBJw82NcO6kXnrtCxgdliFTP+QLHqlyZ0PHk70bSLIthd4DsjLDsg
KqXzAv/6uJees7G59i1HTw3b++A5ZvxhkZzAN1TnrhBSn805J+BJvj5vzWbz9vif
bshw6Cdw0WkIJ5P5pez/zR/b+aFmYjhiFePSB7nZEbxjY0McS2uPeoVrsW5xPSSN
mq//IgvvbR/MxNLJ7+tylvwcacAGP0gc9LAy1VirpyLogrZPhfkP5xynBbEj2odK
7ps4RtoVNOEHKIknURdBtreO1E763lMPoFhsdJ2wOVCzpnfxMHZgVmQWVDSPW/we
iyXGxDTfuysemC59eSBCEana/IZjPreAoAyhcWVwEymuc8a4KETSr7oQkNuE8m8S
bqeebbOnbwyxIuh4guSbp9rb12RtdMeFfV6t6HmmXlBJ5dambE6S4Him/Y+uI4oe
wX2Rr+7Ge6/XMGL0DWyyfFoZdP8XmukfbpDO951Sv35TK2C84IyU8jjLdWulRx8p
nQuQp7v7EFkPkPxdFF/TkXxApxSOXaIlzdhd4iw1ervLkPS6v1dlzCML2e1S2wvM
+l+2Sp4KZ9MiPPvWsPROdE+GiY9taQqe+Q+nEGSjF+YAmsawIH8Y1fqwGHbbX9gV
qdGTfGvfqi4Fx/Co3OXtURzFMHksxB7HLh9OfqubfG6BWGLSIt+XQOEWBkeQ/4sD
4ppar4bsJBylpm6kJMt6Z2ExMhMGcwmmpZku/HbR3ATusEHaPmjOJWwE9lMHVO/u
tbW6aGGzPQv36zUnDCbOfodYutQOZtKKTPi+DJeS9sRyxHc7cCc+zgGoq/A6cT+i
ixLEpBhYrUTBd+7fF+/ob99FGb34mVJP0GsvsmimknnLi06ZUOgk3lfHDurdeC+P
OTV7KUhU0UXdPEWEb+LAoeIdNnEfotW06siyKcw1ql2vOA1LZjHbNN0jpjdBhIO+
slyvMLNYwWCnGj9t9mmk3ttLRFYPu2JumM8KtgmzSaBL15ykctS41SEmsVOfVoIw
P5wY1rk6bOwcPc+FhY4SIz/OJr9PkXXVrRTIt+28wzjOQdcx4h64Eb5blWGvZrOO
1dpoXQd5zrqMvjEHlOpAhVJEjwbVm63Ot60H3yK8ESX0uBVLExugnis85ergaWxO
j0miR428tjktRp+5WHp02CnQFQHtiPe7D6x1uJn/GFjHh9F90eABBivRDJJP+D8F
T6yz5f28rr2LsIQehO/QA1GjwCk40sOOb2KE/XjlEYOJ3i+Tveifj1miNK91LtvM
MiGrBW8MeelbjfeJi7aD7+CzPAqv2x3412JLsksuAPnVLvTN+ySgimExfTuAck44
TFvpL7jFubj1mQpmoWY2Aduv4bfH7tdnn2crm6uqC4uM1wuUT40VBHLhbt94Cuuq
vLObEzQNBLD2sETiTwU3nSdWxvMp2/qPXGQrq1PPvnWzy/glWNAaTN318Tz24nT0
JPCkjkAAcrusQZoIwDWMvFVjimy6Z6EUOvRV9odEQ+f4pC/+1VTsd4yzb5binGLd
eV3OHrC2G80jSIeLIBxmdq9xjUCW6tJWMpv2SO1hpl5fMCLyzmYoTYUW7+KGoMfC
lonNn7NOlc81Lz3tclWspTXpW9c3MgMOtzBwrAYTCJSH6CHyafX72et6L2k9dasq
xI9/OQ7e6LkoyQABNXhf6sDvD1lWHN9+LvQ6Dwdi9UM64UU7LX9VAQr2U361LDJK
Y2sVS2OJyksB/7T68zolpaeXCcVDRg7aK/g1rPsjNXuuvz7/YUMVO94NM83BBrct
OhhRl1RyGbnMZx/EhQPXsRgxXdf02WiSkvaQRRF7ZTgooBkSzgVQJ3mXw8ppPNyd
4V57b26mtzhIAf7d4DpJS3u9alenRRzKLv9gWjHdtmjMPRWNTlFSjsQb+7CYArli
7cnMsOsNWGI1wX3Y22k0FYwCQH5uoVZe6E/fpx6h3L5McnP4H8/2A690K5NJx6iX
sn07S3GRWm5sobw4RJ69B01X3DWe6Fdc2Df6iJH8414aFuCJWQrYML8E4WLa94qc
QhLd9VWCFJzBejIS9SFk3E1aIB4TMJ9H/XKT78YaF4kvMa+fXf3wm0wOKOGRZAEW
JGfIftOGg+XFYp43/zxLhyjrigga3+IQJy5fE/JtRqAzc8dUnvIhx6gh6UCLESrR
m80UneowCOZXWhkH4VeN62ue5DluEutIZ9XdAogdyQQqHlYYwWg/sIIh8AmNTo7T
xtHSbk3dz5C/wxtETRjBGaVAdhpXPC3clTaFKZMloQTKcyVDIvz+R/eIF/mZnmf4
3ftvDAvxoZe546E3TvXUnJDqbArD5eWvGXvqAJ6609BDCjwTzG9bfWtKlmXpGIOA
k2SMlf0Kooq/zQZZrE8DP4YV53lxdkBEFmBYAXKg0yNM/E5kVhIKyCD9oIZ2lG8d
onSlDSJ7UlsdHvKLHjpdFWxn5KOxGVhMmZLKSn3ExdOFBgtAHCT1jcxmnTSuy8CG
a0hP0m0aUbr7MVNsP5Am2w/QU9Gzb/iT+8mdpSXLiqCI2UhYNb3g8j+EGDObcXPV
KK+QzSl3ROoBzKTKJH3ufR7icKDtIcnoiT67o+IzJLiPDqJddZT+NWYF+sC9ukqu
cNQKg3/lUfxibMo/qalsOXlPoKJR8F8dYv5B0Ny42LhTD8vBV1uGLjAZeBUdipks
7Gw1kZ8E/4Ywkw/wa0U5A5i3ITNBBes3YNAvySEBqO+PRZyklzxVNrojKAJ5DejR
J8WHCsRGU6+nFKAI4vyAQg8BVdKf0E3ep8K+Fmci5vqtHcM50j5+9sCWACBrrn7z
xEO0+eHJ89k+dFRJRw0xu60iaqEgpHywnoJaFOOZIWSPpN9DM4z0DdIwDiz067Nv
ZLg9d5eDmjnNSa4xR1M0/Z2pLPLzzifVkYFhnHOAUBCQf4D0jZPZ5sLdSsSL4QBQ
KETlcx30tL1GWWBlzW4vgVAeiGXs5W6TsAbzkhAVDK8ZFXNzqBDtbn43kicUQjaX
1mak1+a2Q6X+0mjEsmSY4HO566b211TGzLwr7UJw5xXH+HGEclHtZLAwPMN0XlJP
4zjtLQo/duPilCcXu4mGaq+JghhXHGl5P5JVL/8V0wO4iYJqJofhgYP2tdE6WHbN
e37MtWAiBvA2hxp0eXTGHc0N3Rrcux9I3q6nEu251vaeRqGrhTeNpXgZBrYJDdrw
u20cCvDRnhzpS4ffDRmh+CskW/NexZCs1UwdZX4G5YYhp9qA45JgIZ3oBMYrLMJZ
t37jxYlZNZyPtip+mwQOhnTW0Vhr+pRc0r0EwJlsxM32l22SZTzvHud2id2hf44c
vdVBlyeMg/d2IZ9tjeCjKTE9Cmce7kRtx0gDVzNUz5sv3r2Ryo2MPEnYQF8NWctl
XonttF5OCOKH0Rg7g+5fU6iAKP+JSoRT2UVOnQJmT/PR3DZb8HjbO7LsgL+Yu5C5
zt3PfuZ5w5KDgJYTmBOY/FIppIMP/qv5cXmO8VJA/aQiY4ADP9g2sInn5yJsfvej
bZ4aU0hRqHYZtmw7b+JyuCcfFVZpuZv2TgEN2o3Idom/FB5qMKGt8zgEcLCThOxQ
RJW5Jd4/vwc8fTTutA9AHfvjXqgwIMKpWO4UFO2wUrRyROPXaA3wrw1Adt1hOd9Q
+lWYRUMf7KfiuzjhwGH1kzblNO69mGir+Tman1H4QfGc/xh8HXDSgxkQmfgEnE/d
2X62ntpr6VlWeQAlB1qf8+2G/lwyl6xCofSM/Pfc0lA/D2NvsJ+6QrAxl8PRhNAC
XT2etAPLNWauK6Z5a7evVRhUoiKltuUt9bcHTbVFlibKf4SWZsuI/ApVIw/wza6g
z9lpZys5LKa7tTEIdvCUx0XYbjDXBVHB95nr7lQcDdDs4FURNQSR5jyuKp2v+FUh
1EgFmHeom3+kH8nsvUNWb+eCCrVkKeDGldPPQIbwxqai6BZrBlm7BqgMejiJupPt
LQLq/XQ9AI1ijVEvLE8HwcyKq9jCTMCE81m3/X3lRiVoD8jDUVr7UeAif566+Cth
FQGxCgpEeu40N3nvy/dbR9Qc9nwi1K6I8l/JRscUoArTQQK8ahIlHABZSkz/n3AA
BrU8JxaHRXwm5hM6/TysbNjs6AcuBAnKdaZTn/tkJJQfwGrfDhQ0GYR2roCGTHJT
8wwu9/+DNdxEdhQMp6FFJlZ3Q1re9I0DGeVkt0NYvxU5jSBhRsUgo/RNPGwFlpN7
8XB3DBSppeFR9GTpvLsg4NqmaOISWzGFop87h/2LP33X1Sq4e8Sq8N0rG89MDiyf
vY22YzlutUDVwUu8XkdPOEf1Hg+7MSHNdVyxR9vchUkETNdzv3kXWsa8rieVFyxs
QtGWBDTMD2Gbe4i5V6TUb5tUz8n+7V4KiZW94L1rqNJg+FWFE/4bgcXFfKTk6uSI
CY7DEUO0UxCivNcJQ4d+/4FCobGBbGk7VV3GjLFh2GgOBOlAjgfE4uTXTPxhQ2kR
QyI41TUhZsUSUOj45kmQLHMwSq5tAMt6YXtsFKSJlVYgeOodlFXZaQ2Ojdpy5xhu
jEMmhLAsGup5rIV7qpjhObOUevXBP6HMpp8kfxRgWxY1Neysw+1NQhHwWKwvn1iT
JM4q5+8WgPX48jXgOrDyxdKsjv/2ehiz0XXLaiJjXFYDQKspWZqbTlTl467yeA8a
SbR39T3fh4oiFI6iDP0PDNH3VajMH7ceTcK1oTDF1nYu4VZyuxHR751m2t08QQs1
Z7MXC2TJoqnfdlmOUHrdobGC987MN+Dtg43EyvT8YdP4TGjYBuuyiYDUTB2VHZQj
f5kz1GAduA3+VosYcZL3rgcLusCKND6A/LbTcAyPhuUUM/hggzO+hyi9N4uNGEDX
wMh86IeDDG1MQ9lEWwtffmOcVMgCVpTAMDXd+fdJdSnllRPbFnIUXZCNK5oeCHIT
HPZGlBgnXweATz/Jc4qvtPxTJ8zf/vkMLPy+OFNKvkh7iyN2hvBXhca09yXYhu5V
v9Xvrncpa2fRHmd32oMVg/2po7OfUVpqsXxnISUxHRjOlgkW9fDAljPXVXm0mCa8
fL9VbWHcIuXcpursPvSTCNaP5g7q7I4CLCe0xr64gwVz1HwkSeXq9xsslBO66i70
1W5A69lZXapJPCCNJzfS4wVDYlZeoc5dTgcpyhej4RLHXz0P4lHFxYJoudeMNoz6
MBATCDmipT+D/JKU2gJkKDFXYVC4N0yH93RIiZ8xLMSPXFwzShQ7FVfOrz3W8b6A
1V2sjTjFgIm7gDD0fSNGpbwaAxdsC10OzaH94gounCRRshfdYM5Uv4Vy/QW1DMA0
pqqMxMFyV36AxMXPhZE3WlHXWrzLYkDcNS7TNqeCf1/ECEPv/1kJvfR7ILysVOId
InI1Kipd/4TcqRtzhyRuZX6WTqw1v+q0odXjeBl8waYL307oEugI1kSEQ2fv8DLW
JcYpxCCN3pJoV+DI9eN9TBLA1jcr71JG2IxisUFPLIAyvffQlJg6hPAJLTpFUnMO
SLYG51Fboq9mgpJFnyXXAz4CrNVkg9zUFGGswi/4Uuu4GXCZqmHwZjJOAcB0yBY3
lZizE69pBS0yOyWQnCzNQM4+eVKqcO03zcqwIl38AVu2RkOJRXVvnj6XMuLLHdAS
Y3wqmGM/lQpxQtS03+TSoQpJOCJsI7QgK/aWDx2Okbx2RrDw/mkUwXjBEQKiVXXE
8EX1mKNiWp4kr+/UYVdwscG3rd8m/FS5VbUGZLiWR4KrtBtNNXIJnt7kLF2uNGYK
8nP1vIvookxnN8aNf7I1eyoh9Uz6TkgqiJeZE370FCMH+flR70SRACjpbuyJ+nKK
Y4c+V3LPbYfp3DFsd76IG/9f2qNyEmkFyGV2bl/9foIP3p3wQYD8glNoreE1yLxH
hl5D+a+2XIBZPUE/PaeIVUR4Y8Bu3U5fto683CfaQC/JZD0u8UkqAJvyT/ZzY6KI
s1unAiZwRGcxu2qF6QPTKMwAhEsEvjVU2XpLN6Zb+6yhmTDFpo9pxIMW3C/Z4j9m
Gd2XgohjBfTnIvYiyZ0vFcayrmzPaEFbVg6u2M1F9FemeNh/vyFr+Ik4HVCb0efv
QYu4QlRDg5dTKZTJqpe95SplCnbYXegBq/DsoxdAr0C7qymbYZOtYKxD5B4hEvNd
k9EhCyWdjrce/L2aoHfxoI0cnLD6B6qfT/Rr/212d6Fsj+wgZAsnm52OY/f+kjPa
iHhVPJpjvZCrlgfB8W+IEaGciUSeiC5DEKGQQIWmPG3jCtdQWmGWu79enLcFbpia
r9uFzeDHstLGB8KuzYxaop4aA1X602fy6CqS2gRFmw3UNwWcebe8htfjF/3ggfTn
e/amE9kHhGy5UBBMB2UIwypf5l9UYQoSwxG/t6ARo+o2aTSLc59kkGOJPkLkW1jv
eZUs0vxqZpx9rEcS3NEPlKda7MIKQ5WlgDqIEANLxgM9jH0J/AceNBd00cHZS5jw
DofW1GGpmWJwwXH2fRUX5YjVEX3O9Uumgqki3k2xtLGSaxQtWf1WX+Nrk43FKW4Y
Xa7ZYJ2LgERhaTW5jrAFzLz/6mHHdb+csWvO5etmpHn906C76vfQRk9SpwLgrr+C
yY/8jGEYfp4KJiI1zMQArOZwBKSp24V+cKxVWRe6xmN+dtgigRgFte1X8Wv0+8Ly
a2k2mfmnL6ch4qwFuK+OciRQJ12xVpTae/z2+flf3Z2lhGPcWMMR3pmxB4oQazvj
Pzk6hq9j7S6bM1H0dS+yia8YqZxTt6StQ6LN0zsb50noOa2+lRe6udLmTkZ6VjIP
SESJdeuO7vegk+GXpwQ//EuHdOzDV6JtKp2r8gZrqxh0HUL/cMABUhtdPDVowhgg
XcGMkWWwItrFjpuXDFR47MTEgKsuhfqfS6Gi0+zQAsbPuFmlPdwis1BG7x5aBtgN
ewQFHYr5SC4A2sWGsrpb0RJRJhPjR0pqo1dr1TSJC6iTVx9jMgU53pC6gMNHzcbx
GR1aAfZPHXjNli/+1Nqanb9gXRP3iYGoTasa4HE/tRD3V15mDvHttOMVjDsLuEV2
8jNrIh6HRCLrjFZVsRM2kjoX/Jz/wCULfuyzX9hDrvMlYmFT6p0cxud80lHlchxA
eDzsMVgS7XxYoWeHy1UF0VccDS7azZTEhjHSQspwXYl8kxAwIOZWJQvPoixYdNA0
0uSI9M+AOf0NS5yWdt09SDcRdAEpfRfQDWe5jKSnIsnfZr15J9XY2kFQNKgyCkC1
6Mvp5ziV5qnyJ9A02cSU0s41wb3hIgb6WNf/9c+mIhvMhjVhlzvhtNre/fDevHPx
yZ8e6JKdK6paUGKguo455O+Lemg5OVrpB49FO8vOQnWVjTa++z+slnU05DS9ufn2
R4mtMb0glSUX/W43x0vnXinssTkC0S0M1so5E/d4Oet22WMaKJMUv9tJ+Ay1qk/M
majH3T3gndxVlJVo5h9F9KbDULNRBczYCw7UL+YgVJUy8g/Z75Te458h12MeH/8l
0OQaJX5O5antcvJFMEdaeqbV/fuD/c38Pyw9WWaoi39xSx+0QQTe+QvCHhSN+Gvo
ESp14CL3FZ90w+zUaprPgIgBT06CQuvWnYguSqpEFa0RU5cb+vaxBFemkoCQPdtS
EHOhc9uflgs7sDhHDTlIAfRafNwx91mXTv9wehv2UbIAAaWkgEobiYolop5gkuwg
eE8bhJvQnYOShmm/B3N1AHu6L62+OyIC8mhAedo8afOCO6N3PKea48DlGJmkAFb0
+ZmHW0RYFU4MZxsd80Mv4FB2Os/B7S7TVQnUPFMdEyWanVd4LyQU7mn+oII2q8ID
flB0Xjn3UepaZeihkhw+O/PK/fzpojfZF7xtyLw3C3x8HL4Rph9XVXvyR7xQt8FR
GbGr7UTfJWK+AznVUdCwpvOVNiIIci/+SvshHZY7AHicWZpihR1RUMZfVEsLrVB5
M8Ab+Gk9qb6kP28pKNtMFdc1fArEfkPGwgTJAOwZbI0kIJsT4+iUrwUourtT9TEt
ld7ZW+7yQk7J7shlFG/gb0Nrf40D5YmTa+y4pvvMh4iqWUX8tJhDTpfRpFobaA6j
uoaV3+Dw36MHCsETwTVKkZjrfKznlbWjcuo/K8y9lTWJvk9mRh4m4hCpkHnP4RDs
cv7kJTgVvkTJCtjp7rSMu9unfMaRce2EU/VfPXnyItX8QbLub4ACrrezxZMHIr6P
6oHHs9CnHfJrcO602WVwhCxv6uMgVCHF9/8sG3g6uf/jElpjVTfzGveyeyh2PjIV
wGB8hl/zqKRb8yPMUUipZXr519p8LZuR3XsnCy2JWFK9nH3IyMJvELgr3tjzBAQv
pBcrVGFIEmJYnIBja0AaCpX7klogqoWp4Fpab6nHgd0EtCpsB6jDg5lkB4qKlgYb
L6R68SVn8hGPSLzySLQfXQhpEQAbuEwuhopJ7tnQkOLtIaqqyZpysN5kNR+sLI/R
aAfIjnzHMdgNzNMxA0FqVl8exaEVf9/uzndmK8ZQ9CoGTT2OCN9woi0Si0e1Zxnu
UWet0wZg8sW2kMfb0avBVZwu4Qle6ZK2zAd6Q2hm5PSwnb4OK1/GkKEeMPwDLcTP
dnhiBgOUZdCwrJpZjO0ZICkRVW7LU7YCHR/RC7XwuA8gtWz27+ddrQ4Yx2p/fIwF
Hwt58WH/e1d86zKF9bx8uh49fIP7iiacCzKaY1YRPeYOFQCmBe8SY1gHHg/Zq6oH
zgcLgX7du55mB/RH2IVSAtYFU2EKJ4TNKOOcKJ/CuhWQyke8UiCrNJP84CN0KMO1
3qh9e3HnVh+zRxPP3xp7ipDmYcD4KvXgFwsrLX+JXDkSMezLt5Wcei8p+7Ub8jUR
8VJfUdqBoz63AdertfQyoqDXPLL34U3ZUp40rQyv7mYG3EUoJwQJX6ko8/Y0+R/w
1uWVbf8j/E1+nSC2dCW+m8k7szPd/uxION2J4J3zCUqUX08bdrzYLFmRVjVwzjl5
JJaHRooeo+SRJXrounnVfgFGnlrQOc05PfYrn75P4fG+XWdrGBEgoJoFTdLOOAA/
LANm/m8CIlt2FqsoQ+c3dzjoL0jJ3SMDFxJQfMzhvYCAJcIChkwBSdx3RbN71RMh
TkV+rkJHOxDtjoM4UDamsdmcXf2SToQiHpjoxd1IM4SvyK9RXRPjKgK2RKb69Do0
T5FYTzdaLkHMvj9FM3ADRBQJJYjXyGJi7Ihx2r5G4zaJRHQHhhx6Oi2nFg9bENR/
guL6cSdUjqtkF89Q1Ql2OeuoAxoQqTmlFyRBhM/1fW05SVVWtA4OsXmj3m3fk3/E
S7qzSD6Zql6zA+nqDJbB5/xuvEHHaNvr+kQpBe0gi2vVYhSrOtY6k5G/qtXGCx9X
ltmCPZZ+yBa3sF3FIgFhTkNc2vRJOryGAAtz63wxeWiU8mADzHlw3AJIunZdE0QP
Wn1AeKEfD0dMBYB1hyOGXfk1i7dtwvBzWrwMCoCaMj/+7FRfMyjui/1Bp1JFvBgY
krBCYGCMbXdt57l5gcdGZlZftqD1P4L7vd9hA0dfN/MFr0tUabn2Sf0bAAVv4zg+
Sqz7kMxhQt9Nn5VJpBhFr+SysFK+c3r31FbU2JOn1TltYH0ApKMjLa6aiwdEd9Ky
8OzX9zI8RSTYD8kxexW34aSQN8vCOdNRQ8BJt8XwUxt9Z2kxPVUsg9427FxUIqwc
SuyRnc7HJmPDOYAmn1sjjtQ5f76xJsqwBuLX5D7xvb0lHnVQVQ8faR8MJsQnBAPM
Vo0g1B4WV7O2ZV9/EF/ygFn+zJjfGfDcB1qs82ynf3Kddyt6zr6BX/It5JWbQaPW
OSMdRmsBpKkoZFb5Xdu/l4sgWDcORto0H8rJzObOjaK4s7EurrAX6XgTmcye52Ez
1HLWIDyPHuP0lGo3cqbAiAuvuaMqn13/eyZWV5XOJSOKYyRTxNgAUu7Alhx2/NSy
Bj2s1Fk9dEcSh1FaDftyAB7JnirwkKBHDveiqWboVXbhXCtauek7n6zsHqXfZdI8
o6+xyxiOMTdsQdhHLM83yL4COv/YHNzq8aCWI9S3g/an8hJNZcqMFqZdHCHH8CcS
IuVsozeFSA3uHrHLRHNdf81Tec4m/v/eG+8UsJEaKRXrkFIPjlPdEzC4hv6mW3Dl
X0dLa+Kbzox8jrM8DKV22FRorqW+/TmDUktp97IQPYY5sqzK2TlinPyDTGsQYLuW
9KIDYIgDbmhgmNSrMb8ZI1CDhuIT+jG28l4ImCT7WQa83kbmLVXgiwGB8s3Yerra
KuiuDMZ5aIEZ0dCnxtHjX4ivjdzG+ZD7f7hPRUp7DJjYeNkGCHqKUCj/nJhqOKdW
e0MI7kq1mbigjl83ZIYMPmcCqF6NbM3fTKcPESV8MTQ5Shby02Mh82n3l2OjfVoo
ya4y9V1TFh9i55o06h+qZLjEhUawGLkBghzSRYTxmUWjgWaUhjGQHbS81vU1FneR
vX7dx1shr+Yrwb1Q1jBirST9s6v6NnEoe+hMajjX1mA4NfK3lvrAcgZe5Ncd63kt
e56GVJwIkNu0fCKRsILqZ95OOg5ruPUQx5LRozgutqBsRMzMY44noCRbbaBotd6y
KYYwn+qgeMvzROA/mkINv/b/24tD/odVUK+zh6KNwEsTSFAdybQCkXUWSor4neS9
ko3VDk/i4KlwT4SwiZ/dMyf/67bggLGoRBrbnDtxxcPSt8GjxkFcvhsCVp6thakL
1E4qkNc9u2W8t6hOhI6to5mKgkJlyZ26i8lm5H78xNK/swW17jSiVLw5KlWwKPon
kYcpc1u4kg4sxaPQLVs33xdCrxiFVfhPvbCErg2k+wXGbzqM0u95id8tkY+G3OJo
2ttpdu+Lo6DIosYRkNWIFXBrNzI2RipaxX6SDwq9MUdfBt/IQHSBfqWrWwueKFTi
N0JLUnxMrmkQrk0aCmzuVMCKA750ql9gKki1pvgq48bhKJk9GA6S7blS4fKY3zQY
i7xAmL67VetfQSscpT1VK30TpNOFBIE2MtqHKmqlp10A3vbcC9WWY2JvRhBWf5qn
/XR/hs61bZa2EAi8iCBXrBKo4stFbIpETkvNyXpnSioAfFy2IhVZQ/uEaf9bsOL+
sela/eO4DStAXEpG928G3MONqTgSHDiiykS96idxSfMBGrbtPWN5mLcnWJMJ2pU8
6UhyURkqGnJ3Uyc81g9cPiGn321X1pX+Rz2ZqM9ZKciGm0lNWSNh0hACUusl596I
3D/LGF6FWkLajuD+dZyS07sXSF5XlaInDsnfBHGsUL2VQW87fSsN0Oe2o0LK3ciV
/KcfxvLx6Enf141QKrE5cxKPGnTfGyJzokS1pquO/q/XFd5iF7YbQBCoLCLc0N8Y
7J1/9lFwmDhysTzOuZxt4CifCgRrBM+puVNUan0Oi8LmpLcCrFqCwm0SKPBb/Gyz
nCG3up3he6/xQycGXiAgjTpsil2ndspQo4q934zYCEYVQsiFIuGwKKrbSChZh1sK
XXGP/k5IuCYaYQNYwj3ygvIPjtYt9DQ3liCApiXRaCiUphEBo0xWOuO8rd92QzKL
+tG2VSCJPRNShsG/3OhYpjDr5FKIRTMTganoJzmhH6QzuYtMWZyvHPrr+8P0n3D9
Jtpp3g/DWc9kbpXnMsMox9dYk9NNhMt9wR7CW+oyOW8h+l9Ia+Ygr6PJeNSqYTM5
ry/qusUUo4WsjiB2Hm02jJLSTpK+FdTLOOtsIiONSiYZnWOXS9Bx9seShFxGqbx/
H6PRVpE9C+bduk/ycihPBt8DTDk1KUF7tz+Y4kOqlFAG/DOip2ZDNwE0uGD3kgP0
zDd2OY52qAC1QPOOwsfvB6zPQTCTiGNWXYcaiQz0R1xmgTMMGXBAkous7EH3u40T
0dBQTKi3lHFlByllcAaxNWTT1O3Cv4xD01q9K9zq0Gkx6d7qIJ3J2L3Hzo3VqTmm
m84oTIHOpUzXr93s0BukowEqLdrz0J64Hvu0kmpPhuwLdYydwf3RtKmWzLIF5YKF
yNptBoVLbtvdXpobrjU9ic5ePGqtdvZVKJ/LMyhaLP9Ua8JwFktKq0NkX+2oHOV7
0kF6RbTaLDDX+V9arGFJN+94VwBm/EBLdpRNonaKCtPh24vm/JdHqE5QulfEBiPC
H1RxQFhee/gx/5p1O7Wa+fqWOl0Ui1pCmu8KOm7mjYitX5pSq3eQcZY38eWf/yyT
b3yUXl121XS2LePQ1x+BaCRelYiybPqpqypip3zdoqSrIEMvLDAckdVWkWYZTKWU
ih8Rguqzq3uroGN+Xskq/D2GOppIVAmhLSTNIFSCohA7oZy5iEpfVmcSP0RaCbji
tAlfTWq6gIIoHyD8OTxoSy9yXhsKqWay+w4QAaj/7g3/+N7rR62y9iow1WTSJwMQ
6bMn+DyTjHbsq7yfq2kszKwSes/UAsQe2nvGppDPdhSx+boP54Y5H+2mXDDZrYha
Kci3MzfjrnY8Qe4PwfukqJETS7tq+aY00jS8TEyXwXdSP0b+qFht+oPgMoZi5RnL
MPsMc/WeAfmfYP641uoXuaO//ok0aVvccmIYLoCJZlDbQBLUa0epglR7G629EEU8
QZUZrbGCwjdjyLgIGGkuhIE5NNRZ0XJYI8V7nz0TsGpgrkU8Bn4Ckkakg1TfQlbV
hlknU8SfBUGb21aPJBoGHOjrkP0tRBTpPBI7mIAyCvy7A3QtPJmnzrWnGT1Syvm7
6u505aoC4nHFmLLKAi42Jl0YUHNmUixOdcpaljv0AqcLvrQhsOXJ/OznoxPgm/vb
9VMH7I3/8fZOUIpndoTiVaD6oWfvxD/A5815dBl0ltYUbauCpTj1f1tTVdrPTUx6
I6OGKJEcYV8fs9PYRtkgMxvTwLch8pI9CIONOQKLoiDA6PppeHjsTqPiFI1FRhQf
U5ZUqthy3SbaSzZRVm4A4jmC+IaIdTfQMSG8fngZgGccqgRF0uq4JsnFI4mw8L6g
VPxYYv2BgSZWaOKrXnwn81l5nvrg2KTZ5/3jpfvpirmdc9HXaCKJKCD2WAySngpE
1+uWXivzPuSY6zS+4UQYnsdEwbrIB1GBtUmZ6e6d1lo=
//pragma protect end_data_block
//pragma protect digest_block
GEvAn0R1JYO5CPDd4OiVZ0+ytq4=
//pragma protect end_digest_block
//pragma protect end_protected

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Ka1wYpemUc/Ki/yTw+TDkd9SvfNMF4LiutLjsWWdA9mrN5Wg6GMhFt1ognRCVX1i
hhKPPcFHjbg/myaMsz4AnUBPs61jCjCxP3zkltH8+p9QSkA5KtwQ072B7Vh/IU5B
PIiEcxax+MSgLm9ygiBoMIZ6drg4qS6Y/0Of7vP6jkVgkE5PFDYQGw==
//pragma protect end_key_block
//pragma protect digest_block
lTPeptlk9kbn03xePqDrtmSXWe0=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
MrJkV/OMLNjAb75mM/ePapggTJM=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SEQUENCER_SV
