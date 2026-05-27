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

`ifndef GUARD_SVT_CONFIG_DB_SV
`define GUARD_SVT_CONFIG_DB_SV

/**
 * Methodology independent configuration database that can be used to share
 * integer values.
 */
class svt_config_int_db#(type T = int);

   static function void set(`SVT_XVM(component) contxt,
                            string scope = "",
                            string variable,
                            T value);
`ifdef SVT_UVM_TECHNOLOGY
      uvm_config_db#(T)::set(contxt, scope, variable, value);
`elsif SVT_OVM_TECHNOLOGY
      if (contxt == null) contxt = ovm_root::get();
      contxt.set_config_int(scope, variable, value);
`endif
   endfunction


   static function bit get(`SVT_XVM(component) contxt,
                           string scope = "",
                           string variable,
                           inout T value);
`ifdef SVT_UVM_TECHNOLOGY
      return uvm_config_db#(T)::get(contxt, scope, variable, value);
`elsif SVT_OVM_TECHNOLOGY
      int val;
      if (contxt == null) contxt = ovm_root::get();
      if (scope != "") variable = {scope, ".", variable};
      get = contxt.get_config_int(variable, val);
      if (get) value = T'(val);
`endif
   endfunction
endclass


/**
 * Methodology independent configuration database that can be used to share
 * string values.
 */
class svt_config_string_db;

   static function void set(`SVT_XVM(component) contxt,
                            string scope = "",
                            string variable,
                            string value);
`ifdef SVT_UVM_TECHNOLOGY
      uvm_config_db#(string)::set(contxt, scope, variable, value);
`elsif SVT_OVM_TECHNOLOGY
      if (contxt == null) contxt = ovm_root::get();
      contxt.set_config_string(scope, variable, value);
`endif
   endfunction


   static function bit get(`SVT_XVM(component) contxt,
                           string scope = "",
                           string variable,
                           inout string value);
`ifdef SVT_UVM_TECHNOLOGY
      return uvm_config_db#(string)::get(contxt, scope, variable, value);
`elsif SVT_OVM_TECHNOLOGY
      if (contxt == null) contxt = ovm_root::get();
      if (scope != "") variable = {scope, ".", variable};
      return contxt.get_config_string(variable, value);
`endif
   endfunction
endclass


/**
 * Methodology independent configuration database that can be used to share
 * object values.
 */
class svt_config_object_db#(type T = int);

   /** Matches the uvm_config_db 'set' signature, but provides support of OVM as well. */
   static function void set(`SVT_XVM(component) contxt,
                            string scope = "",
                            string variable,
                            T value);
`ifdef SVT_UVM_TECHNOLOGY
      uvm_config_db#(T)::set(contxt, scope, variable, value);
`elsif SVT_OVM_TECHNOLOGY
      if (contxt == null) contxt = ovm_root::get();
      contxt.set_config_object(scope, variable, value, 0);
`endif
   endfunction

   /**
    * Alternative to 'set' which can be used to pass an object directly
    * from parent to child and avoid the competition with other similarly
    * named objects stored in other scopes. Used in concert with the
    * 'get_from_parent' method.
    */
   extern static function void set_for_child(`SVT_XVM(component) contxt,
                                             string scope = "",
                                             string variable,
                                             T value);

   /** Matches the uvm_config_db 'get' signature, but provides support of OVM as well. */
   static function bit get(`SVT_XVM(component) contxt,
                           string scope = "",
                           string variable,
                           inout T value);
`ifdef SVT_OVM_TECHNOLOGY
      ovm_object obj;
`endif
      if (contxt == null) contxt = `SVT_XVM(root)::get();
`ifdef SVT_UVM_TECHNOLOGY
      return uvm_config_db#(T)::get(contxt, scope, variable, value);
`elsif SVT_OVM_TECHNOLOGY
      if (scope != "") variable = {scope, ".", variable};
      if (!contxt.get_config_object(variable, obj, 0)) return 0;
      if (obj == null) return 0;
      if (!$cast(value, obj)) begin
         ovm_object_wrapper wobj = T::get_type();
         // Watch out for objects (e.g., svt_ovm_object_wrapper) that don't support get_type very well...
         if (wobj != null) begin
           contxt.ovm_report_fatal("CFG/OBJ/TYP/BAD",
                                   $sformatf("Object configured for \"%s.%s\" is of type \"%s\" instead of type \"%s\".",
                                             contxt.get_full_name(), variable,
                                             obj.get_type_name(), wobj.get_type_name()));
         end else begin
           // Just go to the object directly to get the type.
           contxt.ovm_report_fatal("CFG/OBJ/TYP/BAD",
                                   $sformatf("Object configured for \"%s.%s\" is of type \"%s\" instead of type \"%s\".",
                                             contxt.get_full_name(), variable,
                                             obj.get_type_name(), $typename(T)));
         end
         return 0;
      end
      return 1;
`endif
   endfunction

   /**
    * Alternative to 'get' which can be used to pass an object directly
    * from parent to child and avoid the competition with other similarly
    * named objects stored in other scopes. Used in concert with the
    * 'set_to_child' method.
    *
    * The 'use_fallback' argument can be used to establish the generic
    * 'get' method as a fallback, in the case where the 'get_from_parent'
    * processing doesn't find the object as expected.
    */
   extern static function bit get_from_parent(`SVT_XVM(component) contxt,
                                              string scope = "",
                                              string variable,
                                              inout T value,
                                              input bit use_fallback = 0);

endclass

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
TYkBvRR3ilIv+yREiEWA6GfR87DcuE9yUlGXT8ayNXKnf8pN+KTtHuCs48Lx1pHs
qH/1EdsnPuecAURRO8ZHvyVEZKWh2t2FEX3CWzJ1Eiixj/+XsOcee7BW0xHhNqPG
hfRXPZE8BJjnZmzpuqIfbRMW+Bjj3N2sa2XH2Qgzx5w=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1551      )
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
uzS1mB5Ta5v9Nqz7wzQUCQ==
`pragma protect end_protected

/**
 * Methodology independent configuration database that can be used to share
 * virtual interface values.
 */
class svt_config_vif_db#(type T = int);

   static function void set(`SVT_XVM(component) contxt,
                            string scope = "",
                            string variable,
                            T value);
`ifdef SVT_UVM_TECHNOLOGY
      uvm_config_db#(T)::set(contxt, scope, variable, value);
`elsif SVT_OVM_TECHNOLOGY
      svt_ovm_object_wrapper#(T) wobj;
      if (contxt == null) contxt = ovm_root::get();
      wobj = new({contxt.get_full_name(), ".", scope, ".", variable});
      wobj.val = value;
      contxt.set_config_object(scope, variable, wobj, 0);
`endif
   endfunction


   static function bit get(`SVT_XVM(component) contxt,
                           string scope = "",
                           string variable,
                           inout T value);
`ifdef SVT_UVM_TECHNOLOGY
      return uvm_config_db#(T)::get(contxt, scope, variable, value);
`elsif SVT_OVM_TECHNOLOGY
      svt_ovm_object_wrapper#(T) wobj;
      value = null;
      if (!svt_config_object_db#(svt_ovm_object_wrapper#(T))::get(contxt,
                                                                  scope,
                                                                  variable,
                                                                  wobj))
         return 0;
      if (wobj == null) return 0;
      if (wobj.val == null) return 0;
      value = wobj.val;
      return 1;
`endif
   endfunction
endclass


`endif // GUARD_SVT_CONFIG_DB_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
f9bykK5b0TaBEmuhSYbgdHXxE0IYMUZNc1DPGGTPKUl9mdRBDOhczZi5/+EqiBXD
gRgHWdJzxXmmW/yr0pdXa2Pa+NiFlHsdwnhxZSuSnPcBh2X4P/ismCqQwdR8A06M
4ZXytfVe/h2PPuY71uTsWZNalq06+PdHFTkOwV6ZxAY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1634      )
wgJwA7fRcyEYGe85RMNDd6w1mjjgcfY3AiGAHHrFN86vR+/Wixxke51mjxsi+TMG
OXbAC7tTjTR5hSyA/TqKb1/gPsYaUuOH0iSe6+Utsi8fQd+J/8EKCL2VBAPXCtCL
`pragma protect end_protected
