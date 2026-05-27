
`ifndef GUARD_SVT_SPI_FLASH_JESD251_XSPI_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_JESD251_XSPI_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto JESD251 device family in sdr mode.
 */
class svt_spi_flash_jesd251_xSPI_sdr_ac_configuration extends svt_configuration;

  // ****************************************************************************
  // Local Data
  // ****************************************************************************
`ifdef SVT_SVDOC_CC
  /** Workaround for SVDOC CC circular references */
  int cfg;
`else
  /** This is a handler to the SPI memory config object */
  svt_spi_mem_configuration cfg;
  /** This is a handler to the SPI mode reg config object */
  svt_spi_mem_mode_register_configuration mode_register_cfg;
`endif

  /**
   * Initial value for all the timings which indicates that parameter was not
   * loaded from the catalog
   */
  real initial_time = -5000; // must be smallest then all timing

  /** Minimum Clock high pulse width duration. */ 
  real tCH_ns;

  /** Minimum Clock Low pulse width duration. */ 
  real tCL_ns;

  /** Minimum Clock high pulse width duration. */ 
  real tPeriod_ns;

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSH_ns[];

  /** CS# Low Active Setup time */ 
  real tCSLCKH_ns = initial_time;

  /** CS# High Non Active Hold time */ 
  real tCSHCKH_ns = initial_time;

  /** CS# Low Active Hold time */ 
  real tCKLCSH_ns = initial_time;

  /** CS# High Not Active Setup time */ 
  real tCKLCSL_ns = initial_time;

  /** Data in Setup time  */
  real tISU_ns = initial_time;

  /** Data in Hold time   */
  real tIH_ns = initial_time;

  /** Output Disable time */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time */
  real tWPS_ns = initial_time;

  /** WP# Hold time */ 
  real tWPH_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time */ 
  real output_disable_time_max_ns = initial_time;

  /** DS output active time from CLK */
  real tCSLDSL_ns = initial_time;

  /** DS output inactive time from CLK */
  real tDSLCSH_ns = initial_time;

  /** CS High to DS tristate */
  real tCSHDST_ns = initial_time;

  /** DS tristate to CS low */
  real tDSTCSL_ns = initial_time;

  /** DQS to CLK delay */
  real tDSMPW_ns = initial_time;

  /** DM Setup time. */
  real tDS_ns = initial_time;

  /** DM Hold time. */
  real tDH_ns = initial_time;

  //----------------------------------------------------------------------------
  // Type Definitions
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------
  `ifndef SVT_SVDOC_CC
    /**
     * A helper class that can generate random values for non-integral properties
     * 
     * @verification_attr
     */
    svt_randomize_assistant rand_assist;
  `endif

  ///** Assign refernce of spi_mem_configuration object */
  extern virtual function void set_timing_cfg(svt_spi_mem_configuration cfg);

  /** Randomize all timing parameters in between declared range */
  extern virtual function void set_timing_params();

  /** Randomize tW timing parameter in between declared range*/
  extern virtual function void randomize_output_disable_time_ns();

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Constraints
  //----------------------------------------------------------------------------

  /**
   * Valid ranges constraints insure that the configuration settings are supported
   * by the spi components.
   */
  constraint valid_ranges {
  }

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the configuration.
   */
  extern function new(string name = "svt_spi_flash_jesd251_xSPI_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
 
  //----------------------------------------------------------------------------
  /**
   * Method to turn static config param randomization on/off as a block.
   *
   * @param on_off Indicates whether rand_mode for static fields should be enabled (1)
   * or disabled (0).
   */
  extern virtual function int static_rand_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   *
   * @param on_off Indicates whether constraint_mode for reasonable constraints
   * should be enabled (1) or disabled (0).
   */
  extern virtual function int reasonable_constraint_mode(bit on_off);
   
  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_jesd251_xSPI_sdr_ac_configuration.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the static configuration members of the object. */
  extern virtual function void copy_static_data(`SVT_DATA_BASE_TYPE to);

  //----------------------------------------------------------------------------
  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

  // ---------------------------------------------------------------------------
  /**
   * Hook called after the automated display routine finishes.  This is extended by
   * this class to print only protocol kind relevant fields
   */
`ifndef SVT_VMM_TECHNOLOGY
  extern function void do_print(`SVT_XVM(printer) printer);
`else  
  /**
   * User extendable hook which is called immediately after svt_shorthand_psdisplay().
   * This is extended by this class to print only protocol kind relevant fields
   */
  extern virtual function string svt_shorthand_psdisplay_hook(string prefix);
`endif

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to, based on the requested compare kind.
   * Differences are placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is svt_data::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(vmm_data to, output string diff, input int kind = -1);
`endif 

  //----------------------------------------------------------------------------
  /**
   * Does a basic validation of this configuration object.
   *
   * @param silent bit indicating whether failures should result in warning messages.
   * @param kind This int indicates the type of is_avalid check to attempt. 
   */ 
  extern virtual function bit do_is_valid(bit silent = 1, int kind = RELEVANT);

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation.
   *
   * @param kind This int indicates the type of byte_size being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in a size calculation based on the
   * non-static fields. All other kind values result in a return value of 0.
   */
  extern virtual function int unsigned byte_size(int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset, based on the
   * requested byte_pack kind.
   *
   * @param bytes Buffer that will contain the packed bytes at the end of the operation.
   * @param offset Offset into bytes where the packing is to begin.
   * @param kind This int indicates the type of byte_pack being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in all of the
   * non-static fields being packed and the return of an integer indicating the number of
   * packed bytes. All other kind values result in no change to the buffer contents, and a
   * return value of 0.
   */
  extern virtual function int unsigned do_byte_pack(ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Unpacks the object from the bytes buffer, beginning at offset, based on
   * the requested byte_unpack kind.
   *
   * @param bytes Buffer containing the bytes to be unpacked.
   * @param offset Offset into bytes where the unpacking is to begin.
   * @param len Number of bytes to be unpacked.
   * @param kind This int indicates the type of byte_unpack being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in all of the
   * non-static fields being unpacked and the return of an integer indicating the number of
   * unpacked bytes. All other kind values result in no change to the exception contents,
   * and a return value of 0.
   */
  extern virtual function int unsigned do_byte_unpack(const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1);
`endif

  //----------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow command
   * code to retrieve the value of a single named property of a data class derived from this
   * class. If the <b>prop_name</b> argument does not match a property of the class, or if the
   * <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1', with the value of the <b>prop_val</b>
   * argument assigned to the value of the specified property. However, If the property is a
   * sub-object, a reference to it is assigned to the <b>data_obj</b> (ref) argument.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_val A <i>ref</i> argument used to return the current value of the property,
   * expressed as a 1024 bit quantity. When returning a string value each character
   * requires 8 bits so returned strings must be 128 characters or less.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @param data_obj If the property is not a sub-object, this argument is assigned to
   * <i>null</i>. If the property is a sub-object, a reference to it is assigned to
   * this (ref) argument. In that case, the <b>prop_val</b> argument is meaningless.
   * The component will then store the data object reference in its temporary data object array,
   * and return a handle to its location as the <b>prop_val</b> argument of the <b>get_data_prop</b>
   * task of the component. The command testbench code must then use <i>that</i>
   * handle to access the properties of the sub-object.
   * @return A single bit representing whether or not a valid property was retrieved.
   */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  //----------------------------------------------------------------------------
  /**
   * This method is used by a component's command interface, to allow
   * command code to set the value of a single named property of a data class derived from
   * this class. This method cannot be used to set the value of a sub-object, since sub-object
   * construction is taken care of automatically by the command interface. If the <b>prop_name</b>
   * argument does not match a property of the class, or it matches a sub-object of the class,
   * or if the <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1'.
   *
   * @param prop_name The name of a property in this class, or a derived class.
   * @param prop_val The value to assign to the property, expressed as a 1024 bit quantity.
   * When assigning a string value each character requires 8 bits so assigned strings must
   * be 128 characters or less.
   * @param array_ix If the property is an array, this argument specifies the index being
   * accessed. If the property is not an array, it should be set to 0.
   * @return A single bit representing whether or not a valid property was set.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);
 
  //----------------------------------------------------------------------------
  /**
   * Simple utility used to convert string property value representation into its
   * equivalent 'bit [1023:0]' property value representation. Extended to support
   * encoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort.
   *
   * @return The enum value corresponding to the desc.
   */
  extern virtual function bit encode_prop_val(string prop_name, string prop_val_string, ref bit [1023:0] prop_val,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  //----------------------------------------------------------------------------
  /**
   * Simple utility used to convert 'bit [1023:0]' property value representation
   * into its equivalent string property value representation. Extended to support
   * decoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort.
   *
   * @return The enum value corresponding to the desc.
   */
  extern virtual function bit decode_prop_val(string prop_name, bit [1023:0] prop_val, ref string prop_val_string,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  //----------------------------------------------------------------------------
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the primitive data fields in the object. The svt_pattern_data::name
   * is set to the corresponding field name, the svt_pattern_data::value is set
   * to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern();
  

  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_jesd251_xSPI_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
SK&-\f==PU6F_QR+<4=0_Qd6YJ59agb_EE>bY&@H#QO0HOFfaCfg7)aWMO.,RVVg
;U,1KZT6/L[+0f(:L34)\<T@U_Y,3Z?([P7=<?cVK^\:\L:a=IEK,@,T]D<T4O3e
/Q3>UKaF@.W@6BXI0+4[0ORAI0M6\?87HM-:U?C()FHM55O&J7TS;Fg?:N7c#b=:
-+Td+Id:Oe6=a#dZa=gFbUaM3=O/\):6?#107YJ;af:;1,UUA49<Odd,1)N,R[;e
Xc5g^LM</2WLWcTVT\ODQNM#d)8ZbUa)IF/Ubf/><3TQd-C-I/g9YbNg+.>P)[5U
^?H1Y8X0gcecJ[,;=[1g7DR7RJ)(g<G?(=0^V_XQ.EGP@ZZ,MeRd&/5&YT7<Q2,;
S0d>4_A&(HF&#d<0DV>LB\IP&D(H7adL.BIY^KQ>RY1BF&ST^09eXQ,5N20Z7:QW
GC:+E^a[/6,e&2egJ8c^J]b+?]JTgMNc^[KXBdfT,HTXG23PA#8R<]O\X<X/BU<0
S.>]6b5g54VPE?Le^,9D[JAQ9T)DaGE2_d7Q.D0,+LT=5U3Wf,YJPd3KU\GJ&S=Z
Yb4SOeXG>ZXT9-)a0EEMKWQb3bJgM;^bdZFNAgHCYA?9MZ)(6.?6&a:<VCFNeXSZ
[=T;?&)G1ZT5<3d:c)(bf);0P&&?)-PPMWV@WXEV\U.W&)c\Y1G7,]eA]]X8#N+7
UJA?EXGD\a,aKg7Cd;=.Z0D;[Z(;#g0bA68+1B66PaRY]R&cUgQ+3TCFJgL#7AAE
QD_OMLQT3KOF]QA)-BZ9F\,WFAg5C.P87<>?a[AJ9>1V60Ag[c9C2MNMKQ<Z1#XLQ$
`endprotected


//vcs_vip_protect
`protected
Yd-=_2ebY,fDSeX[REAbb=N3fCUCFI9=e8_CP;N2[:R@3+T8J\T_5(W/A[4GLUJ.
Va-Xe/MVDLWebM\QJ_;J0P->N^R-5:H=JHb^bBAV#7_7a4S&]QLNBA[e[]#0XW\)
bW8EWV[(Q]&<L=:.3XXWgUD@HOT>5FR+1V(.;RKP0S>>K>a[JV@#]QB.?,T&eVPA
O?#]W)H@UTIeL/D7S:,LDffY;R.fg1_A]UDb2&8M>a,3dZ_3T3[[((C^Hg@fI[+0
GCCDBL#O=XS,T9Z./1eU.&VBBN\^H2;VW)I+RAC1-X5X8\],]9ab[Y418;<b8MMS
g8T):,bAJM/WE0.OU_(e:#[(Yfb_@/3?>8N1.2g6g9WEO5)Q;-NfU86RRb2)XZXI
.^TF<):a^ULD7LbMD6R>Q)Z[]NWUSfA?(7cgZ0ZPZgUAL+6#8J[1>UT,G>T<U.YT
Ef:HI>LGDLb-8JA/0F27gK^WD+aVKSC:3+\D/G,D,3_[&240O#4V5g?a=UNS(S]@
a[(>bY<;/-SR=?#X-eQ3M^ATQ(CQH@d9@[J/#K)9M(_,KRCIGAF3&U>KVcK3gOGD
^=(Xa:>/2K-(N<NDOTV:EPPS3/MHYL]0:-N:\Z0_Y=F/_.H8@BK9.-a>HD,cZER;
Q[M4G]<4.ZKEW)VDU.E1-QD<G;9#J^b:M,[-764=#MO369PN97^#LS[eB6D:)_&-
<.E,gJeUe9)LM43^J_>1Jdg\BAJV)HbCANYdSU]5L2WOVJKEMYgF_#)GXMJ43.[3
@72=&I6DcA5=Z5PDE5;d].[9JK8P>63[PaD?9&LA?=>LXL[SWFe\4P1b:=I[Gf;/
b)Cfb+V;gg]T)>gWF6AdJF5BYa0D,Ne=1R]gOTNZ(UbM.H8PIa\bfCV&b3g;f2<c
gX5)6ILQ3/Y25b4R:_Q-ZbW4BNX=4D1L/-W;a8V;Gf37]\RDJ^HJ[A=[8L),C#B0
BI^S=56C6OOWTO2SfgP<ZYeLE.2\D,#;e\PYORdY(DB;/CU.7b3^>A&a/[b-Hg<d
/C[_)b[?_I-2U#<2g5#8aDCb\aN_e(T\EXZ9N)X,QG@SB6PY/:S>17R8fb_#3=KO
c):4AMJFY31X@8,MfQ,_R1ULI<];46.Y3aFb;Qdc/FQVb,f4--W(M,)4c6I-@+),
1Y7TU4E1cDQJLEQ.\Qa_48I@10=68PWV.^J:O7C7JHbAPd-acd0-9[:34gZ1cYBN
1R=18J/CT+d?C^4);D/MKebD?cP(O=FJ8/0eReb[YTHV@G#I&7/Y1?<a2P<&^DQJ
;/Me([==7bb@QT8>_Q^N-Z[>^J_Z+)fV>0fV4WDcCa#CI=-8M.bUG^PZCGZQ<=5Q
67.g5X:DL=_LgHI5a1]e>9T?&Gb)C^<@^:aJ:J7WdHcV9?g,^#]44dJW[c2f[a>Q
BC)N,O.#-Cb3ZE2K&MSa.Sf)_<?=2B#DYEH(&A]):=BOF:cI8g4Tc5I)Be[+a9&\
dZZ[g-d\,O3]7NC3F-GZAX[H>V8b_\1=:Wg03#HDLH7a&_.;^2]>a-L14>M<ZFB/
/VG4d8IM(2I82Qa4MUI9;7G5(9A@?PDf0H=QV_5AWE0CT[g9W.a+)9;_/;[4A,9Y
\3NUI[QKRYecP46#Z.cM=]-<()]\7#QVGK4f1USd?cS#<TcLS87e4)CeHJ2(aDC=
ZR/X?7LY:Mc,NUW21-,)3c?-]<GQN8FMNFFQR>]#7dAgI4f6\FUg/c0SLTb-GDAf
RO;^H^&bD0=26+bU3==[HAMYO&f?WPQa;-)ND\3KOg90N3PJeKDI[f@b#d<74H.R
7\OQR;3W)J;-88:^8eD9NS>Db;>[+&WLT-OG2S@BV-Y,UUK>\+7M5gad0+UKbF[^
WL7FJ,cfG8Vfg:R3#GQa1#YaeTJ)a&KRf3;M4?.XMP;DeA@gYNI,D]gXN&HADW<g
<TEM&@)45@(1?Z]eJM]KJSF_gI[B]@L.d=03cYCA>+Q0>[CE/:f6R:/Q6:[\c?BA
QMEMeT?\f.d+;G+Z#->1gc63W2]]JN::KY0X+eSD1-LZMOfXJc=XA]+4ATXYcBfN
X4F=/.NRM/8EPM.#gf6E@IIfP2]-_;+d?gSKW^4_S6;98M&F7P3)CV3)UMZd#D<_
67GK/\fX4b\Q>,>][97+7R3Cc96:9VLaL_3#8ZbPc3#>CEG\^D>9^2SLF2G_WS5,
1M-E&=E@96,+YD4/P<D7TR#edX+IKY)E2&Md0:E9&T#EcKEF)^N+D9(dGFRI8+1>
<X2)X#&_9,R/e2)?A5CP0:E+3VNPRH;C&;@d[)@=?TIXD>]dA77N9PWEFNG/P]MR
ZPdU,D:,KZVVIf+67_15bL>QDJT+W)Re/-#DY:;4&A^2K3U8B]J@Mc[d[07F<PCW
aRG2#IVc#EfZKZ?IT4.D5IRC_/>BFI2O(LGN0VCRI]gG_5B9-Z;^R0Z/6TKQEDU[
XC>Td:UA73LM.::((0?HQ<J=[NXX,+J[U-c9&/[J7JfP@W9:D3J:,d?QXXN^2WDE
#S<-:>6Me]C]78f2FSCL=50f4=87I8Ad?^,YM+RWGa4<Z>+R-gB10D-N@Jc1C:7.
,DRd;:3LBDUT\E0,#7GDMd6Y49E#3B)\K_eH[JCA[/+gQ^,=,PZV9[aOXN3?C.D-
C(g<N?-<SP0ecGC=Ca9O2Lef#^f>;_)#8UefF^7_,=DF#W/#2cN\C/ZSH3U_G6>\
D2OYNgG2<BB7/\P640d0McT/1_,Rb1b)D^9U6OTANdHUdFbI[+K#:0]#6=5=aZ1H
0-?_?V6&I;Y3daUK:5Qd@+VT+N)>;?e@D8fC&Kd3LUD_?TT#c=7?:]55PWDU5,NU
[8cAG.F[Rf8UaR[:>B0A)<MH)Q^AGfG.93eK@G4(dQ+Q6bZ.dPbTNHKGS8S>c9^&
gWON7ZDG(QY1W.8d,>\Z2@F#(>),EC/6-CbG\)GX43a>If;[CdJD(WOf13<b,CG<
:R_#U9+CH>S1/F5()[7XDRe.B4&HE7OUNWQ2;VWF_dI4?Nfg?A_I#U]81IWdDEP&
)ED@bWK;V33XVK9,U16N67NP6SW;c2]M2\5H7FegfSAKFd/Z?;F)L_Y=)=PVN4_2
@(gaRdC3#RZ]&I:JVX+[#g-e^=S[C,78LWX#O.bXS3DZ?&4dLPG4[H)&9VJT^5-X
NF08)M3C&C1Pe6H8b]=_eYd1<7+J5&+cT#faOH?AJ3QTG@[#O2B@VUMWRKJ2]dS)
]);LA7;5.[S,#N=f?^FU04H=8D=eBX:?__c_S=^_X7S;)DEL;R<D#5.OB9Gcd<Y1
N.cXZB0Z0>X/<2WL9d_Y>ZBb2E;A^+cTJ.82SH0FIH4GL#fMgRZVT7JY^6SZ#7+8
OQ/)I#fJ7.IRBCRWH5R5APPAgH\/7[8fN5DUPU6aH]R23Q.K6QPZ1)0A/NbEYY3]
,;QbJc=J\LHI9B&dNb5b\U4^RB=7VRf+1^Xe33XT8>1A?a(HCQcDW3O/dJMB8/(Q
a05)>MCAYL5[dVGT(TV0T4NX<=NZ5<ALbVG__^KPDV\;[J740[PHcZE=2f4)(L/P
)94WS+d,Yf_GH#U<O4I\MacbF(#\,)/>:QW5A2V(J@8T:L\3/:^(A9\?8bPT&EHT
8(<+g4-=4d:3&cFSO&#f0+14LFF/F7[93QUU[TCca3NSJK8@J/1PA\fIg#L&/e?^
:3EeOJO+IeI5;GC1<8XIHZ^g8F/gO_5QQ.:4e_QQZD:GE2D2=JO#c,=28/Qf\FE:
7BTfDf>N(GdJc@Q)QP.XY:<-\IMXDYd5L9>C<&6D6S#I>#6&:H,=F4H=03Cg/.La
)4a,5<JFB;M9b6ER68_=3ZFa5.,e5&J/G]B@T&J6fb>W,9W^YV=>NGFg)IdQ/O.>
c>:\g=9-<N2J[f&/N)-_6#4=U7JT@H/:K7Z=;RK)[/eO&YHMc1UR4>]5A5CTN@b6
@]]Z^;0A.+;AINBU[+(>+LF?b]J?OCcD:GTQ?NQKN-gZY.#a6WJ-\O_JRfM\1gND
^>?Q5N8Gg;QC.,Cd1-DM&2gR+caY<(E;<Q02KXL^PCVGZ[U/PDA.g/<[6eS,#-G^
L^(U\:HEaUNY1)IP(<JfR&aN-MT..2f^.EP#\;0&^cGM4Da0;LOYPZD.IHB62@+_
DI^Y97):Q6XK^8;&-8]S/P;RJST2SS]]OcJKR/>Bg@AY<9>Iea1?6RV48baYd<\1
aH7=L0PAF/7FG7SP6V5:<7G.<H(XD2JL;_dSNQf7ME&DX:B.<(]HO\KJgUUa@e8T
JO_II>[-G??fNSTQK0X.=-L?,GT^fcYc9J1Q[__+DR4dA#aZFO8OO^9BB4I?IH3<
U2?c)]<N:?RaHGING.<GEe(C&(Lb5WfHOKJXTN8_>fPX3b[#PYfO(GHQ7),.QJ>J
<-?_)<82Z7QX-.0OOa3U5#SK5H;Y>0V]:J&OJ:+:40-UPY5/4,M=G)6R7Hb?4R8I
3WXfF?IJ?M#/]3SHcL.DRQMJ/ZbW^4>H6TG,LJaH01.GH8L5cB(gb:3IXL&Z6Y2?
U@?&;6F)P=F,B>bY-A5T7<USJR\3=Z>S41D7FI;Cg7OJMgW8CSR#NFgN;)RI\:7W
9-4WA@cY2H0=C(@P(B?M)6[OM7e?g+.+19>4&X-f&?/,FK^^.DS_LW[0YG,P&U@\
fcH_FOeA,>g7R^c.LE;S1P+;2@Q\LTd8S3]^:4A<U8?TaXeSBP3bScMVgWT+UO92
(>VP5XY<II/N:@c796Yc6#2e-ffU+T8FHBO6#aRUL&-8B_+QWe-W][LXWPPb,-&:
I==eY(>NR_LU^L&?FMc=F@;JI#AS136+1<C-5JAf^SaObQZ&A>aR?^A(C4@<Sg88
92dGM:&@N/MTbeeW8\VB>2WX^W&F4EM3[@5O]N[b9E@AJM4TUFK7I8-O?@.:E;2\
.V8EG4eNF7>8#e];[>6Hb&#ZaddPSdZa?af9)7&]gcY.J:Z]fLD+C)-41S^CW:Zb
/EaI0;EgWb.cFc)E)UHGGB@)JP9+:4T@3S,L\6[IV27fQATPX9>+#P?gQS=_F@49
^K_4.R6JBJM/HaX<Z5M-2K7UZe]bgLO7A]B1QH/=WL2E?RGe7JKNGbV\#AXH]E=T
;EK8ac>-H(R49^McS57J3PXY/e)+Z\bZ16#&@a;Bc2:H216NPC#PP&9:4(7/3;BX
(S6&Lc6gWKI05fAP^=BECRbGa5BA.R:VJ7Kc/0Y]>OE&b?(W,;^AJfa,0Cc0_(+B
@7(b+dX&:42Z=A36/Bd\807YMCe)^.-X]TDRJ#.(1aLA<&71EIKFVMOaOM0d-0^=
,@YKgUJJ@<X+<W#/NcT35NK3R3gXG<.bGT[+2),02+;b;ac<7ZL[[g>a0.9R\ITW
FH7+:4b]_(+IU;-ACL.20R?.M(MYQN#\+Q#:;+gN]8,U:K&5WbZWfT<T[U8+eaU6
U^e>5@)]=;OM6.JYg90daHXI^J#R;:(fAX5;eaEfTWB3+:5^2:I::Qa36S>W2X2d
SB1-P_c-0N1J/CX?:ZSZUQ&NO8UJ[Tc_C12X3W_bM/REZ+[)5:\bUR.#RCW5R)&6
:>1SLC&RTI[6?e/g8VFa_DBS31>5Q&H7OFPH3K8_SHbRG+^DYGDfPZ-B1;JD2RPd
fK/aKXH?;CE6QY+4[>R@ObEECSYMUJ;L-@\;I/HNI8I1fWR^OGd3(W)BL77NAdTb
e)]b791fN11.Pe52TE<RD,&;3ZU5QC](S.c^R\L6f1X9>MI::TX;5@+dY(BeMcC<
.Z?.(715KQ9@LKKKG(fE49-(KIAPCF=g9W2d#4@U7ZVc3>:Q2gB@:V4XbL:6FZ?;
WB@4HP_<d/Q_F_LI^9,O-P77XJC^c/0c7.\VFF^#^-)P^:\<UI\#9V9[GB7#X^[X
eG@JI_)HFfPMeD2?071Q(2XWLR;V\d7/TE3Kb.,B<-@.\Ld7If#;IF?>e[>H(T<2
K)QED]UUB#B5a3g][=F\96&3=/G2_+K.0Q4^3CeN(M]1S6W^I4CCZRf;7WPJ[K4N
JYWY@5)d.<+g19(4;(C20Q6F4bSQb((d.<74VcMGa6WeTQ,Raa^a<)0Q1K5b7Q?E
E2(:#KV+:g1-6[N;MY.C_Ic^A40^/?=.^6<@3,L>IeZgQ1;?;IW3K^;\KR]d]B;X
dV2_b,W+MSSN.X[2#SN4>Be7+V#e]eD<0_><>,^[5[YU:ca6O#YGV?FXB\H,)CVH
>Mb9+]PbZ?E]_CTM1?XR5LZMC\_ZT2P1)U]5T_2M8HID18&I@,&P.C^J1[DIETg-
<0-P7DMce]&2/LFFAYY8Hb@S5,O7/&H1?BQH#-d)FQ92;T&_;I;TKAWO),FFHM(\
R\Se\#a?Vd#Eb)IgbJDeH7/5FNJJB::@TCUSA4:4>=C,&Yd62OD&AMDQVXf0LF#>
Ka(L]O<Z1^?53/I6+M(Z.J8&FG+)Ia/D3YCV@R[0Ga+&#0VU\#0@98.F+LH].19(
OaY&_6ae2^We6Y1[6<Pe>d?V=F>.I4D^63gQde#7,\T>G(GB9/)N1>AMB;e0WX3e
^e;(.6a0/W/NPN)eL[[YVI-:-]A?d?OX8SG,EBU;LX>_NKWe;f&05/XLGVA\ZGg[
P.Q/>H&IH[S[=,:dZC6b_+]b5U?:RF-Q9-\PK(SZ^I+,EY#+5GDGLec2GJ:X3K_M
R6XXMPE?\IB(HC,TEN^3Q\e&#PJLS(67NBTE[7+8b3)<;^+P5@?N-JD6;RS6I=,N
I8.4?Q.\SNQN?f(#,Cc3,#g]G,U_=6\7VaI?#UCA0W(.[=9:JJ\]O4P1^X+#bgSJ
Tc<G4E-_6FUdZ4@fV^#>d&fT=3M<04DEL5-UA2>22=?7Oc9_VVL(,]SDG4K?SCAF
(@UdB0#4X?g^DB<M(^)28<^5WPK]Qa28WE/Se>D-&M.F8C9QN6W1e476P3^VHPgI
#__GS:VD\BccT4&c84@M^QM67Ub,@bN5SU^,dPY?/1[[:IEgS;\UWF/T5A0U5E0>
d#X3dL)YQKWXI1R/5NK;<E7DdFGa90/#]3(b0Y7/Ub#gGZf)HJcILOP=0&QY=-TF
H_:2PL1EWP#3W4.M[VKPH/+L/(E<D_DP4d\X?A9?^GOdbS;>K[F;(]8KRaC#C5-G
9+JC7Y+6B/Y88e@^_KLe^dB#V,?PgE;_6](HXRf;F+UCd)75B[PdT0]_I/:ER9QL
M[9ZLA90YG])9aeQ=Q.V)Q(6A]LCc.QZ8/X-Z8U/?@[LcY+^BCWc3&B4Z?5)7TE@
=A/)5,G62DRD6EK7SSVa&U/@J\bB01)OaMLKU&8&<X+]9^;@\,&AYGN,0,X\/UMg
fTN)(U+V+/3#JV4J5IbDHL)BGD@,I?T^3AGON97;;V-GeT[3Q/,=S2&f9\1He6OB
6=d;Cadc-),I6RB3;YV\/>7bHL&,1d.Y(.X[4JCL,9dcPZK<K[Q=ZD9>b2T1f/E@
85+8.&7WLOaLMAf_&QCS39</bWa#D\M7\KV:U:#ZXLAGHgWfCbB=YV/R4IB7>16c
eB6#7bKdWf??U2O<F?I-\d;9Wb87d;X_2P??-)QK.KN4gXF@(IO?,+f\QS2VgS5W
4_PL?b;/@&BE\HF7\c9L7C4Pe@5\/-^C&IPf=^C-U17YU45_9<6OZ5@]_7?B^.,K
:L@,.:<?5D&Z->JU65DYSL1BYP6Q453(;c:XK7]Y-I=X93)Qd<+dSN+00_HW<5@g
7@/-/e._[HLTEL2fK1JcB527f9QR)4[,P^FZODDQPD?V=g\^@dO0=daX(F+.5KEU
T9.gVfI?5&EARL.JOd>/PF+ebEL.>R>SU8&930Eg9),VF>b^Q;\c=Pd8LH8R2,]-
S2Ged3YE2/NSCS-MJ^V^LIbPQaSLQ:9DU(YAaX6GIDL&8S/&R;f_e)0,\UH.M4^8
Cf^I^XJ8\TFf?6NT]HFGCC4PH](ERA,I9\RP;-]=b7V]_>),M^:DBMeaZ5E>M)6[
UV\(OQVQe4P4M=H0C((^?MJRce/3R2,)Sg^d?4^OR=V01C30W3W554FG-H)\Hc[(
BH&^Ie((^G#>X5#<(6,436H/Nf9/,Z8NeRBXSQA<;H4QTF)F_8UG66FM51D<?T27
-fFab)^>+0&A0eZIV8,=3]>5Tb/-DRZ2ZM7Tf+]SdQ6>14D8^Nb3)aA]>H@;9Tc]
MHTT](^Rff-Ub9@-9IB[gWO?U]a1g6;<C)>bK+4HeZKbAU8A:FW<=@FKQG+BR#(]
Ccde=F,4eAdJMN1(IGIYL[,A\<R(<e8>=+M_W-bNL#&dR&8I6)#[G&QB27cB,X2I
6&+\VY.J80+A#b+\C+.+1T@_WG7]0a1^[fg^:98^O3MLR(dYMU,/L4:fN564?5XW
e=b#dXY2+6[NZOeFB?=(RU>U&(\YA6?^^88Y1Y<ROK4TY3<==H]:a2:[L5YO_QV8
b;QOJM(Jgg):JLO9CK=FMPJ>CAKF4+Pc][3:=Gf#fGddU]Wa-[/VCJ19DeZ;>5bL
OU2H=6[AS?_Q&SHZf:8BeT32eIC5G5VKEWbcS5BJIHO+8_BJ58&fa6C,-KNc2aL7
&;+A/J:-K)6P03b5M<a2+<;X/@0XR35HSR,PB+0^]?)^ab]4G[/7;<?(O9d=8IC.
S2;SdQO3Jc^J7<I:ge:ZKEUIY+VQ4a>7;.,U/Db;8>7^;f,?Md@(8.MFVe2=T\_R
<&a2H&2XTEYd57;-+XbPG?P#dc/[]d0Gd;2aVfGMa\H(C,P_(MJ51LOPPNDMAL5\
BCFeK4F]I:a5-RQeF;2@F)PY.a<Kb/IQI)cCd9=DaJD_egSeW.F+\:=M_KJS@LV?
&V3[\YZ1XO.SS5CYJO(GX&=5?QET::WGce_W&PWdKCa^312R2S?/RaMdI35NEbX/
ceNRI2B)dgE4]F>A+?FTX#FY85>7(G/E;7XT-4T57AZI,S\1H?)M^,bT4HN+K=30
c&ZN_<AFQKFN,C/G:17QZ/A[JbR;eD6B,P+aQ5]4@a3NUU\@?BZ[N7M6XH:-MPRK
7U#fK?,b:U-,fb]I_MX5Q=,NV<PH5]#+]T>S#c[SJ.-Ya::2Cd1OM-4)VJXIPC;(
?:PD6/Y>&QZ2UgNJeaJYO1.DC+Ed0QHLE[3MVP.J4ZYQPPK&#bK#]1OVE]A)OGL3
^=3><(?WeY^=)LE4Ld@WO]4Z:=:#8,Z1YSSNN\E47#Rb<&+.baSaM6O\@M#Sa-H@
4E(7g.[]NBXWL6GHH6Y_ZMe=K\+/5P[C9U3V#[dR^EY];&-Q-(BQ/Icfca+)E3RG
7UE[E@-&GW?g0=#c):@@Cdb/9^8GCHWEbab?AecEf_OP037J6>9VaUIG=1RO;S(U
M,1:SPR==B5P1F-/II(--.DEKU[QNIOWL[GbGa0GZD;-(?Y-G]W>](.B.10#QWWB
UU=Z346FBDffL?;+1G058D),()7g]EHYc\eFfg5G1ZXBJ-BACB=+c[9fc,6V9G\F
I1Y=eOgE\dD--:+g9)2XX<KRR37]_ge_<e4)F)]^.Y-HDZNeO\aXU<bIdA2S8&B-
V?D>XTK4C,=F6<NeA;b@14.2Na.]CcS1c]UMTL;FMS+B@3;2LVR=_)>325.Wd\P\
F0_BSMLACg/QZ.e0=BGc?DU[C+D)+D_D=@YIdbKO]XG;5<dAGD62a>&D2&Q2<E;T
(O5,dK(:c6,ZG3]?#QVP@?]^=geN+=TReb=dV)e8UCNc0NGOYO/a.7<APE?=TUIJ
Rf^0CdAMEYV>R_,/Pa>/SR6T<+T#H&6EaA/R4?Q5U[Vfc9ILGeg6:,;;0P+/=HT/
754)\W1f,<DFG0.^6C<[BOVAbUUc/OQJETI1.,dW@1Q.X7(AQG:=f5<ZH->9J<S=
-c#1MGgVA4B2c8J@C:PRRgA4VZTX6KLgXZSZHe4gSc)+7#Bg-G0Mb79?/)Tf)<RX
[?^PETS#JKb&8&dYf_P5ZT0U6C=Ed\7D=VVUHLb(TgOS1D038F0H\@1fLdL4@1Bd
aEU/-7\DBb)Td<_=>S0Tga[2)f?TVPR@db#4Z2?JaY3ES(HFW6#)=8217/)dMOT>
caI?J>K,KF;0a[XORW(M/:C8^@bCMLcO&]b.8-(VI8ORR3QaC)H1>]0VT9dNJR-#
Q>=_1f5Ie_gbaaCJ]2GRX6bWKJ7ZHZJ\C]HCU9E^b,@<7W\4f@g?(H[>_?^f5a+G
9=2^Pd6Y=\R9+DD>-\A,XR6.94^G2O,N0BBf&5Dc/--@EQ=:7QLd__Z+0&07_@^\
_6+XYZ#[Y5_Ze&8=4TVB.]R/]AEM(V9:g0_/M#.VbP>Q\]SWL[&PE?1K[@0c@N#L
HIJPE@F72.IR&3(&0Xa:]T+[fG)):CT5Hg<c0H&G.]F?^4HM[\X4^^ZMXJ1V9_>F
c]Sdg70N\\HF@646K\8;AaL,9J7>,YfRH\;S=eD_a#8b6cgR[g=UcIMA_NOEQ\C/
7#E:c,XG92Q;I4C]S)gAV03XBLcLI1f#,CX]0@>f9<)/8SIJ6JZE8VD<3@:b=-&L
0PL^?K.bOXa3C25X-Z,AEX=bOL&(3@JfRdLPG_aYZ?QZV>.T[.=WceB4S82L:+JL
4^T809X,PK4P;<,>.XNQ93A,H>(bb21Ifa=[KL=GBPUGb7D\gJ7GQA+&3GgFZYK=
MUJOQBU?>1FR>BO0VWJI;&RP:J0284BITf(-.&ILK#Ga/c<3MXC4DZZE&T0V>VBF
F0N[^829#KGZ^_IJELL9Nd3VFFU>+&edK-2-7?@TKMHF2N3:@=[C8NN[E;-?Xb6J
EVMZ\CUEOBX2f@;-9^LNgePJda:1P.U,]?#6-Z2+4^)M\g]6\5K#3_c^F0,_)TFd
g2)AF0b4_WK9.gQ^]O1;d_<@J?PO.J0G5O#caC7B-T:UFL3VgM\6__J[VB(4)Z&P
TU.D4?N216T+E_3eHZKRT=-^MNPRM)eYOWB_@-+L2D[0KBHcWV0[5Q;U1R\e#MPa
C7JD=NISGXcB)^,(.G@6256M76QcLWK#CG,R(,((acW@1]_<b6,B2aMF=M8<:-T4
U\P-XSR6_T53?26T^]B+@(\LfJ64+;c:2E,Z\.^6JM^LNKN?43;+<BMTZ\?19d].
+aZ=A?MUT2+\OQXWb#MMU5OW1BBZO7F3M^NK,.gZUK3UeZ6U[I:QeOT/^24D4@@R
f8Z\IM<D,W8A3NK?F?(J]+aAaS\-<+b1@PQ4J#[H7J=4dVD^f5A]11FR^acRaB^[
60BR3bB;(3^[]FVgcPLT_f86Z>RR4dOWXg-(T5OB^V6\9RYUPS7S/Qa,1DI38WCd
TM#Gc8e1&J0X^V9@3b-QH^1Y6+65#J5&R/1877ITWf=S?f^QT&d7cY8+VfH+dS1M
&SeA9J:_.AX[L(DdO,R?A5bW&S@Y8-2;)=\\1YV:18Ya:YA<#UBe_.3_;UbY:W:K
J;>XVPeAZOYTNN&;D7/89L&SNfX5K]#S8(A^YY5#H2/]GAB_B>c;\/J1[H=:<1]U
d-A^CBbO9CNB?+WHF.1_d?6=0/Q@2c9Vf9ED?JL)1Ab?9bW_7YK+;AQbX^X+HaEM
NXAT8N:-:cH1N(+&5Ze+<ZM__AHPJSX6;\bE@VM-LB]-9gFG/J\.2=f<LBf+Y-GO
F>W/D\N+UU;a,eaGZQXYg@B\6O@Y0HfA+(bLJ^3;Q=c]/FT35a16@H+2gPdD651f
QM8.>S+3Og2gU_MK4]:.:U6OI9d]@8?aB6A<^=6,M>0LQ.H(3GK:15.(P^H+g,Z4
200QZ6:_6;[E[0083_SZMTSa5P@KVJZ>?R_b_1ebUNTC&Ce&6P)P2U18Ig0e8IZ#
1FB<];IGBJGT_Q:R9c.QT&44bP1Se_bDS7?HG#(#F_/1H,))A_L0c:b#TQANM+ZN
N/VJ9/7e\?1\,P3dRK#/>/MGW18V@32#gVKM;H?0OK62DBeX4]8JeF\>C]/a,APQ
Y=^5_Pa=7,ZTLPe.IG(>fYCfg2,<CZIXI2/JM=[f^4]DU#EM-DGF/P,CXegJI^&3
QB-TA:N96DNOA]AB0;5>^a)##930#?B6EX0d)be2J,(=.&16cW4,_K@@F0.7093M
;32=>aDI#;M9DQQ@Pg2H:[J+WD9&L5TWZA-=E066+=+H;89:@GAJbeEU[DLB:WF0
,=Tb9/L@c]N?G/^&=,6K.#dP[DFVF?_]+FK#\ff(g/egJ)6DFTL9W(4LB[.4e?Vb
M0EWLON9<SFfe):_&YMS5b/V2K#JcL8F9E=GW/K.c6[09?S<0CN_D_B;ZU_\2V4/
;H,+]I>AW?^LFg0g;g@U8Y)R#GRb9L4=Y=WP,6<7.C[;WG/-,#Ra)\B1W=-YFG@f
4+a+EDd3d2J0A88Z[0=C3Q==fB.J3Z_G9YSCU<;Z3?L>Y&XcXB7K+RLRfEBD@M>E
c:FQ?>\&<0(H8XQ][;643geH]DE\&W)L3XEK[=018BaV/M&;e,6F:7W>ZZM(0,;b
8EcE#LSO\b0(^A9R,OUV5Pc^83-_9&C[Z8QH+CaM=D_K\CbDf?/#&VPWV8;O3GX8
MY?V7J@d,.[g@02^7I:B-A7<CK#-LUAK>@UG+X2d,0YB+GO?</VCZI-=0fH4I,OU
L?L=RbQ_D#.XQFX(_[SGT,5&4He\14d_A-GUPIa9@(b9T_HOVa.?cZ?@NT)-^@bW
;a0XFd[,4?.Kb_+XPG;-S)D2;HX.aB=C2>WBdF]DW6^gD[XI&/I.=ESgcU/@CPA3
5B/4K\N0>BR;S\f4@^V0/Q)99If#&6&&&R2HC1A1MSW[R[9#S<4g4)K?BSVf3@L_
H0J7G5W^(H+RBA0/IEGAR62#;W=e^Hc>fL@J;\>:59[H]3(4FT#]HFD;W>-X.[O7
QE2c20I).4+BU64]<1LL8L6,D\Y?KcOVD>4+9X-0Y/0@KW]+D2Kg4Nd.?[>Pc5V-
HY^L&ZJ76H9g&-d#[MeN\ISFf26XB(\7O5QX33Z.7[W=Ze^#Y9@-TJ9U/1gI>LWH
:18A\OXBf(c4/KX@7;4SA3I.7c_A[?^,Pg[_&gS3Q>E3QdPL/=+-YNVG)O6JOP@M
XRFER_,YCQ\PB(A0UHdC/Q/_R+S67d<\[?^c<N7S]\,5.gT)XOZKYO^UReJ8bL?]
,X7J7aaSLL]=81,#+a8R2^@>D3[7Uef=HU8BQ9I58VEaK=4]K7bR3]@9?I-A<SA+
EMDT/,GWC4JM6FgPH_TdOJ&EfU+<,@JOc/B)D>)E=(M?dT?_LG[1_2bG;BIHWfLI
d6<g[3(QV9+.]Wb8_\@K3WV^=A.PR^C49Iea-J>9>=(g3-S7&>9-)>TEeW0663^\
+J2[;A6F,b\.Q9E>7>.e,a0(,-YRLCV)N#=;^IV=/=G<PAYIKSW:gf)9OQ]7#QT5
:QGZK)Kc6+O4d]6X1NHLJ0<]?W[3_(8O+f:=\IZFb[a&GPDAO(E3OW&F^[@b:HbQ
.SR\RcSeSJS4Q5I/QSFN2;BWg]JZQ2cb2F9]0=W)+Q3Kad,)-c24[LNHH,1E87Q3
d1W3^?S0P&_2I9VK/6R7J)8e^1-W-b:#)8LfHZE[O7T#0cJG.X=;:d:JKO6.Q)?(
;33B6\B8/FYa3OXE824V\X:?J,(V.QV7[WO>-E7E7S\X4OYQ1DYgKf1U6,XJ@WG.
JC],V:)^)(C,#]Y\/PIYPA,[[YZ=d]C#^6>Z,V_1aFaJ9NQFb7EcI/I,SK(Led)d
\.Vc9ea<?54TAf5?S5M5IXd)8#)_#H)#.^V&\T@A05NP(?BVK300,0e7PC5\Q66Z
7+?=V:,M#F8;gcPC(ZJMV)F_X2Y=AJ@EDf.dHd7)8X#g(d@g<EH7:U[=\XCe7/[g
EeM>^K):B,]H:A)NdW;D6AW@@>5H@WMAMC01XES.fRf#IU5)0728SW^THOX)@OQ?
_]-Tfc5Z6M+R(P4,8#E&KF.-+#M,8@;[GDRdQ^NY2[>ZSYa>ZU6#>Z<Jb0G#67&R
MJJN=/?)&b55gZVN1@I:;+-#KF.DMT:<eg5.(f]?@6VfY8@CNQ7ScQ.5/94EcbK<
dMJW9S3SA@GB2G46A3)5VJ6B8>P2G:]5)OKA4M578_8/<5\OX3T@K7#:REWYLHR3
<5BLE=bI_f,FZ>3B#=;fQ[FSc_d\PGgSRf^d3Sg_eK[NDeH0f/5a#0#:Z3/KHQWN
.aAf?RRT>M^+F2]G],Rd@/[;?c(VO[S)7BOW1X^EILeG7(Lb;8G10PV?)#4Y0>M2
d]M.:3VI??RK?(0[MKb1B&+REBR83G^3+\F>e#a8ODF=7.]/J,?-5+,8Gb0J.Id+
f8+14fKeY+#Z(9/IQ@V8DS459]@HSJ1,(SBHd_^c+aL#[cV=>Ad;=ga=[8PBDLCF
HG>gFBf,<N5Ng7)1#-&;]I?B4<MFUgA.]4QcFFQNR([8<E:#BNYTHAAI]>C,7ZI<
?8LgIEB(F;ZNScb5>1_8HHaY;;\,JU>8F9,Ab>/-Z()/3cVSdL6,a.eBd_TKdVX1
^<b?/NgW.=.5+FTVS)B[_U+A#YHB(Fc(W.f/MOV2.Z_#0WFTgWPad3JFc<#9CU_/
9#(EM-<+.WGcg>fS(91W(LM#/JNZZC[)6>8MbUH;Kd=X8O5dENd^GZcI<VP[>=-G
L]VW#,#MD@C/;Ua;.[ccSg;D_4Z0=(F_2#RTfcgBaEF.C?]3Xa8]cVFT8_BWX,cN
ZS:GbWB)13/^9W@;_,A4]1I?K\0[JRDKSS?;:]M^d/]7[d,_QR62M?/D(&6?2g+L
(A@:&8+2<1\NVc-K.F0&U8PXE[#^^3=9QW6IUEJXAQJf,HccT@TEZ20E.d=#Wb27
V?5O?e/bM93=TNc,@([8G7c>(DDaIHCW=7_d\Q;P;Ga9<#1)\.a@.b#gAXAC9XM9
V_\.F-=LW;S=g\_>b]TDQWN<+PQe=6_1V_0S8ed7L&TC[Zg2b,6I)DgZbOc=M4<8
(eCd3dA67@S,[MfB/^E[]E;Ke?eK@VT@1EYb[OV7dHI[+dgE[8Y6WL=Sac/Q8=X>
(g^:K>9K09<b>SdTM3d6C=\(C-^b#3G#V,FN;-/(fQ<[L+2aUP9.L9QPERDf\f^5
f^FJA1[(e=a:,9a4YP6TC_794fWRGSZE1M6<B,L>N6FK=:T7@Wc()H0QF44/Hga7
eC?dV=L=LA<N).EfITXe_1WO#RL:+(Q>WgFGU:9J0e)+aA\]C/\W&dUGdORS3WN&
7:DKEdfR5+O5GMN-aT6,31J.UVKQO/6QFIT<T];:3)WBE7e8ZNAWd2e:CD2=BIA]
b.]@?bCUB4C?fCXK:M8[X_\QZA5a<II<;KTLX,9KFDfULN321M8)/Mg:3f08K8W0
OWB8Ee-S+#79IXE42;#b/]KZFIE4?4?>R7ZS>Q]4P12ZT::\8[HG4@..PfD6QDO/
gWMg=O>(71;T8J+SN)9O]cVK^W6.XX<,5QgLTC[OA71dV#S_T=OC0+WF?XL=cgCX
fPeQ+]&9G+3<<]ZT3ZMK?_?@<G/(.T&7gO7TBZQ1K;4V>2(.X8_g:NM[0&Z1ZGBU
IVS10D=XA_a-_-G0@?,/QeeRD[gHP_@DK1>UZ+bZP7+6XZ=X,P[GWDV1>ggG5Q@<
Q9S(J)ZN+A_[M54.9[0d@^dX66/1AZOO2<0VC63f,O0C,L7_;)D4Jf@Le\.S[8X>
-PFD98Ye+]MBH(Ce[YY6NLWg;_LgXC2g^V=M^1#JH&=3+ZMVD5>AO.&2geJ]ePee
AdC30U.)VM(KP@aT\M:2.CLTC#:<)JQ=a)HgD:007:^R001[cMa&5YAB\EWgP(W2
>>2X88aXWK<0D]@=e=a#fb;\W6a(83Q#K)>YFUSZNc+7E-Qc#+A\?;9_F[B-f1L#
3O7eFF?A7.:3g[-c,aS4dU-1JN5J[Y?1)B;@D6[;V2Z8DLM#<=VVdG\a7R64XbI5
@?WU/NGQU:?L0_J])X0LTgENZ>OD\YJ0E[-MVc1#[0Y.VLQYD<1W>B.4#2#V8N>C
dM(ER]IO\HZ/f25KFda@;IaD]]83IGN1I[Z..J[.ZaSYdF5ccYUYHJ83.,YX:a]/
7O+9(V[[.+)(&TIe;Fc;F8\#^9DQ\&Pb_NLECWaKK?9c:dQ-L,cU5XeR+V^#M5^Y
>2GQR.4?5:J=ca0^^Oab(,R6gD]c\Bf(ZM?B2/XSTe/XN^L2=5,K,H#U/Nf>g\Q4
T^L+WT>T3:B0):]S)+?WXc-7d/f_/;KA3Y\BG7PNNZX2I=Q(N(T)#\7>GaCO=g-?
6[DHGQN<,0#TePKKegTcXfeDOW.YT0Xf2Ha<RU0a->_@??g4+Ag?Ce9X26RLD>1@
CAH3-;J_V3QVM.VT^Sg@1cB>E(8bQ@,R:@2UC]&0=cDe-H53=4_P(3OS3U8=Ub.P
/7RIVUV#2g7,G/[-cf9XJR-&1Y^,/CC5:Ua?]I(@:&KE3(b)O>0AQe;W:2P0bVNL
=AP(DSHHNUN.M(VP08),&9B=RXMPB9FaeID-TBE5fcdW=CY=[f0V,U8^\I+Z=DBe
QYJ6+/8GV.I,0f.M\+Wf-NG\N@fd(T4UM1<)RN+QT,^X<V)_NK)AT0ZKWD8P>7JP
XC4IH596Pa_0:4<31aF&d>)1Re_0?5\g:G3KG-]N_O,#>&_g=AJ6Ke,g9a^I_]-X
_-;Vb_f4^QYfRJ4J7fcNDTF6:1gV2d9[/-@4DJ[,L1:QEZ5#7bX_,g6QYe3XgHX<
\N2:HE\PRI;O9G<2M^O26RM2L[[:eQ8-)c0/YA_[J6D1B=\/IeD]&#5\69e8K[OJ
.4FEL;Q:<fM5TJ+1,LKG^6J;OJ)-OPc)VKHHCH2R+LSC1DM9+-\&cSN^ZB^S(ZQd
:V\EGJ7DcM38+P@AX-S,c(MfL,]S;\Ff0D^6P:?AXFMdXYTJ6Tg,J]@RC)O8168V
P.bC7JUMM?GQ7[DgXI1a<G4d0QFbI51\J1b0b689]/JZUT(Tfc(BfYeNGHMK+7DI
(KBHC7+eFZ+9<.&6OC/I<egcf+4eEC7G=#=T@I,\/0O;P-EM4:^(F^@F8?E(NM9T
5NBL(8J.=1,7c:8F:dTNQLB@>@5/7XUZ65(CKS]X4[W7X/X=E6>L,0FWUQ&OOb14
d2RJ@;Ff:FF8O@_0IIc(<c#KI79V_EUQbOZ,7^]TbCO7#SPHKY+[bg5@K@-A^-B>
F1(8?/37^g/JCYVALH81d8=@H>D5d[/GV<bd:VWXOMH.NT)(M&8e2Of[654H0<E9
#X#Z[@bNT^P:IE<35F//8-:AFJ4^DR[JZ/UBZX>D<3M88V.2?MN(885,VN[,db=e
(:,-<?S#9S0=-Og<&S@XAbK&V@g4GH@E(ad]B,dgH5GT>LBHYWY#0YMDOGTI4P]M
P\?/0Y.gV1,e&6a<?^d9<P]QZIEPRX6[cYPO:Y+da:&-HIO;^FV-\@/>[;EM/4&9
[R@#6d>+NSP,DG2QdD+)J.6[+2Pg-6/B\@3HAJ979cD(58a0:1Zb<OH?D8)c4E:4
a\&P))81a]Ud5LPF_KAQOXaYAK28W2TeTP&cV6:C2d+#b&ZL3H(@]gHP0MPDbYDT
d\GIP-I8L_8cC5G/=GEUQ\X-TT8_]-44\IP/,<.#S9J_#3Xc_+/dPE7]<>1g9O:R
XQQU+&[=W[HL;9PgT[^).F=-+_Yf43C9;A3<R#E24&-3D?<E:1b.5e;VFc=ZK7d7
>I?MNI3Z[8C<K;VgIe/9Xf22P[a97W_(d1:?@,KBb;gb#U.AW&3OGCFf/QA=J])b
>79-VIL99^X,&0F)9M:LM82T&):#+1??7dFGDFa6+A8JXYB+\SWV^ATR3ZF[.D1@
+gSROOA+VULL/O?E3#14CMA,7\[#Y\T/C02?_RfHYYc0E[^N,D\JNR=F1(VF-LE9
c2TJf;,4c+AA2GRb5f<d:f0/@e>TQ9\H9(Y.a4H\Z&B57&=?(fYXOFML09-gB/e8
,.bg2==EC?YUE+NJMX-ce3)_6(TH_I#5[G1H(-WGb)PCBW:IH-CRWX:-LQ+:A@#O
TN3JSJUcgE7:?dE7MaZDHBI;YG.W@d<_9<6e(<X=<K\_e_#,IUb,L:+J]_QTEJ&V
T=Q4d^:JgS@3?5LObMX,&MZ+;]NA>98fF#T2[(>5E3bfV/-PfW<0B](N>WG@\6/(
+X9PE0J)<QND#+F8_I.T:14dCeSP<E0[0?M4YER;Ba..M_H9KYU2UJF/g&&G2SU)
YU/^F#(/X@F/gMO/XRV28(g=52\b@]&^6e;ELS;C/Q;?DZ+IQ:;TeG(P+/3)f_[N
1OUNgJGHXJK<4&_7V#Y;7M@S2H2^J3-=@4Q^CdR;EF[\[@R>C4RHdDO8ULUeD?V@
40>\2RPb,,/7665X/)K#b-(U6.Wa]3D+6_#=]&c@L<SE2:#XL_(NC(@Cb;XK3)F/
f;NP;4)ODS=[5f\RIFgW4:Cf@,OU;cacG@8Q++::BKSJDeT69b@KUU<HQ2^,?C;:
HRUL#BNZXGOF42J)P6)Z#SGc^E3GB&KI7,]Y?)(&G.QBJcX[Xb)#a+TC(T;ZD5@#
B#LaIM=;a?:VBM(=:C-B5e;<,cJI0b<Q=#Y)\L/<_O2&9O-[NS,8:BJMgWecW\_c
]VG#BQ7IZLK<OT)?&aBA66H>&]a\eAK+gXB901T9&,1+gY:5KPWW;ef-EB0cW@=O
bS?57&b#64[BU>#;=BN=6;Rg]cfV_6U4WLe.O\FC8H@7#]X=KG,:_EWVPYW/&PUO
Z]@,[_+BH_84MSg(d4_@91ENd<[F\YPBC)HC7G?e5(05.T#&-(,?3N\QW>7-WC]6
,6WP(:/a/C[R2V7a3ESYB3I^FC-]5B:X#WfF[<XAUL[Fc:;--/Z->T5ZHK;:BJIQ
93^aMR-7&0#S+fe8=^:XNBN,<2@6:f(Y,Be&4-045d#L=./?6SWLG>Ha#?GXc2.?
;/,H_@F3[E\K,Q4g-F07?C<_/^[\R05WAf=]g11UX]?^TfZ37gd-G3+:0dI>00B<
;SWWLM40<[LYDC4@VKU_S#]&8^RM.4Yf<;b8D:C15Y.67ed:MD=4RW43+6K+?3)S
FeKN/Da731]>SNM2#>QLg]g^E.R/;^=gLBB_,7NXM3J>+^&<V,.NAH8f9K4F_#BM
:f)TH\JD8,F/[ZPLA.WVX1QXCWX8YGN0FY)]YOB)Pc,Oc8Z-:SRNWF,LQfGSAc[6
e4SE55/[IFM/]_PY;?RZ_afH3P/0\W(EYA()YQ\Y@&+7bT/LYCAHA&2&.:M=0G:]
)F02bHDKT[V#fU>-6;./T]AfT9_:]NcK(a,.M<#0JS2;^f4RT7.Md=EJTWd002f+
I-)VR&@=,_1QTIW0P=.8@[@4XD?[6<^CNN(J[R[d/_?_Y-f<>W7-?/cEP:Y-\,,g
\4W(OCf&_+2S^+HNTT??6>H[/P?]&,)]NQPE]RB=Z[D)SMf^-&;/#3R/a-(<TaDT
b_E5U58ED[84NJg\7M-e[_Q4:/\)d05HIg:5.&_RDR&\RD<K=&6BX?4^><&f3:c;
;A20U0Hf[[FUPdY(__4^V;aHE_H.E,+=Ea-L)XOFOWb&.PP@>\RW?<#dGW=-E(+R
[>\1/_,G6Yd0D=e/U):@9-)].dJefY[K;_eecABH#Ue_D,^CNSbYN7??K;;_]f6a
2/]E1,5&_?EZYLG&)><(J.c>7X;37#IQ?ac_ceLP@R--+5>4YRSUY4FM\]OU\]\T
6226[O\@V5/X0?RLC?(:.)F\@NUeE+)[P&\_-]<a5+O/O3MHK?Uf2L2K1>6[CI;<
#R;W&0fFX=69FTZGd.@Rg.2SDZ6)J&2_<<TWN9aJ6BS2c[#g3PYc]E/E:C>.B4=&
]1+D2&fcEG7fP>,)Z4J#Vg>G\LGRP&LB1I#TaVB5S^eEb5\F/\,b43g.&R7B(7<@
G9bc5KPg@F2>903Y92f3_(AeI3D./I;::I.F@I/\G^D7A_6/2DT5]e5GTB_--Qcg
MS7deC8O&#)[@7>I1Z.JN6SWC;E&:3dR&-QM)./(_.GSCXa4YND4,EZfEL<.bSL+
4OE]g/T3CN36]HJ7/&86PL523Ab=LAMDgeY?BUUQG_CPI&SNJ+#VgJ\/(KScQWYP
_N_/gO1IBA_[L8D=4H7&+bD6TT?Z@+/(2[FYRX2FJ3?C_8NL^Z;gE^KH>d23^K;U
@a(09=D<MO2?V:CCPfR/(QR)+&6W8>F1<HX5?<IIHMBN)7>+J43#WbDg\0L)0168
K3=650dW9TY-4AecW1VRBUaC9bOZSbG-O]VJ_O#Sb>7AUYfZ^\;XQebd.VCPTQ(;
-B69H?:;#C;9,]/I#ZSUGX+>?FVI&?BEcK]:^[4FgY;@LRY2>D1[BPR5S1K#<)gD
U^d?R99e6fZ#;]A#fLf3OCU5ZNM:U;6VFO90=eNN8d@H9ORB5F=HI>6\=gBD&<FS
<KV0.5Ve3R&MF@WTc77:WPX/cO4cg,N[_G\2\g,GUM1LI5\KVHX6^;CZ4?b,^ST8
WZKY+b_G8cGPHN)103dc>AY-[XNR<bB+P-:4B1F=L=/;L^I79TQ6[7^&K1)d])?)
\9626^CCHcXJHe=4]GOB:ZN)TMUd/8cNg0&6c_cJE#/)D+dMQ_[>L+3.HZYTPGKZ
E46/6H0;.PTVZbS&PYKV@&1U.bf,2MCP77GG&X^:0VKG[=fR)bVg\fK+SCZX[.@H
/R1C4d:9W9g_G9KNF3Q&8,LU1AcEZ3D@_8c(B/,\R2<-M_Oc5[6CBJ/DSQ#4W=V3
[]DJ&;g7QaQE#-],Mc-+_Y+[^FXR[,b+HA)f7QNf61&U/>5.cV>\g>TBeD@D4Nf1
a+G6O-:7I3:<&a:Ad=0^1OV=O^cQ_D2L560dJ@/D[^>D@JW[>TWR3AWeVGQ=O3Yc
0?&I9R>/A3[#L)33OY,WP]PLJ)32G-e>=_b:Aa=DVJ&Y>0#=b-(]^UL+K\/eZ]_R
]#>IY<^NP6OK9:YO3F]5GJ<a)JG:&;\)4SWPfbZRN4;=b7(]dQ[2(_ZB;6>C-/&7
M4b>N._E8B^OF&2ZeXS;_\B7XaOTd<L2G3JH&RB,9^Q5X3eMA-2_CXY&GH2;F,D=
cR_R[7JZf)Za\7?^EQJ)W.Nd,C2NX35gUH(G<+<_#]M3]@9b\4XU@08C4I,43@VP
WD&RZ,2U/4+Z2OE=C7N,fFW/@2>6N7OJbf^]cSSR5D>>0U1/&LY-LBC[ZL=Vc@-P
K2W;OT:#U=5+HbUH\T^=^28(&\AXa6:e..-(H.[:77-;UX6ML+TIGHCI,QS&b_Hb
2J:gFLLPKERP@dZFOU_23G/+_Y^YbHg/[>_I68X=V8U\9@5]^E>54=QYc+>&4a,F
D=eP??,S>E7YZ.C/.XO4WL9N8Me^T^659#2S[(1XC\@+O[\CW\fg-I^@We7ZIQN)
=fg1VU0M,LN>)_<1ZgO,g;G=ET.B-KDT=I10IH4JY\85AEC=W/+RXe>IF5J:a=+8
H7K0-7MC(T4g<1K4ERC_@OU(Q5)Q\f@9c1&0c8HYU1/d](,Q&1cIGC0(-B4HTFF<
G9A#XD_))EdHaDP.RQd^\RE6a^7.?6JHTe[(.6-5d\D2P8EO<6Cf+;#[TRO_Q?]_
M+:6>-3<F6=6,=),6Y^&(_\-bf(SS5&/RS\M>24E63Y9AN@];#^9DKWQLS]7:7,D
I0&3P7gad?QV@SCPILT#9>;ZLNQ6OY4R?5dI7;3D]g#&9?1Z7Y:2/Z@9f_?VV9:@
&/<BE6R1:/R54RWKH<#b<b/K9U<\1?J)[Z10dTU1)CU5.5K#8O.MV]^BeBB;XOHS
@S8T-CXdI#R&BE95T9^+DW=YNK/V6;G@-#,LLX6\f9.KP2e\_)-Y632f8d<_UALQ
Ze0NFb<Y)5)RK/V_bJ0H+7@MMG<H?Y[5Q28@_WY,RNDefTD5@(M?IGga+Le7A(=P
1HaI9g@]+cEC,F-b.N3J5Sa^-IG?8ZNYP9aHC2CSNY\K541?;.M97Z7-=;[>.H;G
<)Z[J.;LCaJc9:G>-b_AP:16DOQR;TbPg-eMD[;WY[R]S2dSZ^0)=;\E]b,U#@54
N3]G?S\bBPV]/WF9>A14eXS#cBUC=E2,/-U0K(]VY_H>\T\3DU_V?]U5E;K[6H0;
90C032SF2Cab?7WC])3=16JJHCR0BDGIf5@#CP\b:J0bT2cF79X\0RH/c9S7VeJF
6eX4gAFUXSb321-_#LF#1H;Mc,1E\6HYHO1?R=D7-gSC[\KLKRB,Y;[29_Y@MP6Q
L@VGJ4<AQ)Cg5:FEgW6,UC8T(4HE<DYDL<+\U.CA^BC(H)(1MO9LG\<#N?;YK&0+
Q;[98LU2-EbEHb+WaR4<IY&_,c?QTFGNB)XV3)<8P)5QT,Rb_8GC+BZ]bf6DbIWH
)KWgJa.d,?>ZWO6EL]8e]&1(Sc9O[#+S2X9a:bMQ7HJWBBV2+b1;,&_PC]b3.J-\
9B8ND?=RdJ^0gJ8#:.eF&=P#9\X&>86MSe?]TZ:\&X(d,4S1Mc7T>)D;K9P2J@Zc
<S?cea&U9b0Z<0=<LN6ecI0>P#J3d8()?#7Pa4\dHFYJ:2\U)<9&3<3CMI=3:((6
E@)X=V)W:0=16\5a/ea&,M/G?:7-_VAAVOB@5TAO?Q\YcBKS0COg0,GQM^:fJM=&
aD\XNW33?)JKLcUI5V-Me98I;WDg#KBF&54W^C-2dW)37L07c.>]d,XY=@A9W?L4
=^O44.\XgE\40PF<39b#.#fA0#4:0;>_(eI=F;L9MQ-D43c,>S>(^D8]>(,bS##)
7AXSga++5#O22]D<M2a+>Xa3aJ69S8Y>8]6ZZac2:@HYRFf1=L)EFD0O]P=&>J;/
S<A)J2,:5DJW4cR@V9R<d29dE;660A>e;e<5)c+K>Q7F(_&--5-B0]?4@aSP^#0(
3,Yb8J)L=JVOA1G.:Y+GHS_/;AOKA?K0J.5dB6BGO7-+Z=_U#R+H5EBQc[](=SZ3
YL-F,Z5^&fc<ZG9]KBHX^7&d;-C:V<5<@^P(BWA+5[A9KO(d#ZQA-HHN237YIV&V
S9^,2IDYFL_=1]38DX4[Y:+:][Ra=Mb8E@WK_c[0\Nc\)Gf>M.M49O.A-N2Z##0[
@68N?98Y5]>GJ0a\dJ?/J2K;/@C83CAcf#[L-e(/B57X.>C,L28]fIcV>_e7KL6^
[5?f3g27:fX?Q(84<FP&Q;IZ7[?N0]-5IK.YO.],@@VH@d9f2J.O08/e<8f>,fdY
35&H](eJBUT2DgOK(TV0B+O+9-FTJ\#)WF7e:,T#U\BSY4)_c1X>P\_eY[PX@2()
<9,0@2CE#_dedf/f,A7N-<e,]#ecNbIN:c\CFHKLIb7WK#]/^0F5.,ELA[7(0e_:
>2)>]Lf<_][NFU<3J&fJ@->9><Z,7L<)-aYg?6AT7\=)0a\QJaP<+JR?:JP^;fQ2
;O=?.22WG5U.Q1S-T\/:TOgYb&1L.@I9:YW/O5AfZB<0+#V2C>5-E0\TA-D@@E/d
F(]H=_4,1(5(F^0I]86UQLOIf3U-Rf-Y<&]R/IHT<N1?XUKNW_9(?BDNH#-8^9]L
9DR/CW,Nc9JI^X-ZSY?Q31<^e)WfgLK79NNL<AU@:,Z+G-CPLQ(P4V=R+(1,:W;L
8+X#&0(TXXRaV[CQ#f9B]SH]5+\))2CXEOYILNU98,S4QNV2g3MCWc.COZ9PeQS?
O5^#GfA2YCb?[^^d5?/ZYYY+b[eO9JGSO<a2<3TP4af,Y0_.M[_J8H\#<Yb#5^eC
EI@cOE)OJ-=HD/#A=ga01\Rd5/DUVaGB?eg3(YbV@g[N)F+FBCE\fKgR<12/\8Z-
M::]<(>2[[&C/>+<adcSU5YU=<WTgQb)&(3U5:/gY_,XKMY2W@gc_da/07#V21I5
8/SVCDa?7O\SPP9=YFCGQ;7#8#6XOE.;C2N:37:/5?)T8bBV])4,#/\2[>_P<.=&
]Z.Nf=UHf:eIc.=AWa#/Q6f_DM&-F<\FcUE3P6AXRabA^5(.>HJ?_S,UG)W]@6bH
b)7FHZUXbEPFB>W(bLWNCM(_4cV2>dUX/C]DWR^M>1#I>f(P40MM-aQQ?QG^FYES
@>N0&[1C9]?+1(MM42&EI<aN(9U_eV_@4)CUE&9V#G.[RGT:M@Ke+EH,0eL9DQ4Y
cP9,DDQX3OL-X8bb49MOO#=[P<fF#;g_ES1e#363\dbB+Y;3f9(T7I;ILTV45CRG
-9JFafY,dHe4Y&R,d@6(O#da<Ia(GX69\cRaAPFK4gM[^Cg&GZCI3GG[@fbEYg>g
+Vg^9cVWRTR[b_=b73OHJ&TX^NL@4A5f-J;#5S,I8PW.>W5C6.0S/PEE<\W[2L.D
0F_?TJ4^Y3L&QUPe[/.a]Gg\?;[T=,5NEN6UWY8ZE@>fG<]N&.c3SGf+0[=J->M-
-1M:<8BGE4EN3KX<8^PUUV5aaB82DX9QMC\H9R8e^8eU:]>RWdI;ZeRNcIEFJG]G
AEV8/L/?<gMcSA-58#\f@:5gQT^(VYSA)V];a=5\LZH]<FXTNWdP9c?f>\5Oa&Ae
4TP]K:CP1M4ZE8NN)2+KLaX[YVY5&DbIVT=N9E4RH-ZREd+.Vf9Z&=g.dAAD#E+9
^9@0A2Qc->13>Cc:.QQ(<e^J<_GGE/BK/6NO1CMGd_-P0^CdX[+E8fJ&=5],HSNb
>+AUZa[4CSY9>^08MG>=LJMc&2-N..MFSP#-SK=aBdXUDJFf6[/,RPLT51Ag+Rdc
d82RKaCPPdYJBZK^74d:IQVe84IS58^EN,4[>BSfSE+CEC6gK&9)/c3>BRG1_#O^
7f3OA>F>N4+LbU.ACH_J+OF0/VLU1QR>^<NH[F64F_,43C5cLP,#ePU^]a/=5cL?
H\gAB=]/(fQd/+aLH[c8QVG56#K(A0LS:eND8(>5WI0U0Y+dZdFZ8FLE]g,Se+O@
\;G)1/b\6g;F_,fA5#MRC-WT/(Z9;.:@0TMKB2dJa3B_64QZW5EMf[b:Ob<1)F,U
6>eFdA7c>_YEFcS#IW8_Z[2b0DX=SE,J4fO2[#N8&<,T;#]IP_3:T9C].VJQFHIb
;PFeL>=Z0@3dZ^K4ga4><)8ZH^H>:/W8H[W3>ZK/BALfOa1B[),g?&ec[A?KSEE1
<I8C&N/KFNc2@g+N)a6eP-4;E&QM,&.A(M<+YHIYT:GRd9B?GBG.GW+HDA.\e=;-
IgI_TLACL(V@dMa/00Z69;Q[<f;.9KI^O7TCQNJMJ#T&16UcXM&;+gF)b:g:9)H?
RTEC/Y)TSH\.g[,ZXba&aZU#N7OY8)W^9(e#WK>eYU1YAW;C.(bM^S?#BV9e8eAX
6bNe5L]]PGe2>b&[O:D7T[LOD;TZ>5MS+OJG&SP14B;cO8^-(aG^=TNXO=ES+1Mc
@Z77T0C6(?TeLE>>M_(E-#^A7,ASZc&E?(AUa6+5+1&EJ@RbGVCU^-VV^J?4f+fR
8H>05(9D\.?e\^M,A6^+]X_.(D>G@Nb_C]BW.AZR\6cVBE2V7>P1.\P3M[C46#ZZ
4[^5F6MAN56aY+ZEK5LYEb3D_Y/b>^=^aUMIY30;SM[)0VDK=X7F#Y-fA7ffX^.f
0P]C1Q:[--)@37[D#5]TIVaNCPee,M[U[XaNM6OS:Of-,3+0ITV(HU/M:K[W^f/@
c#_&,;1;2O6WM/3c2EBLN+UMXULUX3)3G,1NKcN_Z8.J><CL:>O&IC6T^LEI,O_6
3LEN)eg+Mb>6FQVC=KfSCN9.9FU[7g(Q;Tff<==S^C97UX7K]T1+0JV;MS.R1-fO
27Q5dWSZ)(&H.;\dP^/BKa]##,069I^_N]CWGg_0W)Y-SDeR:T>U>U5^LZfEP?Q>
CU)D+#XceY.cN2PKUPR2J\0+f7A5;-T?dR^WPKe+>\3>HXfe_(X0&aZgKM(=X5CP
B0]_W)R/IS,:Q=70T)_P?+?J^@Z75YVDb+eLe]XN,DWf>:c.c0?TDK+6F3<a)]d\
_Z;2WH_X)HN^E_BeX5(e.Yg<dfB;&f<#73>,QF<CIfK)^^+EEV:.S_0Ub(^C)L?Q
c2.-f/A#eMU?XI[b)f&::[Zf;;T(VDF/+M-JFSe\2Q_\d]Ng@bOCbD&:XCIQf2fY
_\V^d3BCBA#&6)OMLfWFfgQf]_W>\9@d(dYKa,eSSB?:+&-WC58D[ZE.He=a,?g9
2Kf]]NRU/\6UXC]/8#H1K6^b[K@aQMDd+X+LG4/D2)=K#4DG[03797,CWWN@,MT0
SM[1g>R1=d;+PFaef[)SB+Q=_2<5M2dP1)U<WRFF=Xd,R[,8b5NL-&\N1\,IdGPD
=R+aSVZ=H#7F&/IW9(@8>0>2U\LS-8:E0VAP\&+W7FQ8gZOUOHe0+J+E]4IQLfQI
)QRIH0=;b:CFc,TaDO@]W(.QB:34\&VFUAd?Z_[8>[#>I5Hg(;Oa_<U;9^C,BJ@C
6K84EZf_7HO/KM0W,G#858KTB6GS6fL]Mg_-K#9D/GN70V;:(@Z#5EHAFC3f-(8@
;I35.E\(<dAI8[ZEdd:R7&ZXE[Ib<2GF&WX\K^>_b5]RAD1GCK0ABGT60JII8S&,
1DXRL936Wf<R(P.WTJHT^0bY?;(B4MNU^INRBR>K67FabGMWVC#6;/d@CdFcVb.8
))<+:,8-UQ:,J<QEY(#PT\:Ef^80\0/^Zb1RfI+7;W,5g_)=NP&:5J>CMCT(IE:X
[SLHfZZEAUM_dN36<GV92F4QQ:VEYXA:9b\Q9ILFB6RJ.+g_5YX=\]cN^1H8([7.
K\@9L:=CU0])F8H32YBO3LWeC;_VdVQC#<(WBW.FH045S]CF1dfUGEA&)VRfSS[4
O]HK4b)DKdU@AKQUMZ4&[-MZXU+K\+;ZY0c)8]OTQaIDFCJSF+[)UB0?e6-229MS
1gadO^PB0OH(1DQf/5R#aPTI/dA58&3.7XE14.5dUQ79dJ,DBNOSFAI))Q#_9aBf
./,HZ74G/?MIZ(Ic()2T54Pfcd7MSC..2KZ[UEL/KcW])fH6dR1Ib@egXH?^T8^c
U,NTLRF<40V5=)1f8.f]3T]A;GT[J<GB6;P0P_09=TU91JO?[@WTe3&TO^_.-QKf
g:AG-=[#cZ<A>IOadD6QKNBLKJ[LaAC3;+d2\(2,[^4X<dASY;RFN[AbBT[2.\_5
&]FHJVQgK&7_KM#VO8S7c9H5eMO>=K[a+7\4bdQ>=LW_N;cgYLYdcYc?>SV2Q\[d
@9U[<&Q6&T]=^19;J7_07L@V1.7)12/P0ILIca5bK?cd\:IUJ6Y.^Z(WQ]:78C)<
_V8&RFKN+X_A;f&1&MgFHeXf9e@S#^NW52b#:8D+V,-+:BQG>JJ+fgbAMQ0OG[Qc
KNN];eV=:.IMT0KfIMBW.&5>5?(F)XZdf+?1VGKa>eP>&D-K=a8KR+.3M<E>NI8+
2OCL.]37V#YX/\O-GV\QOYe]bIbSW-fG4@fRND+aZ>B&F2DUL[G8F-SGE<-H6g>7
G5/&</QD:4cW,O\A@:,FR1;Q8,/>80-SO,1\bR&-SCE9G]#g?(fIEGYQG4S+^@aD
&e^M:3=cK9DOR/PGg7b+(I250KT=88P4K<dIL0F?,B_4,DIg_XBS\8((M9::1J8L
#Z],9FA,QAB+U;Z)Q.-a[-^L)XU,gTdb,IK.(3CR@]]E2GWF^f/#3P#^Zfd#O7V;
/d<W16TF1>?S&F4.CLO/f.-M?W-]Y#B:2M@dQ0Q]MPXQfD9<K@:N?85B:g:?.X@_
.B^=GSQASa,/6(V1MZ#\,OXXW.N^[/)1#_04@#5.,D3M<JOVNRN4=M-bKeV?9TN9
>@NW,U].Y^9&C0cU(<aGB#OBeE<;JXC4Y):57,gYg:?#1EUR8CK=/4UH(RT;F?U[
IE&Z2GN^[d0(<ORDO1_#bRKVWJaP5,IWPUUf1g<D2FQU9<,^NE#^ZK#.WVbg]V_D
FPVQaR,6&@?AN_:@&aTTc=ZJ5dJ#eIe4e)975]?<D]Q@Y#HV0Y<FJCX(c;]N\WbF
,2<GN5-abSC+UX]@[^F,]aT#5P)M&bA+P2bD=PHLV.DM_fIR4;B8eX53(2NLWF(V
.C59,YFD@D/c&BLO9&+NKVR>[cZNcZK&0D)HJ#SBHU&UW-_HdHb3>&/fE\NRF/IX
ea-Ge\aZ23YE9c>\c.(Oa<F5d^B<fFHIX_Hd3>2C8&(@LXIf0YN4g=@5cBSY/2-3
T\IKM-Z0X[MRMQbG4We9>WWS;c8ObC\F&,d:O6&TE4^50gL]WE,PHV>1RQDeQG(V
V3/GMDW+ab=_7g)Hf,;1H)FT5L7<-NK-d_GEA1H77:SM.V6FW@6>f@VgS>:>8AS,
S.)9(MWg-OJ;X.IdQ(=,DQI03#G9DEJ_:bIC:PC5L;cSSG.G[[6ZH9;7<LDH)Ra=
K/6J2?4?bB\.NNK0OeU46^RKMHe<CZ8ID6FE2WJ<//3WZaL0UY^O)1]OG6_&_FV4
8].\\#Kc\DX^5bAbK)B#bOHWAAdcaBPafE+X[S,=8JCE3ZbB3g0\RVfI,N]<TF5W
e(BTg:;1]A[FZ.4UdMNQ6_2[MW?WDT)H9O(DNG)J9,UbfJE:AMVG>R+4O6;11B>.
Y\UV=RZX@#GYX0_;.C#>R67NBa1fYgO&9agY)-Y_=T.VgOA7T7P7BTFf)SfOfcgL
FcPR&H?9WT:f2,QH^gIN5S9Xb\66OUE_642POZ/a(>MJ>cQ5KA)THIcRC2>_GK(N
L5UQ6^JF5C_9?TCS?N;4A<3;25/Y:Cg:JAd5;)7HaH[Zb>2CSUK-0gHXA+CVBV6F
12@gd<>13dY/[V_\^gbK?=b^F@D0[#@7/+d(FgcAb;00J58MCF)OJSK-Q::ceNW>
=^G6+JZ;f[DT6/<V&,JWL+W\ce7:IaK^K/3D8#J1QXKB54W7>T>@_7;6dN(_bSO/
M0O(HT8FD)4SRN0+Wa6FeN&S0>]0?8&90FVfZGXLG]KD4IO)D5QM14?g2?,Z^U?X
[F]R0M.G]4D\d6,PSCGU8=EU2Z=OHD9XZ[gE@P,?.<#Z6B9Db34f_<f/SH_=LZK?
J.^719gNZUOTRE6IK&b]W>F)DLGK90-YT#77fcV42]9>7-E.8)]#L&T+QC&acZS8
NH]1W=D@\LW4f:4K1eK),C#[^N4HOc@/0?SD],XH8cAM2-P35>47#TTK7<@J[6cF
&LVY@[+(/?Q;A(>b])E7+6d?.<gV;2+=VE#MVg;S0Y#WCH&MAXXMQ/g2,),>XDfR
I>K1?&\f,Z7AaJ;^eK#MGG(fA^17TB0]@+_@YXB)bP-?[V1Hc_QI:J:.FARJg2D\
5_PK7:QbV4=7YEfN-dL8aSTcD[2SQVPd7@&KNg51N-5ON]-eYJ;D,(],G7ZITXAJ
-QBA.Bb56PW.I4[AYZe#.YM[2Ife)DUOU)CPfeb.B)=<(Fg.>b/:^RP]@HCZO9WZ
@DZ&cFYD>&MQ+_KNR8TX7O,XGU<Mc2?fK@RMY\VO6^a<]/?KVf]\_B<.F9<I6<dB
>,]_[[CEXT)[FQ@HM62:Sd)a]E)M?UgB@0G:SZ_8@;JPdYeg?S<G4VS5<[S9C]22
IR):OD.bJ\XZ93DU9TN\1eY5E43M;6G_-gU=UEQJ6&GOMMQJ=V267&.F2&Ja8]-P
eVD54Of@.#P(:<SL>^Oe]\Y>]]0f\CbQ\UYRT??(E&URa7#c/51d-R)Y/dQ5gZ(3
<:J+N])+4a1NL=WSQUBD_SP,#A<9D#B\3L/U7/GQ(S<X_G9HGFUE0I#?B5[2()6I
=e3:.\cB1ZE5UIZ_W+[/4,^_Q5)24CCRD2:_X_.Y;&\7Z&4DgP:A14D/BZ_-#+&_
)H8II6\/)5G]Z4;#2ba1)7b4YFdg<CE-GV39FgSL1_\Pf+>8#NY@_]/?Yd3S<72A
=&HQJBP6-.NZ4360^6-d-gfACE&0eg^0EFCH]@W?O&<<Be)V;0c99?XL.USgKb&<
@83_@,3@^dZJ/AXT=M#ES3O&4D<M=^\=A9+ceL;3(-G#KW@3Y(^IR2M#:TZO+_QM
<GW559_IaL24R>]1gYYYIU;5:,G85=4GT7D-U6OCgb\33a>;DK0WVQI^&)Z3C&&E
=NC&cN+L=:e)X[2ca^LYdZ8\G#0P:C-BU&URA56#5&[:)CTOc5E5U:I5OJ1T2#2Q
J0R#F<9Zf>d_^SWH1WHJ][&&-IFbBf6\F9]^UZ<FdARA1CIgPa0QL?d@7QH>[L+c
X5EPSC#0X&ZHQ414E#aCJ[Pa)KMAOQd2Ig&]??WOcQ>H+<GI(=d_QLM24:5=PVNC
#>@Z/HNWDb[^S]M+5d?O\;GE>9S37B.D38NNMHaVI>>98adV6EO/=g,Q9[TR&BO#
gL.@</VSbT@M<57=]034SePf-<&SD/H#PWR48f[g6BW#d=4&HB?g+bgO0PN1/XQ?
7g#\6^Y^f4+M+$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_JESD251_XSPI_SDR_AC_CONFIGURATION_SV
