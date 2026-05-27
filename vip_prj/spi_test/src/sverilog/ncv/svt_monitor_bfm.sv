//=======================================================================
// COPYRIGHT (C) 2010-2016 SYNOPSYS INC.
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

`ifndef GUARD_SVT_MONITOR_BFM_SV
`define GUARD_SVT_MONITOR_BFM_SV

`include "VmtDefines.inc"

`include `SVT_SOURCE_MAP_LIB_SRC_SVI(V-2023.12,svt_xactor_bfm_if_util)
`include `SVT_SOURCE_MAP_LIB_SRC_SVI(V-2023.12,svt_bfm_util)

// Kind used for byte_size, byte_pack, byte_unpack, and compare
`define DW_VIP_VMT_LOGICAL  9        

// is_valid return value which indicates "ok" or "valid"
`define DW_VIP_XACT_OK 0

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
3PwKDZ2qLsBKDuFVzQlAjhrsrYgCsmF4u3JcrkoFJAX2FLFDHrEiiO9/43P5CETI
pUFrTWgLi363AHQq8bLFS+bWXcXA74Mf3S7sM8V/3+X9pE8Od5wNIsEgwAY2Srb9
V8fCTSMnQ0NnTSUl97/sNQMlWoi6B00zpVdG4drN2Iwd3HjrQ6Vj5w==
//pragma protect end_key_block
//pragma protect digest_block
bTnOtKQ+O//KAAZ3amMj5DYQ5Fo=
//pragma protect end_digest_block
//pragma protect data_block
BJhhz2F24x1Ub7Yh/ZFN/REO9S9lyRPQ/40oga2Ztt7XlzQn5K+P32jZ7qNlpUGF
KYtzbY/uAis9p3shtCshg52g7oZp65lNTVxfq+eRJxU4twnqGkv372xrYOYZC8qd
jlxINOdwMpd2rfqGQ/LLpD8mqZKStktnqRkkfYNTZdnHVSmVuMMLTX4RzxImzxN3
9tLaUION2WT6mKEtKohmQurYe0VBkNf3yL9juYRcVpLMWm3Wd+yoLhxN/PJFwZrF
lk1gkTAfQOM1EB6CrVScuSdIA4PcvxS5F5YL9ptBh+UMaFQckwXJd8bAfHeGOtcw
bhNSImRA+rEKb/eNbLbgMc4d2UkIb1F/V72BvI8t4lX3TI2PaZUBvEWqanghQiVD
3ua/1wotMEIYv4hvXXH3lcdw6yVT8MCy04Gcpz29y6Kh3ZHzK/jrfFZhusHJFG99
3hPJa9xBi1dpVSs80ZEV/4gbW/FyPWXQILOL3CnKsSeqTCFurfU9N3XbQyDWI92t

//pragma protect end_data_block
//pragma protect digest_block
hZgvddPZ5QQQdqI7VLbHe5IaBuk=
//pragma protect end_digest_block
//pragma protect end_protected

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT agents.
 */
class svt_monitor_bfm extends `SVT_XVM(monitor);

  // Declare all of the properties and methods for this monitor
  `SVT_BFM_UTIL_DECL(svt_monitor_bfm)

  // Declare all of the virtual methods which allow access to the base VMT commands
  `SVT_XACTOR_BFM_VMT_CMD_METHODS_DECL

endclass

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
xrL7KlP+eoT5DjSAINll9OKKQ4uaZ3yp20nAqRbuYNTwByBWgwzU/ncOgbWki6qS
ofxuz2WSXeLO0lF81yyUt9NLXqiPuxPsfqNUwWfn1c0NBvWjVt7M+AbGf4PKBU8M
nimijk7XgZbaXhz848na5vJlIusBTZpBwH34mulYichD0gHRsvPJEQ==
//pragma protect end_key_block
//pragma protect digest_block
z2H6AzCklfrSvr0o2GCrkjbsz98=
//pragma protect end_digest_block
//pragma protect data_block
fPlcmHOIsBiUhxF+Bo6s1HWfNGcJ8UrCoGZUreTcwfy7Kx8TEfBhwSQzbjpcXaIy
GefJKmA8DbwZS4TmK7yRN9H1XR3PWtWlBFRXRCJSMqvSB886o8TJ64l6pM0+DErx
sdiBUytE9yNPHqsL8Y7ddv71+J9PcyUy/Q1uR2SbjXOkpDCF2ZEP8Wu/abiI2hV9
OFGXqG9TqbasIrE5SpVCg8xObOzjn6vHOL/IpuL7MlKY5Ibu1Hm0OMNXydCiFe1H
f0C1K1dgflO5yBEalEM8MeS722gfazkjABQMGTlKj4mqowWS3PeXFOPjJWmJYd0W
LAqd5lXelpVY/IbdNQLqrGUZjKUiazEE6v7QsaxgIugn7IuRAXzaHvsZ56Nrhhct
BrpVdij4TfrDStOuJnvKDcOTORAfSR3XgkB6fUfTK2AoUMogKcOId/oAyj7FGyOg
Gn723GVHIJOrr18gMExHONFAAdmUH8J8ms+3Kt2vkOH4nnIXoP4ROwh+yTyfALmK
fqViLtqe7RT6EyjAs2rU7ytpnUCPhlp+5Q3UjMeLWH9RUiP/pPSXISmDxMwsoMcq
Fsva0cSChNpOhZvcEJN0yc8tfzV+Tt4fSjU5P4VurWGPbXWeGy8bdnGm0v3QUAiq

//pragma protect end_data_block
//pragma protect digest_block
ggT5WsjZJZMpvU5S9Hbl9UZQQiU=
//pragma protect end_digest_block
//pragma protect end_protected

`SVT_BFM_UTIL_REPORT_CATCHER_NO_PARAM_DECL(svt_monitor_bfm)

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
UnWx6dRyjABvx0OMgYVrKLrtW4J4KLvr5WOslqnsNyD1b0roPJAwTLaXB/WnlAZX
Tq4Vm8K7DN1eZyBuqs6o5RLITthEEEIH3GOaweIBbXY+NNg5VmGFxmMfd8p28FBT
7yeSPr7p3CYbjxejbZuaW+MF61UJsqC8aXlmBo2YMQiD2MosI0zkbQ==
//pragma protect end_key_block
//pragma protect digest_block
8z58U/PZrqM1L/xyRbdVI+TLOw0=
//pragma protect end_digest_block
//pragma protect data_block
4/ao723sDMDiqsVJZkUJPr9pdf4axGt/094PkqO4SuRFw6edFXgXUNE+ND00cYqs
8cGrgjQIGteHCwFHBq4hWT6bwl+g4qP9sBAYr7IId01rOgUSEqqyaiQaS29E6rHc
e337nP1jIT0rRVsNvtB9ZQRhumKj6b4iScvt6XUuhfHbOZpnoIOVHLJiGPjfBD8l
7mvhJlkV1ezm/GZjyQscDGKVPV81WGoKaAmzEmhzFE48MKlsnBMVZ8UAWSd+iusF
aHKbXXRl1gp6eNKn2Bw4BrPzcO9hpeAnLC6p2uX1Go7Zl9rtfeYxgLOky+loZaGw
z2loFOOrDA93ropDnkeUAUtdFY8xWgbo665NL26MMd4UYIz/SrsL2h+KanrVVLae
p/cJ0Ug4kILnsJ75TSg61zP+QXD2Y0eH5V6z5MfqJHY=
//pragma protect end_data_block
//pragma protect digest_block
2Bs9iLVOmfzaF3IxSta9toAMcXE=
//pragma protect end_digest_block
//pragma protect end_protected

// For backwards compatibility
`ifdef SVT_UVM_TECHNOLOGY
class svt_uvm_monitor_bfm extends svt_monitor_bfm;
  `uvm_component_utils(svt_uvm_monitor_bfm)

  function new(string name = "", uvm_component parent = null, string suite_name = "");
     super.new(name, parent, suite_name);
  endfunction
endclass
`endif

`endif // GUARD_SVT_MONITOR_BFM_SV
