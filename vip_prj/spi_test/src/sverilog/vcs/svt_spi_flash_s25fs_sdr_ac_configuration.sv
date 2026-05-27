
`ifndef GUARD_SVT_SPI_FLASH_S25FS_SDR_AC_CONFIGURATION_SV
`define GUARD_SVT_SPI_FLASH_S25FS_SDR_AC_CONFIGURATION_SV 

typedef class svt_spi_mem_mode_register_configuration;

// =============================================================================
/**
 * This class specifies AC Timing Characteristics for SPI Flash based 
 * Spansion S25FS family in SDR mode.
 */
class svt_spi_flash_s25fs_sdr_ac_configuration extends svt_configuration;

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
  real tCH_ns[];

  /**
   * Minimum Clock Low pulse width durtaion.
   */ 
  real tCL_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (SPI) command
   */ 
  real tCH_Fast_Read_SPI_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (DUAL I/O) command
   */ 
  real tCH_Fast_Read_DUAL_IO_ns[];

  /**
   * Minimum Clock High/Low pulse time for Fast READ Command (QUAD I/O) command
   */ 
  real tCH_Fast_Read_QUAD_IO_ns[];

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
   * WP# Setup time
   */
  real tWPS_ns = initial_time;

  /**
   * WP# Hold time
   */ 
  real tWPH_ns = initial_time;

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
  `svt_vmm_data_new(svt_spi_flash_s25fs_sdr_ac_configuration)
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
  extern function new(string name = "svt_spi_flash_s25fs_sdr_ac_configuration");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_s25fs_sdr_ac_configuration)
    `svt_field_object(cfg,                  `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
    `svt_field_object(mode_register_cfg,    `SVT_ALL_ON|`SVT_REFERENCE|`SVT_NOPACK|`SVT_NOCOMPARE, `SVT_HOW_REFCOPY)
  `svt_data_member_end(svt_spi_flash_s25fs_sdr_ac_configuration)
 
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
   * Allocates a new object of type svt_spi_flash_s25fs_sdr_ac_configuration.
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
  `vmm_typename(svt_spi_flash_s25fs_sdr_ac_configuration)
  `vmm_class_factory(svt_spi_flash_s25fs_sdr_ac_configuration)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
IEAWf[=a-/NYQDUU3716#12cDf^BHX=_9<R-\JK[,QPDG@A@Y:8.5)=Y7ELaXRU,
4-4b^)--H@#db;aOde[gD7[N]Q-0c:aU4QLPL[I9@;.<H7G5YVJ/ID?10B3QICUe
A,;T(X);Q\B+&]B(?0gcZ:J8#(E5YDP&D@SAbce/]O5FL^TEFJ?NeJQ>I^/]H?X)
NS]aCM/C6OFY9d#71?MS@T1GQ\GaA3B&D>9[H^.42@T4#M<aE=NY_=_-65^\Q1-e
4O\V9:,H\TE&Q2K&g&:+&Y)LSB.g&7^&dEKG_MBE/>^DL5Y5E:)e-(Y:J2)NAQ,.
C:ZRfBW1PO+Qa<P^6Fc1)g]C[UZ-O&,GKFN8),CB0E6:U@ZXB8U1Z93TQ3FabWBC
O9/1.g?NUJV,QSO,]1bC1)A[R2EcH;K-gc]@X52a4F^74bLSK1Bc,^^ZW)JcMg1H
GEe#?8]SUX3f8e+WEe6A\=_KPe&b^OX.dWPTcQH,gS9BP2C#5EZYND.)S=O:U6X#
9:Kb\KI5X(<Kc_+]QOJU0fE8RVT=B;:6+=8/Q[D=-]^D)c/@Kb4JIG#/+ZCMd.#8
F5a?;8&.=.ZJX>94SO&713(N,1X\SX=NaIPe1YU=9g+g1013/e,V1fTC@(89LTZZ
@U\.)agD16(A0:7;3C?X89[##UVJA5JV&.@>CaBA-V6]_3KKKGdTWdT[Q]eg]f<6
)\O^<\,gG6J-I033M[V152[a^&)g1+)<1M)W9I6_W:DG]CQ,L&O6].S:VP4KOJ-e
798_c0LAS7]GJQV@,L&4eW[a5$
`endprotected


//vcs_vip_protect
`protected
Y_Q6XW(K6M@_(a9CcRa/G.ObHON\FS<0eCYT\=CAEAb?;/&E_/_?-(QC,Z<<c#Bb
.bTM?a91OCWEFDF?34&@&[\G6#YTM-6>(dE18+<4Q66G02^N?1<(._3H/ba><[T;
?[H]G8BP,EA;0BCe06C3_GZ/XaZ.<T-0;H2?;NBJfJKaJA)ATB?+FS?Mg/LM/KJW
T0_<,CP@X>B4AX9UXQBIHEW<bQO#I>X0H((R>RNJ_DS</,^7XWY:f=MT;[ac+#:[
5]=b7-U46,G.gI4,0(\Q^aU<[JB<KMGC]UK]SE\3HGQ#C)PaZ:M#V?3QbLW^;?SY
#KYU&FBg+7^ZREK=TIN[LD,V+54_)1cQd+O4BIUHZRbebDPS3VB@<LTgSJ@^P#6T
:1FK\VR?64ZK,BbQ<#8Z9[df=C650[/&_OEM-J[.B)^G12.B#SPUE#P0>4(ab\fa
DVa-^>P:d#WJ4>7^cI.ZQ)S/9cg\LG(T5<O@e_a/THbP3&8EXF8e:IF^&NWPTER?
@TB7D]Ne6UL9Qd:E/,DU/6@8LUJ4<>,W8+TZB^K-K47H@PfO9+R3[<6@H)9Q]XWU
14JI0@XQI8>5aeWU-JI0-)+]2)&.RQ4K741<=48]b1R_PeMIgPcFJWN=4\YZ>UT:
_O2Zb+8&CUC;BD/)FV7_+2=H?SOW(62CVFP8CR^@eTVAGD@&\>R2-L81eO>Kb(U;
A23WDg(eYJ,H=U^L?>JbLF+0Md\Hb(Y&_7,)[7;[YgaI][L?&b,1WH^N_e4##CgR
UHO_8cM1AK,UIZHb#@\dPW#49EeQO.T=CG^N\AgC?8)4Ff[_;@S=44#7D09efVM?
9?P,PVBHgB_(Z7H6.)5IHD0;bBQJ+BII;&P@G[0:Y]^2N]AE;Y.fYLeSU63W]Y2R
OA(W/(PZ9bYQKcDQ2bC7LM-9GE9-XS-)ZQQDJ9VM).,6+C\>YNF&,+WeL@2e;S\6
<F?L>3K9c@aMXPOWB;;Te?7aAII3(PBY/c?V\@[CX^XO>?G+794T:&QA;L][_#YI
)_S7[@E(A+=U^[DYC2>MB-5FTbCdZ9BIJ#Z]3_>BQ;+[Rg[-L]IG1V&4#OKB+-9g
J^:SFdM[eBQMOXE[7X7ZZ8dQ=)eX);1/^-W0=K[aLA#?/O(03Y@6[CP4ba#D);P<
S884R,#DXF-@3PgbPC3HQAYKT67Z)dDVJcC[=P>&4?R_C=N2DB=<&<dZMgbdI,Ma
JA(2051BECHZ/c3937T&\S.JP,T+^aF3aS?SeK+b)FBAFK8C<8)POSU50?1.^;6e
;7WX0L=CRb_X<ZE_;<@RJLX0A0IQP/;95eQ1818O9Fc6\#@[<OFMXMZ61?S>IN0P
\MH&]Bd>-:g<D72,HAH2OUNVXMZNFT;RFZgX-;@WRcF<9b3Vb)FJK)I+gZIeK^LI
VY<#;F8,C@X\dJ[cPdW3K2/Y(P8^X8#fQ)g-dENLJ5G7Y:;N:cP2?C>AP_]9ffWg
#T=0bJbcIPeXD^a7dgd6UK=>V^KdfFQL^cZ_SNCAfHH)G?Q5,cV>BLSV-]Aa[UUa
=VZFEgN>SAS&6gQ;9V5]3,b#R/LG;)<7E41WX+G8?-3QdSD(L?gRN;;ASG;&3S5X
>-gJRSM&>APVE[J\cTAC;4NWW2&T:V)V&[32<4_FEN7?Y]D</4cDY]R_ea_S4;Ya
6,0(S:bDH(3L]B0OV:RD[^,O=2_(PZXJXP:O9>6VSgS10Jb=BGO<]/?0aG2WDc]7
_@5;[2MIMY6:OOJ2gMDPM3SS&bZWG&=TT(IZ(4Mf@MXdH;C)]BeVd&d3g2eC&21U
C&NUN_Zf@T6g.<I+:d_Q+bHWUN=3a0bPW=317N&2Z\#7=JZD((dT5#9\^\._^>KP
==F/>U1c7-Wc1c+\-g>D,=L(3Z5C04>@U=:-N+TDR/Vb6U/7gX:8WP,H+.=\9+?&
5Dcb8TGQ/VPCW?GLAgBaT7G<)La\408TIM(_=7P3T2)_]</(;cE^8O&X#2:fTgK1
.+2DDfeWZG\)-H&1JCTSS/Q:=^LY+K6a<gOL@b=eP+b#Ud4I^<bVP1.,6?Wf2KOb
<.K,\L3G-,Y?.^9Kba<]-C:Acd^<1(<W#QV-Z66eG+aFF7,&(F>HNB-Y:7^cINR,
-g=B;)-NC>CQ6,=\SORI-Gb+dX+\?BQ5T4a)g)>RR<NW&RTg3J5f6_+Y@fF1E7ZB
eJCUNOBJ&ZQg95=;]3-AJA5b^=?G@G)L^,,]5PW\=>G@9V+7#5N>(D;/Q@);1\BG
TX5N^a,6^PZRdA?c(G19W)&^;8VRFa093Sg@\e;GdUS/>_Wbb-8LVY,^e#CFC^79
7BI&)Z#6:]X)Q@H:H1f2BM.4]SSS2;(QWbK49QEG_7(#6E(HDZH\65,I0EFL<PUI
XgRJ0BZ339CQ5f2YaWNA1R2?IZ/C73[/N>N)VX\e(DHN7]PNc&5Tb30;1WDL93V#
-6.Lg80V3ELI=a@:5-PJ0&aB1;^1V&C?e(S#ODVERa-E_5>>?-NBMEEXUCAf>a[\
MUc]=Zg>U40AP[E-;B=0aT3gE6#EA->>ZG3cL21_fF\La=Wg5\#=(A+GA:E6>D>I
Yb0Qe>(DaKGZ?g<IA93K<?)<_]E?+S<4VeXEL06H>_A1];;a-?P(6Pc<]/U>dHC.
V7APg+5;PKZ-DW]?_33^I;K_FJ]<a>I)\NX?(VcUT16fCK=3:3JB54dAW:,VeQ8R
GKff[,/+d4,cG#:Z74KF_MV(+eXT9\][HGK8)4#FN_1B=AL]b^>VKK61Y0)gaWNU
,6R,?8gLF/YX^;DN<_J:.77TTLcU,cB19/M]FcJ2T1K^<]2.Z)ASGbK1G[K8LP/e
ZCd+U6OXLM9LO=4b(2:gU;e_5U12B<41X[G7(>4^=#LJELd<;<;MHHB;03==OJZV
Dd5.Y4]YB=PKLB2E\gA;#@,3K<9OU2<D_f[M:MLfGH>7Scd00;1&P\Zc8:(>B1S0
&+_T69_:)Q-CC?.Gc1Ea(-,(KaN-2EIXMa>.</=WOH(9LK(P9K1gAS\9#7.AcgHA
^BbSWMO>J\&_,6PGH=/M2@^Q>6+XY@X7b4?,.L))625=G)P3e:cC^H6RA(gT8I4>
;=BI[7PL_R3SK#PD]cPGN@f<Y:_P9H6;6?XPJ4H078=-:.Z-Ha25UHWE6bHW)f9N
B&2TbG.JGeF)GOGObEO9SY(OOS+TH4,Y:6>YO^G-U?S,.J^KZXdU]&IQ2E?@YZ8f
L?)+BP(f-cBZGPYFf>:P(?@1LYZaW(dV;-LdAA70[652:SKC6>\?U];fJ64N</e8
M^A\@NH/9[Z0PLb7A?A@gU1,7GWTQ.4aJO8#ITdd?7^9=C1MdaL@OTQ0dA?I5ZZW
\,O<<c+&C)=MD=]IOUI^^^ZTGR-S7F1g?[9<KGHJCANgI;&/&9b4,f]D@T@>2@L0
CHDJR&<FH5>1]5GeKg>11T^0_V(d\71eI9Fe?G2?1IRgUCMLaaJ<d=4[e-b^;OWW
3c13A0I.<,L]Wb5QHDRGQ(XP0EA/e33-]-]e3TB#A4[#)0--@A;BOB+#P[>M./Ke
^fKI)]a^BVe4Y?ZFST)#6]aIY>I=^RW&R<5ZM(]PNGW6C@dMVV,#?/Y.YXUR)09T
9<XQT4WEJ@PB4H/EIREW&_N37GDYf;Z<0W=b8W1#eeQ]OQDK<]+M@#M6,/GNR]GQ
?\C=Gd&M;?U).>HH5N54XZC-VX@C(S/@>U[9c>78^,Of+KRL--QNVC/YaE[&_L/@
Tf)<.ZH?-ON6[c6_J,47L,XD>gM0J6\3P5/7:SF9V8=QEbS#//&2@9]HeMFYPFX2
6^Kb]4#6RU^-^ac(DP0FZ,e;fETF&04_O^Z-Lcc++-\N?P&[\@3,O,b0D>O>/B0W
[)5<>eUKPS<<5CWG@_DU;6O4cgUBBY195IaR<K+])8]<a4I+IPD5?cB^\9<FTS,K
G<--LFD:?Q_Gc1UCW;T;V^cbH8#ZUIT\MWGc^?CX2&BA:<QK@2cgRBfU_#&fc_?>
,AaCUIfTKQI6M^:0?E-@WfU1b.aO<,O9VJ,Q>BAUfH&JeC6MTdFaET&,QL-gKDZ2
K4gUJN<YX#0].\,OMR,B4Pd1;U[JDG)F<&F^A_3f^FWB.d^XT72bL:fWcB)gGR.P
?]AL+()O=RGfc&ZGe6_@fSA44TS#cMXM(69P)I08C:C9)O[^>7WBY16AEIT.VU-;
+NYA&6Ja;L1,8BG?LX5cPN;D.Odd^XDJ?c?^TV8^8bNH@KPX8W_WVTcMgA5-BR^7
T.^I5WMJ3P1G#EbGIBU6RU][2IJ6cK_+=ZQOEa=SSW1G.(,)aJQNK@K:/U.-KK&G
GI]d1DWfF3Z#b(M,b3^9Ya/3g/4;PS0fWg?Ff\Fb.H/#G2?T4?.L-;U[T[:WL<NE
G;SN15.6KBZXGT.@E#/>GRQcL:Q+GY&T,/]TV/ACZL0N6Tb(fL+HWTR+g@7J5R+Y
B8L=Y8F_OV6Z[(+WFdP&N<WIXOe;C5^43HQA9>Ga>CWPM)dMUVK+UVP8\+f]eC,2
C,387[fAN6b=XL0793e9@A&^#QVCZ93<#5EXALIKT..Y1S^G6^(cF<eP-IL[fDMK
5d)bME84Db)V#NM=+JL.C.Q.A\>b?a&JISBX/C6[WK)T6-769@5,a[FVD>.AQbbY
Y)Lg25G6cd.R<dbc5f_ZP?dI?;D=YTM(g9QAdfNfc;KMJ/fT6fE]MF14Eg@H.,SZ
J\.Y[636aM?3/#U1&O=SXNV)#S7SLA11_b7\0,Ld7.DTR->7S49)>I[/N6SOYeE2
W_#1gUL=-U^/R]\Wg03SJ(O.[4R7I[X-a?T&P<0cC00=C4(:;6MJ;Q^HUH.4eb<G
M?E?K0TSbc5f:ZX<aJffW?]LaE@gFWT.IG&];XT8-TILb-[B1/AJ>4^YY^e8:UK2
:._Dc.03Cf#?)0LN?YM)@c8MAEO=V=cHZAc,Q9JXQ4^)^KfgH\5eXMJgS?R^V5J9
ZgICT/A+92&f&UJ.X(R>ASgJAbU#WWRL3CQ/O(Hd->de[[5<V0O+U=e+#YX^#c?N
.>V1TW1&ZD88O)a-0=;.[@K-YZ_1Mf\PB]5U&4aCVe;<3+7)_7If,\,FIFeBPA[S
_ZLNE]96[C?cTD[:PTGLYag6]fO)+a^S:(1Zg(>aR^.5DNUBU/Kf018<_:#f->TZ
ZW4I.N:7b&OKNNRLX,Y.>dVcV@EYE>2-UX99R.G:9E-9\0PDb-#54,KQ<//eC9^S
C9A^J,@0OPT3Zb<cP1]TYU6U=MB7C?b0WH@WPQQ.)39fXVZ><ADSN8?J;MQQN-/;
\a?TN:H2[bcW2U_404E?,,I#&KT3GI=<&,]=_UHS/>P0IXV<B_;F4BM5^\[.L7KT
H):C7Z11.K0H_RPeR)VN=E.#dC\f;f=JeX;@KF+W0A)EcN@=,AL6..RZJ=d>,X#R
E/,5eHF<VI(/>d54&B#[&/:LA0Sea+2ZV0WNKIZ+b\U6+CD?2,=K1=Z0=^9/O6#b
UN1LU29MbR7(1_=ODX7Z.<5a,Odba?R/JK3ER1VP4:69,I/LZVOKTZd@c5/Eg=a4
CD_UV_SX0-K(PGE)<I:YMFf.>dSVa2</S92^<Y?F:eYNCG8+dI7LC.MN;640:/?J
6XTb]BYPOf#/U;WSW&c\7&M03P-,C)R77)7cg2V\+)>_?Y5E=g>80NcBfCPNQ?O+
WR.6Z&0<:OI8D\R?=O#.2/4W?+\79Hf<2EK:UTCTV[M1A,TVW^0#<)U]>Wb6fEYR
^0M(:>a[UIZcb\1J.&/OfHgC57M7<YK-(b[NIC=I]#bKA<K^//;];>.Z(:0S;[;Y
=CfWO7G@_VJabRG0IE49Kg&4^(-G61Z9[3LDWf3)/JD)^Q=JC@9?g@.O47_DV[Q5
1cT6F2I@EK3?2VU49YAI;ZE+JaX6Q4HE[M_?8)Wc@E8.dg4Bb<5f>gUHeGO_Sb9V
W3+M20#@#5&Xa0X]b+^4@40gd=QaEBY178P2N_SLc43cX8B_?\ega;S89a:O^0/;
AHW3PaAeJA#d<g\AdEd0+:5XA.VSBNM)OZ@#dME4=HP7LQBVG:L8GA4PFNDJ.cDJ
C>3XUb#G=P^/ZbT0Y.Q2])N(:DEF<2_IT;7\6<a:3XOaGHNS/(NaW8H&CH5)ZV6#
aESTD+>(QT6_3#b^C14VU0#S&[VH+cYeQX,9ES<<_5dI;3I/?V22d^Ug)dFCW5KE
R<NTT\Y>R+>Ub2OVO>UI,9S8Fe;VU,XUJ]4/IM=95(0[BZf_g]b22;]+0)E)[7?/
HY9SPMcc55@_PBTRV&F@@438)>-SR>AEGE?2HXFR(HVC?T773,]J30ZcG@H#0+A6
3PAc0.e:O?RQUG:f#LHSA.](EG\[CC7B6].02OLUY:5>D=W:T0LV@4b-QDD]EJd,
&.\GYH?=IdVS+XUHbZ=+A+gGZIa0g7YHJQIA@.@^YC:=NXg]D+fN,>ZJXZ-(OY3D
JQde>@U#W,aU#2Aa6/a5BP,SA3E[><-3dMd,:UL,f&Ng]ER(<9F>]3DXe(8+fW(U
aD.d-OU3(8L1\@V=F,HCZ@D:Y:<5]e3>O@++9:)5MVIEN\(Oc]E^F9+WJJ_WD-eE
aHR]IYgYK^ZLNbJ:Z^c],@SHPYK0(G)43@HAE35eEBfU-P&^J9>ZQ5YRBCX/fd\3
fK;3F+.:;(W1>CeNKAf9bS+V#I2::UVdD)BLb7Z,2#a0Ib3eMLIEfNgVGISPGT\+
;^@#X1C/682;52_>AeMZ-U:8]/9Y>?Fa1CaRYA396N4N[FS>K?W#5O.d)+Q47ZaF
0?^;73bMMNW,IZ8T=A[.@8g_Z?43(;Y.4AaHL<CgR_\Z7PU2e+a]352^^X+577EQ
KOA/^CR4Zb7;^&,I5Ag47N5G<W+.75_S4\Sf@..FT^K<->9PQD2TVVD:0OQ7>T^B
+79&b]_EBW&YgYNeZe&7W-9UD(=XY-f(5U6cA#@M,B0Q8]>@b@:E44J#M[g)KW2E
=SeAO,-+K94+++EK4^C-7_(.F4KIV=\_9FZDb0@MJ)MYbB1BS,2.Q>/D\2NL[/dc
4BL[L;R;f<Q1f0RgdJ@V.WR4a]H,AC&KbNFde.B_f&MU/9Fdc#8AfU:\cN^d[J5,
WD/^,dd.[53RDB<A,7b2]ZbfQ0_#]+\VdMD@UCCgB_>-d0TO@YIeRNc>bg2=G-40
HeG#[FOVGPJ4DI(G&;Y8\P1]R\/gQ8&J:\\e5J\1eV)T@F3J6N8b4HBJ3WTKa;:d
(@C^WHT=JL@4f0@,L?eb1.<D28^Zd@=)R-dbF4\2\7b0PJ&XU\TVG+Eg0:EH4eb-
bLL69>L6^XcMXTCZ76IH,gPU?L-a>+Z7IRM<8@A^Y=((9eJ#7WI9f8?X\,.&H^cY
S)MO0M.S\=WEXIZKeX)dQIc8gPD@VIHMgSIF(EVPNNO0571W4&W<C]5#T.Q1?bCO
UGZ=6P3<d+.S8K@@D6#&0d7_@:bRI?WM0R8G1L/_7S6VeCHd0ZYa;1N5\TD0OcP4
/FYH\b+W<<7g\/KC3>V6eQ_dB^eY2Z):=+95Ka.,<caB95f96>>RK^P70VCFfN#>
;)=@=]RDKK_.FJ6BH^P_XTM,JDRI2Nd#316Oe5Pe8OcYd9XGY&&;TK0Y1UIO2_F:
5+RKS.T-@TPP2]2B?0X/ADCF:H2bM]c66BCZeb^?YAXfP=NGO=CgHLU0KaYMf>Z9
ea,-J<MJ(BT>B:4#RCc^@Y7OVU=OKHI[M9@:1[cUXFbdc)fKS7Ef.F?@7,3V\98.
CM81G;+8EB3[LHe@cMT95F9MOHe9MA3IKU>&UZ-L^W@[9Z59R\\/IfgEZ2\07Of4
T0IEdOBa9g^#(V;d8dS<-[UVQ+#JLO&F&G^K-[@:J^5_ec/1<9c@+X2TNdMFG0S0
GTd:3L8G3eIQc.XY&SC>a[K4^5,;-#\VHO7-(eIE^>V9,BSQdF-BZaES^-51CKM0
)C07;+MMNH3YFLG]ANC/V)A?8+XJN4D8K1IWf/N(/K&g).GJ,_::K_ATJ5VR7OW)
MO,.eGMQ9WK=_^F,dfF[?N/G0;)EeD0#NT-.YEKc+&(#5fPV63+GT143S[K/M@f6
BB:8MJ(&U]c0#\R&>LGH]5D)?:_6P9#,ZKVc9(Q&^K[S\.OV1]+.LJc\+4M)J2HG
R_^T+SD>MH:GdH^=f8JeV7@FJR]U3BLTJ[RJP27]+;FUa,K?DND0_\@C&M/-J;GB
F0-9<DO5aM,.=c0U8S8TXH1D.;6;d]gc9:>A/[0](d8a(\8b8;OMQNT(JgA_RV_.
RML4@U7M3DQE,A0[Z06+P7P(:+WT^@^#0ET#)<EfA8;0c5a,71?H-]N@H/@gITTM
=8bB_/_Y[WM&+&@eBe+c5U^<=LW##K:PIcH;AT)HSWS6WE+(;H3_IcC_5?8bD2>O
OF,K&eA;P>a>-cIKXc&+89JYB:&+W71V]5gU_K__Fd2H5]UCRV#D&IKFd(V1?T);
HA:<56R<,E3L-d74JYT.#K;]#B&N-0=4dYU2RY4V>+cP1#[?fKV_4;PT)M.CV5ag
32=FgCJ/=A-0^J?gSO5W.VcV8&Hba]ddBFQM#T8CP+:.-HERAA^325-[.]DCL?NZ
.>8J\[\TeFCeJY2@I12_LHG83cg;M^]+a7__QbWR&(<2+E4QIF?;IbaDK^=b2M0R
UbQ2cS,VAPR8P^7O/XcTe;?5I5c]</E((#ST.>JUDb6CTIR#fFJD=:M6Z,F5NI=I
YK[ND/.]86fVf958M#C/XaHLdIGU-.Q9ad\KG+S8JM/L=,/\ZWf6cG6O?48INa\0
9(;=6cEN-#_,\2UR[N,DIa^[c#&&a;]gJ-cP&6Jb_6\ZgNVGNGc^(7e7O)06=-W#
5N/;B)Q;<[1_QS+g-RgU]B-N<Y85;d,/\C1#5ffb.GFH1[NTL43NXE:^AWG;/#-C
.]+VUfK/9fD]:.U_.74\HUYRL\JS?8HVbI33KJSB/VS;[SXaZa)ASM=7)\>)D3dP
5FdDLLgb&:)-Z75RN56D[2fIA3P;1Y3^&?=?4M@=3aFN@&T#\>eCI:8YM)-VK&Q#
BVB(8R4X:=)a1;N;V=BIP]W=XRF522,8L@OG(UZ+&Yc2JB[ZdA3=&]-^,AE6&2Hg
+;0X9N/Ed8KIXUcRX0Z5b&GCa]aH]T#f?FEPV(WL[02a[8=[PLdU[PI]R[>Rg.S[
1Q03I>2Y0R4QSc],dgIWB<D.Q0T[aP#R;3VOFVI<Q0=g;Q[T>R@MK+D@7/#[<R[6
d=NI8)=:A+#cOCaW5=K)-eU8IN/L&ML5_.97Qe@M^IHAIH](UdGFH1J,f9U/SVG^
WM,Z@Y(9>L<Q;[YeH>V2/1B&g]<B+88M@CPQ2(ZJ3F>T>C^>1DX:1.1(f_K8_1VU
GRMgLbeM[##^[cBA:gF_gC=d2.6T?[<cQE0N9dBT,Z,L70H;0<S0:FW1_L7V;126
c[?OI==I=SKHGCfe>=D8/e0GRN+<B[[CKX\08#BC;^&7#VWSB_45C,(62a;D(eZP
6.1:aFBX35MC@&AfE15@XO.SQ1e,6XYJ81MF#3SH(O<#RQVV&IaC+/J<PS@5[3/4
S;)]0&?Ld(WDg.V.5Q0XTd31NcRZUb1Cg-dN]6\He9ecWcH7-A6:<LPH9L)_:E)#
eEGKdJ)C.XY:d^-]AA)Rg7ZJR/FU1ILHK/eW,;PG6dfC:a,\(<Y?A/JS?]C.JTgS
/_EP)^LdLO@3#NL4T887RR.R_/IC_.=_2[=>8206[\)JPc_4HU)V/YS6R&H09H>;
GIcX_B=^G</2XX.N]DU8&\T_0]0@(=TM\G-0Y/=GOdRd,50a+4)BQaW)V:??g6Fc
(TdWG?94>:1SGQPG7b]#F\A)efd#3aZ5C>_1=T2[P6A[N#,F-:(/EN^c+@>R/9;<
228e3H]<]4;A4ZF3D=2D6OTR=K#].3=MSHA_3LS./N9LPEM29g4+5ae-R92H2?(=
SU@]f10A-^NZUb37XEE[.LN\&G+LcET8Q9VI/-KE@b4XaZ3g^P[/<UZ/57@DJTP0
RfB_9_)6HCWC5Mf/E.?8::e;7fCJ?LXRR7RCeM-Qe@BF0)V.#.Fc<fBUB=,W^a..
U5e@=(JY;?cYaI;VY(VB+eW7SJ]J\60ZZPeKbPLATHXV<D#NW.2FMdIQfPfPRa^Q
P^.JKeUMJ&Q-e7-S2H120S1SV]^6@])Y],N)@dP53IOfPF<S0;6-E6ZC69UZO,6(
:<,-[c04<L1?ZJ]67.;d@_[Rc<.7\7b)eEf&D]01H0IO>eBY;L6.UV[W;SSJQDb3
BYA<L68b3Wda_0^#J367T,faP@BXH@PBAO-2]31Cg3.3aAKC]?Z@X(\cFdVMJ00e
(e2=\FH#4ae[fe=9H3)D0/cP<WCR?@>R&b002;NIICAT.a,aR.=b:ZdERAbWR4O>
)gU7(g:\GL/Y?@CEAZLK5L+0gZ5GCY6g^gHfN>Y.#d>fQgATLOPH:>V[X8.HS:(d
BN5F_@b8YeA>=J]F0_<_Q+ffW,aVZJDW5KL7<U\SSU^L#N[JgXUTJ/TJZDJITW_,
2)IUX2<ORS#62-N#@<3O>YbU(G?EQ,_PQ_56TdaP<JY7[[]Fd?,7bLOJaK1/@HS3
DOQH<6I.3K,cGV)/a_,^cFfD&a2Zg1(6>ZT60g,TR<Z4ZcT]22+3UI#-UO/^dJb]
N=e,E3@aO+=XdP_3_[]YX0PZ,(Z>XN&@-4;c\U3(-ZbJdL-f/N::R=D2#KV@KB69
P(3Ca[M8#8.)e3E5a(8F)Rb^,HMe+)Y2FR5HRX.2bVcM.9a,S4B(]^+IQd.VCgI1
(//&4=.AYML>AKB1K=Ed6[&bHI8.:YSNgQE:>YRU,dS4+MYA+0U@IRS+-46dETD;
L6b;EC:>X=TD;>HX5Oac?3/3D1ULVUPdLT\[C@-a&KLR,D(@,-K&aNg[-L)LH>e[
I;B]g=XSdf7(UPRB5)\#4JV7f:XDW,OWKBX0^X7/)TPa@/?NGF:U:TM^@BC>.IIR
GO2bHM?30KS?U1JT(bXgOJ?M,_2RTDHa#EVY/c@/)C6^UJT88VJ8494E<PW[2HR>
V-2LeIGIH((L:VT-B73O>?gY\YbB8S.W^K@,:S]1IE&(6[AeT@LUBJX<CdO4WKcV
D&BXF-Uf5P)36G8<I2fPNT3T#BW84OMK_Dde4>N7-EX?Q@VUg<;:147PF(6WfVXY
1FIBHfPaAE#\E\cIC_+C(HaY-3RJ#e>d55X;[>K^d3c@dXf6YLY(I=aDT[G]&_RW
SCQ==g6Oc2d#]3Y;?CL.(QY(N01#2656IAb/g;]=W,9?f=eXT<@cC[ccB/1,ZCQJ
b<&QTQbMU<AgdZ0g:H)Pa3R35[QK(WeJ:GZ\I4B319TeUOTV6W23d1Ig>e&9X_?J
\7=>2I#Cd+d&(7e7H8SAQ;[6TcA+fcT;gN&eU^QY_d^^cd7MXZ6/TWV\I2P==^L[
#=1]L_0=T14e/,VVO2./QS.L+X,J4Z1MK2RXRR<_a[E#/P)E6J[H@2=IQ]_S6Y2d
e@59M@@UUAD_LF^;Kf_6]78+-EH2-I;BC7L-b3D1@4RQO0J(Sg:U=Z?W,Q?C6/,(
7WH\+aX0TM2M5Fgbc3LDK69<CR:@O=a[KON#DL\:,^3DP[Y1HSFGa#C\>6aX(B)3
][MH=#^O4<8]]7GMGU.C(.Z?Z[#Q2,:bTEDVPa7^3K8,+E2G[,R6_2c7\bZc1,2J
+fCHODdP&8_Bc7X2)73D58^8a</gPOOb4A4389E;Y>Z]U@eE&b=@>)M3M774Z>21
-Gc/9&(D(2E8K;Q/1S[WSHaU,eUT+;bRc)AEM3Ug#DU/<H(XT1HG6EP3=FWW(-Y[
5_Og>-_/#>Q?>+dgg0H+1XPV>W_S-,<FGc8-BgZY^9+BBADFe9U9O(NfK2X^Yb:=
#5@C_CUa)G8Q=I5-ATG2+W+Y[8d6#&Nf4F@;O1>[0aG0^]H-^9D,H@1R)8C]F^;^
.?TDU:ZGc&#B:U?,:75NeD4C9JNN\),\Q&EQKIXC\JGD-4CC0&V<;K[#82TBKTT_
_LSQKb([bLdLL)25cIXIND=()K\fHGK7K&GJDaNR:#-70GP=,c5V:YKI#C6C33L#
a5M<UY(\1Z1WUF8\;c94)DAY]9EeT4<LXK(M23O#;?LZ,bGcVHQ[?KUY/SNU/Y?E
WcS\52IBe]V<eHMKY8.^X(J.:c)dQ[C#]gJF_]\I=2+;f=\,,D\CgVC<;&4TA#5A
Z?H3/X;3CabRE2HZ#5NI:6Zbbc)N2=@[-[5JX+g8f5[A=K8d1.3]HLE-V;UR7.O<
,ZGD0g6e07b=(^BXg1]M/4Pf5/+3IFXF0AKe9YD/b+CF^/6E#c.ZCD3a:@dUY@>e
a;Z>QS@>3GM<DZ]d?QTMF?24S3XU\Lc=g(N.F?+CLH>N7V9WD4^cJ9?][RAIc#LC
UeUV+FSgUNU<\P^TEb5G[ZR;bO8ceVf_7_g\C(,9=;FdLUB)CR@bc/c=0^(8aULE
:1a2=MgS]a)#_D+(LGZ/a.bTMD91TXD#?F2[OeW8:TB4Zg+-6BDL-LO=C_).CJP5
E1:HO3-eAADS]916+]38^(0BV0N7@W/89L4ZKPNCB^L7f9)[6[-1;:Ab5CMaOF]_
G1.]?NP@a7M[3_(5LLJD(@RN2R\g,GW3&I\#-X=OEX.H[:cCa&L/=G1+]QDgN;P/
&I7^<(KE;P6+@E(<XB6B\59,HEX28Ld(a&NTA;(UVODcL^3XfE[c=[#Vf+&4RU[&
2f.=9#\.U.U=#=:26O#F0/\Q#H2>@4Nd=4Y:4F-3.67-C(L]gA_64F#8)^]4\f0D
7,RMSdFQ=1U&4UKHRE[Ff<LI/RS=2HZP>I.b.f<\.>/(_e#<>bU:QR?H@]D()f,S
H\,7d]LTb547^;21g9VLg^:>:K7fKB1C^HAb/ASU??I5?77d4E\5>)d\U0X@G;[J
?J7K@[1f4\)g\d8K<-1_T,4Z6F_4M_?A3JYd^=9GX4C.L>)I0VU/cGB_+P>&8Q5>
,d9FOAPQ)&X@T;:WS<-aTdAH(-AML64.6c1[THDe+S\Vd.a:a\=g//9N+=Rf1gLZ
gEHEQX;FU6LXGKNW)+EP75AN-5F-1DGgJO19a-/aPQ[WFg#S7D8.Q#+FY/a?,V4U
A=_L/:1==Mc);2G>OfW.KK;/6=PGDY6P\#XOL[MFQ@EQ8_gY\D3T+R7X5d>U(<g_
4c,[Q1P87(-f.@a;(e=5)B<V\LD2Pcc_FAC&1R\XV=W9SEAJ?PCO]K/gPeT]SWIV
_L?T[&Y0BNL,55g68-FaKF5#d<<Pc-/^c<=2[V7)b.g2N,2#cNMIOD2H#F-:860@
[M(,)/+G-:^c\fR<)QP,2UEYT]7gg;Z6VP+PbVZ7\H#X1FaaYA8c>+5QXZ00UV0&
0)NS]]a(FUe:_N;F;)[<:)P[5c/:E<CaGMM/F6\V183g60)YG80SMNK:^=,G)0fG
+J6/(bX7YE.7WB(+I3/2K.@\QT6<6EOIS.:A(]#+9&NX_f#HUP10&12Ag)(^<0<0
O4IJGK//WI<T/EJc5R7+KM9JO^PS>ed5<0KKY82/#0<NZ(^CH:Q2DGHGNPY98#CA
dcQV;eM9>_OQ87OP1QU@__:L8?3O\G/LX.+V7O4WH<KEMfIH/P:8>@e)1Y3-UF3-
^;X8\2(P>>?b1\_Z&#Q7\Y-VWM0XW\[/_FK[FB7=f][RF+Y,P^XeU#&?Y0[g7Yab
UHMRTZX.R>BUdLB=03^E[6>=Y/=\QVK4R1P?KQ:#_Da0_I-d;Y4&_^HPZ8K\dP(f
M4KX=PD4@;<6V5/K,TbE&+ba/C>U-:.F9^?W=FNT9e@R4/#GL6G(>DLT\.[J[#F(
W_,S3\]gPQ,NCISFH-WWI@Qg201a=K4HJ5JD3Ke;&Cd-(_\5g8f@EG@^/[e0Vg[Q
AQ32e6ZZeQ..?W?F;33RMR.[aR17FK6]\NZ7LRMOE2CcgZDFOT.=PFdW,#U2+(.F
).DOK8C@D1J=GOEX?eDC(R0(cFVX?<[dO?2TPFbL\RX?3beC&/#0R3JOc;[0-F)c
#-(2G=7S29LL_6b^@AX3\^3OM>]_8@7FD=N.+8Q/g,G@WGU,bO-Q]<e0:>&CSf-+
IH2aV;M.a0bC+ACCF@HdZ715373fBcC(_4D@_3AXDI#YR=@8P#5FHCJ?Y:H3MX0a
bP;XVD8<f0f,S#&8133+)B[[;1FR+Xa.57>bXZCT.A7JaL.9g,3)((#PPMI>IIF&
U3F]UATFW&)&PK-SAIJKG:R3..\CAGAW[fB;OIfdOJCdJ]871I3f#e;CUT7H-NI/
ZYaW:6L7:S=8C(8M7Ng)GEUc?0W=g-1dUGaYX9+>62a6HdCN6-gKO)42d<OYSOR:
6?2N=64bCV[Yc=5&&e[(@(4adLU(^d@c)/AbTf&#E&NB090;Q84\H9V=(9b3S;03
,S&O>F-.MZ7+bOTK:>1J:W5>0=e=ERL&63>Y?B^@]-6c9&]a(TI4V;KYaZAMbGGc
gX?B1g#Yb]d1NDGR,PF<4+Q:>g6(\RY#S3(,3V^,3]LZDQ-;@EEcAf1G.f>[T^,e
HK,O0L_1D]+Q5?S2P8U>G-BMT)@FL5U-_>R,^\5:>-QL;DWXN5M+3_1eff>A+>E,
c-Qf,EW,B<;Wa-ZgM]gOOLDEbN1?>0O5/CM0X=O&==.#Sf=(5_HTbc]d3^Y1)=_=
5?>f(PZHcZ]_bCPWQfD6]8JgeZ_V\Fg&8/3DUe4J]5#ZgKE0TL,/#VN=D9;LT<YI
dV^@>E/?cL6B6,<H6OgO_&Z4DMXGK[3XKe&,)80USb#4Y4c@G<R_G=-bgY&;H&g.
L[,U5Y^=(1]2<M8#@Jb(JWcY5?Fb>M>?PVG_[aUf3]Y=QDTeA[[KDHOCFgETd]1E
HZGe?2TRFf+>=?a1O+GNW#F7>VOe5A=/HDBG]/?,2EV)5La,=Y/WeUXdPD@?:1YQ
UL2c[B+7U(DEa/F0ga2281[4<)4G[;907c3FWQ_Q\W;Y_/Q,U6eD>6VJOR7b[?,3
3.;DHa?H8J?K1JDI\BG//FMA_RbMEI1LGg4,G,K&L(c,]dg0Y1=@g,W@I:fBRYGg
VQIQLX7PD)aC/f\/R;.+&#eE/e[=AfQK@bKIXPZCR[WIB:;]7>^egNeFNQ>=+K;Y
e0XJ_D??-fYF4JJH>&/L--F+If/XNQV+A3-,@Vg?&IW\a;31>])FBfI3YQH:aeWO
VI(f:1+7HF675gE#L:S+5g=gYQW2]^b=I(C@/U8?V3NHNS+&U4&\,[6+:ZAd9469
C)/<W102#N&3P=ON:&Z?#BfMM[VNH6<)ETWP<7.I_QgU(7bYBIMD3\H6K_27,0aA
-RJ1Y-7&>?L[D0M&<Pd=&\2\18];fOT9M1VXES<F@7S6P)M;fDOed7Ra@9226;c:
Z4#4N+S9b/9BNY=E10#JW?G]DFKB,H=Bec]X4gD?JU&OO(4U/+fXQ]fDD..H3E-P
cZY6W6)=I([RRIL0UcLN1?C(_)gR4C0_B\^FL]@K166&D0\03Q(XR/e8>9aE:2[&
_C5a/(<6,_QbT[/NNPdD.P?:]OVH90VeQcHSR>_b3I[G4C?OLc_XP&;aabC55[,e
(>XUVBNLfDRNZ6[.+\ZI4+I9DTd/YR^/1D,G5XYO0CM(L1Tb_BOUGW>WYBPX&eJg
f_LCKdAH6b(V[b>?Q6\c5,YG_72.]Ge/^Z_@3.Q7:Y:(Fd1DM+2GN)-#+,+4fg;4
ZY3M\_W2G(Q8+Ie@+CeD[0<S(f8SHTHS7b\6PN-SHA#QAdJZbU:3_K9f0M);#M3c
S2VBW)GI(:.90VWa3d/(IMF,=[bA.eS9BDHYF<?D2SVcCC71N@1R3KR<&[CH#19Q
X#1,T[7/:>H-Ye/T-WBEUHfJPM]86?U758Q)39\e17f??/KV;\?\A]C]>J3fTeBH
BIeRI[KL5,C5fC[2_6Kb)UQ9Zb14H7;aC<2V71]N32PK7:8CHg\,[7S3+&g7_bb2
IQ=BPNgST2cTEV5R0_D5_K9+,ZLU3M)-[0)WMXfbb&fA0<QcA)b2NdFWXS3ge&:a
+UDS3G/?QSD=WJ-b(_@E_FZfSESVIe7fV7/3VT,fK;B9UPX=2Z9??KOLc(c0H8f_
HWH2bU(eIB+G05Me.;-&P_Z\CaZf\XI-c//NI[LNf8a6_O^Ja^.W>LJ45QQZ^FJW
g_+Ic0gaIU8eXDJQg=;-)1[fHUYLNQ4P@/0(ZCK<F4?J10eMC#L,K430P#6FQ?ae
FCH8RF0;7fW]8)C^XP945^L]Ve30Id29@?P/Rb>VJE##c>ST:)UcJ)X-Y,-+:e>c
5@dD00)[&71<bT_;NP@0/C.fO&&+G@#+MYBCO2;dHR<QS&MF,;40R/]X5CcDBY)A
WVM4&:U.9OPO/Q&dPLAH-1R6_^>U=C__#&&[=c3GU1e=3VB(UCM&W_[]gJaIgI(_
)QV]eF1Ve9\RRT8R>12^(d<7[b59dSW(<>0)bQ[c#/#\<3a)(.&f\Bd\c2_)VH^.
9.69cQLGRPFf;V=K2G,N26_^DL/^O&fU@VcFUbB+-UP/UA3F.J9IZU\O@),&Lg<T
4:B(3Q.W5175]ZR+C)(0e[d3>V-b9V_)4936CVbdUWMZB>b?S]9L\_\^K=8K/NcI
?H-Oe<2#EOG=PM5DVbWGcL7H0.;JEdKSaG-@W#Z0R@KaK[&P+H?7;G#),UfGA,aW
BNd>&D\N&d7^Qec5DRPQYY,)@:]aX.^^Yb[=#ZE-g11R:E@@D6K8H.-[MJZe4T,#
K20^RP_X-,7deO@O7[AJL9/@&DJXH,QV6fIXQSS6R+M^Fa7QN)J13=UAA_=ISA53
(g9Kb#Z:?:LEW(?;MUcD_fU4Z,VU45\a;W8BQ6X,.a(];e_e2EgDNU?.1EN)2+Mg
?1=\V.<d4]bcY/W9=A9.4^JZ(>/bTH:GDC]SS-dW7-6(f[6_)OO&38YXO?D@?;N7
e8Y1J#3(&0=;e/9)2:gVAQa,E^XW&gHQ8M^VN1)\F1AX(a,&R,V-.6eNf31MM0gQ
C;4AEOFOAT_cRR,S@_--=S8LT?e&c#P1_C)96UZ52:0,(Y7]IFgb<R\6JAf)J67O
3Y[U;8ILQbc9;J;-M[a9,[_f;YM9:I(.650HDc^(DY=^@(X5-FA,4,&[J=0ZZR\[
QU0XX8R.GU=5fDBX6@A5XJ[U^IK+[<B:RX>4KR1g.\Q:>@ZXa^&,5TBDKg\^Wg\L
C(&\A#=70+O42L[f1g/OG+P-2IM);G8,V<@.^JWNb_W.;2;5W\9D(9SJ/T)PII?1
JV;Lb=I=G&:/HJ?,38[>8--K33aC>NL[+HI3E+JJBNU@AJSP2^OS6=>\eFYI,:EB
fc^(=+DK<,8>T/KYb^I?D9VECfYgOSBQ4c-g5.&;<@Pa&&2<FT[3b,1CU#^0e>Z@
A&bd4:d5B,YZ8W<GF4fB\7MA,bIP:Gf\(TXP.JP]FNf1DU_g0g.0.PZ,&N2Z8N+9
AeVb&AABACM,2<A:cZd]^XZ8X,X-.11Z.-N3#/4V-QA,a0+EX?R=;J:;#(><WC-F
XQfCfa0C-UH,:G_-204MHfGYE4W1Kc>1XY&3IF=0->)>AG,2<]9XV@=6I+a1GBNd
;J:-B]9b)KZKPYDFV\ZS[E#5MGOE8V1E@Ycda_ON.KF9.e=3N4018<A@a6@Pd[?0
#RYC6c;=UL.K^aB&e,7:-Zdb27QB=B.2,6GWJ]HCHf1_5^I7S_:bQSVUVD>U2&>2
J]?+;fe3YF^>6b7-9-<.^]Iae2R10.J-HX&6Wa?c04&_J/?/1a3894MB0]ZOKM5/
+1adQBS]#^@+<d4RF[8HGJMZ9>(&#C6,fE.2\R/ddO&P_3=:T1)U2/Z-NFAH8BHe
VYV^\[9>e;fI;9U(4X+<2U_>H?MO>TZD)RMbPMROQc?/CZ(e:8]:(;TC03V+;?_e
YXDIK:c9]Q\5Pd1<WNb=9,T?fE\UU,_U.BMbBDQVf;B+OWDI#N-0,ba@\77==<2_
NRG\(Mg//L;;_eQfY>[5\,K@2@.8RB=18B=&O[XgH2N]4T7R/M8,CZWX5IK,e0Z8
?EQ[<2.J9CO\::Z7Zb)=5]-aM7EW,17NAJAQLg_Oa:/:b=H=W<8AOT5g1d#[4S>P
d(59eeQXDV]GPL]XS,1e62#<ZOg4._0-E^:YA:aTD52RL)/:+4>J(SBKDI6ZH0LQ
3&&,IFgd[0Z1d;0+J(3M8AAS6V0W88g46Y.CDX?@>c8g\Pa6A1E&K;P6SM==_2^K
Q\&^OKM-#JN==E[a]gb(G>#3&<(gK:8b=3V_2GCX-9Y195]BbV/R9_&e=P/)Z;3\
SBAY#Y<N+8dX0e1H,PKC:#.MJcP3@d--HO_N^gPR^8SH8GKF;Ze4#eVc_:f5I^Wb
8O?#&8LdR5MA4;JZ+<]+ag@@\S@.(W:0NWFX=6-9-LOJd:X&N#d&-2Mg6fLfEKKP
cA,I5,]cWaQ#+VgS>(9TAZB(4>M06@IPUb_&_cIb##\L[M4(a0<BL;0N]TECEHT:
+9abTRe,]Md1FJbEQ3.gRbW_8c8HMe/]LQL1F+WYXaa7D87:UIYFbG^<5-K?3WSH
G\=Sa==/1-=7P]DffeV)AaO[O6T#8\cA3@I<QZf_E,PQcW]2\9g:c;\GRK-IagN@
:b1Td02<O5;b[?gC./b5#M71Ad1B:MALE=\]K]d@HFF^E8#9ZDD>ZLe+U2)7D8Wc
e)bY0-WM5g@bDJ>fSW8HBQ<40DcBT)RV<.?]#L?cd#4f6V62Y]e[UfE,.MLYLNB:
[Hb-L4be7Y8b)&b-Z)OOSTA<)f+]B5L&]R4c1&/M^1)D,0-Va&+]aOX]T)MVVVVc
GcEANge07C>,>aTR\0R^]&6[_]6]FSS5ZA(:DI2[J:^OG=82IHHf&VLc2/-N4D-)
X:Pd1.5()=AXUV<5NE0(0.PW-)@NeU4C7LZ&GCQ,fDe6YLYR76[_0?<Xa:/U.J8B
(F3@M<(_0BeG.e,AYC7d\N3F:##1<12)7b]?ZBU(#&(E;D^FG](U6^A7J4/#(Z0c
IPVRW-CI><#C\J+MK@^VDdU6a=g+,WZ<cC3e0:NM4W)eZHZYDBL^0@b]@R;8Ba_3
d+1DO_<NIE:2:ROG9/Ld0Q7&V)KT;d8>V&0+J3XaG76CL[#NN.<df(,BE\I&^B^[
=OeZUCb:]d?P?[fB(ZJ7A96+U:F:Md6_R@?9&5>d@@3aa>(#&KSOR)ZZUXZH[QUf
agSJQAL9_&NeH7+PNLRY<+(,)<,:2b2RV(V]0LD0;4acARS??Wa1#/5.I8@VS<VT
N0R3:,(\_MWeF8)LDL><;P.R.:#,RHg0^?1A5=I&fLYg_6>Z2\E^#89.ZF(QCTA9
?1-[DNeB1I^.NO04(9&XPKF5&_:CJ80KHZHCUSPE@<e;[415;9Nb6;A#/1D+NL_5
HCO&2M]H]HCO\5;9>PB3WL)@)NSg<&?DZY??gf-ZVa:GON3P4]-&HQ7P_>5A8WZ0
_6@=B]@<Z8Q2P:]B;B;F7cOQ^,X/RJ2LFbJ7K\&O:VW7--+\2b[N+Ta5W+PRQ#XJ
@gL6e//FbSD/P[/X2CL=33CL=&)B;WRZ[YN2W0:4fKOcWU4YX7d<Y2-0f.QcV<3g
#S45V\]3;aM4N<G4^]2[25S,]_:2/[MbK9WV-?>GP;dW=VI_VL2DA;C,A[4gABRX
X?;FWSKB)B:e13I+W]?S_#,0eETD-SD<&T_BWaA7(TI8+b=ZO[MRXJ?K^c#\YVA>
HPNYY);I0:UK87Og=+=b?(g7C2c)HX:c=Af0eGa8]NFE)DENXO0:FO7==-AS&??=
U\fg3B0-M5<],U@EYR1#NLG+e?:MBW+EO^8R<J83I8KWW^)PeO6PB&5=XG\7^BB2
>CMN31IYf3=]0X\=ReMB.H4\96D+fE?:)5E>d]a,-.>4_+,4^X]=;8AW6)#4=d2_
3?M[P0G[RE]-&5B;,OUD?6YM)7IL,PL-K39SMQ_8XQ)+,bIP[R+<R+ZWMc>b6?f/
7OE2\(#;SIPb,S916gXA/,WNRWN)^U;;c#,[+6P/QSV5b\HgWW;UFVV^]:AcX:6F
bIXL>X)]bXLg1NY6+US-RD=GJHf->3KD=U>S^D]O_6S\1aQ2E(V(1cL<R)ETeRfS
^,@E,7G.Z<1Pg84YeT.YDUS.4]AbYg\529>YCTK^a27<K.V6XSa),9E9DI.@Yff9
SKIRc]0/bQ0gKO>15aS=<):>Ac#I>6<.M+e?\]>b>@dFa2&=E=UX,\&F>XE59AfI
ZYFQ9Ha/44^S@EVAO#.]^&=_H<JCX4@@<)81H^H]_C##]a2+CJ4/L4Q\?I6ff.3g
Mc(P5/VD<&4+Ec][XC3#a82?^P+O6AdN=GE[#g&K;?a1?V:Y#5c7CR03&C+2D>_X
Ga1W_,(ILegZggUNcHgH7)NOR==.A&-?a=I)<Y/@.P4cZ#=-N8P;+Y(G&K(Ufb@X
FL0[6R0]I?@-:ROd9TSfd;E2YE3d@-Ha+PHg[<NY_1>&PPe)fAY5F<.SBA=2K9#<
Z(,bNWc\=4IP/fXZbIgW?9H0B<bCHSga__89@T<,_E>H]Sa1^:e^b91I#^EP2XA-
&E/PVW@=HX&39A\M]>[Ga\96e1cdX:e\L^MIW=G=VIg3XIB9KQ5+BJQ0d<#C>d<3
)CbZ>@&9+>._Y-:9J(N_Hb@b-6A;<LYL&T9_N;+c)7]78ILCa&@0WH8&N/HT3FS[
)>Q>8_W=X6-=\W@<0V9>UA[Q<R9f1]#,@d5^.XG<B7SZ0:DN-HefH>VFMV:=]B&1
aA)a3E<Z+0\.R0OeF<Rg()+KOY2J?E>]Y4Z+-2Le\,G_LNB>W<T)/7#WF3(SZ]N=
<FM;PaOZ-A1NYGW9[\d/g[VE)M@@HP)eJ(<+KC]\5^[7F,b>5VN1N[a6+(g^6BL5
3SXIW2E3d>IDOe.<<ce(EQ,dV@5FS2:_=.dN&80RZ^N8N<[-0Y3ADAS@+)A3C),F
3V1VOCg#ANP)Xg_+Ne,HHdD62+L>EW&).B=IG0&+9^c)W(-Y1RJG9OPN0<=Q=F;#
D.2^?dX]DVQ7;.E(#CabfLg3^?O40:8ROV)^YSW-#(?/bC4Z>bYQ8X.XI]gRL2^X
4Q:V8Nd?(5\Ug)T^=CJEc&4aJKQHY:AdQUE2^X6LI_Fb/VKRXP9)(ATSG=H)/a3e
GQ4W-ec/AO/TAUeA1Xe>Y35D0.B>^ZG5P-#2aS490eUO59V+,L[U(<EM>LYVQDK7
T]Dae-_bCYAG06U8ZQF<RgP\7G0I<BMCZ30YFF-1?=)D.M5DYPXVKD[_,NEB42WC
D+AL7JT]68ebA?.fHA\)(</CI[]JGDGUaf2UTL3F(ca\Z#51K<BUY5O.J8g+E4W[
TI(gO@[PE);S0\G24PKe3<+DgLP):b2a=IM;b?Zg-(PM>Y;;Oc<<VSS_QF?cU<(U
<AQQC+>&Hcf9OO2R1S=ONTN&_9G6RY0T3Q<aAcF,IK6@8PL#aONU=.3R@Z0YN8+K
B#KHIYOJ)\P7,d#K)fR^VY+#Z:1,<9592,Qd7f_S[7CTHdKM3<N#D=a&2dCXbJ7H
X]g;1e=TEB&Fc&_6G\@Q/#dg^7/(Pg0dL:VUJD:J<ITg2SgfFKG;4R)PUBV@V3c,
?3HIRZSW-TJ#998gM4KY)N.2)4P;VfM.<1D\KLTUg55;\PHJ>,T]M[B++Q._WaB?
^L>9ME>&ddIO=:4g&-c.G)4DJ<V/,#^e82#S#)CRfI\X[NUC5@P.SR#HcB.)ZI/7
A[f+CRZLc(7^Uf+21\LNH4@,U_K\0gCP_SB4+bV3[II&Pc]=5KAR-=1a[)gKF3:5
N()EI>1AJ1.bUZGdYWF>Q<C-Vgbf39P1(N?FeTX?+0FB[dc]K[J/)1c@-N]cHA=d
JOLUO+fGE5\)#PI-7X68Y7>Q[I9a4,WbWJeWA@Z91?O>U&XE\?QHWc#GaTF?8<\\
2-8J/K+f60.5P,MS/cMc^Re6>./fGDPO+d7IZ<_0,f)<V:<aS5#aGKS/4H(]V?HE
94fS=/5(5?C5Pb[&\>L:&V&\Q5,_W9B3[_RQ16Dg[E_+>1QCW[=HS+2UY-H#-Cc5
-@^G[>/W:COT7+#WAYJ09^4g+]PH,eY]E4.bBVDC2bF(WdJ-HF8VV;1RXC]+eHXS
=.#-FbE5Od?MBb[JNa-<X<f+0P.CB\YSXD9K<@CWU78J9TD/KQ>ICaGfJJ&LYSfW
QW8D#?Na5U2OK]a5TBdG)<2<UR[9?T)884Z4FH4OT8dgT,gZe+=CA9@[>e##1O\[
3d1,F[,/0#TL3U1E_QcYg:KHB81R[L8g[D,NQF-3/?ESO7c?eS7I9<=;dRQ([D8B
S,^cI4\6HA7X;OZWbE\bX2cTIg@A.Y_]/bK3<GSdVE7UK#6]N@(Za^YC@<4+)g-<
2MSNfM?NTJMNGU=A3_g3HV2Db(Q0fA#F3X-Q)RT&LL[4GMC,>cU,;df,5[&Z3X?c
b)eKT7M#LW:D734;\3X6Kg;GV?F3Aa8UB(VA5&Q#C7V#AC+93cB0PFK>[KNN\4._
7/5/aAVY8ZP:65C.:g<4OGP&LS;5gDC17(Ma<Tg75_HbS[(QA5aRU<BcIc9K:]TR
9UO06^/F,A3@]_8.\/4:>)QP2f[5B<DcKM_TBU\GQIeEPV1WZKKEg]0H?D;:UW/8
G>Le4?b)I5(3D:AL>3IScdQ(P8d1B)D=c)L<b>E+gXEgA#P5@fd214eCa70fbSMG
BPg]^NPV,,(3)K/MU30M/eRO-7Y,3e&8.cg)[CG7U>K8HVIX[Z[M1+9YWb?NdJW9
TNQT)GFYR#[G<<>OQc04B#0,#Z3eR@Z.FWVA\5_.9e5#K?#VN5c,c/2caSK2IC@1
>E>#HERYLB+f3VS=558Z;-Ud)=LQ]-GIOe)ALP=Q0<M-U8/b6aX/UMYHAZ/e8Q#O
:Wd2YF3\.(\XE&4FZfWgO])6_WRZf?-A)O5^KFWe::/e(^+,D)=c^aH<8:/dP5^P
a49GeVb.)_?L,3-9X+CTed7\P@;fb52[<cGMQK3.&]N#?>F9=OX74=O93VJeJgVM
]+2,#JO.:2)bT6A2b#A]-H,gZLKU4NPC=:R(aLN/\6DV-A]3W7)US)g:Ae6DBXRL
W-@N#?__H+.H#U&:XR&5d=3/>1&8MaB(_][QEGBf0\5^2#,@5cd=6<\.Q_CNIeXT
X]X@AHd002be6LW/RC5=_Q350U0gLf355g&J@SU^Q;4DC.K\PMfd/=T:D7+.&;(/
?>E#5fR,/@^0\)BWDAI?]B[eQ(bH<aVa8UQ_<E]cdUHcRDYTS4RSL9G&NFD.3Pa-
^7b3B@O:&9eW:=,Q<15UPedMSC[@7QCF)2X]^cZX2d=g53926:=7(RI]PQI]6[S-
\7fdg27@<3H4./0O(X:3X:-;(3\_^FTG9(c=JG>aKgg:3aPb\b-dN:Zd9LE^gXD9
dPf+3^OH^?5H3gV/WV.33cUMHWDH?LZD@;?,G\M<:?H7eO?/6GV-7fBLbC]I2Xb?
4cf(<ME]SZXU3dB@00P]AM(5Ye0\+O/MVIZ\CN;A?c<d41EF\T()],Gc.,YTGNX,
--SFEbD?;#eROQ(BbRESS;-&ee,WSDU-VdcO4_J(Hg(F:609Y\?=A4,^H1f;e_/D
]=:NE-]4C>DBE10LY(]9H1?UNOW-@15Ea-9HW5NFbe9AU]W;_)e8S\V&1B>JbO>#
=@&S+JJH^KX5^ONQ7)Xa3e.PA]D?-eVVU9V,;&0)&&Y?/MJVP^NRH+D-e,V)+68?
eF</;C5+55g&<1XTZ(R+>K1K(F8WXbf\J^SE@CdCBL,,dUX9d620]T(KS9cQE_V.
,#Z7V@)OA?KGbZDN6E^EAH.SIU7Ob><GgW0M6)\N02E>0GGS_F:OV37YVUFFSHUY
Q@]F;dCMe09\GbR#-Wa]^8\]K;fW51cbHC^>gMN#TZgL1^.2PC7I?;\1;0a7AV+]
He3=Y[PS_^H,)3>>FP&5H)59ZP&(TX,C^G/8YPU=<c0]TK1:C\@cYd>^dA?4,aI-
Y?dGF^]]JWH0Q.bd-TCESW4>2]5?V3Rfg930Cf.B94P1<Cg.Y=U4[d(4YQ)\_#J/
gN7cMTL,#)g/3GH;C[SZ7aA=-G;>L\KU5e<JUFE63CgPOLOd)0aYE+-&;e/)]:09
f#].L=aR(Q=f7g_#>T:^Ve77bSV@:a0e^bQ<G[YR5#e<CgaRB+e0_.LUa[Za?1DI
H<_G8aGB/&2VA:X=LN]_NKV?Fc\]+Ic)>Ae(OQY0K5[0-beeJS5RFV6)FK?Y>XVf
=:KBCcFbe9ZgNY)c)3R_8afbC>AF.cUQS<DOL=#ASTfZ>02,Q0EUI?VJ(^a7-DV9
\f6cXNFa+1<>Q)OMFe-NIAK8(:e#5N:a-1O[I\I0B@AY_N<0O3-M+2gOOIa8;=O6
C9:WBCPRCG<(-[UVgJ0)eC4,I)PVWbSY\8S[9HJ5c,@-d]<R^XQ8ZI>VITSQOD=6
M6-GJCL:1=[P#^G;2L7_<6@V@@2VaS75ZC)]6OD,(B,^E:PX:)9W9cZEDM&_3<Q8
GJd&f:YI>:R45?H<W-W4d#A.+S\;\_e_Q=)S0d\Wg_^S^A4,@:/3I6+7KHH&/<:M
5;#RE96>#1PJJSEA[NGK3N+eO?0H27Kg^T.+[Wa#<bQAUZ+9d\4d<(#D4M-c)8?Y
-HX,/Md9ZSTCUb^)-H398W<Q=LId.R]EBP;_,EDP6+Bd?ZT2G2>457Za=I>bM_d;
5cbKN2ZF1J3VdKUQWJGHZ#/B]S(SJXM(>_Y+,_5>.HeY4_4\Cef[6Sb[-d[(]?Ud
71UHg1AT5BZ9T--Sd:>7)1VTD\7E\LJe,O#ART4dT[b@J_0M+NJY:/A]09LYJAg(
gYUX0]<bgPS@7#G\C:B5QPMLK+B(#E8(@24//YF]K.XYcOQ[EQI0I)XP_V=>X<:A
VdV6-b&eX,#)adP+ME-geT_/b#&\d1)A32gOTBUN6BD\X<,IXAcA(MA?G5TWK@bB
>Me>,d\V#O1C^CM;?5fNFdK]VO7eN)C;:[aNJDOLS2187X4?74=]dcINE2Z_ICL_
QeQ7QR)<WUN)]M]6TPCE8#)TOc=IQ(N9-NT0<e\LLR2PW1MN7E/d3(<g;AOYA.Pd
6\Z35eD84TM@]KL3N(+ZVF@D3gZZfA30]a.OYFc=K=]5<.&G05X0-f:PDR(e3DA,
?\Bd;2K#3J1Q2)NR;dPU_<K.BI>^O-gVKZcK341/,&0^HCQ4H&F+);KVa>D.g.2Y
9DZG=ZG2FCSS&+<,M^4aBAS;(,LQ5#2:^<d)+ZdGW:f1LU-S:0GMWUOf_T7caD#/
K38\E;K0(@YVX1WGS6/G>92d#\16C^gL\9:f>Z4Eg<9C^C8GaX6g8f<9.8ZDG=AM
C>QV##SZ]L#[>_>bdR)B\Y(Q\?_)T-\a9+@,5?)T<)VD<Q8H.C+?W]@:]13B063[
Rg<+-PTcF0UB>>Y53^48^D[;8L6;L^bfQac?e3S^ab^WC6C)Td],@Pe_OR#JF-)H
UD.:+\IJ@BF9J8D<\5,@7Q^6]4&O@1BgNRWBK-YH9U@QQ5_P.QO-#.GgEKHM8SXU
<I.]761(#Tb[9S,G)>gW6ZI3+-GGgO[D<3LP6GN-2](,<13V2HU30Ya9?NBL@b0R
\GX9:R\caNFGV>Ad7<AfDS14[;7Y?;=A[<I8_g>bY.\\+W4YP0d-@R3-<8MGfa.G
_4L4:&J)/359H3XXc()<0<O8\fW^)1#@N[GK^#eG:D>Q<#Zf_@(X5eKGb7SVH]>1
^#)A]D<\Ubf0?;+Q-3URF]X^(6M=&9+]&g0/+N1M_bUAG[R23/.g71B3A:b1TS_.
UWg4[Y:<;MIX:X,8Q=W\a2(^#S)fQc9-gdGg:M_SfcT]O&T\HAS]Z(gON^HaNM2=
CfC6\[AG]S#SDZQENfG7++?34\9b33+3R.0MWZKW=[7-FGeP])69AV_6;f(W.<cc
2&.50:<5S\VfeIUg)BMTXFUVSXY>_<1Z9R[_?S03X?b;APH^E&a&QH\[J@WKO[]L
[=/W4W,c^Of-e)gK^g[^?:U8eQ\\BK,-D>?\V[5U#7(/DbL]_4/L(^aB]GQ-;1LQ
^7_.,a)PK<W^YcTKJgIW0]RKI22Q8/45Qe[A2:X6\;14>QSa6<E1;dXRS8b^dPd(
WQ=^^eIV3>P25KAWCZH>>c/P@/TdG5HYd18CE]P)3WG(KO_\M7K3Z[FC6C\1caR=
H>I#F.^O0LKAM[(\Gca<4@M<(.0<FKg?RD6^:9M&W^@(6)X=JY2,a1C&4P/CfF6;
4=fea<HMR2e9[e.@L6D>^IV2Y,aX&<A)(VSBLIR&VFZTB60D-EI7:)D1Dd<S]g8=
aY@3/)25D.CG66Q2)KdU-SaH.SL)_EE]a+2B\b(4G4c-Ae-<[3C40dG3>J_X<X3=
V(gR<)5<)M^N^4?-]cTR,b-1;X)W_\6]VXg2,\06<T;6</,GEY2_J>X.XP24Eg@e
]I4+A)d10>1;NE&0FL?Z25/Lb051^9XXHVW=&TSc93=<S;:KM;\&XQ.CRA5.QW14
FeMMA&HQQKcQRAJ<G13Q_7CP1f?IcbW#\PA^/NP^Oa53c,72^D>C-5V=,G0TH=YE
7=;f80\cHe>G_BbIZ>@47H(]^_ZQ+e8S3^_R4TbJDW7AX0ZWcS56)AB>Te@)7Q^.
f:7(2_>I,=-Z1A7=A\T/ed#d,DC(_+14d,>U)KKd?b-eO=ZD@d\I3Pa5.9b<.b.C
TbXd>PcgB;MdAZQJUgEL2HeF#:MeEY5#TGI2HZB?VfC_AK)@bK7&\O+<X,P3bU?5
PZ]1EW&9NbFH7@eaH/J</e5MROTXQNO..9<9RMKA0feH98MGR?eVFP9OQe0E1J.+
U,UfNUWT2a@+f-JG34Ib9f&-IF2C3DMgdX[;^<bB.:Q#HKbgDg-^,Y5_(/M1e&-0
4f]T,W8C)I:>>-:Y=MKP-0aFYE7FJg4-DIW]YU8HL]>c=K-@BS)e&8,IWG83J)./
W4IFUVT5?gb,?=ITJaX])PPKY?)-::3NXNWMK\P=:gBdg06^(E>KgIL4]?J7F\3J
EW#^6.,aBYQTECCf[NgIWb3c:/GgeCe=^6U,I;e.QWTR7O>GZ4S,-D7g,c<-+==a
T_,_QH?5511b@Q37F?f;1DGcSSdae:ODB[@KWe:.[aGLFUb<1LJT7e^2?HDU.J4R
Z\=R;[[aL=>(::2d-FUKWNFDMKe)@=>/2RM-@(Sa3;HMBZ2G0E]6^5999\UeJ<^&
XbfNYJVM^//<Zc:XKU6gXg1,-CI,C4Qd@&R+^M#X+GMaR7:5Nc>;MfIKU)b]OG95
2,aBG:P[4YB8a86T,6C9=349@A_8Ye<:BQG8DfE5ZTOR??VBCEa0JE-[29>Xa]DD
AFW?14A-XW,PZE6W>RKLgGCN6b]W/?Y+>b=Q]5)_16XbdR#;?(?dW61c-e6fHbCY
Y]fG]=D]C]>&?16<^(c.K9-RNcV6L2eAOcR/^P27.4^.)<#SCfMW4]Cg?1JLN94J
M->]6B3XO9BQJe7N:6eAKfS&RXcd8U3@JX-?Tc#@WecgVbF,>Q+d(B3aF;ZDCb[P
2-0[B?#a8U_@(W8f9746YL7[B3(\LBIO34g0aR?_\)(a-B9Q^0b:]HY+6,UbGN+O
32AOL#d4@VTUNOTZ+0(-dN]>7HW+O##HFSNL_;5?c]XaC[-)8AbMYU_N-BaX<VT^
BY?B\-KGGWFAIKeg_]dA1().f3K^Z)S\L+O5_.)ddWJQfP&@2LdU;[TIF6+cN+>(
IbA#JNWE1)=eNfZ:3VfJJ9Pb7UKUN2Q62C\0<)\OKBUVKK7:O:ANVF7K,a<#;HN[
L22T#-dF2W<@3G.Ze/86M(A3C4/]aGF(Mcad_ZHU9^]E@W\T@-gaI;c]./c2U:I^
H6D@)=OWESPJM8JgIK+<;K0??+P4NU>8[f1L70GPQf,3Uf_Dg<Gg7-T++1[=g#5_
aF75dW2UeFRbaK66/=Of^6g^3Z2gTH-]=R]<<\e\ZGHI9^ddML]#SMZJ3AL0./7#
8EPE:75-9?bQW>?_3c.a6Oabdg=WG&G9#6QF#\><)Q:QO0SA5HAaAIV4M=8HX+]\
BT:-1>F,)0>#H,\:(O\6K2bCgWH#Af\D/F,]:WML\9DWHZ&2?YDKgN=cG);;MKM+
0G_]?-3/MQV79KIN04JL&]5^OF#0ab2bNG/E4+D8UA6UL2[;-125,(XOR+[a&8SQ
WV2K^:8-<e56&G>8FI_,->>-T](2T](Z]_7N7GN15I^.D@9P8B9Y)\GFO.>93I=c
_BU66?MR378f&QJLg)@>44+(#/IcASAUTXR0PXNC)#:M@<W2^1c^g+gX&S)0KYL8
QQC5JO2Q4W6I9f85cbB#7fA#B4-H1\5YTc##FIN4OdAc4DG,_\^R_?>/G-c)>c7?
2N(17@>8?bg-S=(JG?7ELdf8W7aM,DG-4W)c,K4JATJ/?TC,VdM7RHG?&ECBfbG,
VT>V,+:>be5:VD2Q\K]dM/B2b@>O?WRL7QbR_<&J7a)PTM37Q=#3a4KO4HLN^dUX
d#;]5L^61SF@>a:0))BV^YN.0OB=6K]b#-TN0a47U^a3-50&;G(4cGD?I8JS3gA[
;HUB>]79(8U-c,DP7\6V^VE4BOKSL9.?L7JS()54DaCU=9Y7\=UGCA0KK\SGBXbf
+YC5d:Idg<2-M31(\/F_A<Ae[UF,&TEYQ_UZ?GF/?Qb6P/0Y9II;SGJdfK8/O?I=
cGQ-((Q67:-<U,Q]=Y6Yd],NJT7-RW]4L&a1Q8R:Z]:M_I6F8A6@Z#0(d)&,&2?G
9V)O>&>N(G\7W8:I5M-CM[AdBe0\ZVJ@bZ1e<7)<6>GdF0D&]=>5DE=/=gFe,L;1
<,-fNCg/Z1Y>2KHK(.-d6R?<_4A=,YJA,_V7TZZ[7-eY=6;]UT_M>a^d7D64dJDf
J1>\,2X(P-K(c.I<PHFMC/_)\ZB=W:<>^9e0K12RIB[fG\1d8g4D2\4Y6;N;K6>1
.[g8dI<Xdgd2a?&T>>_V;Z[EEcMef/<,]PH.BY[68#9>[.R[Y?2U0=(Q)TT>g)V@
;LMU_PA^9284VI8YH,6O2)fdR_3C^:dWc)aB<4+5@Fe?3Q0NP19NC.J_X58HH-B2
^Yf<BMRQ??ZEA-,ONQF]g0PLKMOP+7;C,g(>]3+[WBVYed[//\a;7TYI.X>e5>cF
6C:WIX7Ne[0.GP&>Le;;c(H0R9KfD31-:0_eIKZIV:VcAMf^Pb;D#K442,#2O;)K
-,g/9TYg:V2YgKV)Dg^LB001@bH5dM5[A([W7#[GLC/#L@69]4e</P@F-1=735.X
.?4cV4ZZ]V[UNfA\(>@E+ONSJ2VEcP2K:YQ<F.[BY\ACX6->#5/WG&09>-&,<-FB
Hdf=aOW2eRS.:9J#^QU3N;/T\Ub-cMR>;H5&FG24dE6X?e)aJ8e\8IX>VgIV:FFR
5(0PU)]M<c.4M>&&QOfK7QCLB[4?_Y_S[.2gd@3/@(H9ObJSa.^Y3;3A.#MUaS2<
=3WPFX8/LM9V5-)2\WPUe<@.]c^MdA&d[8;J@F&/6JcOY6]b1#eE9@)Bb@1=Hd&W
_P17c30/Ug&U6@_Sa&b<Z.;6]-Ne@CRKOGK4:MOQ.]KS58]I\J>#^2BQ?3YR>c.U
c._)bZX5Jd]7U+49J:<ff\?YIDc(eDaJ0L;;TMR=H([=)7135+5KZW?g)L>.86<f
0aE>8CE?AUQR#NX,9MKO2C=0R?+fSQRZH]+CS1[YE<W,Ua3A5ZaD8O-6e&_7XH8/
ZM>YL,.<5NZUK0fU3<A[>312dJfV,UNdOCEPFQA)T,e;)gAR)8Y]5-bA<7<^3_I+
4PHaaD_\WgJR&/_G53XRU#>GTO:&_aM8&7ISF&B3WVIBLP&+1&1^&QZJ.[N=+K<A
-g+J+YB3YMOG[QKWKI;<g_N6;>gU#;MD)S-[88-A?&TOBZ4HO/TKM[&.>4;W\SfE
3A5ea/_D&cE[56/I]9MX3@LIf)/GFFVFG0.H?adFUZLLU#D9:674_3a\f)DGJ[\:
<H23HeYXb,OOJcM1eAX+F[OLI:B:gfbY#RKIL<G;5O=R&]<fRHRY(a(9P<.5aU=<
1IdT6Ia\dY6YgT4ga;,NLd)c0NN^M:/TQ5-3AOXU[.(G-Ng+<>/S-XX;D,4<#bAb
81@e]f5(e]V[O=YKU5S&).]UH;)HDOGTDAQ/PDK:7X[@,Pecf&g2QUJ-75V.L5U_
e>Ye2@Kg#S7;VT.SeAWW/gQgKLbVJ9;@O.2^gM\=FC\4];:^N=B;L>7YL?_+1bcf
#7)Y<?a98f]4?=\)DK@#K9=aR[A+>JY[JEG-2S@U)U]2]AC\_JgG\2-?cM@Jg0X7
>2cJF\43^O6PCOd/REY@XSV?XSN>B-4_A^@(.S>ab2U]\T(\^Y=)(W;?dSeTbJN&
d)4cPFaS0e]6U0M=eL#D4#aI<ZSR>ET&,X<ZT-0^]]O&.^W\:c/W]U=/]a^F@;22
]X<SN_(?.#]gU(d_d8MLTA)M.c2++J7Pb47^X0Uaff4J)ZA=#)78e^A>baMUgUe,
Vbc3\&7T;O:-)QaP.@B83;BY16K@^eS>3cdZKdIUZ-67CAB(GaQ<f8\\L&^FI_0[
A)&I3b5TN8+(62V[A_L\TF_Bc4Kg=H+OV&^_]V=_Gf0\0UKL+BbYbSd5>[b<3?QU
2Q@]e^U;>-/gI(&dXFH.U)##/Y,2(<7E=NK9f#A+ZPb]3E3.fgP-+>9\Q1R&2fXO
c&H:16]@5V5c@dO]&I)(Q/^^ZUc30_AVCbCHA3(,QL0D[-TRHZ@NAW[CH7D<5G(d
2)UU,#5LRY]5BE#C]a-aH.Fe;XG]8fLAD3>6E^(MG[9AD3E9K&4-/CfB#,F2gJaZ
J:M<X,1\M]T__F]9IN+/E6^W\5<[b]e#QDV?XT[LQfb:(?G<>M8CFc]Z=T5JN<3K
I7agR6+a_TOK<(2.>QGV>.[S#GCN5D0IK5:+_3f/J1Mg9QZcQPT4W0cdaIX0GSSS
:gG8#D?):5FCfN.KJ_@-+I0,4e@9(W&KGJGO6I,)OAGDZ5@.Kg0H-7FA?9O;,69;
N]/d>JeIM?3C>aH3&3\(+GeXH]/Z+eTWS>,2:C+I8/3^2(BH5Ge5P_SX>Qa\9RZ.
YI8-7)CRDYJM1Q617ANgK7e45+3gJ.5eRY^I&7;R75B0)4CKg#0LCG1MJ^f)U&G<
1XNf7?3PO^,R?/bB:,[WAEOQ.J@S#Yf]Qa<@Da@gGL0R]QPO]a/+<(UGEWJ7KBNT
V.&-AfaB]bc?V9\FVK1<SQ0FDHXBDG^Me;FR\(8_a=JR>X3b)(#+Xc:#AL6Q.KZg
40WQL6?301_O/FC]YKR(/A=C?_5#^daW?(YLWVGAWA#^#[#EVVc:,PXDeL3F#&@,
W6?A?8L[@[2Z6^4?U].;8^-ZR--4/I[/[QC]9Ze0_@7#]gc+LQ[9QXF>/RJV>=.:
ENS>^].RA0.9Z9]C?Y,+7ggP]Y&\].&H;Td27HVZ?GTddaF,;+I4@b=B-/M==X8Q
]-g:0.Ud[BKZJ/WG@AM38\aX35A>_C?-b56]abe2Z9]E[18c?/O]D?XB,[2C>8&/
]J2OCFOC::FYIe+MCXJb#_CI>]fKHT5<HP7]N[BIMa<]W4_#RbgU_3SO-c5af_PU
ZSX/(J_^DS5cD)374[57_B_eQ_AS-GL+1)=1a:#H8CbZ<cZZgZV^WZN/f[AY8;P0
EX7Y9?;;/)aIbA7IB--DbC<)JKb[X:U^L?>-FcZ+XG9ZG$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_S25FS_SDR_AC_CONFIGURATION_SV
