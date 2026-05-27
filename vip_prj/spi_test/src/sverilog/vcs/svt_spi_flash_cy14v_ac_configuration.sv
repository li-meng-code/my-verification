
`ifndef GUARD_SVT_SPI_FLASH_CY14V_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_CY14V_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Cypress CY14V_family in SDR mode.
 */
class svt_spi_flash_cy14v_ac_configuration extends svt_configuration;

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

  /** Minimum Clock high pulse width durtaion.  */ 
  real tCH_ns[];

  /** Minimum Clock Low pulse width durtaion.   */ 
  real tCL_ns[];

  /** Minimum Duration in ns for which Slave Select must be deasserted in between Two Instruction sequence */ 
  real tCS_ns[];

  /** Minimum Clock Low pulse width duration. */
  real tPeriod_ns[];

  /** CS# Active Setup time  */ 
  real tCSS_ns = initial_time;

  /** CS# Active Hold time   */ 
  real tCSH_ns = initial_time;

  /** Data in Setup time   */
  real tSD_ns = initial_time;

  /** Data in Hold time   */
  real tHD_ns = initial_time;

  /** Output Disable time   */ 
  real tDIS_ns = initial_time;

  /** WP# Setup time   */
  real tWPS_ns = initial_time;

  /** WP# Hold time   */ 
  real tWPH_ns = initial_time;

  /** Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_ns     = initial_time;

  /** Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_min_ns = initial_time;

  /** Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time   */ 
  real output_disable_time_max_ns = initial_time;

  /** HOLD Active Setup time  */
  real tSH_ns = initial_time;

  /** HOLD Active Hold time   */
  real tHH_ns = initial_time;

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

  /** Assign refernce of spi_mem_configuration object */
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
  `svt_vmm_data_new(svt_spi_flash_cy14v_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_cy14v_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_cy14v_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_cy14v_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_cy14v_ac_configuration.
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
  `vmm_typename(svt_spi_flash_cy14v_ac_configuration)
  `vmm_class_factory(svt_spi_flash_cy14v_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
HP<#bVS:EB\5g@4EfKP8Z9M=^1T;g5O>_UG#FgR1=F]#]XC,O-^K2)<PNM#9,]1]
/,J]6I(X#(gHOA&M_P:D+J&;R8QYUXFXZ_)_[0ZGSf4E9eJC8.I6\Sg&.==NLf]V
KbG][A7[>8?[HD;1aUK+4A\2eVH\0-GAYRBWKEa3UMa/e^,5[0eJ6=C>gXBA\T)#
AcaV&XU2XY;.FC4fg@C=K#;3d601YJ&P9TF4S9JE?5d-:YU.[3P+M+.(d=V-2/]U
M+2c3UN[HUd,5MUWUc_>;FJUKXJ]b9GR_+CK_;1G)](=]A:Qc__0XMdPAD)DH7[&
<a5=>X^bWK1+GVJUPAB/;]13\SM:QX]]L\5&d[\C@d:d2KO]37TRfR#b6W/GW,1E
8gQ[P_-N0Mb6,QF.7Y=<_GP_Yc(2,g)fR_U=G;(<@+AFTWDA6AVQAUFE9eT=O@->
>daa[3b3_A]KGKF@O6KUO)_I.EE+BY,O\IAdXT\6c.VI7#:6c[>\W#;I-G2U5#e7
>Vg&_6H#]E6RK,Z/g=I3<df-)JEY#f2?WR5g.XP^7GAM^UN7:<Tg#)9-H:f18:9e
G928FBc01NCCGKeUP;>Q1)O,>=dMeX_7D]fGI1f6-5=&4Q#/XKYccA>0g>KR-@](
))0FC:RbOM/We8a1LYZOGZfQL<gZ(]_->Ga/e+7Z^7PG>C19:AD((ZHSXAX+</c=
?(YRH[)-203>(\c=@>4)@,QV3TBB+e1^9N\U_R(IKGV/R,=fJ=NS68dYW1(J:2YFU$
`endprotected


//vcs_vip_protect
`protected
^(?GR/@dKG/NWR28R[O-f5U_U-Q\@IY0.2?()B30f60XQ-#;?<:5)(44SVf[KZ4H
U,].Y@2_C:MFf7_a4^=(S#)KBU/P=B5Lg]_eY&a\<bJ[:0ZHU-0U;BF/)>KHO&gE
Sc]@+g[6[aH>?>[599-f&IO.g@J=G&EUe65,@<&)H58(aPb?IUB(OL(@K1ELef2,
eMeB9Z,[T4RY6Cb08M+IKdVQQ]8;R;=\K^U<2G,8b.G)K)0g&g\BST+OO7e/C?ef
Q=Vbcgg,M&\N@UT<A0&UbD8:T8#eB&+6PBY?)5W2CL6S3]KF+_O_SOg7([7@2GO]
)b]=SEYZH]VP9):82M1-T\LMI&RHL5#Z:Gg,DTDRE/6UY1-41TEcTJ<0gSXJPaE3
(UKT>9\>^NR=W?dO_<86dQR=gF7;DeN[QY:f))(bf##G2S=Ic?=MN[0M6b2;MXc,
HB2#]/Kf_dKBWYRPS<XA&DafQ^1T9(KOBeC02C<[<8VX6GFR;W/BF:b;O4D8-#c=
4J>YTMQ7WD^(QGJPg1NgLBZ#Cb<#OOU;V#/>B<^V,5UYKS>(L+]J5[YSb(JI(Z54
&eVJ.6209JT0b(6,egH(GKWUF<[,@_3OYNdeW:C#POFf77G?-TUeQ-#E;N1I4\44
F8E7[07dRcO]]Gb)_(eCC@:&0\[[;.IHT#97M(TTG]X:O8;[E.6(gd0+II_(YW8S
M^]/(YYd(eeV7YOCEBM:+[K@bbeS(+L/:@-=O)SY=?c3Qea=baU-K.I?a9SA?WH.
.R)LK&)B:g(g47I]e[SX-)I2315O/BB2b>(MS]7E>CY&;FI(Q,gMAS9]N63>X[@f
#bLa0>C3YF>)SMT]GZG>-_.PFW=YG+7e8G;+ZO7e??&;#1.&6X<-QX;_;C2CV#b4
W>-85?cgKFT9,VCTbPO,fG:R<S6:3Tf#Gg7K1C@TDE;0[SUZ4cTPJ6.BNP5<N)G^
3MKTeTVg?E5CP6-f9W]A]_]4;ccc@83_3H/]:D#.Rg6JX;2@ff4YJ_YOV]R:I7E6
GAf3&@b;)d.MF)#]3Tc^_TP=Y6HQZ.4T=C9-4;3c3g&d,)JX[SdaQbW,_,:CQ7JM
>D,g-c6YLF6U9MbE#VJPJ=N7F)NK>T9d?5,P9R#GRP^]5a/W68QD=K__OUC6+2e@
;T5_^J-7LP&LDT4((IQe]XfK[H0I<0A#Pb\6K0a#TB93J_[f+a1VEMF3[>:OId2B
B?[XOR@2^#):FJK0XX#Z+LDW9dcWIC#)HdE=30UGY?<d,K8U&a4?X__]?6aV(PGN
7V0cNTeS,S_N(Q9SO@YQge8C#,gBUB96bYc@Kf-HW0#cR?S3._gLML1\/G:VdF^>
>c?-Fb,[YBV,25=;0,0?@Z\A_Q_AF@T[9N+J0IL)@/9HJVGg1d@bE<C4&JS0[^g:
V8)UJ>NUgdZY8[4O.+^>d<&.(@A5O^e.QfIWA5,7fZfTT\FdRaKV_HQA.R_YE?Tf
g1IdB26Q6R[e^VMBd&P7F<R5/Zb2.@b./1_dW9>+BU6TF<L&GMLPd+&(_GWg6D)8
K-]4Z<&af,7FE\&R5ed-F&3e]5eB;L<gW7d]Q-LcLYH\Y6aDKE4S3(=8-g(6UTEe
VEZ/2RcF^>BL][66O&f,_V?KT&::TCG-AFY,5#O9GX?TK,[c;VH,O[-Z5Kaa0bWO
)H,8[U]N<PdAe/;8BK]H^cSS9S4Eb49;4?FAL,L@^93g6(F0V7b=bMOS6HG=03>^
)#dM&OfI,eH_W#Z(W5HaU3N>=LN=2@-54b,>&-fX[^GK+CP/#g&]c(_P?6#Q?<PM
-GPFF-M8ET^&3J6Sbdfcc;PFT)XA.3\aKe8_<PH^3DGb7J^UR<0Z1V68eC9Q=Kc<
=#1L>eC.O8-CW5e[3Y)W=_gJV9R3P&,U4I9E\cdXX1,E5Q4dU3,@2//9)dC2f&>9
ANA5Ie(d;C\/O2U/1FBb^B>C@U[D:gE>5AZ]_5VDCV5Bd-@Ae@Fa##V5ebL__H)H
]\XdU410Pd9?1aQ9^NUMNC:f7I5\Q(JL@UNN7E:4F8E>eC\QGb<ec4=\I/+#;]B>
?SHf=8.&52E#=Jg0KMC]8B5#Z[bC,R\AKEHG0;\5A8_=cE1D6UHQgLT;RJ+YaOd#
P:+G,32fLHB/]eSRV@cG@4^OdJ/=/C9X7T.SE[2YfaFA13@T?C&K#G]S.N&]:R#A
FM&Z_7H&Y=dZRK_MVH^EJ9K6=8=:=fHf(=bD:WU](#)OT<70c2bA05LZ2Z(#@\(<
:c7eDGXdY@LNO13\]]a7>F?#1gg?]R-Z+OKHI121L)S&VLGdP]YVeRYUa0Ud>_81
KD[:WDZ^V,SWC=(ICN.-e=,CC_/HYeV5GPT@)<5TAM9ENM:)U>&#U>9^R,Pa-a?G
NG]=9QHQW1+WONX@IYA:6AY94=3I][WZV[]6V3cZ_[U3c:]^R]=N\5>GJMERJ,IZ
IV;Cc6NM=cC@Cb-J9Wd[35:ISBDBc61_8gEb)Jfe76D&Z.2CW,3D:F:N,KUUbXUB
L5@8OS0f/?/)0C-[[ZV:C7CLA0?a@OMcgN.4634cK96.+W_Oe(#E(+#]Y7ZMGXV[
8,0e4OC.#6.5@8<913/eSPHbHVXW@@5]<P7]JDFT#0=<Vd[114Q[Z<#VC6YdW\I]
XK6CPCX<-Ha2DGJZ&+;8Y=f=X3UP3[Z4d[H(e0,Md#=gLLM&G0MI\HQ<22MN(2^M
e9gB;R3?=W+:2^[9\DM7QPK>WJ)._3UgN+MAW^9>XEZD?_^7WR30Q#17:Y#9P]?7
@S4R&dbAGf#)=+f=J>00<VK-<<(ED6/U:V4LIb&Cb>&LMB2DJ71/^_DCBfUe;S7S
S^S_<9X&8.bWbFAd:K/e9-:C#@;7L=2LdW2fV7H/7K3&7J9HY5a)-AI0(G8,f?FL
-URg+/SH0,I8Iba.R#SPAB@6S8[8H8b,=5(S]E[-<U.599O4)c?97?8-LZM[-5KX
3KT[aV?\;3>Zb6>XC9Eb@RJ,)3UVDVd@9.SLXYgA0^;&.RZ\=KCG[1Qe2M_;770c
)(#W@SFZ0)(6.#KK][P;G[MKDO.b_fgc5KR8R=UM.N_LW^8fY&,#,GKNA?SW.>a,
cY.\LbMUG[D:\CD)f[M)48CQO_R@\0J;?IH[\^d:KPF1aM0HU3_)<)/V[EL9]_L2
H0W5L2P9K;<M2d>J4>)cIdX?4&U]^APIbC^^d3GLZCHD_#T\E\_FP</WRaH2()g<
_,R\F9AeEg<D.X;^Y3_WNc9N#B#]:If^4Md2^4VFP7^.B-[V9+YW\CFWV]ZVcN=G
X^E]RbRPO[V/@6<BA>SeJFPW#fC#0SP&8/<C\DX<^d4D5L;3CKLL6W\T6Qd46FWM
E:J--=J;@b84WTOC7<T_(S=Md-.^c\N@[&cZ_:EDWg^^)]R(?,WB7.9_.;/?P-AH
<0RSUH4e&Pf+<)\@5B6L94-a?2C&8b:U)/5bg<a[+A,53T0=S4U4ZbC,PEG>Ma:[
SL0WaA56(,_?;/\ROb[=SAS<C@XMKTLd/JG9>E.^ZI[7L?2Y/e:a_.0ePYTg4:H9
60U>;5BUY_Y\d5V<ZENG(Z]da(d>+9DRYUR3B3+eff3R/ZF)XfAU-bMW5R6UgYRd
[>NU^S_8WNS)QK[Lc([UD[5/;S/3?7-8XNYIDGf,J3?]@9=:\GLQgRge]7;6M8[^
6<AV]ag)JXXDeg8(J058Q35:EFg[[,Z=dcRK1aH3_L>aKZ(W)?O^RN4b)Te7A(DS
X73:2gD?C3?YYH+<]X(N6@37^Z@6RHD9:dOPO?Q.?IBU+2H,TB261@W1eRX;Y(B.
QJXFK#>\GL13a)L-afgWP8[<DHSdUFTIbVQA?:A?>d:fD[)]L7Q_,KeH[3U(Sa6Z
J-PYAJ^HBL,1HH=):cK6ae;f[&&^.G[G#S>W4EbFY,3KbWAHNdg6&)\8RJ^b1,2-
-cKDOD1H+(:I3b_DJK73<e,0;4RY7@O+M6#&#,\/b:2BZ^NeI^[US[+95-]5]VX4
5=g(D/^2Ag#>O?&\S9@E<_RX&2E5^g.)FYeTb;1Q#8Ya=aaU]Fb.:ME]LKYffd0H
RDWWCZdY7=BdF0-=e0:QP4?L7Bf4&g(aBJ@4H0Q&Ya6ac#cZLWc9#^M1)YI/AX[<
_XQ,EcQd.^0Ace&F?6UePdCZgQZ?5FR21;&?fI4(FMJS(eH>W&,[9O3;N[1N+2</
5VK@Dg=;+&X7Y0TKUIY1]+KR?.WB=f;G;gXZW_P>@e@L^PGWD0OI,PZ]0,-@4&;4
HMXO8\POaV)72+J(@S.A#(7^))LW.QA?;N2#\11;a?&<LA:9(./@=4A8Z,1NcR,#
PYJadUG-b1IGA>\HXAVdd1bWD]0-OK(0R^2>(-a)S#1g__]J8]gVM2WKe/AHF\Fd
[].5XT5QaO@e?#TG5:P4Gc,3b^46Q_f,UK)-(<KCM84IfE-DGK_6)=:)]?.1bgb7
UW#aL14_@bX+0<gUfEY<bGN\=<L=/>:I5<&NGC0>U8X&^XS/X<&)9S8MV)^TKX7Q
U(=N)L[^[UCb,)1IfL]^^cbeNcZ?W/GL_B_e3JK+Y(^E.Qgd_.ff6bDW4CKC6bLN
gF4KTdT?JJ1:<I:BN75C@@13\b\WfYa3_&b=gOUT6UcKV<J-N&(R?9LG2;Pf=,Wc
1#eggP)?TJTaGfUC5(>(U(892TVg#53@QA#S1>[QY7g@6c0CMT<I/H)?KX7WP^WV
BIMcX:WcM_]a-HG9M8&N21/1a[;3_.cLM;@(_WF2BG/.fLR;FbXHYaP7EP_U>\V^
,O6e6C3^LE&[7=V5,?aVJ6_\Zeg+@#Bf<))K]a]a<R-GM^HTSL-eDO[cYXA<1AfH
,AeV+)0b+&2V;2LZaW\\_NAED<4=d6OT4#3LX;G_Y>KLNg:<Z]W.X)M59Lg#0L=f
F8JHAD5.Oc77S4GIN9K5Uc57<E@UUQ<Y(DWMN(KH+17G.e/=#89Ig3J^XC?J\-0P
3OX5R[&=]8YBC3F-(7KZQBGX#Iee3<MV.RAC(9XFgDKCBB8S]Q/?.IdO<09^SK3?
1XUE5fTS<V\;LeTb32C5&^ML30W^PY(b^Q-Y8TOB@V]T4.D3.P=<2>c3c<)T)b4U
S#,6KP=T@aJF]=6.<]3f1\PgZ=U(#(LZT9NCE_@:)3[]X^9bgG,CUFV4E?EI4_N+
BF];DX>G\1RY,AG6;^.6e>I7c5HP/(ZgHf3P78ReT#Q=[EQ)&.CMR;UXaR^S/B6I
H&Q9(M5MV0.:KVH.@9f/;7AHGT7g_Ug#HQ(4)(,IC&Mf^TLSV1f]M+[Eb==63Y4H
W[HA5Q/=+Q#DV);A^WffZF/d\X]CF9Xc2YS6<>/^2[&9T,WB#OISJ:Q(;g3<A[B5
A7gc:G5L->e2a,O/-7O?VC;-TP^@7W.cLW2Z=f5K8LH@L]V8X\P9g[R_A]9A>E>>
-:K3(<g/([[+W,.IXKPDb^&8RC[Y:;H/K^La95c\B0fB7<9c8[=91W1+(>?@&EX@
2d<_BDQ_IaHF,ZX]JTA[15QGRf8B6@@DfO>-?)+Zg+&S;3&])/IT/#A1(80MZA_N
bQ8M>._;<dAM4N=fCb,;49JF,-9;U.>M:7-)Z#+\644aX\V28P[b<GGAVRF[d#&@
P_8ERMCG\^>O0RbE,IXSWcI;]MVVd/a\Y&gEPY5V.SMSK6HN^5+\V8GI[=)M0M7F
G3Z(.<+1)S#=P;4Q,=.(ZB(4]:>A^+601^&:\W(OCdLSCW#GU&=VBY.bDV@Fg,(g
3AY(^=-_4:W^\U^Hb.aV(&DCGK&5;U2J:S+AKS;8RTQ57BX:VXZCEb?=RG?_bLP#
E#1-8:XbQ7c7ULcB<IAHREOCE7WI);.]SBH)G]cIMR^(,1IILD-6N#\#88F1:O(1
<]CCX,Ld>YZLGb[L2K;KL#VY;8<d;O7Q\VV>8gKHAC28#XW5B?H&;e#+Q=I8XYdN
TQ7X&EW=O05^c96IZI=S05]#J36>DK#&E,WQX:5G<PPN[Hbc4\Yg<<K]bWL0UOSQ
E11K[?.fG)9?^Pa+SX61S7MYg8H0CIF+VbE)QY@(693Z3c?d58P0&A8\\1^INQ@J
D[FZL24^2QCA^]U\&&X/KDEQK,YRZG,CT[FE[]1-\41?8S)XAN9]Ce2<4T#W#[@>
_0-F-2@-9DW>7I)DG2IOY5^_fPU_-Y6CLaWKV<B&J/YO;g_5MPDa6.L;.?]5/C7^
N/X[DFM5E7cQ2K6(1U@DB<V-;7a_FYT@TgMC7A]0<DN()R3OV^;)^IM4H?>2T5(W
=g@7]=REK[ag9_bT3#/8,?eM,]5/D&T3MGe?QAM4R(ZTceQD.fYK#0ZEg]g>@H2+
NaJJUH0;,>\]e]L0_.8+PENF)HE&6?)b+4/cbNUeIPX=8[NF5JfbZ?@R?4\UO)J0
DJ=YUU03@[_0&gd).;cE_NI-dZ/V?Y;8Lee-&NZgZ[N7Z9HfE=Z&?e(RYF?C(ANA
DVT:0F4^(8:^.Y-AM]I+f0..5\0_#=#F=a;TG6^WR4Wc5f^>FC?-5V;<^SD^>YS9
IdXC2M;]EE:b?\JSLD0^\GBd?6-EIaZ?SG14]b+D>Z:cE[aI66/BF1;BF\[[ad>R
?LWUc1B9[&UM-^7#Q.MOX5F]8<T;/<TH,ZH(NZaH8_KXFcN;dIGB2V_+DO]NW62:
D1ELb.MQ\QU80,06gQEH9dM#>#B5KSVGW-U5Ne\71Y2^d[d(Mg\R^eY]9UWJE^Kd
2^QGIKAf3;=NROO.32G[=Q2+QOSE#IN:,6=&EP#=/2])b8Y\VX<W<_KJOSC+MCUA
62O[U?81YICMe>0KW8L@-aOIe-S#K5NJc2O9e=56]>b0R=@gXdI-f5DW/M2_G]gX
5IcC#U9#\5,C1QF(NSG?CgA&LbD-4K3H(KY]()J,DA8=D\M2I\Q73V?,Ag3LScJM
1P-SUQaGC,1U./&+N]0#b7-@<V_CE2G5]b?]7f5BMgZ?ebK6_83QEB]51bd^B+M2
g.2++#>U4-\ARMLP4deBT.+c,+#:YM:QVg?;Nd-+>RB8=,E>\gO(gB&\c<RZD?0P
,LC;-7ULA4;>BKA^7_E(6:-g6faCQXN)Q5-CBG?T@<(d+5X9JMZ2<?/]e1NJBBe;
AC?:W:R(TRTS&9E)7/0D]C8VRQ/J#,TKYUJW;.R5WaST\dK5;dF+]Z#C]c1eXgU6
B_gWMDd/2SLAI4^DPEG<N+@UeATR1-CY8NITfgS>@\EO=8D47M_Q+:,6D[,YD8Q]
=UB?CG5CB4O#8/;+#]ODaK.0..2Q0H4O^^E7IB9OB[F>ad0A7K(<]E?RIV<N-Df6
0.H.3A(,W-Y;-B9\bN;eGS=>W?3_#49U4DaM^)cF?cg4Z-DN)fSEV4AG\>L2WOQW
?/=Q8[1.XJV.IB(W,8f<[fVC5BbD+6#?8ScD#TBPK2]3Y.XOYK@#4?R;]H?QcdDM
ca52.[3@<eO^POPZ&Yb(fQ]_5YIfU,cNZ@)00OL@_G:H9>fB?PLY6Cd(3ITXEg1Z
MWZCS(MP83_>TJ;A_=B>_NXc9[NfW]<8<S(f\WO?dK7b,\BKe+d,Ma?PY@\Z,fe.
:AJ>Sc#CAE27c=9E5R6DL3.L]LK&)A9O4Y=N+_0P8XX3@Q/],cS\66778_DM>8P@
Mc]</DRTC)fJSZ2He,2,(.CQcVLQ0VY&HX/IT?Ue\1_[>NeH:D#V_Y\c)^DK+E+/
@E@R6c+,e8]OC_EeS;0Y#X.7e1eE[7?L_O05(U&?DODdM@cD1:O^2^N,GfZ(6XG&
]aXeF[HQGagbERT<2bN-NRX0QX;I^bSYF#?I(0==Y_96GHb:F7Y5O=?DeU^G+2D7
P_M-VX59P0@97_B#1#624]2_.CQ@3V@]R-TV1f?S^b&:L?&ZdT@J5U[#A:S@.QYY
58<W<.W/J02QMA?7PWG=B]@ffRbRT-AK6fUb31J75:2DZ1,b6Ne_RW_:\cA\b/X\
;8)]L\Y#2C+,^RI#M5Ce_<dV[G^P;)&9_5+,4#25?<W0<.7XX783Z_BLX2-/,BE^
B6I-5[)8/.Raa^1-WW&#)X3O8TO7BE&JAK(7-HP?8]<_XQ5A:M.ID)SS:HOJ^^35
=d]a,8MXG;7Rc9ME<TP69>Y:1cU7C#M,+LEQACHbE)<#+f:3OaDAaQb8@H9BN.L?
,M#4H;U61NV@C)<)geMBX:eK76?R78fGDb[]Tg;cK>LQ>&G_PKB3]N2B/3=XX_8\
X5<,.9DC1<)<6WLEJF(>L)?d_O,f8]ANK)SQ][>=+_SGfJ^DZL.-+;bA=CM\J(=<
D+RM[eb>(E17]BF+f4@6WOK,XZ(DOC#&TJ=GUX?6DPR^-,b,57@GDS,I5Y>-#_bd
e[[aB0@NI)cX_N/R[]29+7K5_cLKO@P7G&Kd+&GfX\bJ)Cf1.[A[?2DO9_Z=LfTI
Z:GW0SCU>Q^)60M/94G1F^</c)MX\5B7[YLRAUHg16HOVM#I@^6LH1c9+>Y5:K+P
LU2=SPT_>f?C(W6])DG]\N6/cX7@c)L57^V>AS/86gHL]?3P2;U2_(D-/UZ<6:5U
L;MPfB-:e[QLRX/4=&GK:-@YJ]@f&)C;V3e(KR1N5cSDM25c9T<SC8YH@,(\8#O4
g]Sb<1G8Z-&^HUB=6\OI0/S<P=>:/KZ;IAdSW>,WX.#f)C\H(G]/U;/)^FPL>SDJ
@E6;?[gRV2b2S=3+bf6;9TY:bB;[XV<-BDVO^.g4e4X&+V8#DLZ3LVY@\A^87a#_
GN/?J4BEY#\TX?P;^b@3G4[E_&2C?NeU,Hda6>U)O2]dY6UE3RC;4eU_ZG\-4K:-
-Z(=aC=bNTgK,5@aA2]R286T-4e>^0]09GBI(g<Pe:JY8[f^cEF@A(@?e2E:25IM
JDSdd2#R=9U@,>BT51_V\L2JPEC6b31M;(gE=_)cdP;+Z6dQ0d2=[J@K&Nc]OGL&
UI[BMRTCB]eU;M4VWNUAdCB9J&2[B+,[Z0(<Q-G<TF&.WF3e,;MPJ#<1)_gUEB9F
]#cD6dU&e.6RZNdH[f.]EIY/g;cXVc#9TDQGQE=B9+4cQOF7>?&fR96L=/_fQ(_;
d1_>5IG7Y7Q)JNG?46bgZ1&3b)=5P9_gZ2M6^[7VNBDdLCMOcLETT6_:O22PEeAd
GBQG;(OfFd1g]_1(cgQgbAf0PJ9deZK&#\+;cG=OYZC+G/3cCe(6c,8)ZQ(@<<F4
6]85FC^S=JEg]+?UgXG/d:Y7aVLIPAZdQKL+UWE<G-7KM;4\IbS1CRdWLWKTXFJU
\LIN&ff^AOD<-<&>;\=5R,RSdDO7dRIO@CNLgH>&4HIMT#1+I^?>RU-9)[BU:Q;A
[P6GTC)<AfXF86RIdP\I.4/\5UHc;,&3URQQ6:UYE/NG?Y_OAM0T=d5AR=NH1@K2
^dMFA&S^4K_6/?4G[I(-TLZ]R;PN])g(9]A1,Rf]+5G.AcPH@PLZ7SR/JZ-/GO+G
gebWR&5//e:M3ANJ+4aCYMR9;_=WX,3b_E7FGHQef2O,0X-E.K_Ce:RKB?0-/]+_
ZN]_ZbRB6ZWH_X[:N)Dc,9_7V0[B#OLN1=8.)S@,9f[-GN]L>@SJ&L<P[6M.(&@V
V=U9T;AMcKYga+,+63dYc(X]>4E]H+PSHN81K3LXT]Ic_=GR(0gb2#C23B],WYJS
GW3GJ555:FfaWf1_;_S\>?WA;)X(&eXg8b_KB@+3@X:Q6X&c=.[75&BUc3=g)U/T
(HF5?6CHBK&Q3/eD.>[4(1@^U;(JeU[;cJ4/Z?]G@:/X)5,;@Yb,@9J).Ld&gg9.
fD>T78^U^EAT318>AZWV-VA)X/0eddS<DX,YJbM,D57.U3b>EJ-?7b(/Ef;7ZFAg
Y_#?;?KQC<5WICQ?S6eHXWaZ1U:VB9P<.TMNXCNF4T#EJ&Pf)#RV?W)OU1M/N3,,
&14-^L7T3T(/RS<CbEL#)J58ME5OKbC0;?[cT15I/)PfQ:A)Oa^VIbfWV7QZ,\_F
IX]S2->Te)0\NXd(dQMfFK1g[fKc<.F<PQ0-9\DNN+eTA6G5O?gF+Y:>W^]/V?2>
1+86W.QLD>H<])[H];3CH+fTZ//#H3fcIMfCLS3JVPgI<[JFY&_Ha<WKf)T#&M(X
#)P,1^,U=g//H(5MWZUK#:dMQ<0)#>;Q<:K>YS_;Qg.L^c]?74?3)\GHQUTb2NM&
F]&UYb[S6\VQ7e-<LB0Hg54V@N6\.fL\4]^;\Db4c+WT9a0/9+_AE;d_R(IdWJ>G
8E#C2).<XI&Ccf=R#=B5>b?OB7R;fLA:=c\G(2g18GfH/6gM..;JgdJCG64J:QgW
ZM9CTW7C[D_#3]^L?T55Ce(,_X@O,>:1b\7:HeY&)LG1GfGDTDFYPb;7T[[<[BD_
aa8J9cPWVQ#4;7IQb?@,[H6OAG6DLS;V4fKL=8YKR?IJd@WF(#+(G[a(eUZIUd4Z
[I(Y>ZC]^:UCV-KBD&-DC-Af[56cFL4]TB:9?DD]58M81-:,ALe&WM^G.C_^XX#E
D9D/NgdG@>,^2&0VYOFf#R>QPU68873Aa=#I]J]dc-85gYdQ(6ROZF#IM;6^OQO0
2/3_g#I]e/.6M1=WYYLNWU#C_0FCZC<c\RY:G]4NLUG.:Q-#WB=^TO8V:<X\]U8[
C)4ZV^0c><2a9aI@4^3ZV(CN6Z-b3T)-e)>bILc5gR94:Y)6:45YSeK^/:IC5KEA
@_J:Z[f&=.;+#EWRP/YQ6^GG&J4W8Hf#:^+AXI]BL;d]/:aFVe,)^G.;N#46&_aC
[@6K+<8:9DH0Ge#@UYHd\O@X7WF.9^9ZTeb<:d:W>g/C2]bGA^Q3;,QS2H^RN#C7
/ba7).<-0^?^D@>J9UN:MKO_U#/J-QGP?Ud\UY&g/[VA=X6QT;e(SKV)YSJC[Icb
&4:2f=@?6_B7ZZdcKb><8RYPa/VWfKC(W2Ie_,ZKAI>g0bVW@FN:e3D7XgW5YC1T
J(^O1\7=L.=Ta[-:)A/JO4/-QC3ZTE\R1Mc7NSN-/0)O),Y1c61GNTK;YB@O/2S2
E>Ib>E)?dOZZOc&GGd<C/_gfQZAP)3W#,T.]Ue^a5WU^Yb/K1]]9=JW0DCd6.DXR
&:@;/d,cMcL[HDdUT@f8O,f=;V23CWFHe^>YX12XR6g]\/1L\0S.;/E]F.L,9U80
EA>_=)G\aaWPB?bAV.=F3O1?KO:UAWYTKS.O4a_FX[?[J4_B];^)&1-0COLV^+-6
bY\M<]6:JFOW[:_O-F;/CF:^0-;:[W6E#eS:-/R=INfPSR?EU#/XV87D.,JX3:TW
FX]NFW?\:ZVD2JKc8b?:K.6_9#U,&R.//.gY.6a).;YA3J4\3XS<dQCMX#&UbC\T
IHB<#4]QL>3UU89QXT;9I-GfX\+8ef&5_5ZPec:/?_eA^gAM,?L[;Q:0&C.2Q2d;
QGC=3ET>[T\K.WCbA(&FNT<83Xf11KGPO-T/W,7QK2,52a5PKO>(JXNcC@EP-7XH
H(M//ES_d2dPO90XdVeOT8KWe_c9VRI?2_;4]I&d;/=MGI#2O<8-<0F,MA.PWI]+
bRUT0eXC)C-eL#:L#ICE9R)Y)4cg=_ga]/DWU68LX66ZM/ga)EPSSA_4B,2BZ7#W
+Q<2KKX4V7VPON_Z0[2@?7R[S=9PW/3&B/@3S@,UPTH^2IYgA)Ig<17Q+2LSBF/D
?Oa,0RFgN;fBU8c&M)a9:@[RI\N1dV1[,4&;?KIWC1\94^S6I[03]W?NKaAT5P<M
__TaHY0W&UGEC?FC7gEOZ&]6MUa<J:.A(1_Vb90^1gd8THXS?0C4ZO-QddK78C#4
+OdXZ?g7/HH?.VEV8e9&-(DbNQ)6>10DBD0_eS?/J&3SgHgM4^I).aAEO_=[#;D5
daA#d[f?E[,=^F(g;e&58P<_=#>NKf(0f.g1XC>C_-YN]HO=L3J7P02<G0CXd=YE
D+7>39,L<LL>)5Va0D+2_XB0eC5L.8AcNK2/fXU^dOSI)_d0FV5KYF4bNEOHFQC[
.37V=1ZS/d;G7D->NKN>X=,Ca;.)c+B_HJRHW1J4W5.>X?84VAeXV>IGBH5^Ye27
02)[O]ffF;,7#4YX5^Y]K@.[_Ig=O=A+7?Gg=Fg::M,L&cffUC]S70:W>Ja1XCE]
QUd=gEdC^55P)6FRfVc#B3-R]D7UI#c.<Tc;YXG#Gc@\>=P/cNVCG7SS(.YX/DI[
;DIEY6V-^0LI)+NP5U8^=A\K3<beg6f1._=eP)/^E1?FU+gKUTSD#4(beS1KSF&O
;=9Q>I::Vc+X>184QEJ)JAIX]eb0)cE2)aMXZ@_=)_eW.#JRV52?\CBOWgU&=c<6
c8)g^LIO?,,dGdg(]50E[++O?6B9b5\eY^=F;D2,dXd>EL>LdS]e&gd4:7f><C<C
3T9V0742FK.8LT.AI_Q_OQV=TOGU_AC4T&H[0\PD1TJ/K5V5#Yg(<,941NHTb3:Z
.+ZP15)#=QY\gG.ML<dGd^.Rb/LF(/7MI\9MXF&_[)1UQM>#/#P[1gc</=3cUZ+H
\cNf;F(6L)2PXO.AE0HG=>+-HQD+K0P/7b]c)[N2J4,e?,VIM43P[\830LbJJH#A
,B.TH<L5d+)0-<aQWdeR\<[\3XaHD?aA,ISY__c1B)\eGT2-18AVPdZ7b6(?B9D/
O3e&;CcJI_+/HT.&XO-H;IPTYOCHaTD4D#(8c,65\ed4@N^b&2_]&UF^@d4g.a8D
L=S.-15TQYCZJ_7bOV3?/DWdBGL@#+94\K/H54L0)F]E_S&FI-D0K9]4H#a_B&<&
,e\9#;+ILBS<_FVb_fP+#)]bNZKcGW=SVK;><1cRfN-WIRFNP0a&5FR3VcQW-N?(
.gSRLcGQK1d(9X?C+#H;:fO3eE\aY?]J-5.Y@J-2)WU<@.#B[9[U:KZY(DR46bD&
C@g/8:V2P=C(VB3X9MP=/&0VU0RRF#F@4<BTB,,UMA@72C#d0_)Sd-dR^T/5+K5U
d9O=aW_9DF@d7_]0cC\dSdNIPEOIYFG-3[S9,FNX7FMVTCMN,O8ZL5e>CN_2[K;H
e&;<g>P]40+AR^Cc-17PFDM2Z(]D@g)E)X)DV#d:?7ZDX&Y@+YeT[MQHbT9&-M6Q
81+d=@#+^HDc)U:,dV.CR]8^Q]TP(/Ud/f_\O\<2G<\N_cMETB4Wc6CR@XV>Vg-0
d=AZ>::B(O>_6f>E+KXV[8@&@2>4=fFX[MR\B8LV,=YP6<^#c0+P<MSF;)DG>g+8
Z7F?YMYaM?C-R[PG[[HS80<+MQ?19RV)9+HCDCPD\2gHNZ+9A=7cc+PC]Hb3W=b/
5>+aWDF6gQ.C^JFJ/91Ya5fQ.697Ig1Z;?TBR(f?_ZO_KCPZ[VP<[:79OFJ?B7UX
S0ZNGY0^IA4-Za#^MVGfJ,K7[aD]-+N(fV^)C9TGS=[;I1WE6M^:J7)A3c4JAc7_
M.W.VJTL9MEB7eA8>GID/RDCM;INT+:WO7?WNKD69G?gZdDF]b_?5-?Y>05WD;5J
O-8)QLST^/]I./NHWC+CO)4OQ\bUR&3_Ld;6Va]XZ2Y5S9I\[L8.aZ7ZSB]?;.Mf
,YB.C;L,6\^D:GbO/1:926[JD,_Vg#HO.]N#R<SK,5-/TD>Ta8-CF.J+5V;BHSU?
-1YJ;#Je=UC9BAXXC599AcUB:9S1HL[G@dg9Y:<_#DGT-eK;CSaBEB0-0a3:T:3_
W;^U,=QYT[@B8IfHA].T5#C\O6W2#?F2>UH4WX><)2NMaL?NK:W65WL6J/<WACVO
f&IdcIB\gEVSFWXLXDR>0:#[K57\.S>=B?LMABN?/G2J&RA+JYL/?ZITQ]JQ^?Y^
>GR9-QXcZFT<aB1@2cS8K5F/EBW@<Ja_^-[_@I9D&#_+,gCMT_UVLU<d<5==FZ6N
DZJF<E>#:C0@GfW9cEHg3(;D3>>C>-.+H=H]Ee]=W2\(IIRVSaf9U6a.)/1PXdHV
0M&R:1,bf_Z4^V+9(\YfBPKI>X)@793TY(WF\QZYXd/-0E(,;9g.=0]LL]&E-D]K
\_/-.V?[-IU=P<#TJQ51?OMQM:CO.36A[)Z.>BL&CT1IB9@a,F,a5YI,11g/RIW@
W4a-=MF,RL?/N9HJW13Ca=a_ODT8cTb/ccXGfR><7YPeKPVfbO.c3<QGWD:89GeQ
WYea4>4Z<gg(TAI>aJJRf3c#2ET-F+Z0f#UG_dg+_YW@c?XA\3?#a&5>WU\&6?^N
#-A2@(=6+:=H,XT\c>GdL]LP.=H9C?4gAYK2UUa75^c509\__O72<PE)T\.0&VVD
ZPHYD&B4YLY_56J4Z)69X>Z.+G]db#^dHdf6C)?McFK9AHA9db1:-[8PUAX?IL6J
D1&Z;A8bU#@_<e;^S<M7J#f_Z4TR[W6LV3Nc,<CN+J2@&=G/eO@UN=;:5CfOeXE8
+Y\cNXZ]?3Y:3R:X-0JO,aNE?\8;9E@Ic@D]e.d+OeN\7Y,[S2g[@M#dJMWA^K^>
?CYW5N@+YKXKeR4K&<C;]/766MJD=,G;V]C;M6VNBa:_cHO;-1USKD^8+A0gDb9\
Q9P<&+,F\MY,HW+H=bA&d&A#TOJ]dB=XJ914CI^EEbP>4#fgbAae-1Q@&W?P<b/b
QDOTP.@E_&765P38]B0ZB6JKR59B.[7fQeMCDL5(JDPO@3\<P]9EU=N^QSdA=IPV
AF/aA60\Wd&)^gWg-cN)d](Nc@fLZDB7@V)ZC_17>RTJWTS.d.E6M5YU,Db._(?L
I5#B#G8/TT)Id]\[MXI.I8Y,XQ\c^bdJ;c.]R8Z&WXP)W[&\\W25M,7:d;,VXQ2F
S8Q]RP/?6d1P=<RaMGUZ^GTY&I5CR&PG^b[U?AL8YVVM6.af\MdX^0557:fcd\YS
7aFGU[@J-cKXL9YF-dX9W)H(S1Z2XG[M3X>/6^G5c2(GA&Q:M-#1:.3K<EP.(-?e
UC^,30MNGK(SW3W3<+ZI3a79]MJAQ83d[&aY>.@6V=X[V[+XZ+(YE2#^1KQN,0I4
R(Z1XF,dR2LdO<;JbCFG4A(#U3U0[J+##U,Y04=P9E=eWd<<bbS><07II.HQO:)d
_C54BYIJE#8_VTQQR5\Rd;((T(PT9#.)+WO/Be;78_1.#T(Fc5KV,DTEJ6R4L(aW
^^SB,HZdeeSBfL\Y#,GT_acMR[\[FV?T,O;cZ82E:TQN7O:5-]]H]JE:-VPM#V3H
99+BGc/Z1M?CF[C=49:QC5+A=g?6ZBC4;?UV6Z>_.BNTXM-Z7+B7G3)dZ2(SI&=L
IWP,].E5UfaISS&>;G4Be]VDJ=-@OP>.VXZ7?VI0B;0[FTQ2NT/9A,92?EFG\\3]
I#Z\[0ac/e@5+WY)O#=#ZF+:J:H&)Va-OYKdTDa)0^9V-dNT&_dMW6MA=b<<RM7/
_DgPGS\N4R0fTVLVI<&I;T<D#/>5B:eVKbN_+feKbLWFR39=^O<e<^(NQ^-R.;e;
GEQ)-K:IWN_O?:D6bJ1c4V+S86_:+AJX(SV540[8/bM;cTC,..f\AWE-\;PIJCJ)
^dJEcUP[H[BI;VNdN][EF\GXV[/b&[a.Wcb#F>MSQ&CMY[OM1IOQIN[:07/1c;Q;
]H9Ce;gVQLLGa#I^AaVeg?SD/O=^-5/LGZS44B?b_^80T:Pa5;>bV#KZ@2.41PKI
;;#9>N+d^H(NfY8E9I<]Z1KFGZA=+].ceEX&K)X#d>MVgf;^ONTG>ES_1]cE-AbS
bN7KWS@9MSMC(Z+-)-e\GJSggLcN-2NDE7Q(+=AH8F;;XC&2I9(XEW?gDEJIKG?J
b\OIG_NGeZ^./:_]_cGQQ3-a-^X.b>5ND.6&F15<H([VX\fPORDYH_Kgd2F]C/)E
.=eS7>XVOFDaE/PeEV]T,(eYXRa-8;/.:[TCgAQS.b,:bgYV3CR]1/bbL^_F<Cf+
]])Gc&H&fR./RB;aVR[Db.X3.XbSOZ8e&<[ZF:^NBY=>>4eSHXb)&RdY^Xe@\TH^
FbG:cF/:a2C7N.=/H_6KF.T>1AR(DUBM1]Yb_Z8]J8)8F:Qc0#]B]P:=64HR#fWG
f;/e^P1PN5d--X9C(_I@2>>SWJ?6T+D2T9=_Fe#GId^9Q#OMOe:+KSQUgJ37a6#>
4Vb#c7JX:FG8LWc)PGH9.P67f,KDTW+_[V\L+NaQWQU#V[E>Aa#+U8^#NEQM63Xa
=g4dOXLNe-R9aW14&G?5&SMaJ(M))24H=Bd/.d/-=-dU\^D)7,1g0PR3(g4.,)GB
QBcYa=_9&VY,P]3TO7E6C^Zbb9,<:?2YfLIc34H5fEfeX0:AH5@C1.80U+g\IKN=
P0XI<Z9.a,]d36#e?]4<U5]<@-_-+^O=SNL)0\U#\eGTV:2Z<=C;gHeA2IBc[Z/3
_B15W8(E.?Z._X@#DSYFI\Y<9aDL)aC3ES]S95HeBRd/V-C2@223K@=/CA5c-6N,
MWF^fQ([3(P,#1-:ZEHgLHZdA-)7_,Cc.42gFO9&bMPX2Z,(]VK;2370DGE-Bf\1
b;UF</Q1DB&^@=5&K1BOQ9>^eHGQNTJMgF6BfVcW43Ec3-S4GRXg/(0F4D;S+W_V
a?dIX5&)K0G-d@<RIQ[=@:CTN+261&bK]_eU1A4[E?L=EaJLLRBIFQg0.A=#@75Z
=gM_C.dZ8:X-401-H-5WPGL@Aa7I,@0U)+1?KLYKFIJQ6F[1N.;aNV7[Z?gWD,:?
MXHQ3TN1@CD[2gE7/(cMaT>JBN<bCCJ+>N>;1-[Q-,cTJ\0V9.E9\@<2I(DVd?00
W1TbV[V6V8_,;9\:(b\6Aaf:?Yb01).A?V&#Y.OMJa0E/>+<&/<P7Zg:JEb^=;A]
?G?4XG[?F;d#)TQ#EOJO2TM>.UICQ9\K6M&f=F52)CM[KM[Q@^DZ]D5S(CH-NF:Z
:/-a^W5-(D]1_J&aG]?K31=e_YbST8J\QRL<IV,VF?]e]4WI=GC4#\c&6Dfb9U-A
K./^cOf<HQ6#-^PaYJb,#.Ac]XMM@3W9JI93^B]TecPWGdW1I;A0ES?^V>WRE9;b
]S(>\,)9@cV_G,KN/2T;:KWEFWO1DcW>[K1&@f,0^A#gdPPO&;TNQ6\JHA:T^10X
&J+Ec@(GSL6L)e[1fQe,-R@-Sc1@_,HHebOO,?.L7aWFHS;T1EE+G_bJSZC.6O&5
.DfN^Ja>?1^088JE?c,Y.;dcf.0fd+<F42C==P3<GM&g0+38@\4ND2WC.AG-S,.)
Ugg=YIUf.#HVJ(L@L-[Lf?PfKfSWW#LZ=c;dM]^Y3BDJaSAVPgcP\;-DY6/NL^5L
WB+3@KQAAL&N#1YD#Xa0AQ0:ISCEX)]36O09>BePE&VJgVL/C(5-<23KbfB22KTD
Y=>g#F(e6ZU6FV[9H+UPFC)fR8Rg6c5gCM8]gF3PEO[ID<:/5Q@YL2>@C/WP#GZ+
G0JHWNK-9GE=@27E(;.5V^WTc]I?CeW3YYSNcF]2<cT<NIQfc+M]GZT6M)\5GJS0
39K-#X#?5B3Yb.L])cgUZ.)DM5(>TV<(8:XUU.O0B<<&dO[X(<B+_ccbD\(7Sg&G
?OV>FEC[MBFEFVY?M#JZga?FgGQYQ_H3U6TIG[PK3^G_RdgQa>9\aVa[LN?0__a?
Vf&@R&TUB,9bFfg87;RR&S03)KKCVS2,^f\Td1]U)@->YB#afYG+>X+Y/L^B,AVI
1Qc&OD1=?)Fg;Fe^=;AT,W[Kde@?a#9</X__)?=WQ^=<B6@3Q/43Jc<E38c\FaEX
c)^M/](L-CH(NF,O5eR>N&ZM7<XcY:+^U#RC]I2U3/^;-.FAM4e?S(X75Xa/UT/5
,H16S(WRXWB0KT#DB[<YK/AET(=XE7bLdf#3O\-7NU_#;Q]ZR8;>50ON<eW65NcH
H8LQaE18?-;]adH8.==A,-&\+^M))6>LbMUB2Y7A@/PA?>IY#K4<^e1LIbVW4[1T
O56@g9+;g4:60=UZBU]>Y7Df>.0WX[&6#ZG)MT<TY,W2]92TO((L.FWRF5;<(Tcc
D^b6e@I>@+:)g@\f3T[IQG,-P.B8b=?@IfQJH<X)^Ve0PQW)P#:PELc;PIG/C@[a
LVNR,_-3@N@?YPXb#>8EAgd,:8d>X62@Z:F/LVL4g>TC\9-E-RI5\IXWT)8PfNH<
eE6;B+X9#7d6gW921/aKX,bXW8<dZ5ff/BI6Jc,2/L[O9_E5,ZDFW(),0R8LO#])
19ATTQ7;K1VdUeM3C>WRXPF?UL#\E>4)dbcK(aAV:><7973@0;6?D2O[])_&H(-E
c+MgZ=S:TK1W1(ENcQ;dSeS[-:M92=F9Wc[HI>>,;L3Y:>T>UKF<EKTa;eBMQO6D
C5I[\U2D<16,#^eI?61,,&F-ON6_..ffG.BBT[NBe-6]#R\UQXMR9CACP0cBb/33
ARNZ8^?Ze1dXM,bgU?LZSIJQ#5gU5@C/=Z^X6Ya^dZaWFOgF2/<Y2XGBZ^S_5I3V
R\^YB@H0W\HLK96ZBPXX:=4KGcXF74JQ+XPJJ[D+9>RPT96.,1cUX<53?dD=4TQ8
H3?N@#7_GWP(Me&2D#3+XD.RM6Ve7[MfbLP#c3TW)bXC_ZLM?.c&8O.Ye;)X=Fe@
8\W)>W(;([[P4c/41#C<,W<9<]YA?)/F#\G<J^K.=XZB))b?CXA&J@b\--.,4A+E
9a5H#.Da^cLa5,+:G@Ye;E;I<QY6+#,CL>9+<1O1(Q)CXN_)3/^cCD(PAT7P^37Z
,<g,(81Z]2ZbP3C?#_0E9JD;:(U:.^5;C^M?8)YSMLWYRM5g2SL.=QAC>PHRK:Sg
2L4@L,7)DK9HCbUXK[LOaDMN#&&[.c\UO.1OeN>.WJ#\_=bNU5V-A+TUU9FK2a/^
F8eA92bK,b^bX@=]VHO:V8>V_21=_6&0,Rg<.LL]\dXa4>HNe>ggO/@-;Wc(\\TP
dM3^9Z/T[5S69<EE(c.I7XG>8BK2LgNBRF1g5W4WQ-I:LBYF.9<3b,7dgCD[Q8F)
4Q>=0IX9\)W&bb#g-L/BB<Yg?4RQ-O2(ZJa1f)76+NUG]WYS=A:-5E\D#[+-fFG:
&gM/@_Pc]95D30Mb=fd0^S0VUE4A+e,3Y8bb7JS992a-.)bC@FUe(QIWSC0CSfS^
X&;ZdFQ:c(JCI(:5>8#Q<M^9+QUgM>L9dPB-#GbO8TM;)S/f5WZbGRB;8IKc^7,R
,5W01]V&V0&cPG\+NQ;V_P;:)Z@K[EbZ1f7C&gYVg]5\W;3aI/,+?YU@]6:/FWI+
:fYY\Tg_EaAV@NQc0>TQG?VCY+]=fAFgLX;1Fg>8f,LH4A@\=aTINfY6+CHbSFZJ
ZNGHOc#?Ka+&&#)US2D:N>7V6>#C1QISbgQdN?JP.&EQBZ5];FUI2L4<]_5D72D2
Y@HU4><IIZ]gAF3MX,]eT3G^5aG3gL>OTH3=[AB]S)eATV/@9CDC)Q(B(T,7K?I8
WdDcKSd]TA5=:,T_Mg)f_EeB#N&\YV3\1SG:0>E+--Ze?N?D^KOG-0/Q\aE4P<PI
PdcLRNEVA3;5EQ4\EIP>E,aEOU<NCYG)dE>^Cee1[0^&=V@gOR@P>?IGL-S(e#<f
T(-M<2d1#,R2,VbdTYQLW<OUKPUK>HNBE)da5a74O)=^&UEP2>J[<3f6-0@@X#VE
Z-Q)_;W,OJV1_fRJ(.YKWVDYcb?Q^(a74<^,Z@2+(c5aOU75^K(..NfX.W-+RGbb
^\dXY^?7+U:69SIQ)J]-Q^@aHYaZO=\aBPF1D/]VRU@ObO9UC)QCa4?2V?2WeMI/
bYZ:CSMK3M6)2:26LK4)PFeXC##6SB/aL]6F7dS4:@^OR9BM:dP(=D&W9U2HO/5E
e.K?I>2,=Pc84f2L=(MC2;HT^)QMYCB^U^0e#ZgVXCTY.EC)&&R>2fZ^gCTb:cF5
M5Wb+_5(24UC)M/H[=]F=g-H:R&)\;E_Y\^ae+C2dU_8310gXe5DVY7/R<DG]1#b
QgG]BM(fR>6;(^+CEU:#J=G:Z[<E],X/55P7.cf@&)5(fLD@E#2Z#;9X5JF\@4[;
2OH(I.E^OWd;9,0S+C9[Wc9WOg1<FCQQ^XZ<I\<R3fCZ^.4]I4]@+]4LK#fcXH8(
QE-[IZHHX1+N\2gfF&Ca9-.ROOf]J8>Y.UBfN_SCF(dYQ^#R?L\d0aS7GG>_PSFD
_=e8:2C)<Y#2LZd9<(EP)gC20@4A8I^07dWQb3]Oa]-/+26UVTR4C)KOe,)bWf#U
AFc_GM@&#=3gM1[I)Y+73BF,:;:,7g7HP[32FMY)eK#0c@CEFBD0b)Y5K0(e,6#1
1VP7TR,g^HRBG8A#fO82+eVM&VL^;@9G0=<B&L]P+[)?00VS7N,>;#e-78BJT(QR
3Ic-XgeZ^7=LPAAJ9g;=_?D6M4\g>GMcMZ74]2,&ZD0e6DJ5;#efPc18Tf;7VR0/
;3]FY]e4B9YYf.fH/_9X5#C0N9d3;YGTQ)0ZL/bS#(0CU:A&N0<8DP64L:D998,:
?)[^@?<8,Y8EZPdP:O\[d?G^3OC])/#G\X5)25A4Z,[a:]&T+cc?4-K=)1cY@W9.
WUPF<PH8DPa#]&Ac+2fT#Z@>J.&9#ABe/7(&KPA.<5;W3A;IVe4F787-#1+BL3\P
(c;e2<Q_FPTO8,YF90?=DHbgO<&=J3;V2RV\.A[0V)8PbPF?X-Be1[6GbH):W6;:
+]O/U2c)RIPXF_UR&X\54:a\C_:K6dVQ38a]=DUWId:G6SACeOWM1;.R-E?_,Y[U
[DVQ>?eNA6b6cc5&^#50?fCW]&.D+99JTLBfA(<+MP7a2OV@I#8K&0OOL5#9491H
YGKSZHJN+=T.gML@1O:g/UH5C)DKZ_\(QIQ:.DN8GW06M<EDYJ=\K=-S?WdPE-;a
(CGEZE-M@T1^\?N[0T,<_9L=/A;d[3:#XTZ,B)Va72+\TLQTc@f<EZ_2;/8_U]cD
,43ZK9.>&NOIS62B1DZ<Z0[ABIBb;[[>33A[)gOe4Dd8D[L)OD8/#D.c<XaWM<L<
M?>FQ(;\++D,<+O(,T]]G0A:#4fCLc3DJaG3.\7ZA1g?-CE]K4-&2>dXPf+4eQ_a
,bc\NG78fCSM<DKf<dAYI,UDY4&?N26ff05g-7g0:UDFg@U4>E?JdCG??4D5UF>d
PT=eU5KBW:011@Fc4g_C=M-fF<[;4E:4[M(BUa>K,XE7Zb(&aEe.M4(OBAG&Mf/a
_7;90:I-1H(IeOM^NM&E?6e[U0Z4:@4\V;NG8U;>T<L+M>Z2&;Pa9L9/1a@H#4B^
6O:;5YOK\]<>#(-0ETcdY1M6e]H&b+8A,TU3>1edcG#]9DK\;_^T\GS;#XE+[#AZ
A4E[DaKM(bcIf=:2cT/,b)+OM@gQ9Wa@S;AICdZ590)Bc;YK@(EK8J8)(eYE+2Cf
&Ld09@5YeK[+VHTQ&I?5^,;e-:)9\;,OY-MSGCC^9_HgS[-I0U=E>R7=7OcUIKK&
628_4G;/VM/ZW#T4&.+b<FLDCG#c08XdN4^#-KJ;Dg=^+G_d(O<bYY:g#a6^4JC(
6F)O><8JQ1@?cfe2BYDJUWJeUCZV[X1YDWCgLc>WaWVfAV.Q[[:;;Wf:5a2LL\-N
H?7J3K4,5]2^6#Kb+e&.S,8f)^8UR#2))X#(3ScWCU,.X&W+.WJISD/=4_60;N#S
2X/#WV&RdC2(ZP=B(TfdAVRG_2#ZRK1.R=^G035(JYS5(<G[TGGZf.=HFV9eM[ZU
]CSZ?=UQWdY@O;STdddRG-8WA=EX:WcP;Kb_E]\0:82[MW>;4e])6e01=XYXV2:e
AWNK#SN7YK;L;fUbUUNf7-D]1UWdSJ)OE^S2-,R8\20.-[2+SHE/NE/EF0O(+eY)
1\2^@&-dG&:.(fF?[6C2CMd->]75Wb[=M+_8,8&^R?#&dS;#I/ZS-T^HWaU2MJMJ
gMW_66F;G(:;:WPd]K)S:3A-@#Jde7T5b-7be#^RgZA-UO6?d+UYP/D\#eJ93B\1
,3HB_U,a\?6Q]8HbN]C52EK#5<HN9I7;BU/0/WA);&IXW,Q_L3OPNI(_9/9e:]b4
7_=>S@cN4+)?TDXEM+6J+>ECgYP-R33X@.]TY^WMP2=b-=HZT+7JKQZ5HO[/U-J/
WQ_1N0D55/PQLK8H=Zb]a55<O5bVGS[CgJ8]T:,K3>&\-e[K\;WFd;/cFXQ5gJO8
N?R-<F<Q>Z1:0DTVTC1OUVEX_^]bPO7&/SQPB)6ef(R#+O&4DD[b2f#6KEd+af0(
(ANAW8FT\4dCX1#OZ33DL9TRFb/FX0^MbXGQUSa<\V#MVEgT+.(UEY6[CN0He5LP
&]PcGcL2<W/]5c;fJU0H@(9H0N]EfIM\Q.0VE&,UKXRIU>I])eCDB3LMU]R_SYAe
&A/C425b6,(6UW2fU)5Z3Q6c_FB/,_@.R9VR2H@.(/a8f^cFO7:@EQ;1<#VUI/7?
,96#<KLBPEY&cV.>-KHY#7=,S_RB21_@L0?Cb/]-fV+B=\\89VfFWH\PI_);=&(:
W>#5aFSR./3F05EA\8^GBFcL_F@;0(9H,/;X]\PfDa_?V?eB_1#7M\cQE7SZJ;_>
V.?,@]A[Ze6O]4HHTRe>3O;RaLB0GYBB=BTYIYJU;3B=IUTH0C96HZ1,fUE\4?RH
/88g=Hc]gX6.&8/KdMZQ94;ZB7IR2eNdD;:L:T#X+eJ-_ae&P.YbgB)^6_.d,N>f
de8U(R.NA?_BHTXcF<cE,cXA[BP1EGIS&5(M8_f53J&]U_eD[>cYJHDOK4(HMA,6
,6:^#18AE3[,/2Qb.W&AW4J\fE=c_92QP=f].1Y9<V7_KN0MR31NPZDCU9/BXV<L
2/BDeBA8DCM-eCH8R/4TE11JFa?bKJYWAK0+9,B>fKVQ0E9<8BV2^+SL1<,^J.T8
KHSSY-3)?1E1UX0aVO)+6A#C5Z1UGId,b)P4J6eBP90(,fYTB8N+We5fA[WIIJ2_
)^G&fe)ZfG,,ZA+e]\41^X,#]\437]g[HQ=BNN+DeZEM#863GOM?\NB3-JY71.(;
W]>L)02#0MD^+_C14470QEZG]fa6;AGI<\0-29<[332>CB^[245O^L>2NdcO(cV-
(I6bI_ZFeS&#UXMg/]H0H8[L,VMG2DAD:4)65J39d]X,(E#3/>;PU)0MIaX6,Md0
>/c&+CA&RSe-UV/JS^@SK@K,Q;;aQGR_Kc<ID_ageA873R:Ve)ac3B.UFF1SSUF6
7Y4AV&2R;(X3d<X3SJ0gH^#JPPc(]PZH/PEI8ZLg_8<&V5Q=+#5HAHSgASRad3Y0
JQ5@3Ae)T91Y^AW>QEc)<-DK.DQ_/I#XIFH_;]2?g1eDe11e1WR3;_?3/Cb:FW4L
eC9;-2Q1.E8^:.Cc.2JbWPF,K9^0ZMD38VeEfc1:eF6[#eK>2)_64ZO4XK^G6,/@
5e_X(>6-YF+;^-B&B@bH=Yg8OL>6/RQd>Q^0#.E#7>7N4N:#VS57XV5+W6_DRcTR
+=^:3C)[#)a/U=<V0bc\fUE1SM/g\afZF@Cf=<EcaGa]f:=,.+746-7a4O48J;8N
65@&:(57G+L/B=FeC^S6/d1V;W2<.UN.?fN^E#SY>Z3#_B3VQU=L.TJ>LTCf+6_g
Z6cgf,K:HF)9>IPUPDd3AJgS]b8;NWE0d0)M2:CcOI&G@#g>Q6<1PP@XA1:S2P?:
T<M=E].We./AOD45>Y^g0fPGX_62^aWNXZYA&N?b^(95;Y=#,cb&T(7/M/Be7..O
).-5T1B-7JdW2;,0=7g]BaSPaG<aYN(I>,)OF6d5?D_F3O-C>BW7AV=(f#[=,QY_
/:BOc>#F3;15_NXa<L?1RJG^:.1]J]<4IBA8[QS0W#8)U+CD/ZPa-CR&D\Y=D0P@
]a:\83AIL5\S1SWRSXFR=,>(;8cQO;I5-S&H5FJ0<G,_<7LBT#E0IC(0:T?W_WR0
I2fDR=]&[9[XQO+EAURBdbH[6IdZ(#X&NXQ4./DV/cBK(H-.^<0,=eYAVWV+A-G-
e#FD\O?3>N0CHUQ@ZMY>H=\T+bI3&Of7I]b&2c>)af36#9_8GcW>STbA3+,;f(g6
B=0[^&AgYaGD.;[cE<R;S#@.^KZP1J8.0T.8YS;2^c..35,(@(F_T)LZPa8)Ff9&
OIQA9UJFE^#XB:d9:JS;<^)C@OICM8=4S95=<KENe[KdM5\7#V&H,&Q=ZSV0@I&;
6M@a1=e-[R)UUd2-WbK<C?62-fBHL#5J>AWABBZ(+1)JH26J73F:1TF^2SJBKXG6
E4H;L;0V@=T]8ZD?ccV\RLV74+Lg2d2/DL4VS;J7<De/ME:1g-dVC;IFM4-+5DT1
#^K(I?>B;0&.gZc=B&?P[6VW^J;bTV_T]d=ZE9:4CR=+C.HM?D,6DT]9:&X(C:V@
Q6>C((R;\#:F4=AaGS;]4K(A>GZf3Wd.Q]D-F)#dDOL]5_^I\J:YF\)HZC^Bed>g
(4g\eHBBAJb?^3>V/?]DT8OJR.+fg7J/<Ua-/371=V4GeZ8e<([/)\DNE6ICN<RI
T\]1[LBJHA1,=(PI<LTY=fd&c@;6Sfc7Q\M-dWIW#@FZK0/Q/gOUfK3&BTJJf+AV
9W9WRX=06,WO>6JZ1G>@)GZ,X.V_IUH\:2#JHUO#?]6@QFGa+AAR4_V_\_^f]e2V
ge1>><9QUS4H+FG_]3Ya)1GN3:^UE82\9NXL(]:E,BXg_(Z)PLKgN<?fLO-e]I(&
3KZTII@I\,+gf][,g\[(TIFU(.UE13X5@FSNJ/[3<gfUI]M#M[7+?X(7Z;Ta>dQS
W+3P69(9FYS>VI8AFZL9\J5T8)6B@[P]YA@BK4<H8JT3AC(=cI^\/EF->?BUEDf-
AUb@)K\5D<ULeU3XN&ZH;P307\;A\UL:/C9-KB?-4H1e?NL,-N8+Z^J?GG>?IIB5
/a6HP9F]OV39]:Pe=JQ;XUaBOfcR^Y4#O0U-XW=9D.f4@:Yc[:Og;d[TCfE&O)M@
#A/4H026UBaYb?--3^CU1Vf:4c-94NWD7fBgJR\E>)5HB\Z>,H2L1U0R,)e74Xa\
a.Q0f?]__AYM1dPWPVEca8KAI[eAB(=+WZLMOUKeMb8I=P?(^bOfABAI4(R,I-62
^LEL6g]@S7S#PGTWYSaW3:b-V@/)8;X_]?Y0]W:M[[J#S.Z5eEW-1W3[:bSIYW+O
b432#ZG/dF&Y>ZF3R[=Q\3]L):3LO7C&4>1HUQ^,>Wgg:(4IRc=]^HJ_3:YcAHQF
4W@BgXg<^UcB++6Q3;OdD;)3V)4]+I+./M6=Saa&9/W&G34:^@\c=8&aLCI7gM,)
PH_63P5O3NKMU4C@\eKH?\;?bTXNAGg+=\DbGcaC=a0R9@4<^;DYf0Q;TF<DV+g>
c/N5eP+[8d1fK3#_N\ZfdCEO=^>f=f.a<UgJ,Kb,Jg8OTRI=5]QVQ>Q,;IfNB5O0
E8AH9V6PNS<H@NaX/Ue>-8^#@N=HW<CB(5c<MYP85X9A95?(7A4/T(E(01<-[./K
:fM-5B2Yb\VN)Ke)O3JNSLY[47IN5&Ge907Z^;38R\-?=+>631@a&]@Z_#JFY6++
H?NP.(MJ8J7@9b3H)W(MEZ//931:8WED[02/af#fAF<HaD//T8&)Z9&72:?]I3@d
0L33^&9DbeO+NK8beQKe:SK8R1ZP/;@aCX?Y?VE(NT,R1M@H5;TA=K61-FUG^1[8
I0H3D7>AdJfG1)-Tee:AG&F3=SOS0bM)XVSg\-XWM#>\^4ZJe>LfOf9\S4@/,P@c
,V)#A(BI[aaOf8Od7@De?)EGfSL#;H6HU3[4DXCQM&/,T?VbW1KN5KTBG:;TDV->
gNeNBgFE&J+YM]:7.2)+RT9\Q:^X\5.)JacSc<fDLVAH<JWWe2ACYT)M?77;HF&+
)+[7@)>]3<:OSMXT4C>cAeGJV,KE@5@C5.f/KSS^LK,,X2g1eVgI@K3Q6[MPN(TW
[:)[\DbZV;3]357#[IC2c=8AU]NCJ(#RR]+^Q3XDY0\:Xe-V,#D=ZVJd\2I32f1\
L5[H-g<W7QRN[0Fb_9G??-LY5]U@d93SeK;5]B.L#?E&,cTAdFTOEDSJ:QHV,XSU
&0gbdL[U_.^OET=VeQg53(Q3&8N>9c>1LAZNQ81A<B0c_/H4a@Q4_</W9E3SEL4e
+<BdNbQFZ(_?.aX)QHRAf^KPG0:SQG1^KK-:WWa&d<.QXT?\HQD+C<K22S9AB;gA
5S84]BI6b0?-(DL?6OJ45gZ]81,gLZUSW9(b)=,D18SI.WIIYa(+g;Dc6DeIA>V/
TG[J[7cb=GL6.DN_8)eYBC\[8KTcN#?OR.L.NFX6XN&+\3Y8Q]<gQ4N2-=YH(M;?
R@MfV6MO:09^^DRK[d/6LQDQ[\JX\?ccc^5L.61ZK.?c7JXT@N93QA\M1(e:VaGC
KWM\OBB8Ke3bYT6:/]=MFaZJPJ#9FWb^,?E1b6N#Db\,PH5]4SN(5[ZQK=EDKXT)
?SIRg5U.KP(?..>?BS,8Pbg/P/J3)SM_e>0.UY=X4fK]LZBc1G2Y&7cXZ=:c=@3&
]X)c.2H11RI(3NaafLSO6:)LAS[N-;ZIdS]b4Z8UWQA40g29?8NWD<XeYDd(4Id7
6g?A]&R(HJP_L31&b#GA0?[GI2(,+dSNK__)e-?C]-RbQH9I0BgO,K_YGA+5CX^J
Fg[D&QGR=S)X1UeGQRK/dK/XDJ(ORNA7H,TVOP=0bFcfWF=Mg)>5WS\YTR[LBeD6
<?532Gg52L)(/PD/;)KPeHQfCR[fH5^cFS><7?(G7LaH9K]J8,&&9?,2H(XG2&RV
Vf4a]S^1b[4D2\/GNXEPf7bQ:fgTSfLc415S8e=;3==XKD\[8<5U_5R_M1^f,@P^
5K.8c2=?V\@XI4OGSE)GAcSfOg8H.GJ^B+/2-3<\fG0=e&R2=189c(dO^YYRXNF6
WAZ5O^/XDc-dDR83fe>N;cSO\0-54,16U#+T@0F?U2:C]YQ9J[87?YDKe3.\G\TY
3CQFB\Fc@2^6R+\X[N17QJETFM6V,9UTYI)9A_de1SFGaT>JCKd.,]&?9BO:>?#9
egJJE/+^F;XD\P?Q(5+C4W?Wa/[(FG/>GFV_#GeT3_WJ:2+2\33]A;2-5@XQb8M&
RaNRaJ=QNF5ZO&YTOeOD(GW8-(0S,A;6>RW38PZB21W(Z[:\@JGa;RD#2gW<CR-N
R3(7.VLFL(AJ]f6bOIL(Ndb^S,P?AVS&4_AgZ8#+ROJVMC4ge&66R::/e+dNOLXG
;P^eaMX58,_HK\.&[<3GVYM>UE[VCGQ.T)EOTFN;ea_-_?HK+L?Ug2]JafNDbL_f
V;OYX:IC4fb_KL<-&RG19Eaa[UJ:Y.+MWc9PW/F)bCf>Z#be._gQ7;BSVY4_/86&
&:J3)@QO:Q\Cb0CEAI4Y/DAJGZT#]:,^S831#)-a\\Qa)+C8U7XR+M..GAPR\>OIU$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_CY14V_AC_CONFIGURATION_SV
