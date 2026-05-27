
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_CALLBACK_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_CALLBACK_SV

typedef class svt_spi_txrx_monitor;

// =============================================================================
/**
 * SPI TxRx Monitor callback class defines the component callback methods.
 */
`ifdef SVT_VMM_TECHNOLOGY
class svt_spi_txrx_monitor_callback extends svt_xactor_callbacks;
`else
class svt_spi_txrx_monitor_callback extends svt_callback;
`endif

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /** CONSTRUCTOR: Create a new callback instance */
`ifdef SVT_VMM_TECHNOLOGY
  extern function new();
`else
  extern function new(string name = "svt_spi_txrx_monitor_callback");
`endif

  //----------------------------------------------------------------------------
  /** Returns this class name as a string. */
  virtual function string `SVT_DATA_GET_OBJECT_TYPENAME();
    return "svt_spi_txrx_monitor_callback";
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's callback implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  virtual function void pre_transaction_observed_put(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact, ref bit drop);
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
  virtual function void transaction_observed_cov(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  endfunction
  
  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been started at Tx Port.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void transaction_started_tx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  endfunction
  
  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been started at Rx Port.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void transaction_started_rx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  endfunction
  
  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been ended at Tx Port.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void transaction_ended_tx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  endfunction
    
  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been ended at Rx Port.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void transaction_ended_rx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a Beat has been Ended(Sampled/Transmitted) at SPI Interface.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void beat_ended(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when Flash Command has been Detected(Sampled) at SPI Interface.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  virtual function void flash_command_decoded(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  endfunction

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Kww8gMgxcRwLFZ22c1KkLy3E+y4OUBEDiivQu3Ti5lB3KHWz01399fScYadDQPaI
yqdSLeKGvYtya/7pcoNzjdLvUcyJd8uN8UFVfjmz2iAV93+eavxON8pFsKDtAx/e
AIO0nYOC869s0Bt94T2cLKoskEpUXvcQ7mlYJtaSoEY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 562       )
9aL9GnTiUB7/2sPjUpuLItEicJG1P+zoGiFwffx2wXob5ubn9tkYWs3jBEkNvOwd
KKS8vuqPCoL894SVHZ8ElplWAIR8Lmox/m8wkjlAzTIaUcR8ZJOl02OjOzzC+NTz
zVZYgQRPyO6hFKRJ2tz63mLwJ/udcMUfD52VgDynG69M4Ioz8IgPnDPKHYQUeLkc
lfmO9gTXkGKRQ7UYVXpt4p9zqaXzhFi7G7sz7YDh1oFBlXR/mlO0Yn5UsUHMyZtH
lCaGXkmBfb1O7OjkQjJ7zkrUh0f7/uWZlh23wavRcqkA0QSl0GZVoRnj9OoS0Qi8
392ZC014GitIzUffcYRN75umiyV7VsWR+AB5M8dAotPervj4LXsb4SUxOncqbRnz
hCCL9UvjvwTY+PDHtKfRbnhNYnAjfVffX2wnGoXJ+n0qyIqzpo92oqo53VK0kVBH
ejs3fcipGWcRMdwgpt8kdqBYzsHep5c4/iKB9P9UQA6zqxHcM5K1zScb68yh91N1
tlP9ZJuBngGYJdxex1MA1AhX29wpXIYlpfcse7uOqCWLJuIye+U1H4pTeBFsiGDy
v+6VVl01FuJXd4og4DBWeplzL0o0c4CVJpn+d15H3+QzbkC/c3ZVg4bTtZUwBO6i
KkYuiiTkPmJCXbN5r6Di+PGOQPmot4OQixTtGBr0xWmRbzN/k4Tm9FmSLoob6Zqp
FKP4LLqA7OdCUjxwrVpAmPZz8VxEn1LoovDvpZ2ZWkR/Nuq1+kPAEOejfU4rmULG
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_CALLBACK_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hr8Jrllj6Fsnjadb+NYu/yNDaVQkLlXTsY2ba9beRU6NvMzIiTZvhUWTz5KUP4jW
VOSbOEk2/aT3HhcwDVGHhd89p51qQJ/ym35kkal4KQLkSQOZXZI5Hxfha1lig9IP
+9bm+UH/r1epJch0zkqTiFkl8H6XmQBcByksZCGr3Kg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 645       )
6EUxuvWphKauruzgaQpF0ICNHMsmSZg0z1bzeQYe3xn4Zj+s10V7IJbi2qORIaEn
oXezSPXii/cS4IWLMqsjUr8B1/RdqaIXjWE8Ps+VBAbuDbV16476res0lNg88sM2
`pragma protect end_protected
