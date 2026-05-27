//=======================================================================
// COPYRIGHT (C) 2011-2015 SYNOPSYS INC.
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

`ifndef GUARD_SVT_ENV_BFM_SV
`define GUARD_SVT_ENV_BFM_SV

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT ENV components.
 */
class svt_env_bfm extends `SVT_XVM(env);

  /** SVT message macros route messages through this reference */
  `SVT_XVM(report_object) reporter = this;

  /** Flag to track when the model is running */
  local bit is_running = 0;

  /** Flag to detect when the model is configured */
  local bit is_configured = 0;

/** @cond PRIVATE */
  // ****************************************************************************
  // Private Data Properties
  // ****************************************************************************

  /** Identifies the product suite with which a derivative class is associated. */
  local string  suite_name;

  /** Identifies the product suite with which a derivative class is associated, including licensing. */
  local string  suite_spec;

  /** Special data instance used solely for licensing. */
  local svt_license_data license = null;

/** @endcond */

  // ****************************************************************************
  // Field Macros
  // ****************************************************************************
`ifdef SVT_UVM_TECHNOLOGY
  `uvm_component_utils(svt_env_bfm)
`else
  `ovm_component_utils(svt_env_bfm)
`endif

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new component instance, passing the appropriate argument
   * values to the component parent class.
   * 
   * @param name Name assigned to this agent.
   * 
   * @param parent Component which contains this agent
   *
   * @param suite_name Identifies the product suite to which the agent object belongs.
   */
  extern function new(string name = "", `SVT_XVM(component) parent = null, string suite_name = "");

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
9BmAcesZOZWT7qjiv53zzUvyW/GsH3rFFOLjv9Eb9LGjxe93jPylsYqKakguUrls
iaC4RAqY9drIfoJe0zgqjB/zsRX1tatqevNJrPDKMDKG7cjojK+4peMXRnNyRI9p
eHJqqvdoDJqEg1i0EvYq6yCbby8Q0GZOQ+z4w/Zo5OOjvOarUGq05A==
//pragma protect end_key_block
//pragma protect digest_block
Kg+cEuC9rKYjff2FRKE60boe1ZE=
//pragma protect end_digest_block
//pragma protect data_block
fJc50m9qfhThvIJZfpBlIFM04XFz78LMTYtBTG2t3AeGy6wLxnAFcw2b1kT+UyBL
Or5r+FfU+hwHwbacvaSATjLJkflEFDmKj0b9LIdkmVjyQPlWeUFnp1Vrey7M3mzv
NqHl8QfRaX4nzOUUVlanPB+e6WIylu1+ku5Zu0pH+el/iPxY5pcsPcecSDKeFhx4
ZEDKI38mQ2MDM3ZIelN5dZ59pBc6NlmKbWpnw5lxPvsoW0msA9IEKX1KavBzAvPw
Qsvk//7QJ3DevRKnHob2GKTgesEUuy9AXH056m13gqBoXumI5YX68U8QLoG2n89n
5uxB5it6lvmJ87o+sIsUNzY6F1HnUcv9dcLlg0Ad8HTniUluhQ6p41KtU02MHwfD
/9xnTyYEPkT2ZlVz1DtQ1dCDK4tL7al5T6ytyJAdRLXUYbidOPvIwWuuPIGMTHJQ
ur0sbzuoKYxjsSF/MK6wx65A1ZC6quoIZ5cElD2X+SqfLpDetjFoAQzIqa1Vsbiz
I2osjXya2+9DySnsZLOLOy/oz4h0gNyfytG6e9Cd/INuvFBP8pSFCR92ruEK5XnH
orPoDrIT/ud1NatSzoYktn0jZx58ifB6qBr/3kLgtyIcbvqf+ClcaPjPI1HwP5ND
dSHuLUpe73qViOV3d8FkwcgZAbwEuwNaP14MLYELur5glP2HoROaKfIH8MrNNqX9

//pragma protect end_data_block
//pragma protect digest_block
reZW1GEURZPFlzhvtuOmOe/C6mk=
//pragma protect end_digest_block
//pragma protect end_protected

  /* --------------------------------------------------------------------------- */
  /** Returns the model suite name associated with an object. */
  extern virtual function string get_suite_name();

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
sbCL5S6VOKyyJKQ6XnLJSs3FhXc3UWaAvinXJLp5A7i4Gaa4by6DBGUB5i2VurzN
YkI3Y6Ed+yaZ296osXCM/+dJLeIdh8wQdvYV+7u7a7z+yCdqmDiK/4zTDcPJNw/b
RgtP1pflP+mNRF5eAGQIeHr3BoyMOfUDPjvTKW9/+Kf4WdO9luoVsQ==
//pragma protect end_key_block
//pragma protect digest_block
YQ4on8sZBTgYvclj1aepKG6pu30=
//pragma protect end_digest_block
//pragma protect data_block
YolH3TomeGOBFjnNwxPvnCbGkJhVw0quRT9QH/bRempRcFmDhio55cmOmzq9Yqcd
WCOhauccUD+0gNhvCJqijwZL7KIzQWfvOhPN5BFgt16OSG92xj1u0ZON1CT4idQw
0D5lQfOuTcfPonlTIjDSonCYYZPRFqIv/GPqEd4GvtLEZYJD4YtaeQdGfoF7GLT9
5SAdhqPg1sqIB8cOKQdiY/ID61Cod1pVT8iokOFo5luGy92sID3ae7jHqB19pS5o
i1hcZ/u/G7zxh9dEao0j6OqpSmodRaceTyvtGEdr5HsL1IroC/Uk6mg4fCt94GqM
kISIGYL5qRnmzUYfGcRuo4SewdXerDJRYBNVZ0nESXp9ld9eY3G5Qrct+t3K3NTO
24vCThTPyUctlxUX/ihv9OHhZJ5EDzbasKiH+aDcILWXfoTxHFSunQXVcVHzPXmL
XTX98Xbjr7LbsTIluk8N/RQzzbuT9mpyLB/yzu2ePIhTBvZXY/Z52gpcfVaZAZ1R
OSWEDww3fy8O9pBtO5fPRbt0TpOvvfdICWjf7wvgPEF1qlDrlScthk5qj7SroC89
vYIQ6JNlu0FJC0EO9G1Q1CFd3wShE5Pme1lf3smWYm2cCvnPzf+fup6jurzOHM7j
0Fc5sFE/4DSOwLxoRJKKFw==
//pragma protect end_data_block
//pragma protect digest_block
oikUtRPGDg8DkGcp9j+KcjxXGS4=
//pragma protect end_digest_block
//pragma protect end_protected
  
  /* --------------------------------------------------------------------------- */
`ifdef SVT_UVM_TECHNOLOGY
  /** UVM run phase */
  extern virtual task run_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  /** OVM run phase */
  extern virtual task run();
`endif

  // ---------------------------------------------------------------------------
  /** Displays the license features that were used to authorize this suite */
  extern function void display_checked_out_features();

  /* --------------------------------------------------------------------------- */
  /**
   * Returns the current setting of #is_running, indicating whether the component is
   * running.
   *
   * @return 1 indicates that the component is running, 0 indicates it is not.
   */
  extern virtual function bit get_is_running();

  // ****************************************************************************
  // User Interface for Configuration Management
  // ****************************************************************************

  /**
   * Updates the components configuration with data from the supplied object.
   * This method always results in a call to change_dynamic_cfg(). If the component
   * has not been started calling this method also results in a call to
   * change_static_cfg().
   *
   * @param cfg Configuration to be applied
   */
  extern virtual task set_cfg(svt_configuration cfg);

  /**
   * Returns a copy of the component's configuration object, including the
   * current configuration settings. If cfg is null, creates configuration object
   * of appropriate type.
   *
   * @param cfg Configuration returned
   */
  extern virtual task get_cfg(ref svt_configuration cfg);


  // ****************************************************************************
  // Utility methods which must be implemented by extended classes
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the argument
   * into the configuration object stored in the component. Used internally
   * by set_cfg; not to be called directly.
   *
   * @param cfg Configuration to be applied
   */
  extern virtual protected task change_static_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the argument
   * into the configuration object stored in the component. Used internally
   * by reconfigure; not to be called directly.
   *
   * @param cfg Configuration to be applied
   */
  extern virtual protected task change_dynamic_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**\
   * Copies (deep) the <i>static</i> configuration properties from the configuration
   * object stored in the component into the argument. If cfg is null, creates
   * config object of appropriate type. Used internally by get_cfg; not to be called
   * directly.
   *
   * @param cfg Configuration returned
   */
  extern virtual protected task get_static_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the configuration
   * object stored in the component into the argument. If cfg is null, creates
   * config object of appropriate type. Used internally by get_cfg; not to be called
   * directly.
   *
   * @param cfg Configuration returned
   */
  extern virtual protected task get_dynamic_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Expected to return a 1 if the supplied configuration object is of the correct
   * type for the component. Extended classes implementing specific components
   * will provide an extended version of this method and call it directly.
   * 
   * @param cfg Configuration class to test
   */
  extern virtual protected function bit is_valid_cfg_type(svt_configuration cfg);

endclass

// For backwards compatibility
`ifdef SVT_UVM_TECHNOLOGY
class svt_uvm_env_bfm extends svt_env_bfm;
  `uvm_component_utils(svt_uvm_env_bfm)

  function new(string name = "", uvm_component parent = null, string suite_name = "");
    super.new(name, parent, suite_name);
  endfunction
endclass
`endif

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
l2Yjn6TpY4lNsT9+eQzzkXKaIXotpkvR0rzMvmlJMUpteJ/DUOdiB7xYTvvndyRv
8Yzb+yc7YKa5GqLt6crCiQx1rTky45INQxUEgBR9GS4eRXJqwO4B4WQMy7VkMW5D
AwYGdva/rW3ok3PfN9mknr3aY70JzTYp7aOovIGtaHGmS6q0urLyng==
//pragma protect end_key_block
//pragma protect digest_block
4oYxOYgLhql9RxRCZZX4u6z39wE=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
MSci3wQ+h22lAap2iLv6ne9lxDs=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_ENV_BFM_SV
