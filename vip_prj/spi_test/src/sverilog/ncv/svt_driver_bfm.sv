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

`ifndef GUARD_SVT_DRIVER_BFM_SV
`define GUARD_SVT_DRIVER_BFM_SV

`include "VmtDefines.inc"

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_xactor_bfm_if_util)
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
OwTxIged/zf67/o2Zi1Zed7AgY7EzC8GRbBq+zPPg5zP41GrNlKyiMKsBWGy55yo
ZU7/58N/brX1MYDhl6NrSWeSz5LptG9Dr4hRF3+k4mK6UaTzcZd7jWxHBDj0hhBB
b1ALxsVwcaYyuFn1U1+UMHPzGjyDvvnQDcIe44zUO91PjmvJkFRstw==
//pragma protect end_key_block
//pragma protect digest_block
4cs8A7DQ5PSfE8S8GUip+ePXY/M=
//pragma protect end_digest_block
//pragma protect data_block
vkdZvlVZEKHNUix3UyGJOnjLuHz5gV/gsRYnr2QctnrKG+dSx44iMY6XejXxYAnd
LfLZq64X5+dNQXB/jMpuKacRpuxcVDBmdC1SdO8Hfj3TpH/3iMwu2cQEh7+aItgg
BcL91q9QShnSWS8CFyJU7sxtU4c8i2GpNgDEV5rtyTh+mbgzlYezqssjTCCFJ+5L
bS/S7EcRiKI+Z5TtMnSc1Z3S+za/TKX+m64xigJS+h9Z1+8xeYrC2fg95tMR7uvL
eNAIOwkEW9KhGMG3qy0jztcRCWBATjSx76P2ngqSojqN3d1lT/MwkeQIK1AbxuSJ
/92xmkKjSIwzvsW10hY6AcQZCr3YZo7pxuyxUG4MY1YlMrL7wo/bO833/OK/olUn
Xh+V3P+sCsjOoroVr9kR6TOxYTrD7E3W9Grxb1r/mJpcwWgimhJ6flSGx+6zW0sb
qe/47ev3TyPc7x8ZrWOxXu/r1hqZxxvP4UHpM1rginKBDJr5t/V4Z4tdefuHmSWQ

//pragma protect end_data_block
//pragma protect digest_block
yxbCy4b/8Q+I2xN4Gwl6k/4xkXg=
//pragma protect end_digest_block
//pragma protect end_protected

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT agents.
 */
class svt_driver_bfm#(type REQ=`SVT_XVM(sequence_item),
                      type RSP=REQ) extends `SVT_XVM(driver)#(REQ,RSP);

  // Declare all of the properties and methods for this driver
  `SVT_BFM_UTIL_DECL(svt_driver_bfm)

  // Declare all of the virtual methods which allow access to the base VMT commands
  `SVT_XACTOR_BFM_VMT_CMD_METHODS_DECL

endclass

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
HfKfbleqeC+aDZbW5A5Z7JMnrXaRxTtbIcH2ljDdnzeZ/9sTsgv2+zaKk8GJ+Qt5
enZkBzHk9yP53LTJ3LZUnFejbBTq5b7c1W4u+9tV87xW5mZboSNb/OvopLkKLe2y
FNPImTkAmwJPAER65bK7NtuM36jDf6yEMy18h5bnv9d5Gru+KpEpgg==
//pragma protect end_key_block
//pragma protect digest_block
h+YnnWGEMaVJPOA/lXI0vaotyRs=
//pragma protect end_digest_block
//pragma protect data_block
03MnXzjvI79WL/EM79VrezoH6BSllUvU5c2lwqaIjuW1W82mOSclI0wFTGOILkrL
hNDp79PpMJI7/QgCsP2ZhFMIlTJhtpG4kpYJc9eTnnj3bCmXFd7zMXoVPwdEQ7Wi
w/QCvibI7v5wkV/3LXRpHbu5pqCpKS7A05ySR1mMDqdNXeuvfI6nnFNPb6BkeJuo
y4fk7wzUt4TihFG5hnS7RCBc54r7+0XTy06J9Z3IrXKfBmvCcBpo/kqpB6FDHYir
ITZWKoOfJTw2TLm4Q2q5BI5kyetCvA79KL4t92hTTdWhK/NB73yGzzQIJqAOoqpq
o5cyZNAx+r+ycOXCdGQ3Yngw0WpQNMhMO1gM4mnIQrp5U6QP98iRvtAVy3STrKp+
zrMtCDeRTf0GJWUJjTrolSHscoVL+7tLq5umy8fG7uWOtmVgM6cq2vXfQ4C0O4Zj
xISzCVknwToKqryKaTfvZ6RB2r2hlgb9jP2Pg5DOpe2NGpG8rTM3nvhAd3tru/oD
HPi8AbZmTYgWy2ttudCy0KJmGVPjg7LMvrd1wPp653IspalpTPxIZAfIBsctZQXR
8IZmX5gfbRqeqofpTyrysq4NycrDMiCvEm9N9D91zqJTBtb6cj6HxSQYg1W3B2ua

//pragma protect end_data_block
//pragma protect digest_block
mn+6j1dV0CZG93455Eg830yx9MM=
//pragma protect end_digest_block
//pragma protect end_protected

`SVT_BFM_UTIL_REPORT_CATCHER_PARAM_DECL(svt_driver_bfm)

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
xCbaOjHZ+S1y4urx+G5qg+umLjCjNwu5+UgZD5nrGeCgZpxH7lX6goO7W4ocASRI
6gp/JOGqCYUAyxIsUmOm04jXhGrb1IBpeN1rXlITFIVpOhfktJ9AEBoG7I+gtWTT
p0iKpJMfnDqlQQJGk92PAB7CFDXB5l7G3R01oD8NpLpc2K1RhqgmYQ==
//pragma protect end_key_block
//pragma protect digest_block
ScJjnKW+O5/4D7D6nMR3t6NJfzo=
//pragma protect end_digest_block
//pragma protect data_block
j1dtA7AAj9TibD28vjjnwPCSc2F+lmfmSrxuQwW7GB3vjlPYOYRGFCISp7HrB76J
TY0RFXILCTLr52TthzwAxWfhX1Dk3Rbs8i1fIS7ZLeVdMF0RXEqFWLwO3aixbOL6
4Y6V79/C8Y84RTp3HTabjUtPq+JnKQe/wEqTFd8yRJTBa5YlhhDLMvcMou/fmI/9
wdNyeipLpeepJOcMkspThoW1mMONE1pK0r6Xp42ksUbEyRKU+P1irYxfP1YEop/s
x8PtX3ePloWQgTctrtkdNVXZ4T+2EJrc6vATwXHziYSIKxUkOygzZbt1tDgQ2ZZk
6XqQU1NlhJnb8E0XNl59EaXTSpf6l77txjlurKvRT6EFMmnMpdVglzzOlPPNARmh
Qtb2rA8c4780yloiv53pOw==
//pragma protect end_data_block
//pragma protect digest_block
w3XG3hzlQISA+VnU1DV7BklgNV4=
//pragma protect end_digest_block
//pragma protect end_protected

// For backwards compatibility
`ifdef SVT_UVM_TECHNOLOGY
class svt_uvm_driver_bfm#(type REQ=uvm_sequence_item,
                          type RSP=REQ) extends svt_driver_bfm#(REQ,RSP);
  `uvm_component_utils(svt_uvm_driver_bfm)

  function new(string name = "", uvm_component parent = null, string suite_name = "");
     super.new(name, parent, suite_name);
  endfunction
endclass
`endif

`endif // GUARD_SVT_DRIVER_BFM_SV
