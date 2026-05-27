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

`ifndef GUARD_SVT_PACKER_SV
`define GUARD_SVT_PACKER_SV

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_defines)

// =============================================================================
/**
 * Used to extend the basic `SVT_XVM(packer) abilities for use with SVT based VIP.
 */
class svt_packer extends `SVT_XVM(packer);
   
  // ****************************************************************************
  // GeneralTypes
  // ****************************************************************************

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /**
   * Special kind which can be used by clients to convey kind information beyond
   * that provided by the base `SVT_XVM(packer)::physical and `SVT_XVM(packer)::abstract
   * flags. Setting to -1 (the default) results in the compare type being
   * completely defined by `SVT_XVM(packer)::physical and `SVT_XVM(packer)::abstract.
   */
  int special_kind = -1;

`ifdef SVT_UVM_1800_2_2017_OR_HIGHER
  /**
   * Added property which was removed in the IEEE 1800.2 release
   */
  bit physical = 1;

  /**
   * Added property which was removed in the IEEE 1800.2 release
   */
  bit abstract = 1;
`endif

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_packer class.
   *
   * @param special_kind Initial value for the special_kind field.
   */
  extern function new(int special_kind);

  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * Method to obtain a calculated kind value based on the special_kind setting
   * as well as the `SVT_XVM(packer)::physical and `SVT_XVM(packer)::abstract settings.
   *
   * @return Calculated kind value.
   */
  extern virtual function int get_kind();

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
vcBcOclkxeqQC7bIem3hZ7bbb6Wlh8i8KfTn8i7cQPq1fhuqUsE4yjreRS2GKYTI
y6+bpJ4Om0BBWBodhkKteolU2mlxFoLudYEjrtA8Wv6f7xQcWrsoo1hbwiaPhu0O
6KuXyedyIwcHjOt3bj6vhDY8o8/umogYbUc/I97j9NVhunsMsC6rhg==
//pragma protect end_key_block
//pragma protect digest_block
t4Px6YdsDXBLilblJ3bJR7s6VvY=
//pragma protect end_digest_block
//pragma protect data_block
37Cm8MJSG3a1maQZyKtH6Flmej1fsV18TX0AfDOEHnPqQlNUBQscA6C5JBIUbzsx
XydWQ3HQ7DBrBdztW67hBr921RIx7aoW16lU3uCg251JdnYXbgO/GOufOvyT3wKz
pTSv8fpbzKUwtLI8cAoRPSiWPzCt4jywWT/8bfTzig6C4Lz+N0BDfzeovlnDfQmn
s+uVeThajhthmqga0SwaM80YPc+UlwFyXWV3gQNd+46OD1hnwSGG5vMAli/A2REF
KYLe7WGsGwEZNjejfFztJhn2VeLf1O5S+J0w98ASpOM5Mejm34SC5tTID23GJRiB
Agm5EAQxS5UOvvR3KbxLnC2UYQwtGFT2LpiBZb4NSwkOguP2RWgnJ8cBLlbq9OPl
9IMbcaLWvLtugeNycA21tXgoaAfMeSJvcc4YUVCimZaxhFuUmxoKsEHHorKSg4+0
Rv1sOE7Mv9LMU5J+q7CTl8hnXy19oSzbzCMn99OBHsSiBEb6m/yX7C/n4J/C/wKP
MUr6s4+x3waOKlTld6Ygvwa9HjXTZvBmysspGsipY9Ibs7zy5vNhu6O0ct+GPF0K
PKutMO2Mr/TJizChsGs++04dpJmYyjMzQI4zxTPR6bxNQqcMOSrE99mYw+ca0wmw
qORPh/moxGrCa6r6MLXJBclqO3LQJzzWK0DyWifrK4mP8RCgsFsGrkwzZz/9M7ix
wbDbqblqOTdt2KKPqQx7M6EK366bdFzD8BQqI5rFwE4nS5Kk/kVt7f5eKQDAn9hn
90MQXl0qJxHnQyFfM6ptD4RfuX5ery7WlCZu/vFWa1HubUhclBmU0EpqrvkNCoX+
MKOb/Onkp1ZCZtut7BvSmubxl71kkQ/hglpI6+dhhey+D87zKvzmzzEdMgt4as/Y
FJulAbGvgdHWM6xBOQkoI+c1n+OpNlVDYfQrC+vLSdlnXres3/KKnZ9g76E7yAos
KBLBL5TydChadPwEQXFULAUu3Srs0kmXPElNlMmhM6S54mGtkkbLthlwEeYHrRvV
7xSCrlTcPIqMZBdGDGok12cUhEollq/50+q1uV89QDYDo8pCdITkJfSlA/ej2gdF
cSYZqxMSgXT1pxELz239KlabHKXA8+14raLItApsOrP6itQFaN0P1wFu9RA26dqX
edz7ed+cdXDlnp7Xf48N753I77KiRSVjJZf7327ysfO2J32X7dvQX3LKpOtfnTjw
z543H/3gWrul2K59QGcqcLI8lgeB434LgR0GuTVr5XRuP9/GfsSTWzwu6LVmEtWT
JvN07LYbiEytqv54tUJtki512SbOjDJojR3kHuJxNLM=
//pragma protect end_data_block
//pragma protect digest_block
Vjr76XrzPMZ2P+lNpAWW3nEJZOo=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_PACKER_SV
