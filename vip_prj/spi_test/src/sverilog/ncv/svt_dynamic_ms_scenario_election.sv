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

`ifndef GUARD_SVT_DYNAMIC_MS_SCENARIO_ELECTION_SV
`define GUARD_SVT_DYNAMIC_MS_SCENARIO_ELECTION_SV

// =============================================================================
/**
 * This class implements a multi-stream scenario election class which avoids
 * disabled scenarios. It is designed to be used with svt_dynamic_ms_scenario
 * instances.
 */
`ifdef SVT_PRE_VMM_11
class svt_dynamic_ms_scenario_election;
`else
class svt_dynamic_ms_scenario_election extends vmm_ms_scenario_election;
`endif

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /**
   * Flags indicating whether the scenario_sets have been enabled/disabled, populated
   * in pre_randomize().
   */
  bit scenario_set_enabled[$];

  // ****************************************************************************
  // Constraints
  // ****************************************************************************

  /**
   * Constraint that causes select to be chosen randomly while insuring that
   * the selected scenario is enabled.
   */
  constraint random_next
  {
    foreach (scenario_set_enabled[scen_ix]) {
`ifndef SVT_PRE_VMM_11
      (scen_ix != select) ||
`endif
      (scenario_set_enabled[scen_ix] != 0);
    }
  }

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: In addition to constructing the objects, controls whether
   * the randomization relies on the VMM 'round_robin' constraint to choose
   * the next scenario, or if it simply picks a random next scenario.
   *
   * @param use_round_robin Indicates whether the next scenario should be chosen
   * via round_robin (1) or purely via randomization (0). Defaults to 1 since that
   * is the VMM default.
   */
  extern function new(bit use_round_robin = 1);

  // ---------------------------------------------------------------------------
  /** Setup scenario_set_enabled for use by randomization and post_randomize. */
  extern function void pre_randomize();

  // ---------------------------------------------------------------------------
  /** Watch out for disabled scenarios. Move forward to an enabled one. */
  extern function void post_randomize();

  // ---------------------------------------------------------------------------
endclass
  
// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
7PrfCxKfciFCnJDGatVlhfQI+8q12sYEf3kBt/CWUKgsClqiNuPvcopx0YG3Q8t0
yoqHEwMWikHsikTVMJqP5VCgmMX1pRVfB15samT0sD1B2bOPLFXfNmObZuRp4dcW
+LP5GZoPScSDXnxDKxGCiYpsleSwUKymxkkVFUEzm5F9SX/DW2NbzQ==
//pragma protect end_key_block
//pragma protect digest_block
NcRkfiHuhwWGYvDYdUkzHOgJ7Mg=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
98jbP76wwE373OVnDXjydaVeNMo=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_DYNAMIC_MS_SCENARIO_ELECTION_SV
