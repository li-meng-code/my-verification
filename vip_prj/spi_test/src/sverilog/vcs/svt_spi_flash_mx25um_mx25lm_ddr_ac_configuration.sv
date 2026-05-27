
`ifndef GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Macronix MX25UM/MX25LM device family in DDR mode.
 */
class svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration extends svt_configuration;

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

  /**
   * Minimum Clock high pulse width durtaion.
   */ 
  real tCH_ns = initial_time;

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCL_ns = initial_time;

  /**
   * Minimum Clock High/Low pulse time for Fast READ Octal Output command 
   */ 
  real tCH_OCTAL_Read_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tSHSL_ns[];

  /**
   * Data in Setup time
   */
  real tDVCH_ns[];

  /**
   * Data in Hold time
   */
  real tCHDX_ns[];

  /**
   * CS# Active Setup time
   */ 
  real tSLCH_ns = initial_time;

  /**
   * CS# Not Active Hold time
   */ 
  real tCHSL_ns = initial_time;

  /**
   * CS# Active Hold time
   */ 
  real tCHSH_ns = initial_time;

  /**
   * CS# Not Active Setup time
   */ 
  real tSHCH_ns = initial_time;

  /**
   * Output Disable time
   */ 
  real tSHQZ_ns = initial_time;

  /**
   * Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_ns     = initial_time;

  /**
   * Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_min_ns = initial_time;

  /**
   * Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_max_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_mx25um_mx25lm_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
6XUV1YVS0Zg#3\>6JW3<aQ@N=4PKN-\43-DQ6^g0e4MRAJP-,M[B,)D9H+3C,?\Z
H7@8;?W3HG#+gJL-:N>G?AFC7e0J#Z-4W7=8ROCZWdOMT9(6_(f/842H+&g.@;&\
OcME[0353LYX)dT78FN28e.e<Ub7H5E^10M4ALc-08T;L]9K]C#f&bOG+(.2E?\)
D2;QAV4F^9AFRU27=+KfOS&N=S8LUQ1f+a7dWPgM]be3&MRE?B6I,\3QYXG)S0M#
922#/U5X1NE.EQ+/8(/_\bb[D6](?(\2SHNH=A=MFA>)[PT\FQU#-Tb98WMBZ,D5
I.&9)@G=+@ScgJ4]9E_X4&X[f12?XQO=c,6M>f1A8Uac#Y7e,=eN:4I)-5b7Sfe_
fPJ);C<APTNg4Z\0.CCBg/@VK-#N<LDe@deHQO0)A-.1/-POTIKa:_Z>;1A]K9WW
[PKH33P:=DHLH)ZO=a9X>cV5:XWC&1,cD&R3AD3M8F/RSNGN/K>.CZ20]S)#W@1G
JX/,/U5#F0]D-?##Q[^eWU9RC@#F4BaNV]89Y8TV1D6?;^M2:Z->,VXeg8e>1aSW
E3CZ=LCRd)(G<2];TF/BHcKN.),S+cNSZa@1A/_cK<9QZXF)L7f?)545Z=H(M8B/
EUH&XKS<b-T9eg9]4[I@MbLM]4:^=>2fXQ?F3F#72<M4\<A<7/-,=;f?OKHLa@X7
C0TR]=Z-U[R(GE@5V\\1Md4YR6AR17#42TF=2/b>P&(_BgW.aR]7cXZ0abKg\RJ\
&>.G]GdD-dYH[g@b,VP]aJaJ(K:;DeMO2a[9bO<]&:7NVS&]gQ_#<dL+.VF(S2)cU$
`endprotected


//vcs_vip_protect
`protected
M9G5eQA,4KNQ<<eQ_C2IQ^\[bEYC?@N^>PP(7+f\2\&,dN/\Nb,3((>eNTY/(5Pc
.6VC2<aHN>W8aSg?JYYeIXTF#DD]]:Fa\\@^O605f0)\[+:XdXQ-aO:LPW0G95;f
Y6TBg>@gScUTG2KUU7]W+Gcf/aaB-b,9Y;W1)&-Sf)<,NTa1(5[9XcH<8E5]:;_T
]U<(\F:EY-^7D+@0b]\Z\4eV=;4Z:13[G]^Q00763+<&C/Z[g^R8R37fdF,bDTPb
D43b7;c;<=<\P@L;e&[]WS=?c8JK?@#d1@@N51P?OR23O#eC0X(((N-dBN,USD[,
7Y5QNTPG-1(9;]1\3PL+YQM;7MJ/0\a>H^RM]45aX)c?ZXD=2P6[QY_525]2,dg^
84TbFJ.Dg2d1FRNf6Pe=W2Ka7CY@6/S,,5D8B])M(dCd;Fa6>0YE)U/I.KW0)1=Z
e8#SC3E;dP^AOd_8IS-e/YXNR^K6^\+1ZH/fFTaGD==W#K9(1SX790RgCP<6MKVT
DY>Lc&P:0Pf,4B(b]Ie[5\=]=W8SWb<UF[=5Q.7E4(E30-#&bB1E=fBdE:F+R6#d
\L)XNJd?@WA#d7V&FR&_FI6Q/64D2KM@cA.+Q;NgWGD:8IE.c;I0UeRICb/XGV+K
N;Hg/KG)@1YS_N241CP\\ET;f?TTFBC)C0T0dSe.[c.:,2K3BBFEPI<#dUG2c]&V
dfC8HgdZdO,7G)?V+DWa+LK\>Ve;O8<I[PJ;ZCB_Q8Q5J(QD+ZZ/..NMXd<<(E^8
(,^QE;IV.9RLZZ(ZH4e4Re/e>WF2Z_/[dBNUQPA,3LRgBYZHTV,^,#eHSH/3CB5-
G@UIJ/FH-P0JI5R9,DHV_3d;c]LG:9b(W:ORU,/)5A^?G.0>@g<HT[B@fDe&a:^2
\CJ=g1\GCC2/H]Pb;5F<=1cW,8e3aOBSg#PK]O5E)PX(/JC5I.-0b);LLdPD\C4\
+g^?W#45G^9J6YUI<,)CS-/bQXPQ[DVU8EP<#=O317I+HQJYG]DKDXFM&GM6?1B^
\F<\GfG0]XfKNIKH-eaH.3eKC2,_>JFTHeK4=G46cSBUg_7c1]b3\1[NF\YD6(O0
Q)2I)e]P(gKWX6\_)J_>(I\NeG5Z=T=3eMT)d#5?+\X)E,-?a9#F&)W51&SM&CfK
V3,DU2@#_,#R2d)#,Cg=5M)0U#H=)4HE8af_IC4YYPc+2FLF?.Se[QJ-VI(K:1>^
((Sb89JE1)dRJUK?dMJH:2J=>@17D?ZC^#->[CgP9#E<,&>EI#0L(A4b^92VZK0V
?,)YDX9U1(2DFBfDP:937RL\V/&f6[Ra54/F6H?Z+;f.^[dPPEeOR)DYJSfZ+\]2
6e43)XMFa+GD/]6,NZc(T_gg\7e@Pf]b:.+K[1@GNV6##8N9>;\6+(gU>6DW;6<-
+5<HeHY#>@95(Ib,EH,F#9#1-:+]#)2D:&?\[Q_..Y^6P-_H5181GL5>U9]@M(b4
J3CT?WG#BB2bT=NCY[6e6e]?:4:]_G9<O_EVHG)O98eZ[WNQ)[dNN65]R<AL+#B]
V0J&@<^@KG)[=[SH2DZ>7]9G^DF&OQ&Jf)UZfT2dc70_D)Q:Y,IMHLC)UF;>\/A-
&0T0G5THaS6JKB8MW:ePW(:SW(:M#LYB]3KAE3Vc)./5S.PZf4e-V^)Pa4D8?]@W
KdG-2db\&&KK>a7A\Cf,5K)YNEBZV+)Q[7LaZC.ES6b1MeD<NI(-N<#@HGXE5G6>
:4V5K,H+X5P+D;acTJEN\I0HBG2,JF]:HZ0;(@9,W.?[:Y=.DIG.M?gI4<2d/630
fPOX_F7_:2UN[?&71TG&R.,S&>03_PB:.ZcDaZ#AMaP6Z?_;O5&N)d_H48c_FPbe
.9-/_WW)bdGRE?&6JSE32dCd-A=M4.Pa6L_(X=<V)-4\/,CD8;K=f:5d@6CgQWaZ
=N@LR?cS-)fQgg.J]MDALE6U@a[737gH:QcP;<I:I-+)P4<CK;FAeE[MV;D?1O&;
3JEQI)#II,MW.:g=e2RQ2f1:R&d;Y;H4B339EP-_Z^1A[X^(MEd:M_3O\+@18)33
QL&0aZ)=3e?.g:+2/0+@=O=T,78c.dE_NfNXUE@Fc<RfFIP&Z)V3D/))&^NN4&f9
WbQA=(Q8>YI-_>?^DS)R:Jd)\:[ZGfbb3MGH(E0>1@GAUQ,&?UW)GE27:Pg^RBca
_&8a.1LOg5CE95OUCSg]CH;XU6&JWcg2Y\G<]@\#QCJ-WL/a1-U6QPJADSc[4d<4
GD2TXQM]f@@6DWO04N9I_G/_L#^Dd7YO\@W+A<1d)L-@JF)1bW:@Q+N+:I__,RW+
BL#eV4-,,)cAC>Q2TP#AOL2N9:/2,J=A(S<O2S_PceFa1>65C#a@W,ZeDS/\K+Lf
\X3/@/A9=O[/g=1I3A8b&)=3K-9f6gcX39_WS02.9_-TXIT9UOD#G5/G5DJ:;LV2
B]^;eeMC>8=9WV4eWfZYW,dW<[1g5ab9?Z5M]DE.S:aXO(-YGb0&f2C>]UR>Jcd1
#QIC_X0R/_;d]2g0&=-3/4I_?(#XZ]JUY?Y7_PEA6deHMW0Kcf#NDb]3R&>BW1R;
[Qe6W9PGO96<cQVeCcCSbQ#1VL&F]P+H.3^.#QI<CQ2XMfS/LVa=^Tb@O?_W0JVe
f[.7)d;H7L#3H5I\_fP;K:6M_5?+^B4\EYC/;K0>YZ-Fd_9N>#2:43YZdU#S[QGc
92]C.;+-.+0[g#2COXMW-FO,P7#0PHH:^g]fPGY+M#S<@/#g^Y_<>VTE.&96&3Wc
e,1dTTS0=U:9dA]Yc,bc&N(F3P:GMNbY#)A=+ER0Y<X-GV)<.MKAT]/MJVS1O1,.
7Z4]KdUgC=cVc>F&QJ=AHEgUf9K:Adf>PEgUYTQ/d+FLg_=L6G;+R-c&[bNQaNZf
&d#^g7===-+g9<0H[^JF,SH#@2E0P.&eL8M+7R4M893@+C.HNH[+@MFNEI71YG,X
Q_IW&XRgEZYBQRD0[e+HcL:T]eYLBA_:,[cCEFLe9Q2@0TBe(,IB0KgaBHV&(]Q?
PEb;;I01SIM_Y+[)8ANS2d]PHYV+^=A_VRZ>d>0.SV&[Z^@K/:g[[C8]A-UeUY>8
b,b2eX5/MBB3F.PQ^TI<:-PVAX-^Tc2_Y966XA#BN&cA3\OcDGR:V\O/^gEP=<f]
PT/XW&A^W00M5G&0SRHdf5;981X22XJUW<&]VJWd3Z;PVF44g)/KEF+>V#:C:4K7
5G3_/\,F#:)FG,B<LEc8LAMWJJPNZ_-C9;(@gWPJIJK,1]8R&)>N^A+c^&9aX2_F
K<Yd43.5<UKXa\3<eE_+[f22RgAO\Cd>FPS3&f6R;D#^&b7PB/,bGWeReXF-YXGG
ge=BL+a:4Y<,AUW(dARK45(>[RT;Z\[?eaFg1O]NG)@9IdXG2fLEG__Z[fHU;X)d
-C.#J;24W#BPF8T:F-L=EaQG/NR_H1_b@JU@d_V?Y,LIb/P&@aVKMX(G93:9_f#g
FJH=0LQUOZD8GOB_ELMa;S=,NJ5SA9>2MRAE;4Q]dS>9_ZSEUMG+2ZRSIAcXYFZc
X<6@W37L2,H2?FUS[KCZM?@7=#4>3^(I[UFAM6KR#(Ic_.]PK2R@3M-=a_5PJ6^P
<@;X)AE&;T[4[F]O+?]g]3ce37_cI\G:@O@4CI9]A=@1/,I]a6d;H365aO;ZW^TF
dZefANgC5AE-.38&d0.NQ,IY?0cRT=<HGd>E?KH)20GPe@,bJXO^Z\ZQEO8gZMQY
ULBc)PZD4A#O>G0Uc-XBO4<ZX@)caEbc-@M)9/E-3T94;<bR+]?YE,HKFUSD2(GJ
+P)WS;0BQe-I#N6]NMdF^AB58P#\F6SLePB=WM1QEdUWXD4W_KK2cDS_c;LY<V>W
c?9>&0&,+C_#RDS-&,9d[fDV\RHTWD<4gTRXeCFNYQcH(66:<ONXV]69DXGA]b>:
,-d@/E^P8GM#_BMGP)C1V@L[NbY2H7aCA31?+-f?QTM(]Z:;eA_4258O=gLKRKFW
VO,H4&C/WY&8IK4&P8Y?J\9,SDN+(#T6RPLd:d)<TDB3a)G:1)^29_3D^X#QU1Mb
@Qb:9a_4]S6BEN<@.\W-)[&K70L68Q94-g@/d;CSR.C9Y;I-9ZSU-<;AVYLWX01H
P57QYW&(F[DGKFUUN0X+5GQ)=NGZE-VDGR5KHOK]X-F59W@bb=_4I87:[WQP^LbD
=aL7S:bO3W_;2N;@37Y6)([QDD(U2=-VNO,;_1d5V[W0,D&),W)#648OgAFgTO3&
CD.S/(:I=UYQ+U+2K@&K_VB1IR:(IA@K](>.J5I2V?IBg2@cSgLQ,5R)C872U,J<
/4(M>_E80JD_]@SV=OL<eD.WfY6E=/ZX1EBTHLHa:a5TL:EVJS]66G@.;Ob>O/ZO
9=]YS/?RX-)HgFNIH?/:ET;=Z4R4LK;(?e[S-<ggS#](c&O?XXWKc9?V@P0]=\L[
7#T3B0C0.W4Fg-49V\K0&EFV>#(UAIHf_2@X&@2(<Y1LI=9GN.NfR(PQ1d=H0T?e
^eWLd#E.C_;HIP@Xe4S]ZePaL(gP_=(?:T#HG(?RgC7SgS\PIXBJ/R3\LQK^_ZQ\
d9,<FLID&=/7^_eAH.]A><fX@YQfHB5U;.^:a-4fbRf(Jf#>abD@:0D1V9Q[S]D-
3FE77/3949.:d:\-KCF.AP;-.[)[RYZ:M_HXf.G1?gH.,5E-VI[UE,JK==LS.]N4
e4OdIL4COgX]3d\LT&Jc[1/]1_3ZcMK,VGK,XW,.LT()TT75:GQ.eEG\D@dHXUOA
+gd4D,@B=.Z17]#H^b_A5JMKBK<1H04LNXX2IYCE:gH_deR5fXA.#>D\E@#bSKGZ
9Fe5d5S@=(:/GXEC&2,e/+5]Ag\5R0KUVgMS[&,;T38+=0YSZ/K&8)FMM=18\9Fg
WE&fC&1(B)IfbX0H#f6>_)_<81e\IHLgCHbRRaJ[)OUS.DJ29DeMS0g\HbW?>^QN
XN,#NT#gbI;:e,/;GCLcP/FVTdA?W,[0BTgOT#9g_=DIS>]GR871NGXNBA?^EF^Y
&B/:b9EV_[EbJ4Gb&W3UQE3+]dH^29^QITM9&Zf?2D/D&.#P^I^KY?4PaM_:g4^]
I-I[#><d=gP-<-,&4=[J0;.8VA-ESA+.W[?F])TK+>c7c8ON0>Yc?<0@RCX:LNa=
GAcJYQ;B8F^U+ga1C9&d98eZbH&Hg\H-C,;FBL7&QB,FY=ZR1X8@XQ,DcY.Ad.^G
<TNa:?Y)0/8L].e])WZYNKLAN@.N=@<W+O<f,N>=3T3QL+>b[&J;8G\]Q&fR-BK6
5/c[IL,ZU]HBFX+QFG1X:-YW4R>X__@DLGNc_MV./A;^?6EM8gUVab[6dMN>C/QY
<CeMU#^<^-EI8XVX(+R7A8&7g5@]_)/Q.#cGMgU[\&Md^&-D+e#M:+=?TZF9[ZUg
Nb7,g#K20a0CeMX],ZTF-]4<=56;4+EX:)6<)CPRc?ASC5<7PZ>+;?fbQ0b=:8K]
BR>K(_#H,L+[_H7N^Y)J45Fb,+4IeWTP;)3]d[C:dUY@<^edf@P]VUAe),/8N^)[
LM^TGM\bf+Nae+aK-ZH/+f3a<^:99)>WdGUV4C[D@L:aS[7]d(eGT5WI[9g6(f(/
=-SXgBMJJ[><)\_@NYGeb?B6gQ?;D5NJR_<JUA,5PFC546A_](aG+L&BZ1Y>:I.R
fSTI5g/C##2M+#H[fbIQ:X\V.66N-=KB1<AI&.]09[a.,d5YMS^af]ZcFVM(:HPH
.9dSCbIb:65&>Wb6LcLg?1-fU4-agA=Of@^,cLN:>-F&K0Y+),dK8JY#(Rd(O/g<
JcX.Q&)(C2<dH1L)LW5Q;B+K+dQ(>SO\fWQX/O_>3a4Dg/DK+&(V[M;^[eNW=HdB
0-6CLH1G,d1WG@_/KH98Cc?@&??<FFI2>XL,=FIe_EH.d:e(M\J<+XACH-:7JbSY
]T12KEDc6#/dJOB@\Cf9/?cHFf==e3\(1(HE:JP?F60^=C9c+;#0M0,IR.^P^RF-
-+.FZ6bLD8^Q&Md.IJW^g_DZP=T-8(abP08(:S?gDY/)ZT<cg=MZdHIDP;[L#f#8
4UFbQJ_2eCA]VKL@4RYHHW+(/V4DTMeKb5W-&CC+FL)+6cV]N9IQaS_:a>>=782F
:-FXHg;&0UHU[_V_I)QN=/L0<fM&RdegEV7&KG\MWZ>2Bg>&,ZJ<DfJE;FJf#)RN
W+PTY_3VWL/CL8Q7(O#,cIIHALJ\ac,fMR:?&,EII4U1FG5948@gINCS7-:EfD;#
D.fHI?QE,+:a0C_c2LUF?4;d+Qe9PXK7.=T&M_DD;L7&/WNEE738VQ_U2XJeV,:P
1dIJ_@JdM/R9=#9b>E;Cd1E@C637_WGK6@1@M2Ed-/770U9Uf:U/6CAG:<THb;G+
HYS(^@0XAAZUB#8^>BXbfE>INV@2AG3V(LKM7_Gg[N^M1<MF402-4:RD,V,:V;X6
TXR:?FJLX+0Z/]9GfcBPg.2P?[YcG&^/K;aI1+CPB&S-ZMU;R:;\E+_<9.[Q+WMY
BcJDOee[PIM)IDY\\5[:C#FY4N+V/78YOgg:>.@P>DA^]X6,\RYgJY/^,.K4J1US
S)93I\U7=c)A<F]2LU4DJ\IQ2AHXFYEDW:4B,^JX,d#U#?]e@fOC&6e:Zc?F^R-W
aH\_FHEA26E[b^6))#D@AX[[2:#YRdMI^;R=\S0:1\M;M=U]TKRJ?YLa^#)@B#AG
<P8L^[gX8(f,WV+M/;\0;B[IK<7+O]&&A<d)NVETT/_PD(d<E=NWUT=<;BcSU2OB
KHLg=GS0:\0:=-IR,f>SJfSW&^E)S?J381YXZTV<>/FXfEaGOD1PB#7cU?AH::2e
3YQ)<:<&=\Z@M(RN@^B;?(K7GCBaXb9QRg=61eVb8=@N+RWDL-)^/8EJE;F/BM3b
_9W.;7Xe3BD042ZX^4F,^ID9H#<Se\PfIRbV(2=A&>a4RMW2N0ZKY2<(B>gH(C7U
#0(5aN@]f30dJbX1[EJKLYb]@.T+:GW[Xb+b[J8O#MRYFRUg]2AfAEKUDW:OW@Z5
OUE?bB)C7KLJCF4Gag6^0RJ+NAQ@&;Yc/bbHL:R#[\#FJ[7.C5Q.g2T^(VW8IKVB
S02C1J<BNeL8L@f/5(Bg,JMcV];54ff7I_XIY75?f:J0(?bF696P@^=WV@P[?64_
c3a=0QJ.+d]c+d>2>Fe3Aa-6/;4IN^)H@B<4c/7/De43QL.S3O:Z/ERW4B77YPE<
=^T7+?O1cA9VO5LI2_C3:PSE6F:Ie-R@a++/c:NLQ8UR1NK2_)fg),DAg.#[<P6Y
-f.-X7]+eCG>3D/F;]=4K<^dX?NIcY<W1H@JM_SbG3Z>+0TU(Uf:H#I_)]QOE91^
5b:_<Da3MQLQY0Y,K<cYcS#@<G,1]XfbBSGf4:dWQd1@@D/+)SU^=Z)#>#aGd+MS
WSJIRUWB))KVeDT^&AL>aaRD9B4U.;-<P3BH8^c0]&D3;Ae6;+Z?N]-Y/;U.ZY0P
+FF=e)aJ55f7\WD8;AQJ#;R<<IeTMd5@90F+94@V=DLB1:.BNeCC/+fPO;8+30&O
-2RUd>[UI-RCg^H@01Z;e(;TDV<1N0?fV.W,5MBf,];B0B(R>b:KQXabda=cKH,N
2QaVC2^^^3+NG6GGIQ?(?]>5Fba<MRHG7O:KZ\P&=_U\2a;=7e-<K[=XY#>>JBY&
)4R1,H@:g.[_+D2(8IZF7Q@GEcbDc5gGOF7-/Zg_TE/UM+R+#OfF&?V&[NJ]U;^J
@5c4O3DSA7HTN0,6Z>OLQ8JR<)=QYMP->Rd&Q=&-BX:ECTVI/J=4.0/gg#+=E?0<
4#,@X2?aV^5:aRZ.Z5ZX46/dO[#^XPFW5aEJCDNfP.dH&cW/0e@Z&R;22DQ-M9-G
LA?e-2246GS>=c]Y(-Mg8]F)bJ,WS0^:,Y0dGbWHb<,/;8&5eYf6YK@4#U:45V&W
Ob7-)g]F2P+V3S6XfWR3QV;QAVBOB2Y.7#[^^(f68U,8.aKg=0#)HHgO+Db;@:Cc
7ZRedYHQO;_fLEKf+;SQYe^,gJ]:Va8\V<gb?AF[LO#d@C_^6K;0)5^6cE>VW:Ke
Ed:+<d,6T[0_5R@]\??Y1XFa1SG<\.W:I?W0?^M.[M54)HcB18fW;b]GKTDG?5b@
X.8cXFTQ#Z8::M1IA2K/8eJ>DO@<R-O.[J1POWLK([C_LMA]FGZM#3Q.efG3cdR^
9FK?3GYg544<K+_-c_:\bPQ67-\_<4J,@Z,=^WRCd2Z9^Hf4(4WN6C;@U+0S?KTd
1f)7#a&043,;Y9?a_OCcZA\P\/7Df#(^T2==>AAaMB:3^15G>8+Sc1FWaS0<A9A;
30d_^LO]IAE.],,?c^gG[#ae1\4/T<8<\SCHC@.BJT[NcY(M&5cV+b+-S+A;.142
;=.aDd_@1DX_MXHACM0<V,0C[A121IDbAYIY-IIB&=;3#A?_;-dGb:Ug8F(9dcWP
87E(S]<PSRQe.:fE/\Z>JEJ(TH2;I2@IYbKW&]R5XKQ[1=7SC:#6&Y1PH_W_K0RA
P)8PUEYf2&)VcS94F3<Q7cORFHZ\NDXLL8KA5^.Oa8?LJc;<J?IWf&Pd^1>Kb)N2
48+C7;+@TPQ7EX>;X5b?C6:6;WKBeOfG(6#S5>8@AK:eMP(/#9&5JN+,3D7IFM7C
LBN195D<Y&b1,BQP3>7T++<31-DeD=EE)6,VbQb8?WP=XA6JWBMg;/8740&gTHfU
USTIC/_D3_>QK5.7Zc-:Y]=D&:E3E>S8Ze92aF4=cN[1S_<X]&/^+0)H6+7DU5bY
./C;[V6D9_C9_C#I68Y<CaWF+Dc]9O)CWP4_AM9MOfX@LN4fWL@G+<H>GN933UK;
f?VL5,^)^6K/T=^gYY91L\cE+1EF=O0NB.P_FA+<JOO?^0G3&^5T1_:R01gJP(/8
P7\V&/VZe--?#2C5B4eR.:>@NCeF1[d@(RI>Y2?P_Hf7I:K6deOd4_9JC6)+S?:L
UKfN\;M6(DEA6a313F]LZS/[2;ec^#E3]_YQGga5KcFc<-#7LgP]VgbN<#Y&Pc.(
P\YXUAPKXJZa1?C76#SNgd>+gg;>?EX;J6:5F8X;KG8O>JHRS.+HVNGb[=LNTB:>
?<<&#J/_<d(W5=T9HO-Df.U6fMXY&U@ddQR;R<cFg3UOHbbgSa:O#H,_;X\e+H=b
#dc)[XFa2b_3U3K4O-OcG8\7F=EC>=]Uf18b_2b+#XRP8;c[/+#Q[OMXZ9eL:LL.
KK,DF[VKZNfcg+L.=NAEO^5I.3)^D]_YAc:gA^ZK7/DXBK</]_WJf9?;SR##7:W#
Y9#(6Y9:-?W>,JJB?e7W4+,OQ;^1Ia;JJI2K469GH?eXYB4;d>]:8)2LdF)GD34+
(T@26\AVR<,HEBIJ_:fGHSggFc41-E3eQXZ=NLH)\3a<>>UCffgG#WLdEe#I\XXD
[)C^500^Z6C],6eU59f6[8^2-7\0b_C(Y2_Ia^M0HGP+O1&T(4GN8NgUd-C>C]aR
_1\XI-5Z0W^P@12O9YI_STB1JT1B\&FY4:291.cK=V_3-CB:bef^F73DZPK=TA8S
T;K=EKG[f8=F>-DIWY(JS1c7;^V80TaCWb00GfOG0E1O+IT(MKL_Uc((P)AEJ)JX
dA7=:#2K4Z^J,B,U6=<Wa=3(b2[P6SR05,]f[<V8^c>6b4:7U-@^D/aV?USM#S#K
MQ9&Zd3M9ME05=\8KfNHQ8&Xg76dF\^U,3^&?Z3<#O_J7T=LRG)0.?^1c;BB<&#.
.G>>KIJQ(.^MUT6ALKDUT8RM#<@(?2=9,UfODFOKd:>:BdPVMf@:CIWcGc7Jc.c;
T1,WbJf7Q8YQQ>K?#S6,.c\Vd>Z&YB4U?(^a?bSI]+H><Cc;\LA7C5+_-8gV5BI;
,A<XT3fD<2&gV[MUK#LS(BSEQ8/]0BdC\4Ia@g#?NR]7]5_:)b3I<QO_><f+O4J,
E9]WR?OUcLI)7P@eUB#cP31fB66RV6E/?@EbYbO/fU?d);Vf_^[:Q91;ZXEHON>c
;WCY&5MbcA82\38aWVc.T?.9X6@Yf2Q#0E>@(@MI7>2R5.Fa.+a2gdI.Tf4#e9;>
R,[T3N(>dg&V6(NX7C0U+AGJM:X0N@-dK;Sd^W_Ab:41/2@1=5PEfGgEg+U)C#_g
Qb&IW-H1S;2@]^SA,G[N4X>ZSXC+>aM.T6^H;=(A]#7bL[MVgB1AMNK=U;9:Rc>&
g#=(9\Hc-,M;WYA3<9/39&OCW+B=9LND&2]L+ZJ[#,+48:0.EJNYNZ<dR>0g@Zb1
8eKQ:58+9fNa-CR]Dd1eMYdQO0g_7NK(I/e28S8D3d]_WAg014bSS_?cMA8&>A/\
?f9X)W6K=[e8@3fY[)QN0ZC4?_LIO3F+^4)4H_gH-21#ZcLH<=[.KaJ@@32IRgOf
?.g;EJO4.c3@)g?#>c@EbZ-K@0;c+G3f51d,GdLd>JY&8[?,ZeZH=J@.9A,)d&2C
L@_M(\1WFcM\GQFJ0(H]2+R.U0ELVc@TEW3^dZ[\2We^[KVZfaI8XZ46:)9_e^7?
QS[Ac]e-X0JJ8gZT-X>EC0^c^E+L1V>J5ZRJ>/?O+N>(HQe<\8+FH,6/B,G;fK:b
=JIN,KQ7PT#Mb8G9[36c34G598AC:9NTS9873KSVG_NGF[3TcQJ.LSaXTM_eGFA-
,T0e89/=\1H]?E@N^<TOZHV734@4O1PbV4+YA(&>c37&J53FaI9@3<I(D+T8&c^=
_[:+03M9_2c03eR<[;6:[N^,gFJaXF1:[FG&#LO02W(:=41O9cO<.3PT#8IZcPed
&d>3WT;a8/LJ4g,5AJT91U7G)P[8E^^7<BZCQaA^0Z]6b?[>^FNP2+F<TWUXdg7W
.9g(SX&(:g5Z@>F1cW<D.98bVVC.dW86bW_0Z8C.>1gS8(.H]2M4/&g;39D;@&<-
LOO7e?3d,VJ\_M]c<EEGD)/QU]K@+Q-F/.JTZZ<\21>W>JR)dU3N[@G&Z[IZ4Ecg
))X.MN159\](IASEfcaOJ=:0>7CSfXa+9[](C:E\Ogecd\PQM9D&)Z;/PU,g[ZbR
.aACYF&Q\Wb<F<M)IV1&IadNeNSPC5#R\LGKOHd6eR;KDCMM4D7cEe-c?QNIB3b)
I,Zc?THQQ#3(V+M_@f@I9,gE[_&[cBVUP\Ab#6TRQ\7ee2e/HTGRgTa+)H90dcJ3
W]+b/B@;S:\I2-b@5&c8I]5X,@2JRT)AHR7gYL^(8:TW_QA(a:CY0KF]GSU\=5dd
b0V5ZN=cI:0eI<VN2Ob&g@I&C@@B10S7gSdRDL,DdU1?XP1QZ>UA_bQYB7gJO<:Y
;H23eD/YEdDYe.B6efT?MKER2=SHPQ[.TOB<)P.[7GYe63bc,V=c/R6(\196:WUe
AE5_TcYB&@c46K7IA15S=J.]g;@E98Y1++D5Y;1LVOG1)-LFM3=g#8fGeYSc5cP3
Y=J@9;184fP;eTa>@EfQDP[8)J\2UV6)V(87XSZaI63YY?2I25/GOP?_-(7f1&#3
)?&/5DPb=JFH2OWAHg.M5@8(8fWZ;acBNe=4?<SZdW::HLgK@Ye;1a3P2<@0OOQC
[e7MWC>=@H<QOE5fDdE0c#f=38XIY6@a+d?,84R4O?V\a?K1A1;?I\JNI5d@&_/#
NYJ,U)I=]098IKeI[(d[(2?Rcd^-IQZSQS]DE1U+.fE.JE7?8AA9/F5\GLT&L7&G
WfLU;IAXMK<:_#R6])_+VeBIc(MR926@:=ggDK>eM?eJ/?/[C\O&7b;TP:3EGf/:
+VVWO0M5a,1P60NcdJZZRa4cJ&W2GY8)05)a+5[SYBTO@><4\]18)1NN65USI.N8
e,d#c>&0C]Pd;C)F)c+2LR&K7EG8ceSBKMW\Z0439aMCPN5U-Mb@8a751;SS+(8?
O,EeJ>cD,#]_KADS63X(O6S#^4+FUR)gGY-da?FAP42[8C>[&@aIRJ_CQY0HCf[:
e<4:H)/&N^;<5M9ccF@=G.0>E?<G1=-C\7:?cE&[EWe&Kf9/a>F1?FKV4Z9GM#.,
ZMY>f:>X=QSGb<dB=39=KKC9O45H7R)8,GKFS&6&FP+a+@U8PL>UD,ASR)+2aO9F
>2+>.PWRcI2=a:[>b8>W.OA>Fe_S,_++06HAAb(2/3#GZ8f\e^VY23CE^8QW9SLJ
fgVbOJ[A=-@JBb7RH[AJBY>#]/X=M(1+:^)TB8GZ5K55=OIM1=0cU#^;60PFc+5S
YB-6N5FcYXd6+AAP&+_S087.NK4bZ=^DVgXA:M/B]H>1ET4=P;75;DfPQG#,a,fF
dOggR&;<ZDB\I,VcACCG^_T)b6>47HKNO&_<?(7)I.XJ@;2]#4-;TRMW@2#M19#8
=R23W7_.Tfc)AM[,_H(9QH2WQd#\[3]cJD^6[3W4#EMg[U+f^:W+=^=-[C)TTgFE
#W9Za)X8-e0a&(f>;c-baC/FS&Wd></,YXTV[QQV6-B0<6M7V7@bG1e6CA0ZcHf#
>c0_ZVU5=<6bW6)eE^ZW(?DV#EZW):2a]R-?dP_,:A&AHGC\#Se=M[)<VAd=ag9X
d/ZH_<FUNcN8(Q=a)Z3d;PbN,Z;60E93>A]_U;/1RQ1+F#;2476a>(cUg;_45^7,
Q?Mfb:6de<TU]KQ19S:2-UXM(#-C@(N5<WK21fH@EJ&Q1@DLX3,A@>^+]S.J3DTK
9g;K6f980@GT//0NKd3JPDXQB9&=PV6;V>aL/(Y\?c=b,W[G34E.]X2M[Nb:+5;]
@4K]Ze9B[DJP1.Ra21R[gFB,eL2DC-BA_fcS1_VW5)XP6/[B:]>1+?HRT^RL5L\8
H3LIQ;^_ZL@RWfV46Bacd-BHfH^Z=VGDcX#<C_GG;WQ=S?cN<B6._0gM;(GO=(N[
<+_/a(ZV[^.4FO4[]S1aDM;VE?H(NV:ffL\=XZ^8T@YEH.)G+KJgfge1FP>\-eU(
0P3M[Q7JQ+3MCW?B8dNU2fWN/_6VNWPBT.c<U;K<C\(Af33[E[FeJb(]ZW@XRQFM
9g5SC56;5V(K02Za1Q9.:c\8M6b27dJe^g)U^HT.#/-Q/_);1YIQYbT_;g]HD_HB
V&Ae=)YCAP\1/HFL)88O]dKc>1V2>XP)+VNQa3)5^6N(_\8AN27@S/<0/1C1dD4T
KcR;)\4NQc^d@dWb6)\-NXa\d6[953,C8b6CR5QSXb7=d[<=FDD8e0aXS#ZSX]KK
1F7<Heb5F@_+125Je+.@Xc>(TW9Z\X7b0J<Pb<_YJ.Xa3G2#EdIM[_BcS?Uf^U0M
<dN>-D]fbOXZ\VGH[=TP:f,BLM?JS,-QNbX>fP\6c15_6CNJ0bBPdGdQ^/eW\g(;
e(>+QId)?UC^QE>\MYUSe4EZTPb:2C\TJW(N#QAUFd3&Y4XYL\5gZKI3/,7d&3#R
8.O;5O170QR5bJ/ZK54/+?DA=@0_(GG:B>B\(9JcbK4O;0f#,?ecX5>)RXb;W)&:
@RCD.WS@KF\Q.-KLQ=I5+<^9eQWQ&XTUY&fAY];RO):^d=:O]:,5GI&8<#.+NNT4
UY>.OY+/(+,QKC]R(/C7CKLW9LMGbE7C7K^Q5],Eb-]PH6RY8OUHa?H2RX<:L?/X
d@8HW&g2UF]Mg#4AUBJg\8J=Bd<->CFLW:+;Ug]1)T8)0EJ3R@=aS+F9#Bf9/,ET
,d@b=&cUI&6CS,YDM0H;b035+T1ZPUD7Gb0@F;YQf\bbT5a5P>EEO]QXc//M@bW7
M58MF?+=F^PJR:<..;@;@Q33#EZd0T+bbS<?MG-d(XSe)W_AKcge#?aIGb)3cH+S
:^3;\06KgH#2g)#.b3S:ER5=PJ@GGWY-3b<L.UX4J1FG8K,aC7+E[N^(9a\).X4.
WebTBG=:_&4HQGYQaKB2<fUN+bX6^V5+.G4]P/+f&6^==>_@?CbSESe.)PYNGg,:
7V&NQ6P#\5bRKg@SS<SEB4fY?ZN_5T^>Xb-WN>;R=S84U7]b^f7A32041@GGQg[a
56V22WGg/]R6C/6/0O\Y+1DB?DbO0.K>3VFGNP?W+TEE)0Aa_d923E5@JWI2gIW_
K6AGK9gOU.EROf<L\E7N,PH2_5a7@4KTX7YI(&X,PeD(cZMMKK3A0@0Se>/G[S50
2X?<3I:/Q7)f)ELRC:V746LK;JeMg:RZOag8P0L.g3M:MGR)4&JQJSJ_/P,L;J@2
YOA<#>WYW1>+cWUK1.::4>HJ5d;A.;0M=ZcR_4Bc@=[_9,bE1.WEbT>6>]5YG8G4
GS,>6,3d3@7=HLV+)O2^XH5?b4BT<\L\2f9IH5]OKF@_d/ZYfK-[(/LOACN>7V+b
Q^a1d+L..;><F_#c:^[:cAFR61JC2-0UST@D)V-.L.360F6.FK2B@LH47G01C7a1
,9KV?3D=?ZENBNU8T[<a7fW>/DZ[B/-4f7@);3./>T,L-5T,2V4Q-S4NWH1_TE.4
LN.CHJN=\ERfZ8WQ7X@NN94@UR]F=OA5)//BZ0(W5+.]1>1A?ZVZGcV),b9QQ71F
5339U2Z8OU79;W[TRJN06GKZPE30.2N-KR3\b6;-L5:Y/L,R>dH(a-fXc8DOb[fI
54^TI3].A#B-&=C=WWd:g@c#J0P#B/JC9>=ODDYE.:K.f?DfK4.^#eCD\bT,A&X;
F^&R;G-gbVFFO(=LV/NO5G8A[e8_6DG9;NS36I#9FI[IggN,Ma.fHMd,[1OY,LG7
-L4P&K0(<e-\\B@L>,c1[];5MOLPbE/94e88KN8-0+B^_1&6NNJ0]5L]D5?IR?LR
gMfgM-J13I:/XJ-f)H=a^KcU36d4G;NA&>OF0,Y<##-TY^<2Eb2).9(T__=E^WJT
ge[b[6O0C,e+F&9;-6@e+QCEe7c]82.e/0T+NJD22,2@CV/HQXA2#GZ4A5B8F]\2
]J:3IPUE\]>[c[gf:,Ug#,FTORL5?UKP3,QAeVQ:)c=_)N02ZKgeY)I2.SQTCd;W
1<.F>@AJb)Sfb=ZFG_Kd>@J\T][d\RbWZS.PGK(=2:NgXD89W.TK@[02<B^FdI1.
A4Vea[Z1/+F0Z3\e;D(]/UddeWbZ^0K)fJJ@O7b?X@E(ZcdSRaD1>eYA6R>-Z)LP
(MS).^)6f(]U@8U.J5<aH7Q/NHe7W)]]WOB-N(36ZdFEOH]Da17RTPQ=\5T1?@S&
F4e7GPJCH7UW>?,Od)D2F]X,^E9/@M]@+PCa#?01;(3d65AAEfIBdb6dTcLa#;b,
UE;G?aQ=OD@AeOY8;?-.Ye=I=JKDQ[D51\0:ADTZCC/AJ1E3Mg1S369fR7P700^f
/\M-/LMBL(>\dL9#Z-2H?1cWAY]XeU\@;A-NYJ/ANG^34&\MI70bD0c\96>3BL[?
X[(IG3<L+([a?6(4V)[U4:^EAYW\Z+JKbKb(GeE,dU#LWY\7WPO@28NV65\O<N=X
,SUCD=^BFd>3,9^[FVKCdg)MaXHQS[45S-^B6NH9NCKHQ]?=;TOR39Ed,)Fg-,MP
+VfT:?DG;.>b+e3PTZB.EQ#MLg=(bU&&LXT^@OgVC>Gf7+_T^SH)9RHG;NQ,HRU9
G8.EF#2gaRd5^[&2S4W\T)+\((2Y7DcJd9HXRHbACEK#JKKJW++)OP#&NC+H]aES
V0a]EO(>:])5OGP(J7P:^^G3WX/SW16O^BVK))<c:W)STFFR[[D?X>0&F2>QS4Q<
(#/;?.JMQd/MQ#?D>#BR9=;#X(XgdQ=\KF?RFAYL7_1&4KIS9>E33U>/B-#Z19I6
J4O1&Q;P/E@<b;#F<WZIJO<#97F;0Z6-ge7)C.5_&,)U#f#_DM+_PYX^B1A1=).A
RB5;0f([aCdZE,]Y+V?\HM]GC+Z-@VC?39&<._gTa0WB2R=,\2T/#PW9#3[165gJ
5HB?#^#f(WOQgFgFgA-QYIBG[B8]CT\..-XY40EQ)>/BUZBFDS61I@9=WI[bC5ZB
I48H?\KKSfLF74H;?BQ)S,O1<E#QUg<8,cL7>VP5Z1YH#P^XccF/Z=1<#L.R]0.:
LbFa0/\TeV^e@-5AYPAg@<)?[GF(G.RZ\H=C#gA-9\GU\-BOfBG7OC8:>#EMLUcN
T;H++T.,X:4ePU_IbTcV_>BIedO;;bQTS_8Qf8K,c6g3JK_Q#TL=7NM8#1ATU3IR
_?#LK66@<c]7#MWN-)]6JB1:DC1d#DYY:.Tf+9)\d]_A8N\X1+GUg_)1OMO[7;fE
N7b9aI6+&Y@LX[AGRZ8^dI.9N_3SW>9ZQ<OEb@?M6G/)&^NT5@I]4SNWRd+68IL4
4Q1X)OUW2SLG4]D+&Z]E=&\2I01XP5&1,E^=S.MNggC26E3:Q5WC85@UBT/&8c61
Hf@24N@)KINL-F9>Z9,;<8-Qa/];5>Yd6e]K&eaVaQ0/IeOZCZab/@-=.9<[4b/5
SJEb[UWegAfP1FC[I(W0[<D5b\_E<D#,&\7FE5@W=SK:]^Z2bfAANS]>]^ZKadDF
GDCU:>^g=<C;/9X]C&=;e?g(UD\]D#X0XW#(8]&cPb1A1<VG;PI-9:Q-7RNREZ._
6<+O_Y1>/>:[FIAAY(-<^4e?DM]ALL[Z.)aTQ@-d@P()99Ke8XYDEYIN,A;\98-a
UEQ2?0FWXK4DD49W.Y:T=@BS/Ugg.]<I&LB[B99=_;4/--AWW>YcdH&E1CEgJOJ]
A<,I^7VQ1b6,(#:b;:.L(f=gE;Y66Zg^2&[#N@9ZQ)=WcIcBDY5a>9C,G1ALOZ5&
GW&XXW&BOLA4U9(MGCD_&+TI7-1HG;DP)@P(-cWIP#62+a1egRE/eR;J_+&>@-+X
8fg464PA&cD/@9[#42V7f(H/2UC5DC4/ZT369]PPcf1:=):-g[(Y^RQ&KC.ZEAV=
D(MHXOgIdfAPHGBd];#;#9//^d>+&b.=JMBId#Z#0I+F07K[b:0Q]bZbgY@&@SaG
gXALFJOQ6,8TD:YNR-87R9FM^V.T.@D5^5AUR[\e?K>X/EP5&7E>CE3(+J==^2#0
::M3:QfdT&fAR9.0+XFIa6>aLYPT)L4GXKH@3VGG\?-V-RaY:S#e;<ZZKU<HT6P_
V2cFN?1;G#:R>cDYXE1TRL<@A6E]@W?:_SC\W43FHa#N#;^3W?)^9=YXS_\R;d+;
:^gM#e?(#@=K4NSedU;A;C.3^e#G<X>eJ,F+14TMTL7<5a6I@HGBAT6X<(2:I(9Y
a>VNN1QJ@D6[H<AW=:?PQ<VG1C(+#\+S00TWQb[]RX+7b4AA?&=[RH92ZKB^<,(c
OQO;gY@8I\C&R)/f&&3(#NI@E:<_G^VMLHUAW+1FNYADHK93<H:J]44>]SccPQOV
3d.]g+LJBcg1LJ3F9[Cc28R0QJZZe2ME1AW0AWTBQ=2X=\DR_a45.gF6.ag]df^W
WZJS)2SZ\RgS4b2HJ;Xa7T^d])-Wa6QV307R^L6G6D@b?(+gLL,-92H=BgFY7X[B
A?#7TFBGf>eD56.cCC>7,TY96YD2X40+:TKaG2M\CPX]Z.T9:cL6PdcO?>7>J0X-
bCKQ;8g(f<(9b]a92Z0DgMA98b.6_^[BTFb\J>5<&cAI:@+T0^U9EYZc70&?Jf2E
^Y@57&aJ4T@0-F&,JDD62EUG@W/Y/Ed,M:Q3OO8cK7G>JMINe&D1Z2g>g]<YLJH5
F9?Sb^TM@4&UH(GM-;a^G/04;eF^_.+69\A.8fMe6aC\UYO6.,,:F?7V,9,:6@a/
W;E,45FOZgLE7C1gW02,Q19BP\D8PZ#AA8,e6Y#T&.Zg>#DSONQFXd)SK-[fTT\L
]>5<<Y..X\+#I0f<V,?@F&[]-2L3KJYYQ(J^Z1]Ce]N<X#a?1ZVQ+F;f;:Vg8c:B
YDb&a[eZ43;6C03BZ[U^[T5D:<^.Z_?]]Z94YJBdRE20]50,;33+I5Aa#6:=U;[V
afeMX-CZ(7JfEE08N07_d710gD+3[VJAe#BZ,A?P,0WO,M8g@C5XL6YV)N7c.QYX
AWe3;VeS,Z6JZHE+1N;U1>MH1:ZET^=/a=T5eN_/GeGR-.YXKUT[Ac9,91\R#Q76
PKG>d^Y?8Z_MIM<JG8I2I9gW?>.A=R\8PVQC_IOI[9OB?4E)3RJ;[ED?WDX6=5P7
(\,HA.b5PU4Zb=,C97^g74^c0&.4=a@LY>&ERb4^N:[?9g.<ZVC@1a0SA/Ode&?[
@VeTa-/5F&KYHcJWXJ\c880Y#JY\7Ug)38.HX,dA&?S.G_H/XTd0b8G\(ZEH(]O&
E8M>O4_d/W5#:SQQY<W\L^dFJ>7YMPJ<LROac\6(,B_.YQF_59YJCd^\^<-E8JJ/
QXD)]61bZ;Tfd#?RU/bCU@HY=IV(,(0Q3D;4EUeA<Z<HV/#DccX<D<Z3JR5A)(O0
dH<3NOY8KQ;+UXMf9I6M/:,^);<A_eP5Q=-UYNgf0f_-Kf37HRZ_35^-LaKF(UCe
3JFW76SSIP-B#G;fSJP0=/bJ>/-1QMFeb5CER=88(XV-@B4F:/K6;_7/Q0a)9gL?
U@IF-E+>6X&4?GfNJL\_FYUF6^_0#4EC1._1\+3683.]S<:_3CP-3>UR\U4>8I3K
+=NG\:&O_H8397VB=7/V29PRd@@TfBQPbegG69B:Bf._#JXAH-<.eGceUEXTHXAE
5Q.BG6XP09WdQ9SKO5;-eE1TRaKLU\1@S+O1GTed=HTN;V+dOS?b#V1Xb7M9E_Q>
8L]aJ?.3GY\<_;IROT2:6\<BK=BP6\ORS@_+?bIJ^A9V/GUITDd1g7Y0V:?(:2;9
<D22OBV1d:ZB/=KXXXC.&d:.:b6I:P:a^]G4==P<He5IH_=FbL2EA8?ba)+<3P)^
1U<Q^^A:.eFV:2_QX,eOA1Z-05IFaL2OaJ^8aR8GQ-DX/^)DH1Pe&6Ca0D#e8+EL
(L>&_00KS7(0YNbV->bE-9114-+)-c/1_F1YFN80)Gc6)HAA?OA(7GdT+9_[+V@>
7+S2I_YX[55e8:aN;-bBa_SZ2(e-0OGODK7V><\O#Y4E52E96,C..8&B,R]PU[H,
CG-PLc)(_FIT_QP-9UJQ]:C<A9<3M=E]>9c:8(J=TT97c-@-5QOb00K8FK]+KW#9
-RD?)b_](DgRL_L?J[eMQM+DeQGD\GI(M(]6a^XN_1Z?61EGGNe<OPCg#UgTEGC(
-:[/8-gIPODH[RQ5)Af,0=H:C)5#VES0d6)5F;NCITAX<08[RR@)/YT:\S(QQ8CV
4G.>GN54ST/QS)><W8/[ER\05aCUXX0]cMdFO^.@-S)#5=^<8RZ6<OM#2Lf>LN>Z
:J4W8La<1&IY<)Rg2aD6Q\HO(AYg0_LCZcg6(SfT1,PdQF=fTJDD0D9(8b\Xb-AC
/+A+;(B>,Lg7T[/]bD,H0H)<2#fG3EZ@KI+=J\&d.V+O/QL&EN\?KBJTUE2b?3Kd
BB>#c&]L0:If5T/,5F9FJ3B,ACL;4a+L3<P@4Kf?Gf_B1?YW[VU8)U(2M\4IA>\R
9@[F^L,\^DgDA,3^3,cRLYS]XBVZ0S&@fWXPXVT@Y\^AEQB0&TcVY)C2D?HA>=B0
<X0#>X>aQ7]QD#_ARC0#^A2ED5S)IR;S2K.U1b,IgZE0]X>VY=5gV227>VWH#1QZ
9IHd=+aU;,N:>^8]Z(?&D#G;cF2BMHKdN5PU5D#]eG+eG&cH)C<#bZL@<_#DA-)N
_U6O>4UgQKKL,Mdc\=+<9ac;RBBWba<IcX>22D;-3KD92#K]8BYYJN33UM2+=+KL
#GL)(O3=7g_TZbcRW240&cbUYV@C>3KA^eUa)31WB33?_UQHKfbaZN:4b.<5=8-?
4G/0f.-a?ccRe0WC_fGNa3?A_+@W<NGAB._)UJG5)T^(7+VGN#7Y;(PZFNFINWEE
)IO3R&^_5AMLeZc>Z8V#.=P5b27I8ab_H:e7M]C10G9,84HC&Y&[</3GG/QAZO5B
ZRcJ2A3/g&<bVC_H>2-\Bf\cH(<be/E#bgZ^GX3+SPeD5E7(8>=&0<6#^C;AZTd#
?)S1/56>-=f+_,S(-,&c;6<aP##:F,Tg/gEDN,4T9.;,80],fa:_JWKFW\5ZQGT8
WB1H;NM^5F>-HBK0:BS[9N\T,:DMca>YZDPC3YD;UO23.c:3-[UM_8H:G;HAeK3L
_S@/fMM033C2]#7U<M=:2Fd;-c4J/ND].-H8.17)BUc:S0H9#\7DFKC_@G<D8(<]
bIcT/Q4+d0/6;60[<3_fF:+26<[,-D.DGBb1Pb,ePDNL7HA1OZfNYZ?YJZRFGS\=
;XbYU8cCBXE25Q[VV#aRQB#\E2:eAc1U\&V=KG0U),OZ?#/eI;-@b;E?=dV7SBH4
>Z0H(WJUg\U51(]c3;15SG_90AGCF@B:0>fRKW.=a])(O<3P9V;L\?7(@bT8eJ+=
>:W+8_]YH<=-<(W#)IV1<CAT62Q#a-ACf[+?C=O2S>M:=;d/TD9&ObBSJDHe,7I#
1<]G8SEW((CMW26W?dH;Da8gH@S&FCW.^a\SMO#3L6:>CWKD<c.N&g-WH>@BEW.^
^g)7b#,N\?;df<+KQ.A8^0;dU>P<@d4fa_]<5?:6Cc:4?U7D])N_]C,Ad=6f=ODH
;g84/<(2-M\,GfAfcRR1e15CJB[[FaV]9S#GF33b/F/H,@C(PQD08eG_:&(P)\OX
V4^KA;WTNRYI-6b,RID<T3V^AbP33.#1VBY?dd[3(;U/?BYdX0fd7GK]1ZKT\6C1
KOgYF#F,B0XA3;=M:ZVB:52O&\P<75/H210[=;<gV?.XEcWf5H+1QB0ZL8Z-gXN\
X+g1#>DK8789281fXb]11-\+7g3P^45<MG^>Y&XF@6_eTTGb@XW:9<2FeV8=7b=8
C/=X8;0YVcZG05+VG&+>6<__gB5aQAUD92O7/CDPFP3AF=KH772.#Td)@RMTKb#,
,CW@:BH\:ABcLe(ILE4L:9<?U=7Y>.>LU00c_gRAZ2,\)+I>7E(Z<VZST1TR)=X0
/R&AN1FNg+S1DF2c(RS0-\:N:+[f9cAW_Q,8QH?N;&?M[9]Ed3?bP-cN:fA6e7FE
(8(#I5P-IM,7FN&;b^+5AVT=:N7Z1c]=c82]#AT()2bCZfHEf0>X8Se,6Nc3Q-=2
&<VY6/1^YKJ&YQAe3.&3@:HG[BIL_g7AfP4P&MAA\,LOU2>J)LFKWbK<6M>dF)KU
\_HgEXg+Q9WE=D2]aWE>\RMZ.HUgDX@2gB/#(Nf51;fHTKSG(aNdFUc.;8>:5)Df
I1HWa4#VA[]?^H:)7LTFZ=EQI-d0X09bgJ6?9/_/\K+cBUe_L,b[\WAQ/JM+CYdc
S7Kce,(dY[&WfIc7_[3=FIDBHc^Z^]7?L?QcYA4gJb(:]Z.K0I8Ra4#^f9?2H852
D[?0;1\C5_[&T\7N#K#7FWLJB<</HNZVd/5D0Mf?_,V\LZ9[I_UY3]bYdg<.16NI
CAe4HC9YR?FPEd>,9P[CG3ZF&.#,K4AT5:DSV+bZP(Z)e-M90SP]_da@_#L8F=;;
a0]H?fD_^\)YGY]6R)YW(XU48bZ]-#:@(65.KHI]EfHW/;WG+5W6^]T:OV#f1SFM
OU+[&a;;Oaf<#-a=(Y380b<1J+A+V,0)RW&3J&,S5Z@9(T/#T1QZ[XefC#c.f&gU
HR]@RL[5S0-1P5YFBU]VJ@5A--B@dY6Ug1gXCZba?#).L4LY<,D;^1IT:#TgP;Gd
K+316&,b^8^&Rc>1BJg3I^,B8\=.=QVFI7f_:bL2eQ[QGaNW0ZdK7<d+e-[C01dH
HKBGDNBRQ<?R)EROBGW/A:HZK@_W:NECDd_A.<dgVHXD_g)?,[A3aJP\FNaKa0XC
=+/&.;DXda5fR.]HcO3L8^#Jb#L#Z\DAJ>bPa=]IO_.7N6?UKO+X6^<RJ^5Y4G8M
7PN?a=(8B29WFV<e>\Q=U0LdYa3F0@@]>,6GX6=]2C(2GZLYgdNJO<S3--60G7eZ
G6J/TZ5V)0TX:eF&MeZfg1WZ14C/J4Q=fWP09IR^<ZL#/O<APNDN9:/J;V/fK?J9
[8AW;2;d3c>3CJg02^c)d/P8)T8_KELUZ0E5#&BF=Z]N\VBM<f[@OKYBE]2/0-4E
M,O:e)gNd?G#Q3;3dG>:JK+-C1S>6D95OE;_PVR^&\.c6cYO5\^;ZW6(+.0=Z(1=
>P+6eZ>2ecg-L&SVc0<53U/bAf@>XV+X][,.)C=>_TLTF5X.A[(ROWJ-Ce&/NefZ
JOE+&5eWOL&(-S>Z;K<PA)S)G_@PNJE4-&?BT81RD2/31?G#@_ZYP0YWPQE/e<]O
W9>)P.G:Ic4geWW=2c#M-7TA9=Xb64C45O-9)]BbGPYG3fT8^/\-;:<=W5,D_GMJ
MTH8R@J]c6SR44ONY0dV2O?H\LD\J2[3QS=Qg4<@#()K9UP5&GIZJb>@V>UTSMUB
b+e#/5N<8]d&Z()GZ)?IB=bXW9&T(=E[SJ1.T):eUc;J^TZKU/AU#H2CSTW;daK<
E^46L02#c>^8a+)9[.EcE&]PXg[81<@\g+Zg-cODK=(U[d]dg:-MC+3B9+VZSFHF
fXeVg9X,#8&DU/a120.6YOVQ?Rfa1BWb+eT_Mf&MH,PaCeXA@e8A/;;#6[V+IVGa
/6P0?&+CI^)eI9c_GTAM[3S<QA1#V8W_b_J]Oc>&gc-fNM\LS]VMO706&&9V@bSQ
+--gWa)KH&];=^:f?d:CMB)S6X3dGH/8<&DB7(F=&M&#^bbb?XT\b8be(W<XX4&b
&R3Q0KT).0MY:)T47c&[1fKK:]3CJQ,@6B>>PE4+/F37G&&QPWL9B@5Hd]?/IJBD
M>6/+BA\8+?,JbLX_LMb8/MI-<@)@6EX^H0Kd4UM5(J:fD)c/([)PXYC=P-NaHc^
@WP9_0d6GF=08]fPd9<SO-dPc,4@ZgC/b:_JHB4X^V5Ve/?OGgW\HcEIEY:A(/N>
1J\dRO<1_f=G-f6KIJ>?a?:_]L#2H>PQYOe\J2>AFgL?fN/A0F2WNU)ZL9@3\e3=
PL>GV;:6VA2c[;5RC3Q[+bAaI4B-f-HYN1e>:@eDaSUF@0\)A4,.?O2OR9T8FD9#
/V@ZaEY.VH&VbL>#3A&dA&1RV>BVbagc[V_[SGRPO10W7(BRG\:N^1V8NX8L:+9T
358K=O9g0dZ-_I\LHeB]7KJ-T-S1PB9\^8(.@eZ/)[9<_&aF&0?2:\79Ja(7ECII
gRXeNXFDO;N73P8L3^EPVGe[3LGA=f[:<KfEEPBA:O)+W0KZLKO,CXbN5KC:K[>:
Gg05=LM(?545M@0]CUF?#6^#I8/+aI=EMJTP\R,.19,Q19>DQ:4Y:@B<X#W[X0WU
.2N5O6PIJ&+J7UV4R&Y3L&&Z_2+FMBT_14B5@,I_,6Qf?beWSQ[+7_U@[ZI2V8SO
A&GP>C0AT5aY_PJYCa;\<dVDTQW37Hf.Z4g:D;X^.)HP_EJ80LTW<\WIJbP6aR;R
0K,F]A\eLQXC&1(6QZ>&.?9X/;NcA#0XP@.6.fGF;5ZaX.1=R4eM=[B(0E^#d1]g
F.ULdfRbPH(I3M1<NVEB&>^6D>>BQ<H@X5.Wg-/#=]aYYDK)@L(PW>AcQ71Y8I@0
XA[bUBI)5e+S@E>_9<^_[aCB9O/RMTVUTXRg#1H24bDUgHg<N.VRO518XICFD.#@
L6U\B)Ra@B5@R,D298V456=RY,BM]N,d(K4?--97S[V0.Ie1L12<Z7@@9,\BU=0=
.aagFF]A/EWXBHRbR#];aN.M.,Mc4I,a.LD:ZXH@P</NB;f>H,ZSV<Jb/2GUZ0I[
Q^PfBK;4dQI)\)TbNK:9(_GYR0f>OEA0RU[]_Z,3>6VXb>>?64C4EDbEVaRfUgMa
BSd:11^2VU+474F,4;0EUG]4KUU]?)#SG@:c8VAPfGJ(T5C)-1N13?N6N26Y4L.B
D3I]Q<Lg1GX2RgTGNAVQ6RC3;.b2>IQSH\KGSeR6cN,eK>/4UB3-a.^@D]XF<\9B
.BWNS/?_Td(g3cM8&gA0OAL8.H@)(AS/G?N(8.HZRV[ES?X9ASE@]Ya\_GO[7>9(
WP:SE8/1e;U_PE<I11\8?9&\R/f@,=/@1Wg@8&OV7W5+ZHEaL\))FD;LH@F]KM9\
&9((bURSD4Rg;//1)?>M&30W0.e.Wg9V8,X>^fWE#CdX]VP_OMa0QJ]RMO(:>N@J
5T<Z]d?gdeYPP7=AO3PYVS,IH72T.NOOL9@A#_U^eV@,?fUY6\^:(,@X4WVED64:
EI/M3I6J:Me8A+P^T^^gEFV7L:L4?dC;aUU&W=H+-^<N-?KR:8W(aOZ[;\X2-YT/
-[,gdWg@65LE+cIGf0+/[+JJ8g^A?I,Le:O<>Y=F(?/RM53-3S&#d3?93.?C57VS
]<#aaY[=R/5;9Q/Z8]eAWPQ42#FOWMG2(J.0S7I&]A0(LfHS56.JAN5.)UC0R3O8
a/&=C;89RME+58=X4B\3?YP#a08@K+cJ?I-/<A#+MC2DL6WI>cI;&)QYT4=76<)(
W&[IM0gNP[.8/:X\Kd8<V5DIRB0Dfe:8PPAD)/;V^OGK^R/[K+/eae^9bW4M&&PX
AT.Fe;CY6a.;&8a<49Cf4;(3L25()BLKCEK8aF>I.E\-O9\8;/378<.=1,80]243
H3\0]cL3KTU8/]@eGa&_7S2g_.IS=HH6YFGM_a0S2d9L5JPM(ZC;64\WfG0HWODA
dKW(C2?c)HR83.0J?]#_aeZbN_]FSG:L>]D0BgTDaY90:Q@#9Y-CLVJ.NZ-/;K,7
ge))JPHfVe,\_B.;MW\[.@_1:dM(P/I(g4f/]^?Q[.:eG.KQ]4d)+)a/1QEW30gB
B9_OGbCZ)2GaeT>6NE_U?PIf>>4F52DM=21?e-V&?4I\CNM-ZK;gcN<AE1N_;=5Q
QWI.0^@._Q_FPgM6Kd;NLKMQ_GE#9=d9J:NR4aF3,a@>KTfLdUE:/HA&2=NQ<4Ua
-FULJ7EDb=V.,0J23?M7]EXITK.gB=6>-^/R(EH0L3G.I^QB1.9P>-0NLKRAI\a\
U]3&;P(>;GVC,USS0QM-]Pg+;/F,fI,ER/JE7&)=K/NM8K#,W@-H_daM?J^</:UL
1>4QOa;=TU+OTW#@P_5MOe_GSbD@#f+:[Mb9#&b6S+Qb7ZRV,:60_EQ@>/V5Q_]f
KMe[Q\VR@-(U&JI&ZNF6_1.8[eQdG-GD2I\9#cGMP:OcB)KQVdAf6cR/K&[KI>Vf
.K(]E\0F[(<:UUI1K/7P&K-TH-V8AO:Z3?]#eN^9Y@-0<0gbeCKcEGJ3W:T,HI=N
1EY(HJ@<0#C=R;K3AW/H<c;#)I>c8VX^@ZFX6e#eG8XSX&J3^S(7>PV.^AY;.TC]
L/P[aUM.>.eCMf]3(.g-KdTS7C)H<735Y1X-S/F<M@G7#3XDWfR^(Y68Z3DP,=-f
F?I,0\FL8RZ+;3c6S8])Y@Kb_2:H@/L0G-Y(K<?_4^X+02c)1.6f>D9_@@QE0E:A
Y0:MIK?)P2=eBSeBOK])eN7Y66\:N)Ua:Oa.E0TY?g7[PYZMBPF2bM^DEO^Z&6gd
6LX2-B_,-R_KQQffKg1O<d.L112+_]Q#bCfVeg8)9a_G1UR>[(7&&,;U\?CUQ]cM
(RM&A-G&7Y9\KX<VLW,?8S^JTU,):2;8RaK.LUTS1_U.5:0IOPCVUG./6@,O/OPV
]GH/DU\\RL=><J_/R[-cCDD)&V6@F<dXTS<92O/g[I,A9<I_]XQZ)LW7_>]0^Y=Y
HFYVYEW-(4E0?<V6@A\g)NPSONg[VNG-@QU]a:3&VMeb,[=YZeYX^BXGb207FDI8
(NNE+g.1AZ=>X5]^T31dK^aXR;_9R,_B^3J/,NX=@]^Y^2+3BK:1IdbDXR?)1IDU
Ad-=eW<SS^>.e0XD^NW\[eY7,9.-9d9ED[6TJf>.?S1.T<JFPSMOF<KfU3KX:Qa=
HWUd^-AFZ+VJ-e+@PLH>N)C\Wa+OIOdL](4KgQ/9N&=3.55Z:-4T4N\FC0M3?UN#
&L^g7CccN@:MGL)@R06(/D1A+,TP/gI#?fZ4-_5ST8[-(/ZMZBV(C[#?5:XgaW-f
[7?G6R<CEO_]5HLI]Z9EWg^<bN5:&\&,-PBTccZ1?2-Z5g<B((-Y4Q@,R_NTC?[O
<IT7BK(1>R_S1PR1?1+=b(?VSP>\:N//HZ)g:Bc&3OKS)eJd:^=][b][KU0gJ7DV
/,W/.g9)EN4_IFU=JeU63_)cbeB:29S(>.?b1J?.76-:L3U;,EbJ(8\VQP;G,Y^]
4:b0fL7NN9RD(@6P+XO9gTY]:7ZE3&3a^@H:.K0XT-9E2MRXdcN[2Y]W1;?=E<4b
_G47/<<9D^A7aAJQMSU+S7MMWM#-GL.RB1O:Q)LK/ad=5b]_<_+OeB_K7]cV\[;:
NVN5AP(=eY^T(^_&0fWfeP-&:[gHTI3+H7T-<JZ7bgZ3M8_EAXJ8^)A?K^IA;egb
d5:2K-=\Af[Lb0[3M)BNUU7T;[73(GAH7A@[5.WSd;,TZLg8FaSAeU+^e(,+DWJ;
G+eXI@ERNWJIO=V+(T,Y=MY,_a@:L)S5dC(_ZAYd_6EZA(U&(]B?/FGO[^=V^E]D
eE;)(E@[N+LgbWN5IDaF(FRabaO/FNVN2G<:P/QZK9#,0I0N-]P_=NOdIOc.G5QK
dfB-M]1aLPU7caAf3L<ADe[c;TCS9.M[.IA/68d/dRVdS8]&;9>5M)X>@Kg_F-X,
./MA&e(N.9:RGG@P><T<be0A<H74@B/=\8g3b-4)C_@/\Y9C/b?5c7Yb1c7V<;[d
F?9aDWdGZ9CU9MgcIBU>8@)W0RUbPIHS^.?dLPY<fc2L_G\_].?Z[^/16W;Lg;(I
ZEQ]Y[P[1_9)7b8YTWc]8a)W2$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_MX25UM_MX25LM_DDR_AC_CONFIGURATION_SV
