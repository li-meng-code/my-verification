//=======================================================================
// COPYRIGHT (C) 2011-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_CALLBACK_SOURCE_SV
`define GUARD_SVT_CALLBACK_SOURCE_SV

`ifndef SVT_VMM_TECHNOLOGY
class svt_callback extends `SVT_XVM(callback);

  // ****************************************************************************
  // Private Data Properties
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new callback instance, passing the appropriate argument
   * values to the `SVT_XVM(callback) parent class.
   *
   * @param name Instance name
   */
  extern function new(string suite_name="", string name = "svt_callback");

  //----------------------------------------------------------------------------
  /** Returns this class name as a string. */
  virtual function string get_type_name();
    return "svt_callback";
  endfunction  

  //----------------------------------------------------------------------------
  /**
   * Callback issued by component to allow callbacks to initiate activities.
   * This callback is issued during the start_of_simulation phase.
   *
   * @param component A reference to the component object issuing this callback.
   */
  extern virtual function void startup(`SVT_XVM(component) component);

  //----------------------------------------------------------------------------
  /**
   * Callback issued by component to allow callbacks to finalize activities.
   * This callback is issued during the extract phase.
   *
   * @param component A reference to the component object issuing this callback.
   */
  extern virtual function void extract(`SVT_XVM(component) component);

endclass
`endif

`ifdef SVT_UVM_TECHNOLOGY
typedef svt_callback svt_uvm_callback;
`elsif SVT_OVM_TECHNOLOGY
typedef svt_callback svt_ovm_callback;
`endif

typedef enum {SVT_APPEND, SVT_PREPEND} svt_apprepend;

`ifdef SVT_UVM_TECHNOLOGY
class svt_callbacks#(type T=int, CB=int) extends uvm_callbacks#(T,CB);
endclass
`else
class svt_callbacks#(type T=int, CB=int);

`ifdef SVT_VMM_TECHNOLOGY
  static vmm_log log;
`endif

  static function void add(T obj, CB cb, svt_apprepend ordering=SVT_APPEND);
     
     if (obj == null) begin
`ifdef SVT_OVM_TECHNOLOGY
       `ovm_error("CB/ADD/NULL",
                  "Despite documentation to the contrary, you cannot add a type-wide callback in OVM")
`else
       if (log == null) log = new("svt_callbacks", "global");
       `svt_error("CB/ADD/NULL",
                  "You cannot add a type-wide callback in VMM");
`endif
        return;
     end

`ifdef SVT_OVM_TECHNOLOGY
    begin
      ovm_callbacks#(T,CB) cbs;
      cbs = ovm_callbacks#(T,CB)::`SVT_GET_GLOBAL_CBS();
`ifdef SVT_OVM_2_1_1_3
      cbs.`SVT_ADD_CB(obj, cb, (ordering == SVT_APPEND) ? OVM_APPEND : OVM_PREPEND);
`else
      cbs.`SVT_ADD_CB(obj, cb, ordering == SVT_APPEND);
`endif
    end
`else
    if (ordering == SVT_APPEND) obj.append_callback(cb);
    else obj.prepend_callback(cb);
`endif
  endfunction

  static function void delete(T obj, CB cb);
     
     if (obj == null) begin
`ifdef SVT_OVM_TECHNOLOGY
       `ovm_error("CB/ADD/NULL",
                  "Despite documentation to the contrary, you cannot delete a type-wide callback in OVM")
`else
       if (log == null) log = new("svt_callbacks", "global");
       `svt_error("CB/ADD/NULL",
                  "You cannot delete a type-wide callback in VMM");
`endif
        return;
     end

`ifdef SVT_OVM_TECHNOLOGY
    begin
      ovm_callbacks#(T,CB) cbs;
      cbs = ovm_callbacks#(T,CB)::`SVT_GET_GLOBAL_CBS();
      cbs.`SVT_DELETE_CB(obj, cb);
    end
`else
    obj.unregister_callback(cb);
`endif
  endfunction
endclass
`endif

   
// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
1m4SNqCUnLO8ZS2oL6mohtGJvgLqRWCtPOjOijYCcpanmzg1HFW8brMK1M47RvVI
RduKKgeHET62kKYBO3mpw5Vc9vmSSiLeGK5Cpu4blvyQrGD7Q5XkgsBt1Udmmmlz
vyey897RFSqPwVm1w4k3uOL+0KY9YUK8e602IO0QK09/e0MwjQ+BbQ==
//pragma protect end_key_block
//pragma protect digest_block
JOn8A21WxPZCxpqz+WkFw7eZxJk=
//pragma protect end_digest_block
//pragma protect data_block
qhOX11CeKekBXhgVJBHW+aWQsuigSZIKxy698GYVp69xrVths3swIJWF9/sUH17U
FXqT1VjZfc3/ytqQ2OcDweJoMkZLfA01YtUV0GjlCfnP5Qh4TLa/vrx6RVz3NAvG
ZuEowPCcoPiYEZhkoOFDZXN8oqO2jgKtcgGOv2BytnqrAsmE2Dxdoxw64ydudOSQ
EtItHkAGkf94X0sA7I9H+5RlG+VUQxxgbea+jv9pLRJCleXYOPr1flv/3h3qc42W
8SjFKkk5sHY3m1p4MCF4bUKCAolQpeqIJPD924tPNwq2ZKfpS4dmJkB+hck8tbEX
tNeIHgZMoeyvRERtQ3hspUGhritXNWZJUTUOiRgtCeLl+Q+VZ4Li5V0c46vbWdt4
9IGxOoX3PBR50AX7BFxpFWDrUuEyMlwkCxaPM9GkDVVea3HOIzvODBTaJtAK9m3Y
fzeeSxJac+G5dtJjMgVal3BDhtM0JgPElPb0dUbErI2eIBa67XGvjf74o5OGo0W1
Qx1NIxeMS2Y3ufaN0ql0cOmvnVhP3Fgsm24F++o/LiyduRQ7s53bGNE+HDU2nrxM
ebeVzeeBDQRLZzfJ9cNh/MzuuvxD5PfeomSgTQgi/3QuFuOdlYbsFwttAqVPqRbu
MRoLgUaiIfLzD8/U7/3mmbXQOp1aFTlmMljGdKX/nWZPkYOkfgz0SsoLIKG9yGQD
Nz2bN+yzmXPziN2djTblm5rXCFAjIKotQBYuG8mKbCWGGmwk1d9x0blYQtVRMUQM
Gx8ACAN1YVgWsiilWZ6vw9xZsqAQmY5hLYdT3S6RSKfsTgu7oFGv4Qsjt5CwwMoy
INY0QWJfSxwibbcqlRggiwPrGHvHK2VqWlMOX7/QTbEoMyndsc2QZyUzul68biSk
ZimAzdVzHnHvOWUwyT1NImkC1VLI5kJX1t+unhQSW+TEx7sUGGzImgyGZ2N21MEw
3zaF0anYSef+9Ul/heyyOWfxvsiCdjtWkBvy9VOritm2pywJlfn505uXH7cv8406
BW/oY5hYIKaOzDYqgXeSOvT9ArGfVLudDaDXEtgvUxowltpZ2lXzLfnZS/Pqsbd5
MahHZXeciVPTMbbIUc04PQ43SAPtcIq/QlnzzDLH7zndVZiDzcW8t9/nmmvbeDGB
YdWuTJx4MfYsTmOec0hb58fEjw9/bV+vmJOKYVIJIiw=
//pragma protect end_data_block
//pragma protect digest_block
HSsPFlzSf54R6eLVU7VMMDwEKRk=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_CALLBACK_SOURCE_SV
