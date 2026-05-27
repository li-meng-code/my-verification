
`ifndef GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;
// =============================================================================
/**
 * This is the AC Characteristics Timing Check Class for xSPI Flash based 
 * Adesto s26kl_s26ks device family in sdr mode.
 */
class svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration extends svt_configuration;

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

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */
  real tCSHI_ns = initial_time;

  /** Chip Select setup to next CK rising edge */ 
  real tCSS_ns = initial_time;

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

  /** POR extension clock period */
  real tPOR_CK_ns = initial_time;

  /** Power-up reset time */
  real tVCS_ns = initial_time;

  /** DM Setup time. */
  real tDS_ns = initial_time;

  /** DM Hold time. */
  real tDH_ns = initial_time;

  /** Maximum CE# Low pulse width */ 
  real tCSM_max_ns[];

  /** Read-Write Recovery Time. */
  real tRWR_ns = initial_time;

  /** Refresh Time. */
  real tRFH_ns = initial_time;

  /** Refresh Time. */
  real tACC_ns = initial_time;

  /** Hybrid Sleep (HS) cycle time in microsec. */
  real tHSIN_us = initial_time;

  /** CS# pulse width to Exit HS Time. */
  real tCSHS_ns = initial_time;

  /** CS# exit hybrid sleep to standby wakeup time. */
  real tEXTHS_us = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s26kl_s26ks_xSPI_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
6,Zb0.G<a[:HaY\#5VU6H3O9J3b]&U.;(Vcc=/fY6\PUKA9LGZ<G-)f.R_T[1-^B
<E]cR5bFVK<Y(-:U#LZ+e_,@KU&PW4-<L3EMUC66JBV(SG>ALL8+J/G^4MXVQHSb
@1d+CRP]3,@1.6eLL^.X=H^1_],#eLVD;BaOgYLPV8^GK7P(Q]:RDAH6dYV\;[MD
)K88STLaM)IJNMQ/9A&RgB6YISCRU0HJHTGDV:<44bZ,f)Q4fT^J7YSG078F+(&1
0?d:fUU^LcW44Rb#C<7^LZ0U^G)=[Fe#PVb>9I^e^3BbdAZI,VY/1e[FX=76..+e
P=d^TS2Q>Z^#OWLR3ADTO\W07dA+,1=<c)/E14b3<)@MbJWE#NeW8F;BB\[FaAB0
O_[a53UWaKJOK7DD3#8/R05B[AC=K.+(LW;\/6_Z&UP0O@#\d,(@/Wg7MO_Sd.)8
0JS3(&^bIT@Q2/2N\_SeR@FbVg)>9C/fHVY30TGAQRd6)4U>D_FJDCDfT-]gJK\1
^4b>=FEAOJAD/&1^UG5@U->/J]5]O=RRRg0+BDHgDfV_S#;B5;#aSdG4N/?be5M7
I2\F=.aW-6UgP/-2^:#?P<-LJB^c-(/T?S?/4VV(,1,_SaK/:QVONL3QbXb.ec3H
VaMd&Z3:9YO-JQ.(A@eT:;O]T.H+,Ja0:<[\:gDE8.Z9A+dI?>G@R5If;WeL1YE2
;+8T_Cb=WUCT0MS[1J;;f5>c450^PP-+C>#0@TX?#eQ2/>XO_c5f(CRcQ(XWR;;d
P5/DCU047[^fe>APQ8ca:HScfSfA)+GQNb1E(=&LK1VT^.5]EH-UE63(XUT9V(/W
5K9:J(H&J[)0&J#C:+7f&fSc1$
`endprotected


//vcs_vip_protect
`protected
ESMB,3Db]d7<W@J:R0=7).C6O[bCA.aA,4Y-6f]c&@ZJX1<.Y(a7/(1M=Q8cd#==
fc_2I&+6RUGQ=LZ&M]LK+GF@Wd.^g;2&_Vc1<gVV:-LI_L/_0gCJb=bOYX6FH<PX
TQA_(&e\5A&HGIdG5/V6(?dP<Hb,O9DWf3SG3PT#LCeAON#V5Qdc+T.eJcN[]=KW
ISIX?.e43dG9G),8YSWYHCA<Q@/IT1X[)Wd4PRe6.K72Q[]IRBJb06EWcDRS0;S4
V1PG2P>d(,WP?eBWPQ(7LRTX>bAR_EQ#Lf,4^QW\PPLTNKR2eA(F0bc@)5JGZ0>(
#eA+K:eT[9X:MM5A@:O<Qcf2)M3T@0JF6HO<D)U++7=8A)/;.E[FV5=<e;:K6R0e
E&7>DVNV4\([^\T;X/MPcK_;B5QGgf4d4M?V1cMKREU-;gKE2;:/F&_-UaXY<URY
7IX=7@KbV?bCVNHf+,C[8cKNf83g,HN+2\)GN86B<_+@c-BKW,(O(6]N&\U2CW/f
OM\G5XZPbK--CcSW]1.\#ED+C?B9N.VNS>D2W98QE5/10/CKM1bGZ#0,-0b:[N7^
M(IDP[8VCCE]>eg>eb\0_f.68X9T<74g^-3Wc6+WXgdHBdN5DIQ[abV2&cTSY<S#
[U?fAO4e+fdBPB5NW_D=W/+NI;(,&K5[Q>_;E/=M59T(J?6[OQ&2^HcEgPT>UF#T
[XX96>?T4eFbH(RcN:b.Oc3Ha,de+=\1,0:K>VR#]CV0T8.?CLH5#2D#Q^_S4e;:
2?H;I]=3;f>D;d\PgegOeR--4/A/OOS.->:H-6KGA.F)\)&BAc2;.f,3T8R;+=43
A8#_f8.>BeQbeEag_a#(@41H&@)1>FG.V])VUA[Ed)39-FT.bKA[G:2YOa;1Y+-9
+K]A>fS=@ZaD=94PF>.=NfC0V_Ce9KD1^8]/a@\8COReQ>Z]>ZZE]a:GQLCQRd4W
U5]WJI&@#,#<>.58?&+7?R+\C+Z;[B<-UY+48_\4YC]3RO(8cO^-R73_J035R5NI
4R;8Q/U@HHG7S]e5EGL7H<U3^T2[bC@H@8_eU?V5(]<)&SJW@fZT#MJ./9E:ZJKQ
^IM]:[dF0-R1gX4WMgf<NeXWS=fLV&cD>J+N_F::M,Td[>G&X,KZ;X[:E,CD_#[L
/3g6M/5>V]QK\3aCDT15)LXb1UON#D+N9?.C[9UG1[)4X+bN#1]fXVEf#.WgGI,c
83N&Y#MSW-I88>+YCADBIT)07I_X3U#FMg<D4XaZ#9-Tg#0:-9;/\IZc&NE;OLA)
3_]\6a[;.<+[09/?Nd7ZTU3W=gKQZI3QFLFO9Q^KcKD(c.7=@cg>>P.HR^>;bFVJ
P)@)IYJdM9S,-_3V^EO#e0^]1G(MH5b.SWIM]PX)aL+Q)aR(d=Ec(^a0Y(SV(/3.
V)6RTf[Na3VfK&#[WbBN9QH+A)]c?#0A(T>;K/-Bc7C29CPENN_JT>B\?0?FE\(T
-B@Xd064:fO--:5Lb8XVQTSX#;EeQY&B)8IBbdCc[2/O#1X.<M(JQ,Ue:#9S61gM
b]#+O7g5EWDO(XS^E3A#6cH<;3FT5YfXfULRdd.H]d)JdXbaC<;)(5>a<gA=+5^G
]0V+4C_H70>-.a>_,<#/=0E=L#&\//-32LMDNI1#L^#J8Qg<UUeLZ8C,#RSD[Xd_
Cg5eeSaU8.?ZUg-F1S0,9OEH5d]f:RF:MB2.fMP(B]K2Kg3,#3PgAEFE-gE3Ta/S
1D20VOb:FTR/[0=VW34f58f<)[<76RM+eCMR2+NKcB+I#,:)]A4ee\/]^5?(5aB=
g2&be=]fd.RaIL.>XD<HJ;ULcSQ?GM&K2^SCS)KQK8a#[8egO0,86K][a5?49>Zb
4NQ(b+?0M0S3TAN+=W8-N;]4,b?.dE1e\Ee#],+Ja7+.E(6:M?9fQ#[BdR.LC__@
Ia-OU7\NAV?d8APSQAJ?EKL./3B=;4/\b&5^&J[0&I734e;N9F_Z-)/P&+b@]6Dc
f?.AM/J8&4/GS^?_F:daA:EW<G6=gG(7eC_/WcXILO79GHB,)HN=8>,??YIFVFL2
7Z<gSQ(Q>fC3C[f8=ILYfT6e&6@a;Bb3CT8>AMZS)9Q.UgM_H3UC[)0=:39PVS?&
Cf;-fS>gJOcJHdEb.aY^C,2M0,J]B\?Z8HB/C@f^8N[cET87g>.aA4KFP-SLY4B&
NZ^<B3gC1=1SD0J10)8U[)A+SP&2RRW2d<0E^1S:H5&]JLLOBX-e4.C;_7RV,<cg
S&;>J--9?/M5fDf-XBWA18GP0CPB)CB]BaE^\@J6DG9)#G;GT<\7HB6;9IaP<#5B
F>[L+GQPde7:K>+X3GN9W>1\BMWWRG+/7TZT?UOKJ2G+#?AFgOJCON/UKDYK()b(
XX\MVMZ<B0AXH+^)HY>J3-K#G7a&32D)(UVT7,<VW?de5]3Yc,G1_0-/H6[O&bIW
V/Zaf-g6C&6,]#/X:D&DfT\a?[NW]</d52./a((]MXcT1?=K8c)4;&4WY9X.S5<1
dW.ZHGCd?](,KcAe#R&7UWT=)=@gKU3PDWKUg-54K-=f8[^0b36NaN+T>F?H\<e\
7&KNUgZ.NS:?]2XFP?A=K,dR)#+ALHd[3=Ld<9\>cfJO/Gfc,(4+Z39/NC0,c)Tc
G&BH\0O[SR)Z--d0T3_+_Yc2gZ]PUg@[U>9cc28U1@-7-OV<@a:7#W&7_;>#@DY]
6Ef+52F]<O<f]EUIACXXW;;PFKggW46+SQR7/-I63^R,M<H#>4Q2gNfG.?<Q_--\
NF]Gga?G)P?<)D)3PS8fPESLB<,T7K_ZTU6aF]5(OCgCJ3,(MIBXI]Y6;#bHKYe?
.>b#T/>C:OgU7HJC<d?7KMN09]@YKb/YV?T::4XOIGOK9cT,JE64@4Sc=)T9=SRW
]f&K,USd^dZ4aV(L+;P&&3Pe/)&EDM\8&BC2g7Rd(2:gEW@FXI;0LV5E=A(-d4R<
+^:F266SZg1;MN<>#R).VW14>V6XUaePF:&_a8K(JcS>)b:EFQJPGZG.<MRY.O,W
/>=4\X45SNA=OG=;M@TF+7\7Q>TQdAXc#P<P4_3>WHT9d>@QQ6V-gS=Y?6V5HMRE
M+?=17A]/.,7^LQLbFe]c]ZY37NH/]ObZ?H@\X:NW=aV4LTMROQOU,.7SF9VcV,L
>J/=Lf?2:6d9:WR&@/7Sf#g5KIb/>^McI)E^3(<g]5-8TfCFT4O<C=Y(718LVa;^
3LNSPPC=1Zaaa@&ED7fP,fNI4:O4IK^)ALbD@LA;O/J)K,(?FK.(<DP:BNY?F.;L
##PC(=Y,LbS4(&/b#;KD6)J6^K[_=3G&(;/)JZLKD5J^-?Ie:[aN7(Bb]AOT+fQN
9VD)5@55L[;EdUB4T_U2F]SG64H@(U4>Oe6B7QM:.YV.HNQME3&LLUeD+N&QVBB3
OO,K\<\STTN+dJ87;B\86IeAeLF3AB]EP)5CGc9)<RA0]I0B]g1INSdJfU9BURU)
]GDIIS.ZbM^M^CTL&X[Dcac@D.ZAMZ##1O?GILDgO3:/CQ9acX9OH.^T<<8VQGCf
3>DgAHDUTHSOPgVbYg]7@2=]7)111g5[91Y8AYG(7JC8ga1:UZ<_RH@I^GXB];1@
]U7@#[(Z#58dK#6QP^WTPHKC^+)(U\W+GBACFBX4]2PKf.0(eX7,befZ6^]?V/R#
J\Xb+b&=9FXWW(c6=IDKFfH^\&E:^0RX)#F02/AaOR_<WEJG-[]36eDQ:b<XP1MQ
-K[)(BP7ZJZYd31_,cdcgEY,W70S4\EQ#4V+(.gP2IJ(27_H7WO.LYSa=7+1Z76>
UB&?2PYNKd6I=+=[U?A-5DC9G9<>Cf0+WV9\IR(ZHT&cGfY=e8=M+bN1W5D81IG2
SPa&IP+S.fWYd3O>V^VaeZTN0/-R>6+W/EQUG.Z<+>gb:XeSQ+U;GRfEJ1T,7X;)
KX[[YB[SIC)[/Gg.?UL?6P4):>6TUY,34N8PP<4NNX)AH>,D2&OfN).VC1ZP\+QD
_Oc/D8-Ie.aYX,:Se,U#+ZR9-FcNX0S3a8:GIPA;<gd9/de6OgT,M1F6BMQ?N=TI
)#IO9UTVL1Fe)g_1IN7BaR0H9SLON]I&N.1H68B/3@NDK])7D@>F\GM5gf+gf&,,
e(<1b\]bMZ#+0S&)G]g@:C[/.7d7IU_2)1,MILN&V5VV2SCHMba?Je.Fg\S4C=@Y
&>M0H;ILA4HgC0[@-XebO9Q,-\VN4N9^:aK1RQ:1bAA3Z(->dMR_&,GZ((&\4/WD
HT)-^EN]GDcF96^Ge]I_M2HL.P=LPc28M+fLJ&B5?(EfX(MY.=J&,Vc^f7NV7#K1
-:d4CB,HfWeF.0eYFY&.Y0P[b,c[RW9G[7eEfDc4aX4\?1PLO+.O)A7P/\BM&MZT
JVSD,aDR52F5;D3@Z=gfWcS;aU8^6L<Z+X/_;FQ]aF-\16F)#Uf0@O2X_Bgc0WLH
<>YT=4?LXE0>]L+_BRCDb<UG9EH<OB]=_>-8fCe^,[#L+S)Ng;2WWXf8SL4Le#Q(
d7[I7-6IA.)(>Z-^GfLGMQO>aRe\+=:0,fPW0GaVF.A_Z(/H-NMXML+U6NUe\?;A
@cLX(OM@T[?Se6N4>a.+J#6Q9)N;CML=6);60ZK5eCO3eXMH<FPdJZBd;5J_=EbV
HY_TPU>9NQ.41ARY+H&KcdW[+)MBW,cEc2cH=&PBF#^K)5LN;gFc>E>?#<+UW8Q_
7>0fAP+#;a\cQ(fMKLe[cQ]b[4:PdT)HSb<7EAc_=Dg44\=/b:3)6N-cKK7X)Y1a
@I,\[;+H?#WKYY@Wg2-6.GbF7D9BD([WKC,;7D6_NX#Q/CHH-&UTXN=\P:SOfRQ&
X&I-,(&+<.>^Nf.bA-IIV>)6WFX_e5^FUMQ:L@;VI(PPIU,-.-4LKMAOae^1]Q==
X=^33VNgW18_LIC6).=T#-;aWa6a95@YHX@L=<+Q@A8CGe3XUST))9C2b#WE+cQH
07c[R_eA[XeQR<ORFLR@^#JVX9?.>L?EbL[FB)05d-Mc<F:g9+UUNQ^d-(,)/)e-
f84^YY7Ca6:X_4;D,a^4O.cW/:.A\U\5N=_4De6G;IbV6eI[YK_XPI5.62<]c8S&
O5;BW=7?e_JBBgKabdCfcQeCC[3\@ZZ(bGJ,a^EYE8Yf,[T=(8SDfL-3S?cL^&Y#
J83MM+(.D?,I^AFRC<a)8U9QYHVfBb=JJ@6K&9F^E-9UR9DHb=YD5cM1#/e)ZGbC
,^&E.-dNRNJ_(@X&^a)08#V3<#O)J\P<J@/^gEdJP7LcId4VYaI,7OI;WX:S9L;.
R4[[JZL].GeMJAg(X\TBZ?&ROS6ON5ZN4?@cB3ADDMXQCFDF;@X;@&[;PV,=FP,4
gS^ZS=1TbN-#Pfb_UG0TJUZXPN/;4H^:g<=_&G+?a^5^1+V^Y^YAT3g]:>eC[gPW
_e=RaIY,W4<2;?IFN[6I[ACW1R;&1N56>K(9dbU2G(UI5V0T[?JL7a^WZPX-BT;3
D<;SM:c;X-3-&Z>RIM:+#UTY,Vbe4OaQHV9=XP@;IN]?T.^9<<89EA7P,97IYJ)]
F:\+63H:D];&CXNUV?e]AE<f>+EaJY&XC#:5NGa_,U.Tc25MLMEcY#=\9XS0]W3d
W.Z(>JA)L,;>cU\)Nc=KZ];ed6IfIA9I@dE6^0<>TBJJRX(Z+a78_^-D[1D.7#(B
09>QNc9Ad2L]/.fCg-B0RHf=77W<ZSPJg0gKXWO3J+?bPgWa/Ie5N\JBVGUN=KFI
b&8C?<:C@\G]5B,Y4a8^#+a/IP[.Z=D&gM/+.PA<J\1=W5O<8X<f6ZGc_D01N/6V
<YY^(cgfd/[IQVX\aN_g(+&IG^bS/9UXD6362MDddS;dM79)]KU0G?gS/g\beMF.
T)Z2TTU27PQ,EQPQX&g.E5cJC6=.<<P=+S[]3;1+^YP9F=KgZ.,/EBB82V_K?#5K
bT+[HKC/?Za5Q5aaL#RaU0d-M3YOOM:DNLNe_BNI=A\EHA<Vcg9QL8GO]RVUL#T<
/_RR\O1ES\GU4R1<?.P[SV8a_S,O_3=&>WaZI7=fF(5g^g+7^b&W25K]&.He=31(
PT^+EF5S&9_S@Fa_<7RN@>>(RK<d/FGN\&\(La1#KA78H^&gOGg+_8QMVXE8bTef
<+:,A8Y=SD)@<6QUgSScP3L<fDN(VCb=_-#5J1(d\1CE#W4IDY?G5C=^@74cU&M<
V]\???Mfg[#2QT[7HL6;^)c>R-e_AU-g(7<N7AYP:(5(N+2eV_UW#=4Ab#McFM:^
)ERc@a5/?eff4RE>-:\cT_3T2#2OJUTLFCH&U:<.TC,fBV4R)5[2RdcL6?-A-R<4
g__7^^\D2S[+-XGV,7.;C1A:BB[ZCEF65JBQf9]&0OfC]R3+L[9KT=&43:,:QRXb
M_;Y.#Wc.7)d=0g^3U9g.c(\g/0874FQ2Na\5<WBQ01f3LFH+^HG=JbdP0PW4^@\
9gaGY@3[=M?/bfYZ1CHR0;4PLB[.;VFA8IP^>>D5YXHSWU]/S5[I65Y,YY1M)RY1
8(I,Q>]?d6^#:A:38Q:=]CEZ38Qe@WcAcZRZZG&1^40I,fECGc>R732a=7ZV9H<J
Hb.^H<?e8,@=U68V5B:a3dZ#4V)=Y6<B0T0:6ZfG>E@+H\AJeDXAf9+KH,M,SO5g
+:O6G(89PRHK\,R8045_@4_QPE=Lb^?1OVY&5U4;]V5EYg^N/WT:RH.3L6]-:[)K
@g#JaXH>MFT)387TP,>&D<LdMUBN,_MS.2P#,#3&3d5E\H6N)_Fdc#[Jf2W#BM/L
P;&8UZGKH3.P1[Q<e=.@\GRLGT6K8ZU#2J+bDPGOPdV,63b-7<5#ab8=A/Bcc1+H
DMH)<X-?PU&F;:00AB,PcRSIId]#F98M52_RM;F@BP:KUCSV+INDBQdC:O,&MCY7
Y<NM.X\VeD#=;([@f:TRf;/DNPI5dec0TXN;N/CKA.##+L+fd6d&664906ggL:\Y
>XDJ(OGe=Obc-7R6Y3AV#V#2-[V9,FNc8K@3D)G?d&Z87f>P9?;EbfU[&6X06O[1
d+,F9JYGCC5&MNK[Za^CaJ.EQ@=5)];A6AJ;Q[&N+32=eZd9P+NWU3A97g\O80TP
A9e01Y18D0R;aa&6,U/D_DOKG#,C63)1JNV[D/LC3#W5W1^gbD\c+YZ9DDIR(0ES
J\GTC6?aS(OXMU9aB(HgW@:;d6aV3FX^/X5gDB_+6+^F^#S=6\8N^==(>BC_fXF^
,dO[\:fDB&/f@FJD:1aH[9)Z4ZW@#S.V1(Nc+T1+B27bU\WD6WV5]#AH<&?N5XH8
H4b?4>B?\#]Z#U2XR:UEM=MHDHWL9PQeYQ>X6MDD9),IWbL;C)/.@2O<.P8A,]KB
.C\(UdL.=PK-EDA.gG=HVX(CGf<K\;1/D:-A18M].@;9FG#CX/C4]-;,)dH5.K=#
QPeB?8I<.TbZ73CGG,?N/EXY7DRa./_;b^NA7c^UUf,,G+3Xc<[Qab0F3P7<[W2X
;Za9+Lf?3O=)<HHNUN8L,IAB(d-0)XV^B,/:FNbCK834c]3)SfTgLe;GHINa-BDY
XEN7Xgc;.=,=6dL#Ef86X;:0X-HRfL0D-gS.fBbHHLD5</L#[JUM/2IAXf/Z@.9>
/PT5V(+49Nb9;,40#F1FF(abUe&@effCS(CFdKO.M#T.ReD1dFN(_Y2LMKfXJJVM
ePe=HPY?cc:(]7<&ER]80VPJU?WO.g=AM/M<&GS0:IN:)X3eKL#=LN6))a^3Ua_V
;:O0WZ[,N_03N[Y:eg\c1+S2)SDLN0K<005C2#<K#:;5f5aHX<()Q3d_\<W:.RUF
He,3b?9D\OB(D,:bAN#20)g9#4=,&ZY(2\OHC:GKfG3\H&AHIGN-R-IZ4Hb?I;,H
>;0d>.^KME#;DZC4gP5Z9-g:EC7WdgQ_:Y;)e51?4?AWG;@(&B[SJ-PN>3T4SZYH
@RMId,.gc6>S.a,L<X]82(._?=9bACe=c=XF(2.f]RR4-5dUU5\@Uf5aK?9<:6\7
(#9MZ#S_M0GB+P84UKY#;0>1</)(B2e9U+I/BaDJMDI+X9)P=[a(E>HHHCC@9[E6
ddRL)\AK4D]9(Z41_NW@IBQ>KJKRN@2KgMD4RKTeP&JWC1E7Ce3=-;2[U)J[6RJc
dgWPf(ILdEGMT079bS[NY(fA)4QA<MIgDT[69((HZb2MUcNN@(QX)CObVe=PZYEY
-d/bFCAfM?JQH2X];dJ)CfY<ULOF+>81,AbZVab5/^X2e<K=b:C4.(W[K/O^Z;RK
>Q)+61-a.XY8P5)C+W/Yc6e,RGQZ5H>[g\/aBYF-3])V_+=7QZ+W(04f^FgNGK,;
e64I<]N-Q?=,If]/I?fH=9B:ZRKRc(=D0.J8.B5KW,I61QL+Ag\aKNW&37MGMANO
;8OOP)G)HYK[Z6WV8P,BG;Z:Ne1Q6X[<d^(42aQ8a4X)L&]]RUaVgKKW]GKA,.4?
4+-.A_/NMcDWZ9F)<d_F0F3Qg\AHZ9NdN6,;IOdMW-F+a;I(f?GRF_IJdG,T/O+>
HE+0SNZO0/PfPX5Q34T_H.[58?M3gL&[&cC)J3:g1c=,=GVULX?WbDHM)e[^BFM8
IT4G5D7RB/3K?_HH)>;#gB69gHQ8LgTMS)fJ<ef.\4_-/7<O9IL88@0B/VI=7X[3
7T=_W,S>Q^Hf.(XRbM5OI-X_V6NR51;2CF5_L9.9^-AeZ[ab:.EDSSKdFGd7)3N_
\_YP[4fOHV-M5S--JgZe8.=?bOW]Y:CBFBa\H<X^fG=<_B8OJ<>J]7M0@E:8E/7@
KMNXJZZ\/5a0B-gg.f(Vf0Z)<\L^.9R>9./X(M(:RaKgDTG>Ha8>\HX=g@gHTZ=-
G#Wg:87I)W1f?\dT91M=LUNZ?:TdZ_\@D9[f6[UfTC^D(5Te/X&AD>M_L.7USAJG
->&T/-EF7Za)bQf26OY:<ab6f;XBZF(LA:F9UaP@>,9bC6gFH(XLMU?LT5)WUV>@
daN+&UTLZTCWcecF+2&@E5BD&PJbBAV;Ab2O:KG/3:4P7F)+e>WUA]EgI>)@_(S\
6K#M&RH4P]^3+E3(XKEDLOe0RFQ]:^H,GB,K4D1[PTc./W/DPD]&P1..N#03HC<J
e^>7RO=P8\Ae]9ODdO1gSgC6gSe06_?:LFG4M;6GMa@1XR<LN<QAK769AZWC,&g2
#>-K>CA0WMG18YT,N4BA=[68ZJ,RYY&[46,.WFXG#cTIPP,X_9g3a8+(KHJ#J1=N
)7O9LIF0Q&\\<5[_fI5,=4CEd55X^eM7.3@d&052=,4CU#4,IZXa[-<5O)PUN4X?
.TDU&I.^A;2Ze&cK4&#GJ3D8NgKOU?Y+e6T=#L^aRe./<[4)(dd#?>B-\T@S0Y26
1D&STTAB.?(7Y].:O<DK#@X8bT3>5SG#WGFgRHg&3Z/g.=DB<\,AM/83R:@\+7>H
:O8LE+caAVGK7IB?gYTK(M+?PH-[L^aUD,>UHg#Z_3VD^e;W26#)dHKb=NAGWMcK
>O0^I2]WFHXbM=I[\6N9507LGcDM6]VF?C.5^&gNI2+?4?(/._4PFP:O8S3U/[?/
9LNU&Y=4X02^SB3UIS2_=<@eA[aHSR3a+(R3>1RDO(L/+^207ITaT-SH8L\^@FSP
2=TeSF4IF]7E=dS..W;_0YNV/<X08C9dM?cBc@6]<DJ5F#9_G@R_<C5JQKHK6BN3
BadAJEVX[/+?4[HCb-W[a#3Bb/a=.6XER4P.<EHM4[_[\(fQfOe1e[S(1[3-QM51
aJ)X(E)K913S82@P+A63?H]=OKP(e)86H?^eX=T#0</N5QA&G>M9T1&)5M;/H200
465PQXgW;W\@/QT\0OP1-T085I>5&;06fH&:8E7FI2K>89-YPE#,e04,4V@IZ)3<
RM3f+L+&>SbFP>H,L9UGPV2RT(e?&S7/768G)P[P]5#X+PP999/B?b2\6--GcK7D
CQQC]]JK)(@)/IXTJaAKaX].T]8),;JH.?D]#cQVNI<^5S)Ae:EBR4fg=J/U&WF<
)LgKY4QOY0:F_8H(@T)eVB)G;gL,1>:Q:0,#U^W?F_ea-36,+CgQ&gR]fgg+Xf9I
=7XC]5>N)3Z-DIR/UfH1]=e/0.H&RdQ42P?QQLW2d_MV>+NDaCLF1X3b,(91?)-H
Q\9WKLL3,e)&c)J=+19NAf?X,80DJB\2cH)^2@4HO[,.>fBUQQQg,@2gK]5#N8W5
a,B]0b?gMY+_6.fF1OK;Y9aZG7PHS7FfV>QN[INNf\PO:_I;)d:a32(OSg>4/G>H
\[Ce-a_K2T787::+7QZdHKf2E#].U4[\9cENaa,)5[07XF2N++cEK4D=/C;7PW40
./ebCW3P6_Ud\8e1CEHA8Lb&D6K@;=H-Te,(dGB(3Hg&16P[<ePUHS\5=X#g9-L6
6G;,/76^c(?-&_)EJNae(PB04PQ])I^2QWaF+.6BI<9,1(R^;9<PZ2THb/QZ^.OC
8C/9,121/R2=f/3>LBDLU9]QJa1ZKcd_(fNKZ&:_=2=/[=YQ0QAfM;gLg+FP>1Y.
#8M)-?E?_6VDe(1((f\#M)?AARg4N_?5bV_0YJAJ=T-KOe[/#XEBL^R)-W9SaU_2
H;,V=FU\[CGOS:<AGf+G#6;e,]-g3(H0/GQ<@PHW2_bIIeHM:@JJ1<IT-.KOBC3T
U&(=R\V6NXDQ7PU>R&5.9FL>6MY7&&.6[SgJOP\1fUGAZ);.@<+gZ_1\K&/Q=.82
cOOZ1R/a<9gI>J+-/ND.49O5R6bRK+JEe4--bb\_bd:/9ZgV[1[AbTN#MYaM9dG>
L?5ZOGQR7[:^(]c_NAM^Cf6?9C,]?0[4,b]12Oe9b#-F\Q&M1<d4Y[4Y[SAe+<La
aGB7QTIaUc9eD\7.1QJ)8XZZ,PG)/TZAXG5#Xb_VL9abf7>^WcFJ)(+UNdWaG[>Q
AD6(E-9(aC_^&;5[0L;X#A;W\CdSBdMXIC2J;Y4C+Eb[g0ANdX:SUEG6_3#S_C3W
L><ZXVC[PICSbME6(F,RVUIJ<())^&#M/P>554;W;DXdQ;.f&;6ZFT3=+_O6_YM#
b7&QWc\PK>F(?D3:#fbUS&T[5T+IGbXUN6?OZO(VNVH)RIK?)9Le8PH(UOJbf3XQ
:bX#baYAACU9XBMb5YR(:+&;GFHadfU?D#;ARK8=QcXfV+_7_D(:-?2Oe_/?JR&<
BR^T/X1@FKb<)eVPDXX\bCEM\YU17A\L,\QcUe(;0F:Y4DMa?=Q2M>[:@#NcSPR,
-/N/AR:/eb<_=8#M18.QA57SRUI.D2@UcF\=0&#cNg,0f:,#F&0HDML,&^edc@g(
]MVX-18X)c3VD7)He@D#?XA.0DHH1IGe#(VGaYBQDK]=#_\[JC;f[C?7bG5>OV9W
OSH;G0UM7<dL=eHXWN(eGBKg+fdCDgMYb/MF+FR-K3^a:X.;:8M+#K#V#52\VH-E
YPFX^(3<b],U7(Z[TI2aE=eAGZLV9T_3;28R;BH\;TA0bRW[Qc8\/[105O/6g=<P
3CDRTgaKQG@3TJ8E.\)G+Y)&/&C@JJTS^6>UHb^.H\YA1]C,_:M[4]P>M&Cf6C;9
BgPHMeVZ_LI_10NF#5/R]QSF1]G1;N+\N;4b.ggEJN/7af9M]d3WJ<(J>C9\c4B^
[+W/JVd^J93^-RA?_8Fd8FQW[W?&J2PZ:6Oa/]_TPg\aa[WP9VGX.J\RdFW.#/EW
.bD;&MZ@QPP)=PJBHe^AHPY7-c_._PMVa.)OAa?M8PECLDR?#SO.R3a[91/V7Cb7
L62(a-V.>S=7:QGcc5eVZMHbA3FCcCDA5d-87Ya/_2d/=<2\KWF929UNaTR;&0=a
M(aF6\-WP6=MD7H=K+b0JR>UBTVJA[ZNfBFKLB;d=&8d/Q>Md_[:\fJQ<g<.P]=V
U1,-OI3/T/RUU?N9IKNA.eJa:JS6;@UA(5GD3_FK9M1-^(L?8?IG?-2O9e>eeTX8
)DL3V[HYbTJ-C(aHWY/8bBD,_8YK#1Y0#dYMPYc03@_O#U[U13N]4=\G4b)MA.d?
2aJKCRPHf,+XT#G4+J_e7;127b?If7?H5:[&/^8XSULBX(162B/LCY;P-)<;^L#N
]UKXeU]4ID-5Ld&+Nae/fa[M>39Y(XfU1U;F17E=:.#Eg\):0?e-7R>6f_6A,>Y2
T^)[TbIBC#=O,9=WV-7933#D&C#QL,?RT7YQ7MJX;:F&cTS?4D;#e.AM6H[#/K;(
OC?b7\(:_YE>:3]_@>>6,gYKf5[]Yf6f85eff#cPV@e#(2Jg]a).=+BM(a[8_D\-
@;-K#PJ;@=Xb3U,Z?W1)Z537^JEcd1EI4.Ma,EDJa#V-&g_>ST_,Z<LfeF.=01.#
HI6^NdN)SA-2_d-EQ9^#=+IZ,B2.;T,/[5;<?1g0-F^d_g]MZbAWFgF3(/[@g1VZ
5S;55Z/PBX##)E39)fb<+,fN1DV@<4,>BcD34.Rc[XXHG_0cO&B^D\=1D+XMSK[?
<aT45U,J50C]=]<X3MGfRZP&UGMR;=^+E0<A7/PBTTZMV_M>9AdM>:6Rg-?MQ]F^
Mg_d?7PP8MR,cGWaeJab>cc(fF#WQcXH?HaF(3L#^-e2&Z4_9C:IT@f;?c@_SMNG
M0JICK0BGHZQAN\=8=a]Q:g8Tgf,:,S/.QI7Gf]6K/1\K9](6Q4;adg4_I?TVb?c
_(3J5dE+/:J^3(BcCR6a&YV\WMY+J,-.?ec0Wde(86&]0#UP_@)70S8(PCB_ZB(#
#b<eeKP()2,.#IP.RU=M]K/AVKF.X]b[UE2\;bRa/.4KSg]DORPIS3[2\],@ENO8
Y6BN@2U^XT/QCB@,Vg)&T^EB<;V-&=Q9;IMDT-G_PELd93)JP_Q5:BAH-RdC+aG@
VR._]).;1_\gCLOQL1^Q,f+gV_4DC0_W]P60Z\F8KI1N&\.JaG8,),d,C4?fbWL9
gINTX2T>@2+:UbRG5Y(U>59PYJeeS4RY=Z(+cM6f2.c.KM5)7V4,\I^.f6#bD&g<
;[LG+-/1W\d\f5.G\.TQ@LWEVbSdBE)T7]+1IZ2/,P9=@McS+>:T[_]e7O+?O7?V
/[CA@A@0Y094]\EG(<I;)0MW8c_E:)H\,e1PaTF:F_C^]D-\aV>5MAdZ\DMF>MU1
)ZIg;I,PW/aTD=7A+L=OC(+,<6VGHaEg)>:I<S8<RH]MZALGO#=KYU>ede4[TNY+
G[\6<).Nd?[\QX+5W71[_&PY=^U8EI/XeM2E(CHY.UfK.J9^P1<872/-)/S<P1DO
)H?M(7gc23:^TEe2^(e-\DG8_X4Y3GfHIGa;F##Z=9Y_)Q:HI6M6BeW+)E;@7a3a
^+\[#+g,F,Y)b-H=d\<AIc=Rf06))UR<[g3.QY;KU?LJRW?HRT0Kb9-.J^Y6W/UH
D)Q>MQ[<-IAL_CN:BUX^4>1H#WWVQP_O8?b>T-#2SN@H[-P#,:WZ5?AEJ/9/DUL<
?XI_UR)9(FDV-f9GAJ<AFMDV^:PPL\:XeDLS0e>4Y;.-1[<9dLWCQ?L,+(O2DL<&
SSN)WG.S>QSa23gIgcFR/^X>[6P)\,+#P?S/J38aOB83\=(1&X3LZ_:9Y2DG#K9Y
N<\G@5)dF?E,+Z-0KQ)-(7@gEJ7<cR/F4Ec/cfWU>#E2^2\8RI0]U&\DUGf&#DJ-
=XcZ)XNL&67A/#\F<8&PAdYNWcGP),G=dL9,7&4VDKF))-][3B1+I?XJe4C^Kdc/
a)M5-HB=_CL78eZ^2b7D)Abf=g5+:c=RLO8\f,:JXP:[,V?c5GAc=]bW1JR5FBKH
<]96FYg53PcPFV8HOc\:(D[A+[Sb)2>G-1/1;(Ub5?2,&-7XW67#G:SaRI,J97[C
\=:g/]<P;(g<P-&U>)(g<.VX0W]BcW3[-1W0^C@6)F>,\(f^B85MIOf6)B;[4[0b
^PH6W1Bd1;:3V<ZLcSeb?c.\R2gY9^]?[b4]V[=&I=Ue4Gad#(&O>3/a;/U^Z<Wc
/IEN(]Mf(CGD/M5ALM6,+8EMAJ=C[b1XR):YC3;V-0\AX#;8&Q.#^R.:B>bBYeR[
1c<4^-JTdEeY8JOJd(aL/ZN3UTd9#I;a7WP3D5J4RIBS>1PD^)2K?UAJ\G004.Y[
(DCNYC?<YRUW<.aF]aTeG2GCHG):Ee<L1;/2SSIX0AERbQK/_)P12XEH5XURe:G)
<BKaYHXBR72P6&CB2IT1NJU]Z?X0CGIcH>bM=3g.aLG>Z4_UgfP[7Sg(aTSE3>L(
&;>)K3^B1XS0E:=;OJUJ_gL31e=KO7_:R_6gV,14D]=;YZ,6PZ?M68#M2#Y8BB1B
TT;Q3_e=0(PA(@IfZb?dT-KOX0e[2X(?1dR/;2#)VJIcG6ebN(3a0+W0\FAe@:QS
g3X:0]EZ0g9D7I.GX1\AfVQG+(7@MQ,L:G7d&K#7]4V&0]C4,&CGOM-)@(O_Q6Fc
9HE)8<bHN_)LV0)SI,?6O-N/)PA?N08@R21I.\51QJ-)X?20/P(N:I=F31>E=eN.
1W/T6LT/7^X-HGP0)PK9.7BJF6T+;N4:5C_OV\+KD[<#5#ePf]:Y35V=@)T;UAV(
>4YZ]9@:G1A1c,.0+O^&+26+ZSD^,?:eLQNZR\@#U#3]TcNG[@1\F,:P9=MFNO)H
JHN#[TC=._60.GM+ZL#.8Z^9_43H?K+XR)Nf1TZ@cdSAd;aIUTf]AaQbDFF\IHd?
9[A(NE^<cU\?O1/\=T;GBTdY3ae7]2bAX7\T<eP+G]1PL9/LS26;^aWS^Jc-M,@4
a?\\]V0+,?@DCMCLY/D[(P#OBYJZCF@0_FgG[b;/?+I;CdU(cUb^XKe;,4Q1-F)\
c02QP3LD(:7?Rf\5B[UB8S(IT+.L9bGD][Q4CbJY))bI7?G=cV+)Bg8.WUWNSXNK
>CFc276bLMJT?;;E/DKL2HXO2(F7X.P@[&T0V@]dTSJ8)a,@ED0Ma_e^4V=V>\.G
G<,,OEV_KLgJGW74R&]./5a(@(YZJZ_aYg0-^^9BA_#12aQdV[VEHN,#81J),77E
/F9dB&LR@,\LZ<TZUb41(D#),TYPEH=:?]Z.^dU(2L=ZM.:S-=8&1-]77#EJ1>M0
R7+Q&:A+aZ6a-RXK=[4=NQe/>+b?edV.,RZ?K=3]UUD)424YeHV3Z+;gX:IRP_,;
\2b79V;&8bQBR]Wc-8NKdY&cHC6fO\[_,1N@JQG5?A/VUV0KX?+EC]6,5&SM6KY4
OOR.M-B8<e#Mag8NOfL>>3:8<M?=4V-D>b4TB#Y6eGIF7\[YH1:87DBBaY-e)^W#
0ZXI3@4<0XI\3Igb?T)GDM#Q+0Z=TH9aEVC>,VgX\McJ#aLDPQ?L]43M4C@8AF7V
;6T-VSX2XcD]YI(IKO3)C+ReRa2Ac#@_<]d-_U1Ce#VVP3E_C&6fC5CN+AfJgADF
9U?aSEaVc@dA(+J;2Ib?@=S&fHO<?+H+6TM6Ba3A,1Zf0V8SA[Z&X(/afI]eYDDf
@R2Z7M5<NQIFe<2=eF9GG;aXd3U(KPa7/@FY@#5N01X<Sf;Ya)Pa_N:B:-[,O8gW
3=W/eY7++CJ-[K)TAZD@(^JF@;W?7S&RC\(#=+0R>MZXYfeTIAZUOf>)A>O8\.(J
)c^cJCQ:O)6R7,GK5eQB\K2S6aLb0X9<fa_+U>GA>:IG]Zg]f6MCG0&)M9=,\I[9
E1>=d=P;_bF[;E0\K,99J6&8(BZZdgc:9bOJH^?Cg76>A8KVa-fM]cYU(168)2#U
AN72XD8g:WWWMRG):+Y&-HcQOV1N?@Xa<F2<736=6.3-)/SORXfDCSOJg6G@PfD]
a<>C,TAIe2[Y1FLZ<Vd3N.VII6>(20H3dR[?93]&?Eg,P&X#8+,OS&/V?gKHHWHH
/.KaeVW9FN/,8QZ3\;Kd^&DWH&V)@UgC/^@DHa9XEJT[7d-IAI1GTL7>M(EN_U;?
(b60Zf[_G-aW9MS;P<bD76IO<-1X5/J72dg<)7-=@)E;MD&IPEa(aDT5fHIG&N4L
[\HGQ]\E>WD3=<W:,M:QH3J<R.GFXCS/0.>.Uc+4-f21L+Q;];ABFD3BZFM2QM_W
.XbN./PIH[48XT9HGPX0e^f@a]3DNK,]V>WN,SN&X9>7/8/aTaWf-=:HOO9c5\I;
f&#+;(3RBZ,@-)U:FVc-^Qc\J2],X2HYd-3[5f&APIGMH;G08=-#.d31-AHdU:UB
Z)U.1&CK&KgCC.=[WHDT>ACbA:E748d(+e,M[?TB6.Md;R/O-OR7^PE0UFKIFBAe
Q,])).U[)KCe\>TaWEY;&5a0gE&>VELFSG.>1O7E:?gNe3KOY#df+NE6)6OL>K\V
e5#@1.B3[A1SDWK8X=<-6WNc>NWK=_NAH0Pf^_\P+SEdJ_&(JdfXIPX(N,<)DJ#_
@V:HL8\T;?;=eHH-W(DD4QeF5g<J9/a/aP7QbDCHf5G9JcP;[(30/GJ19S9^-_GA
<bVaf2NO=_>3aA9b?^Jf^b#=Pd4_c7DQC]^3B,@<<MEJ(.AS9.><11^JG_:,[V;L
?Y\>MP]DY>&TcE,LQ\[7AUA0EJ/NXeLWIHZMHHL8P<dFc13cMF_YWCT<A,0P9=Q;
bd#I9(YaN,\.?ZDBTH;(N1O)8A_+If9#DQe=Y,KeS.(Q7#I@:(JJ@[?RMOL<QA]0
ad8M>f>JU3XJ1U2W6CUC=fg]bfZ49O?c0S>1K,a:BfM>dRfc9SgLLLd=^EMPWV93
IW:?KO68[GH.Kd24B>&\(Z&2?L>YV3]Oa@Q^A\XgT<X:;6K9OG>2\&HaEWFVKNP2
-d^/9=V>CHIQ,:U6YcQ(QZa2@d<\>HP:&dG^^Q?:V6AQRG<7/U;V=);4EeY9UO-f
K#]fCc^J=\2]&Q?fUV#<KSDO=G(Y1BR(I<8C163J+J=HJ#e1K=OWVTd\IF,NY7&E
]/?#dXGVA6c<(]3=L)U7a@Oa(678f\3g:4T(:\cN7=f<>RZ4M[a?YaLC3ZbH>DFW
2fOM]6QVDR8)XODY\O)9UdOfILNQT:dKM\)00TXbcV(WJLL[_GP.R7XC(gLR&O4Y
SQXecRIR^gZOSE5\;2>Z,(693RF:YTN-2&EdH7,GD;.4E-UaCV)_F<G:Ia20VQM4
&(bSDJ[-cZ>_RD1-JVX@,[d3QW+6MZa>=YRAWNV3J]F94eSD8GYU0#_fW.XWO6a\
B<7#<50BZ4-Q#;58W)PC84BU,1F/.fS>L7f=#AQ\bYTH3C(MY)>N)[,a?e70G/DJ
N<0#]/+g_Od()84O\eY:I8A.Q\F#+#EfN=FMe,:MKEPR\,N/TAJ3XE?fH#ecCFF:
\EPZF1@IJ=g?Y][-.HTdcQHXL1Q>6gV4Q+1bgR.RQEVIH9b,47:S.gdGV>b/1@B9
F=5^E>a@JL:=DQ^I?=<Jf36>&?b.1K^GSDS/5/0_fVGK7f^]6Q>ZCb20G7,PTZT<
=1)G3M;U\SR3YJQfN1T=@@gXKN>d\J._-V^0Id-YY(3GM.30GP@3S6GT\@8Q=e5(
c,Z;DT7[c]SMSOXRRe,(Y.II732_2.6FMX63RWd/SSfQSQ]dD.O0VF&Z+S71T/,1
^F6P:NZAY\&GW9c/FIL.B<L#FMNE:DK(.2COGN701Z3P4(6b3>EK@04^a(&^5C.U
ELC0S4/=-OVP_NG:-ZD3L4]Y7VJ)>A.2BO9:O<AO4>C=dOc8KJQ+,<9cgW)4Y5MR
_N9IE-X0&3QS5]SOOI&HBA7?d,.M<+B)D3XZY736b>(GI/QD_De\F2_Z[U@0/4E=
YKZJ:S0e;QGab+#TNI3cD5SLC:<@^RZET3LQa=W6X1\>XF4&F[BO1a7F:I.4_(8(
E@IA9^9]A(@b1Y;V4416\;R_)EE;R;UdER=B^Z/O+0YWcB0WAQVJ4(U,fPB(D+ZD
5).)e=XV?.Y8/5?5gV_MK/M^W_+P.U:^DDN_+TX)+^G25ME+#-e.3a.4;?CZDZ:X
cV)0b/cg7&RY(0dKc)=9c0+8T]aOHdIP\5ZE45&@6]gbb=P.T)?D]1S.;0SJ>UU&
&M:?V_]DR8Xa_]]W^g734bDJ8eRf/_;7L#K,\GLX=UAFCLOT>=2aYA-Z=[W:e&e@
6N->8P7gc/+7L/[eT;A;gZYLLfGIPg.;WEVBMI5^Df[[2/\AN+_OMg53E=^SM\XX
XC1Kb,JeBZ<#A6-dY5J6WWT=-K0KcRf;I0B59:a\HFdT6L+W<^8b8)ecU\<)c6d9
;G8Va9MIY&.OH4FL)e\HJ&T&.?&1[_?;=]P]gQ.XRc:2>NG>AGE->.SfJI5>GcLI
gbE@T_]-KcHOI3=BAUUVM8AD+b+b#7U&P-\e6U#05E=T3IdI9>@PD&);45gKS/&@
LAK]OS=]W[#-/>Q#<CVIXG?Rd2X@3Q<>A=,d8A^F]03RERCXg.H+OPc/G(Y,bR92
6^JZ^2e:[XK2IS6\_.PM[PHaDVWcHZ9K@0EW76[QQ)@3[C8M(W+LHXI^bJOaH4CM
6Wd+TOB<:PM:[8)BD?6O#MfF#^)J[K+E,[U[@c5Y9N+Y\M4g&Ce^E-5a5SK<ad:)
_,2./_^1@VQaTL5[QAa5?IEV6TM<R(+]F<=X4.@e]MG-C##1aY(7]G<(4DdgUVeJ
_UTVP63G:;\AEbW6GPMOPf6YZMK/Y;4OJf<96L_SfC_V49D>UdT,Y)W2d^Z+C28-
#Y.>b/A3Y.M?=]VO1Ufcc@@3dcf:f\@eQAgDABJ:@;T0bKU8d&]T3LKR+(ILPEPN
ZRc[MVUgS.f6Ua#NEYb@YTF(1Y4J(+<_72EPUL,gPV/I/f,YN]6>f,?eL0O-7?X<
5EDC;M<2ZO[eGSOcMfG^D<+WP_Ug/]0g2BC]0&[c&5^He\E.gR7[E&9ae=)c?3Y1
2A83Mc]RP02eL87XLcXaf&.?A\VC]YM>]NWaV:O,B92V_G2D=;Z#\aNHLQ8MBP?2
)MCN7<CRK9R6TLOO3.6W@],O6;+<7+be9\,0K^e.La06GT<^&E0/JBCON>4.CFVO
[Kde@P//2>[]IP:ePUI-^G5FH;1L\GOOaJWLH-[C_;UcaI-+]0VQZH^V=5,WHK1X
2?E>(-Ha?H05L^0F>]Gg8[8V@dY24NdKFf0P[7)U,T)7RNDU-W4FC(W\S(@(C;8\
<\4(2a.+fD2/N#C?SF/)bd8EWA<;?=JAH@HPT4;\YBFP?OYeP.Y?R(Qf5/4cRY,6
b&Qg>dYGdd=C2<cJU4/_?(66EE-g\;E,;R;F07d&eJ[Ucb[8N6\/82EZLL-MD2AW
2A3(-e6RNee@(+cfBKXDJ/P-^#&Of?LFNgH,8S6E.a_J(TRL@#K#@+aE\_MF?QOY
05BQ(@@=#RM6@P_(=7HLdV\<PEEA/Xa=0a#(-8-?<?M_U2e1<C\G7aHg;@f1P/NC
+-9QD7.G3,?K24LTNa6YQ&bE-]6bC7M1.F.^MZb_Z/Hd+NSUA8I5J]Hc#)67d.eA
>+PRE984:0691W.UM.(]YOUgfgA66Mcd6J#Ia/^^e](\aX@C>HSeAc2JCDA+0gfZ
;O)#PKOX<)=I0&I+fa:SNG<bAEL40.VK/(NPf#>5@UU+fJg+Z?+BN]gEZ-59d+aD
Q.&N4D:U8Y?SeSNN63/)-PPA2Ag,33e5;C<d-\@_Z3dB30E=Q4\#:9_VGZ+#()=L
1)DL_CI1N<NMg7>cOTeSJ]]JQNWTc#2@N+&L7(PedIELEWd-cS_??1DMG/A02&O]
O]](OOMKe8-N6\,_YFc&dI^0?.c9>d5)[<(5+.W-(DaJb0O1G;-E&+.)_4<A=.:e
NA5A[+W\cTT2>CMf8@8[5Y2;5-f=<\5UX;B)c-Me&&.FA,H)B;Ed#0>GKMZEO[9=
-eKODHWD,SCDX)RAMKAM?O[Cc=8Q;>WE<bTSG6?&]P+>1b[.FKD@&a@YC:2Y^2=H
G+@Y).X[H3eNCU&CbcOU:+>IP;8GW.&KW(5(S82H,03(c\4[W=GVIZc0CK)_,cQ=
Gg6SfJC+#O1KQL.\Bg0+bTJf3P6e\-.0VT-YJe#_T]I]:Ld8W77c1>-e6SXa_(51
)<9fW[f+G]MX(SH./?-7)S4)c+_J:01.0BZcT[g<H&0?;3CBC2R.0MT^.G9\c5S_
Q(G#H4RQd)Wc+^7&+T&AKR&RAe.E;@&0#1F@M);Ob#A<1c4MRLAFG?YQ02<I5MeS
(Df;b&H8SU6JdeG2JLObLUC<_d79a6_^a1GAQ:WIH&06K;SVUBDT[/K??B)g#C5Q
a\N<0E@EKTK\#ECaZ+bg.WFM5D@dbWc8AWIg:H_Hd1>5L;=/RQ_>BBHH/dU(^EKQ
>RH(D_L<M?0LK+Y5H+\B6;L#/;:If6Uc_]OWT;b.4_W)L]#a--[gHfN2KG=3U0?O
QX9N?5HET4eA&;Ge@MUV/@aW#Ff3bZ^,&;>(M^-a)CDQ>JO9L<2+NaWCgDJC?U]J
;=GG^E&]&-@2.LgKEF-[DKDg8[[^BGD(23dDFg73PP=94^_LPc+FB+\c=V\&IZa=
@4G@.C+)[9.BgMCa[GF#6abW,fC?Q./SCfLQ_2FaTH5Z54,R=RH]6;](cVXK\B)B
#d8RG)V4N&6?77Y]6VDT-L7LHKH6WPU/bA<+][P0fcd2JCD+fH?8XRRYUQgTLGe(
fY+74O?0L@JcF,Bd39QbcW5NDRY=?2dNXc<E1BIg#69_[(-.N4d,7U7b:L?4<R,R
8;bJ:R30HK-+1G,G-D^893O<S<9B1d(2?;>URG5/a<O<&c5H>)H;g4>:a8/JegSA
dNUL(<E);+XD.DRT-0U()6R^Hd\\;ZP9,;T:K0+GRCR.[e7_f@-S:_TS>0VO@0/4
[^0e>cC?3JE<9+XSQLa?]>Z/Gc>SF7W2-C)P,=:)^K.CQY\I:RG7B<HKLPFa@.@b
I?,&?1NWZGIS&#.&?ON[+Bb;79g.TD;&2S;YCF_UG[<f15aaOH3b++Y24^1FAQC0
UNUO=(fb_OTT<-O&C&\gUDMUW7276>6E3^KWd>YA,BXVg+SMJP/,IZ2Kd>MX5>79
L\EHS_O6..?QV4@B^1b=2QQT8W-Ea2AF8R)8e^OWgWfZG,B:RU8WN\,\C##-KJ,^
[R869=6Z..QIGe[+\J2CVAJP,013O5=Ycf=W;#.:14M\1A_#U5QJJ_A,V9[M/2^R
NDA-LP?XUB&[O,1RCRLdXG1>BX=)&OW6f_;/L2GAL;73(0/TJ+X^)6YWX6\@EVZK
(Jf021HUI\_1[&^8^^=f=VeKBN+_f]H^4Y.c>+Efe\W:e2]L<T#2?ZVV?1G(D>\P
H2eW0gIe8Z0D-dZ=aWf/UJ46,(f2-#I.V?=M=(?BT>>.X1UQ2XW\W<Y=J\L(]\E3
=OWWA^\ZK4HA@#0SGQ?A<SfL.0=RQ]<B1AdM4]6Pg0ZR/[[abGcTbC:E[(Q0Yf@P
D(&/4.C4^+b,Zfa8\Q0[3WGaF\X1LM;-G-H29+VX83CU>90J#J32NR\3aIM)FfV5
AO_@7dHMY-d_P=:QX<eLe@EccS#U1]29>G<4F/8\&(^,(g(0aBX+(2F^gV5>QK0B
8.Q[_:>),Pb\.@1ScSCIc/F8?TI7WgR2SB^_F_4A5=&,;3=.&\HUbYWSE3<@bVW<
T,^QcN<OL]-gfFZ0Jc7LZQP@G_QXda86;GB>YQ?HNXc<XWZ>@WWKW=A7f;\BfR7?
-@7MAZecC+,9/2B\=UB]5M(6O?FSBFRCQ8#47OTRLeY>J7K[1bf:)6CATW.H_#B(
<(SMT\JB7Ff#[OG6:PQ\Xa.Y(]SVa68CB[C(<6[2&AV[/&/RLbV:WCOa#X\V#U7(
\P>:>Xc1E_]VV=)/W4]B,[NMG.W9(TZ<KD@e;.IA:5+,D;L#&<7[eJd#?A,(V?>X
eK]GZJ69YNRc221.JY)@?+\@E#aVbES6_<+M4Ja,68=a8AGX.Yd)=S-YOQ[@e];2
^4X6W[e:HTM16UH7:25.U;f&H5(^\d5]f(P,)W&PG3L+gW&cYg?I-W4Z2_^=WR^g
S&P3[^Rb7VMMR&:&1TG&>:LQ,eTaO)2&R_8>a3^?QGQPJa3_<+WKV.FJI42C7SYE
g&a&-/L)1&J]+P4(b+70OD#XYcM<N3ADC#Y3BT]DN_\VP0PS\dBTI@CQaR87=ff>
Q^A[(\H25450:UT;a;F#Z5@&8--3bfcLG[O@La3.OD\JY1FQLGE-U_MBIOE2PS?G
6L=c9WeJ82.:KM51+JT7gd.JD7ABM/@8VDZV-VF<?3.Q#91:9&f4,^_#B-6M>:EN
]D@R&)OM0]g(,befN;GTAgg5LIHWF,#[-[G8VBS[CL[EH0];15\XXa_eM1@,]=5b
UVK8fF(4B^.;(^KR]0?VU7\c,SX2c,1WG\N]c)P(e5NL;(U9g?g=_]<I[T>,IPR2
62.B^,G7&:e[1dEC<K2?EQFgg>C4R1R@GX<]JF7(a+=L6GH?d9-6G4A]T-Y7\553
&Bb.X#81F<,B=R8bNOW?SG3EV.^;#D9FQLA03/Ba+f13>RE1,R/PJb24U4>33def
^Qa6@;:UIg-g>Q-E_3R@G/#H,Y]O+,5f;UNe[;U=JgcA]-B7Y3W9/5]HVdU9FJ/M
&<W[CUD/gX+df4WC(VK2CB^\H4cX0-g:ENTXSX<:PHV72Sa\O9L,b3#7(M55HMg_
UPJ&_I;IdaRBAGgGPf[LVUTHgJf0#EE(-9P2)_<6F#eUZKIYRBVLFG>fUeM-CTXN
T,I9M_8Y6d591?Q=V+A9cETF]E/40/AS@9X4HK9UfK[N6^YZ5@A(+,1c29&)AgPa
4.,X<[N8+@;D]9;3b\9GDd&00)U3VK(+BdVJ&ZaA1Z3C/2]Fd6<dU5B-;?I\(8BY
\Nc+gIVYY8T.:0YI[_76G6VVDGJK?QKI^XS@.;9G,&F.VJ2AT:GWeA)cZ8RCc;4/
,@?QS(#+aa_BJT5+X=DM\Q0YG6C32@\0M6<Z)O#?YEQ^7daX4bKbLXeP+9^RBWP9
^-1NOdF:&-ZR+,b^Y9+U/S3TM:)M]TI<E@bB_5@0N3QaY(>KZ5;-S;#U?\\\_b@K
M(Sa/15)/<_1W<c09?HaT6VN>8Qg>dK-HAV4^X6RQIfKbf3dV90K75WQGZ6F[P^b
A62FJe7e+S,9OZ9Zf[T@_&8U5c:8894ACfYd]:=2ZNIUY^7L,g8&eY]V<1?N[((L
04QdBWMTPP4W(6Sd.2I96^WTG#S0JWSCYX?[(&2OA?^)UU.7X/a_Qa]6YQ27ZC12
F(,PTgLAX_EGI]9YGgSMNWLGP9G:16gOG[J2/V,0O9Q/WKUbPO_.f7&\SAIH[)N/
WH_2>e?[S;4KZ097Z8OCcIf2V,e6#U9_7_^G[K#,0+H9^BGXSHd:=g15Ig?#HS01
(U@&g(+AI.TDJKP:P?0C31SE,1,B<KT:H0]6\38:/e,RX/,[X=ceM2deE)@DU2>8
\O7+91INM3J(+@1H69ES(#.\a..:BQ^_0C+OS4&^:faSc/XV(>BGJEd([e4bTe/g
Q:_2CMLO8E)a:Ta#9bIXef/UgY6WEXVbT?1ICAME1=(N8BLbIM:0e6]+1)K/[Y/C
K6),>Y4CJEQ^1/PHSQ#>:C+7-b:-AIWPL&6#=Z7K6^VFNW:=5dF76X58Q<Y:G#33
BGWK)9JWN8&Y;P?bRM.3>LOGV^Md[OYT,8]_VM1<N+#D_f51O]e6a_T3>cMACNAg
C+GE.ERQNK.)G+A+.,-JP-FW8X.Udae,=V014,CK&202L7]G;)/(MRR),4?4#6_Q
JOM4_0ZJJ2WA6.=IJ)DSY70AWXFV:f^^:g?TQ>F7>[N=CAVD24b-dW0^;1COVQ+M
?ZM6+f5:f,GSD7=N8+9(:9AV;QcOAg\UFMce;af5BA?=HR@_MH;eL[HS3ENO9MH-
BS@)+,P/IX2@-V1:GIZ#(>eb-9ZDLXWSdAK^baSJaK38H7)I&[(<\)YY]-8YASe)
W(4S8/1GG?I]/H3.9^c0<+2e2SZB[9SN&/R=f[RBM^>J#2>cV+c1e@[2R368&HJg
D4?+RY+[-04263(PW]GRZ)QF;V=a)U/ZLaN>P##,5CMZ.0aVfFEJZ=D]12^9<^LC
9L@HDfFC_LL^)[N:C(XTRXf<Hd@L42.I>?]3LZeR0IM#B2UP;.TB67P]?E;aU_Pf
XZ++-g#Q51S&7WNIU15Z9+4GZeP8C75<HT[026HI.4I0P/>[UcX/RO441PY1a]Mb
VLN?@aBa<7QB8D.RZ;g>a31<eAT(.33DQ9^]Y5@a,-]U<6H309(4F;D)SR+Q9PCE
AM#c9YMQMFGU6QW?3e6^Mg>1SEUL3TO?>NZ5g.:U:fUfBLHKO1=#[A,8\KD53JeN
\I+Xag[W=FOY+=\Z3eR#[EXJM^DD=G2?T9E2DXG[ceH:fVW=U;AFRgCBA-5O-(?2
QWL>S,SY((8U)WN.W]P+J24/.2CJ:S0TA:DeLELRD^0,U06,VUAR&^\:NLeXCA__
XOHI-JTS7X6CD9GSEQ[M2<TJNYRTd-9;gR<HI=6&5MW,XR:RUH1W+-CJH>A69bS,
YM@2cBZN@dM\YY_]OS-.F;MFT&6Pf9eZ2WD&6fa.FYc53eB#ONBNR>Z75QaHSc+8
;A09B4UE\cGV0cQ\4PUK;aAHgTTU4@K8aYY:Z@P&P[^;]PH\dPN\S(T(3e6NLdB_
e5f0PR?+f1+2]XV&SWeHC+GTa)DRCM=XWD(Z[>1DG.RLU#NRfQE(GFcBTD?/KH+)
_&C;/MAHIA5SFL1I8)aI-Odg-?P#CT5\87DW)AP:?@HW_K_T-H#C@UOY.?+)O_=8
M6eS2UMD\&YWWab.(^BbQE@>>^TJCTCB)Ub3+93<bAa91-)E@RX?5J,7RGC5&JBL
4I_-.@9D>D2?.<-W8B6_70.E[>c=S;]E##;GT,YV(]g8(60.A?T9g[_d^7d<5&?(
g-,MHY2ILV\X1JE]McU1B=W[&X.52,X:X6^Kb+1@g)ZO_9OHUbA9&63-?S?;/a1a
4.VA8[>NK\/dF@FUXf+X5Q2aB&D@OWEL)<T;_^]Af#dJ]+\\?Og+e>4,XIQA=)=)
6F\_d7Ba;\bR?5]4:ab;S.T(PJG;f.?^f67+dJULc1ee/_KP:aLSa9SLMIZ0//O>
0PZUVI/e,0E#[T=5^KLWOa.F4<2Z=bb6@AJ<(&DdIQ>^QHDPO67L7IGKVL1GWHOK
^DT/K;-J1GQe+YdHW;35U](Ne&,29c8Te_[J\+>bVfeF#I>g@<gG?JYBb&;fAK>C
Y@Z45VW68^<KA?4/?,VP]-Pb_NHC@V\IW4#Mb)O[5:4S&(DN)2:_XWeaE4^1ZA((
,0NP]59>g)_Ka#1ZE3C7.SMN:]Q=U+<g1LMSQY?R[KHESZ10SbY+YVg:2+UVfGV<
SPaDK<3AG=PMdG3g<+IHI[1L1e>0U[J;a(:0AcV>H)M(Y?/eDX9.V;8LXSdX=c#F
Df#61<gR:Y^O9YFN2ef<+ZP>WSD3bREeb;Hb6ADC:T>GGeH09._R?:>AF^[_@L1O
L,Ue1965T;T>9M)deDf(RV2a^X9GN_,)U.)(N,O-O^e^KVT+CQ&OM8E7IO^b\5J/
^[G@T/37XaPe2=GZT//cB<Z7#8]36\7<-HI>:D7e&L-YD(F,N\4[&f\^-LDbM9C^
VJT:@9\Q5J\9^J3.E[SDFAB6=1H@;MJ4IEV<FU)/e6;4aLY]GO[_?#K>X^W-_cH\
P)gQ,YDc\@3WI7N\>+B843G+.QEGg2aZF)ZK5\?CZ(_70[;7e45>gF#LR:2WKe+H
H\F18gU)+)e>BgJ4e)^,6PaO(Q\3gBd[(X]@-BXKL:JF5O&OX_YgecZdI2#<Ta)@
fD[Q4E6M[g;>K2I1#]fL61(-4+DbB:A5SC9[U05;+?b=EQN,@O6_V7EECbe=M.SV
cVXbg9./9(?N)A?Se7=;PQ0.Hg^\,_L1d>),-FA_F6bH0=@AA>?C3T,R=6889E#2
6RXY_>7K-<WcF,eH]CDN+XJeb0e>Z4-=_f[S(0KeW84FK@UOI>IU)_;IG5[B961W
HFFK,1f>Eg8=4,/>3&XSEMZF?L@<O;C8NKf]ZLNIf>a:=E6UO/3GV3=W@eD@1E,B
c/0e;&YX&L9@:eFO7?b-DdSOGO])DdUfU:^N[>C7DKG&X_CbC@=MU/4?MHKHE:f1
>e4NWKK;[:[CX43K[Yf-.KL\fX^@1TK?gSH)HE4H=fP;84Z6,_YV>KP_9=XR92]g
7P_6f-^P@6:9Kb;_HO(S),XZ9^129[.KgPO&N<UU.c:c2>ff:A&VDT(ZQ1/7ONg[
;A&F)(3[A[G[Lb\W:^V)H;LYA4aT+O.2BAQ8>@K@5b[Nb5@OQYCYQg_)g.0R.(I-
dI73bPI;^N#C9#].BQ1R@gASJVQ.6;+R5G,.&#4KMUf#XK^VS2cEU8ce9L;F;H?8
1G:3T3g\\+T_A50aX?:HZ,9dGH?R[?2HR4J[Q<5N:63QB7Bb066^?R8RV4=6GRN9
eb&9fQREKR87&Le/UOa0?@e0[ZPH<d+)(.R^G_@03260gA@;PZfE28Z4-J8WdFUX
E\TTHg7<6#VGF4UT9,3J4BKM+C0KR\<2JQe68UG;R5>(6C]3?UV3&4bae6\NVW55
57K@345#M=7E^U35^_?20YX>R;\6)@a90RHI7<5(+Zga30Z1@,WDBQfI[^eNP2Ye
[7<E)8[-[cZMWO[=RNOZ>YW<9OE]C.(<a-^FG(L<PF9-BNX)0K4PC:\10+>(G&16
(A=14C@\Z\a9@2K\7d-@RD\OLg/NgYAJ^K1,5bNeT4&[RP<69UJ\+dXV7^3<S(XS
<.1[O;cEG7(b>EVIG,8(&d;MaFAUDcgg;Lb8e5gQZN]]9Cd+=5>>4Q22?2IS]PA2
&][[LDZJQOCKc\DfA;ZLKY/O^B):)e,?/3A:5@)8+F57K[=C#MUbL,QZ-ZLS>@5W
BW+YEQOa7B;:TXB6<,BR31#A^B0gV9.>S(QagS6O\Q1X1LG/U0>0+P[d),1#7.d^
U/^5Wf4HKN07+0KNGYIfJX_5;2Jc++BPEVBPcbc@H\M;2Nbe=7(0JK-aZH,&eM^1
EEN4OBcWdgN@-#,(;:VY7ZHXOI0=b+DT)V)8VNN\5BZ[e>@(5SW+W1-@<H:d]_WR
_;NRIBKf1LOaG-:Y+QKDT=eZYB@UeLN9,O:E@0bPb_)bC3fQ1EX^IcZ+_N2_EaG.
H-&8S16KH;6a]C4c]6:_H<#f)LQC:EMe;[\=b3g4PLgTg&9J3SEC&a<72Va);F[a
B1)SVSb=gSGbXZ./?b,:L670,W\O,:-.7175Qg5#g#f7KY2V//C/D/F\APe<G_0d
,9<=e=YU[2.X3D4#e2f;9I)\YA2a-E&S,dH&S1LA-W]M^a]_NCQ0Q5UAP&c.eN/X
d_Z5b:(f1[5e^ATLA(NS>[_9?a_VCg)MWYAMIUMJR&fRR2#MJAIW#aLSXE?LW[;R
Z9S+6@B[FI25>(CZHbPH.\g14D\f,N8GWFBW7<4K-6)gA]d@U]H8gZUA6H:@A9:Q
eF#_YI9J_1Z71O73P1UL]@S(KF##^XQ.8Hd+K.?\N4OY0BLOJ3fg\3S53Z-IUW8L
A]NJ8N_gdR/,>dUM^a9YW=3]a=R@Oe@Ff.C9<T6?_>[#SQO.@L-FZI:g_ge:S.T3
U0P,UUOLTJMCQ6bD9)B:K0P6.BMSZR0FTH5EWTH]2K]O-Ec3?<2>d4-M@LRHBc./
Z(Y7fa<=AcVX,JJ0PB)D^JMIJ2(+O;SN7RIF.BLbHJ&70SB=gAEL^a+9J9+47)_W
2LZbI].[M0C-:F@b2AP#(Y>F3W&0B0Dg)H)Rg),G<[X:HCSUKT\KV_>^\M&XGHGg
A0+a-&WS?MdT@K;\DgJM4Q(3)YSH5g<TGeH9.2LD8X[QJI^E(MY]U5TBGTFO0eK[
&OZN15M3Z0Rg_e;P7(fAAG>[Xb]:3G)CY;:f\,\O?YG3dc<,0.8a=A0Sg3W^V^K(
_.P1S@,2D[)EOUQ@HN_PDRCBZ@d>bU4WPZP3NZJ,UPI;3OLNF7d+.4dGCSVg[HOe
-:9fZM-JA:Z_?09RX1f,8,U8=B7UVgE.^#/B5X+\TZO95?/1?aeG=M9NWO65WRW1
GVEUC.KMUP9AVF34).@87QK\GP;K#\M:6B?H_KWV3M(T:Ka9a-3S#US#OZb<1U;7
X<E8#Sb]AbRLGc5eXHCM252b_bT1OCSdBXXSP6&,BG3&HDG+&-_6aU=4ZP:0<NMd
#.4e4:Me+?P)=R+6^d1e/M><)R<eH3_IAR4M3KK9Ff9K8D+Y.db1Lgc.\_bceBY-
?HO#TY^a=JZcZ-,cGf7A3\<Y=US81YR^_Y_(0ZK+WIXPUNA1[1g&SdX6FL8[T2#:
X=S?EZDeL24e-_<K)BK,H&6CF<O6bD@A@&A_Z\>+GJT1f_7M8Z41Dg@.)INd1>Ib
gTGd[N[&/)Q)g0gBCaC(.<d126W\fJ2V,8.RK4K)(YKRU;X.ScQ_fa_T/4/1FceD
V0@8g80#CY.:,/c9LFcX#Z97d4S@_#2b-6LUM(<UHVX+,;3Q.N>MD#]JY9_gJMR#
c\0W&8JGb;T;#+UYaPG1N_BcO0;;;=FJfMFUN1N&JVEQNLTJTIKTS1V/LfA)9ER.
d1#cZ=d2KTV_O_IQJE1MPb6]eQ)XbT?;HZA52FZL.6gVU,AQU9#M\W3LU=3R[<aC
9J^EY^>XaT<++7-H>g+]-WDF&aVHHS3KFU5eb8a2CD.H5H2F92K?V-YZWCY:Ka4E
^>SAcf#N,BSZg43/U6(V=H<b>:/>b>3LQQM+P-f.OU;(fK/M+K&D]LMOS#3_fd[f
U=JNe)OM,HNKEfN6&N@DG3V<;Q/L:NIYEdC1.:PDSIfA[/P_1dA2<I,b0&cKa@(I
37\e.:;fMY7F[.5@SfQ.[=-3?^0a4TWCc1QRYDZ;OO<9G06MH^(6f<3A.&>5]FfW
_OCQYENR\X_)X\FbO&,,Q79Z?#^,>JZ-0Y2Z;YH:-^QD?W2<0,&J8<>.P1<2b==L
Z5(2AJ.RX-TeDF?&/M33_E@\=QcX_U=Y_F8gSDe.d9;8B^CY\?c9M)BR<Z9W[MY7
,6H;2Z]&5d]2[cVHaG,5I+dc_FNZZ2IB.2d8TGGIK_bafW&#8S<L[0F+_6DMZ=X:
U49Ub]Jf50a>Ba((7TgAK_&cGVe7BTPddSf8@;IG:]1EF(.DgHVeNIV20G;I74N2
)M1WUWF+X<[<6UW,8LZ9S.;+1L@+K)PDVE.+58cO>FdJfV_4g7@GF(N#QA@]GEBD
=0OMeXV>gYB>;E#D\1G]7<E6b+GYTfg/S(,XT7X4HI2dMdcg1X6E:40e/#[Hb@(,
)5190eXEH-fL.?.-@\SU.B;BEZ:6][3MLZKJ@f_1MAcH_0B+?-LU5fA^1#=&]20,
G\aSP0FcC\ARYZdC7\3f:_\:FLe#=6130Y=7KV;WCDZ?#KN(Tg8(ER><4T+,SKP7
XR]RC/Ea,IJ=B3P(#g)^@[2V[/;@&Y8K1fH0W]51GWY#:I6-4G1)^84[O3eL/K/^
d+0+V?H1DB6<,KF0AZPJ^?\NS)NX<8>RH<aHU34]<F4b_FIU((,2M(c<PR+^<,GQ
HJUS(M_<W0Y<50_S-6-aL6;G--(gK(#/SR:EK^E^NJO7.\7eK3K^W(,9^dY9TTKN
LF?88_+VN0)TMG47SU86L>]V_VJRg5H.Vf)W?\^g0?G\TC4(PF/);eH3g[M15,V0
\MaXRX+5^@MG0JMOd]^)A0<8>4?Pd:-S,8_F2L_KM:YEC#(@NC+?bB>G+X80YFR.
3cA@e0I-6W,]3(#8/<0bQg?/VY+6>HXXQQ0XET+B<2Z<RZ[b@3;1F7N+H]SX)>g4
OV3cQ4>/2cC3Ub5M[&\]]@@\H(&C:3EV2RXAM8;PgIUa[Re-7^2AX\g&<]NB8GF(
YAP(1P6#2-^::863>LKY:<2f/#D7A=g;g&bDR>Tf=B55H,ae6TC&:-C?\eaBGB[N
\4/I_T3b).9M;##+K;P7\A<[KB8f.WJK3LUM/[LSRQE?/eDH&L.AV\5Oa=)/VdP?
I/=Q^#W4=fH-D#M[I)X&:PKeAd>/R27#cGc@P?]_8VGJ4MBWJKPHb,b=:Oe@aS\S
,UXTd3Eg.J?2&9\CO:L;TO&LeRD7=LT[J#cI[\>f7ca8-@+.[[.]=4)C4NPG&8;T
aSQRVGXHLUPMQ:J+675]0?:.M:^7\>E3[\R\#e)P@HO+=UdG9Y2C56,&UaL[gMKO
_BQN9WB#II88bMAL<9WF8MDcVU2KKI4O<0Q1YZY63Z:aA?@_H:\BP0H+KB-B/T4C
IfYQe>9b;UHL[Nb>2^:6KR.8S/GS#Z5[8@1?I)[W1<DGgU0N0661d4E)T-d\VKfC
6:5DMc^3_a.0:2C^Y>RM8fF>5N.K@>=JS0Jfb/W:eH2O8MFWR-Z8e9JIZV\,[[-g
CGd5)d:JO-Q88HFA]XN1XAFEQLbSB.C09)#=ZGVcgLH:A(:#?JQ]L#83LJYQANL8
1>XgJZ@1T\J7-P7D5HIPDMNAa7.4X_I\/2&@JM0Q3RbC&a#)<50G,;_bM=fR>]F4
SS0/0HE/SA?NY+>E#HgfB9^+gb>7_JA1QP4.D9/?IS@H/X@<?9\UOV3X0_Kd5JX/
NMc=RefVMHg<1_IB-Q([?Q&./TPB.6g^,W6\L(DLG84gMX0gB7>[9SHLTeK_34.F
:J8d4/gC\/)L6#CMd/B-g?,N)XG\.G6:PWW:?-+G/5_)@TQ39LC&Qd&76Fe4[MN2
a;#[R6K562,WNE,ZZQY50-+2M:+4Gg5bQ9a\/_aeGSI,>R3MS\_H\COSe,)SKT_J
BeA(KK3(6/9+Be)G##&+:;.I;6WI0[YXZZPW6P?6M,.BI<?d[D8U@2AA(d6.15[M
#Pc<eBXeEX3TJ>(CJZ/9ZN=?;M6CNID<\;^/G#W)b.&;QX8;BSIY&dRDN^YQcZY#
9P8W@]>b+H-B197J<_aW^H[9W&G8P2NSPZ-Hb=70&HaO3AJFVP+<VGH&[>(&X=53
Q/KKE/NEMbb(;:5<e#K>S=U(J6AgY0^8XWQ3JeEWSb;?PgA9/)V7K#N[fL+M=6CD
XFG;9_=TCa@eRcHSQf6DCBbb.)O;JJ(UHR.)L&HPY6Te;2[6250J22U]d759_#[d
(WBA;\9I;1b\5R2TP.aP?_](X(G<IHcd41J8^,<_M0L=3,&,@)dF>M8WbD/P4B[X
c18/O<&e-/8NDfKCHUDI2\XHME_7]@(F^5ZFDM_@70UCY-U-De>;B+@)PH96GdF=
R?gBU9;CaUP+f?BXeFMU8.SZPJ^DT#[b[X\Tdc>95ES#AGFGK0\0INBG;ISgI1V?
.P_;&W\HF/\ZX,@?;&TeZ8;_HFb:TY0EU(1V>\^:Nb&.VVV1,;(?5L[@8#@;=C^.
.gI/g&.Y([e^99P_Yc@G^H/cTfWBVD?c2NI4UYJ&DbNX6gKbg5Y]7F5QQ:6.NSQ6
9<\1^ITE/7PePL]fT4.,((9(OJ^+M]RB\U&G:Z/M4KHD?A8=:EH6d46]EHbL570X
TbH+)S]/FXRYB^53I(?CZfXA,K.Ub:B2_TV?9#UEW0Cd<d6^C,16)]478BMPe6<F
YS].1]FcfW?E;B3XeE@X<5WM6c:cZKKZH9dCSO9^fZ9_UG@e?HIg/678-]-.Z>5g
2D,?dJMM3ZD5;:)9IRMN5<RU<9PfVS\?7]7/[38WGUX&7E6@0:,^VH<b[TYF>AE^
+Vf.TgWR<T_]d4QBG79YOBKgD6>KET<>W=T/ac;TXCf?03>WJ,.dJb9Y3d8U>R@g
R^N;8<HCM=^V^[TVf_6Xg6/d2D;4eAL1DfE.)6gJD/MPUOAKM^@Gc[3PUUD2@R2L
7]Rg+S.1d\<U7S2L@V?(]a/@3fW<^?>T?M)PN?W3_2O\Z1^?fD3T8KbX[=>)caW;
a:]ZY<^X?>PHOfC:cWCLV#1Sga(KVTISYO2X?+_-UDHR&CE\CJMH+@@40OBVcC^-
G[]GGHF(AYP;PPKSB,gf(YK+L1B=g9-C)f>9A&8f-Cd7B9K]73-A60eg9OQJQM\<
^eYeP?^Pe_QYIISY(?7XWIQ&R0]_&H?PNg:3=4^#.GVF<N\UN8VIK)WO8RF9QNX6
VUPH7=GZN_Z^(M3aaE=@Q0)5gEZ/#d?9D.6Ib(XeQ5Y,O,^2&K]-eVLDH[:V2:5&
MSC>SNc&6cZ1Z1DZ=,-8P<cV2F?^BP]]^[A/9abL0fY@b4c6XJH#HRJ,]7KO)6H#
6F<R@QA5eH](W=ZRBCQV6eU26&.Q+QbZ1>T,F@F(P?D)G.1Y>[\OTbc=<=1P>T,<
;;dGVf(V0c\4[A(FOO#YEA5a@Hb/VK;;17.QSa^TaPV>>_\f:#RWWT>=0#TeWV/P
Y.SPWJ7W)O;gQ>EYSV/@.Saf[e@W.=^9(Rf<8ILS5I6N+8/V;9[V+.5S5dC@5(/:
P)@H@IbC6MBb7CfP9\V)DgVHMbNLGc\:Y?FB,.P4c4UX)?L0MY^W3a_5_4J2:X:^
+V&(;+9NTeSW;D3AEU@UBBMSETdN(CBMT-V6<M2Vg&,O2VG8LB@]5<[a7J08;GG]
C#6W,NDZbO(TU3;eNY/gU5BcZbE:T_eG3fMJW5EG6C1JF3\#c\966Nd1@TU-VOX+
X</QWASPJ6\XA,8^\N;1\6]E-&31=N@K+/K@<H_I0;0gZ[&NbTYVJPR9N2RU]].2
5W7G\^<LAX,G2[E\(P-]HAT()+SJIIMF1\T^REWfCJ(SVGJ)cF#d4_6]Gf^S>ffF
&[[f5)J;ZUc)IJFg\F3E=D,RJ49cSB.U;U0;128U]KOV?,5g9X>bCYZ\DFOML5Da
;\0=c+IA]>SWb:ZW^SaeNJ;T/V+:Zc[@ZO9A:ULCK]34,2fRU-7ZJIc>e4HU2IE)
Y76C0T(VN^X84cV\8>7f+A8AZFD:e#?R/M.U^ce^-@6bg5IXKIP)(2?4[V9cdYUS
=WKV@4g:D3HCK3VU5PDdbcHX7bXJ11C@K\9b\]6fP_2gRE6_;6HgJ8F1Q3=R2]&V
(-V48;6L=H0f<7T(#&_XOb:7^)ALGJZ2;?<gHN=K6Yf,9JdM_bgQ0F>GSU^Vb^EL
J-2.LVA_V#dIAM7+3Y.1Y0@(3\eZg8T]89?-a\FMf46-aLaY.R=_6eZ9S)HFdD&B
B_71@eBQ7dJSgY92QJ\=V[f.K1U\ONG9&NBN0Rf0KY9T:_=gKHXd0:=&E+2P]:KU
fQZ0\762#L9&c-G_;1)]8_P=>[9QFB[>+LX<X166I\>(dbeBJGJAW8I80>86d)L-
4BW2U7LeGf@+-CAddWKYD60R]=bD@.(d^#(K<UPTZf:8\.TH&6^a>R9B2L9-[A/G
=S;&GU/.SIV.U^T1XO_R9XP_:P;CU[ZMLcOFON^TT-(M3>>2GGG2L(cAe<8<BRT[
R4KSGF?8fH/AV>ef:P17IaeB77PP-P;+S9WK5&&EH;@:.MJL49JH^TRY^D=#.YV/
f5)TQ4AA.5:;aP2Z(a_+0eV1bdH8U#QJK:L]fDW4?;:XYFAF=AIc=.,5Df#2_5Y=
V.Q==G,O:]aO08:NaT6LG(_V(IC,-FL?<#W[9FgRWI+f:Yc8I5GKc2LDN>Y:A4/[
gO[4N_GP(fg@:>Q<7:)231C-O1[0&TC,6S7:4<2D0;3U5dOJSb[2E^9R_8=AO\GV
fQ,AFUDK#=#;M2A@/[+V\f,PF)6f&@HO^D\@Z(=1&@\+G\]OK/f2L2#03AM+#7,A
1Z+F1cLd?5[\4a?D]GAUfF/#QDRYK)3KCV7d+BT(deOC3C;.bZ?MHcJ(WW=/I>?.
KIa@=K)8?-OHOV^#cK9Lb#?&/<C;HJf2CVW5F[GKO3GAH9_/GMWZb4OAW+H^>B7A
dN2DBd+P4WL:?5GXV3+N4-#CZJO#QAE)4\9._9,(.:JJHV7,FXK(^dK#a&d63c]Z
H8g60fCGg(8(c4+AHQB4a>A/d=\92Ja[TXPE9GMB0WX7)E0RdE,^UP(CcX@^;Hcf
UKg6#-AC#^b&4<7Z05EaNUeV_7X6>D-dc4dV<PMPG?MG[Sc?\15Q:TF112>>56).
9U>9^PZB4=<([OSL\LU9#6XcT[-LI13SXEV8\;aWb#+fHV3[3X_bdHeC^bX2>@7[
H\Z<.e4CKC+IM41RMf0]>(0e>[9#a#[:Kf+[81-EEIOR0<)O7cHSX.&7Q[+S]FDB
cD:TV^?B(VJSR[X:D)=fWM4#(VA^aEOS^1=Db4gQ--Vg,S^SVc^4J=K>+1GC=].&
DNWE7OSK18,-a_9I1@.N<1OJGa0@4J:c=F+?;N4#X0_A7f^^ZC\eG;-E@;4T-Ob>
eXR>=?X>Y\DfU542E:?EZaJXWPg]cG]-9fIGc^edcDf8W1(Q>&._\]6(O.]]EI0_
^CD:X-2(4ZA&/?I-4:<6+2H;AD5?Ab_a-P9D8\.KeP<J:+_^TMT+YGed],Z8][H6
O5VO3P?9fHTZ]JLP2,_H,6Y8^EN;RGeg[#]GK6;)N0Q<A&6R=Y9@PZ3]BAH,b0cM
WL7<W2Y<W97A_f,:#N40O8-?(_(V0\UZ@a7F@ALKB:&cG>TW>YA2/dU^5Pf#YN)&
?8J&DAK2RdbZM6/]f2C0,:fZ=BR2[]((c]UJ[DWe[.MQGG(-P3IMP8f@4O/7\#4O
fbG<,bW?._X9XX8FXMU4b[XHLJ8C\)5)<T.X_X7_I5E4,0?ZP+5bUS,AOVP.KK,F
9N/bBM=>Ya/EWSHK+/11?XD6Z35g+7?@]a(Z#@YDYR5CT>+Fg-1&0DcIZZBY:2(\
<#YL=@>-^)?+2;QH@dD7Q19<L^TJ-D(ZS>1HKBF6MP82[/fFI83;>91XZ4_B;ODJ
G4.VUD6dYF>-^QB&.ZMK5LL?IN+E0VdSQ-Q]JJKGWV+1T.ODRUXYb?ZI+U7?WGZg
XU2J;M\@Re0#,/-&.\DLVQ1B;(aA0W4RG#ffYZ8<^g3J88dM]==1-#EJ.6[YFX8W
];BGTH<IKCO>EdX3[Ra57=CTGV70b=fRbaeM,eYM9R]N8Q&c8_2M&5>X2OdC9-[a
-<D<Je>QJJgUMG7-;(b(7&KZX>(bW;Wa73FSXP_AMWX@6\-DN[)YF7>B,/eD8504
_D^J\8.7QVAT+#ZJW.MWK<R(8GX)#0OAL(WQ;1/8IIB10N/,^BeTEK+\4.KFB3#Z
&(Y7a3(aD#LFaNP\?9)d.b9aN6O#RM1@P<Y2cE29G>[bY&]9QOFg6Y?ZUD<Z?^-d
SELP\A<LgI7XHA1Qf?&Q+/O7/R4(D#UCbIV?VG>OA;gG+?R:PdEb_De;SMPW#EUB
F;CV<0C(a6Q7CT;XEX.M)>:HPV6Udce0DE+>=-g6=;G2?,LA;+U[L2dPD76#a>Ac
HJfY_<Nee(F\#N#Ee]=#PCfb?170:5Ke@=K<CLQ)@bgAb9):]^RG?=G&_#7=B=M]
Oc6].P7Y]dbQXe)8+?26-6HF;851=6N,L;gd2GM9/=GY5XBSYK?aU#93PN4]JM:]
b;U72b8?YCLgU/=<H7CT1Ta&@^JY]g^D4TP/ZSL\63/=LH0&ZL8Vf3=8N70+Vg3@
>bXEMcX#b-A7.bAAP:+W.KaXF?1BTOe(17^LQT5V]G_?/[HY6Q&-4OF/Ka,Bg@dN
1a=MA0DVe3>EVG_X[>WcTICJ?c(-(/\b]8TDH(_:VU2[Rf5Z@ZH]7>M(._KI<M],
Z1#D0X/.aFB1-AJ7c,3&KJN]]Ag,A4eaERMJLO&?cP/_99TF(+Ue-]37g[?H#Bf2
METF14AC,F4Y/dacYX?6).,O(7]94A=SY0DdUe[T#HWf?OE9,1,/D.:+U6[N)3@E
ILBA+d<9/H0/)(ZFc[W1Qg4:dNISIR.eXG?#U_OJKJS:&Z#g)82.047Y_&5THP/D
eb-9(.((VU>[55V&a^dQ4_^R<ATgCdT^V2BPA>CO1++^0_3>&F1^g^GR>OO5Fc0^
\.VId^&EZ7)/[OA?QM#^.:#<H)@Y@K_JXb]SIgD5K7(:geEWJNX#a&ZD7X^ND#Z=
GfF=IW(RVJ36\31P\[E-e;RLfgMOF#^]O0X4?6YOd4QK:J2QAT8&7H_\&F&;O;>c
3),WS&#T_V(V/67L34ABWB+D2MC)++L@?dF:LcT[3-NI:5<A4>A>^HT)Q;,&FeVd
4#W+.Y?g;aGOJ>Z4IS-PY96[_QV@P\]3FM\>eV(BNOUU#cB-[FRDJG(3[HN7QCCI
+:^XC.+8E1UV0Y^?WC07.F8J3VYce]AP3170BZKd^dFf-/TZX?bONEgN4JS]ET&b
8b35F<T@]AEe-+g(8gW\)FC4>1OX^1/M+=c86,Icb<OaF7_cLCZM]6/HDV<L]L1U
T7<Iee3P=WQ>D;Z<50NNaUa:P?+K.-2gD:a?7Q9NJ@ba+.KT,4f;fO-29#.6<^+O
GR=3?SZ,-3HOeDLd;?:3cOF>8Z#GCMe.dYX4JBWN,:68YJXC,M6E<XVgD;9\<Ya/
JF[V?[3KXZJK05\()Vd4KRXeT-I=;O+YQSG>V[#^8<SS9;),D][P\f&J5_?&.&NL
7W.?Q/UH9&9C=b9/SZJ:4<]HQc^Pd;U^@d2RCK+PD_Db=VWL^WN3[FJ_2bC5Wd::
,6I[c@3,[eb_Z.?dCc>FG1,P/^BeRP=M<W&L1[\QPPd>L7HBF<cQF2GC^;2W16SN
.4B6)=C22#8TN9#-U80MQ43Q6)UGXPO?[</H;S_e()3L1EFDGMD)YNM4KFb3).U)
&e_&]]HXV>/S1V2GGQPQA>A0d738_L:S-aI9V1,7@=/P2Hf\@6,_SRHDP:2^9U4]
Z_EG[,>U:BJ,g(NgYIDgHLBGQN<TU_QC:4[N@T?A?8fT-9@EBG4V(N/BaF/g&AeP
Yb;gBaS4<+Z)aAGR9RVE(dBG6$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_S26KL_S26KS_XSPI_SDR_AC_CONFIGURATION_SV
