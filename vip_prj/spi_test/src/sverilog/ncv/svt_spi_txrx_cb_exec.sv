
`ifndef GUARD_SVT_SPI_TXRX_CB_EXEC_SV
`define GUARD_SVT_SPI_TXRX_CB_EXEC_SV

/** @cond PRIVATE */

typedef class svt_spi_txrx;

// =============================================================================
/**
 * SPI TxRx callback execution class which implements 
 * the cb_exec methods supported by the TxRx component.
 */
class svt_spi_txrx_cb_exec extends svt_spi_txrx_cb_exec_common;

  // ****************************************************************************
  // Properties
  // ****************************************************************************

  /**
   * txrx component which implements the callback methods.
   */
  local svt_spi_txrx txrx;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Class constructor:
   *
   * @param txrx The component supported by this instance.
   */
  extern function new(svt_spi_txrx txrx);
  
  // ****************************************************************************
  // Methods used to trigger callbacks and client accessible methods at important processing points
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * Called by the component after pulling a SPI Transaction out of its
   * SPI Transaction input, but before acting on the SPI Transaction in any way.
   *
   * This method issues the <i>`SVT_SPI_TXRX_CB_EXEC_COMMON_POST_CB_NAME</i>
   * callback using the svt_do_obj_callbacks macro, as well as the
   * <i>`SVT_SPI_TXRX_CB_EXEC_COMMON_POST_CB_NAME</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the transaction descriptor without further action.
   */
  extern virtual task post_seq_item_get_cb_exec(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * This method issues the <i>pre_transaction_out_put</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>pre_transaction_out_put</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * @param drop A <i>ref</i> argument that, if set by the user's implementation,
   * causes the component to discard the svt_spi_transaction descriptor without further action.
   */
  extern virtual task pre_transaction_out_put_cb_exec(svt_spi_transaction xact, ref bit drop);

  //----------------------------------------------------------------------------
  /**
   * Called by the component after recognizing a SPI Transaction, just prior to
   * placing the SPI Transaction in the output.
   *
   * This method issues the <i>transaction_out_cov</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_out_cov</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task transaction_out_cov_cb_exec(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at TX.
   *
   * This method issues the <i>transaction_started</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_started</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task transaction_started_cb_exec_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been started at RX.
   *
   * This method issues the <i>transaction_started</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_started</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task transaction_started_cb_exec_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at TX.
   *
   * This method issues the <i>SPI Transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task transaction_ended_cb_exec_tx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has just been ended at RX.
   *
   * This method issues the <i>SPI Transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   */
  extern virtual task transaction_ended_cb_exec_rx(svt_spi_transaction xact);

  //----------------------------------------------------------------------------
  /**
   * Called by the component when a SPI Transaction has finished tranmsitting its last data bit over SPI lane(s).
   * This is used to update the data content dynamically while current transaction is in progress.
   * In Master Mode, additional clocks will be generated to transmit the new data bits.
   * Data driving to remain as it is.
   *
   * This method issues the <i>SPI Transaction_ended</i> callback using the
   * svt_do_obj_callbacks macro, as well as the <i>transaction_ended</i> class member.
   * 
   * Overriding implementations in extended classes must ensure that the callbacks
   * get executed correctly.
   *
   * @param xact A reference to the svt_spi_transaction descriptor object of interest.
   * This callback is currently supported for SPI-Bus mode only. 
   * Only svt_spi_transaction::data and svt_spi_transaction::data_frame_size fields are expected to be updated by User for this callback.
   *
   * <b>NOTE:</b> Any extension of this method must return in 0 simulation time.
   */  
  extern virtual task load_tx_fifo_cb_exec(svt_spi_transaction xact);

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
O2vnA0ooXx0iNxbPPdsd3jb5QHFYFrA1MAV+nbnU0VSkOeKZJNz+fWOFbr7GI3iu
46os1b4x443FTr9xk5XRAE8S1qK2MmBePQnEpNSh8KTf0U20qHxnI3fd/AqN2Djh
nSXSZYj7CvWF7zj4pxt/a4tjVKxIl5dITghTQ6pDKENK7hlZD54ukw==
//pragma protect end_key_block
//pragma protect digest_block
ExdWwJvnr6mbsJZys2Vm89ArWy8=
//pragma protect end_digest_block
//pragma protect data_block
p2PsGPjDOu/Vb/J/O89wi7iFbh3gS6Pi0dfb5DDp3Z7VRuxJSZpAwH3RH7sCuHy7
ne0VnMaweIyNtoDfLNVRKF5dSQFvPQJL3p1hi7pablqtfQR7ZvKXDskXB/qkwZJ8
73j52sq8m7r1EmMu6+uUg124VUx89lIMQYqiYuBWbm2xjorpcjEX4cK9N6wxUygk
Kg8RiHSz3Mqhma6BWA2onrr2qzTAs8oRktCIqSs7WAcqTDCNoJ/owIbl+VoJxlT2
qsf+FYYa0ibuEOkQQexGDNiucNt9vTeFlPe5UbtxpKSOPdj3ESNl5acsmJjwXHLc
GKWNUHnjzHezZsnKNyiL1Kbrqx5NmIGLkKvcvNg9AesMA7Gk6N3TLSR8NBQj0Rpr
QyqFT1uk8NydwsZ4i7Yr6kSAkOvRApc7fgyuV49Jbv1HnQdOBPWmmJJHyRK1ijcb
XSVJ0pnN6N4Q+EwPgcteFoi0ZfGIcvcPeXgunLlDBTczxSk1S9VKwYmYIUsYkxIe

//pragma protect end_data_block
//pragma protect digest_block
XLZUIRmalIHqTriXPVgFaYDqpRk=
//pragma protect end_digest_block
//pragma protect end_protected

endclass

/** @endcond */

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
XoBBobrir6trrCjpQk9QmTCQi6bF1+zN/8jOLd6sTpayBKbF4rxIVPpESx4L+l26
KgezwH3XfTZ1f7HC/frMp4hHzy7wLXUSbMTCL0fqSXCvsr2zePSlUAjeO6c7Yz6B
5Z6aaavw1JeRYesyKmBI4Uanv3wSHdsW/xvq2pv0BWQv+A/fJNMMNw==
//pragma protect end_key_block
//pragma protect digest_block
sm5j7fXmLQ891FuerVO1Z7GUQ+w=
//pragma protect end_digest_block
//pragma protect data_block
EQtkvNtJK53qCjj1hiKKA63EoYYaG26TA1OXpIuFCSiJ1v3f4z79rypNu97PfL+U
4egGp77RX3ubpCedDhFx24bqWb+Cjm6wdOIKXNlGjpQSAkEXmO5yA4aZ+huE6SG1
+v8bV88qxcoXjyHTaPDQsOBUieZUpJereysFjJFvHhjcMvtvbFI5iAGI7W7p64iD
mRwb4Hh7G8upnsK3AhVjFsaTJUAKmTWrRT4BK45kOImBV9cOdnF40lgivhv8P7Bj
YmFOhfGm19kho9UUxxDpht97phiX+iF49qtPdkqW7M5iqoUItvMpPnGE3q/iLQmr
kzDHzVm9aYV0XA9cXcH/SWZ0Txu3ycbo6ndUhv7m6x2WmeAcexTLtXKQxnh6KZgr
XfnjMC2Gr8XSfCcguTSdO/JnhNoDKPLvvjm4m+iKFCh37baeBY+Hj/h2AF/hqvRk
qTvBO4l4pt8k24zxFY24WUCuITWIG4UaRoqZfS0h407ikU2vA/fCyFxt173BJcNa
b6dgz2MZiEJ8GvhU/aXbOk14aZaUMlO4S+7PJUXfGqqq2RGyQC1kn6MJs/r5dvcQ
3OIhMQD7DXO863wiaAY8qhdHNi1ZEpwG3VjK4RXlOrg=
//pragma protect end_data_block
//pragma protect digest_block
2YGq0bf4eM6Qhe8c0UEJ8kYN2eQ=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
8pH9qaVOZ//mjYfVje7GBmLQ8fwG2PDwqtsg5T5dR8ftbzJ2bnmjAuh6NKse8Gdj
lt0g5xR667rM8mpifOTQNqwsr+OZPPJcQvqSxttOd5ZlJIZIjsnyQlDNCothijKV
9Ni7a7t4cuS8slFTlHk32XDDi5pzFxRX0HUKnRmiPlJqmcWbTuAbuA==
//pragma protect end_key_block
//pragma protect digest_block
rMOcm2LZjY/YkHdMcoSYUlxL18g=
//pragma protect end_digest_block
//pragma protect data_block
sEIIyR4qaUoC6vLDs6rms61iu1ZoecMzvaVeCXZHkbkvU5Vmz2X0UTT/Vt4dBuoO
Yw9avBkweU66vfPtzxOrAeCOqZ36/ggZtB1Auo9RGZlloIMunMX2XINRkF2o0Ua0
fdi4zoSymPLLfIRQ2gr7y4jxXMTTbD75oOSYIttN+ljTEQr6j+t2jVZtwo/6nhcQ
Gd5dk7h24kxrRUL0vxt7lh6Rnhmy5b0qjcyMhRhFknpRIORU0gcRU9+w/Jw6VeWr
z8jOU2Bn42ubpGz6HfFABzwFL40twYubqagcKffOlN2vuxovnus9XopnB8/gyY18
a0kS7YdX/+IINpvkJ+iPOzJo2OrB+2o3CwHUjR+KHlkCbl5L3ElHSZupR4sKC2q4
gosRrYWyiwC0QADXYCXrji460XIhHLE1RKhNWtdUtFDD1Jrz4XVk6o0rAKfwz+4/
7nlAe3PFasKkEfclmmA+FsOVCzydR5XOmclpIZFxhIJ6eecH1muUB66TWb+7HjEv
rr7k8Mct9CiwmOUOKdDc9ali3+TcceKZi7hbB11HXawPsS3ryafPFTqluhac+n2t
8lpP8BPFRTwItuZv3aYiQ7HKPJYpbBuS1S41zgAaWxHE4Ij8W3l4EK/1/VqYfBrG
oWlS7fsCxsJvz4d05GO23X7Nk2qSZtPMk2kzGbLfqVvCqnHpuJQAWFRkuwLPo7DQ
yJHri4FO/9uk6IUPrk0weEfsd22GtlPF/1KffKGk9SYvnUfcO06F/tJnK7Hqfu3v
9SwnSwCeAM5FL3FLlr9Mp9RvQ2hI/4BWLn1khuSXSbZbco9aHo5b11T2bZnGACBY
aQXGdTvW6ts7eTFRPA4aH3E1XOsHpJ5BVUZhT0i5IbC1bbxJtQM/L2R7zOMZZCby
3HIg65AolCegGc+079z1ddFsId0TCTeoyheE/1Y1C+33oSfCY8sBVQH9VoQ1lqg2
CBDmGj334MStYbs1+9DL1Sm59XA4WwuCXM1sZ07ZBgujcW1QYMNh2IR85RAVvfT4
ZiaqXAN/0nBFuEQ68t6n7EVLADRmbBxz9Lh6jK5D0zdl62/hTqq/H5/vZFhFaRd8
KnLQV/9FseC+3kxwOM1umZUaXFfDFIHfx+f49zP/xInKzn+bf7/xwf9atyF4Dh+S
vpRmRcRXMdBilgzJZkgLb4rS861wCOZiaOmbiYg6hQNoLLmJa2Idtdy/Q/l9b4re
3km4QORz0d+d9Xf1fTigXFR0Xtp/DBve0MWIIVOYf2HJ+maS5avjNIvcYl6iWuYu
wzgkoF0tqHwROC/6kHPKGGlx8dagLK332EEBV0kngHunCEqbI/lm49cyidiZmSAd
UC2oQ0VXYl+iiD8KTNog0KqCqMlGp/Y9qj82DIGgumu2+11CTdwFCcYLkPxyEH9m
X9u2DxLMl0paiszwGJ4szbzxflQW0WoY5aGZuSZc39YcEtgHvc67D6QVnY7gJ3ch
2ZWuxB/oijL3QWfw0rCw3Rv3Q9WYXsGzoLWgXucVCNmD1+RC8vVvNk4RWV9CdlRW
OQjDaGkT4PpulF2Dtd+Zr2HLu4CNWlE9b55p+QEvWLuFf4DAl1L/xEDk66xX4oVG
+2/e26swJTmgJlPEKzW+TA8xLYZJ46eugumW3IsNtc5yEucC0cxSAvVoZTHB2HQN
SHCOwjtLVTxOpZVfGz3Mtld0KokaRR9DLHIjhlraq3d0qhHOGulHcPw7HynDN1hK
x6hoeG4N3Iyh2rawlYPpXgcTiSP0YcZUTuWWzxMaWcvZxX0XQrbSk5Iu4hKcrcKL
/cib93ppA/if6M8st9UcoiuQ6OcIQASbV3Q5X79SqI/BUngBtGm8e4pSsxRZVXum
eaxwr/y9rYN5m3Teyb+3uRPXFKuYEDAuDBgkRVtfRg1lYFIPZ8J232z/g/ItUiWy
04NNjuhw1XdUUhVWl9TFzSxBBfyAcfD1I8Rkba4tLeLxlV+j7Y+8b1O13CTKqs/h
wZkCYixwt7mkc6ux/Z9SsHtzS/VdFkbrgE5FCzFQzU1No377QknBSS5hFaghdvq8
fRV99icEdxrBHEqrhg5E5aAhfSypm/6Y13m5aYcbDRBchTX5V0a5K00p71pWWJjv
BL7620zsleTiCBi7KKFXU9hAsjv8UEdvt4tdQ+gVX6QzaXEG1xmguHkSqisKI+rS
r+ZLKw4WGqNlx9Dk0uouw2l6vayJQbxBnSUB835+tyZE4CS2uk8vmZL+kLC5qNK1
HBxygX0baqH/P3wLwMLCt0c/RVtACeW+ybK7VcRbphyz3ZDg7JrqBbvKKPLdq9mi
IUqF4AmwHJgijddW+AT9SeofMZ72QH6jENFGL3hjIlF8FSvnoRI4UCRrnm7WyVCx
Y4d6V2rWgS961gDC05Gv5WoZSM5sovIuQmYHGz7qYArIy0iSI9yEU2ozLJriVB3x
Gx0imXkhtHIfI9jFsxea62C9giLN3wZL7jsAasYSD2huX5P2pS301OctHQPxxnw3
RqR1I0TC4BNfgIneJnsUZvaMDgubXO2SIalZcyIPkRPeM1XpwOtL53fClQLhFzrY
Xv3edy386x+B7o4lCWyfpjzMP0ajywq4gNbo46P/vZ/MO4eIMNaH/mN5N/mZCdkN
ExFPj/VHhsx3FrvJZceOsBFQKvgJwaaG98arC1Mgsjld6vzfwDFHwxm8Eb/YrRq0
3VlUrQX7HPAvi/lyJKlgngh8OVeOOAsqa13OJy6AQkFBRXDf59a4H8Gi4vrTc/Bt
+F433xE6RCuwF/NMkwLxkNS10HKB/p4jftMjiTX4FyFsqAkSY904dh207SeufdpS
CffmIvpC0XdbJNv3179B6kCauO85vygN+u0uVRhQpNN6dtSyX5DfUflNkDLOT3Yr
UKNt9HRfMiFMUmXnPeJyYdUDA1rl8z/VyAfl7CtS7ot5hjTaqfwVtYWw1dYre35D
ddU8V8g7IVTcJIXawH0/KR8VklKEvevbw+KJ8/6RdPYhJYOVNjTS5030BQcLkXb+
G7aQcaZOtkzHzxCUr1zsA9t343Spk/Gf6OQqaWiSTsz5i5QmxItIUpUp44xaA2Pm
YRTMZ2mYMWud00InExD09Cj6j9uRSE1zwwHDXLIEus+pyVsdsBKNTJiM4hEc2cGO
hZYTgCYNmF6YEILwcKhjFzYTfPRQmsbMKk/sLbXlu6VFD9YUl/qYM5sxHucxGiPk
Tzr9ycap9upFsT+XY+W+U13qvZekqpXh5hKw5DGLy85cCWpG0yHeOyYWnSShTUFa
fH+cmPVjNNF36zvm4ZDdHl8wA2cK+2clPqXA2+i5/PSVl5LC8j+EhQugo+uW+AzF
sAyxoln4aXXAQrw0Sgj1jKIB9xravOcbS3te0g/dOImC0n8XGFDIuI4dB+CEcxLT
+zYmbVotQVIhdXTCBal981kzMTOvcdiIAE6aELHz3RIsq2AVWPd+VqG8X1CkTn7U
0i9d2LSE/DcSYkJ+wKJcksLpNmJjkYPFNNiVSXrLlcx0wlnhdW9UgZql2SkWZ603
74/NJ4ORDoOF5Mf9KQek6ORcYszOyDRl2H1z/IPPobnw2z/fobhLtj5q0fOI6kCK
XLMqpsxJkMDp551+zVrfqVWxUQIOMRHD+CkPvPSaeRK3oBFLRXnNS2Lfwuq3Ce/v
78OZYlrO87WZbg4vhnTWdwfIDQ+Bzbm7l6ZaG0hAyP8Nyt6EaEn7bSOUefUIAfzF
VpaSDwBImwvDnDpuseLjQCksPWo0+AJjL7rmlqkIgEE2cHWI/jiL2omFa96q7Mh/
15sykqrOY3HlI/mXXdDeTOXiRVuotVqkCqYgqbXDO/P9Ny+6AR5KhbM2LhZnYvai
bROg2kZ+U/t12sdPVkMFGrvaKXqMTnZ0EJZ2adCBKuSH17/BxwpmhMVhkMxNGN7G
v+P00YoDNNh7SZFzz0pTo5IKmHRvnD64p3tTxuRi/sfRbkjcPndkJd3/9hT0JimB
kEXWdo0uYc8rvZtR2CvrOS9TIBqmpgnDI6v1usiCvXi4pwi4Pb1FGZiUeIxNBVEa
muar7Jwiow0d5UJdOUOHtcGp6a5ku6Hb5M9oDog/JNz7aifEygfvV7+ZjK1duVy1
YLBLXbCk+a0HvtkSheMo1AJVrz3CgGx4DDY/hsA+bLgqazn7Q8Rcgc4aXKWXKbBk
hJFU5LcL5C/Pb2NgQiOXI2biukRuQKQUQFJ/ZV9D33Agmc4lFAQZRnUTNULEnzxM
WWHP9YpQnh5RMx5NUM5h1XAUj8owBi0PiKlB54hCJ6Sl6a5V+CujSXJVyz0tJB5q
QN8nIKpXy3uuHSSyK/pxJEMMuQwkY4gUgqlxJOTZwZHWZ61dsUidCKO68J+kYFkR
x7dni8phjTd+fr926J8gxLUcburZxN/xYrQvHAzKLb6vgzS1qjd5zJP5aHowC4sg
50p24wThhvpx+ne7kLHA0LiDYjlDVop2Q+1xIgMKgnvvykWkuyxFKrCI2RMlHYjd
PsOQnY8apzvE43bQgth9pHP9+tTEeZ2HpsOVdfhpY7qo1ysmzC3MfK58ubE+uLMw
G6Nn4d8dSESuRUqiLllgZBZLSVkcxZtOCpUpuIBWd1xm2dI4tYBJcujLOHYioz1R
o/8gF6NzM3jmwTmDefNmXQjS4lQbWjy2bNWgisPSXIuAtyOZmfmrg4LtPogz/8JK
E8tOOlb9cRQv6dQgz3LBuw3bQYvwDJvE/1TaZ0pG7L0k8Yv8pfSt0b80yW72MVQ4
DSARfMTcPk1XK2tgqmTVOAVl5sZI5RA7yakmyxfjo9Er19ODMeWILCa0rK+gyOwk
yKPVboiI4+wOhiPzDNbAaIT1uP1kb1F7H+/5QtndpNbVHejJf4jJeT41eEzS2VLQ
sOVPr/zH9STg5kJ1VRhJ6rkpbNmot/dlLNVSsbmKFj92Q0XQO2nmBES1s5fKvA4Z
mTKp74FPDZmEBvkG9gBeoLBG3J9yjyx55CSktOGL0xGTb54ZeQxJa9Pc0DCXinbx
ZMOMQ96WoIcd0dpFFT5ajoM+v/MbVH2W2aFrsqqP8f2lJM8WNq9r/ChhfJWiPteN
WOaLh35fGPXdKMNQYWQhUN5EmvrQzJz+aDNXYkHLDSdx01tibmX6d6ECK2/o0kM3
DNmOoKxJuazBIZW4f0jmtywOOhrliCBNLGsEMNdqpIxTX0GgM+f70Gi+er1yVO2M
AZYxdsbm2lawK372Cneb4mi74TjCPdojjkSkR8uzfabtcj5SfHH2t4MPoIloPgw+
/eQOadjKLN/B4eVmxy+5xMO6MjDjYKEgVcjz6shZYDMUj0nsXS2RFzkqO/klN4Az
WB6E8L8YOhsoGUcmJuAVboxckXl6s9X+Sv9XrpRoTHMFKahBNWXAI8LXTlg2vCGD
vC7KbCN/hRasNtaBbaIeDB32aGLxQV8YEhhpB5mMMRDDNEHlCm4SQFLLNLvkqiBk
EFL6vojMDe7y1n7oWim2fAyaMuykV4Ye7b4//0OaUx8dT2otJJVu4BjflgShw9pK
580zx51LYvbUsC5xa9uM7K4hhwPP+F2cs2z7Z667aIu1OQgWs1yW16ngAV8FoRhO
oMAAOSIEX2tMGlWCLYQf7ZMP3Ck+AeG6k5H1P9yEhGdu1STm+i5cxk8hVtL15TWz
QLlKICPFM1Jo3VXO2TsQpvS3+QGO7U7S8TB5gLnwc9Hjgbd0uzUAHCwHQgAD48VP
ux9GIHW7w4cdpczB65JsVzM8GJV2cYwe1pbHNqnAiksgR5ov49xiozssuKUyUJLs
GjB4Vb9cYBCYy5WcW2EwoHfx7wxSMZ5MtNQiXuYMVr87w0Qb6GvvXsSqWJXt7cKQ
ja753afG8SA2mRTCOgYNcYfTMyg8JdDsvY8b+67T1y6DRjOlkzEm+L6m1UzZGnFd
rhzFDiIBUz+N3Ek2N5faWmxVaZGyPo5oypnxsd7o7tBDo0ybsg87c446XfeP3i2S
laiu41mE1H9Dv8+FOasM6J8xWd+yfNGn+rKvPYXxHUok9ALxVZ0n98T2JI2HhVfL
kprElEpxBVy+ODJ57G7trrHPV3guIEC3+V0GG5ngg1h4Ey5QCdbKh1si8pHtpReN
al4MoAp0m3UMLuEkj6/AZM+ewtJ+28sG9Jfy9g/d9S5gIKJqG3iYmXLlbE/8bc2h
Dw+ccnYh6sThAKum4MSUgj3zusXJQTPXzM0Z+kjPknirQKf9YF4kj7ocQH7PTVaP
SySNYAFZ8mP/Pk1Mrqe4GCTPH8MfBUnA57H2g5yJy6eO8/Wms+1BxCALOeZ1XEa+
4zrAzRe2mBGUmFhYDdutGiS00gQozzc+v+tXhcm3984vETrD6jC9lJkPlMJDNpoW
K4hgGjgs1H3Yo9SiH4nlQ07ZfzCU6AGMrlxG0fmzJ84PCuaJgZjBI6y8HaEVPhrc
Dvfh1nE4CXfmL2NSno4HWJizDUtzblNpJAWwtZJo/pmNhGvDsqrI3XdP+B9dxAFL
OiR6CHcE1Z51UoV23bhp5M/G9XtJZkUseFECijv8ELIg/vsEENYDLC/w7Fia6PMs
xTK36ffGltTZuZAGkGPq4Orn4XOnXZggxDKF854gnttw7vzq2wWXj52byRMpj8ha
NwWJFOzxegQn6wEO+fwPGycD2OEbqozgCt+Gg75ryaAJiwq6SJ8S7U+Erc3G9nDF
CMyamO/kBNbZ4auiAM5FQ/07m8F2kMGVGzXS0hNz7GGIiyLZe5fV82MjmVxuMmab
8usP5VAxFZDBwGkfyYCDodBbTBUIy/QQsaFdJV43z31jgsf/Av4+JmCKLwdvK6pW
dMa3fjQ22qg0F0x1FxeChAtbpOnrDzipfrvrAjE+kONWWe1r/z5qP70ifLdWOgPj
ArYiGhaehTXReHCoJQgA4gE43W/mkWf39bJ5VITCDelnHSilU8HDe8BIQ0fqQclc
jQimrI/hNDRBOcxg1RiKmQKISf5A5Hh5e1q201StN94HKR3RHUvll4LO6Eyol/dt
0TkZhFA5ucfCP8XSkwwzRL0vzNlZFjBTeZOqIUrsON8xj2U15Z7+lEBiJyTFuYiY
pkDNZMkSJVRIFlp+ricN6Fy+MhYj5Ld0HwtsboRYCvZxWisG+hyQggmZhNTe610l
WcZXxtprCHuAND07deTRu+s9WgZ3gSeZDuzI6sfLMiG58ExrbP681EeVUzm5NCRs
iFAiP88kFz8JAvXNFVY6ogNjiwYy2SgCDW9Rli1qnYXXfw3LXQMo6XqsOH1OeXzS
hIgwYHMjBzLX/vaZfRgGW8cwojmEpizwaMHcKFdEBBOluFKDYMjMyBMWQv+UhFcU
I0qD2WfxLEySuXm5/RQFsIW/uGx+DieTUosELPXrevd6YCPx+azoa9mljcoJcy6T
LmLqkPdl3/YtB+mUVhtk9e7HRvl7wRXI04Kz7VV73qs9KJrERk/edxtCb3+ozK/K
8gJrIxcEmQGD7QWYMINJiwwdPqk0CIgBrnURU1kfLpMRCqGpkapvRtTVTWVnPDD8
dUT+nG8qlCHzHRcMWaXoE5gxLzHVCbpDPA91vEhIcBOXSykxAfzOwgjvwxyvaSyC

//pragma protect end_data_block
//pragma protect digest_block
tAUTPXheqsD8z7IITnqhAMWC+dI=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_CB_EXEC_SV
