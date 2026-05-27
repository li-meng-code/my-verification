
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

`protected
-ZfY:P)OSEQ<=/VQD_XaMBF9/;gVSKF?.2SQ/&Yb]O9]/4U)73&K1)K?SZB.8R]L
e,G6+_#.fJXT<ROFX;BXg4KGHga3e49YB1SP@7@[(+(5f.g\G^](@^2ZdV+.N2)7
#FI\2+T/ODT\13A/1#,3CRD/8cQ\R.]B.72ZcXg,?N@=;f:I0B6-I3(>@COIE[@A
E(LTf&^/;?D7TB=QB5I8Zg@]R5^f\=d/<EHfI4W\eZ/+C+gJ7aBO4/RcHa<ZP\8X
7_b8+@I:-=NE&GQBMR+@/AK2<+,b/T39S0N^4V4UfH59/@g@c(g85Q^PQ@J:Z?I_
&,T+6?=3Yd7WP+fP[dL=6>c4I7>3T:bY3M:&7E3d+(d:d<OSK\NbI.0JWB&G@dNP
\)G(<TMb_O(J.=ba5UL?f+5)-e64fJGW@$
`endprotected


//vcs_lic_vip_protect
`protected
e#g@eKNc6+_S.R[D-LC5&JCXH]856FAWY\31Ob\eBFGT2DA)MJ#_((&:S/MT<</0
0A2U/fLPQ63>>:EY:OFRdSXf7LMWeKJ@D7CK\5;6BAGQ:&15IHG\;&X,#><CENRF
Y+E/c,Jc0J6P@>J2_T(dTGdMf3Rb#.LIf\/V:K\fTNfg510(4)7Z&BP]]F,UY)^Q
;TE48c16D^3)LN0D\,=&BNU+XPeY-QAI:<HLgVI5+<-bC7d0,S=00#SM.Y#F.;6d
2W>4DT4&bKBPVNa=5QK5>b<39,>[;H]=>=;29&#DVZ]S9aZT/E/3&]#)+E??-?)\
LbD32/6aE_X?9EMb?f52=1;b<1#GZ,L92Y>H2PbX5WGZHNG.1<BXR(/L+@Gb29E/
_<O+=fVHg3TRW08aSb>NRKfJI@49#\26R5G2?MEIJZZ0abCFfRgH[#&b1P9g(c.F
83&_eE2X:fC3;\HWOa\:+db#W+2JS2IZbCJ/>:Sa0;/CKT+Z:O?7(3]1WBB,BU^g
Y8fPC@Z^T-_,cOT=#bDZP4_GXOHK&(c0P2Eg1LR2-)e_;b]>4/dB+Z[[:=7](-\T
Z(:>Q#J-B_Y^U9_Vc@1X@8HZ+KPRP+FBOJZEf8WS.f>RA]S1:]PE:W9@EXDZ<NN_
,:Bd@CA9&+8M8X/+64E5P+HZ8$
`endprotected


`endif // GUARD_SVT_SPI_TXRX_MONITOR_DEF_COV_DATA_CALLBACK_SV
