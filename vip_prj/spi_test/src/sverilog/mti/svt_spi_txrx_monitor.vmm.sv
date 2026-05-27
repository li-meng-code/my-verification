
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_VMM_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_VMM_SV

typedef class svt_spi_txrx_monitor_callback;
typedef class svt_spi_txrx_monitor_cb_exec;

// =============================================================================
/**
 * Temporary class definition used to enable VMM based compilation of the layer.
 */
class svt_spi_txrx_monitor extends svt_xactor;

  //////////
  // Events
  //////////

/** @cond PRIVATE */
  /** Event triggered when the SPI Transaction is first initiated (TX) or recognized (RX). */
  int EVENT_TRANSACTION_STARTED;

  /** Event triggered when the SPI Transaction is completed. */
  int EVENT_TRANSACTION_ENDED;
/** @endcond */

  /** Event triggered when the SPI Transaction is first initiated (TX) */
  int EVENT_TRANSACTION_STARTED_TX;

  /** Event triggered when the SPI Transaction is completed at TX */
  int EVENT_TRANSACTION_ENDED_TX;

  /** Event triggered when the SPI Transaction is first recognized (RX) */
  int EVENT_TRANSACTION_STARTED_RX;

  /** Event triggered when the SPI Transaction is completed at RX */
  int EVENT_TRANSACTION_ENDED_RX;

  /** Event triggered when one beat has been Sampled/Transmitted at SPI Interface */
  int EVENT_BEAT_ENDED;

  /** Event triggered when the POWER UP Sequence is completed . */
  int EVENT_POWER_UP_SEQUENCE_COMPLETED;

  /** Event triggered when the POWER DOWN Sequence is completed . */
  int EVENT_POWER_DOWN_SEQUENCE_COMPLETED;

/** @cond PRIVATE */
  /** Event triggered when the EMPSPI Negotiation is completed . */
  int EVENT_EMPSPI_NEGOTIATION_COMPLETED;
/** @endcond */

/** @cond PRIVATE */
  /** System configuration handle */
  local svt_spi_configuration cfg;

  /** Configuration object copy to be used in set/get operations. */
  protected svt_spi_configuration cfg_snapshot;

  /** Shared status object which allows components (which each reference the same object) to communicate state changes. */
  local svt_spi_status shared_status;

  /** Handle to an abstract common class. This class is extended in two different 
   *  classes to implement shared functions between the driver and monitor (in active mode) 
   *  or monitor only functions (in passive mode). The containing agent class will construct 
   *  the correct extended common class and assign that to this monitor.
   **/
  svt_spi_txrx_common common;

  /** Technology independent support for the Transmit-Receive features. */
  svt_spi_txrx_monitor_cb_exec cb_exec;
/** @endcond */

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new transactor instance.
   */
  extern function new();

  // ---------------------------------------------------------------------------
  /** Called when a new configuration is applied to the VIP */
  extern virtual function void reconfigure(svt_configuration cfg);

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
dQSwnRL1YeZVrJcmJiVRlpgQo9x5ag38kfNbtOI7H/Pio4Ot5TFtklARIfpayJUE
zMldBWHOiuQgmIbG4saihZFCI2N9QJ6HdyXfuNoflXfdd0/jZFpPfVdEUOhc78jG
TUjecwdrouB7I0xODE6TrfMs/NuOQ7Y21fQrAYmCzV4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1388      )
Ce0ShNh7omlbNxgxYX4DN23CKSWae8t64hEOrC0JkrrIYU6peC0tvOvD4W4CgXhS
8oQg2oqIz6CVWRAN+KF2Ge/DQbORHhdte4NszkGUBztDRlesOXtwGtsD0UkxVrfF
mZXo2OHxe0CdrVWIEreXpWPf0p93w/9tCAZ2tcAl/OxhM4UhozbhEkXU/Rt92n5z
2uYEOVqmB2u49KXb3srHljEJvPsxZSb4sy/+W1ZqVemZvJzwxy5XWZ344Iccgr0D
5muXlxK+8mor1q1nvGrTgVDxRMVkjd1RFDVIK+GWeWhdZDOYULMVebtxDniQA6B9
BJTUlzW88VjhmFLEjTJNr2ZBDJuK9bVCMJwTGP7dxSfQOxd3xoWq5P64JkEIt13g
FiOahAiO2PZ961HFQUUWftvX/9Nf/LOYF62/NzkpebKCcYlG3khsE28k5XmlYHt+
IxW1g4TFIeYHWIXFFwr5H3KIcL4ya5QYRKidXwMc7MB+IV3yQt7mZqrOaB7rIzao
LyyjaazeRdavjC7y4pJMVgnltQMYk6BG+xFwsX0WhdjaibJ18vu8cwTJpEU+lsZ+
uM95Z6XnUGB3+ZPXQbLfOSi9/n2CH+pbeyNKVNlwUB4dotgfSUYLDlZwc2gKKygB
bFPssJlCQtFlPDy1bWkPh2v3Ut8pfbcMBcAwoShH/chIZLTbJGmH/QyPBCJ4S88Y
CCGDX7DIAQ0kqz1oVe8IX0DLta1D1zuXMc0K9FwEG4FSbMBIfFjLxsiUT4XfnRsp
UxBb6GQGFbf7MVOw4KQTIZKlY/cb3QwIwziFyKmtZvLeqvh+PKRfqRRy2NI6IvZ5
01NheAi0G4m87J9As+rxrZb/8N7CXi6dA0ky+ts+V0C70Rrj+Zm7s5eH2YnwQoOC
QZnP1A8zcHYOeoGtzx2Hdt7kM1FZ/TETiS/tMfZiXS7DDymt7k0obfaZY+CQ62lQ
dWZsZ1Q10bB6m71aXgQL0DfK7mvyYk8duC4jGR/PefoiqPTPa/ucKFsn+SMrml20
AFroc/scT7BJzOT0yVfEryt7MN+vlkkG7Wpc/ZmlY7g4d+p8mROnNyxhL01B1d6b
Hb3VNE6jNNLdV5cvpTaGe4RCmofyf4QNyYdZnKN+YWfnZBqpzOsSff9EqLMv5TXo
FDgWZC4dggkpvz6RsHWK6QaVejM35I0Qov7+VdLNfWqWUBbe3QwpZmUaQa4hdVyG
ILCcd+LcYhe5PMWUogFXexQIf0+lGAOkQIPgKX/wCeHRLo8swkt6g189EU+zgBHQ
K8UpNfSMX4WR5nBvCYmXXJgrY3w5y9da/mBmiWmVhYuCajKTDQFBClThuRPjKJxj
JKA4f50HhygmI8zdaPBv9OYkjhc9tuzwGQX5/H10E52rD+CpBEITTy86dWixvKGm
b/j2rH5366nkVBke/vrrO7mEKogCr7wRkJDb0vqlnpTlW40PaQc0T8KZwYmPkKuU
Jq4wX8LBy+PQpWUZLEgC+6F/fyFCND3GBsSUgzEpCXXQvkTj7LMP1ZeupV6X4pBs
3UUm2nq/HeyF4BLxCLbhKa1FF2GWLeqa+8ZP9bOI7F4cWKfeVkHSXi9vQFeqqHNb
H5jn1dEkzUKaaePZpWdpncpD7IzTvypY4Xxi2VKeEfxqQthKKoLt1g0aM/LGTGjg
65IMZL9WZw/MNdX7YOfeay5xgx8gZlgbSIk4Hac0e8+pgsoKT/kZIJdcCtirQT4Q
sJRgJeGlxnRPWaQfJ12REPw3nJBQzlyBgLylbqH/xx+uZu0u1LuN2BEv98azqyW5
T+G/YN/Lf1S+pYaP/ekCfM7Mcl5pytynaUHGJWZIQoVOO7TT3xviUyFzez+Qjo8w
`pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's callback implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  extern virtual function void pre_transaction_observed_put(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component to allow the testbench to collect functional
   * coverage information from a SPI Transaction that it just received. This is called by
   * the component immediately before placing the SPI Transaction into the output.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual function void transaction_observed_cov(svt_spi_transaction xact);

/** @cond PRIVATE */

  // ****************************************************************************
  // Methods used to trigger callbacks and client accessible methods at important processing points
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * This method issues the <i>pre_transaction_observed_put</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>pre_transaction_observed_put</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's callback implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task pre_transaction_observed_put_cb_exec(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component to allow the testbench to collect functional
   * coverage information from a SPI Transaction that it just received. This is called by
   * the component immediately before placing the SPI Transaction into the output.
   *
   * This method issues the <i>transaction_observed_cov</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_observed_cov</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_observed_cov_cb_exec(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at TX..
   *
   * This method issues the <i>transaction_started</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_started</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_started_cb_exec_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at RX..
   *
   * This method issues the <i>transaction_started</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_started</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_started_cb_exec_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at TX.
   *
   * This method issues the <i>transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_ended_cb_exec_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at RX.
   *
   * This method issues the <i>transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */
  extern virtual task transaction_ended_cb_exec_rx(svt_spi_transaction xact);

/** @endcond */

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
PZWtrjrf3pZgHgcFZD+bMlvH8sW44A/Tz/IW1m+S64+JY0kFuYfg0L3UBjbdlNDJ
a45OCNsajOsSoC+SDMploowPRHL1KgXztr+/Th+xJ8LldL48rObXLRJ/evcsaeTB
r+ixZtZDAH3RARYwkhn6mbffOpIYfGsXeNuNMMF0R0s=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1687      )
HafVmhbxvVjt/ymWNplcu/znKHIXTT6LBiEMQxQITS4P44PjOERjM9yurK9e6e7s
JTmy9xxJMaPYOo0DYAl0gtcHLhBooVJPF/CFfDz2qpLH7sGLNV47UncmOQ2wZDW5
5HB4YZyZkhB9pO8ksNnNX4CF1B3bV273IOg9S+//p9WlM2iNc15TYv8/D5xliNno
Dfm0f88YfIFYwTSmgmhUn6br7JkGZHXxZF3ayHcpfUolpFIN15+a2/zaGy3wrCCE
KO3M7TXZVwwGIAAt58AntQ2dlOJBWbTIp4dCgSmtBMBiU5PSGUaxk8O0i01O1MKF
w3CPMICCCUrP58ZICJqSCo3/mc0Fm8bD2d5k1O7G29/MaaPkOfcI035UZUnH2UIH
r97P4uR5wI/VIuAzTLqcvg==
`pragma protect end_protected

//vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
bTZgSZGAt0PoxIr1suXIyjwtxBGiaX2JwTYDSiCYAvIcp0+1FaX8JKZCnpsmoQfZ
6Epz5QDmEss2Gew7d4wonhW34QVP31m9icof0UfP3PoyJ6xhzUbqC8JFBEQI7oKH
FNcoqD7jp4ZMSoyY9UUmXIBRZoEKGgtOaqoTjlW7Pts=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 6337      )
6Ypy4cHWYoUp9Oo6jowcqAor4M3nyZ9se3AKQwWcexYST1ZAf97hisMyOSwyzywr
Q19fxeTeRQCRFeOUB40Iwvw18l9tIKMzhRF4VhmbZdxFD9X0OJdTdY39omcCWnay
yQPITt5pJ/VMSRWWBVBVFbvBJePVnTESGMy71Krn/ZuuOq6Laym72YYTc1ljXYRf
V/4ii240UxBXWFoFzc9L8PRGx9Rx6KUvjvL2eRRDcmNJanZfaauJH6brLUUWQHp+
aJSWj+jkOmvz+1OTPWMuI14gVo9+23UB7WeP7I1OAXtEB3Pi9m2N6VDnTL/7eTDu
+nnaRpanYLvwUbd7GJkJzzq73QefQ3Ep0SlMaFFkbpXK00Zp8U0mj7eUJ2kqBZ69
HZZqzVx8aDh7hjvL9+sheCkuuiGAVRvzzs0FTArCrijpftQMuEdHJjuBOytsK1Ma
38VBtZP4WUJ+11UgpYZoEkoiTqGzy+YbAeswNxsG0jjCWxYwhaOh89icU2oWZOzY
2RBNC2MED+gvtyOknJPTUl7S+0e4HqIGBQ0+sqK3I2R3ncGT6qC6IsCf94syrcWV
YNT5LIdJL8Tt/s3s4BAKp2hdFLE6Bki+NlWODaV4Y87GqgJbZ6H8EQvqLTYeDxcP
wUsPzbUwSFQq0V/aRrpLBCAxhWQm5S9wCkVuOMVRhdkwvHXvJfrqFWMI49zJ++Bc
YsLk2YImFnO0PW+yEsgDarLFW5XUYN7AaRQaXcctdEWQ0yD4tIZdSw/w8XeIrAH1
SR3tiKUJ3qfDDemHvcb0NAChhO/GW4vLnTPu3y+2MKTgNbB9ulVD5EVgrG2DxgLe
fyvsMN9wP269c7vaLPrVDpWmEhsfOrPbibE+NkTtlhIgipNA65sHmnh1Kq8cGIBi
+t4MOb41en8+5zV1zAvwZL6O2/BgGY6HRDBemom27HBGZp5gDhtiIGVrTKaEKIYP
bU3zcYfmi/5hxGZLTx71d8vjKn0FsxicEjVTnm/7K5lEST1iSfYWokm9sYmXemvq
Ed1LbjfNCRHjpvI1hRu/r2wxsvIzouPEqpM3Dr7V75fZSLzhXf2e2f0xYWo6GozA
vQq6MlLRmZ675AnkNpE5C6sc+1CpxAYA0IidOvNbVbtn10AT2mUot7bHRYqQ9zFG
MPYHEriwCWbEBGxTFziVZHWZCPzsyTWeKk7+azSQWxKrRp3UbVJJW9nWX+Bs2P3K
oRpfHB0Rh+RCJqH7Y5y3Z4T2D9RUnCqt/Mt8Pll40MQQmtebqjA5IjLIoWfCw/AY
dlmyE6pVb3x77Ux9T3KdpixGpgRY3c/OQySKN4fynkrODrPbdJyTR1W1qz//pbN9
7t76fEWgQvxzRcaos0v9XcqtYfE+Sf115BRHhjydGaKlwLxEWGDorFvqXy06sNT9
SnYMTuGZR8YGRA3Ce5DGd1gP7GTHVtvFQvtKQhHahpJyHSv4/Ju0r+8ol+Je7Wdc
MCmHoxzbVcXWw4rOv7P5jeaWSPAZYM7yl+Ah5n8frVoA8Pf33reQ1m3GZLp0G3k1
O5VYsZPHmTSORQekV7fi5239HNRRDeSqB9WSF36a7D39MrlUGynWhVfifd3egwCJ
28mdd6EX3+So/XPp4jCLTkjKf8lc67JvQq4oIFhXGFTkydpYWnB+CGzQlA2dG/BR
I9MlsyA5wfob/uytYIf2qmXJLMCY2aw511CnxUE5eLXPfV2BbhYHRHJkYoxg6MOL
GhFLyIGZ7UnVcguVMMUXyrF+20TmFFEflJqIF1EwgIuDBnHapSaU6WT2HHvDK1Ev
TRjZksYYzWut+Up/V9iVxFCA+wSNoBQVq+6P2I1K76876ZZQe6XRxt0JFnhgwcTM
j8hw9LCrG2ybU+vfBVYGa4JkrEveny9I3HL9F9YMLIrwkFrkEe1RoilpnftZ/+De
nskiTyoHctQ2k2cpCW7MGzLi0ue+3aaoDKPTU5kJqTXb8X2D1kKiRNhJ/FChXUte
jHVYCG7lT7O9HqJj1EIYCgQf8Rzyqcya5YA0wVw34AFl451iLZ6JlRYMZnueKxZq
2Gc2CzYOC8KVc3JwGTxAWoZBP5/f1bZnkATgsvpw2zE1ytfsDAoYx98h5bNmflUH
eA/7jhm5uih6g8KG/lnsfOGhzC7/JcPzHm+lpcTh3GQLQ+OiDK1VZUeCxJ97pmup
wW1IqpPSTmm4KPg2jvMLUc1NatZ5ItUkYP5itR0MTeH9jvjkEcG9QDtfKqWBOobE
DFsomIk2DneGAWXyakfrnOmxzX25pq5i/IxHuftFBoThWHLHxFhqJ3RuoONrK//h
yx6Fgl1WYdmj930bfDsgsWTG3AgmJtdA3cgPjrGKVHnysr23twSReBBvJxb0tkJO
gw12JPLjNs0X4vCOgdNwzQggqNkyh4YOiJmrG4wqJqa39umsL8L3euNVnaZR3ovi
e8mpL5UcFOwtBfJ5Y5eKwXMxLKuwN5PX1JIQ770/Zo5lbH3nxHgmhMiyfh4xVjie
H4MlUJ0ToR1XV+yv+rKwLwinEb+xF+8yLPwbOB3nthtl9bmNdmyCo4yi++b8P69Q
4TFXY8VNEvHR438oAfEtjGQa3Pm6Z/hk1kuWMMSzCMFwv5I4ZQYZLjh9tdNA4he/
BhM9tCNEFLCmCvIxRo60Hlna86505okGDtag2NxMEz7PmrhQzdBy496UCJSDe5UI
V3dgo3ys4hqvI/TiZ/192fr91/9w+v4xC+Tb0xs3pLQwQLeichEAdxdg9csLyUOm
NdWhV36+u/WyHWXOmPX3t41pLP+NQhaMX/NzpplMzeEo78hzgkj3xHSy3veWGBBF
T8nnoq1dq5558Hr9PUv2vwWLlniJbPQabUWoVsUuY5VudmW6EJY0JSMWqk0wuafW
peUxf7jTJMUNeEID4jI/mnJPOyJ8UzlW3k1r9pP9EF2knwdMqpnuGyaOA9IqtlUx
4+AfnYI1ndkfTVDG+rmZ8zEu5N6dd+pJm0G11ths2/sDeNzIL572U7rXGRpT74yq
6wLmXWWbjIX+puF0WlvIVr2//1SQ1BEch1DRR4K7ABM8dc82d2yzIh091jGoyxCL
trHyycvnnjdMx5pX+nsO/7KRCYjWTrmcs4SOry7hiEUWNxtD6GMKj9b732qAPt50
67FtY3KA1E4tJOj5sQt3YcbYohzPajxc5aDDDV1+h6fs4ZI4H5PeYzuuqUx4ik7M
s9DIhlc83xNihT6NkcNOYCDL48PbYS7kZp9m5J7fov4xrTAbdCvI9bjfgtHzd8XH
GMXSnoZ+HzFx7sW2gV94uTGOrZnxkeCe6OGTwV9da4Q5tlGxkHByh/wWliRp4M54
Pgik2AqWJVxhOISLxkPJqZeEOR7bN6+K55SvOW8jCu4cRE+G36WqQ/DKWstFXzjO
AQ7z8h/Z031NasBncwitEYHnhOOZ8ZyY3XQvzvpkyY9z7Vj4NgSdYy8xX+g+X7MZ
XPrkZzm2N78NAiscblBG52NWp6aK8wiLo7JT1Wjbv621QHzG7R8eg+/EOcNCxnrh
Nmgn7UhZXTFt6FjzQRQybEm3/cX5Xs4rmw2S8/rKtLGBEMX3CBjJm6OqQ2Mw2f4T
Ril5L8Z4mro0t/gjuRgLklZx3gCX48kKSuza4u1fYdeBQOZWta+ldArsX/FVAJS9
oYKc/wSl5bYVc20BDs5ultO/Oln2bY8vkjOEzj7QiMCDxw02zG1RvlSq01gPDZ2g
yZ2T/SPjcL8YskbyqJduYztcLppKrH15XlgN8COMLZ5Cb3p1OZKgBcg237tYxqUd
4cgYI0bZwbyRlZU7Le69agJ1pQcZVO8KByG0BEfapbVOaoeH/Y78CfQjU8mp2sBH
9f2vveX22TYidOHFfFuyIKqjxswL7T0s+qUFoTtDpOUVPJ7+ekR5N3DD/uO3kC0G
9RpifWZNW5pJO3E80B+f7aA5iPVhHOW+Pl7MnsuM3aJWrdm3JC4ovSHqZ3NgNUy/
M9EA3RsFb1PQHz/F2OxgS+QhCzpJ66V+fgwECIWFZb5mE1sSvbbOY4KRLkQrdabd
yBFEZrEsKPd6LhsEXWvAoRIse05+RDW4V8FAskROlS7PDCk5A9HOOuJPqPi9WvFw
bL6dQ2wTwbhvV4omo7h12wKNyJ1DeQ42M7a3kMI0URDhr89KjD9tcCLNEZW5mC+2
FevF9g1FywCSgGbZDsJOOxwYUaakVa4slQs/f1Ar75goclSnl6ieYCEGs3+8QJhU
OiK2yozdnmDYA+1evo5P7puDIyeVSNKeNAJcTYvWQ1gbagZTeje/+0UHlzbuYRXS
I1yVZnIuXsynXru0nAm55Frxc/4orlYAJHj7Gd+xn6lq119ZjEKnPjv4wg1Pg4w3
sntML9nWsG+bJHOTaCR98QYzaf6fYGPAtIY/4CPakKrcKRSRRv9WqL3kB6Ih3M7l
lED7XRaSL2GUC8Iw1PlPcBLJvIu35VwxSbCNIzKeded0WviB7LOkYWvHSbiEQ4zd
O+r1PShhxvlxyhao8zMrAh/UqTNMgrs25FcOYNDiUyaQm+XlMoxlU2KW6BHdTxjG
75Uwgv0Ho/Gsdsvzs9ZBu06krOjnIs3Q4utX2BDvwhGpIHA2fprRsUEW7RbrTbR1
hdPfpllW9N+wrR2PHxnzzcHJr3ytU5h0AnIXSjwypNA76JeRK6IidDpAqKv8wU7L
+TehiLnlWIzBJvSm03AwHNAgUc31Lsg1f+QO4kS/FjkE/dgqajaOUjoeonBCSVv6
VCZ7UTDzgaClxbJxFzavh3EGRKg+WiXLIoBvlTnIArUwiYjkdgg5PbybfTORp534
I2KmAtN7TGMJ1upaQu94fGacFBgit3O2ULktZEIQ62Mp04cHCUOo4VOlPtigrSBI
FzuaBsVTPgPj2EkOxatBLtgRH0RyXJI79Ui5oC1ovdqVfU9+r1AnbFpm7Oc8YqGe
8iIJEsxQ+UXsFks1sdlSv73+V+xWNrzZMNJcv3yfeNfDceobk420v2v8YRUQKNSU
QQLeMUx4NJJ3Ko1RayxAzLf42SSPyP17X3MOOT60dtDd0dTxJJe6GayOhWFHzww1
Fj0DNwIhK98c4RTUhnuI8bt46NoA8ecXpRZCY1rMLOnVkNKBhnPtJStWIGOYXDud
wmRs8N2umRPG3JnCps5ZHqhFlJxoIjnrStY/e0Gv2wSAC+YYY9n38RfI35fzgFc9
M99nwOCBQLJl9L8xOERGfHU8WTW33sI+3I3ffDjMnQERPiK4xNlYBaKYeLcn2Glc
GCvZqtDw34L+4Bq0LwsSdPCU/ShdLtotaTK8BLAgRkIL+3snh4uj4120OdD832Ii
KANsQOV7iDpAcnul6qN5Rzef8+QSiTNQWIucIFLLba08H7oXnuC+0jC+s9lrZboo
1SLroG5BJZ/c8hXuKYpIZaOVwggfmEwvlz/14ZzjRHLECZ7uAHj+p+xm1aC0Cf0T
/kkrkF4/P6PlLbmcRwgL4Yoogqil65zZ+8rml7ektZQJ/Y9BqZEMDBh3Qknqstrj
dsI1ywG8LU2tL9HcmEkHox2NUfUBnlNrVi+HO5sjNjfxugjr6LolplzeZw68cOwx
ZqrQ1h+h/dk68Q3Ba/x5vy78E6fsox5gCoSQcYBFHNlB0dERwrcPFQi1mGPTKj/6
HwFW2ekQsFG1d9A1cnFZByK2i08VZWdur6gpsk2WuUfQxRLoDvekSfmF6MiaEOEv
MQYsafYgpRbNoJL5Ub/UR1CgZjBeroJItTwU8RKgq/m8k30e6PzSGjCO9fb4AWDq
kpFmtuehvcaUWO27pYF7VhedLtUbtLO4pD5GpzGncKtaWwzO3jbxSGTNUXo6v8SX
35c+BG98qMIQN6KyHkp9BiuGy2gmY5bB47LRORHea2LVfGTYCq9E0mBIvCYYfjpe
DFb5tENe+aH1YS7Gj6hV5G5gg5lOH8noZRh4a68EY2VEBFCKxXiO1/Lfo7m2NEPh
R+jIlx0QjTfzWAyRHBWF/5xmOI3nsnGhEW7AaKVa3nCeEVXW29Bfm+F514IEPQOr
TqT26qAwqHNRXErqnhwJn8aD6AP9WjrCAcxG+fVgWMnYGZL1W4sID4HayROmXCa3
PpfBQNLGclF8T/fk7F+8mYpKbdU1C120fAJ85DplzX6CkVeWWeJtzWb7VHa7qxOH
ko0/DhclJYOfNr9DkFsgvUzSjT0vdX98cDRyDAKyvrH5dfXgWV4ig9CH1zi+yfVQ
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_VMM_SV

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
P2MHpQE3Ongr0OnrGD9x6ZR79Zr2oHG6/uL0KF4NcEf1LItTZbw9lCS5R3TAYpPl
mpnJ2AxW4epWyFchEmI0tsrvuTCR8cJc/3s/8JSTvHiD6sfkqGJ4bVKv+bXzPhFX
2EHKujZ4U4B6bX13L4ZtY3VGrqEeqiVWR5kz1EgIU3k=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 6420      )
xyVnnQp3N84z1NNkxz/Af9eJbAcwmdxVHfAcvOGwUduiG+mV2zj9jBaT4kzcnPTE
2fCY+R5hhu5Fnxu0RbxXVRKgaZ0HUb++CzaK80aNgVq5ArQ/TSxuKSikaZSU05ac
`pragma protect end_protected
