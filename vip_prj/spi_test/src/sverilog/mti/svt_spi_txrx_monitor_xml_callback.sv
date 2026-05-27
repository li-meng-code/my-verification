
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_XML_CALLBACK_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_XML_CALLBACK_SV

// =============================================================================
/**
 * Monitor callback class containing implementation to generate XML
 * output for svt_spi_txrx_monitor.
 */
class svt_spi_txrx_monitor_xml_callback extends svt_spi_txrx_monitor_callback;

  // ****************************************************************************
  // Data
  // ****************************************************************************

  /** Writer used to generate XML output for svt_spi_txrx_monitor. */
  protected svt_xml_writer xml_writer = null;
  protected real xact_start_time =0;
  protected real xact_end_time =0;
  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /** CONSTRUCTOR: Create a new callback instance */
`ifdef SVT_VMM_TECHNOLOGY
  extern function new(svt_xml_writer xml_writer);
`else
  extern function new(svt_xml_writer xml_writer, string name = "svt_spi_txrx_monitor_xml_callback");
`endif

  //----------------------------------------------------------------------------
  /** Returns this class name as a string. */
  virtual function string `SVT_DATA_GET_OBJECT_TYPENAME();
    return "svt_spi_txrx_monitor_xml_callback";
  endfunction

  // -----------------------------------------------------------------------------
  /**
   * Called when a transaction starts at Tx Port.
   *
   * @param txrx_mon A reference to the svt_spi_txrx_monitor component that is
   * issuing this callback.
   * @param xact A reference to the transaction descriptor object of interest
   */
  extern virtual function void transaction_started_tx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);
  
  // -----------------------------------------------------------------------------
  /**
   * Called when a transaction starts at Rx Port.
   *
   * @param txrx_mon A reference to the svt_spi_txrx_monitor component that is
   * issuing this callback.
   * @param xact A reference to the transaction descriptor object of interest
   */

  extern virtual function void transaction_started_rx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been ended at Tx Port.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_ended_tx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Callback issued by the component when a SPI Transaction has just been ended at Rx Port.
   *
   * @param txrx_mon A reference to the component object issuing this callback.
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_ended_rx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
TzidNeBe5QTSQ1V8wcWa38ZNTkk9YdPdkGmEURFxK7v1KA2Sdy2NEz1kbCltlE3H
5qZOD8sg+skF+RSFT6PSbmeLKOtsGGB3FCtNv9s4OMgLrvVC1f+AU8n0VIKmxxAK
ROsEYgiUx98Q4pkfP9KmvlKpfpU/+G1iM2jvc3r9d/Q=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 483       )
jCocKvaTwFuNpBmOyJ+gAr+OeTbO5hOJXJ/HxPqeLA2SPTa3k+OUOv+o2FlLO0th
6GsDMkUwggmAEj3ebkjDbDKC6LwikRD2qNCMI4GExJlOAAjpmLtTPAO8tW7wgmoR
zuFUwTOAevOOtx32p0nyoXoHp8ZuSmWty/UZCkuy1JAViajcj1E4XpOHBqqOJV/N
SLLAc+oGf57vvXY5p9YyhnwJvxTrd/MfXucbz1Nt4UeyM0Ko0AwvpAoLi+3VJVbh
wfAA9j2qtruJjHMd8xZ4cvuOpE6C/bn1pNScW5VjzeoZosY7e5NMFWry9U0IzO4L
oIJU6yatbAy13DgSOXnnnQMALB4I32G+w5UkshHaf0eQQmHduGrHhdh9FxHac0Et
6f/Mj7UplZ6Vkj4sqU8G/RhmL65pAHc5KIr/wC7o523hqloKwhgZ3MiUc9I5sp5h
kFhwOSFJW9BniRe4VoGeW5mG2yaBgwre27wmgM2oy+t02XQ+PifSIG+/b+u6wMPN
SkFBBxP2VxwGOQAV8YJYmxfg+5qzH0Xg7HZcjAZRLIRCjQMl2xTqZt+zeS3xo03z
2iUqALYqa0XACmSjfosB2rYjEKjEf5HMhlYPqFZPk4MNTLwkteW5mBPs1gVt7Zh3
Zi89lj9GlVzAiD6lOg0cQQ==
`pragma protect end_protected

//vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
J74GuiFMhsWdAfWt2fUdJSKYGXxUjPmFyZ7Y/jQMgUGOTQU8w+TqQUEOwo7AQoBG
1FBIu4Qc6jvwOPD5mHijrVDFS74uUJpvoBEo9yWpGm3HRSBYW3EFSXgLNn9QHdw4
S4E7Bry/J0+pvGeqUm1QI7fAjuvxwgPdRL+ayPXKWGg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2685      )
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
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_XML_CALLBACK_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
lQyhh8kUnbOJy1/gvaJOjTA6TbopFsjlzGwyU0R2Srq4Q8+OsjyUzkYgqv5/LLr3
1FP5aDvRMqMgTdecz75oOGu47QcW7ZB9Hc909T9PGylGZ2Femb3WNKRcPCo2r/GT
nn+Gho9oAq/+opC5qRh3/Uth1hxmu1ljkikP04gGtY4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2768      )
vPamyK9PPQOqUHQvk5HXQv0Dpx3R7xE9jtookB+MnFhIMHnXieiybNCtOFJd6iD+
v7DOFvCpdJ4wqu22PYzXSPhnKU7K0qg9btjlko9TLxgNRpZ81rFHZN9wxgCIZm94
`pragma protect end_protected
