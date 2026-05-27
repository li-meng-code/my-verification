//=======================================================================
// COPYRIGHT (C) 2011-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_GROUP_SV
`define GUARD_SVT_GROUP_SV

// Only compile the svt_group if VMM 1.2 features are enabled
`ifndef SVT_PRE_VMM_12

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
MGImCBOrt/mTTfHHt0Z6BMu9sFjS1h25q36eZiBvhVLkyAUWjXPcVu6FYIZsx/fV
S1isBTp8eY+9+JiWYxxKO/4JTQNWgg1nTX4W72arDwTNBBfXkZIoVwBzf5fXi4J5
4VgxbV7gpV3L2LzvfOAYRo2Qp0VDvjv6lRodxnSg+40FieN0Ax+qJg==
//pragma protect end_key_block
//pragma protect digest_block
HMZdNaBxeQMBjlAlDcpXp1vAD4g=
//pragma protect end_digest_block
//pragma protect data_block
Gdnbu4ZixvgudJuFLVyg7uE52X4HvMw20E79+ZA+vNsfrc9FuSjFuMGLnQggawtf
GSWNVrypUWS0w+RRdHG26JFXtRNGlZe2zB6/CqCM0hHHGo4F5932ydn1+bA1CjO+
x8GFHVzeZwYyeLf6y+qXKFHyYFNOWKZ0z19D6QjeNIi1ujpFiums1pciXNXkCRcs
5B+r4287/82eEs2WZvl8Laek/aLGF4fXf+/EvM2sq92GF9jll5J2ZxdVx5l2rCUp
FvPVX31/dhTucMwi74Nm6nGnugRC0wue7E9giWw2QPp1zb4vohtqOQ3m1kQa/1U0
ui/GEnUYhoKfhuIaQgdE7PlMZypPVgknwM3HqRZNRxt446ofQc4YOALhP3UVkjc/
sJhZa2ANPOjVVSO0M1RF1HNQMZBloigq1PWIs7TcdCAzR11Y91RKICpivqfqPsZj
2WCu/cZONuEavL255gNXYVEOZMsL2svC4sJLmfD8mJG7TFV6OCOF11PJhL2/Vhvq
48INYJdf0Si3O5n+1EjLqj5LZExoSfXhBR+5JpimWZY=
//pragma protect end_data_block
//pragma protect digest_block
mQ1yQ9Se2pl0esW5aXY5BCFlRQo=
//pragma protect end_digest_block
//pragma protect end_protected

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT groups which
 * are based on vmm_group.
 */
virtual class svt_group extends vmm_group;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /**
   * Shared log instance used for internally generated data objects.
   */
  vmm_log data_log;

  /**
   * DUT Error Check infrastructure object <b>shared</b> by the group transactors.
   */
  svt_err_check err_check = null;

  /**
   * Determines if a transaction summary should be generated in the report_ph() task.
   */
  int intermediate_report = 1;

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
z6px/0SMAsvJXaj+z5NGYhipza/XU18CMEkfSLlSsxs+toJMUD9HEmN0Oc5xN8Xe
2rqP1UKO2A8BxHMtmHW94HmEu2sY+zTmZXCPS7e51ajbt3L19ESStuWnlISPoPrG
BzyFJLn6EI2mks3bVt9290ZkiDLclGf39DYZYk8gEerx2h9FJjtTrg==
//pragma protect end_key_block
//pragma protect digest_block
jZ7Ld7n9CLpHsgzbkXjL2pn7n/8=
//pragma protect end_digest_block
//pragma protect data_block
y/CFCO9IPtpT38ifB4wGgL8UkYnJx1ybPVqcskR4EENdP/hMkY+jRETgOMWKXWrC
Da+DhVuIPKVsHMXim/0n2GTaof0+hLEswCja4Pox8mNXERvDlzlot7DYhAyJnwC8
BaoB8zBtTPYZ1r2cSKbcd6H0tIJJkWp5hsaRkhKwxzMMvzFZCAFxXIclyclLwDUZ
kNK2jn8I+WQz6ONMnFwXi4S7OZJP7q88fYSKPhDqeehvuIa0umcETvjoNaUp1RCm
JYtT50qPdVQ89cQdSfAoD9uXdpAVDFT6YUuWwFLoOvNKs1t+yCdkWNsCUHjCzwL8
UeENV/jXByx159DcudINZm8yDHzBsVOgQrNLdRQObYlD7WdtfGLU35ZcrQZeI+Ah
lmqiOzjjqqlf0E8OG3rEYZmRqL2gMq+k6xaoGF84RnSHSvYcIW3uyvWUH2Iit2Kf
sNxnsswewCGndEnvZz2o054M6cTzE9eJQPRCpeGWvrprFc1TsfYsUqoL2RGvc46k
Yv8Uj6MgG/DJeQtv4T7KpEnArMHlDl+Zb4TSw/bB1IG/9MPZJ+z/pfhRIPNUXx5G
hsYjqpsbHhh1NjqbEuM0YJAxi2O2LsLHLg9KDT1vckaOJkA4VRLblXu5+dUYtpW3
hoj6v+4RQqquTvJhdEpOLx9AvrQ9YgqknMGnaR7eGr+e+O0Pj0Gnca6JF238O6in
tGw9OEXwLdS2vn3DOJSXf7AzrfOaG19JMQjnFifqFJT/4EK+Nb+hASqxU+pNZbLC
9XA4fVfwX5r892zVP2MBzxU02Y4t3q1okjnTfDkwwQ0+DmRHdgszVgN/yN8MjP3n
Pn6Y/Uud2gBbKiQOJDjzl2iXzF87/0YJkAr2aryv29E05IwGG5eMJkSBKE0E0igM
CXNTtv/iuK21iHOVEs/VJCca/7rHBM88DLJvHsZcfK/TDxoLE7T239I/zTPuqTi8
zw9jvtu82QhUdmApZQnfpdoJscNWXxSAx1EsO2KlRZIxbdJrfQ3oJPYfq3kysfib
Yf+2IOUKr88KmXYKuuSU4ksUyxOiPVdsjXyP4y+vQN/leDo7UYsTf91gUkDkJhKO
lIBpCBb9HTjd8MYygqIDzejZ0JYiE1H33IHUcWh0U84iL78ts0VOYNMxfvFVVPGz
WpjrZpZbFTngG/gDvBDSuwRmfEzw2OE7vpMcyRAc4/JgR75N0A1eG0k9NuU0mRU/
dgN1xTk0RmbadU2+cKKfmVt9g2apvTxnGlhHTv98cyE2thJtdMjdmUmGPDqInIxA
SVyeLZuHoymHR6/lVEjDqnBFDHE24S/ghvftl93fw6WT8Bs9omDzQmAMr6G6d4Xf
5rcaRUc9MgvrlW+o++LVk3HfVST7Lezpo12/0cF7m9+RqB8bUP8d/9/fMpu5VaZK
e6eZwHRMLYza92TOznSJz7AUIeQPvTQL3L0BBjXkhW0brF9wjFW1lmg0yEwwR0/b
wletykdtJnWfmWzwYFHmyCCi/zZMjxTC8PpjdZG6qrfwdkqbxsidK3st9giupp++
VyXSl7o2PfQxiwzkQdtADshjUocHs4dYDTYYXIU/XWL9pvx6OOvYlneRQ1cEiZ7c
07IfJN39e3C7+/nuUhyIRp+UJ5XLYvtrD5PvPubLgOlraUMiK+NFvhTUIiut6/Z+
nKMJT6xHEvCCF2Ls1MmxHBPsbXu8soFBIwT/Eks2sKwclz1bFbAKVcDNODI1St2I
4qF9FYE1OGTgpsdBn0TewX88tEnQ1yyIR9WCL2gUURs=
//pragma protect end_data_block
//pragma protect digest_block
dqruUDQwRxFMC/QKWNMAEkJRme4=
//pragma protect end_digest_block
//pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new group instance, passing the appropriate argument
   * values to the vmm_group parent class.
   *
   * @param suite_name Identifies the product suite to which the group object belongs.
   *
   * @param name Name assigned to this group.
   *
   * @param inst Name assigned to this group instance.
   *
   * @param parent Parent class of this group.
   */
  extern function new(string suite_name,
                      string name = "", 
                      string inst = "",
                      vmm_object parent = null);

  // ---------------------------------------------------------------------------
  /** Returns the name associated with this group. */
  extern virtual function string get_name();

  // ---------------------------------------------------------------------------
  /** Returns the instance name associated with this group. */
  extern virtual function string get_instance();

  // ---------------------------------------------------------------------------
  /**
   * Sets the instance name associated with this group.
   *
   * @param inst The new instance name to be associated with this group.
   */
  extern virtual function void set_instance(string inst);

`ifdef SVT_VMM_TECHNOLOGY
`ifndef SVT_PRE_VMM_12
  // ---------------------------------------------------------------------------
  /**
   * Sets the parent object for this group.
   *
   * @param parent The new parent for the group.
   */
  extern virtual function void set_parent_object(vmm_object parent);
`endif
`endif

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
DoboxhHJBrn5QNZtzAS9KpxozgXr6ZEOZtP5GWTh9TeYINvBsd+y+11t1t+6FbFE
u38GFEKVHQfIWVmtcwN545XFsNRJKJakV0cxt0XdCGR/DIucjAu3li+fnCqKp1UJ
0+Lg1wurufaqiVuvZbcK3Qtw/ZzVaH/sleUYaMm8k5+pbIUCy6kB6Q==
//pragma protect end_key_block
//pragma protect digest_block
tKwVGzmQ4B8qC1Z9GouS5zpRcVs=
//pragma protect end_digest_block
//pragma protect data_block
liaR2mZCUpGY6rhWmmY3YopzTcC1ucCsN2yUPPtFR/OXgOFKnQsu1w1eSpikQtUB
iJ+dlVYYf7lIr1hTenIGTRUwtgmqpZ+u+Gofo2V/MaxFzmxAVMfDQx5uqtWoQSeU
GDyL6Gk5NrRtotJRvSwTqe5mNwqGDzxfRGc0jZ4IxXZn2LqotWVtOKG4dZdafU9X
FNg1Ardyzr7zdr0axrQgr3BAxD/CFJHtBVJrLrKkA3i2AJsmVz5uHbDn8qS3BVPC
IgTJ56Doql58PiEeWMlezkUd3Bi6oM3/spLeDIEays+tXEsGuIH02sOJrraM38w4
vf8YNOX/53XyXtS7BkGPGsoeDA29jKxy9rPUG0K1GBab7bOJYnTbvetP9gCq0JRq
tF8DyffX+P1tG0JeESpQ5Hx96jFXnDnmCULox1igSprb9MCtqICRHZn7US0rVOZw
APBe9PGWka7UTljJNnDTRn56DAviQiKHjE+XoQytFTYQ7G7lmwwagngCHp1jIYLg
zTOCwspJMuJQeW6aCY1KTo9EaJUYyMbsekNgcdIInxo5ajMd//e88jOiKL/Z18kq
xybUMBvnS0IJ5W+OAXzb6zKgLLiaA+OQ6luLM3e9Rjfouv3T46AzPDGu0MpdEw0c
vPjQ9Sm35v1Um4vm2lE3zMr8o5Zloe0F3c5z8/iIpsZG+vxu4AUCH1Pq9bwTDrad
3yCbo+RnzVBSqRrr9vXjX8L2dwvy+Xl2zbbEOOAJXODqP5GjN8xNoMp5PUfaVVmh

//pragma protect end_data_block
//pragma protect digest_block
Qx6jo0mL+EXKZTMgvnFu6qiG2zw=
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
i4tDLtqY2rIhdpONEg5UzbKRytPvPg70ZuuZOL3qgLSpavDL/CaOVzD5al3zNczV
A0tEkbLK1JMOZZu8Se3slQGVN2VGf/0AvYA7bNDr8IRdjxeJBZhp/nEHbaY3CPqQ
Kih0X3QKnSqpKjpNtSTTWPMa6B0KNRYiX0A4odFpkWPXbDc4ORS6ZA==
//pragma protect end_key_block
//pragma protect digest_block
UWOypuD9WDzzCQwJc+xNXJGwlpc=
//pragma protect end_digest_block
//pragma protect data_block
7cYUkj96+N5mAj9lCjDjDSHlTmiwiMERBVpwSB1I1jHh2IJOyjQbexXJpCjAunu1
Lg3dyzdk8zbIhVc/wQX5qZOVJ+TSgGRf1500rJ3i3AlbBwoHGTREjhI0bnmlQRnP
2Mar9Mde4+yOLSwfg26sZ1C81w+PHxn4wHD1vowsM2HNyPPOOXGXXdFdvDS6Vtpi
NTWJNLp22X+rE1zz1FIqNL259Jtp0CZfkFYm+0az6V8UcKGO+XcVi5kRweQTmuT0
E4k5kdWKkbFXVs8x57mf1rLKdf92V0hmdApHfiNBF86tnrGz2601ENZJXkZbP0cU
1cBgY4AlAiYZw3fY4dbJcp0Ya5bzF+AUWJwPrrnBd2wgSmmrLRigLZIylr5pik+R
B0JCIoBYCqc/vn0zfDYOfD8IEw9rhdIZdncnNBiVPCbUXp1hlW1Qg5xyCNFrYKTG
lI7YMXOv8SEYMG3o+nYb9K7L5zLDPFVIT0FJwn03mdTYumO+cZVzk2pFyoRxxKNZ
SG+rk9l7X8n3di1G/YmL8O/efyJEuGv/6PqE9lJPCDy6yA5q1conmgu2PcD7cUit
skdQNq8WtPGtTZNudavefDF0G6AeZxdEKaSnO4h5WOmgTFuJtMQERkTy3zGvJw2H

//pragma protect end_data_block
//pragma protect digest_block
TVx9uEy3t3roPXjjYzf7KC6el9A=
//pragma protect end_digest_block
//pragma protect end_protected
  
  //----------------------------------------------------------------------------
  /**
   * Updates the group configuration with data from the supplied object.
   * This method always results in a call to reconfigure() for the transactors.
   */
  extern virtual function void reconfigure(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns a copy of the group's configuration object, including the
   * current configuration settings. If cfg is null, creates configuration object
   * of appropriate type.
   */
  extern virtual function void get_group_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the argument
   * into the configuration object stored in the group. Used internally
   * by reconfigure; not to be called directly.
   */
  extern virtual protected function void change_static_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the argument
   * into the configuration object stored in the group. Used internally
   * by reconfigure; not to be called directly.
   */
  extern virtual protected function void change_dynamic_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the configuration
   * object stored in the group into the argument. If cfg is null,
   * creates config object of appropriate type. Used internally by get_group_cfg;
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
   * object stored in the group into the argument. If cfg is null,
   * creates configuration object of appropriate type. Used internally by get_group_cfg;
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
   * type for the group. Extended classes implementing specific groups
   * will provide an extended version of this method and call it directly.
   */
  extern virtual protected function bit is_valid_cfg_type(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Used to identify whether the group has been started. Based on whether the
   * transactors in the group have been started.
   *
   * @return 1 indicates that the group has been started, 0 indicates it has not.
   */
  virtual function bit get_is_started();
    get_is_started = 0;
  endfunction

  // ---------------------------------------------------------------------------
  /**
   * This is not part of the defined VMM GROUP run-flow; this method is added to
   * support a reset in the run-flow so the group can support test loops.  It resets
   * the objects contained in the group. It also clears out transaction
   * summaries and drives signals to hi-Z. If this is a HARD reset this method
   * can also result in the destruction of all of the transactors and channels
   * managed by the group. This is basically used to destroy the group and
   * start fresh in subsequent test loops.
   */
  extern virtual task reset(vmm_env::restart_e kind = vmm_env::FIRM);

  // ---------------------------------------------------------------------------
  /**
   * This is not part of the defined VMM GROUP run-flow; this method is added to
   * destroy the GROUP contents so that it can operate in a test loop.  The main
   * action is to kill the contained component and scenario generator transactors.
   */
  extern virtual function void kill();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void gen_config_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Enable automated debug
   */
  extern virtual function void build_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Route transcripts to file and print the header for automated debug
   */
  extern virtual function void configure_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void connect_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void configure_test_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void start_of_sim_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task disabled_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task reset_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task training_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task config_dut_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task start_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void start_of_test_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task run_ph();

  // ---------------------------------------------------------------------------
  /** Displays the license features that were used to authorize this suite */
  extern function void display_checked_out_features();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task shutdown_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task cleanup_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: If final report (i.e., #intermediate_report = 0) this method calls
   * report_ph() on the #check object.
   */
  extern virtual function void report_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void final_ph();

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
zGtbLWzeKBAEuU/EdHX4wLP9TFy2cmZ1bw0yaIjP7zA18XQ8v728SdODPk11xo3B
RQF3bK5i0hytBM7u01O7eRmnwvZCiq2V0VsWZEhGjti1sB4TJwE+J5Xtqopb0X8H
Rx2RQCZwwktZrLG1vyqY6cfllbzsCxeNK2YpvQg3yE+4REY3pA21nw==
//pragma protect end_key_block
//pragma protect digest_block
eYE2QZ4lN930nYQutoATFo+T7mA=
//pragma protect end_digest_block
//pragma protect data_block
wy1UVmRSkdLlvUYTPjTRWcKfP5V4/ORAE+7Qz6jM8TykaIElW7fkP5rKFfU9UqwB
rChOO2lnuLFnIen4Uw4GioO0MGxNKzJCwfBkedhUJk52YaQoLDHVoqXu5/oENzZA
+bU7rQTZr0NZZBNmbT2MUIUGSjf2RonqgRBEOxVAfD9g4p6w0I480dpaJE13GLBx
dNvZOJk4Hr/IWpLN3BCxmsbjrtiC08iadJT0bOYBWdwGX6ovvRtJv9F2/NCwUYWF
BZvxCjWq5R69ZFQ13ixCm1p69RbNlzIbCJlfNmFVYHAezU49L13z31iynJPh/Z+3
WgglFR+EH9a5wLKI+5XJMdQJEkxa0g0uyk0fhXTpdv5eZohBMjP3scJVtqSNVJtx
qLmi/DZMOfKpMpYpZDxOoP9TUrBObvbSuEVWW+o6YJW6Zu3wasdMq8YQNywc+Mt9
+IU+9IzoAoMFi0JuVXiOqOyJaTBVNBUNsZ9q3ZbuDiT7teAFDH+ZRIlRMJPTRLpV
ux2g+RIF2JHXVHpqxcS38hMp05Ohy3o0956eHMo+R96hXD5gacUmB7ou93Ionrc5
N4aX72ZS6+pcd0z+O+XTW5PASH9chTtt2t3Np646YBqDNEogu4IpziKvojMigUsM
CgO02JFWqNyHFJG11ZxBkWh89vK7BhczaOv7G8RgoLdcWRyHBz9LyPp2g9SwXk10
B0CXMzAKD7bdinqwXCOPGAppGyIQc5tPTJ+xOvKzWGMSxLcEGY+d/PAdO6sVD9rb
lzpaEAlVx97u4JLXfI8xsteC4dP/ck/DjpzqYOCSm1BFfNCYlfjcNEOtgPJmOSE8
11+84n/RbXrSVPeN62L080p4xyW+jhaAoqcKBMfqfT2GmOPU3YdOA3e5OAgbULu/
lKjrF7Fa36/EMbMFAmiADg==
//pragma protect end_data_block
//pragma protect digest_block
86ROkZ0ZKJqhjkgDC5IdPVVQyBw=
//pragma protect end_digest_block
//pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * If this component is enabled for debug then this method will record the 
   * supplied timeunit and enable the configuration properties that correspond
   * to debug features.
   * 
   * @param pkg_prefix String prepended to the methodology extension
   * @param timeunit_str String identifying the timeunit for the supplied package
   * @param cfg Configuration object to enable debug features on
   * @param save_cfg Configuration that is to be saved. If 'null', then 'cfg' is saved.
   */
  extern protected function void enable_debug_opts(string pkg_prefix, string timeunit_str, svt_configuration cfg, svt_configuration save_cfg = null);

  //----------------------------------------------------------------------------
  /**
   * Function looks up whether debug is enabled for this component. This mainly acts
   * as a front for svt_debug_opts, caching and reusing the information after the first
   * lookup.
   */
  extern virtual function bit get_is_debug_enabled();

  //----------------------------------------------------------------------------
  /**
   * Function to get the configuration that should be stored for this component
   * when debug_opts have been enabled.
   *
   * @param cfg The configuration that has been supplied to reconfigure.
   * @return The configuration that is to be stored.
   */
  extern virtual function svt_configuration get_debug_opts_cfg(svt_configuration cfg);

endclass

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
zsi/53RFXd5gUvBjv35BL/yfrO8fDs2l9Qitkm+D6el+k5KNaZvpma4gRHHRbZj2
aOKm4oDIJzpzywbfC7sb1Nv5Om98EHhuUqOvc1ZdpaJVdIFyjll4+A6n36csyvCB
kgje1OZm05kV01uCSP85rTFA8CBnjs+1lJ4Wz+hqa0aeCpwG2k3pww==
//pragma protect end_key_block
//pragma protect digest_block
e6qp7eiPa7HqEHq1WwbsSwmjHAA=
//pragma protect end_digest_block
//pragma protect data_block
+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

//pragma protect end_data_block
//pragma protect digest_block
O0q8lwHpYoPyEdngk6sHywTo3/8=
//pragma protect end_digest_block
//pragma protect end_protected

//------------------------------------------------------------------------------
//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
yVQqZyoUz9J/3vaOWoQc/0Aemvew9p3Sf9l0h82nP4L/zM5SJGPzk/kc9HX03bmT
O8/PGQvn4pZSjYmYn/7s/iJ2jMbCA+PshL72R5Zs9dqrFMbzIQvqCC0TWnJvN4bo
uWiZ4chP3JAqH3YEbIMNN75Ua+GAfWToJcWQKXrFkPxzyg9AxRRdRw==
//pragma protect end_key_block
//pragma protect digest_block
aoj9DJ9bgORtv6VQ5RhUpYNPsFQ=
//pragma protect end_digest_block
//pragma protect data_block
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
b+Ijrz6veZlbc56XJZtmHA==
//pragma protect end_data_block
//pragma protect digest_block
7Mq6gK7k6bTKXlkCuDCKs6DQEwU=
//pragma protect end_digest_block
//pragma protect end_protected

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
+L3rM/s9RqVpJXW48sG+niokK8/nqFAycxepJ3x31/xnaIOq+0kTu7zGmxjN1WLa
guGwqa7vhOLl7W4squzyOwy7Yow9fHu7hsqzmFIBEd8P7Tyqk0cou6/l7ScBlw2G
Wq5mRsv7A/kbCZ00hLhucswlRx9y0ze/KGSSrglnr2cBsiEuJvsJEw==
//pragma protect end_key_block
//pragma protect digest_block
wj22wFaJJyyDds+le4Oo4FvzwDs=
//pragma protect end_digest_block
//pragma protect data_block
2orDfsamYuxef/FLAkzEzZdgAjWZELkyZiGCy0d+KIGWE8WynJSSWGnBmM/LgVew
4TcdfiXSCfoAtCEjlDfAOPkFo8mCrVNpgdDepro55aoXxMLzE6Gdhl9VipEmsUJz
vQuK6NGi4VFR7uMgVs7xlfqlGXb/JxDnZWHjkGVUog3JmR6F2/tPXXkdV2m+AMuB
GfEIsR7/BAIHm+7/5+GkbGss5oirlbzbJKCEhjShrVr9Dqp+8saNgXXvqSKZaNPt
Umbq5zoQPzJ3HrkVTUa6lRCPN8YD30R7F+81+S+yaL9srKF2PSiPxAnk/59mMC5v
Yio3C3CwixzRE5Jrm+yDCiaK9iUMgZyrsQkA3UEUcyOAPsPuTi9XfpYWL13s19gD
HU6TaF1M0tdK8YHlCLsUtLtvhRHiLpN2tsCpslh3lBFv7LFTJykW1vYAtrKyL6ND
8cccV3QpQbyq48+dgE15hK1YGBEZw0HkMfgTwu9BfMRHxFNM1uVBs/0FzUDkHI9z
EehZ03Ugv3XOkgxAy3Vkk50ZPJlNR+4WeQn08CkFQyChlbUY69r6x3bZtA/pktJY
aFuNuyYUrwG3e/Plj0D53npyhyEPagvqhyBoCqFqiKksXMKtpvOyKz0+6/AWgKwn
H8+uu/FNgdySALxio4Exs9VoWIYiXs5n5H2Ws+IlRvqDLI+7m9Jjb/LXR8sc59um
qjPt3JgViZXc1Ih6fCm3FHoH2ZydzC9DMtHscBAHqt9Efz21WK7HPVifn5R0KYkv
CBVtZPJ6JLwfr9Z/3De4B+9vOQakOSobx9XzxgmfHxZT5H1K6e5fqEeyT+hfMCWf
lmEyIlB1m7hMJW/V4kEOT4cFTvRoYFpWsymj/9eP2als2FCYmrcj0cuNaR1AEIZz
+J0ZhOToH/G3lMWrBj8Id77EaKfqQW0NAB5yZVamp0AEzlAWg4NoILS3eWTSP8qD
FUqwkBiXRJPlY2vthXCT/fWQgzEhjPuSUOEiZDgHXIbYGHQIn3HYop3HA1b9cMNL
L+i9ODPlbcWFGH/NJoybM/xmPwHFvDKpWfp2+FI60DwjjzBGqxnOPNQAmZ+0oMcE
se18pkAXFtl1ESklVvYQnBQTvKrwYUdUcGMNmwIvUAz8ta/9qMRDDNEntNnTF7ij
vrDVjcDHPaPG6DXVpAd1aB45iLCyvOiCTyjTm2vir1RsaW7GZyw1ndB75Q0UOZyz
T2LUiwGyaN+SPrJIesDlJ3UyhpBaP3f7MKBjs4FQ7oWwH6knrIPwoYeRw//5neVq
5XsmCFKfmYd0uyOXKaUWShvY4FrkRfsv/I1dPOlO68R6CKC1YZFr9njbk0VgXUC0
Kj1QB4xgdGaN/NeQL7SsSTI4+aVZKqXS+0p2u6tKJ1Z9KtdgQTXQL1dFvrc66Scz
FiKcx0t4/U2tRLx74KALD7uXjPGadlJGohV/Nen5EFu3sXeHqNGFUO/t+WDokkKX
DyU4TUaXgd38x+2tA5MiUDXTLZg/wU8+r4YMcVG4CbaFYP7Y8EQ4onpzOHWyszk5
dsJx+lA442NVSOCcBGxufZ+wKJVYb/+SPl0oSIGS0Z+yQOdleWxlIzIcjv+vKttN
YZvocmCw+qEMJLvGT8FRi0g6VXS4f8BHB43zwYARJ6g2oPdQ45HP43sNu7/sMl0l
Qjh07nZlpXhYFWRyP83LhDYU+tQvpRpRSnWqpxUvknV2J0Sa0J5RmoAu0ZLRE3e+
HMQAjlwKzMGf/gCj5tsGIzuwAvY5GM3mh2vhtjq6NeKKNq81CxcsQ+IAvdCV21nk
V7LyYxVQPbmCaL9BLxhMlg==
//pragma protect end_data_block
//pragma protect digest_block
Jya06yx8xpQfzdERmMr8AGEp52M=
//pragma protect end_digest_block
//pragma protect end_protected

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
GG4+3Zn8jsdC6+IQC2+rGK6ayVlunHtezEMSsCznwyOX+m2wxvCqD5iLeGHiYfGs
pAD9Uia4u7WwUrk6AlFC7D+QzN5ItRlo/b0zwkG7fj6y9fbdlAz6Qq4rb0RgkLnY
yEglOeqYlunZ1/1i1xbKKjz2ERi3954vccOpM7sNWKtvT8PVIPpYFQ==
//pragma protect end_key_block
//pragma protect digest_block
UJWOW5HJSykRv3wn8B8i9tnJaR4=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
elNLfK1a9FpPzLxh/Zop8oeTXsM=
//pragma protect end_digest_block
//pragma protect end_protected

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
nnzvf8akyJN/LIHbRQZ3Qha35pF6XErZSy6Vs1BTHy25HnZyr0QgwgaliHNWjiNH
zNZ0Vi1zDWYWSjW3X+9c9OLLkLoYKA38lgS8JzQ5pOxB421720L95zxBKIsRn+QU
2scwHn+TrK0dnjRHQBVzvXnuvl1eDBzm1D/fLxhcH6gm7SSm132J4A==
//pragma protect end_key_block
//pragma protect digest_block
QxVghZC1T4BoCKlavvfLFEhU/I8=
//pragma protect end_digest_block
//pragma protect data_block
8u680cl8gyvWrcZNzztMLBW4EFQC8IYMYfa+lRKBHBZx01PM7cn6RxeqHVLgWT5I
oljJzOvyfd3Ek+avXWKrLsxSducudvoC70dwPgSiCuh4VsQ4G/kvqxiz0JFXwhlo
LgB6Ewy0uTzgHjPPQNLOLlOgmCjiBSAJBARCFcc/l4Gdq+7PyyuGTbDeLym8wsiG
DenZnXIvMupj+QHM0J8WycUj+e8/mcUOl4CMiWb2u45PMaaBNqZOzVrRhJgZqSBS
gq/U1brUItet4j+8Y6fPy2b6Y7cfeTOhKHd8AA4kyBy0Oc8mO8tlayJUc0RbUHR3
y5zEzMQzdbAgi8qGUUNSyNnDWbQfgAR7olpE+zbi0F1EcEF1NnAxgiu5rfzMlUFo
LIFVEszfkO/i6m1+wKNFmagujmMXMwq84SMpjh4PTuJuHJavYadkqJ4DTwpLynPS
+jWtmHep6p9jmoKxteVC4YgYEzTE/GwL+RubsQA5LEKi4ddn0+0H5xQ/WAscrdW1
k6nFK6k7608cOw1fl7stGRsIHAwX9IGaQ/GeMHoGWjc8QXlUSVlADakdjawhB70X
psvYbtZYCs0MOfrlrrc+hHITEZNlznOHYHj53bzfjBD+7pYzVkZ4TjQef4h4FLjd
xsG8iZbYVGOwxGlBQYGrY4vxdEcFf12+31dBAfvh1OEVbnUYUhjqEgbLYMOHfagv
176wMeSTSl/1e8qq7UDsnyxJkZXHQFywm21c32+X/CXQ+oJGET8+4zCEVROfzVab
M3Xfs1j/MPaTQxBICqagZZCzXBIeBo82o2nxP0JCqvOJyEesqj/m4InJoCz+kRFE
zLkk+3mbjZVGC/i+FhKvegbQCKKZ/e5yjFInznEitv4TxnH1/i7oZ/hpd+uA4zSK
vwnv/0qQV2MSZE8mnLelhmy95OVRuium2JxRTgTEgUTFgv7Gv6hc005JJFeiEY6c
x8SSveSVME2Y7jQDsLud0D//RydPNoYK6kx6ibSpXjSHFtidUGvEjlPlWqSdjipB
MbHkDFjJOx2Q9VcZ5IgZHxDorrbdD/VjRgx1wfP8Oz3OEAesLPd6u08ynKQ36qrF
P6/CDG4S8ofAIniVagwkU0lO/JZEOE/XatV/SBPR/+sSARAmmMtT4koqrw3/h3zo
aiQfTahb7EIqWY7emvkUvpov4mHAYRSfIWLiUop1rrGLHUCzVDR9ZVUWi5q0xVUu
ri2dcxjMGE5NzQYLDtGlN+0CEGvq23OfB50VL6EvxudtQVqdFsIhHQMZAfw58rNH
dj19mor/Y2hlVTx7wQqYWydJELdAtS6vPgu9H5HL3cZ5dQ/KukCmwQOGk1K0a/+C
tWXdi73PNeWv3JpEvkRonGZQ+ikpWqKo8fEYJ6lYpjVRQ+4fgINKSM1PMKZMrbGM
Axzs/qG+SXd/ddzV3bYzsaVt61xBT2/p1AO272xyWt13muRIUqQz93xkGLbpqhlQ
ZqkeYz8lJ5+U0N+mjSsY11N5nEsP7zcoKjOZ6u+1RhcTVQvgBYx9wKiVLpNeXlDg
FBnOiq/+ZQzu2Tse7JSd/8HouNTP7SBfbWS01WKTgT5CLNpEk/a7T5mOn15sMJtl
Bg3qa8bYNbObLRB2ESmTk51qSuHih8NhE9wwYvKEpioiEPK4YcbardGssWLTYRbL
IkMksJUUMqV7GL2sJND263kuCo6eVkaw/PkJ8wwmST4bbGNjoSyASlx5Iu1k3qpG
5J4wfLlvPDn8GugV/2txh9Rwuk9fWJP+KjN8JwhKR+pKpR6T4LQC0l8jRC19rbYN
W8NpHAxphnqcWbOBjgANGn58UvqU2/2n3Vd8S7ZaSJllxG+t97Q2LGRyWLxDhOU+
B7gJTG+uG/Wi7Z0wfDWOrXhBOpFP/og41WejkCQT07+TiTnBw/xi8xeVA9KnoKAN

//pragma protect end_data_block
//pragma protect digest_block
KEeTUsBkqQwE4Y39CBn8FAQ+E+k=
//pragma protect end_digest_block
//pragma protect end_protected

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
v4oCnd9YUbd42Xoqt3TMWsl7QMFw4QGHd/NVN+Ky7jKGISRBVaqMvbC7iR3xHs4D
LGK3ftSNXE3tGAulO4OGEzZaoihA0VOvO9QBxoWNBvZtht3dhRBkjlMYsLrdrgN3
jyHbyXO4GRDRFWGnmkW8LdIwIKxvbzWqSisBWpj1EsZGqowl3botFw==
//pragma protect end_key_block
//pragma protect digest_block
x1Oj9St96oIFRDdjmCQ4eQIouXY=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
6PaeE7GMby/BYeSp59iGFV75sJg=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // SVT_PRE_VMM_12

`endif // GUARD_SVT_GROUP_SV
