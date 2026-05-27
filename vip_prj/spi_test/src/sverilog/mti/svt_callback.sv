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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Tv6yb4/K36GB3j99N+oKPfGWM86Pzj0hd0VT2NmvBXO0y6xttvpMp5dC+wK2yMeL
Dt/Bj4fUSVS9YHDvmI7r2HdkPqQTRq1ps4+hO4hyKuHSy68RxnJn0xm0u5JYArBF
QJBvUyMSApf66n9N0GkuJsXvPpqZiNY2Z8H3AkDxyAE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 723       )
FFos5l9B8qx8vVl24O/DgGB5fiJy4lPJItYMI1a6mYZBbjorIShSXFUiSXTN8fyB
RcAsz2CWX+v8y/em3kCm0SeLvE7vTVotdtJ4WGWMNg9WkswHBph6ruanzBSO5s/U
T4q0Sy9dqKxQW66eLsy7XKvr9pf5ur8Renl5A4vAqzGslBgnDEqWQy2e5EUIhIfE
TS6lrvHuP3qgQKv/VHg4DfxSRhx/YubeYmNrmwssnv5rDSamf/9fRQfJC/IrYuVS
puUOaUIYEQGsXwm3dMLdfbdPEohLx0eIMH/PCEh4mCEpS9xvKtes6R168LRXHArT
inFnXTtlz+DEwt4GBlypsfye8+mNF+drlwuYmciTwFzz1mxfdyp9UPbY8V7j5pfQ
8w2krI8vPi/QPWy0qAZVXFh6+JDzFOHiBhBxyWhEh04wmuN0k8cPqpt4abv2h4s1
c8WOkpYwjiQ67cdT/0a6d4qdYGqAItdTk5kwDWziCZN4SImY0vxG8mqKSfIAxbBC
iKTU9xH7n60qJpeIsEehxfXkskfZKPRG09lrSMYtURV2ga2sK433OnjLyb9Avmk0
ghxszc4UvIrawziBulHx37keOseyglaNrMRvNVfybQB6eAlvptaEejCAkCjRyt+w
xtOwwdthsDCgi0+rXIshQmgMAb68uuBYFdCKv5PEfa4zsDs3+H/3W1+oL+XIF0FA
XverVt90wRxKrFQC3Ny0uV+YCYdGpmAch7Ec5HbgJRpP51I8Jik9jtvw27C2FCDT
JwyVnYaGFMd0UtATjszoEU4JO7J41NDvoEeixsQ3ZXzpWHchONbVDj3CbJHgHcRX
QsSwdJaMPuYHrQCfwV415saywWWiTctWv81hVnaqDAwDl3kMVhooNDOq6rPLc0pn
SgAMjcrmsFd+mkg0xBR6dwA6vS/pH8yGf0Xpbc+IJfbwXwINi8HATj9wJMetpd/A
3DIZOTOTuS+YdjNao7ruzw==
`pragma protect end_protected

`endif // GUARD_SVT_CALLBACK_SOURCE_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
nRfddIRvpydWZAazFWvhpfMLkmVhksWKeZH4bplD3bktal3jRkYDAZ6Q1RCToZ7I
S9dXXZYeWoAYA6pD0pI5xLsCd31QEFAmRLJAsqviX9MJU88rLanv0bUHcZAWuohu
vQbe9I/XR/XorTxLKdsT+ZqKnxhRKBcTHSKAuX8MvDk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 806       )
Yimd8knr5JFLtlqFC+k4MmXQuYvRuw4gj/AQ6U0sHI3quGs+G1PPfPCqrtdXuD/u
rmE5DFo84qLotdOVoEEcAzmTRwXsY9kKZDwmhj/pPONoEaWn/TWxJrGsQlfI1H4+
`pragma protect end_protected
