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

`ifndef GUARD_SVT_RANDOMIZE_ASSISTANT_SV
`define GUARD_SVT_RANDOMIZE_ASSISTANT_SV

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_defines)

// =============================================================================
/**
 * This class provides randomization capabilities for properties that the
 * SystemVerilog language does not currently support.
 * 
 * This class currently supports the following properties:
 * 
 * - real values distributed within a provided range.  The value returned
 *   from the call to get_rand_range_real() is controlled by the 
 * .
 */
class svt_randomize_assistant;

  /** Singleton instance */
  local static svt_randomize_assistant singleton;

`ifdef SVT_VMM_TECHNOLOGY
  /** VMM log instance */
  static vmm_log log = new("svt_randomize_assistant", "VMM Log Object");
`else
  /** UVM Reporter instance */
  static `SVT_XVM(report_object) reporter = `SVT_XVM(root)::get();
`endif

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
PW3tgYgjKOvvg8dDq8zor3+Xb8QmRuww5yIIPYEpmi91Xhfx6oNwpEezzxcIHZnN
hmVRIFNIizB3iiIgDVJ5cLRdSjbvJk//LSzr1V8UJpP93WN/G7uVVqh7QVH/+aQU
5W4eIT/kFrL3/up/GGLWnfPyHiZBMQcu4V8xnTM/z+1CUWVXy0uFNw==
//pragma protect end_key_block
//pragma protect digest_block
MUqwkZDKEXxnI871EVzPiEoMVt0=
//pragma protect end_digest_block
//pragma protect data_block
S5kD75juhjZoEssX68VPRkuxOC0ZYV+mGYwJ60DL22DCUCBwJhqCnji6ST29u6ms
MIAPs3bC23fIXiQw4iRlrokAexdWPBzs8n4Ptd5nvHhJYYeJU41bvBTW9g+eZ1uj
VLIHdrpnrlQ9sIacNYOtNLJiFXX42ul69OB7CMMNvcU4G/1E/DBtwPtQ5sesRG/Q
+lsUFqaO6cmQtmw8Zau7bHJSNXMJHoFPx5WX+fh1fx56s6enN2qRhOsvrLCCdG1R
iJ85OcYKxIiTbYx5Co8DugK+paOcWSX8pJBZxDaiWim+F46yBGqGy1GKMOzX0JIR
n/R9IdMpgLt8JypEG3am9hpaNoDfsKdgI6YA1j4N06yTco5Xe5M4MXt0CUsZnkjb
PPWwaHoAFCWbh7fpeUUy6GIjpIT4BqMF04oQhWSWOaAdtAHSEgHaIX/flaLAVxS3
5S8SMVklxd1NmmH7spqUgeND5AfuBY+tbXDBwLB47TO9qG6Q/9pEE2kazK9Ck11C
2RSOKioBI9P0vh7syb9bCcKvl9/svWZpVyvD45ROSssunlW/MFmnOlMRWQTGZ1Eb
fRWXnIcotFxb+zVqkqTDFRTxvjao4YRGUUh6XQFCsiCPPDdAgVnvqHPasPjS/9hu
njaenbLTD0vvcLdwqyVNMDXiIW5itiu4cOz/EzbEUeOp34XQv7NmI0NMLaeFhxaW
g7TZGIAeo2tJohfFjvckGw3YfuveHIA8EfS6V5G9SHfaC8vQ0WyT84utCUkr2zuL
xLpSRoqk6+bYx/8HWUGiFfIAdPwpn3CSXjKJ/JZdOGRrT9H1yFsA1TY+I8b9J75F
Y1yr/o3nuv2cBtqNbvGcMPnJWSXEan20VfdE5U+gUlJh9pIxNepeD4vcZI6fXNTf
UicUDXzzGuK79ihxuyC90GjwD3KFY0DrXvKXl7r76EqaGCBDjAXGK8cPD6sDUp5s
ElsMkTyQPwR9oLMWciQoJBhUMmdQ6acfSidV7G6KIFqwnivcEA9PVhY/jphO2kHi
RU4yhdtiZxH1QOnWUBk8rC1mOHinG2xSh6dVioYGvbkr8s4bCN7LAxaDaR/xNBVq
UwwyQ9m0YeJLiQKymqqjtJAziUuvqnZ116iYhwf9eSnHSr5H0bCoIj5QNMuEEmlz
dsJieqLTZzA0ZPMk8U7JFO2CTNYlbKbt67sXLEH+8Td+BMidF7qb5SvuirrM5gHv
N5iWMrRcuoqTOuzYyTMnVg==
//pragma protect end_data_block
//pragma protect digest_block
1HujyRKxXXoVzWTA/e1e6SlXvfM=
//pragma protect end_digest_block
//pragma protect end_protected

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /** Constructor */
  extern /** local **/ function new();

  /** Singleton accessor method */
  extern static function svt_randomize_assistant get();

  //----------------------------------------------------------------------------
  /**
   * Sets the distribution control for this class.  These values are used by the
   * get_rand_range_real() method.
   * 
   * @param max Percent chance that the returned value will result in the maximum value
   * 
   * @param min Percent chance that the returned value will result in the minimum value
   * 
   * @param mid Percent chance that the returned value will result in a value that is
   * in the approximate midpoint between the min and max value.
   */
  extern function void set_range_weight(int unsigned max = 33, int unsigned min = 33, int unsigned mid = 25);

  //----------------------------------------------------------------------------
  /**
   * Returns a 'real' value that falls between the provided values.  The weightings
   * applied to the returned value can be set using set_range_weight().
   * 
   * @param min_value Lower bound for the range
   * 
   * @param max_value Upper bound for the range
   */
  extern function real get_rand_range_real(real min_value, real max_value);

endclass: svt_randomize_assistant

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
kgD1kMJkEG3UNoJIBoLQrPzyZp4s24ky1lrQIjbcvmn3PK5kiExkOZHNOQM+k8TM
/2kKduROhasmE3P2bUBDuuYrEd93kr55qQHxTxMnlU6XyAuIaIUQWgPSF8BbdATv
7Pbgd3tlnnz2tqt/PrntEjaKeAOEaogMyQZToIXcOpMgkTV4xYAo5Q==
//pragma protect end_key_block
//pragma protect digest_block
5T3F/lDYFGrMgixFn0NGNRyPCFM=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
AkZ5KuGtNaC2p2Vio6BQSfs7aAc=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_RANDOMIZE_ASSISTANT_SV
