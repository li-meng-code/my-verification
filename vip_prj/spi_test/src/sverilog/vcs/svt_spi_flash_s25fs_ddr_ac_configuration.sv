
`ifndef GUARD_SVT_SPI_FLASH_S25FS_DDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S25FS_DDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S25FS family in DDR mode.
 */
class svt_spi_flash_s25fs_ddr_ac_configuration extends svt_configuration;

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
   * Minimum Clock High/Low pulse time for Fast READ Command (DDR QUAD I/O) command
   */ 
  real tCH_Fast_Read_DDR_QUAD_IO_ns[];

  /**
   * Minimum Duration in ns for which Slave Select must be deasserted in
   * between Two Instruction sequence 
   */ 
  real tCS_ns[];

  /**
   * CS# Active Setup time
   */ 
  real tCSS_ns = initial_time;

  /**
   * CS# Active Hold time
   */ 
  real tCSH_ns = initial_time;

  /**
   * Data in Setup time
   */
  real tSU_ns = initial_time;

  /**
   * Data in Hold time
   */
  real tHD_ns = initial_time;

  /**
   * Output Disable time
   */ 
  real tDIS_ns[];

  /**
   * Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_ns[];

  /**
   * Min Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_min_ns[];

  /**
   * Max Output Disable time to drive MOSI/MISO ports to be tri-stated after this time
   */ 
  real output_disable_time_max_ns[];

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
  `svt_vmm_data_new(svt_spi_flash_s25fs_ddr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s25fs_ddr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s25fs_ddr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s25fs_ddr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s25fs_ddr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s25fs_ddr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s25fs_ddr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
(UCeT0c8U>5a:Fe_31:/S/TP^AdS&HFeKCXYFfHQd03c>?&&Ce8e-)(6?U1HV\74
R3WFeNU]b#7gFQ=@J(#NG<G]SPIM;(Z9DQg]C2]d7,OJ3Od(W_FcQJ<d8TbCQ@_8
;X]_I::d^7S4KJ/V()[:4>f\YS;#f]4-<E+;3)Q6AK+>YEL^66b)d3D7#-aa2U,S
C=-L:AXSag;TgeXE3RO-S_eNMdVMOZZ:52SdcQIFf0AP3WUP2Pf9b5efV9OO&6H:
[32QV&;4e?KcBKaU99+SULQJ<X]\W0.4aa01OT)LODTTeF__657L/&?TW1,^QWZQ
K9B=G90[\;ZW](V/PWC(_8>I:\<]1d1E2.UV)+Q1BBAU_Gc+W7ReX<)J8@8g_7^R
g/A)ee<N2]O]H/,<:X+U/+DFeG25OT0VN+[B+7S0J=00U4I3INOV8:7\<1LdCS[Q
U)FdZKFF0d7MS#cWG37812dLSPBaA]])4S\4_WU2dQ[<U;^U34JaC.eW=BW]acb(
YQPgDZg=D@VW)b0\.4Y?HbNWUe?:TOf(aC7V0&gH8\)M^>7feDH]R+PaVB<=TdX\
F53g-]]d6]:QE.64M8#Pd7#;P7+UK?_O7Z.a)+>V)aQgV=+<<VI-J0@#aNLZXPBd
N]V[4GTKE.Q]GXA&0L<Ig,aVH[5G&5YKU;#Q)=<M+;W:dE6HcZ<1RM=0C.CK]H=K
/S<Hb#<OKOZS0[&-KG+IRF1J7Ff0P(XX@H4SI^T;G?]G1Y/CI9>DcH9(>^X_VB^Q
aU8^\PCgEcGcK&L=MfAdB]1J5$
`endprotected


//vcs_vip_protect
`protected
_aEJ>^F:;D,=d]H]PFQg58)dU&fGJ<]F[IJNf&=^>6PBZd8,+OKF3(ZO4-89g+G9
E]Gd(D)Sg&B[YX?ZT]N/O>PLXLKQ4BL>,2g/]T7;^U;EgX4/Z_>G[3N9/Z&KaVY_
C:88FK:HCW5C<LR8<.4=B8_36X5QKMMH#cNN8aX)0;T7O]#X9RXDNFd24HbaS,XR
7b8^_&R7ZSOH=M-Ld0]VV>2ZN]PNDU,C;d](cK7I-<(?;JbO3@PfX<)c6QL;_76c
-QWY\d]6[W2N;gN#W6e/0KDVZRLKJeAc?RGW)JQH4HcNU=_-7XTF)6,3&-g&S7_T
V9b,(C9adf,PU]K3FY?1;VVXN6=-D[#cD(#JR.dCV^ad<UWCY,AGT^XRF9818;;I
63>cbJ\4fB9FD/[,^]6C:&>VWaCacG,,>DeZEbSV&VJ;=^^9CT[d+3N2RJJ>:)f7
[ZY?L_cJI\JdQg<\D&LE]#g#35gRR6Y_1?C<6:GK9\QXX#8GdJ39/8c5.Ffg?@\7
FNBE4RAW>]dWZZcOZ\-c5O/4V[^c0EdRg0(T#:d#==-0?AZYcC=C307M>#eV9P0/
:GQ\31EEHQS9LNc?@XLaFVS=b[,>;gW.)2gYMd(^B4Xb&#8C_(YKg8G;bdMX=M[/
IAJfGW16H:])-X8Zd</[,Y]W&K7#_7#a.F#J;X4Q&7/R^ZQ2?B_4fe:KKZ.+C(5U
0480Q0\2DI_PBa[2WcMWbI?V3.#d81J2[Eaa)03]3E6a(>>ecK@4UO_+>d32U\4_
4DXQ^5e+WPJW2@,4VG+0BX>aTURC+GfLF1bf\R+.J=)7LFH[OAGV^O6B32XF&?SN
B0,EPOU](T\F8N;IGYY^geT<bY.E>R#49;/4-7EW)bg?[VeaJde+R+E6^+(BKHTV
PLC]Ib/IU?AD?U-Z#D9XPO65HTW/X@>Q?REXZPHg(DFdb8PN?dC@XGQM[L9@#4..
Nc,GZ\Y878D7^2c.U?(=+6c5+3;I<D=CaUHfH_@XN9CGG73022)dLB[FB[15@6AX
CEK#B8B3TKOaJ@W0g:NL_A=T<]fX1>e.f6[Y2UN[(GcMcAO/f6\JLWdZdY[aA9+F
=\:C5HJbBQ1^^.49E&996EA@]B__1WRWRgbZ67ADDY5R91N_NbGN2ZIGE\@WB]1-
--S=IR?UXP>a_;:_7.JcR-;/>&e1M/9ba/2IVf[J0U]@b3QQ\,\P-F=@HEgM[&@a
.GM@/EbA\1.PLZdDcPR\RDOP#/:Re5S)TK]I:FNOKg^O<89MF0\=X,\1_#R[1R:3
=U2]fI110;_9PBW2+W+EE2\1cXJ&O&E?0IEd.G[<Z+^V7L+7I(C]LS/D\3GU(^26
W0-EcVF(;>33EX-0+B+Y20fVe8,cXN3?f9?FLCLd(+c2b-+/>2F+.H[7+6)SdO#]
&F9N[9?<LR;R/RO2X1/46H^D5@Z.ZbU0cQfVF7gAS4Pa\7ANJ3VP)3:YBF;Ff.)#
O8,_gX[^PIZ7V]_73d5a[69)5+L0>g+e@((UdF+;@b3-:F.D_QZVDcd/1Y5>C@=f
JQ;MMU&<#.Z?.X:a)5cAH)7S1<4:?;R_V=?gG7a&4==T&(OF1T2J)056WN_;Z]cG
2TYDOUeA6R9ecO?e8>Ze?eE)FRP:RG)C>1&-(6X(OAB6298K=88K,a@9XccV(,?M
ANK4W:B;6S#KdGO]0.KU1@_Ic5:+^S3X?BNG1GK>.2],71AIN[39gdLODDfgN;3^
&)-c:d#8IT/3=7O.]K<bO/_I9FE?Zd^>:5SF#gOEE6-@DZeKPM[HBSB9/#+CGZb5
(;bbb^UNbC7DC]XeO:Y]3+MaQCc5=Dd9YRU[A7+D^28\,(H[,>6GNM&+@b?VeT=D
#]:EQR\D,BFO,JS4F]cJZ4+/R1:@M-1\E(/AWY5e?cU=8ZIIKS+&.^6[8(+?XMN\
2?QNR#;-g]2fWOQLZMB:aW@&?Qe_bK#8_.WbTZR0(\LM^b0B\(S&.(&d?Z_FTVW1
T?.7=;-.?#?AM.=R1SZYY8T8dcZ-<c3f-5:I+e2<9D7P+KCWAc),Ua2SgP\ZX8G@
>U_+YUN>_=\4L[e=81Jgc6X2d.O38QQXU:<]aZ?;=1&6>((V(G,0Y8GQ.5;,LR>^
;6K<>#O9O35_5_E^6D(4HgdOA-4_9_>(<.L\7cA?_ScRB3PL_UAg14b;]G)0gUR-
QUT+g\FdSYG[0;N<Kb\H674<@#T\:b8X:K#D@3Sa+)<;FF@>[YeI)UH,GWNgEZc_
6gUA>cJ6U</f^&59.>O+E/Q[gH^UH3.8<6GfV55Zf6\eUP2T6L1dZYa]MZYbR1f@
A5cT)F@_Q>3MRS:O,fUYIO#1)4-ZbI#[;ZTcP0_J>Q@_]KX+/d:Kbf/;bSJ>ac3T
U3#>)ZH3=[G]A17Y]&MY\=_L2^]A5RS>E1-c=V@#VJ/e46&JML&DVF\JBa=@^\IO
NBNJIC=::4cEJFed,:b(S/U&_SKFa_SKaX?LBSLC<\?_+\#FCCg[NTX60#.)DTD+
4[V.#;/\78&GZY,LB_1RJ,/]FP.IU/LTWf+&9=+X769Me<&aK[7[9DDbF>AHe_&U
I0D\H/X<U_2F;?+H._,-g_^c1<=Xb)):042]4LE>5\,fY:fPAY&S_VU+[J?#=1gG
LQN+XTNKSTR(+6NBZ/dJdfCMb9)N6QRV2gS-3F#RcDZK>ZK96dEIfJ0P.dgTeH,4
?#67<1\U?a138=N>62gbF4bK?f:##>T,<IHHg/+>I[^ZcUT<&I2R3R-T]GE/(NQ4
g9dCcAHS),^:+:)_+.gR.22YSMcR>+21_DeTfB56d4g44,+\#b_g7N\d<+(X:?b:
@9B)BdI^=2HM7>FfU]MZ\OQM54Y;?7J4T_3.)7fFC7.C6/deF:WW5\@cgK=9SYEA
FAX:A)bZMDPHAY.c6T;cc8JXRRF5[:+_^V,BHTdC4Z#W&f2[PJO10P1)<4CNA\=+
+2N>ba^1YYWSSf9AbJ6GNB<a^0HK<X24aZ0C<f0H(F62cH?M]#T.Q]<RL5@5S_Ud
E5?T4AdU#59G33A4Mc+E/0R/CF8C[@^ZU(\ZT3ZP5d8PE,\XeW2Pc;C@&4fK+X_D
@>3,gLba:?P:#Af[7M9\2EAbgE),#a>=OL56YC2+\U)@F1A:8,J^NEXeQ&(HXeMX
6XJV6TYJ(cW)V-=C1\;0,Y8HU3<QP)\1E;#D[T;d<[Xe>AT;RVfb?7?)W\.<-XGf
I(U>&MF@3T<J+GHW2Ug/J;W@X3DA5:O//&Xc1.dL&XGERJBRBSeJ1GTZL]aZOOCN
]ZFY)FI)#WE]/f/-0F:3(4@8F=P>P(QFF07;7L5L0Db-caN75+TPZ50/#3VL5/D9
HZX<D9/?=,PT]SPC1U7_--3HHD[JPP+:B6_IC]\(_O8-W#:gK9^U#]4Y1c-&.Y6U
;D3@JLDD#3=X6)57Y/Pe1U3dC8&+eVR/J)J[UfP\f?_,OP82I,;g[ZAZ##>Z1O5f
I1B3BV5#a#AWg2,(2)HIPb-)GdO9AOQTY<DbFWU[DQ-\G,Qb(eB+51?^OR1LR+#0
>K55Mf;J=\7TXg:];8+T5[DR,G=U#gbAF5KQ6L(U6-cIIMcG;7ZfN[^Oc//9]M>8
X5SEg;b1CedY@C23K,]@N7HR18@:R:4C/KA8O^X:+]#)G?de\DL8WQ>>N3YDe]]P
I5/..##/R@TBFQ@UCGV5I&.&:\Z9)LY2KQ^OZaPQeEO:K\c/f#MUD=.3[S\3JOdU
WN.,7d=[X-6@WDY8E3XKd/7LB#Qa)S5,(1:4B=?Fa]]WV-<aV?O9:,5437g-B>^c
#U&(QF3-L2_KN,C=>3P4[+KC?H<(P[\/E=\F38L0RJB17^bU5O12]2.-J8A2)@7c
J0>=Tc\-6F_+>BII6YU^Y1_Me[1Z1UYJ>Dd#DGeV2]^@I6^03@,(f2YKV@B/?e_a
[>+7EcA6B7=fFOeL(P71ATQ^2[fU>;Z;eX(,7H>G:Fa>]^NT]D0THF1L5@>g6VQg
;98&)0FZe+\U[b+gTNL(DKJ9-f_2YK/G+O7Ye:.^P+6M,2G=^,,Y#9gGQ#>^R4I[
>dcE2+I+D7d_,8TRJf8Y,>89NT.>H<Z6@+F\)7?[W5bW3K.S&\E/Ef\aZNDD1GJ1
B@^2XPL<[.:XBg1V7XO8,g8/4=<<<NBP4JXQ>R6HDHQ7.9:YM-<eF^f=\=BRCQO-
09;Aa=EddRF.P>25\]MKLB;?cD8ddU#[\NGR;0XATSF:C?9[^RQF:2]BEHgRRXU^
>I(?0XZFJ0[@=WEge,;EeV63062YITFIP.-UDYeZI=J>f@^F)VU(ef#432=AIZLS
fYOOB1-_?3a-[P+d/LZ#WLG^0\0:aGHJJY:Ed]G^C-EE:Db1/><4f2gC)J2[WTTI
^U_[?PbE18P[L-eE&ab5J-g<ZL&E,g-cQbA>PbAFA6a3?-YbeZ(dH(C<X(FYD]\-
752Q1bXGNCPGXeb:[;7EbMH5bG>/)/9eH)>XdJ:+D3EaJW^KO^?W+?W<L(-;>,Q>
e7FOTE;XJe>M;15^-,9G[36Na,K:_^/RS+cM4Z7JO]>a23ge8f_eJ7bKW=6[LE:/
FPA9[TM6_1g9>fTOc\-@L1K.0>@C?C\AD2dSX4A++M[fFgMWV5,ZMGF8&(&#K#,7
D.T_a/Yc_X5Q2d,Ab]\SSX9JWA\C)5.-Z#<cJCJ(4&PL@.XK/#Y_;@]a.9H:1;)#
HVV>A.T_gbdJ_6+eNQG1Ka-(T^K/?EL9ACW.K_N15LX^/.4R_CA59:LF_e^E?]M8
066e2&-NJLK:J5<d=ESP[8./.V>1H>G/a)F\3eceQ<OF-d\83(c)=4ZMM#-40WCX
9f;GOK8.#CR[Qg@7>QZHS,:0H&K7XW((_TDLUC2Pe@@d)B^^Z#O1F_dCRJcSOaS[
9B/:<<b61Re\5dGa9&?ZNdRQ+C+82.@QK)cH#4G4M/VJ@X4VFG9.SN:]L,(Z_+\&
@aKK>&N-00eg:D7J?8:Wf@\W^R@J[[S7aON4(0,8=X,M@+.JZA8UM<Tc0P]gVCcS
V&SLPCD2W4R#:d0U=Y/0[bRe2@?e0JaVLGK@#I<N-e\4SWVI_aV@>;5-^g@@=K,Y
&FFENL1AbZf&FE1=3DJ&cJ^3g<fZ36<./XU5299M=a=6T.8L<;LdZO==M?-FF0,H
L6VJ/>CW(U>4d3XNY\QZPc^gS2G<:?A3[gRX?_/R80+\7G:^VTBO[R<6YG,3b51E
YG=PHbEVbM9KMC,-&#7.+LK,U,46+0?M_J2U\=#]^AX>/000/W>7f<>)?E/Q@O)_
L],42g^F[A17<3ZXZIYe9DB=DA3/PA]OT,9\3LJ]_C,]N6]DO@OfEJ):Ka^8-eR(
T[43@;<C4,PS77<W06V?/b(V84:/NH=&,=V7@\&@1)8VS>LYD16@JXd&N#5D\f&]
.,2@gT\H#@-Q_d]+=F.WPc/LA#VO^2gV>)]Ef-@@9PJLNLW:b#S0gA:U@eJ24H3+
9VE3_#1;T(W]a+B]Y-U0U.L#>M442.ENWD&/;K-gNZf[X:MM93fU64IBdVFF&RDC
#gK)N4b^JO35..H;]PHMO(HJgJ^G]:X\B.1>5[4L2PW#?;;eDKU(]dfLgI?6-16U
/?2/f+(b__=09F(WO(DN+7MT4NDG\X,gcdH-6CWZ[MY.e/BO42a7&eW-Wd#IX5#2
N(_KYNbegKJ#_bb[,04&]4[KAeGUV.84-WcLM]A]5aUW/9R3ZX6MFHeSDbg5.e5c
A;/F4Rd<7f5==:1BD3:VgATL<IMKR-VIFOL;3_Yb,S2YLf6J\N/[<.WF^_SeFWfU
1[NdM@ID1_17K/ICeHd5X]gS.=EMIe&;:#gHP-S]PAXJ>f7+0>-V?5KdN.eQLJDb
4gEfcg18IU2\.IZbU^6A1N]M3;?Q&&fP-CLRVR>.b#],P7.7U-(XP4DP>D;\@TB7
.I\R/,I:3A:?dd-MKRD8.V=98?H#B8EC86\+PecEe)+?#_7^.KYP#CKgcHV9)#bW
5NW>0b,F>A,MD5C\YI=8=<4cR0J@aCL&B(<L4UAUC8gNZ?R+4BGT=<#2ZW@]S53V
D(F_-a&;4QRM_dd8NI@U[bF0P&^4]VA(=(cDSbd<.Dg#:>HGD_P)G>NS2^3e/6?S
U:A(H@b^E6@RTULca6_91GQY)U:XK\RPSX8.OCRbM+(8F>T;Y@JAJ4f_=Ub74&DM
TR^fd9KW<E?1fbFKC_d50IYH9S]EK-KF9NYX,VMQ,.JC7HFBd:58(PD],-#W4@A0
aS&E<1SCCWccdeTM6OTK/;VDIRWJfTdSR#]N;@Ge<C[/ULG43(a4EMeLX,D]5A<Q
#E#09NH^X[=:1X)FP0P57b5>&ODK&>SJ\#L(L(ZX7<+/gV8)\a7.H;S^#f_fFZ=,
N[5;^FROA70BIJNb<;LS\QBaDY]:UI13P,S6-B8a,Z5S@e@A<35bW+VYfg7<B0?c
&V=O9>@^B)7LB;b@.L]?0dQ8_/MS2>f47STTU5X/,T^Q8R(MLVg6[LQ)O9LV.c#X
gIU[JONC4&@0NN?+107?LbA3cC<,(^B#DR5HP\HB(P)7F5A63[O,PJEATUTGAG^C
9(/\Z3g66)0A?CG]-TXN92N1:1Ac6G5\T4_SXB&\6Kd@9]?VH5/MR-&^10O6V,LI
d/0R.GF]T2UH(-]2HbFSH8aUH4>efH>0eIWa=L_:SJ]e+WX<([+_DFXdg/8b@10+
<+X73#A7GJTN4-<ZgTRT7f;V;>,+;+]UG&_968+#7;fF1Tf97(+S?,4c=E<ZO4&#
QFE\Y\T)=C6dX[,CH:9M_&c&E4RI9VNcSbC&SN)V<5XIT^5>@\dSJ<)[NRY-=P2Y
dJUcJ_)@WP(]C6_[URc8CUXcD,B-D),E8L@c;=1a@0^7aDYgK?.STCa(JZeY<=D)
99JT_8HF_+^b)M:K^F1f&W.A)e?5TQOL8#_DU+XDZJE@.C42-/)M2&e&1f7V]:^]
)bfc=D_+8BP)\/b]eQY-&I<V3K,1.RA0=+8D^bOJZQ)Z^^MS9aPXd@8]/e(#MVX-
b3P//OdZO[MbE.@7Y+\.-YI.BCd\XH&5N1DF4fINgQV;>@J]BFO]a/.L25DgKV_V
ZG&)9,]dPg&c[^b7>?2PQXBL>)BJT(((<DFJY[I@)f97(INBZK/E\GLgd(BK:&:H
4+IM9S3P5VAN:<fAB+X)K;_-BB^U,[/OB;e8,RK=,ac]UgB?CK_VAL,baVbE/U\7
[4>g&1TRW<+b0NJ;^[?/6S@ZAQJP/6-500Kf8PT4_/X56=#Pf?81T@ac-G0^C#NZ
\@0/XO?@_LRG<-ZLI\NE^g<Y\+W3:aAP6W-/Nb-YT1RIYOV(G,P(/@G6HSG1e/O,
+;c?X/NJ^8??b67/K,?_A:PF\GT/f8C?@7A;PWHJ_-TOaK5(AUDLd<+-)CDCdYCc
686J?4^AIXabH64C-K;fC,,<d<L.LD3a11M=#JAU#,]]9=4WFe8MQ[DBO9<63]#c
Ia1X9VE=e=^O7cA3;d(DQQGE#@R/3WPVb?Ze3-dSD9+#KMV-5LR&OW4#,]?R1N)4
@665;AT]a;d_77&=T->E,d3=a/_UN.207?faYd1H^bc#.60=H_g]eK0;F[2f:]Y3
<E^;+W/,^5g\E=:KRW8HNbM?9?4Q7cN=;F[cA\5E?LULVU.X[NF6NYNa05J<N0A.
46eg2-Bb>P:1aT&O(Z(/^4LcH=UFeVM;A)a/A:95&[DI/[[+JK:6SG--@YQ]T3/I
Ie1C(4.M0Ja5#EbS&V<LP7MWY]Y@&d7aZKNZA1?eS@fQGZ<97aRbX;KeZ2^6?ZB[
cM,P4ba)NDScZNe9BEE[EQ^<Q8=b&QeXQd.T#JOU81>&5DT4P#3&aOTJg3O_;8:2
?\=]0H>O,..:7)]689FTF+F;BQJV^5fIaV-Y5g^0YM3CcC#-7dc5Q]LVN]PMPBDD
7](25c5_L,GB]aX<;,-0ZGAb^-8QN4VB36bEc=\e3d]6CN4E)50Sb@e\RbU(RLQZ
-Zb(]T_a7&@:3G8@6L:dWTRfeaEN>f6LLTfJ))U^B(^,<F[P6\@b919#C71EU#^a
DcO+?+N7EG@OF-,D.J<UfB<+D&]CV:K+R2-SNQaGe20D]I=g8NfT[HH53#F3?HZ;
OCaB8dKK-+Fe^dA]WY-(&U3P065EeWd0:NC22J7aF,(6NLES#)R1M(2;,GMUeFPS
[Xe^E3J:MQGe;9@^HBCKcM>-?d3UM.^#QQ<0Q9;J[+2;&8(@^FD-E9/V,7,dVG5E
QE__g2X);9[]X;WN7Z+@b(TG4:UbWV6@3[b3+T,c(BR3\V7CVV96<?0RXf#:M2Yf
7EFCBBDfd15,,-\.)O\RALV8-c:0EFA]-L[3b8EYOEX]AE&Z\#QW7P./Tc_d\?fe
Q(+a\V,ZZU15F8:H;M0BJ,J#5R)g(.^,]4>-g\8gZX6+N1ET<_J<2[]59d&PT6WP
>bc_[=B59:O;cZAYNCKcKB)1??BP5B&-.</@d7bEB]LT_K8\.SFNbc2b)_S97RAO
+K.-_=fD3.\3&:=NZBJB\fQ:Q7T24IcB<15Q9=E?Sg\6c(G<-O&^@Vc++9T:W@gG
a1WZ@+DSI#CL\C9VM#N_(WE\?Ha\.E&NdM,=gD+1P4Z0cbJb/<?&4=&SN;:Q@(XL
89&cH^O&X7,9ZXI6I[T9c#O._Ud96]/C>N&#?GV<F(8K[Se02B+HQSVSI6?-KOJM
df2V^>UJ6A)(FK\K?\aI051[MMX-_OaGY<\YKecU^--N:ZK(+AgKe,fH89bP\#I6
X@;efXf,\TYF(3II7LU_?9@33gXSd2,TcS_;6Y6;1Pb.1IV//VaJ\E@[3?K(eHP9
SL@)U=9KRE7_T)2)V_54W)d>-:BbB;4;IRMa.1+MK6@9aF6GG_T?#63]:F=5T)@A
>CT9&XH)7X)\aRQPB8M4eY)dEeX&LD7JSFOW()dP+GTP]1CSROAFAa6d-M8[[c:@
4+a(-2e14+\2a=^0bcPF8JM;=JdYd_B0Zf>=@+QM?8NfH@30N\]DV\PXVE;O+]/>
DeA95(IPM#4,b3bbc+83S7?9D<RVES=dKU(=479<9HNR[E,A4Z:&P26>^5f>aB;&
3?X^KcD=>/Y<-UgMKMB4/JX1BcP6#>NcC[/O<9Z8MJ?-OX3L0Gg?G^_16E9^BXg?
aH@&N&WM#<[GFO.:C@QeKX7S_/]B230Q]BNFfL<[#[NKc@C9I\dV_8dG9>-Y-9eQ
TdK\179cEWaR,[F)8?1KfX3R.bJ3:D6-+BU58)A.>.8>(+b+bPY;G,9OY[D8Df/I
4,abbSALA:FADEZ&MEK(M\Z_9+^#4Xe;@E<V3LDCc.F/-LPRGS(bGM1dROfc8/eD
R,E,;0D9JYcRaY#>P/N8@&(?cRQ&[@H=1-g[]SL,LL#Z0b8\I\2K^YF>[N;=?1g5
ZQS=SV5)XJYCAKZ58R\R=NUb_9/NgHQ>+.ZE;:#:a]/+LRC.UG:&?0?_1=#O)D<L
?CQUE-K<0N^=I.A_Z@/\N0B8I^8_d]#=R^cec,ZCQY&4Oc7de7c7?Qa)0cXW\-SZ
\GMeYVc_e:f0g,L99bb)ILf8)-33+DB#<+FNCGa0Kd1::V0^d&2UB7Y7H^2[Qa6N
WDYR2K>+SZIV@YeG==CR\-()@WGa>4W^J;W]6DP\>7f#D\Pb6eT_aKHNLKI,Ze>C
bV98J38\]2AI:gO@G>g1PWD<QV<gP,1gMC+^\YIR>I3.XF:(PM7-F]BMX9f2K[@8
E3;@IKa/<F,@bIFM9K8f5909/?Y2/2.^V<MBG1E?EN6&VKg?RJ59<4Fa9M?Re<80
&.-dG^Oa,=&)161X#R.G=V8/PHZ.c2V,V&6W_BXdT<4>CXTSaX\=.O)AV4[?O_\P
d:BX2+/[4W];&P7C:d^M/a&bg\GC&aBAQL?-QC;fDF@&E@CR5gX(;=V];R+CbEG1
80M#BMa+I[>cSG)U=\41[)WA70W#7V9I6E&/>1\/PQTU4S7SN#I4M7MSc)?3L4ea
BGAdIVTB?MQ<HdK;D:bHP+3>@?.15Qc:<LNK.:.Ba8O6W0:SF:=#H,JcM:CVAb,=
BNAbRM5e>)Uff,3/f:(R)&>8[3_g<X59b]KCY)5LeV[D1@ZAecRQB@d3#>)Kc&bY
O968XNOcO1MHB]/S,L;3b;27P3OeF]9f:<YM/UY)>?Y&Sf++?N;Y_RL]@ZRR0N)M
L]FVTcJ/gaQ<8f=9XZRP@->XeQ#5+;\1^:^AF5Q4\=O&@g:fY;fdeb1QbBJ@ECbM
EBI/[2Cf6J]YO8RdT,RLee[4#0Z(:9^,f0=@J7(3+.S_5aP1NQ5=(/]bNfBbXJRZ
7PTPZ\N4H14eVJ+N92CafOb8L#3W0N\KfB^MP)GSO5HWT@48#92aILGX]\^:>ILf
@UK^15/gKNS>W5ecc#)Z<W?e,._08CYVXV,WFV;?QY]NQZ>L/@<K@:\1+X&L0a<U
#V#3BQ[.?CMeVVYYW4;.5e;-gB]\XacH<6G4f9#AbJad=2Ff?A5S>G4Q6X\>b-UX
?V;Y@?Ca;Y7J4CG3]:4V28cSSUR+P:,C>AbXg493Cc0UC?AH1B9]>@4ZMNDPDY+g
SP(9[14.gJeOVE,+FX@,[@7/4#f@NG8[GB_[e(7D-R6BZ7S24fLMW&EVdR06^0>N
-IS/d3[+bP^VRaI[QL#C_fQ#2J?YgdIQKQ<\XKP8Q_6dRa+A;<WKTJ9>4eP0D?&9
0AOOSb@ZK#(P8gA?/Q:aVS9[3>,gEON,/DFX@aTHgOG_IE&A>eIa68b_F9V(b9W,
O^08\&RV?a.1_YggPK3P7^:4+SaPQcZE/&O>;G5E^1\Q&R,=@e^?fVG>/R&G2Of]
I&cU-7OA2fJUIQU_B89\Q.Y@X)LCI(:.)&-?FOOWDES[;-,?]D6S[K2Jb29CJgGg
V#W:Z/U+e+GI+Ra<.[[>Y1-5eM+.#\DQK3=)M^]Z.5V5K-O1:-UF9T2>&(KV^d)e
IUR68\?=>@e14EH+JH+WMMNb+G<T:F=1+T@fb5[164-VgeWI.MTfG=P62A227OWC
3N.F#R[HP#Oe/Nb]LfA.Q6]7e==8NR<PgPB0;),_,K(PFGDY^eU7;-9_:QC7X.X0
PXA6@)Q#0bQK8IPAQ]-_K7(G(K6_Zg7LLKNQK()bg3#VHcMbFKRg5M+@N95c>2TI
eT9:C-G9&CX]2A(:T.Mf7CPXPb66;]2WY?C5#Sg<43DIMc7_Q6S6NC=7BR\[gO<[
cT^;ZZ5DJRaKgU6DdFH)PPX;1-B1O_b@L;\_YL=YTOg5aUTJRX^/4O>aV,H3J8WK
LV8#L,,A:87G01<,5ET5)X6+=KDc-_8X_+Z-/fF.NDDND0ZX]6&:b1#_#0;3=S>a
>JI[BNg:&>^b?0-X3RXb@,QQ30GSO=Qd?YLU@?G9UJ^V>-:P6OPK--JG4K8HRT14
8Z1_X/D23:T;&I#e<-Y#&9bTD8U85E4/DgYXa/<YfXQ(=)G8UN,-R>S@?#O-9X3V
+S@0AK\,b[H[Y&O;=)Z=TF[(B9,W@Q7E]OZ43G=db7EbW\d;@GM@:Z>Ua)DB=I1[
>F/WH\@./88XBMH_g:UM2?_A\N&_+RVCLgZ20@ded1D)_H/Ua(NHRfIOG5OS[KEY
5UXW;-V+?eQA6);2:5RFP\R1BX3[IG1MW]RY6ZfSNP08_UE)B8G-S_JIESJV,,A#
La;DM(KD;G1,^9EGF]9Rd\-fJ-,GZ(7#C[d@[2G703-UcAK6JA)1M,K1F.F9da4_
08M_Z0=@eZgaP95]H5_]F[FeL15Y&Ma1W&M>#@VYCKD;YC\Vc0S@Df_&gRK4YfdO
?Sa&G,^IdWd=C,+(S^>3S9-[L),.aVd7]);a7-[[LgLB^7GM&]Y+@A1/Tdg94?&f
21XDG9K+K+)\/V5]I^a+U7f=YFUX=MJ.=N3aEZ74N#R&[HTXU)6C>3=Oe/^&_ZUB
W_-H#SbF+db__>@:A+?ZKWBNZecP[ZdZcNYVL8&_:(c16?a5TE,LE-&7)gC8&gE)
cMAQ69J?=K7+QS5#:#bU1<ZA@.,:ee55aQ__.D,#gcGYQc@Qe-V0?95JVRaf[c1V
8C<#WaH,[fF6YGU\S]5?eR?GAa#VbJ=6FEV?LP;.c6-&bMS1<DTe[G3QI/]](>NE
]<,;O.HRXCe+WU1F9>D&#3]P<6DcB/GP;,:P)d3?=SKD=Y_4<QcT,8RBZ9DMSQ&6
VI[LQe.S,KX3XXO:<2,W/YHI#0>X?S^=T/(L:TDI#PI?LbPFa/7X1@X=+Z)GG)8^
>T_QA__9-e^YbKY+]8^b>aE)4U==O_M=LA7FLEX<3E4IO\NIR-0d@<Cd.6Q9M9:W
OBcHNFU25OKNb2L1IZfK5G>UQ22M[_c=2dV5:YL(6T/:dYc]@:5\:@ReVF7,.]/L
=:\^(7V<V[^VLOE^^0)K;A;3Je189Ef1M_E<(EKU<D9G/W]0+aIe85[MBW;d]gD^
3TGR@&-ZL/2X:6Ag&dKQMOA;AWDQcV8Y5T.BDd>HW7)1O6;6;F]VS)a7f^QgH3LT
Z&a/)DdBJ/F4_=6-RFY2]]9P\47CG/NLbGagae_e+g5Z-GbNg^4X?^\J;UA(#/df
;BZ]?L(C&WSAG8:=@A((>FJOBR<ee:ESA5A5bPKXL;@25@+SZ7]DKaJg4I25H&ZF
FQ3>7<&4^YSb;Q=E.@(VS]=DbRg&/9[1YTb3]58A\UO2BBJ/YC._UDU6)ROTa^g8
CGXeS(eS809RSe43<@,L,1Y==@I0_).[((NQ.A2EQ@2c_BOGTT9Y^X.94[_JaG4X
(gcb:>DbIc:A=2VJQO_1#+OD7+FX][3Ag0J@(QPN&cS#20L)R140eEX9&A&+Z\4,
;dGICeJR\J7?KXW/OT.[420G[WPeR;F=fgB12N8CA.GX#D9BA\T5=K)Zd?_M,JbQ
)_\=+JSP3/\J?C2R::>Y&YY2dcM3S75W@</6Ea3]g&H8f</W_5ND]_05f^LZ2=Ng
U4_d(CA6HGR]>0a7V)5U9F7b5OT..R:RXSX)M-+gE1[.1d,c\M70]DD0YA;)R^ZM
CP>,,I#US1Q#ZJ)VEAYW/M74/,_5[Ld+/e^5f8MKY9[?G?9)f#LDG4#ZS[P4KGR6
?;bM0CF:;C#\5VLU.N,ca#3TYCa&?.0(:I4CH7OL5OW@74Cac[#e=de0EU14PY0g
Q,?,/WPX3IYEJ6SNHTGROKW:M_K()SdKKb,TgR_-8JZg24XCE52-&,A;HQG4g5:P
KPBc4fYN=-32H+>DG^^..0><OQS?>+9C-A:.-Zdc96@Y[^e>aS4#Nd8Y9f__YUR[
WGYB3O7S:bK,9AGd]X?FOcO(X&E(PgI97XLM()6V3+)#^Z:Y.7N<I^TNV^\5gRbD
dC+LWD8fFNQ#,REgDcU:D]WU;J-9_f7)O[cCV[I9@UP[NW#LNI^.\-WM\WEK-M_@
fVeSMP\\\,809I3aX7AU;A&SKGQ@V=.b3gMLARdb_#(R/NUX^g;0+D])G+\1(RfC
KATE9/XcgZbbg6+cYG?:/5=C#1_U+INUP]fXd/cJ,7YSJW2BR&_MS5bJdeA;WQ@e
[ZI;4=#KW0DIdgM=A3J,FVb&AJ2SJT88I&+8V0)L3?cH56X/G=LY_+:Ug:T6<?#O
)#Vd6>1U-XY?V363f0;bV1G?ONT36c7de]ZUI&OVZ4I.W>:6B.A.gV;(=bb.,JXN
J-LcALW29MBO1D:GHQJ?aA.AgYb<^HOH0HCWSfMfB0EGg[<a,YKI^-.O3O;:g/5=
a#U60;\bg<g>cV1NW.SM+>(;J_HZPO)E;Z;MI<7DJ7g7;cb[:,b77gC3LSgYWQab
PX6<S5Y;e6+cM3>MB[?7>-X.<dNY?VXE&#9CAE@fT/?=C283]B;4-V3&#JbZ&6=/
H,^T]5gH0DQWM-8S(WSV3[^FZ.Y3VM.BUF#R\8=>)_CF331f0Vc78V3DX=3F=-S=
F/_Bbgg][BZZM#^1ORa&0^Bd1Cf;>2,[,bU,d>fF+bfg<ZOM_CMV0?K>+1TF->\X
Xe[4GK=764(I2=c::JCK=2,g84BO.&UQX@314J.>PI^><afaS0M.2:ZU^7).LR2]
gP-K,)&/cQG[[dJcc>aW9HKMDG-@_O[M_,^\FZMV[Z[Y3H[3:YSdb\5.6CT[GG&O
OL]GJTWKZPSaF;@2[AY,=g3[URd@C25f=8[54>V,]/7fg4./VKgLfCa9+-0.UgX1
.F+#:,Z@(P1P0f/Z\,eIJE^L?6(bD#L2;1P\51PR/FW##JFa-8Qe^?RGU+b?^F>H
JR_64YDT?V[4126_^<0H3J.^14@HUbO[I5-ScMT<-#)I;KPIF=F\\ZTfQYb?:QS/
:MD.V;TUQ7KCLW7H4;Nf->A9(QS0ZXCC/bb][fC<Z?[,9b[ST:c0cAG[.T^Qc6e&
S_Jc+T<)MM3+-/EG3JebPf)&16H>S[NI4-K7.?MCbEFGD<8ER7G[cPNBM1fKbVHL
3QX#Z[e1OW:Y-1c)YY#](]eTDQT3?Q>;AaR#G:e7S9&[?+Tb_HRM#AZ+SY3:g>F.
@#]b0[T[bFd+@,_4.2@6MVE5]gN;Hd2)1\R]3^?N<VUbVALgAA5/.Z<&G;[YG8Oc
QR>X6dMIPY,V]:^S@[<JY8PAZd(\C.M:TY,=#ZP+I/=gfMAR(K7Rg]Wbe5C@2-fA
PF1NEACSfZTAGH]DU#Z:ZU+?</CTSC1B(:[+;2DKNK+8DP^;(ZVP.(R4=S^Y0>?;
?)^WTKXd)GMW3LR<S[L.e]ObB)MKAQB.d4,BTDKcMVOZ15IP9TN[/JX<P&I)DdW&
V>F-Nf4S27<:;#T\8R&6Y(S&W0RE<@:5Y#FOVR?E@aEXLRS3TK:d=gS5AN_A&_PU
91ba9&#dU<UY\1N;B:.R]-P1/ACfM1&7,Q07[U^[>WdEX,BS/3A1,5A[8Oea=8DU
(e_+4U@eBbE>1PLTCGH<SGCg1:V5Z8)1Yc<X.,>]E@4J^gePcG2\/A#Ma4/RZRQc
O_S)c):WZ?5PM^XM=Jg/0#A(Ng;2eO/D^;M4[KFV;3-73:XPOHda51C9D7&H[/c)
fC\1+e=;R5g4N=JaGKBT^GY7R7;Q]IQ(1E3fBeR)K(@eK@0T#/T,(-]=e]d;MFU/
S#CY\<_b<,T^6I2?VL>VU;A<H2f^L6E:1C/[SK1e#OZ[-3bV5W,Q0fgU[[^>=IO,
WIM/,E80WB\G62-)KW<OaA59\gfTPbO<6,cF\WDUC<=NL+X?#>>+f0IABR#L4=^I
1UP1V=g=B,+d>eMEG81GYd7Ob;5c5[.P1U_?;>5E,JK/CM&<Ye@fY8Y+K,-.\\\Y
[[^5#?M(79MUg=-@@ZN03g[ELDX8^]LT--9g]0[6RZ2f?=E=e-H]A[7681?U:5\4
U)I04f+=YET1#R1V[#J[TOg5b^+\VPT/CX<N[^bA:a;<CY-Wg?BZN<[BD,CTMUG1
SJc&b7;&V;1:#4]EcVX?+<b-^886de08Xc>^U2T;HR^0D^[IbP?6F-\E?fGS9]AZ
d\77R4-0IKe)4fDF#Lb3]8\RAeFI+7T8-@FSfS=Ye#JX<\:+6a97C?L:<[0X\d>a
MW:0NUNAOR#^B7:P^cWP,RO3/gS7#?.9CL@>WD508(V#W(Fb59RL+eQ?CA>6N/E1
78H7AWJDZIK9cJI5KU8+#M>IZE&GB/U&3;WHE:6-3K@>+S,OL#M50Vd\H+&.6CS)
+SV?[Q#GfMROUI2PJ\gWa4cGXfEac]9BdQdJ(MXU/15V@?dWSL54AYa@R&bY=)J<
8TfdVGB,.<],a4#b4-_<=K@U=NV-+260;\U1da2.>S/E8?4]T80GM+_MUcc+0J/-
[LDJ2_GI9\VDd/H;^.488+W(7WS\DQ6F]G>9-e@[\TCg.=#NXf3c+1C&A;gdZL2O
GGHVS\&c\PVR5Y5+[I;_&aCAL8G1VMab,Ac[,DUIX]e2ENOfVA#5Sg.VQ\OHa.I9
.QTOb[T7R>,1DC__:&8-@L3W1O+8L[Jg^@+DP0I[6F0=fR8HAXQZ(=LHHQI7g05&
PQ+IFgeD\FaGIC@=AeTVYP:9&TO/g1:[F);eIWZ3?LZ>4EG&c.MU]gOU4+?[AK),
87A[+1-NDG#1)I_]@Fa#gQNS<ZB:g9Q+?Q@:Z1@X@==29MTOC2eH=<5X/PLc42FS
X@GNNF9EG3X7/UJ76T6H\37g)e0Z8PNf/>=Ra6cK/]ALL3/T6aU2.(e[E>OKFJRD
PO5Of(@XQET1EAg_T)3d:FWb6#BMJKBagEEgR2gbd1UZ:]I&=aaAcHF_(4Nc=]V9
W,@GDPO2\M3WE@=R1LJP+CaFLd-MCa&=9cPda.R:PVK(A<B#.A[U43dCO=3EXb69
)HD1?dTaeIJNR:6<OVALA46He.dRE;#0=Y-feTINF:cXg(+;9)<OO_+>,#(]7JeB
/g?-W,E:J&\(C5O[@0CY5FP>=DBTLL4,@V5(6BE;C\QB3B1LUCR^I<8O\RM6cB).
[Jg.371W20NO\\:>Cd#@N^A8T]+7G1^gYT^<48+^ZOG#fF(OQ4?7RL/cEH:;8Be;
ZCAZNc3g8A<,O@0[5MU3-QPX]7FT@_A+.]9ZQ3C5WGdUSE@O3A7R=E6:^OfYF2JT
#:O9#?Je5E.dAgN\e4-VP9/P8Q<NCgTGI6N>K<_.[7_6E]6cd?=g<T^-U>(@Hf^[
O.)HLD/P53[&>)A4AB5EZ[:3>:QEIcP5;IYAHQ#R6bI:1YUI35g),7)L9>;ELZ6Q
E?1::;b1V@/XCX113)4Ve50H;A-5R,fMR2,#-=1HZNK5?[?_PGd[.&B\O/NU8]<c
G-W<B;PDa3=3W?T.7K\S.gb3@_3D_Hg/O]\U0:D4;QJOND3TP^&:3.&:C56B^gb#
g75-.(f)JFb;J6;K6#XH8B#MMOf8a?0T>)Fb8=(2EHg3^INI/I?f=Q<,_Af\M\L&
+#=#RY&_T_Q#_]5V9(RbO.dSO2G<:1SB8bVEbb:[=6/)(3G=L095\<MYJ0:caXUV
=C]2Sgbea18_#9JKWEb#3/DVN>Y_G-I90N[P^UYB^9C[U63XH5V])6<XQ]b_Ad;[
#CK&ObDf+\b?G35SPe7TD^1gMc<L)f<eCB#B<XPZTE5b7XNTNW9JZ-ERW6MDQG=B
>bV\QJ.WQ_>ZY+Q[G\2]S[1WLfB+\&L>:SM^XN>C:LC.+eR:IR.R:H1>+(7G@;?&
U4O9I8(/]UOA@@Zg:ECO?W@\QF66>?<8;+;Y?W./2)U(L<;A7aF7RQ.f47C]\g&M
+I_SVC]Qa;IMfeB^1HP<LZ+@PM(Eec;N9TZM2,3B)aY(.T;_&9H#H@:VL/d&aS;.
<fX-PeUf]SYb5LUfg97+2B_[=NMDAPB_(e-DVg\HZ/>6e:8e^@02NE-##@gKda48
&U4Q[NbORa#I@Kb,[Y^><#4eDLD#;bRaBH69T^]=]HgC_;-A2A_1A,;,>HgB)]NL
V(:WIcE9e2ABSDNLVef]=]FUXa[-\@5[CDM,D0AO>K;&WcC,^<\]X>=,a/CFb0+H
D.JbRMQ<XRBJ/<X.7N=Xc>>EUXaS4/F=;V,:^-gKe^>EN?\ADRKd5@>V29CZ>2g&
&M6.,/(ILLDK\?Z;b<9CZ,-KVGPcLX/)(GcQ4-;e@,;VbO#<)V;Bf-2Ka?cMdRW\
A2bdJ12(E/3,,]SS@SY2DZC/:M\(MEeeOAGW<4-\O5QO2&;BGM17N@SA5XFY1E;W
.^/NROAI:SL]>U1K<1Ne9[:W/D1=5e@Q&O[7FP#QG+8Z+8<D)777NEbBI5_KN,eQ
LLF,)Cg@7X6.MTTdF)[]DZ_QWY^90=T#WJ3A:/aJPW&,c)fYBdHcSOFAQ7(;W.+\
fJYJ7B))DQ95GPKT09@ZDb@--Q2W+gO367=TTF@^2@>Zb1XPZ3U\OAEDX1fWF+)@
SJ;EU_<F4<)70U\3F03.BDN2DO5c7.;&G\b1X8Y237>F8\#fA[1#cIfd8&02BS<B
P4L-C;O3)8>b//cD&0g>O)8L&WS\I_]^cBg..bHJNcN[MN#f0OXOJU9e951V.M?7
Dc;#V:S;S:LCZE+)\H@1]&g3L,P3e=-Q]CVUK5JU<NE[T;fLA,#K&U_CP_::TYfK
-OMHI-aM]-+)?7SNZ)K9T6INbU.->aI7)Lb\P8]U]M?ZP9IGR4?.^EeQOQ4Y70<7
\0N6XYU7UH1bB?7&K871->&J[WZ?D]&MR)aC<D+Qf_,?P2aHeQCY.,45g8fHG:L1
e/XJU,V0:6<5)#V^N8/1&eAUI,(.,RRV5ObP[c[OA[S94?QXM?Xg&LF>_->A>7J-
Q-fdG,/]dcdT)\^:+VCeZ91@67?\9)<_-.8_>:=8MSKA.?CIE2#(N4#CRR_]]-N]
:-,5OW[KU5.MR@+R?Y?J/3FZA#97.^JE3KgNPF>V.fM@74S#7aZWc/NPRWZ:ERU:
I_U-<b43QBV><K9-e^/M[<L91#^WK]C7dF&ID053]BG>J+[4I2:bG,[IKPD8,5BL
;/O8e6PS:Q^d^Y30YKPC:d0;)W<bU,95f&\@EPOLCVI1]R]?RNM0bKZD/J^3.SP(
PQTU&;aa6SWe_g8#eE@^;;<H;/.B(Ub.@b:OYB6UB#dQTG^f1EICCLR_)UPW.?8(
7>BQ&N/(.c#Wf#I&UL6<AMCd&HIZ(4f#,N,<0M26U)8C3Qg\RQ[FAV7U:^5<C^_3
=SO[Z3fMIZ.aIZB\EXL8JHaDWETV>6L-NQ+cK=gX\cI3/QRX5M<_S3^^=(50@L^>
U)03<.dLBaWY&HEYUK>Qf&5WF0Zd_9IFKD1g6ZJgOK;O_LV:>3]8;V+CdDZ@cQd(
b]NVbe8#=\2aS\1bX^<2AW_<9Q?Q;IKK^J4<a(&YV5H+CNME^?-D)<^bKUd[@OI_
bPD#:);1K&&W.Q:YE85bf))AOVJaYQ/ePCPVC)209]@]d+N/S<B7?I;#bb@ZfPPd
./?-;NCRAgR=M<FUFBGS;,+F26+]N#],O8XNZgNMXUbbQZ@@]=9.CDEb9Md61V6E
Y;OVGI&K8A?a8A8I,92a:9,#KTZ/Z;]O-Ke#)^@L(8c]Z=U3CN_ReeOO9S]4K,EB
g[^TIN=S^9;,#9<)Q4IX-ZgN\4PcN-C\-N)WBc1cKQ?&^B5;72cL9)J+LdD4#Y5I
0L0S:W\VKf+DC2/O4\OTcI]c-=:?_N\a3O.bEK2c(#)L+TX8HL4^V8&FAc)ABaZC
)RgG-796.:^A7ECgdcD?GcZWaaRD]4DH\)0Ee?E/JaM6F_]&[+(c<.b?\);cMB6\
)C4VT(?1I8aDNbEA0;G=GGPbO_9_5DcI/.8NXQ#&#](X:48<-J<e59M^51D7+^RX
-G,gR[RIE<9.\/37Pged84SSg9W3KT^MADB72P-6/N]2=O??ZOHgP#20CD-a[XX;
2a++eSZR@M+<4.)L=@)&4)f8@Td^/g7AJ\eIOa@d+NT3G@<Ca=VZ08EY]d80g-dd
PgN4f:fI&#c/ET0<OH0A5[ROD/G+X<1(1LZN2,0SZ^99G(7f4E+E=NM7@Q2@84^[
TF5>,,:(Y;Ef-BC)<Ef&D#2+QgI2;g[0/PRE@Td23KLb#SLW8R&,bJJ2D(=d(KBV
QLQBFHUTS#J#^6QeUQZ07?30Y^T[FXW#K>YK4/.@H6eX08Q==)d)8UB?Eaa87\e;
8@HRgP6[FO&+cIH?fcJB&eFV_Z[BB3f.4Gd&#:eRW-KV.XeW_4R,DH2BW6f#0ZP=
52g^,8SK=MW&WZ0P@G<U>O<2MBe@BG;J&-NgAQTaaEF6)(XgW+a5<9_K;&#@^Ic<
H\9:+N;B?JD/fDegG>RU\e9LaZ&4<e.PU^0&\5,6VYFA\bU/O:)N6g&;L.\W9.JN
U&V7-dbbUIWR1^L-0T-SDGAX&#g[CB2T(Sf.@PA7#Od81I^0L)dJLB(7Jd=L<.O(
30?TC53,I]>Z+_6T__;7G>IK/=.Q&8.TUBa&&)JNJ^I4(F<OBA8-b^6D3L(8e1-H
6H6b:/8#HB<YPI,Z)ObGL\^CI8,O.aM)]5BRJ1ZaZC79fcM.8S63#/(0XKJ;0?VE
Ma;8HG[;O/#JKZ4GXER/fXIG2080E3eY^3;2Bbb(Ld#66d4B=L?2KT>NDXe3Uc[7
+</SfHC]>Lc,>]B[MB#_KPIFE_KW;/OORNE0:1(UZM-#O[Y]g.N[OIQH(+OS@6KA
be=_Z-3a>7[bJV[W))^,?.A_=cN<N]W_</cd^f+HR?,Q>0+eSE/K:44Lg-1&EB],
.&^7Ae]&V-JMIZ=>c-O^P#NTLJ5ZA]cO>:)SI2_40VQ;bZM1aSRL?BDf(Oc_^\Z)
FJcF?H-3Y+EXJXA&YPH=0O4>3AKbZ_12Q+deXEe,96:,5[+M?CYBY(DBSdTDU<0G
PS?8V38WGJ>\O,7XL9a@JE.1C+8KR.Rf.3bY)O@/b-&N)14#DL?4:]B4[/.:4LUO
RR.^BUQUg5TS#dA&Y4(#RZe=9Z?=g5Z#F)<TY[7@IM(=);KU<[e_IdcC/2C,+8\F
#B.EUE@bO9AXE^8YG?b(X6Uf<4GU>YNTYGB>ZUDXNd2KQ,3&8](B)B1Z=,38LT;>
KO_[3cX.EUN1]3\c&\\AH>\>M1>dScT#5SRO2,;FKb&&N]fDVge-5RM((@8YL(:J
8]\Z-S(@5PXQ994(fH:>KH/CNU7+E\TK\;_<V#6-)aTXdg1VI5<)#7S,]_6\:[>^
X4RXW;L[PLSb)Wc&8ORdYWRbPQ^4.5@MD((:X.d7@I3F)ga6C(+IB_D[)?_V94)2
2TP@]cgR(e3;a,GR[<224-/f+6D_>[0e+b9&]I-/I-O=->&^/06XDO9Y9CMNb#>?
dDXZ7Z_5TM3>Q#cM^d5G<M<B:IaPE9T7f:2CJ,@LERMTZM,H<0E#H>)E,#;f7[P#
OQg8^3;@^bGBG8f&cX/UXS-ZTaF<PA]QY+DZ[<fU@,L>S8\Jee0L^ZSOSdYadGQU
EC.#:b]6SNA4egU,e1L4g&(5Pc.AGbc;If+4g2YM6:&e9&NfPY;@S8\cHAgL#IB9
e;K;[85WW;7f<Ia+UcMV/R15J)1^KEC5BE.TM+.8+G2#21^X]H7.9f7fI2eO-5ZN
cL.RUTdQWeA[6+_XM8,5VE^+(5-#,F\eV/e>c4J\S#Jff<<=.99Z&)7?CIQf+>82
?>.AEgOF_W)KQaZ1//.FC>D0RGCF)TR@^Lb2EeCH9B9JWCM)fRQ,?4]K[;#.N.Qg
.[g<TO8Ddg\;#^>GTa]D\):N\ZP48daW:Kb\..K#.\D2f\&ACd^@E[d[F.8&V/Y0
bBb\(SA]F3@cOJPY(X^C?M7NOMA]:OI,0b79]EAOSHHG3EI)/RR9AcMVKaP<D8Y&
Ve]1>Q.(E.QYMgH\LFF9-5dHIRLDZTR&IN9K\9&^H\PMK=IAQ046IYCNEQ9g1#YJ
A7Vcde//[5c89Nge53XAA.-^9.][E+?<D/Z;AW.Z.2CfN9]Yd(<IN1eJ@f+Z8g1b
7D_T20JE37_3_fD8RRMeN<V5^-,#?A@\IEK>e<#)Q.]fWXP@D7UOb[;9=+3g4SF]
:P\:PB[:F0DH:D1LPZNQ.^(@,AgELRPLdTM,dfT\HSb0,\S^,d@22O\2BRU@Qf7F
Qd7AcY5eS<\B>BM->TOM_fYHa_CI1CJ3gf=O.:?60-gF/IEeLe,4Pg<aW<+2;DL@
G_,&Q,,AB)bHf6b)4-4<c3G5WN]\<,@2&=(-,8RXMW&@;((=FZ32=;CE8(]SK#F)
MH9O3/35@W4QNN5bcgQY.DXFQ.f1M1IgL1PWRYN8:NX_^0?VFSNX]EQYM1LTC]SV
=++TT#L(NE;-2M^>1,?>gK]M;U+#<fDEBVBAZZBf=g7ZGW+K8XN4e_RgKPW+_QQ1
LgM\c/4N0Q(H>Y;#Y8_A8RaT8-(b(1,8M2#)Y+b8#(O?D#.-#,\+&CA1F-2=6AN4
D(GYNE=WH^4CEUf]:e2G=BEW/;)8@+O9gJ)TPZEA?S&U@LVD;U\(5HD0Y)UBC(.g
b;2P,fA_6g0ffQbWR0U.6(dB2bYYEBJ?/LOK;<[a.B\<(90T33[BDDOH#IZB+gcO
[)FKf#RG+,S^\8?CgHO5>LOD8D:C?8.>K.<d/\ALSeOE4Qde21:,ZVPFDbJ/<NTS
6[B-eeQCJgD40Be)I\b3FMdT^PC^Q0UJ#+3TPc#Ce2?-0FG/:WPQ4gL0GDOX06?Z
[ET(22EgTLJ=DB[Mc/EA]^<W.cb_L&QX9@\G<G]50e@,UGRb<DUVf.#Qb.e:KP-d
fRY[)50\XDC+Y,.b-?=6WM[LMAV[2_/KJP1Y;cFI&B],9P9W.L694>23>^,a2S7e
8-OFSWVOf;5,FOT/]IM3=X;Q=X>UQP]HP1+TK6c,U7KZD)DQcYD8b>@7fZVe.YIR
@PD34fbY@d.3IQTfEZ(ZPEFBMDWR#TV.6U6LWYAY8^29L?d(;2-(_G3C:UIF.1VK
P;>=#X&OBNTE)+M57d>R\-dN@R@R3@ePP78FaB_98bQUZ25LRgIM@.R#[;a\FS1-
#ZdI,G[;fP@3)<,3.ZMRWR=Y2S;3.BIC)@4U9b]@0=-]b->Vf)=58QK4I-I+ATVE
7_Q(3)#&g]YRFA)_BB3I8d9^;,^]_212fXSfYdFB8Fe4/D_6#D@V#J]aXB1;(I=Q
8C:E1WK.c0CXE+AbVDS>_GZ4[P[57[c[C[fO+E.aJYI^-VW3Z>O-GLLP0M&f83ES
WB&V5TF=C#VbK@gb>NYEcebfF)3/G_NGKDMY[EPf:gRcTYXAJN]aZ8.c-X,8,^[)
2..a@Bf(>8FZ[f/6N4-K_:aR;gd&2?/G1_>>Y?QF,J=b<#X;EG&4/&>VRD8bU]]7
eL_[X,O=a-Ra(D>=2WfBXGAf0D_4:YKKYC/]>@ab37,POG9JG\RZPON61BB([cGR
)_bE+TR\:0IdXBQ,^MIKd4#M_dS-=aLJPgR9Z&WRU/^2.SN]Bg+EZc:8NYKN@AYL
BR940b)a8cMFQI+YYRDfAN+M&E,.OMQca[(VdC9/PEad2]@PNMeKEcO-EGF\a5K)
+<dG>7K)8,;WMXEI,FMcFP0-7.G#)Je0V1b]cQ?;83aLG42CLUG/=[CKBLfD/^g;
84,N[8(3[-?g0PYbd#MdE&b6;B@+T26.4+T&.C933a1YGT]U,=JPNB<P>\9?EH-[
(VIaUa@7#C^:.Bg0@9JH)0#VbQOV6TgfgKOa5#N1Z#3&I-\E.B47;OZ<?3GW&7L]
\;O\#&B+A>GK4cT?DL0(-77-(_SV0U&4Y+C+9+E2e[(H#c\67U\YUVYJ?b>AKNF.
1Mg>[ggTf@@\Cf:<PYK5J^)AYb1@[aN/OIFYdG_g:,_6[#A8F4W8VW5^P7N76UR#
>MVbJA,GBJS_=S;YSK3,F<WdQ3DOPa\Y<S,V1]2GJLE(/:dMQ1+I,[9HL_,;[d7/
2;0/OR.&d&)8ZDD<MC?CZNE=]f\0#D[M0PU>XC-.KK=SFY>^OBU[)C9Cfc6b/4V>
62FOG_I,2eS_M@/IRGFN5?=ZbH:PJ^d5Z290G_LH;<aNAZNSa-XR[E;K;dD@+>@D
K[D4CBTZGZ/NQQS>PgdTZH_BZb?HI1:OW;.UaE&?bK=0OI49#N6GE[K0N>f+d?FQ
_6a]6GV>TU/E9NC.K#:Y_JBDWKOgOXA<\-SLBKYZdfI\TafI^CaM8B[=CT@,=(J[
EDM40M&9_UV[Gg[9/_QPG-c5/>X8AfX_1aGI/D^0KRA)FH6_)Y8SZa@7Z2g,f;]g
O1VQDg^1,E+eYBX7@HKWDfg=CHe/<V\B[U3YE:5e+K0P+Md7_fT=1#f8>>>gSIEQ
OER7C9[1/[_&G,ce&)HEYKKb^=0UP:[g.X-@AdJ70\A[TUKH2HgO5P]HUPC5+9C@
I>HBX(XI:#eaIC,5P+BSA;gKf&?YP+)d-(P?JfJJ#Ng_A1MS>ZX5I(^+QQd:>D:5
Xaa_L<+AK7R\O9MGWYA,?P[#)B(,-LFa1b-dO/:EbQUBMJ5^_A_QO\,A8K.#Z0S(
TWSbSG4PL1)4:XbYU9.;^^,SRA&L;0ET.9I79=6W7,NZf^H8]_J0YZ&#6[4I?S&A
g&_JWg(acAfH[<ZN/G<G?X<[d+9Ld]YB];<YZZTP=1A+OD/eFZ?OP-2+NHU[X\_.
9gYgIT^H0LP>eFAY:,BL4;GPG\U\gNWN^.LAG)N4FY8H:J8SUY_F;\1]Q>4e.GH+
E>4[Bg\6e6,7b&RR7\]LLb\\SMLW[&Z3HEYO,D:5+D#O08E24KT-XcLIW.+QCb92
b(2,65[V>c7VaDW#(/7]K\(UNOP)BP,UFfKdO?ZB0_-KZd)441V@3V&33WMO9ZBf
PK.ZBCfW(d<@73,@bF1fWd56TR1X&VeKR06+ZeY)YC)Ge&2M.Z3,[3)a;S_,T#G3
JFFO9,+15]8HZCfa&gVO^cETW-bF]TB@gf)TcgH:;^DVM6eJ:#4&(a@MJ94G&+Y3
IG;dH2B=>V9IH_NWAZY4#I_e[D,S4\\&fc?PI?<206gZQQFe9C8f#FXE<:b#CM@^
=c?[^+53=(g=V=/BMJG\dbU#7>D@HRfb3f<MH82P#-<(O?I5L6(\.Hg+8e/>^cW5
P@WLM<e[cMR,4TU#KgB>Jbg<\->Q?\5)7?;eLgeR19\9-X1G&F]IdKE7P)33cdKa
X5U\0=QIe8=\D;<\_D?&Q(JGE@ReP6f_D@RF:&[4YNe2WE((DaeAZAPGf[)((d=?
F^9fgT]2#_>NF9AB\A9):Hf.dL2EcgN4250?C\840@=<X++:9dQ3#c]2VTNDB&X?
PU1G(YNJB>)[\ERfT0-Q]OCa77/):C:&c_36JSV1\0g4Q)V=96UbJ;IYJO-d&QTH
X[C:Tg)\3&-YRQ)LXFSN#I;+7@)ca<_a:IZe#Td,T77e0[4>@_3H+SdPX^,FR??#
/f<?EKG-b^>^<6gM#P3Z[DOF<Pf18R7.-)FLf;>K2Q5g>^7:G@4Y^J0L)-68UZM.
?CJd-EE[C\_C:N]3N]AA_R[gA+7ccTT:4/9W5Z)@S38.@D^XFZaI;Yb\E3@e1fI&
JLYHY:7aH47e+RY=b5?a;BQC<QE<I\(b4VY4XNVf+RCLPMY2121?OCf1OIYO:X0J
SFX1CgRO5^7=>\\JD.6gH-4]LM@d9g?-M?dAVL@S>&W]W]\-9U0YA?DXfF@VZcRW
1R_VId-f)f5HDcJ]&C=O4@1M7S//F(>Y3(9J2Q6FcKe[&7D^85K::5>:_Fgf&a&V
J)8/aeb9:+6DdLAC,A7,<B-cNL3aSKd=42UGaS)U03c>R2538X6UWB2E]H:OG@0C
Wf8CUH\+#;Q&4.=Ge3#H:XX:;g,X[^YMUXFLUQ\1++=>g)14JYY#ZI5BQ\dI&\&_
MX069S3CfPS&91XJX6KHaDVR2CPZ+b&N\g\8#_=H\30#\D=N9c#G42E49fOe3QBa
TD\PCCcLa:XcGQd&2#,C[(/,8J?6ZSG+#(M=&#66Z9PH+P?G+IVO^#8?\+.(I,-K
Lg4d2NV/9=<CWU,XC(P<Q25SVANbSUdCb-](([eEWN4eeBbIX\G;^-M\:DA8/BTR
B\P2B[C;ORNDb_15c+Q3D18EJ;/_Z\B<dZ72<NPN8W:F+.ODd8<XU2T&HHgf[KE?
S]IIU/f=<6_Xbf#L,]d>LRf0+,+1\WGbVA]PNdG[3GTced)[,)\1M(3?_Z7e3b#Y
We9[1BI&^.3S);E^SUM8T0H/CDY^<1(<>6SO;(K>PK+EeZafYN6NAGX#5TDQ(X^d
f(UggOcRaB&[H-8P29aAQ@Z^\5_a2NNGG#RFCcV^2E^V5d;]^5RSBE:6DL>&@09J
Kg)#dXSP@ZIedIU//+/.a,LfDN4SU9)=1Hc[IfPcIX(dHUFU]Rg3GHUYXPJ:dP<]
G1GTL_/9W@d?1G?/A1GS_SXQ#951?>)e0WSWJ75?XXU.aQX?^D7Uc+A6]Yd0[SFA
H1@V\R@d>1[,&7]IC>W52GGgYWIZ.76L6d.&]#ce/P+(4^A^;,2KJ:A_=b4[EP7O
]B=+,8FQcN6aJ7;NK0#Fb\TB2RfgbaeHCB(FN4T0?WXK3(83RI<4Og)N5+?a1f60
[WZS4;JOa+DVLBacZV/ZdD.Kg#a->0@@UMgIT-43UC49P7\b1b/HV6;ID4?Ie5-.
BLOKW,e8.6OgLge&.&+79c7DIgS)6;=W1[:71AITI&8S\T?C)2AUXPAG@LGd]>A\
/YC5c.T#=.f>+fe+^XP@4]aPY<U.+EDCCaL5[4RgY);e]>\<-;-UL<RF>O:g0Yc\
O[4]S[\9TB0Vc-W-^9KLG.3RZ_8?QORQR:aI:SI,NZ@_Z6I&N(Y.XY+\Y[[]UQ22
QX40^>M4E8-XbCRTGS:]c8QTLP;e1d0HG5#CM20:?<].@>3Jbf#;=(_?R+)TgcY>
(R\:XNYDbV@(\KRgKUW_=?KGPTg/F#R98L?Ie,8DV--D0:S8Nd_R,g8+U9P]4JDJ
7ecTY[+C:2<?:#aeL0DdNK.&GDPAf7)A\QG>REfeU/Q]R:\gQNcA5cRS14R;KC-[
+BJ9RBUM9=0D9JEeHd1(b6J.X?L)LdJIE7(FC2[L7]=XJ7I5\d7YHCCRB7a6_-_d
\c2_<YBE2J,PU;+>0gDJXW<6/5H>&53@/YI\JL_AM;.Y=NOdJ4]a3&>W9L<gYBMN
R3<AVDDC2M8W&XKZRLJM(3#K4?HT_)W;JB84H[;6D0dOXbH(8OVBZ<GG_d)J7[KW
dBTNVPY#7][Q59eVGa,FL_=67VVFdEJE83QG>[-5cLG=2]+6BYdZL4Tg+L5CfB)?
ENTdY[ME?FV8@J/64JHBgZ84+3P^-1ER/VM&YIF8gTDY3Gg/6a\<D3.P[F86X4^/
]B4IMH=gMUcDWfNYg68WbHD&OK2H2^0WP_-=6?(7F;GM35CH?E3.9E.bR>bb?:TQ
61@VJ-RX^0,[?RdS?GJOPY+/^]KFT1;K@]R=H2DPegM-OSYEa[LDKSX>g54[3F5G
?RC_/+51PLg6B2G.X.@:]X>bQ;WCe\#/D1#MAEJ)]>5WW5FAX_/OL4ZCV@I/K4aP
<LaL?G1T.:Z4dF2\JNf]U;+#Y36Vd+^eDMR(U?O]fB20FWW2GGdXV:.GN,R52G1X
SI7(-/=0[g/2S;DZ9D)6]dM\URG.FU333J<6H21H6R]?Uc./2S_M26W)DMdX^=_S
T?UG0>/,0T6Bc-LgR)aTf\CJDF:J)6\SIIfg^[O<_.gB4:->E/7]YASb#ZIU@b@H
1=:FW^,(/9.c:a;.]X9<R8[b?d6dcNaU4S:G<6.DdN035[McK&>Z>:TX^aSIE<FS
J0Y#54?Se<d9IWg4AVCG>1+80^]fc;e1aS#F4KZFIZA>2;#ec40;(=c826?&<FY\
PIL>e?V;C4\gFc)=4?&Y#E(I?0Kd-+C^4Pd)_8;)Q&e>E$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_S25FS_DDR_AC_CONFIGURATION_SV
