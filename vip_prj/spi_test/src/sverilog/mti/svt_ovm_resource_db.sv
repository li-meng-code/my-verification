//=======================================================================
// COPYRIGHT (C) 2011, 2012, 2013 SYNOPSYS INC.
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

`ifndef GUARD_SVT_OVM_RESOURCE_DB_SV
 `define GUARD_SVT_OVM_RESOURCE_DB_SV

/**
 * Dummy resource DB for OVM
 * */

class svt_ovm_resource_db#(type T = int);

   static function bit read_by_name(string scope,
                                    string name,
                                    output T val);
      return 0;
   endfunction

   static function void set(string scope,
                            string name,
                            T val);
   endfunction
   
endclass

`endif // GUARD_SVT_OVM_RESOURCE_DB_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
AqhdvJaYtiulAf80mRvliMOLPDEYqID6VERq/6g2BI+VhAyuJYMtleGsjj7y/x7u
V66mCeRPoh7AKXSj9agVGx0ZRLP7gEDnITJ58aFulrOBz3sOvR8WJOTnOZu+Wxsg
8ro6iVJLuVVrnB7xwcLMe4I4s943pDQZNyFPGU8ZsGw=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 83        )
RmfQa1hY4ay2ETNKTxk9MGDvBlWB0FzM6yh7o86mKbAVETJ0Erm7d25HESx9aaD+
Mn6z8r0EIjMn14Uxdole/mgPgNuSHpeb8Z8Q31YvgwISTIay1o23/eTKV+t7KskZ
`pragma protect end_protected
