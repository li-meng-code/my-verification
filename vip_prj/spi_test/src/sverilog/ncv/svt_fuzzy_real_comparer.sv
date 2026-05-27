//=======================================================================
// COPYRIGHT (C) 2013-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_FUZZY_REAL_COMPARER_SV
`define GUARD_SVT_FUZZY_REAL_COMPARER_SV

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_defines)

// =============================================================================
/**
 * Used to extend the basic `SVT_XVM(comparer) abilities for use with SVT based VIP.
 */
class svt_fuzzy_real_comparer extends `SVT_XVM(comparer);

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /**
   * Data member to control the precision of the fuzzy compare.
   */
  real fuzzy_compare_precision = `SVT_DEFAULT_FUZZY_COMPARE_PRECISION;

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_fuzzy_real_comparer class.
   */
  extern function new();

  // ---------------------------------------------------------------------------
  /**
   * Used to compare a real field.
   *
   * @param name Name of the field being compared, used for purposes of storing and printing a miscompare.
   * @param lhs The field value for the object doing the compare.
   * @param rhs The field value for the object being compared.
   * @return Indicates whether the compare was a match (1) or a mismatch (0).
   */
  extern virtual function bit compare_field_real(string name, real lhs, real rhs);

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
uUH4w2yi/yBMVdAValLHAvYc9MmMWAtxfd6J02c1wQT3/ZWgg2cx91kcET5DrMAn
2a44Lc/FEuYQLY+SNji5WsaKwQxsqHeVlEpaLLsf2KgLDGItPSziIV3hyzosD5YE
kjovZXNURyMKWTQXIHeY62Md4Q0ydBj3H3yoVx8kRJG0u4YFQ19l6g==
//pragma protect end_key_block
//pragma protect digest_block
BSBQ5hWP3k+wXYzYoVtPkA8A/TE=
//pragma protect end_digest_block
//pragma protect data_block
/kWtehzt0y2CoexolNSuEK4QZnfroKmqdCVOk2IIFfsfaavb7AojhOPTc79CXFfw
ldYMcCG98JnpbgY5frK1/UHQSI5AlIHNZAFMN4GIncR6jKvYkyxMXx/Y4YrpdfIR
rUEDOYOE04zVvj9q8xoEJJW/Rpfb0Hh8D9Y+4J/cI6Z/SQS+Rx71tiBTxZGlPzNu
HT9KEc3yXr4RorOHrABwgAKYklWSl5EEgqbtib4Y6/5DhqHkV53l+kRcxe4KU/6A
1yPBBlZC4OacMfnKGPTiesuwBIeulIVaJhCHpea/MXglZvhpjoQm7R9jrUHCd+U1
iGWqjIK5bMoYHtzBLaxwZB/IzI0GAMi7tyPsan5gGFodamHvzMXcWP2kyO/xY0NZ
0AghmYXFdiaeD19u70XOPdLgG7ACgLIvzvTeqJSjDRc+10MfdfqonLoyB3dHDiBk
sQ9SyLHDN7qE4ZCapeUfaSo0iO0fSoWwe7mbCONhVR26a/QI1WU/LW/BSgGhjLvN
FmN63rhPaoE9lHqUk5vhbNlSlHzZbSTF3btXHU8uGYwvT9aMdtublxOuRyTr9E+P
9w/pk586w8iyERexkaOWcZXXo/x6hZOCoEbovljP4toOTw1znfTBMWRcddngxEL5
9Z7lhJOFgAPr1vtS8jAw5e06BIg32MkKBItT9MvbDurzjyb6KLjEauQu5B4hvyOU
b6oemO8lEbw5I+AZshBWQzXlUgi+SbGpYsNg24VlpxLfJyeP0eZ2YyraaGVvUwTj
s07w9pnoAbqy/Wfk7Nh9eYT/cS/zHrhOpK3hmurG4WhhAq6kWH8jbNTdpbvYTntN
+c+o7bCMao46kgH+kq0Lblw2262XnaqNILABuRwP9dskebCR1qTeYa8eSVnvzgsl
kjgjr4cFZ2E46bSoL47CQdAo0tG30loLKpaKyUWePzIIS1AmJdS5zxOOGI/viUgf
or9R4KHU97HGvokOYnOxVW5TH3JHZPVosJyjxn1Ea9Lw3+Fs0pf6Q/Smaal7ggTm
v27OPCJlCSpPspZG1t9RR2l3XqYf9M9xXreqapb0+4n5CWCbRAWWqKnbR09X7scn
Ii3Pyjal0sT1XO7ZMcUrgtQWZkPBZQm7Q6yYLbmJoxqyBbjYqO+5lmqTMSfSyZ/h
VKmKP3123otrXJtyZfBtHsJA5qqY//+2Q4YNejmZsPn7ZzaUYBdJluGmxiVW2Q9i
xBwgUXtHlrAIfnZzOpyFIr13K8CcBsMK9C7DvXcfjuG7BcRGNnKSPHA9Mj+n0++W
Rr9QQu80gQReur6EsFmiGIe+ABT0Jucui6Ciw+VXd121aR8w5TmPqI6eJeS203Fr
vBNnhtvApiRcmObuRx37nL6ubFsbhXs/EAP6jFepkVh1PGSpirFcuYbGB2pmoeMX
dqIypllDk3+/m6PbKj44fYmVRFaXXG9DOB970XAOpNp6NR+bpbC4qwxuX+6O8QSl
+sMFi6eQpUg9r8QpI60R/9hfApwomFJ6OPT0ZaXM4KeY165lv17hB1B8wmrCuu5b
k7YLy/J+klwUbNNKzKoitOOsjdD2ln70EDCX8YHHN2sp3d+RV3ieM3o/rJvIdfQT

//pragma protect end_data_block
//pragma protect digest_block
eprfzGgX2JhDEtlZEr/xAH5WJM4=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_FUZZY_REAL_COMPARER_SV
