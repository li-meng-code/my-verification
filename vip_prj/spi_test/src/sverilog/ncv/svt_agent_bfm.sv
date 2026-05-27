//=======================================================================
// COPYRIGHT (C) 2010-2015 SYNOPSYS INC.
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

`ifndef GUARD_SVT_AGENT_BFM_SV
`define GUARD_SVT_AGENT_BFM_SV

virtual class svt_agent_bfm extends `SVT_XVM(agent);

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /** SVT message macros route messages through this reference */
  `SVT_XVM(report_object) reporter = this;

`ifdef SVT_OVM_TECHNOLOGY
   ovm_active_passive_enum is_active = OVM_ACTIVE;
`endif
   
  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  /** 
   * Flag that indicates the driver has entered the run() phase.
   */
  protected bit is_running;


//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
YqTF5VqImIqdAugSoUsZgc94/1GXdfftNgy0pfYouwKjxrJdU5EHSVkGhGFtQMQ/
IogLXlA1YHjfp9dfwWABnGSWcvkBEeGqv5bgYVuigQVefhW+zEXMzpdHGTpCOYJ0
cnpVHwU7fWiewjIJTtbgKX0FYjRRqmpnx1avcPtkQ4/xpbmZxPtvHQ==
//pragma protect end_key_block
//pragma protect digest_block
nASv+OXGpQEjZj2+nWZVeC8bMmk=
//pragma protect end_digest_block
//pragma protect data_block
vBs7SpuZCljxHSzS+LYCbP4lh6XjoOLr0c4TD5PY9197uVsvFow1+5sKG/JdrqY5
wHW1DtFUes6q9zQYIGN7HYRdWLoQ3fsWs8jPhS0NLnd98QUjWcmpM0svZdqKigWG
Ce3/F9fEJsrqkSxnSLFGjFAnHbyy/QQgNzbNOZJCCpdwNxxbZlbJAznSjMygWB1s
0MMnyJC8pyn6W4Ti52pDmEyM4a/8xCzvoB+3Hl2ptyaX198oSBPSt8TDq4BWtNrn
mjhRWdG5VW7FXuOpuRibmLZrDAkf7dvSgD5Eb66ZmnMjf0GhNScsv8lDl0mE1dhP
0UdHPT/m9634Z7TRdhD++2QDB6asI+WTkPHEppWOrjxtWbPGRGQ9SYyZidHV9OxC
/x5HvZeU+1sqYgeveRXDFQrDtlvFjgr1zPa8cI9/EjEk3b7hL8ZzGm4XaXu0Xogd
lpNDbwJk6c6Aul6XsP3QAZiM5UUyIDyhxVvQSbFZR1Gn7NzW9QyS+cBVC840cxpW
9l/ee4aooMAz4RMoCALdmwV1VRrJ6FpwJXjpg9ZFv0Oxn4vX4L69IgJ3iL5bZ+g9
jx/lyaUnV1rXQnaV6pg+KKoqL/5ZKcGSD3MviM3aGOobaD6U0no5VbCYQ6viGmM+
z2WM69lXB5dPLGbjEkmwLVk8g4e/2nwnd2RTgJqNQT3tjNF7DuPU7Ym57yU8NOS3
DciY9xwnpkN+PlVAvLl2BRHAh3xt68N1v+Guc/xwsIMcmAdsY4GTfI/n1+YIm0pV
8s9MCAKsaDWsxpH7j0QuAOVmGXo0cUv3JVvHob9uom9qQIroVhy62lZ1L0mAxUwd
EsGZinZZXpYXQ3HUiQTj309yLol6vF89rdrRz2RwNyPIooRYFJxIFq+vMhamQsAq
wM2jilzgimOh8J5rmM2vnJZ1DQAYBc7X7+KKVUftD5E0tAAGJxRmMGsM51vPF+xo
InYIQ55VuwUfB6l6oUuj8rWGK5YIx8+MHjf+FGLIdo2rsrUsoncRiKawvKeZddCa
gREcszlm/6Z0BlX4HuRVPKyyoxqpoGAQhlvwhx8a9rl0uAkHpE2PY0Z5kuam8beR
70mObAjHR9plT8KT1NMYiQ==
//pragma protect end_data_block
//pragma protect digest_block
GrBJeMH1S00IRVlra6KP0EoZEU8=
//pragma protect end_digest_block
//pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new agent instance, passing the appropriate argument
   * values to the agent parent class.
   *
   * @param name Instance name
   * 
   * @param parent Handle to the hierarchical parent
   * 
   * @param suite_name Identifies the product suite to which the agent object belongs.
   */
  extern function new(string name, `SVT_XVM(component) parent, string suite_name);

  //----------------------------------------------------------------------------
`ifdef SVT_UVM_TECHNOLOGY
  /** UVM run phase */
  extern virtual task run_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  /** OVM run phase */
  extern virtual task run();
`endif

  // ---------------------------------------------------------------------------
  /** Displays the license features that were used to authorize this suite */
  extern function void display_checked_out_features();

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
ZhfHpWwJ3Ew8Is0yUlxyXvRig/ZkTuklElMQvPs9V+kbOnnLj0ZwYjL3/ERFg1xT
VvNAhkWD/vvrNwJPBGze95udww56mlbM22llT0DnAe88eLv3JEH9VGpwb9mPjKDO
cfUDJ8y5U1YtPP8VC2ikkl0OBI0rWUmHNgieO2x/yyKdMsyMxhcu5w==
//pragma protect end_key_block
//pragma protect digest_block
uSZabA+28+yb3KLPfVv/AnMtPRg=
//pragma protect end_digest_block
//pragma protect data_block
+Qj6KA/cBdewBa19pKqoAewrxrLXUDEbiHhiNROcZjNfMKTuaaqklzBxje58fDA5
0llxP1W19yM4QPwgTC9OXT5KGzVx0wrezhvvi0x5ZzmHoojexe+Ro38lEAAwrGsz
eJ3Z8OWDzIwRtNNJE3hVNlSUI86ERGdJJ9sWUvomR4dhSm+7VJiowR0iLMv8/kla
ez4T2FT7gTL6PX/WitBLWnU+/PoO0Np4DO71RcDkamPxscIVn/cLp2pLxz8zmhpK
nGCgoirH8vzijpxUT+TPpHxFGvXxcce5oOZdTu44nMcBhbB5Pb051BAYpfrhse5w
qis0H/iMOD3M1UMISga1DGHP+oeuQJIQh9HlYI4IMZNFBSLa2p4k9g1TRuM8mMhX
VKVtR1tv9gRnMF6wIPzNsJVIAuVPBpTJjqlSDkcctOSLDBD4cZEo0AqhQQxN9FJI
77D6gaRLo5tb1kJpMsdmlYcVn3uXTefz6wX2QXQnEd8PZ1th6wcFAfu+Km9joVbY
L6oP4qV8vG3d5Ie+h96bxhxhw5Jz9SHqqpGbbljwF9h0g2vtTVvO1L2GE7VbTWPN
Hb04DjmEip38vydW99NQiv88BSJ/pq8QfPjd79cd3eF2Dgjrxi5h7UC/R1Tp6+O3
QvWZbZWW+o5kXdxlt+6bdkl5CqhnuvwTcIgjBimP8evYoBEt/ppKTiAxuVciwvsf

//pragma protect end_data_block
//pragma protect digest_block
VyVmTnCwyKv0pec19J+/3SVUUUk=
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
f4GeJeJq+e2nwaazMY1PRK29Vi8E93egenRIPphoGkZEoANVkRFTEsa19Ao3Kpnb
+32ovApGPybH78iHq70W8P1M0fiqjYs9Y4UOfTZjcmCPqqRxc/apyJTE99NLvIYK
Sklf1d8cwwdX9bAcsfUV2akuwGNqjYwqjLrV72Bxo3osGu/CajF6sA==
//pragma protect end_key_block
//pragma protect digest_block
Q+ncYDAyCscjfGaFZ14fVJJjj40=
//pragma protect end_digest_block
//pragma protect data_block
7kF6auTbLZ7jztMAfo3c17dNjeDLwn+AT/vBulYl++PXeCXaCZhoBmdnYSzAyXyy
7b8WrfQw2HXP3BeF0BHJHLf7jvHoLyxydVlXbCQyfo2RSXRkN8xdEaBLhhMcblbL
eR9HHp8GkBOKkCQM40Og7yami7w8qMPSg/Gklz8MUlX8CAjsLCvRl8zpkAlmcQZ+
xYqZCL6QIMJhwq2Rp4EA+ETmqE3igAAzmiZSHJv6mwR4PKMatR2mlVszV4JL4Nny
ZsbZA25bmZwnMMFix0r6sKX79vP14TPxqx6BOzBBtGm0gGA1XsCLjtqxqPpdU43V
QLjH0pOeC8LCxskUqAxGSRSTKTEKdOmclZHxngbl5HkaLAFtr0cZ74k6j1kir43p
3pPN+m6L2y2Nma8w7NQ28DPLUJ+k07TrlWkYyoCne80I0+2NZJzvBDZhm6ZtkkKz
VhXDMiRwxBBtEGORSbdNFLqnitkcxlKiATjpHqZ0bF8Oc7rtENuKwLuMEuTJvSHy
KzEJEOYSujPQTXVslmaBV5c7csFkxxst4T2DFSOzrU1W1FYFZYEkWRFqy7ShlwQb
7bxWO17v8wv8aNBem+VlAkbJ9zgvvO2qI+5jMmMHwzNS115C6TTrebHjzxeCjT9n
6MMGo4f1zD6izq9Jiu1eJg==
//pragma protect end_data_block
//pragma protect digest_block
zubfjYIdXYZEUZ4G6fqhDZyasWA=
//pragma protect end_digest_block
//pragma protect end_protected
  
  //----------------------------------------------------------------------------
  /**
   * Updates the agent's configuration with data from the supplied object.
   * This method always results in a call to change_dynamic_cfg(). If the agent
   * has not been started calling this method also results in a call to
   * change_static_cfg().
   */
  extern virtual task set_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns a copy of the agent's configuration object, including the
   * current configuration settings. If cfg is null, creates configuration object
   * of appropriate type.
   */
  extern virtual task get_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the argument
   * into the configuration object stored in the agent. Used internally
   * by set_cfg; not to be called directly.
   */
  extern virtual protected task change_static_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the argument
   * into the configuration object stored in the agent. Used internally
   * by set_cfg; not to be called directly.
   */
  extern virtual protected task change_dynamic_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the configuration
   * object stored in the agent into the argument. If cfg is null,
   * creates config object of appropriate type. Used internally by get_cfg;
   * not to be called directly.
   */
  virtual protected task get_static_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endtask

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the configuration
   * object stored in the agent into the argument. If cfg is null,
   * creates configuration object of appropriate type. Used internally by get_cfg;
   * not to be called directly.
   */
  virtual protected task get_dynamic_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endtask

  //----------------------------------------------------------------------------
  /**
   * Expected to return a 1 if the supplied configuration object is of the correct
   * type for the agent. Extended classes implementing specific agents
   * will provide an extended version of this method and call it directly.
   */
  extern virtual protected function bit is_valid_cfg_type(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns the current setting of #is_running, indicating whether the agent has
   * been entered the run() phase.
   *
   * @return 1 indicates that the agent has been started, 0 indicates it has not.
   */
  extern virtual function bit get_is_running();
endclass

// For backwards compatibility
`ifdef SVT_UVM_TECHNOLOGY
class svt_uvm_agent_bfm extends svt_agent_bfm;
  `uvm_component_utils(svt_uvm_agent_bfm)

  function new(string name = "", uvm_component parent = null, string suite_name = "");
    super.new(name, parent, suite_name);
  endfunction
endclass
`endif

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
gM9lZ7B6jYmKSMcP7UEIu4nbxJ3mOUbnSEUrT80Wlhdy9oPvZ+5jS22b8sxQZ0gs
8zCET2DQvHaKyZ0Tz7PDiWC0d8lwDgpRwD27o1FQB2cFBZE474J7iAfqjEeY0q95
CYE1ss59MHaL3oSpaFXXB3X9IOa55wTWKZ2uZGjflv6kigg/BjyFBw==
//pragma protect end_key_block
//pragma protect digest_block
nT8tMwcRVykhrDkQA/CXXufwxbc=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
yqvgWt/E3XgY6/McRWn1XEi71/k=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_AGENT_BFM_SV
