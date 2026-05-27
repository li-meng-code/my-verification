
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
JTW6jul6S6XioB2cp41rUgYiXOXPZGb5a3BAaRkTrrM9jSjxENq95Zu6zbKQnu/W
ikdYPO85Pyj/iHR3iBRrjfW48aQe8hB03tPiGlQS5xTlFeFsvDgGIp0KyuE8iiTu
Y+7MJi9wHRsUclix5Wbxk3Nx0RmBf9BchoE4rC+v8cLA3CoxiCa8FA==
//pragma protect end_key_block
//pragma protect digest_block
ReBgxCo5nE5TD9VLPMT12h3XCFc=
//pragma protect end_digest_block
//pragma protect data_block
vAlKryj7XW5xi/chq6B6Iy8E2/o5z0Vy6jUKGjHHcvK6jVM3ObAERyMrqasBA5jr
Pss1ANjwGrta3VB4jPFckHzPVcpinwZA6sWRNwhuscZPMRaCiCS9mOUwRewHO4/b
XBumcIWxZHzSUZu1TQw+ifWHFhPoGL3hcUlXcGecbk0gJgfGpXCvLW04YHKo2JXo
qfWGwYloyAMULN7AQ6n0+MQJOKr2LDVzm0c4eSgNaEWFZCAfwgoPzSntszL3Djkq
DK05IzDnNkmynhRzNYptsK3oVyBLDJjsmtIl1qaG5bjzSZXp0NgVJbG7JnTbUy+l
kcKoh3zWuOs1mFOMiK8tGHNy44GHmml8J+2K6TrupPvWln/VxJhcVEJNzUt6CLtu
JjCXgL9YG2+r/YqcdIXLJuaP3RaQdtW6ItFTERLxuO4ZCOzj7yylicpFCoN/MD33
oI7IFkwA9McUbdZDLGEQ9r4HYtMHD6H8UZR99EjUBfeCIozHVYSwwv0MBfnrXqBw
3JvONC31fLhAxs8nhbJyElYYXidm5yMGC1VZ+u7se1K28o0Xuo6jFHjbdOTaf1kg
cxe9oNFZjAqpiFD5g2+LPMt8oG1pW66ircf4k7tlnQjAesgTwmBOi0PVEgZiu9p7
qIDkypheLsvkSrf67ip9N6LhUc37o0K3jccs9X08lJvkUQi77ff1gpfsMMQGF8MU
3k+Eqi0vciXUMAJ4poiW9zAxqfJjglUxBdcO85Dnh9JqeeesS4w/WD0a4DXEawue
8+0C3tjTsV+vV48qSA9iJw==
//pragma protect end_data_block
//pragma protect digest_block
jaEOtr8bZDV4Fq7Ub08WD0S5Wmw=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
z6FimzDrnpuoZB7a2xxhV2qKg1jWbrvLaH2/uw7G+i73bYwrp4hEvd6KZRu6KUtt
S+38v5CXi94851H+lbk/kesML2QIgByUjpmE0wvbHZHVraJurXmqBpvw9aQbvWgP
R7qPrw4FTkZExjTu4GVO7xfXXEXnYquSHzUGIk29g49IwDasu6GW8g==
//pragma protect end_key_block
//pragma protect digest_block
pXQRivexRS6exrqa/r+UoNgkqr4=
//pragma protect end_digest_block
//pragma protect data_block
FYt5BoTtsDPKA9EgiK5op1SPRQUyL8HH2+7BDuN6MHHjWQ2RYtODC+ZNGFaUnUfW
pp6M0X15f2srvFkliPNK5eg5a83Fe8c5GJte3DUNnRJVgK604vSorNj0jwYTQlQs
+n8Cecp4UakzS9w7i/WYufP4UOMB6iU3TbBPVn2IMMATbMTLJvBWJUu9Y3fErwqt
k0idTCrLH7tzv28znbBMLVuTVe7M6QdvqKV9oTZSWTfevbOXU1x1GgKhpnGfeViJ
qYf7/7WNYIPF/43FhxESvn0cJ98yeks6QfjHWb1rFl2257Li959oqDGA5sLc3Au/
mNrbsaOO7RGTrVIQc9qeCkvN2Grwe9OMWF19iuonjQBdlLB4aR+xUb9Dij4wN9Vs
wgJN7COkwE5cfey3JykmQR7bKaSPB9TV21waIZoqskSXmQPdTdo3eXa32ALUGHsG
QZD2B8jrrG3QQ602enhlDfoNvu2hShuWKA05kdREuFI0UYiovtZ6aOv4Zp4KVfmu
bYzgvpXaVv+UOA6oPHKsR06RXp7cxpIdRIqebsH0mtMtRiSJG7QYdSw1TnEqjkjR
hsqC2Vx046r5oZ7utLStF50UTRRtyJCv1Cav7GpEjWqoFFCsCgyjKblWbn+VL0BH
eG/6qchXeey+1sJ6Idzm4ZKSvo/pcgXoTGlZR8py1JrWhNNky+6kAn26n9iX1BE6
vY+vVW2rQfyA6M8RzAtzngq1lC6tS/O/ERumWgGh320R7MODnEqh8Kfo9eKwVcyD
fVHa4yQlTvf9BgTQIg3bJA0Pku5I/NuEzer/d7IXw3U9hNRESqqKSH45BcmtwUPi
JZsovS0xuNbjSUsuWVhBOeoMtCYGvhkn3Y4Ts7NhBE8rbQk7dcsWOib8UOCzOb6q
dNRnbde41qd5Bvy8mt7O4QVaPlLmQQkB5Odx0E4AIQQ=
//pragma protect end_data_block
//pragma protect digest_block
xhdRnZTtYM4dQtSEljTtLVaP1Sg=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_DEF_COV_DATA_CALLBACK_SV
