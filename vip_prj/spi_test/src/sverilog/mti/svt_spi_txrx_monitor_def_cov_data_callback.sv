
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_DEF_COV_DATA_CALLBACK_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_DEF_COV_DATA_CALLBACK_SV
 
// =============================================================================
/**
 * Class containing the default coverage callbacks which respond to the component
 * coverage callbacks, constructs data fields based on what is seen in the callbacks,
 * and then triggers coverage events indicating the data is available to be sampled.
 */
class svt_spi_txrx_monitor_def_cov_data_callback extends svt_spi_txrx_monitor_callback;

  // ****************************************************************************
  // Data
  // ****************************************************************************

  /** svt_spi_transaction value, should be sampled when #xact_sample triggered. */
  protected svt_spi_transaction xact = null;

  /** svt_spi_agent_configuration value, should be sampled when #cfg_sample triggered. */
  protected svt_spi_agent_configuration cfg = null;
  
  // ****************************************************************************
  // Sampling Events
  // ****************************************************************************

  /** Event used to trigger transaction coverage. */  
  event xact_sample;

  /** Event used to trigger configuration coverage. */  
  event cfg_sample;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new svt_spi_txrx_monitor_def_cov_data_callback instance.
   */
  extern function new();
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new svt_spi_txrx_monitor_def_cov_data_callback instance.
   *
   * @param name Instance name.
   */
  extern function new(string name = "svt_spi_txrx_monitor_def_cov_data_callback");
`endif

  //----------------------------------------------------------------------------
  /** Returns this class name as a string. */
  virtual function string `SVT_DATA_GET_OBJECT_TYPENAME();
    return "svt_spi_txrx_monitor_def_cov_data_callback";
  endfunction
  
  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component to allow the testbench to collect functional
   * coverage information from a SPI Transaction that it just received. This is called by
   * the component immediately before placing the SPI Transaction into the output.
   *
   * @param txrx_mon A reference to the component object issuing this callback. User's
   * callback implementation can use this to access the public data and/or methods of
   * the component.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_observed_cov(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
cx4QNAFDWAXk8BHASlrMMhs+wVW8ozsbhcWl8fwI5OrWEyjneOP9c1UFvnQigmEj
sQTwnJPOygB9QRC9/IOTkoBj4W5QtFjMkEr+f8xKdf27FnucWzTUk8/oES8hQIvl
/01/xMzONWxLqRU52jFHAklnohAzY5EcG5GPViOPZus=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 426       )
d9lG3nlYo3fLqaYEYb2HFYPzsMRSIKQtePno0qfyGQVachkltcbObg2/cFqqwSZH
mM3gaw7v793aiXe85Y1zgeDbDifMtgV6W0bcnSDuGWn/MgOrTLRCJE0tOCQHyF2x
rs77XXX1Qgd3OxvDKFU7SGF23zJPBqQ/dYJU7iCwx4PdwGLymmB68F4q8YXyKldS
h7kLWxDGNqX9EQZlIDyLeb5hkWn+UMp5+masA1nObKdYwxpjlPhKCEhO9Pgl3ihj
JD4tqE4OEKPoTUrO6RCdoftCbS8Dq1HX3/DN0G13AVVC45AuO3Vwvf9kM5tNDsNV
bdWDstGIgvuIKUpqMIH5jb4CULr74PqYrQswPfYRYq4eRY6mbCWEYLO1v7IJeocq
SHCQ08xZ5V+QgzRTdGB9QDIWdEDV7RaHsRDzju5EQ9UqxKCEoqN/LIWXyBxRpwO9
4dezKP+qaTMqpOFYRJtXg9XgDLY5d+CbJOyVEdi3nk5937adyERRZbghQipUQ4Ae
f2meDdO7SMGFp2/aDkvHEzxfDzIxHaP0/VG9VIkXPOa62i8WcOWBEBzO716nWR5Q
`pragma protect end_protected

//vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
bHnZDZ6KcinhEP5DHSaIotywXXu1+pvANtm5C7XHlIOEWyRA6VLEpDtUGzRiAImj
7bKOQNNgl6j2pHwbE3uq87JT4rmH9GGKLSgGwI7sKgkCGAoCW0Y1QTKdA2xwFNLp
vEi/FU+INyZ+qgM4YQqpDm/vJ+gWTuRusR6w+5uYfA8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 956       )
sMwNHJlXC+ck1IzfJ8lLp7g64sugwP9cH27oEb1Gm5UOUEatmA7Lv1HEtipS6Nih
e+QvV1Ts3yTfOWrsBbd8A9MWsqqe3mS4RfVm+YONfjWueGzA/RZDnxNFWUWiJ0/7
Lh0nGdkZQf8iAHYqtUwPQG5pIKKeyefWeqEm4TSqX8bbAQlMgzKb5a2YclhImYrb
JJIaN0+fS42gY0QBiPUt6wpQiUW0WvedNBv1CYZUeO/sNYw/B/BeblP1mt4DGaKi
KFdpdfZsG6XGYMWKJSQIPP0YrtpZxqs8cmyKBLjZ09l+ddJWvrva65FZdR9hS4UA
URHJNv23qvZVqPXxMluqifd+3eADTPEGMOGBgHX478eILJdsDp1oRI7hQB9PJwZV
7s0cQQ+TMlWT1uGd0a4EoQ/g0zXG9gHqnHyBwy0vWUMpkzOxQaOvH772/bEnPrEi
K73Vy9eLg+Uxui0PBM/5/ndb+qSBRrp9uF9Os3p4ZOeNjaOv5RuUuEIAaJjcPyWj
4LFdEPNA4qZ4WNhVMbx8NuegZrG+TIznekJXSRUfob2Ih1yhTHMUiIlsaNLKigpN
cUfJEB40TRV3kJPbNnc1UbY7VdEUqtA++HJqWlzVEoyd1XtpidGrB5YTW3SdT/JF
+HrntmGIdNE5hDN1bnGBP6zhU9kd1aZ0rD1fW8zB+8CcHl3dStXW2GNw+rIvtdIj
OhhVybfcM2DD3FO6MnoaIw==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_DEF_COV_DATA_CALLBACK_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
FM2Z2zDyFV+QS4o8UhkHzK5YkdWtPrYLrsyXG5amK8BhwHifj2q0w0TyS/p8zL/e
iY/KyEDO/wLcRLf/7Yy9rAVESFOq20FGKFptJfZlF441/Mn4Y6KBWzSfrJ5/FBaR
xHVBghT9aLChs66rmCdOwInk+QMprU3qT02QykUEkkg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1039      )
t5Svl8svVbp/vt7Ca+2Z6T6wU9ecLAxZZsinRFRl0QhaOE3baIkT6aqY6mfyrZey
pxsFCrp7GCQi8ZT6wYtr+jopSAfAuFqx2cSVGxS5j8ZPt1090yT3nMiyZL3dbAW1
`pragma protect end_protected
