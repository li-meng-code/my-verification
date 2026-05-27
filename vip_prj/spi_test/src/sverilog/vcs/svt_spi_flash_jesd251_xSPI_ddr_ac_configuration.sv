
`ifndef GUARD_SVT_SPI_FLASH_JESD251_XSPI_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_JESD251_XSPI_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto JESD251 device family in DDR mode.
 */
class svt_spi_flash_jesd251_xSPI_ddr_ac_configuration extends svt_configuration;

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
  `svt_vmm_data_new(svt_spi_flash_jesd251_xSPI_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_jesd251_xSPI_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_jesd251_xSPI_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_jesd251_xSPI_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_jesd251_xSPI_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_jesd251_xSPI_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_jesd251_xSPI_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
:UA0.P-/2aWc.;AV@XU#&:MCWVBQ4;QEE)@Y).a/&^ZUW6eU]&8M/)RIdYB66QTZ
46eK)UX&SXK_1,VF7,9aVB1G0I&L#.@Bd__^L3Z[(O(#V.\)36dNQ_1N,@3H4_C1
2+ZI9:f]<A:C]>3QBZZC.;U94=PP23B/->Q\1VQF57^eCNS?<.VIYTV+SQS<(cAg
W&C,V;8f17:27EXT2LVERSZgS[b@/1FJ>1JU]F09CNET@X^5H(2M1X()LU@1WRPD
)Ge?f;S.?@VI@X^AZ3ZQcgB9X;/fGCN:J=N<<;>O8;c<0c@I@JWI>],(.3a[Y/&X
FW1OR1V?IPZ;^fX8ADP#=/c41XTE[Dg</_@[1AXB?>f\35>/N,<I+G45,H=HK=0V
AEc#F9gMT6f+6OS(6Cf1G<Od[P7(RG1\C8fLAN9=2BQCZ^AbM+L3KD@:NaKUVF>3
TXD4=.E)9A.X0.ZfL]WOC^b8AO/:Y:R5:aV]PYddcX+@7W,J4PU4JP\]_]gH3QVF
#fB^Db,:aTcaW>T#N,)fDc3FfgDbKW(]3+:I/[)&[<W/C,AG(?5^RA_?/MT4LO[2
8@0:_Ieb<)aUWR;[FU\)\b.RAI@J_@\b^IgJ:UC&WJU0e1^P(:K6LbKb1<@XVaN^
#^&TV;2(WR^8;AJAg4:JL;R_aP;(7[:92K8)Jg8=@D:FLcNB&,2ef?4Fg&X5G.(<
IR^^:gdcgB[S-XXL\_P\=O3VA/.W]&S.:)V2S9<P,V0g(O7-U96Rc=-5<Vg2MV5U
\egO&4GH4M@&d[SY=WgV3</3M2cP?+UEN\,KS;Q5=/7]VYQ+QVC,A>H8g]AG(H,-Q$
`endprotected


//vcs_vip_protect
`protected
T[&QF-Y[7^V5.bZ.&)PeJ3eY<b-1)+/ZGK_3BYH#UJ==DAP\WA_P+(:D@]:,+ZE(
\N0gL8/M#;9<D+R#KGdCeKUC-.PbSQJ_Dd5g8-3Q_]GZO^=#4[7g_UE02g8);9f1
6\Qd8Oa,I@@07D#dQJf;O,X;W2>Y2D[>4XYE54O11K>6/SURS8JJa:PZf#cc;9O(
W)BN3]P;V66:M6g1Kd=XSf?OYS>XaMcO@CY2I-(VTeYFaHP.:>;80CA>VYBUM.]O
Hg0HA:>4I>IX7Qd-b,=,?)Q99e]BJW>LaS93PE@RL@MFI[Q1A7_G2X?fVW;O3D>.
=JY/QDT<EINT?5Q8I=\;ZNgRZ3dF/,91;ab?\T+0cS2E,^4C>(&Z[?78X-F9P6E)
<T8;c\IgN^gQ=D:IK<;=FG0I=:DaG#1QLLW>]aDD7dKA_=YX63LD#0^,bAL#H&GV
<W4cS.XaKSa?ca0&Z.YeUT[&C.G@#E]Q^=#PS-F=TG>7W^Y19f((,#ZDH[L5Je5Z
]DbV;6FcMJ52X,+0c=JLKO(CB3ZB\P2:#X/;3UGS@K/F1Y^C2J,)HN\_KE3)&GbJ
NN9Bd2HLbKg4Y5?4@,G/#V5BYZbZI@YXSeWQ-C+]KUZSZ)cHQH=)G]Y>ZEHZQ)8#
7Sb3Ub\^abA6J3E2C70T]1#3gQ@2K[@0-H\Ae>RLaG<EFc<44ZKR@FBXHa3dO=<\
UD:^^AU/9#9Ba#53AGYJRE/1dBMVaD\:CY_caR@bGa6F(88(?KdQHDb(N<c7ZU#0
-e6D9;OT62]E<FU94=E+39I;UE&1Y7K-.G\QfXNPYZ[_?a35>A]LLQXEWUTWD7TO
I^I?6M&2OgMW+FI@NVPg30WQ4:Z^&0I9Z1WR/D1O?)/Ta?A^/O;\^Nd;<+03-BbD
19#C<0Y._&<-MA5T]CH3YZE]3NW\3ODGZgV4@e0BN,G-0702<7YF_935GHJa6/,b
DPIU\UZLHL/g/5##^(ZJP(EG:E)5XUG2gP=?+WR7?[.adaP:4Dg3YfIC.EC;=Z@b
>0GZFTS3a7bGS9ce+[9PbdKZNMV5>.ZRWCQ<D:;S894I)_6GRBT[K@.\+SGPZZQ:
Q56bQIL;\>=b=T?3DNJ+QK:/BL+O)Qb&V#O/LA3IIP#?1YB?@0^2a)d[L4ce^X&/
PA6;W/:<:FIcU7K<N-GDFMN?3IbBRW5dReW-6.QT@BSJ/947db2?^M))<4MPRM/<
M=#US1d_=#+MRY[8HR^L0^;:G8APFPUbf(2HS0g&WaM79J(LagVE45#aE.[,-822
:Rg8-[N3NR=XNe9JGe0]4&,0\7]V2fXb@a^;d1UfG>cVZ>K_(PdaHD2T+3I=Z]-#
&BE5,;V9YcMI1gB9_Z+)K2/@Z,a[gd@3\8#SI.f?8U=C?5WRIE4?[PP_D3U.5]ac
LOYF/E2,#/??2,B]VS0cHET/,#>R6OH?2,ab5&=-WD03Ee<85P)b&L7,a\TA(-0S
gR_CU2F_CMHdMf;3HB\EZ6UY6cA-Q;Z@(FSNX>/]7L+\Rg7P\Q80?E/0^-fU+H,a
=a?#8E0_YeW2\Cg4gc^F@cTPF[c&,d,GB&[?)NE=Y11?66f<?KCd&eSdK+&75X0L
>/?_NW<TCI/A]CWeDU2,gga[#1>c2X^.N1(^9821ffV^12IHT4L[HNeE9QU/63>V
IF+[LC(dRSP/;:Ig18c5MY0,P>-8.Y]eG;IK<0_(^QVL.N<A(I,9_eFFbD6[FC>2
K^56?M?gAV5#SSDbUFXR(^+I/TJ@?.6U@<d\W;K-=aE.X8d=CfXUc1]P[F-gYM@^
<3J)T(bPNF9&&_R#:+8:/0<:+Oe\f&(6IQRaUF#-L9^D.K542D.8CF1f63KcOOEG
M8CD]&OH1#;EI(IM#.T9FX_T0XBSC.KCDD\IK@RDf)+:H)fLN;]=3d0.CY,J4PPE
(4:bQKUdFVgQJ<&.)KWeK/e@a9AK5KL]9R]Z90B-D=61CJMB(C-FPIA.^/;J.;-,
VUD;_G:KfQY,)e8=MI3=J8K\WU7S0gF9]G=\6RVAO;PgR(@bf11F>eL)9G[;):KE
eA2,dN2J(e>f;aPd2;J9b0:M)GP^>U#ZfDJ\1JUFN[I9@J[Z[\5)<D4BJMNSMBWd
DR=b##Hg]II_A.gW/6IS\,Kc]=K?A.JYQM1e6HC-81[0?(+3+/WFNe-N;4AFQG,#
E?6(U#WT/PCY3ReP51>E1#\Q/PG-H0gO.CePJ?>FD\5/9b?Y#MP,H[6GWTTg:T#/
O>Z9<M)3W+)N[dL9V/OT-0<:5Y+.)KR6Nf3-0KP]A^;YdL_V68GX-;U0L<c^N=\>
-4.+A4.fCX>SP+&=;__W(^Cg[0I08NUO].]]_TC4CE(e^c0LEG8eL8B#@:EDdfQR
<BTT8.8L)JO^Cf,(-]:N,1?aQG8M2\S_&eV&CXYNf0B.e9AdG1NNP=dPRcA[QRR,
SC_8V5=^38=deF#]:SNV.NIJB6#HI[bYWZXJL(OIfcF^>,?,H>>.:O<9/fXGWg:P
.\,fAWU;ZIc1GaFUUZ6=d3.=D?O<)X74>G1^<aCUY65<]].<S?1Z.5?KVDWL@9ca
b46/&->;4OCWU=M7RCgZ)A<Vfc\SGA[99@YHDE860fAHR.gDfZc-K2I,#4(B,e7;
R5Kb+)5EKG;@F5aZe[aIcVZ/:c5,.2bN#Z?XO/Ed&>0W;EZF>,=\)/40YDO\dLM2
(H]\>7QW(e4D:eU9a]cO)0,5f<?Yg)-SM(W?V5<Y46?K>a^ED=8e_.QFW;^84=#G
cNZ)>)e=WB#\13M1[P6F0DgZ8^5&<Z#T>YB9FW0e]dK.6H2.]-[d5<_\E7Y[eGRf
Z1>=X<a=3fC<V)_=K814_O]dEAX7N:OHV#(a@W6WdH0[LTPK479R/W=.fa:9e,[S
Ef,O[[RQ=;eeYBBH[OJP[??Z5VE6W2WJBd>Nf,(7&f@9]&LC._Vg0Cca&K\.#LJQ
,9<LcU?2333ggH:K=36,N<T-[c0Rfe9(OM@TceU,(2PMH2@GBV^A(@G59T>T^D8@
N](S3/adcDC/KT><O0#MUJAP0G5+]7KK[DQ8Y&>gB)dTaV:Qf4Y:BE=28N+I=b2.
K/8>eWO]M=;0H8Z]&U6:R@[A9^#L/HVg56831K1Q4<PM:NC^1I.<9a8?8f?^F<8d
;3K-CLD<0EB]+Y6L+NLPS-0FU5K\M-(RY()Kd2#c>dU#0\5eQ?cDSf6/OC(g<A?P
9#9bJ=XJ;EZ]<CfQE,:ROF3E0eeZ&1AKWQYa0e+Z1A#O4L6BWAX/-PU@?a79\R4E
<6FD^;+>\c0:OH8>L2\PRKMabO817/.VNe/<cW4Tc+B[MTaL-0QWERZ2eJ^^6GPV
)CBI)A-;21EW0[QQY#3<?Q78e4O8dJH\1/BJUc[)PQU75:-+GRRG=KB5b]6?7ccF
-H>:7e5U_M.1]X]KLR<D_R90<G.BUC:FL/4&I0J=18]50E^9NB3CI0b?8Q5;K0F:
3L:I#&@5@7O7eUdXSK#1?;(+5_VCSG5befY.DI.a>9E#fM0MCBed9V1e8fR1a:0F
U&/C)E5.-@_OZb4TLG?8_Y).B9H9cF=_[48dKN\43(<b&:U;N.&[3D#Q\&<GA5;g
_dK.<F\e5FBIGK>6,>>D0eC@3JYE^9:ITe-U_))eE7D;UB(C^+K:<BYcfJXbR7-&
GMc5@X9UB<RC2ROdY75--V>TETQ@U,E]VE3V_WC(KW2b\5+f2YD^P[U-e:I]A&@:
(OMO0RT,g1APE:dYI\L=CR>\8.XMTS0^5/^Sb-@2(1K(24A-5?970Dfb[I1PP+X2
+)K6If2ba5COb;fgW/M,H9YA)VXeUdc0gJT(70#P^J),Aa5RIJg]AA2MFN:L27Z.
D2.9XTRMCH4HRF4;-e<TbHTR15NH31ae,QOf@A^A_8X(0/Q(2OD[NegVX0&fNN[D
Z+3_>SGQNOWGDAN:]eZA_;JJT6U;U&cVY.BN\Lc;@-Y>&.)aZV/Z_J-,M0W53)NQ
]HCGPc\Q/YCZ?cS6\DYd52aJNa=:_YaSXU?/B(M&af1Ge&A4ET1Xe0]:A8:?\B>?
LX^?+b_P?:70f^68Lb)::S&2YLP)0LEBe:^;437U8K6?58K)+4[e=00?^6.4^;gV
4>N4<U>J;+/c=UR,</RK.JSLfRJ9]#f>cUI7NeJ&SA?Zg=-/)6H(X,#HX_+ULd2)
Z0XO.F#bN2RCC]:I05RCB[?-=--41+LII09L<DFJS,<FSgX;L08>a=K8>,NfLcJ1
Z\Y4AFD27,ENU)Q&8:#X44Y4Neb[5XAb#&<V@Ha4K;G(SDT0eM\bQHD37F8_ZBbc
R)b9F<#W_\P7f(=IH]O_&#N-.Z8+8E;QHFQ0dJ;S4@O][NV[27923)(7_&eSKK?b
]Y?BaM?(DZZe4?K;)_X=J21@)/,F<_TE#G.Eb0I:\5ARSEWR_LXdJ4XKTSO_<__&
UV^#dFO99UZ4ff(WFZTabQJC.6?FX480L1W5Z]YT?+@a0;U4,O)cN798fAF3]6U.
M.\6VIDaegI5#+gGbcIJV7@#-0<3?QMQ(Q,BIN\&IbCbRUR2BK.M-^=R.7OKFDMA
8eAWW5I8L2ULR-W]+=_b+Y[I&?PSP@cV;)QcRg5+(Q[Y;H\4\f8M6#O0-EK3G6fB
be#_Z@]WT>D)6LO>S5#])C8P>?X_EOL_9C>RI?Se/0;.\9#0#D\:Z/e-+dAEdg[f
[Sa&Xa<52[98]@U)[Ig9A2U@,.c3:e=R\>;WDJ,QF>88M2@:4cIefB8YU8LSWLVf
X7O;(G@62>SA1:.22N3&@9VG#?OfG;g(N=[Z&aa_<H?=C5Ne\W3W)33)A30:ffZ9
EgS)A=@.,dA6b_QY,Y4[L#XaN?ZBOQ?WDE>O0?=1SUE=ZU@Feff)W]Y^a4XSIP&E
F7^TH^dE-52a-QLIH>f+(5VMeTd_VR2aaH[O@RQ7&BSE,XgBM(MegG/L;9A#5F0[
QNc-;<.Bc2/A#FKVXG-V>9UD28Y3_^#@E=7E\IR#_CCL8b8/>8IEdNQEICZd.(e:
d3N&/HY9dLII9dV:4Cf;7([>)fI7gADJWGS=L8X)7>B@U106)V85/ffL&=D1=N7\
/^OdR)#aV=J9(dT;a?GHfO5TZG6PU58EYGG0A>,>GRT8B),]\\ZR[/W[Y/gTe6<=
NX_[LBRJS<[4Q:.IBEAaf33=MX3O1,TfJ9O<>]15TT^GAA?O5](Ld<E=PQ-UK)b7
I02e:4;bd^8-,Ka^B)IQf1+gJXF=PQ__<,=KEW3Z6TN5(CV(a/>c7FdTR,6?4dgV
C7P#25R8U?P&IB:;#H)<NZ),VMREfA<1BKO3,J;=JJ3R2@dF_c7NVNH^IQ7PCV^/
,LU_WTT^6&I7#)[H_[,:-Cg.@,Yd#7GQLOESEg-@K_c<NfVL^[,cg#K\PJV,WB9J
=fL-LFR39aAcJf/:RDc.cd?WHNH7/\FTf,7G62Lfa\#Ig4(TQI:)?+bFJU;&YP+(
8+#;DP:07E]/_2V+?.CP&MN=5C9U@K7Tb2KPU4E]-Ee8U@#TZYA(6HC@gSXf[f</
67Za_A&7UAd>Ae94WdM&0;+J<R5-<SU>G,PaG+D&b=[S?DP/A@:&&WY8W-D:eGJ5
:]Mc/NK1;F4^A\C-MT]8.P6WSWS@\L@65FPI5b\eM]T>2X_+CG;G,^(c><V>JXQ;
Gcf3/6YSXS+Z1P^./>aa6,EV[)A&&0LI[Bc&<77JfOIdD#0VK5@XCTJ/O1I59BXK
gNC#>()e)fTE+CO#4[Lg2EgLfX=aQaf0+MFJX;@KKXeVHC(\YLPYAf,=<S#)6F)5
APJV^-+,G?I&XF^KMJ;bHII26W5>F@CQHZg(NL^Sa[SAU07=\ad?L1?#d2[eMV6@
:IX7S-T1IN(@E^-,YF.GOILMZ0a<SR+3NWM7V:\,UAHe,\1DQ=C?(-34d<B)Hb_f
)-GP@9bAF8c\Sc(ff^+G(W4fgIZe=FAFVTN&1PO[DVYZ_?@1K-7gD56.>33])?_f
,+>65S640VI[N))FVCJ=/;b@@O9D1FAe?8>d4@BcSabA-QU0H4U1cf0PA)RD&^P4
=B2,6>T\VU##7\K2MQH3>?Z^<49EL?8Q[EU#:F08Ke,V[FIZ\)8L2D\dbF-Q_>V@
QUW&DF>52cN+V5F<[9K^;c)5\(N>]ZX&.)#R@(UI<5WNER)N)0\#LQU1^;2I(BV5
f6BD)F_[0JKe@BB(=[=c>])G/-,CeR,LLKS?#Q/7&<D.[bf/TfF-JY?S]H@+Y[NA
(DCQEBC19;X+H&EXWBfC52ZX#S,IH\)S\<T.?18HYA];?PMNa]R:)+D]\CCbBFYS
A;VFB@B,^T1f&=cdd]6\PQ&CRWe]&WEb\efRNd_@A@J1B_I95?>NbO50A+ZfJDV8
EeGe4EHSSSSc>FT@IJ8G()785,aIg=901&QL6(Ua<bb]2[a&Q@2NYT_D1ER[S)aa
6.7;HNQ/2PXB7L1J>US&YB&WV7.d:BTP&ReEB.;D0&M/48\f9#E,&9fVIJc_M;VY
Y)?Ob5?<\4S7UU7@/LWT&a6QMaC?#AE9f>CcR7IBbgBDGSdN<SOReC3H#ZT4VN\g
3QCf,AN)^]O(2=-86:4gD+ff5[R[)(>g2+7acL11WQ4M<C,<P9C,@&ea5V8>.[:D
]G=6.L1eE,G4@H8V\844SSbA+.4KK?5dcBTU4.ZN\a_5ADZd-DYDB0#I4EN,VAeb
Kaf0.\VDSP5@.3KALZ]Y[)203Y)[<CN3#@65N_)&I&cO4L4Y8T1dd+1QEH/,b]Z]
Q)]dGe\SPb-6VZHYP.EX8A2L^Nce#A_R+g&B2J,I2:1AGFCc5R#8>fRBe27^0[dW
_6=0=GF<I=5O64f(613:+YE=LS&9:N[R5\665U8@)1SB,JgS-H^W:J9gMFXdC-@b
MO6@/[K&N4\@]>IL>?_93)eC-U/<:C2OR5MdW3@/2N=-WMQ&ZH0#T46Ef(\S<Z,a
4KXZS14E1[&OUaS6Y8[+>2TV<MEcDb^<bW55[aU4;BHT4f\R8\^H.JSHa])).-ZH
OODN=ceUb)&6@]I986D_WMfTMKU=GPUKFH[a:L/NFSVL9+WSA^>;G6_0O7We1Xb)
&Y@(9/6@9#J^ePE.bX@O+4K9EVf=YA&;61d_-O#OFXTO0W0H^P=]cH+]R,8@^9^6
OgJ>^03/EHg1Ge2+cT@3Y4_aZ3Tb?PYS>KT.54;5)KYCQ+8QYB?NGgIgJPTZcg:S
E1AH#\M)CeT(5MbCb1T<2.e]QHWb)1=PKXcYAX#8[2D<1)<^HFKLFD&aX0#>]Y_6
,?)YWESCdVRL(3]V5ecd3]aP+=Z(8[I;,B]^J;_977#Z685/DVPMX0Ig7G8M[Oa8
#-;]OQ,)3\c/@,6LdA&b:(cc<@f_/)WW=,bF;64#-23)SV?cV_<G1M1[,(7=.\XV
Hge4JC/QaK(+]V/B:TOVeR8:XFIbgO2ZVGD<^G(Zg0,EF4GK@T6)K8Rgcc2KBY1+
4ER2<gG?<9WA6OgJg\TBB[X+3@(RUIH^QO4UCcc8G&fMT0S-)3T/P[H(3\ITF@6N
(a5BZ@e3CVQfe[d=MaY.5KC)D+6XfI_CBaF_a/_2)Dg>8<:72dX[CC#gMad;G=]H
Y/ACY^ga\\0VTCXe5S4.>4b6<7R1S\IR#8GcPBZFKEH^U>CL6NW^Ze-H^^-d=>De
43F(@UJ;)g9TJ#d54VeD/P#TU3DSQ:2a7YB]S:;.I#07&QY:Z,cd219#KGU>ZbC?
:&J_/eL=F2O1aXg7+)N&-/OCP+QIB++/&:@6WRK(4;[A[F]cba<cHX-+0\U1dV#0
G44L7@cJfVQ<5D>=J6CH(KMRRQUA1A\^XFX8d/ceL7.-S?EO?GT?fTXSg-[cX=e6
@##ES_0_bD:98\=dKM?#G+fKO?2=UPF<8>>=#a?/eL5-ZW(FWBV6BcJVCI&eRFdW
?4L&634L3baDE(92dfAFUQ=.G.+?M9gF1HeW7T6^2c+5^?8b62X<>V-T@SY/f,Oa
WA3=7Q2L(^L2,W-AUE(B.;c_6\(cQ(DaT0H=9744XL_/30OV<Q95#MDSdc>)J6gL
0IFB[83JE.gKT7F&B3G6cd-5LObMDB)BKc7[QN+8a8FIT^#0Ia>RI&bL):,M^R/=
Y;G7BSV0e25_Ff8g_gB,7WRcG6cg8Y_0QVY-1DC[2.;d+,O&NQ]HUe\a(XKN+&G;
:.8&;TMM_26VgC)5gaJN1#Ud.171c4P=KKUcEeP6DP.?-=W9/_W>W80KP(9eS0CG
MJ#;L[g5d8;JKIB7V/WX)fZ_6_J^_CJ?aYJ_I=Q6=[+069:=FW:>V0:T)2:_8/J8
:fD1EJPS+IcAMS_:>I6L=c=#(3+@0(P73<f^N4@=dU^695N_GIX4@>JcRDLO>.;W
^,4b),^PU.YJgS(GN9MCP,e2e(_@\,P7#YVCbU@27,XWbR\TR3>Zd;I4HbY3IE-V
>g/&4&DZ^@H:NM:Zf:>N9OWLdR8X/.2WD][H2.\<0V#9:W<0#_?<.(=aW/d(/dJ1
<GJMCV=8A6K(0b[;6O#Re;O8<?=:MX5:.b_^V+6dIgTYd->=GYTQQ3>?9[MX1IY2
E,M-JfQacdRI3?..Ng9GW9W\YN:97gU=He7?PCAID))J;#T-:MX9H-TdJ\LUR7VS
6Sb\VY;B8\f2BV/8A)2RUfJ<^&7.8Z+J]bO0IAAWefB53?^ZTb,g)D).L\B>(L59
D_@Lfe2BT6W43E5-AHMF:&;f&DL=#NEQg3\R[[F2MHfT1-UW,.0FgNb-4&Sf5XJf
cA-1=Z]>1#/cGWIeL;f1KMFC1,>W-(b(c[Pd?)Y\?X.0d:Og@^Cd>Aa_TQS0R@@c
PfSY17VK7Q,ZC?M<_SP)EDa<9NTX.^9P)90K[9?@AZ\+:__1[[1K4\-51>QeIPU,
CC9Ja.IKZB53^:6?2,13:DVH)W/Z=ZV?>+KQGb,P9LHG0&([&Q#d51<,N+Ve),=D
gcf^S\=U]=5)eBcCX/\FACYYZ)cSOHXHC(F[_//UN8:ac75D:2Y3a95+JB4>I#f<
LeZ81RPL&a8]9C&ScgH]FR@C]P\b4ANYIe(369c04Kb=cXR8/:=FK;-\7R=&d?H@
ZX[?gYacWI]\Ba[K-^^NEg^:]Hf^U<#M5_N/O@@:;Sg1C4\-_C&57B15@UJZ>1W:
E&S=1ceDG6XQ,CV6^I8T1NCYUND1(G(KAA#[JU4Mb]HgeD&=QNL)8->Fa&TW-V\#
=2:\MIPdV0_-R8D93eJ=A=#AHO9G33;ZOBa@]I^1fLR2A_08,U0E-#:X/,O4Q/<<
&EV&\DB;.-NU8:4<W/96=efWI,IZ?;51?@0LI,(?E3,a#K@4X5\aGW99NB&&GBXK
(D.#METG&.\_&Ud\YbcP7\HU@JX_&1^OIDJZd\VaO5,8NI<+/3]SK1[7TM8(@;2c
[EZG.H#)XdJD1:UQ8AWD\(5@+#HGYR9<\DRF6AVOPZYbPCV,AM6/9D5\d9NgG>6-
(.f/V4:/JZUWC+-a=GN:=]\XL<g=//3OA5/:#??Z3-+5H9\<KC=(,DP5X[)Gd=5V
gdA;RB@J?aC5_78cEF9/b+_JKbVRJg5:?5^_&=-X.QI(:P2^JCdc+J,&+V+:ZO#X
>I[0B4NCbKQT-TI1>Q5,YI\PG:V4XKPaL@&LRM6Q/;DOZ)SN2#=;/&Y\B-TXc)/B
ZgSNJXR98I?dCI(bT^)7_K=#d44+N3PI20,c#5S#L0D)7T)PGDP66[/ZRWXG01/8
bXOdJ8PeR&F&4<=fKG&->Q@EFgBbdN+;@M;V@DE79[.gV/B+)/c.#?#&FBYY&f3=
@O:ge7-)RdM^6?C,6;dKE?:NH([SNfO=&L-2ID^AL<]c0&[RN>#S4bf?238QBcA;
P]D8LYR[edeG7>2MB3GGX2M6dT2/>2cd)PgMSJJ/F46TN_+.EP28\_PW?K8S3cDe
R;#70]1ACNd3TX0:SQ,RDMC4S4]-RbTDFI4a,VeCVD2NCe/77KZ]Db0F:5V)RY]9
a6\HX[eRN[BXEHaQ7R@P&XACbRA;TYV_55<,3R@B<(BBa(C7ZHB>DP4KW;+Hb)W:
EHUHe\\LW5baS@J7,-V^Oa-G4^FgD)eK_K?;FXE(OL&G:Lb/e0L2S#8?@S&fO^I7
,Z&;aQMc)7ZA(gPfZAU8)?df+1HY+<2I<9AWB.;>cWIH-bNf#M&>:\>T3#bVD]_R
S<.8]7HP=9H5>ST[\F_AS-.1;GI6M?gA@OI=5JWJcWeE>81eIOfM:#IAJBd&.Q2Z
[577fD&O,BSCeD\[e\+C++aR#BAL:3V3#-+b0V7GNQOD@dVQ#g[aRR=)J0?fdY/?
Oe5G>)JQ2KET5:ZW(0)QEeSX&6:W>JL5g&bW5+N6M-<X+AeNdC-dSU\g_4]E.)^a
+&W3gBJ5L8)deVG6@TI5b>1:86L[:.\V.GNDMSJ:J<6XgIEbT@W@<A,,eV4F5#+W
+E=P+#EN8_C_WP[X&(P<L9?/[-Qd5A88b+AR/->ZL.4<AMN?D9&>ME>RH775bA4T
#1AMGF#LTC_;TZFa,[)U:35[OZ@2TN0NG9M;PW^G@N(H=WeaX5[4/>>BGK)0X.Ra
Gf\2IbabEPDKIL48DY,[@ZFLP6O\[gUJL_DDM\KbP6TRc+&K9(FRA&eVG>:]K8g/
NKLfC:87aCW.X)F<[E.B^.X46:bZ69T#7TH[9gAg]??7/U0NB>F\1<#CAeWVZTBH
X1)SQ[_Q(XMg[Lg.?P^PVNRL4Z0dAc50&U-4W<.(^gJQ-30_aR5RYO@9#?G<S,cG
H=>]_U43A;K#H_1YZH7,Z#;#J?HY6M26IL@O)fM:3D:[W8R7/f?Ne.4I;J^9g>Z+
W?T-^&Q>T<T(g9/8Y7P#=?L7+=1,E<)_Nb0N8#fPe^S?JJY\V5&QR8f.>bS)C,X1
OZ3<7.gNBeO6E1N:Qb^W[fd.<)/[ZOa@ZeDDF4g>_#6g\Wc[_;L8SF8MOQ3I]_-X
;QWN63.egG@OS,M\95&]d7:FWIbQdBHNW\YVMUH^GeC3/#AUW_e2/[ef7.?)6=/H
PL;B)fff_G.3ePcca8Z>BF&,OdZ>_FOLSSW?EH6XaO(]RKFa-VKD=D9Y-WL6:MB;
e:L>?V:cTg-g_.):e^FgJd=S[K@-gNC[^4X:<dB)fSFL7:,C:71TTN)T3RV&IRR0
HOg.BZ[7Rg?YeJ2b].De.)Z+9@ZJA_[QN^@8e1SA323g346HX0QM5fD,4W&+L)9D
(G=O3<L(;P&[bQEIbK<g1W];8Ce/C>4]UH7@5g9Lc+\R)P)[1Cf]W<C+,bb26Ra@
D&OE)MG32b=F_8M8J@<->H6(\#[c0[H31O)MSIGZ.:228O56=aKM6/(TY+?gN3-N
4La(]8.=[6:2aK/H:L<H.Z?DBI-W5&N[?2YJ(;NB^Le8PP[LN;SJGbD:,10fH5Vc
>d2@@L-R[Ad=b@=SNCC63Fg4/S<=>aUV:1^.c/PY[-R.IDW3MKI>NSZSa<+IM_J(
;6cbO+1W1)f@#5?=6fg;@\B1a-B+/0S_5#=-@>4LCVLg,FC6B=P]&Df-d@Ac[H.F
)\5LG.N,CWdJTDB6ILFEKGR.[P[?;MBNB^GE5c(C@/8U=[;@(OI,V5T&JHQSbNR]
A^L9UeX;_ZKM8IeIMF&GJ)GXaY;+D/F@W5IN+Sd[E>CAWf3;4\8TBUSSGFQ6/EVf
+:fcX]E=cQ4/K?XMBWI6WTXF4I70a0GL<f=NU]IX5])6_?c@0Ib8=#&4KUMbM5J_
LPU16dXQ;&3,RCXRSBP730\)KUYRT+)KA2:]#TE3B(Y+6L]5F,R?.U(gJ/4EQWZ]
CPQO:.D<N+[&\?1M7,)=GSB]][==LLP+^Bb15IZaDaV1Z[]UDK+\+&;ZMXgbcVA9
We.K?E_=Q):9@(cKae4-gQ=:U)]C417&c@KOM]I0KP8Bf/;PMQU+PCf?bV3Q\VME
HR?P9B],Y;LgL>1\_K>5_2EYR,<6^=ZG4MRDG)^e,<Ie_^XGXPPYW>aF9XBdDOH:
VFY6Y+/(/F>TYHX1LZa[RXOG3AB0MAR-<KUcX;=K4CC^3HQ@242K(YT)4=+YXL--
0Va#9+acdSS5WVfPX/K:b9FggVLG8JCUUW41QX-WgFW./RV-H\Q9GR#;H,?]##4J
cSLQPWH3@3AU@/R5eaNY#dd@D^/XD@cIe7?Ee+]4g\M635D@<\dKS@fNaDRc^Z>I
G+@:Z6H_dHM^&/ONMagd78):-d#6ff,Ed+Od_f\BB0[bDIbE\OE5H2bRGKMQT;+?
JA/+-cT[>F92;./#+715fNRd8Y\PV771J/\.;1QLH,RIQf;MZ9V^6C8,3]Sf3NAQ
E^#(T=E1fLHf7PN6H9;@52K_;^UGfV(6B\T@05:?]Z+eSP@)QM-4Vd4L#XA5CV;a
98.\eULGOcX]7W2gE4OC>PZM9CWb6Y@dUc)7142:31TNcbW0WNH^JK9+/FM]eC1V
D>RabIDf,U<9-T#aO)X&KZHVAJ8d;Lc249+Y#2\42gEJd4b[T:-Oe6;0SMY[MP(8
G9SQ3]R.Q5PV35?F_Me==HNf1L8Af<]dg;HE/<HES6P@6:ET^[]4\f]48([O.?(@
P09S#^e6#X29MBCZ[H9dcS<<I;[=7^4U3HNPF8FK;F&2;7#RR(@:](,Ab2/>.=AF
f0fD6@a?]T56G^IXc>\a[/,c]A,I5/9YcX7D>0GI^#L]9S8HS#d[OJIM+>3M=XC@
(W>2,Sa&WRJH.//bdT.L5;OaY[6)6Y0OIPF[2N8T<Z;>5I(<#XUJ-=AESDB+]:d3
-GGg100,E5a?3F[S9de@3:>UFbC0Q;D.bJH^U[RX?VPb4Me]8G(+C&&g_1KP(408
<>eHW61+IP)V^)I[V#Q4fR6,YQU(7J5W:B.XVe@UZ[XB;1d/b+6:A7#YA\@IXOR]
=>Q<;Q4_H@fEDO-B85NKe>T9GP#5e)_6OR3,_Bf&PE27]^fF<Hagd<XLd=MHC#_@
Ja@H&;<LET@ITSb8H7RF^M<-<#ddSe6-+G(GJIKLJ(3B0(:.E4e@e<K2&3_)Q[2a
QF:GJTE7V5=/ZX6[&T\H=A?\D=64W(@VH/^4dXTS58Q&0]MBdQQD;fg;?T2ZGJb]
TMGKMD>)8P?6/;>/@7&3f&.g;RK8:](2=E1_e,@31aD^DIN84VP,1<3_36E5KU:f
RP[IS)P:Q?4Z0N&7Y.)X)T]ROZcIQNE6]8&MK[WG=PQTL3-A9g>K9C?7>9@YU[;;
#TDP9;E@W4\aOgdA()4#1PPP8T(>O[S)FK[_0&\;3c:UTda)6a.FcX0L:OP]KeK2
W?X\?YDBO:)(QN/9>Bc@R(OI];L4.8=)S]-#[4L,EBHDJ]P(KeM0UO:40)?:48Jd
N9[Q]7V\P\+gK@#W>egV,d\bRM5<a+V\-X3P#<P1,GcWDO;ANVHP;WYRCC?4/;WT
(c4\<bVD];^_0b378gZ@J>cIV6dWES(f5]@=N?>O1Na:HU39OOUSGc6Y<:g5EIBf
b2^[4/<4R<e7ZVIe\9SQMbePD@,(#86ffdTQ2<_4\XUTc^]HK-@T2BU,8;1^QI-3
?@.^0X(TYMT6U-(G=aYM1P/-We8)c+?c08D6:#L@_[A[9OP0,K7bTLO4b,UK=(MY
M_U48W)J290>(,[WZcJ7eDFc\WBHYWAcaIJ1dYUL/^Y\/gV0a6N#.V(0AEe2CSRZ
O)#.M9KcZU7Lf,;9afJ,V7B&.-EP25eG,gTKe#,L<^AF\JJ>)\;13UW2L\:f&/cE
##7^,@E68[M3RQ\-?O(&](^AZ^=)TL_V,K0,fB1<LYM\gXR4(ANg-e<W>TWK^9<U
H3D[;>4S#]7]BD6HFV,cd6:,gH>NXS\:.7d\&]2f5PW?<?O#]X)M.PgG[<3T(T8a
I@F\<XKJ6O5<,4DYNAeb=CO^;]U5UT>(,]-2-K.AgP<F)V_>X:8(;-74b3EW<OC7
DQcJVIECN)R@B][[fVO#GabBNH36OW_:g26^?;JVWY1_1R</DI.N6#X?e38b>KAC
be4MS1M\RD0fJ+ZBAB+S?+IA9SQb16^VE]OVM\>6;31IV3GcOe3Q/&1_=R-G@DeB
d=?+^0/153fLPI?X2I(MIG8-,/6-Z+6X-O4Gd3F#PJd8N(gg)N^P,JIN;[J-GXU@
Ug#R8>E6TM3-:\bcE/G3WJ_>BM/^TGI&Qd[=D+6[B(@\-bZc@_#LLRQHS;I//bBd
cJ>TOa-&^bfe6;8>SY-O@@+WB.E>D#/2L\S]SRO)(7c+-K:@BU0Sg1J7<ZF5M\[/
?,Y7b]VX37e=DCED2@P&L5eN#=FI3UMPMC-L,.C3Qb,&aVV_A=:K@0fL4C7H/WR,
<9)6P?g[EaGPG:#)IX=K,];F>\/VAgV:Z>f?MN)T;ZEKXe0(Ad^ICb8_HTN@;66d
?YT9^<6FLf89D8LZV:]a,NBBU]JK&,Q,1=F0Q:NBB<Pc0V#7MD[N+/5(KC81PT7U
OT))BM;5a3NIG#.E:CK5gRQZO9DA@91X)OL.[57aYN?346V]C0=LJ](eDb[gS7(e
;/Pb0Y>>.@=d5@XVQVFK8&.S9JK(ZAWA5^[_6H2OYZWc-gDS1XJFT^(P<<S2T)60
T7PTN+960&[,4\.R[;)K_W@Tbd(45_0&<JZ0d;1_])@+7PXXP0SD0-\-Z#aRd6=7
\O_(HF#-^/8[A^48:@4d61_SK>;?ZQZ#GYe=6eg,;(:5PLd8=QbXN?(F(;c@),<L
C[1<EeX,4-Rf]d?BI<(D3M@X/R9/-N/EYC.X_OO&&.FS[0aUedT0<)\;XLEINETU
4N+P.]Xa]S6GK.>U;[+?T#R@U,NQb5\MO.^2>&OOLg^(E=]adR;NFE[8:gEL9Lcf
WWD^cJ>)5N(P[^NL5+bQ?b8dd(5453/X^.KR^K&L;+^aHM.^a@[1[R@BeH[Gbf19
-aD@FL/56B<RQ[N.?EG.UB=ORX--&^+^Y\G?56NST94W1Q(TV\IABa6K?\@0J;Kf
&Y+-d6;UCQc;F?])6dJ=VEILICC_^,]=5;CVU&J^P>+9bUdfV]AVIVNLA]_#E&NC
P^gf;eKVGH\/JaWJ?Z60d]JHg.OS64>UNc-)0-18^dFA6BMTO)JVGS;BX&Hb[W;&
>-4=R3]c,:5#UE(#O#_L+f#=4I:89HOYUF1(591>N1TXbECAJ7HZI+(C:VNF=E49
.C&@.W@/P>bZAcJQX.g#RZJB19/d+4=KNd#.G=BW&HNH>4\[U1C7[97Rd+.E6R/8
3_Ca6EFc8_JbJR3+E6#8f/S:bCHF6gR>DA:^9][8Tcf4/b#TOa/eASWEMG^,_J/Q
9;:.=bSG[0UdQFG<&E,(P+48e=M75709bI9dEJZYRFLFO7Zd&<+MAS4Y=MC.2:e=
?IBR0WfRd6J[gG5:Y^#(>4g\L32F<QF^8P]C&M5DdMEF5X,@@I;8W8NK)Z#-I91;
VUVL@Vf0#Ug<&<U\2Z13aF0DdL=H-:-0LBQf\.g7#K05Tg@_M[OFK.8DcE3<&9M^
)_DN1f>H>]fYN^R;_RFc1fG&Z,]1=aFC-^84d)7SE]:(<bG>_M#;0ZJ[XMF3LN>/
I6YE;P&MUKY\GSdZC^AdeSI/g/E[@#JcUVV8FUTVSf>,GQR@L.&)@[ZTP]=Z]K2c
Ge4G>;&?aKYR4JW49Bb3.00K)-f4:_DWQX2XcZU1=H)BaNMg_W,?ZTKbI-4?15C0
R2/X/b-AH=@-=1#^8\c_R2)J.>1\Tg2G<cd]O;I4c)+WAQ5&c^^IAKE4H^;C,d[_
<<W#.X+dLef]H.->fH&X<^?&7]PI\d4@Y^b68&>=WaEM:&:2(d\(FJD@bf/EJF[.
^^Y.F7;X#>B9<\SdcT_&93ADPRI-RU=-\_A<K9ILH,P+Of+(dPc]0#5-H9_>Nf>X
g4SdB?4V6X-XaGggee2X.[(8HZf:d\__NfTK2Y)Q?.Q7PVF8YG6]TPO@Ve:Dc[EW
R25cFJV[/M2Z4RF,(FfKRU=ZfQ7W]g\D3@QEc?MF]7Ge03)]SAVb(dW3:SRg0>Z_
MaTHG.6MMdd^4Td<)I[CS<(AZ5a[VJNeDb.TG2K;@C95=)VP=E:7MG)2ZgMQ.:RP
eV)\F/)CPJKf\O[\SJ;X2A+c+c<;\BIP0[)ec6#QSf==W)b&B85bMAA\B7TT4N@-
UGI3SW75V_B05.=O[F2PSd4>-C7[;)9C4De_X@OG-YU1-(XScB2?NKYFR>CZ@]+b
=g2<Lc=ZG)[+K/P8,SSC/9e^L3I=J42GYa6]5@L/:#>?(cI>XVP9K8[BXcXMe,eA
MEHVC.0&[_B(+QM6XTGOZb9+N^B.8JH:R:+FH)NeC,&+B.=(60Pb1R3#G+JB\40^
:I4=HSYI3#@e>(/XJ_3BO#e;3EZ#W#X]89Y+:8THN272>dL[-=d.;WVWdK@D6,(6
GPVUEFSSJ/P8T-EHW\d36)?],V=aLDZHa^,:U)Y[/K6b(EC+V0Aef8agLK<9geZE
>HD72,2]Ta]/KBFKQe)dKJ)(cW^O0W\MO/W.;LDK&#&2\P(IE,T/;Z=P\>TSM)K_
D7I?8/V0M/I1>=^I22&b0V2L-+C_R6BJ34#4:?.\A@1b@BR@K+N^^;M4Z<1XX\OJ
T2@=&(eE3Xa9(6;c&8NJR<]O_Dc=gE+aaAfIa0IJ#<7O\6.C<@U97=(Za7MWC9dV
@b8TV^Q^D2<L_+c1SMCcUX6//Z^2W57IFE]ZQ3BM?09SEd,.1c[V+#(T:/;5[84Z
,@dBC^#34B5BRG<AOVSa6H,#>.)FP5(,[T8[>Aa>I[A,=/ge62)HKW=]_R(;4-6R
DDTIZZOCD4)bHI\,3NK,bCFA[\9;1G00I;7CC@[7C.CX2^)=XU?dgSFYEYU>0#b)
LI:dB<FT\CYFL+.=b&fW+J,=R@_<,N181gRC,:RUCP2PSYF4IAfS[],G]2TPQR,/
[>0GIL(ca.bgZGN25L3C&g5ABOB\0+@XE)_69]U+<;5E\7c_d_EB51e0P=VbDNWV
cBb?SXZ);8K>^)E:<\IREeAg)D4]D:Y;bfOCA8M\@1]#(+1++@WN1=X/a6HE@FML
Q[fA<H9F9F)/V5EX9\,QD?6e#^5X19fBNE27?[USZ]A&Q_42@CF&JU@_N=Z5\\SV
]JC-bD;=[ZcG3824-EdM[;I;_f51P511f()UWf8.L].NaW2ZF4dZ1NY.6gQ0BU&7
b:Td>HN=7X3CM.?J?\,-IJQJ4F#0dK0E^9/IQdU];DOS=MA00S6=3+62ZL]([;LD
_Hb1[N4B[58f:B81;JI_?[3--a?a;-Z6ZTJd&V/Cc]3#JI/6=HY^^U8,dEVe^fWM
0ga1XBKIeefeSg]Z<La:PGKTU=Y^1<+BU]^1,QI1757JUXTD^EIIfCH-)^d1E:^5
H@cOeB7[G..8RR?^L.8\-0GH=B^.)#1Q+?&(1@-dF/W:AecNfMJ(V4N2dUC1X4\W
PZ&;=1CNYJ?C<LB6FGRUQ,RD^Gd1T[f\8-Gg,;N2&8@XVU.(d/HM#I6[_JV&aG&8
_3SWU?^a^55/6AGfB,ag3b\A[9JZ@T)bHLcP=+H2=N/K=WK^]BM,8U;L>,?\^AI?
#JaISZ+/eaTZ[9SIYa66ZdVE7@[P_;2_(g/gEeHJ9VWNV1Sa]c0CTfG0JK)?D+>=
47[c(4\(:2\a>TP2CZ5bQLZAbY@M;f]NZg]_e(;@Z9,DM&7<^X?6?M?Ob?;>AB3V
eV1+[BY2?;K]R4_:MQ<Oge,:IMaHQBZSbHBWW:SfccXV+KQYc^-5-9(]T4N#e&Y0
4NQDEP_IfgdB]N5/[(J@Na9)cP3fQI>,_=R;bFISg2<9Q^:UOKJ7<OU4(a]Mb:H)
U/L0UFEZTT>/>;^RE2UWW]_7IWd-&EF1g_N/B.UgI8b9@]fN_I@85DU(-M3_)gZF
f&5:MB,W3^]5W21-UP49BCBLZ4Fcf5-SX\/eIg>g=I;d9K<K;A8SHSbO=8CRGK&\
X.DfR;eJd3Ne<H-dO9@D#4D+O?RT9E/;S/23d#a21:dI1D5YY+cH/e(GS/=KW,S0
DNA-FMg0MMcS,RaT>#S^2U[eLN1aH[?^=S3V^:036]\8cJQ.B?CbPUJdF]daR)^/
fFMCQO&68.@J0=L?d0(TO2>LH5(B4A0]bcOT/-6&9H@,e1G,R#Z,N97HEM-VL<QI
K2ZF7NO-Z<)fEf+/0PeE#?OQb666;T&Ea@_T^O.&:<H]SHDVeNV-AL#-^G,;a)0H
0V;YLBIV_B1Ke+=UR#S8ICN)Se;5_[/=S3=KBEL-20F2_OI[:X);M>\.2d[cE?M)
,HAM2fQUH^]AgfS@3D_^;bX+a\;:/;;/Z=SZ8,5<b:Yd.(HZ4[19B5BLIEY(<UQP
@E9H;O+GTH9KOVI=(SI&W<f=<L#DfG+0I45\ZUD,,>Cg-V+-_c/Lbd;Z;DgNQ>]I
N#4:4_9Wf?G<6dOe\&8bJ=I)b;UTIgdUI9JaYEfUI?R47<U03J045:c;291G918;
2KE[5EgePH5)7F@@WWR,?@1O):VA,(#e0[+IP2F+2McH]Q:N:8fgfBW7#IggDWP+
+:G8K8;M)[KAe[S^LF95L->JKCI-O1\Ee[M]?\>+M&HWNQ,f[=<GYDUL9T4=dHO_
O3?NUKaeG/A836g;SJ1,VI5G_\+T)G9B3d+Baf=,AIXXcf23\aDLP]^N7Uc\N=8R
[aV[eeQGK+aXROdKXF0<OQ\RUG/+=V+W/IHNJ+MdbS5Ig-XY+8WW#G+2bfS\8O=g
K1^(;B13PY[-39Q(d(f>AD+3EdI@AecZG[:dK7NCUS3NIF,9d9PH,[cB<0#-:W^c
O:Y4/P<DMLUHY[].G[Q7?:(-b@cFL][&A^3ebJFN=>M0L^4ScE=&W(aT[\2d1QUR
=6bU,I?cDX;@Sd<;@6K\WP5;TP0DY4g<AbV842@)1)^JH4@EFCfc_GS8D77Z4H)]
#Z+J-,9\Y>TVIC3gc<U7/X22DDa]Q>b)7S(\&9YJN42TC+W+4Gc[XRg+M0_L?KSC
X-MDM<_]TEEK6b<>;+/&4fg&TG+8UOe^Z])>g/c;&F[GZ6e33<<55)9&(3)EIAU8
//U@OX5I1Wd,U9Q=7S7]J=]S<?c9]N:g02PbR/1+]YGTF:KJb./3JgcZXS_JUW18
fA&Xd);^S&;CZC]fC^:IdS)J<C]FGTQ-;S;>S0#79)8G>\Z8K]b2Q;KON28::DW_
WSbQN+]G\+fB4\<3;^Zb-I)#.G_D<.fZU@KCH=B2Se]E3<-VfD]?=RMHBEF0AD9Q
?.g)_64V,(5A9N0Z?<b_QYBbbOWe=I)I2@fCe9Dg#::^2UMUSX95Kf3NU\MLZE6G
?J:Q-V/T-=H8XVQ4G)Fb3@Q#II=b60N)0]0_OZH&17M=SV^\&?H&WTZ=.U<_-&.+
gW[XH2:.W@RZVP0Zf<_J5<A?O,6E_1[9+3XJ=\3P_2BSVS2=@]:fVNS_.6ZaVW+#
@FAQP:5eFQ)e(L5T@5S+OC?edU6//Q_\b0P8,HA2RVVPB@2[:[P:TOEECC)#Y;PU
4,1H-14&_V,b56[ZBI;b+DSA]3?JY\N\gbA)P^Q7,74)4JB@KLH<5<.IVR5+4]LY
@Sa45@cd1T0<edf+;C;8-fKOIWF_91,ACNL(HT33>=\:HZZS^Gafaf=ZVR\I=KDY
=XcM&<-3dV_Z;SAg)L3Z[Q>MFf)IF&GCI;(<gf7L;9KcTI_&78XVKU90af9,[fL>
V4/\Y\EFGbd?Z/cC1KXCT^]&Wgf(OVGa5e3(;_[:eVB@E,<3)7DFBOU8W;)>.Ka;
>ZBY/.?U0SZDQN>3DQ(:CZaBZ?A\a@HC:@HN1Z9+bY-7Q#F\_9;[6DaeKR]C=fOH
Y:3T,#P;NAR+-dc^e@#LNg[591[D#FaGE@7;)E+K_ObHEXa?>5699Z.\[+0VY5P#
b@9)&@<19PDY/\Q0,?]8&f,R+Q&Z7L96?E<U7NRN-=HXJ\a>.ADTegZ=g/DXD(88
3E&JAKVHNC=9^#A6#fKE?6Yf5&G5Z;7cRS=(+XC2H.V-J6Le40d)3B,+=_\V&GX&
6^_7UWUJ:,Q<c^LJ6S:R,,??a-0Ac(\b+7d7Sgb)+eBb0U)SG\XDIUe_eDNBb3T?
0MB7gP?7e3Z4&b]Q;37?=^N(V+K2bU;-X5+B:>VIMG1Q;NfU[KZAdL1;E\.c[aPN
2BbJLHF;?,,&3?b92B#849(MAMBA+:^/@[_CQcY\376\Yb:g>6fB>[4@XIPe@K-M
VL45]5/G6#/Z@4UP=a1CQ_D>8Q8f09RJ00O[G6=e^FBU8bL9C/;X#\Z;<C>07[Tc
KG\4U.(4_3,6B9XL]L]BYSPc<ZM-8Bc<XXN;P[M81gE\G98_#;Y(WMU)Ra8R#\TV
)[]dK00(VGcFH1gc50_bQ<_ILOQJ8g,&gK&MK8WAM@;H4&?c&#/P[ffR<-NMPHLA
_GgU0eG\SeN/g?EdI[MDIBb3>MG@S4CcL)C7M]HVEY,>RD,V8P0?2eU>>:N,=S\7
J3OD8UJEd=65Y9^daP3#cSR^[&Q_#?f;IJWX3TXdTKIedI\NZfJ4@L.S;dc);I]a
>9PG8LXN4FJ(#d.acP\5A<+/D[;PA&(LI3I@F37HJZ.1aVJANI@B3g)[;J93CR](
I@7UGTV^eQ6])U?P7G6H:cJ7;Fg@GBd9=;4&.,R.P.2eO)c?2bdP+:&.1Y.I8(OB
<-5XC\2OI^gEQ,=RGLBGME8CMHO9C2ed::)46I]b3JJ/fba01SMZRc^de7NJ\ZNU
OL]C[AeP:M&1W/(TKSdV4TK,M+=dR;Ad>T\@VK:XRf=eGcWc^V0W8QA]@WBfgB#E
OA89K5V_0>YHCWAXgY(SM/>PFd=#Q,&9_Gf6WGbIQ6H(W0RDOAM6])8Wd63N:G2#
9#N&c6<:S\gNOdT(V(D@N3WDJ;D+4c8K^8UA/O:M4FW+(\+Q5;1<I[;E7ED7R[)4
(0_F7:;Xg-V9=\Xa1]W-9ggABa6Z)^VX^??Ib\.\WCO&P#DQQ_UgdX=)[bV4CL6#
\)1g-L6J:c]IQD_6g,6=SAV:5J8f+Y:CGW(_.EY6:fKY[=:]/9N_=<eCB=8QUF1C
d;/UK5&4LEe=ULDWQH(fZd;A0?(D67HA8/O?L,<[,3JSELb=dS:X7X87d63L.:VE
b3N>a/+KF<Z7A60R(f\agJATRe-]@9Y5(5Q_/OS<F)6HITPTc)24^OZTRK^=V)^6
TKTeeB93-]_b-5PK):KCXC1+;H7V[f(F3&),efQQ=?RLSg<g+HS.Q35gg7QPcFD#
,5NKZEd?G8=a1IHV4g\:CP?W3SS:=_83-#Y[a3MaDT0aE^60];/^\>,.1R9BG[(J
f2C8A7<e6Rb5cS(8_DSe+?OeUNeKVX7ICI2)J,2LCR^7QAS2L5b35#C[N5;JY\O/
KRIcEYfeDL<Y_1>0c#ROO3K/P-BW&,H_Z0<EP)K4AUQeJB7L\Db1YKXQG2g@\=Z@
J[A;e6@f^I_28]W](S@H;P\/;7?&=7A#QVb;HZ01S[bND&R2#OMKA3.SBgd])bN0
1WcV^VZ+EZb^6V<\UM-PU4=,T/EAN@ERO?]b]TW6ae0eB#/,1F__F_Q+/Qe1[;:<
&JR-JXebc9>,Rd#g,/R/SgP5E9ULU^>Y=57VKHL<=2\_1XRZ51<3F]-R5]4JE2/4
4M=H_FbYTg<EGPU-.8\QdJFgb>.BDD3@@80,_JYJWCM)++,5+cURCC+g@<Z8K9YY
F1VG64VYfC4<RU=6[g<YR-&[4#.NR;69+<)69^0F:_KWO>\0Af<,&F9B4b9=NP)<
^6[b(EWe]@Ue#\^M)dQ3#U<R;6Q3D>X80?;CV\S^5.S;f8^#=.<&]E=QF[NB#O_@
gG5Vf)K\VJQebYRa+.?eE6<<Sa7SN[8Ac3DMQ84D]MU@:<e^Y1<&Q7M_<5(/Dg/F
dD?34e8Sef&;#WLHO]2^;_c]9[aJ1JV.-_]U[X\5Y=/?3&cFcA6+N(V.ZD[JRF)H
?+[Z7OAM@cV5dgR>F5=)f]4RP;R0BNSJWV0OdZJUG]6=#=()Yd=5<g#OK;\;,0=V
&V\_g+1)>Ag]eLRG<dUSJXX=?NF//#].b5RZE.EgZ&R)P3CB6a3IbH3/ML[O/@R\
IGUU)HDZWR7#N7>UD]e(UA.A_-^?LB,AV:2)eF0\)dgZZ6[fU_V#?SO7GXgbE=,d
:g@K]0^X=>2Md5^BA_?bO4M/HZ-6M7U6+F\VYZYR>\U-1;V)DX4_I)W+SA4.GfY^
/M3P+V3^=D<G5-IO=NJ(O(5C950@[NBa>4gdMD.WI.1]Q8#DIgMKg<b(F9^f+IED
g4EU3_8ZQ7a.0Y5ORa)F&K\Ac794UD7HY;;-&?;>SdZ:H1g]LIN0^:FJ_d9b9,1-
\&1IO8ESKAJOPE]X9JdHG;#SL(@(+\=E:DYP@@,_M3K_LOLdFG@,4E+U6.HA\=-?
]a^D?=[b&MI1D[P?XTPI_MSN)cKPZ<M<2\:gc(Q6QIEb,.HcIg0f1UQAcdg]O7GL
H8fJ8W-Q=[H8?X;<HYWCL>GA+[e;;#:[1.=A4[#AE#BB2Z5WZ?_M_\=:;H62,+=G
+VV:PADV:AC]6dC:WN[_5O(5OMJ<()eYOXaVeYQ=Ya?MT^,:LQc.GS&T5CH>UccS
gNFL.D(IAE@]I,UD^0ddUW+Of0Hc+cEc<NEV<\N:XP87,M^2@bGd>5B+T]1aa<Jc
A^;J<S4:dR><W\0.QXRIa5(d+#F)SAY]?;;BD9V0G.2[)?MfKHLJ6cMf75ZfgB6O
22/d1#@Q/Sf@R#,4?g470b-[#ZLbM<\c_H.4b#,dg0,cG[G:5@5[>Zf><a=6Y1;C
JCA8E_bW\f/;L.108>LFIAT8.L@6#:44)4]\-J]?+(G2ED1=27I?[IOSNG41;g^c
OX90TJQM;ebESCXeaHGM&A0CU^c,@(M)@CH.5@BS9V^X.=D=8N4bB49L<C8g..C4
2<#HdC0-WF:M_f&@23IMB>A:S?5[UE+c-5G?M@2,G@6>;V-(>Z>Y7eUK?LS=#0b;
_B86FAUM:b8CZU/HIPTI[QcAEb(/7aF/d,3_ZXPgBQJYH)Q,>&2WM8b4ZK>e\f<<
@ZeEg-6?;0NdG\+Fed_8#Da_gIIeUfGYg=aYR[G+?F/&3L-_JRXROBHd>QcONbY&
\Tf(L,0RX-L\PH0NYU,^g+fK(1W4TMJQPKOVaCeJ<dAK4fBg]>9OaaQFC-E5T[U\
B@+UFZeA_Z&4(IDZAd9T<ZaE?eGUdY.Of+:0UWDS=-W0QBaP3=,0<?@=[=IJ-b,5
Q8R(HT\H5YQQcFf^0_N8#TG4ZcB;H?0_RYZU+<SR#X>W-);8E?P2f@__;dSE&VB,
^?N>S#J]Z<<&[KIFLFB3b+ADeA8Da716c+3L1\2L7G.J(g2J2J&a8NG:gD&]NVD[
LYYQ05=<>f181d:a4(#W89<RU8PKHC3W;55V+H(^acOAH-]0[H;=3<8g6HKfK@-d
(.J\<6=.[Fg)?ZHf1V2]\QN(Y9Z6KA:A<\0[c;L)f0DdB)3[FKbZFF(:V6Yge/>8
YX?C?]TYg.fb-OM[<J6C_B;GWJ)Y-YFW6T^,>W(AO,YcWPTc[c__XCd^g^>:WWdG
Ta&Z=c4=T4F>WSXFaEg_RG[(WEJ50,:S-,68-GH9B._J+:I:Pa2OK0V-[1B>L2HY
OK2BF8:>+g_N_JCRA3,R:g;fBJZ;N#bBO5\dA^9ba#Jca<A\.V=:70MAG@/,,M3(
&8S0;U6\\W:DZ?9ee8&IVB>:+I75e6L<:US:JWB7S.X<2JPFd,<FEYRQ>?S9.a]9
NQVRP[_^\,Qg[H\ZVYRBDLO[XAS]fSI,6/I=V)K9COV)5a/AN)Xc@XC3M72M5G)b
/TTOS-UTLYPaLA//^GYY<=P&Z#Z)\NLLELVFQNf?:-[OaN<6\N#<.SdCc<F+GT#5
2gN@_BOYM;/S85[?-_Q.8<S-9DY<<OE^F2E-XU9PRIW[-=>ASG9_NH]c)4c@<\,/
P__1D/&SNE[U5Bcb-I-]W6#HYUX6_0=O+_\0b/Za23GUH.fR/697[C&UW=cX1eBe
Q>[8:@gb(^/^4g(>&?51e06/6H-SdSJTCFdIO\O\CdgSb0Y)Z_I4L#GNK;OY90;7
-Y8P&=Q0dA??HE]CX,QN1=9Yg)H5dS^HY9,2Ob<XdB[@A#-b_7+1)c#b383a#QbN
U9_M\D00?LG3F-e#I)43CDGJ(^RVNeBQ<GSddfY;.1P:A3]K4YDR=.e4F9V,.H.,
cbcER>WZQ:K^g>N+-N[(Y]b)GC?Q1/DXDUVR:_B[@@)aS\6C^K+0OMGTAfA?<d,1
Ia#,K+?P&[L6&#)1C-G@IB,5K9c2=QM>AGd2G&WZFa2bL<[&&3c0=N0_RZ6AWBKM
0M=EL@,\399S)&4)7&)PY):HV\9MV/XEHHK=#Pb<O2>U7aF9..@dKZ=Zb/KB#Lc]
R@N[T:d6gURH]UQAYIfIMP<a&9VF<5g&48P_C0B^=)U-NIOHP)UdGbM#gU0WC4=:
-Q@4CKV/Yb\1IBV+&P1]YX3>M):]T_&);+JIXU#\1PZ3I8_3:-U6<]CeJ@@&:NC/
LGY-ULO^c:9+R>7D9;(B4aec&<F)B,]RL]^.)AK^<a.FG\4La)fZ.^[E0K]?WEIO
C]<J9EQ))VME#dW(#H61SJB6-#]LI[d;ZO>f>Vg#\.1H?<Mg4K+R1&f1A45;XCfe
WKK<<X46\V=YA4R9))Q,_IFcd3Y4F1NG@)1K;.B;Ne=fU>BZN+#=f1IQD+<]J/.1
6I6UJd:20@e(_I4HJ:=Y.?e]HCQ25B8--T(5eC1JWTEI.75@@R[(PSB,)c)d61=2
8e\+EdZL_,)&^W,2#I/S)D2U6afa13+LF;NJYFXZEcT:Y3WE[P3[I<Sa9NY=;E,e
B:YgW23KQJ#5:4PT[B-fbX:fM6-^^J0H7-5=:5D8db5R?8g(\I=C/7\8eLf?gLZ#
QEZJd,5JY;39Y[5[:a<@6YScfY.J?D3(P9,MY16E:e_A2_Y69@bb8>K1K3&&7cC=
42E<7FPaV.QJ>7LQ</,,VZ.>ALa2Z.b1^30[W?<V5/(8LP:B/3=-M(=d[EgGEG+J
=F@+ZVO^Mg(F&.>B?)e<9.S[4FS)cEY8Wfg>\^1CKP5&dO3VEHD<D<@M2EB#(7-3
7?KQ]WR^1G\[BUCfQ[Z/\5?LaGN^M[P9OK>J.+VfVE^cH#A/aHF4R]#TgOcE)@b?
HK8JAYXAcMfe4VeR5UP?_e-&B897?bL;;O=O0f<02.fABUX=#B:)B2/JODc3J6)5
2#aXM<@4-6=gDaLF-.Q)FDU<b2Q1a5\C]C@>=O60V[b[2Y+3d1(g#2SFU7d__5?&
F][\4ac=+QOH2E6f7EePJ7V09]6C^WFVg][VJ3MM4gD<76Wg-fb7=77Ga[3<]#4-
1HX,AeBJ<G>XCJBbDO-5(MNe67<(^.BUY2R?Q>(D9ZRXRT&&AC:8XJU3R4MADMM3
N)[)M;XdaP=4FaOO)&G-VAIC#T<DSg,;&/CJD/ME8&2L[HTPeJdJ.HV2]);Ef3gN
:[7I)M//CMdY7gObVgL[^#&0\]C\R_;0(GF-Y-Z>:SPN(MXe,:M\#AUAS]YK9/&/
RS/eL&,1J_0A.bBf>6D7K:7I65VbBGEc@WVF&BgQV<#,X@?ScX>eVLIM/7SBZZIG
01ga3fOB)+&>5M_bAV+)6?Nc75I89.ZRN;4U?Z^6J_&;c7:/?fYK@Y/=@C)f2XZS
c?1\>CDXg@7Lb25NC?\bN[2XB[cT7Ff7-e:-bQS#[8G9U5a,335P#bfC8W0>5bEe
CWYP[A26LU;C\@NONK3-7\Jg97U-7]LIPBJf)PG@AB-+&911bAEW5GEJb2,.U4Lg
2;Sg#=ASJAZ@3:IGG)U+XC^+dF)&>bF63>B-f?]:-8K55ZJ3d+2KZ68#+XC8FDcO
4=MUQJa8_@,RNU+,Q,HZZ3^Y/GL:5=[PS_fUIDfF9VgST>\_g8A/Yf.C-b>+8P.#
/O43W9OB3TKC031-UN+F<b2FC&Y>/f,]:d\S8M>4>]1]8^)V\K85RYWg-/0<,ZdP
I/PQQ<--JM0[XVE[LL^?Ea<g0I@J13OW#,&bFaUAYe3&.AW?bgO3;bFMI6_b=:AZ
_Wcf]bEXR3;^GSec]Y;P)^/^d&WBe1_?e?e,N24]YgZ+L?YCR+[2&ba0ad>V[O]I
#5W&;@AH?PWgE=5/)dFD1a2OaDJ)CTZVH14ZMbY@?#GdVHF=0.)b/L>2:8ANBF]]
<9&@O?EcUdc#X6Q)_:6B7fNA4<g>H=E)93->RF/[8D.b/>W=,U5A+W6_[AAUSO96
A7T2TZ.K&M0=J6#S;F)GEWcV7Je3GH_3QXVD=NAMFO.-O]RbZ#b:;2CgbA;[g8IZ
C+K6V1#]63<fM2)IPQNF].#GFg@KdBL28\[O2e]06,7OCHS2[4WE)d.e[5IV)/XE
)UG1D=(DL#NG>Md&[&-P>XC[X;,+]c(1G>4#95R:Z16fC[Tfa&EgKQ[/1-21cbb/
OYdA^<(6gf/,YZ7Oe)X^X_8IR6XMc-=-4<3M.bf3S284+HFIE2UH5]/MZ<51[R<_
D+>S]N;YGL[dXJd:2</_3)RT(N^_](Df)30-2-51fC3WR^N8ZQ_PSaH,2E.95MXR
@16b;I@WT[FCVJ15P@EMVaJLYBRTWY83TML^7;@TNX<B=8gV?I9(agYBcT0b#_/F
VL(JD<WY:0;KT3L9C\g#14gaRag<D.HBE4:CA80+_ASZ@3/3f>]LLRY0egI?1FH8
)ZZb7/b[J3]A)<#SOc<Z\(#DL&MX[&4\fNO(IYBgfea@E<JDYX[APf=WTeWT\CF8
K-]\7KZ#V@LH9AaK?)D.7[YOG:Y3d8aP[M9B4M,a^M2)NN.1J)\cJ53)G8R4F#1Q
1T7NBI>K+=M8Je\S)2<<bIT1CS1P#F:^-ZO-]M#\E4+VTg4bPDKILb?XSV(R\;Y]
BUK//O)NMF92#;?6RYe:EQ75N_\HQOP0H:Jc(/^d@WQT)E+Xc(G@\=U@e:]1Gca&
BE72X]C_?-5NL[:YXIH8-N1B/B:18\0B@81?PPNN2^Q:IQOcS^WH:KH:JHKP4W[S
gbSVeIEJL[ecG-]VX4ZZDg]?A\4VL<NHV4=@1Kg#^FITFPFVV[1P:2Laf=@>gZ[I
U0N9OY_-Q##b6cCM6C9E7]T)E2eNW;eGF9,MC?8W6Hd/M4:Q-DCIaN9WH-7/@agT
S>N#)JSU+HcObF@25AZ_#&21XBQ1Jd=,D>TF8K\[)e]d&.d/g/O.3O;&<D4I(M>,
Gg7fH1-<;=4g5D<Hf;_cXdS:?f.?WT]<87D;BUYG=L_8UQ=[:(VQ7,W+A45.5G82
.\,4Eg13fNc&6RbLg?eTT7Y+)Z23<I[ggWVe)L?=)DAUE?<gLGX?dcgEK;YTL&eB
Z+0R(aDDTSQQ<4c3@=?HOZ#B(+(WA7XY8]4F:Va5dbB,Y7W6)IICN-@/Z&TVA6:c
(768+F8C_0-DbU:]MGZTg1O\4;I7(D[f;(KHNG^JWS,7<e&B5#^BH6:ePL2^BF?4
U&+Z+A<I\0>CER7C;\@F-T\+-#-_UU>^(:1DYDL/,PM.Y9P6>b@\=2NM,\0EMF(&
Q8g05._/fb&,)?1Q;bg@]<:DCc#L?7(gGT?;-b14CJO;7)dM<EM7=@)eH]9.0+Y+
<LY6_C[:86&,2.)N73<TIV^J(TWFc]7N9T+TY6G4VAZ3SP8(X]12#P\)0[>6-1EK
4JZeg.0\8B<dK3)S1Y98_@aW#I^;75A&RT92WG>b](T/(ca#I&SEa;P1bgLZD,aS
._@\a;S_>1TG/\:30:RZ(BHGC@Y+65fT,368=2Z4J[&-+cRBSN^D5c05TBKg.8ZQ
gT3FWc-WYd-0cd2^2dQgZNHBg0X/>cA^=S0QFFX_SJBO#8G\RF647^R&W0Z(YLbB
3,MIYRR3WYL@\[/,4D__BHWLZ1A5eT4bY+1d5-.g4QP1RK]d/AF9_bfd[f8a]8CB
H>aca+45K[>AVaDW->eLM1RaJ\4;;TZKYCYKY1=S9Z1,NKLYZVZG4^TD_OR4T6Ig
e(O6bB?O0LH(YX;ZMG&G6/I(3AaN)7/5e07DRU)WE-Y6XR/-VgDWe+&5/4HFaMbV
J/W/&4,[g:IE_.HIe;TUBa<[-=Fge>C:<V/cgSeD53;2IXK7XX7+I,[=)#1DbPC?
?WdI0EHES)N(&Y\:>3(fBUK1OOIZR[JMLC@9-Z]ZY8A(/39JeY&GT4W:H@#R.#<\
AW_],IaJ\1X#Z2[c^+_V3H<9d/ffaM275K6(a<1cC](Q98RR<]J5918BMF(@9AG0
J4D;8dTI@O4bF#4<2fOG7EMf3.)]>5U;Ye,R?3N-fB0.E:eV8@/=N0_aa#V\,)F9
<0(W(<61U;)A2G.628T[GYdEIO6,TT8,eYB]-L,G\)E7BSbNA79VGZ?eV?><?0CD
a<GTZYfL_;@A(?.1[+YG&Q7R;20O#\7F_LD^;K(9D==R.-2@YYb=RGSMRBW5cQCS
b>RXH632d:JYgZb5AK7)\J,:;S0K3+]<MBW4Ya^3,P?2CYb46&.N.9,,6FB,ecFN
)Ka[=++LPEAO)<1SEe<8S[64+@DbfHZd;D[_d[Y#g5(C+?Y<UB7[U_/g(2Z/FKa1
0E>;G5>38c^)OA1=dRf#.L:?S#RYCg@TYK]aSQR?[e06?9c5UM2\9[?a/+;.68B]
eTVf;b)MZF/cK0WS7<UbWYVb8\9+V3>T/.f14cNe_=gBR#45N<N69)8bF3,Y/YeG
3))Y5.@f84@;UD8K1N1+^/E5QQ4(Db1de-Bb#08F2a8\Z9cPAfRV8T[8+bL:/eR(
XE.BVZ8?(.d9##bWc@B:_A036Yc2X/,_<\,HVC\:Af.HEG+?baS@D>HIQ-CYX]_W
0TB@B&+85e57N831\RN;>;Dg]B@SB:@&+Z-)6?FF<GD/Ge_>VC[[MR?O<:<6CNF?
+7^Sf0R[FVDdZ,V\1^F_a,bPP+01Rf94LSNa2L/bd>)<HZ7LRL_7L9P33>CZ/,>C
E<?0[J?#BZfGgW73.dHF,[)43I9L8H8A/9CS)/fEQ[-D\7X6:C2M&F,]V>Ga9a15
7B3LVJBJ_YgB\DGMP5H6W\\NQ9O#_FAXLG6BD_S28<4(&8?5?<CF)#]44BX+b_Ad
R#\72(/\UOYb[_<_##ggG_D,1/-A^^c]AY,MTMG/1[[[aPcfZgR?[Y#ETG:PQ9,_
A9cd?TP;_#PQDTDMPQ]/MFAAdcIdO\1;#)NfL99#Pc<X7]WbVScS84IOFKbMK0O5
SP9EKJ7QVNP+5@aJ)[(DH:O\d:EE(DaTMgG7?Q?8(M6Ub3/F7;,Hf6CVX8R[(Ug)
00BUdOW)Yb2fX7>5[;GXWB[AN:=a/N]e12V\(]9.(YggG9<?]H:Be-?PY](a#V1A
R7]_HOR#QJ]A;6gJS>##b?<b2A8G8a#I+(:_.YSR6(ZGE;,MYT1XbP;b2K)46QF\
fQC#F<N5NAV)U[,3\-f3>D]IRGZ=+b#N)6d.6]5DG#a^4B^U<.K0f6+[^02K,9MM
-[UCPGg?9g29LC_@5dF#?.)[eLR9)X^E@2C,LPc>];<I3JO_0g]C>@+W;.FfHJBf
,+0H:RP84LcaJZRI,?T7WYVb)[]OeZOIaHCEB/A?(0/S>&.EDLa&(R<:]0<Y]II_
3YDTWgS:3,\TLDV)5YDE@)W?VQCEX21UM?T+2CN>B3PQ)bZVWLZK1bZP;/+c0>M/
(SA1.62TEFK>5Z<VdNEIVI.J,9<1OO/55TADK.4T]A)M]aE8H1O.D5JZ.&#^#LQ6
\NV065U89fNQ1VN+EN_4-\2\)UI)ZYZ<,E@CE#QG0KbAaV7LfcAKJ0EL,1T6/BRJ
Q@@1T6QG5S:3O/GTKCQN5S+D0K-;3C6[G?VS91;C<(8^NJ&X:<4L\ZQI3AR^>VMX
05U?(:Aa,Z-dgS01.N/8ARKT.TE5TfJ0fdY(+JQ)7@X.RMZ;=82dES_D\-=SD#SK
XQ2/)4#C-\57C?#+(D/NH2Q&Z[UB6?#S@K^g<9C:XSce@2H:gT2.UZeR-MVW289W
)T+;D]UI6g=\7K3Ad+2F>eT.<5LEPQ88#Hf1.[2__#G-V7d_1PE#CQTB?2<AbK^L
[TH7\=Z7EKGG-5d_I;?(2;VQS81FCI77FABK>e@gDc:27dN[&-\,/0B^OH_=X[O,
@F+@A[e3IdgG+$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_JESD251_XSPI_DDR_AC_CONFIGURATION_SV
