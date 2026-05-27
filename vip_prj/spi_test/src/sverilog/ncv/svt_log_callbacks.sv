//=======================================================================
// COPYRIGHT (C) 2007-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_LOG_CALLBACKS_SV
`define GUARD_SVT_LOG_CALLBACKS_SV

// =============================================================================
// DECLARATIONS & IMPLEMENTATIONS: svt_log_callbacks class
/**
 * This class is an extension used by the verification environment to catch the
 * pre_abort() callback before the simulator exits.  In the callback extension,
 * the vmm_env::report() method is called in order to provide context to the
 * events that lead up to the fatal error.
 */
 class svt_log_callbacks extends vmm_log_callbacks;

  /** ENV backpointer that is used used by the pre_abort() method. */
  protected vmm_env env;

  // --------------------------------------------------------------------------
  /** CONSTRUCTOR: Creates a new instance of the svt_log_callbacks class.  */
  extern function new(vmm_env env = null);

  // --------------------------------------------------------------------------
  /**
   * This virtual method is extended to catch situations when the simulator is
   * about to abort after the stop_after_n_errors limit has been reached or
   * a fatal error has been generated.  The only objective is to put out an
   * appropriate Passed/Failed message based on this event.
   */
  extern virtual function void pre_abort(vmm_log log);

endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
J0dQDKe0/iGewpUdsmOyc3d8UlA0Zn4dLsMgQj29vyRUA6Ag2jTYnfkuLQBt5M4B
Ad333hOBYUS0i/RQr/swlLGDJDg8CzTA9cdNlBEBY0mFfiyo9MeOIWyP06nDxpsn
15w+Jpf/O6QJcTYUKMEB6A4gW+pErVZZcL6UENtnTV5Q2QSVtTX7Rg==
//pragma protect end_key_block
//pragma protect digest_block
hwz3Fq0BvdHafcBugN/UmfgU8Vw=
//pragma protect end_digest_block
//pragma protect data_block
rLNgb/dxGzH5F34PBzQQAdo6WmkEHqBHQ/bltuAwN8lnkfryv9TGG+swVtFt1asj
C2G8CS11o9jqDAo1ZJTHJ1vuCpu1Q3B+X5i/OJokzanlP9dsAo0w4rmcZ+1zfirY
K/RE1GAxAbVq+OVCfQdIy3xVk8cl1hDLE3i/5OAoAmqRxKbV+8RAZd1L5TalrmAq
6n1OwS6NF3+N/lUNspLyTe6S93CaFlLVhwZKT1LXTn405U6JndQjsFflSCNCvPxd
+KbUvetTe/2b8zLej0AXAKlGcrLfPh4n0COv0aYNgA70/0+HGR9q48i5/+bRreiy
Is6YNdrMjDukR7selXEaaG9wtQuA+H6WwfWxVdEMbc7GGVw4teYZsujTGRtD3sF+
MmrHxQZ53z9wgR8+gCoWkMo41qWoGPPPZ04zunGnIZWkffhUpLsIigRhqax4kkSZ
eDhxMSPQhGWTAYPP+jOpxJh3zXDY6mNjYiIVFHjAQtgZIE/Un5nUdCp+qI0zgwZC
yYWy5vOlDwT4Qq42FMbLvmdAo5yuprz/LIuYhQ6AiovlbbKg4LGsrnZUb92xbwFD
AsyYOLx158b+7tcAtK+8Y4fGWyiz3LkUaCsWMhl9WlgsGpRbmh1RXKE8MaWkSUCz
LY8H8k8W4ReOvK5mj79o4xk+g3sRl2iwENQg3tW5y/zGJocq84lEj0ho69dOcIo9
yA92uV/z8zFiZn/++/KtnJ+iBcEdY2UGMat2VydcpJxih/OQPaAefy0TFVoft8Xi
uu8/r4yLMUGbq2uRFY1KtCb4Gm2BBsQaJ0kB9u5DtDTzC0GAaWwokq21UPbHDKI4
hxVUGCj6M3i+wwzHQqmyvSyw58qnfEGWsDqg0kz0iVT5JK6fQYJD5bH0h9IvQC0u
2iPlkowujI/IjQx/2vc3Hz9baGHfZGLFGudi7oHgoJIK9dgOno+c0xkHW8o2p56m
S7B+o67kCncYgyxRc37g4c5ER/Mx/XMEVzdy+0JgTh7B2lUqvHhzzr93jXf8Epc0
L//iaJRF4a/jI+Fnb3YQYVXYtorKz2Dzko0CVqIabK5OTM2bQp0BzaTmQxCPK3Us
DIwfy89dfP6KL4UMSRB1O74CccVJENPkFMxdcD7UyaNdvmZIqRUpa1HM+5wfhvAv
wA5NsiwH1Nx9CJeKouMlwoB0Y/IqO4zP+cA5/o7Q0vRZCENI750KcNDrblENxubi
sT4yI9HKx1YupgBfWAfLVw==
//pragma protect end_data_block
//pragma protect digest_block
V68HM5eYqEKznMQPm3gZFEXfjWc=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_LOG_CALLBACKS_SV
