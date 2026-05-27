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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
uAc3t846ct87a80QC19AhmUF65Eo6zRMWPzdwhKDAoORm5Hs6S1C8KXkSQpJkBH8
c4rqZZmIMn448H4eogzrZpRk9Uq1X9FRo+b7+P+qLJBRGsZj66KNInWwPuSFOCD7
vYyZprWFF14qDXRXsgcykyb+7kAzWnHfWR48SqDZhYtOcXjxOT/QRQ==
//pragma protect end_key_block
//pragma protect digest_block
Y0Paa37l4SYliAPZVGkI39tejsU=
//pragma protect end_digest_block
//pragma protect data_block
3E8sNvJSEEd7ilvoAYwhR8YR46ANCFXPNiWUzS31/bufRhwAdyVeYn+mifdT2uzb
6oYBxWRy5hOxXXwsHfg2+I8wJipq+uzKG0Ntingasxc9jme72i+Nc9oNjozSMQ95
MAGyLxnJQIBpP3PkwVXet8BTSDEyrjtZckoGMIh1dWengMeEWszeqZ5LBV1CJGUR
+Tt+4hgw1nH5EONbZwXlbb2tczQ0jH1BHQ9ZPCKMEmMD5Pl62dh4QXY4sUU2EniM
ugCQTZR2fWvF4vczSbOLpoNih6PR86HAnDdsvOHWMhxnFoNmJh/i3BdNoLUVBKqg
nYGjFy7A7ojzeDMMEU9LTBaGeMxzkMLbHNOP6qlNhb8OkFyUCzzE+RsLFLQakAgv
BvsqwobKUine3gOBUB9sfq49XyjU6LBMUuF/o+WSMdsOrE6O9g7vBTvKgFfNPtWi
8bIlvsJTeMxbj/0D3ungAl0BSn1dUbd5gkqqyOuj0iliqkCgi8z2ViNo39//Fkam
P3FC7dBUbZ4/E2FOOUUZPnN0qOPRBUTDW0nJ7wapY3c0w97TfGb9BMPXb49dqPgn
dkVfDffV0uOZpvq0kALNogGMRSkS+BFAJrEWnzumaO3l4dC89X5jpjlk5+Xuq3jA
D7N7s33m3uvXMApnlg06L4hTI8fO89vUrDdrpKmmhDw=
//pragma protect end_data_block
//pragma protect digest_block
RGMpD8y1F312iVY14oc94idGNQ0=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // !SVT_VMM_TECHNOLOGY

`endif // GUARD_SVT_MEM_SEQUENCE_SV
