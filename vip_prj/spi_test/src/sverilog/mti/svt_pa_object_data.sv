//=======================================================================
// COPYRIGHT (C) 2014-2016 SYNOPSYS INC.
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

`ifndef GUARD_SVT_PA_OBJECT_DATA_SV
`define GUARD_SVT_PA_OBJECT_DATA_SV

// =============================================================================
/**
 * Utility class to hold the object details for Protocol Analyzer or Verdi.
 */
class svt_pa_object_data;

  //****************************************************************************
  // Data Members
  //****************************************************************************
 
  /**
   * The type of object. 
   */  
  string typ = "";

  /**
   * The unique id for the object.
   */
  string uid = "";

  /** 
   * The parent object unique id, required for highlighting parent/child relationship in PA.
   */
  string parent_uid = "";

  /**
   * The column descriptor value in PA
   */ 
  string channel = "";

  /**
   * Time holds the start time of the object.
   * Only set the start time, when the object 
   * is being written out after the object exact 
   * start time.
   */ 
  realtime  start_time = -1;
 
  /**
   * Time holds the end time of the object.
   * The end time used only to support backward 
   * compatibility. The end time will be set by the writer, 
   * if the end time is set to -1 from clients.
   */ 
  realtime  end_time = -1;

  /** 
   * The status of the object
   */
  string status;

 //-------------------------------------------------------------------------
 /**
  * Constructor to create the utility handle to hold the object information for Protocol Analyzer
  * and Verdi
  * @param typ String indicating the 'type' of object.
  * @param uid String indicating the unique id of object.
  * @param parent_uid String indicating parent object unique id.
  * @param channel String indicating object channel. 
  */
  extern function new(string typ, string uid, string parent_uid, string channel);

endclass
//----------------------------------------------------------------------------
function svt_pa_object_data::new(string typ, string uid, string parent_uid, string channel);
  this.typ = typ;
  this.uid = uid;
  this.parent_uid = parent_uid;
  this.channel = channel;
endfunction

//=============================================================================

`endif // GUARD_SVT_PA_OBJECT_DATA_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
OuBym1LH9JXcUK8LJtCOd3forIMm1i4lb3rT/At/Cxz1j76ir47i6mZRaiwQUWU7
EJiJ8iRN5demmqY8VA8cOzYxDlxfKc+Kpp9/WRoPwHpYTQc55oeJxqL7AcYK6seZ
nw4lok7NUuJyH+el2DSz+phMedS8ep5Y61bsAxgAMJg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 83        )
wVLdA/dLmRRBCo6CPjAQDN2SwbJmGA5Z1eNn7qdnY6MIa8hQOVB4n0g4sJW1IdCf
xlFBIk4Adrfy8+hdZEoL5vMveb/j35gEUDDQM8XhmJ0Gq4/XZs0fo3UgTQDPJgGL
`pragma protect end_protected
