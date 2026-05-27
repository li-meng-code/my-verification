//=======================================================================
// COPYRIGHT (C) 2007-2016 SYNOPSYS INC.
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

`ifndef GUARD_SVT_DYNAMIC_REPORT_OBJECT_SV
`define GUARD_SVT_DYNAMIC_REPORT_OBJECT_SV

/** @cond PRIVATE */

`ifndef SVT_VMM_TECHNOLOGY

// =============================================================================
/**
 * Utility `SVT_XVM(report_object) class, not extended from `SVT_XVM(component), that
 * provides some of the features normally only available to `SVT_XVM(report_object)
 * instances which are extended from SVT_XVM(component). These features include:
 *  - Access to a full path for the instance
 *  - Updates to verbosity/severity/actions within the hierarchy
 *  .
 *
 * The main benefit of these instances as opposed to component instances is that these
 * instances can be created dynamically over the course of the simulation, outside
 * of the build phase.
 *
 * The svt_dynamic_report_object instance relies on a `SVT_XVM(report_object) extended
 * parent instance, which is used to access the parent's hierarchy and `SVT_XVM(report_handler).
 * Parents extended from `SVT_XVM(component) or svt_dynamic_report_object have the potential
 * to provide access to a fully rooted hierarchy. A parent simply based on `SVT_XVM(report_object),
 * however, will only provide a connection to a local hierarchy.
 */
class svt_dynamic_report_object extends `SVT_XVM(report_object);

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
4/+A3s3nLaIzCOrgEwvBdIee457NkQdMpYkD5aNWpdGu7a/yUOAZwygDIxX2ab3A
WphBIqNGUamukcLjWiG7wi/Be66CVkIjDeJtoqcHrwpxQ/Y1c2aU8Y5KOdvigk8Q
0bqKdWGwYMAzHElhlG+21xYEAwnTg6fmdJ4WjmHmE3xk0szi3513ow==
//pragma protect end_key_block
//pragma protect digest_block
abRwdIUt1uJQgHSdSxCzK35/IMU=
//pragma protect end_digest_block
//pragma protect data_block
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
KKenWIBOGyl/90K7Me/SNw==
//pragma protect end_data_block
//pragma protect digest_block
Wty8e8C92ipmvg0Oxq25zSfxk2k=
//pragma protect end_digest_block
//pragma protect end_protected
endclass
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Dc3s3mvkoNXGURpUI59DoIdvUka02OB9nCopcvBi1w4xN/NTGr4b9VLdjA5Cq1AS
baxsH862VfzYtXX6k7tQ25vouAu4Ssg7+7JdzARH6sKjItzd5ehJgNTWr/pXFkxr
PlBHMBwPkg/ZX2Aj7fMPY5MlIWYqt+bCGQFEdBR/U2xwrUfP+8TINA==
//pragma protect end_key_block
//pragma protect digest_block
Ac0e4BO5lDPi+id1LB/Q3A04w/A=
//pragma protect end_digest_block
//pragma protect data_block
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
GbkyutoSgCifbwZ/oktVkg==
//pragma protect end_data_block
//pragma protect digest_block
7rX59xm248L3ZZSUaAi8W+TW5KM=
//pragma protect end_digest_block
//pragma protect end_protected
// =============================================================================

`endif
/** @endcond */

`endif // GUARD_SVT_DYNAMIC_REPORT_OBJECT_SV
