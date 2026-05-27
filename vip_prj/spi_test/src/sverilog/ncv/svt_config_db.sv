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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
gHYFoLqaltmyKYmoac8dV9yzxXKjN65T5MbGxVpcgY5aqdAA2D2VNN5n/0TQMylH
6YILIgJNRL2Sm//TF5ydNVWm2xoFflxzxISVB6boxpZTduLK1DVJ1Cq3ecx4mJ/g
eUfKDOyjV5YNQS29605M0mZ3Xs9FFYc4jcD//Lw54Qe76zdFcAbDHw==
//pragma protect end_key_block
//pragma protect digest_block
KA15s6JlFHWIrgVNL/KJi8l8CsM=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
f7Is4ZqABVFyeRJ1FALe3E1+3eI=
//pragma protect end_digest_block
//pragma protect end_protected

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
