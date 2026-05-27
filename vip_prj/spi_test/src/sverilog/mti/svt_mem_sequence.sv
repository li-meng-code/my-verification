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

`ifndef GUARD_SVT_MEM_SEQUENCE_SV
`define GUARD_SVT_MEM_SEQUENCE_SV

`ifndef SVT_VMM_TECHNOLOGY

typedef class svt_mem_sequence;

// =============================================================================
/**
 * Base class for all SVT mem sequences. Because of the mem nature of the
 * protocol, the direction of requests (REQ) and responses (RSP) is reversed from the
 * usual sequencer/driver flow.
 */
virtual class svt_mem_sequence extends svt_reactive_sequence#(svt_mem_transaction);

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************
   
   
  /** CONSTRUCTOR: Create a new SVT sequence object */
  extern function new (string name = "svt_mem_sequence", string suite_spec = "");

  // =============================================================================

endclass


//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
IsqbZw/lG1jv0hi6dU+v3zAn+v46GE0gEOJm7UOgIx9c/DGo0L7L52FGv4IlG0nl
FuOGs94V0hJ54tade+s7QlO0Lw4sFySnd/97FHe0UC+xfktNUNMpGdOYZ0FCrPX3
EJEaRH41IRYi15Vw5ZBJIu5UylPpgn5UF9TccFjPQ84=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 345       )
ZKM8V8MLI+Enew+p5898dILfZxe0r1DoQDUkZurdSBDjB7VIOsNHOe2FDJ82IeVr
QA++sYgCY+YVh494r2rK7mehcHUtTAcDl108ok1U9Zv8EeWFfDxHd0Jiasp2x07P
TSCYCwXP4MFD/qT+vNq9z8+UMZgxlvjRotDOlS8Vo0jz9X2IdJN/fKdW6ooLUnQr
r4KBqyoGTnOi4bm8OqO+bMqONkIjD1V3MNOI8W+N1LtZNzbzrZD66rkKTWcRlN8H
ECHHdVkfOycLwe/tDUay+K7ickzyCNrCTWf1KwPnmZNdW6UQ898NU9tmhM3FO6hY
jfOpx3xYhsocygwQV5NOHlDaOp7o0dbLGyP09quTV63tj7Z4MbFvteMUxUnxHuuA
RdrwYSpoAYq/FzDt+WdGzU6RlQZtJiUyXzaLa8WVALAWMBAQpCJnQt1Q5V33/m3c
53R7phInklEXWetNeaYrnA==
`pragma protect end_protected

`endif // !SVT_VMM_TECHNOLOGY

`endif // GUARD_SVT_MEM_SEQUENCE_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
iO2AO+t36SHMY+V8GbS3cDfVHRKRRPcNm+k3jcnMiyc1gpJ4+Tvhzp87Hm/XDLrl
ayOBCK+aV/yl3p4lItgGszL3doBVuAK0APlXcoW4Exx+oPWvlOTowa7iZkNwGovs
KnU7wrqGK2TRT+FCCJtPNnS31Wnkq9OCLFN/Y7xTWgA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 428       )
2o7p8QzYms2PgHO3qtZgJwmQJhGn5Mgj4qTPKtU2MyFbs9xgSr/+XyVhlZLR8yDD
fKV6xGIFAxFyD58tgkHKqDtxqYl6x4jgHwxMm0rIewa+xg1ErVqMEY8Kt2CVTC26
`pragma protect end_protected
