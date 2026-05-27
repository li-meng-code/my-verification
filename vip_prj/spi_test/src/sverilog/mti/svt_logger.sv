//=======================================================================
// COPYRIGHT (C) 2010-2012 SYNOPSYS INC.
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

`ifndef GUARD_SVT_LOGGER_SV
`define GUARD_SVT_LOGGER_SV

`ifndef SVT_MCD_FORMAT_VERSION
`define SVT_MCD_FORMAT_VERSION 3
`endif

/**
 * Used in the command model class body for each callback to make it 
 * available at the command layer.  Implements the inherited OO callback method.
 * The base transactor should have defined a virtual method with the basic
 * prototype "callback_method_name( callback_datatype data )".
 * callback_name is of the form EVENT_CB_...
 */
`define SVTI_CHECKXZ(portObj, portStrValue) \
if `SVT_DATA_UTIL_X_OR_Z(portObj) begin \
  $swrite(portStrValue, "%0b", portObj ); \
end \
else begin \
  $swrite(portStrValue, "%0h", portObj ); \
end

/**
 * Logging support:
 * Used to log input port changes
 */
`define SVT_DEFINE_NSAMPLE 0
`define SVT_DEFINE_PSAMPLE 1
`define SVT_DEFINE_NDRIVE 0
`define SVT_DEFINE_PDRIVE 1

`define SVT_DEFINE_LOG_IN_PORT(port_number,name,width,in_signal_type,in_skew,ifName,clkName) \
begin \
  integer sig_depth = 0; \
  $fwrite(mcd_log_file, "# P %0d I %0d name %0d %0d %0d %s %s\n", \
          port_number, width, in_signal_type, in_skew, sig_depth, ifName, clkName); \
end

`define SVT_DEFINE_LOG_OUT_PORT(port_number,name,width,out_signal_type,out_skew,ifName,clkName) \
begin \
  integer sig_depth = 0; \
  $fwrite(mcd_log_file, "# P %0d O %0d name %0d %0d %0d %s %s\n",  \
          port_number, width, out_signal_type, out_skew, sig_depth, ifName, clkName); \
end

`define SVT_DEFINE_LOG_INOUT_PORT(port_number,name,width,in_signal_type,in_skew,out_signal_type,out_skew,ifName,clkName) \
begin \
  integer sig_depth = 0; \
  integer xTime   = 0; \
  $fwrite(mcd_log_file, "# P %0d X %0d name %0d %0d %0d %0d %0d %0d %s %s\n",  \
          port_number, width, in_signal_type, out_signal_type, in_skew, out_skew, xTime, sig_depth, ifName, clkName); \
end

// =============================================================================
/**
 * Utility class used to provide logging assistance independent of UVM/VMM
 * testbench technology.
 */
class svt_logger;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data
  // ****************************************************************************

  protected string in_port_numbers = "";
  protected string in_port_values = "";
  protected string out_port_numbers = "";
  protected string out_port_values = "";

  // ****************************************************************************
  // Local Data
  // ****************************************************************************

  local bit  logging_on = 1'b0;
  local int  log_file;

  local bit[63:0] last_time64 = -1;     // Saved 64 bit time.
  
  // ****************************************************************************
  // Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_logger class.
   */
  extern function new();

  // ****************************************************************************
  // Logging Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   */
  extern function void open_log(string inst);

  // ---------------------------------------------------------------------------
  /**
   */
  extern function void start_logging(string inst, string name, string suite, bit is_called_from_hdl);

  // ---------------------------------------------------------------------------
  /**
   */
  extern function void log_time();

  // ---------------------------------------------------------------------------
  /**
   * Buffer the changes to an input port, this task will only be called if logging 
   * is on, so there is no need to check if logging is on.
   *
   * @param port_number Port Number
   * @param port_value  What is the new value of the port
   */
  extern function void buffer_in_change ( string port_number, string port_value );

  // ---------------------------------------------------------------------------
  /**
   * Buffer the changes to an output port, this task will only be called if logging 
   * is on, so there is no need to check if logging is on.
   *
   * @param port_number Port Number
   * @param port_value  What is the new value of the port
   */
  extern function void buffer_out_change ( string port_number, string port_value );

  // ---------------------------------------------------------------------------
  /**
   */
  extern function bit get_logging_on();

  // ---------------------------------------------------------------------------
  /**
   */
  extern function int get_log_file();

  // ---------------------------------------------------------------------------
  /**
   * Replace "/" with . if exists
   * Replace ":" with . if exists
   * @return new string, string which is passed in is not modified.
   */
  extern local function string clean_string( string in_str );

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
pXUG8YLB1Mir65bySqdBp4ixXUgPcqX2lfcP20Z1Z5n0dsu8Bua91Hl0+LyM/GDO
hByA5ZXZho0uH9+iny9srRFsFzoTCQtEVKLBJRAVtBisiyucq3i+oVgjxbwJ5omm
J37SxWpu6Daa4/KFoyT8XZ6ikS9mjzIJHr2yvDj7JbU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10058     )
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
`pragma protect end_protected

`endif // GUARD_SVT_LOGGER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
WB02t7+J90ld0zvDUV2z3s/Gm8LYkQ4vZQ7K3r4sA/+o1lh2/f4AWFlCt0yxy5oO
uRgjp7EIG6IyF6ELwtSkOkQmaZCLyBHPWqOT+lV0qbwlJu7FImElgN9te2jsNHlf
Xqr6AKiemVR+XuNnO6qM872VE3rF3/nOEhzyXP8mP9E=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 10141     )
4Jtk01Hwf/4JSnhFwBduZcQiszccgRVW+cH+0RKop9EFTUROgo6N1woaOYtOreJE
f6NjgmDj7bPzsAAJ4XiIAW+btKfgysfHpy/jse5q6cm8ebcTyrZZNeTGLekvR10s
`pragma protect end_protected
