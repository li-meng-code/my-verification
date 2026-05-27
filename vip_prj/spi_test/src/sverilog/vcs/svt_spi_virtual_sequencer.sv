
`ifndef GUARD_SVT_SPI_VIRTUAL_SEQUENCER_SV
`define GUARD_SVT_SPI_VIRTUAL_SEQUENCER_SV

`ifndef SVT_VMM_TECHNOLOGY

// =============================================================================
/**
 * This class defines a virtual sequencer that can be connected easily to the svt_spi_agent.
 */
//class svt_spi_virtual_sequencer extends `SVT_XVM(sequencer);
class svt_spi_virtual_sequencer extends `SVT_XVM(sequencer)#(`SVT_XVM(sequence_item),`SVT_XVM(sequence_item));

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Sequencer which can supply transaction requests. */
  svt_spi_transaction_sequencer transaction_seqr;
  
  /** Sequencer which can supply service requests. */
  svt_spi_service_sequencer service_seqr;

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------

  /** SVT message macros route messages through this reference */
  local `SVT_XVM(report_object) reporter = this;

  /** Configuration object for this sequencer. */
  local svt_spi_agent_configuration cfg;

  //----------------------------------------------------------------------------
  // Component Macros
  //----------------------------------------------------------------------------

  `svt_xvm_component_utils_begin(svt_spi_virtual_sequencer)

    `svt_xvm_field_object(transaction_seqr,    `SVT_XVM_ALL_ON|`SVT_XVM_REFERENCE)
    `svt_xvm_field_object(service_seqr,    `SVT_XVM_ALL_ON|`SVT_XVM_REFERENCE)

  `svt_xvm_component_utils_end

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new virtual sequencer instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name.
   * @param parent Establishes the parent-child relationship.
   */
   extern function new(string name = "svt_spi_virtual_sequencer", `SVT_XVM(component) parent = null);

  //----------------------------------------------------------------------------
  /**
   * Finds the first sequencer that has a `SVT_XVM(agent) for its parent.
   * If p_sequencer parent is a `SVT_XVM(agent), returns that `SVT_XVM(agent). Otherwise
   * continues looking up the sequence's parent sequence chain looking for a
   * p_sequencer which has a `SVT_XVM(agent) as its parent.
   *
   * @param seq The sequence that needs to find its agent.
   * @return The first agent found by looking through the parent sequence chain.
   */
  extern virtual function `SVT_XVM(agent) find_first_agent(`SVT_XVM(sequence_item) seq);

  //----------------------------------------------------------------------------
  /**
   * Gets the shared_status associated with the agent associated with the virtual sequencer.
   *
   * @param seq The sequence that needs to find its shared_status.
   * @return The shared_status for the associated agent.
   */
  extern virtual function svt_spi_status get_shared_status(`SVT_XVM(sequence_item) seq);

  //----------------------------------------------------------------------------
  /**
   * Updates the sequencer's configuration with the supplied object. Also updates
   * the configurations for the contained sequencers.
   */
  extern virtual function void reconfigure(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns a reference of the sequencer's configuration object.
   */
  extern virtual function void get_cfg(ref svt_configuration cfg);

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//vcs_vip_protect
`protected
>D13Rb)DVKb2BQL_JD86R59gEEf+N@0gOBG6[IIQ@IT)PdP<;(IM+(fRO,BbL9N3
dX#_/3;,:T4Ee#8Ia=FMZ(>:?Y:RVVR8(gE]1\251Laa3HFEf11_Ua\_O>QXSFIM
WA#4ZP;FDSW<TAR4]Z3b5=5&g7U288>0W1_)-K##)7C]M4g#-LIUFVW_=Yd:TMTN
S35_:;4;Tg(2RJ8d@OZZL9dG&O9=dH]QT_K\0\M<=M5BVZ_BIO<b;93Q#7eD#2_>
R^,<?6aWK1U>e#WfaPK?M974#(PGRGJP5\>76US3A4=8RNeZ:b.@UM]=2L^UOCYd
O85d<a&EP\HED4J]Y.gZ-IX2Tc+.JK>?+AWW?3eQfYGc&M_,.A<#8[6Lb4TVC^#2
ROCYe2W#d_0K[-N0N-E-XaFOF26[5?05EPH._RD??R[7P>_1LDB13XG_O=[(Y?cb
CcA3V/LEUZGNM9(<dBg6H\=9CH+6bQd5O2]MV,OTB;2eE0EK@/La8)S=3.9.4eTB
@.5Y1TVVCWW2Q4(0T8R=_:2I&dG4e]AB.@&1&JLX@bR>DfK=RUNeeTGPJ0gS5U<]
ebKT17;W\[#XFcE4P:0&1R0V1W)-6JG.b+V]2>G8&SC_HOeQ-+0_P6SePd;8R8gD
.1N#A2HaM9.T.D).U<#=.[F\fTa-SH;]<C<6dKSP/.EcNg#VQ4])[McL/Ba&LEZQ
2[fB?F5(#]OFVaUW@QOTge,@2-D6eK21b/^A+)&dNB(;VRB)TETbVOgA)/3X(eb2
<ZB6ef?b=C6BR98gYdB5c<UbLPYIL87GP[&DKDYS>T66S9B5GPUde[M?E?&]AgB]
G-DPFD[8&08LFOY/MH;39G@37G+SgDd<OJ;I=fC<-HW[7A#?b8[?M/]Yc]TWcPF,
K?RWb8e#Xf9,.#02-[+0)ZLT5BeMeb8Y[UV>C8DIZD^J:RB47,GA-B_-#+&<#G-Q
M=f7DCD#.)I=2ZS=7BZ_9PP9AT)Z^d\RW_+4X0fXJNc3Z-a1^,3ReBg9&;]?>\a4
Me-=80<-#59L8_+MODc,c9d5I7ZXgT=9?KYTZW#[U8UHe/0?#_S\aJNg[Md3O/Y]
K:XLcb;W?Q0RMJ/Y2L;=F0<gPBYOS^N:agX;4HY^8cf<Y^JH]HYf:Z?5#-8P.d]S
=G-E;]8XW/eP0&g@fWN-:cb_HJ4/@fZeJ5J-bgNMWMfe;JUbd@5aET[TO//M_6(A
#S8KHe(-N\/dV<X](CE].ZX:<E.W;\D0GQLC3?gbdf:?3eGgP;0K9]Ka[cgI7/#R
DTC84)]&X^<++@T?V7C=H-dfN@5^C^b?4fEW64;NZc1_3g_a@cC#fL8@V=KNV<ZI
^&?aS^Pd;^?cUe.6Q@Y&cLRM_bg[1LcdCC,Z=1(f.[LcLY(8eUW3XddVa6;cO)c>
QQTB08GXcZFD[/N;9B>U70N7/]c:&M0Y[)9IQ.eD7)JD)d+^1Cb_MDN#c8GS23+O
[2:)A7@,a1fLD,L;)]K2gSH25H-Eb\g[V7eC4Qg;T=)^-gYZZM69)(/=D2C1/9MJ
UG/7b@LY-]VRHP,DX87I@1+T6J?57<HO5V]e\QG9Q0Z6U9B2QXV8XVWQY=,WIWZX
RKP-JHDH6H6d0K1>-W<I1?3RLIBTb\QI.0BUKGfHCU;dBZWI\N_)V9]DWWF\aOL,
\G)(S_WW&DCVYPM6AK^4<N\S2OPEW,+\[,>g)f;[ZNL(IRg2HN6;]((GObMOXH(b
EUdE(<;T8ZV,/KV6+3HTIX1<YA4A;1.2a\5VE7?7((52VEHJ-bAM&GdET8bb?,CN
]Pf+V>F-8]S\.Z,E-L[Y/(9@bg<P;03(;;E7@-C6f:S-&:O<+]C#NJLPC^#/]=\O
BZ&;((a9]=4>EP]FP45^;g1JINZ+HCQDZ]@I96[_))^1[Q/-UgO/J;e2[640NGON
WJ,?O&Y2>RNcWJ6;1XILY?e_[L]d)<@Z,0+dB/6X;JGdPQ?_@:<WIcd4_<?6&,CO
>#:MbM>5,(b0HDI(F@#,E+JF=\HeD;^SH#T-8@PH)+a@[QZVZ?VVS,G57:UA8@Q4
[0ea2AddDM5,f?WPX=6\L29_^VT&YMM(+D[13V=cJ#+)<NegCC8#d9XZPEJ&(.0N
g5c&RP6H4^\7S:Ud48aAFaYE:FBW<L>U?06Q5aNT20bG0GN8I?Zc&KJQA4-@3CeD
/TXEVA2A=F:)K[Q#3-cJg+5f8[2TR[f@<5a-SWPgE@eQ-^ac:\\O(#][GY0bLa_G
J-CP7SdQR8^/HOMUC7Q?==CB6J>e#.1R?Sbc=b/<GOffKWP1cY]BW3JNe96SY>>0
)J;>EQ&\O_?bHOR^[3A;UW/7O]d5IV9NWCEeP^#?3>IL]##b+AUG:g<^:1K=-ZCG
BcZ5;U8B\S9TJZ#-^fNYNX2_.1aDdTL/O.W@dDdO/>RYWWK,(dFB7(:JPX?8/g_U
F4=FBa>B:Zgd4[8e[a&NI[.S4HL3<2H<2_#0CLFSA3IA42)8ZQ_M^f<U<8#I=_ZC
\Lc,AUFBa<XMKB83OBCT_3#S&7W5+IE/VZ<@:;&]FORN:N])4[@14M7\Q0UX_MPD
b.=K,6VYG=[L]YJS?47K,@7([TTN/AUSEKI(46_6YYZ=E/4E::Bd=,RBIHRDSXEb
?08.NbRYR?8IW9#H&gJJ?5+DP_A3Z<WFOd]]G5^O-T8c?JcK3<]NWI[^21M=d:Y9
Zb3.b==OGSCaK6T26SID]4:;aecJa[)N4\>+^T6IOX0:2OZ+2-SZ(_/+&+#Kf,^#
RJ_@G9;e4S9\f^4KK]KV(FLGCa6Y[I&568c+9(E>fGODFN=A,baJ4d4#Y;Q59)1K
[Hc-0<G,==M\9Z3fHBf>/&9,d[M^BCY;;FeN\ZI2ZU-]S+Ca]<d1E6agCXX@<g9/
]7>Dc:T:]=NI&GH:YT2EC,T24+E26K+V#@<FeJf5K^BG10:8V,GY517,7\IT1JcC
bW8>ZbS-;fL1#?RUA,-1+8IK6_Mff0Tb3]H1_1#/574BPM9Xb/.W>0c9YV#V-O-Y
\:,e3^2Q-0[QQe=KOGX.f.VPM9#aI?2\dSgg5/(gM[@DNMJ:_@4b.P]:NUU@A>@e
1b^0.BXPT^VQ?dFHT.#\ccce5O1>_cKYFb=#7?=OC018DM;.]HFc(ZGE5eDAVGX[
ODNINK[e,S2W+R_gP/[HH_>@f#W()&=8-0C1)S1gI9b?L+AHHSb?edD5eT[&^aNA
;?/>3,2J3K:-MAL74/&7I^Pg@PN)Wf1\-0+F0_EdE3>DE^V1R\dS5<YSKIYGNNB9
Y_I7:[U8V,(+FUNXOW603O0CU[<eHg>EUV9LB42C5LY[0,\N9)I#:gHOJ[^fQ[\;T$
`endprotected


`endif // `ifndef SVT_VMM_TECHNOLOGY

`endif // GUARD_SVT_SPI_VIRTUAL_SEQUENCER_SV
