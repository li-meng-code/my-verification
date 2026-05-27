
`ifndef GUARD_SVT_SPI_NAND_FLASH_DATA_CACHE_REGISTER_SV
`define GUARD_SVT_SPI_NAND_FLASH_DATA_CACHE_REGISTER_SV 

`include "svt_spi_defines.svi"

// =============================================================================
/**
 *  This is SPI NAND Flash Data Cache class. This holds Cache and Data
 *  registers of NAND Slave device.This is instantiated inside shared_status
 *  object for Selected NAND Flash device. 
 */
class svt_spi_nand_flash_data_cache_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** 
   * SPI NAND Flash Data Register
   * This buffer holds the Data read from Memory Core
   * ECC operation is calculated on this data, corrected and then pass on to
   * #nand_cache_register (Cache Register)
   */ 
  svt_spi_types::word nand_data_register;

  /** SPI NAND Flash cache Register*/
  svt_spi_types::word nand_cache_register;
  
  /** Valid bit for corresponding byte location in #nand_cache_register. */
  bit valid_nand_cache_register [];

  /** SPI NAND FLASH cache Register address. */
  bit[`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] nand_data_page_address;

  /** SPI NAND FLASH cache Register address. */
  bit[`SVT_SPI_MAX_ADDR_FRAME_WIDTH-1:0] nand_cache_page_address;

  /** Specifies the Partition Index Updated by Program Load/Program Load
   * Random Data
   * program.
   */ 
  bit [`SVT_SPI_MAX_PAGE_PROGRAM_PARTITION-1:0] cache_page_program_partition_access;

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_nand_flash_data_cache_register)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new status instance, passing the appropriate 
   * argument values to the parent class.
   *
   * @param log VMM log instance used for reporting.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new status instance, passing the appropriate
   * argument values to the parent class.
   *
   * @param name Instance name of the status.
   */
  extern function new(string name = "svt_spi_nand_flash_data_cache_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_nand_flash_data_cache_register)
  `svt_data_member_end(svt_spi_nand_flash_data_cache_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_nand_flash_data_cache_register.
   */
  extern virtual function vmm_data do_allocate();
`endif

  //----------------------------------------------------------------------------
  /**
   * Does a basic validation of this status object.
   *
   * @param silent bit indicating whether failures should result in warning messages.
   * @param kind This int indicates the type of is_avalid check to attempt. 
   */ 
  extern virtual function bit do_is_valid(bit silent = 1, int kind = RELEVANT);


`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Pack the dynamic objects and object queues as the default uvm_packer/ovm_packer
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_pack(`SVT_XVM(packer) packer);

  // ---------------------------------------------------------------------------
  /**
   * Unpack the dynamic objects and object queues as the default uvm_packer/ovm_packer
   * cannot create objects dynamically on the unpack.
   */
  extern virtual function void do_unpack(`SVT_XVM(packer) packer);
`endif

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

  // ---------------------------------------------------------------------------
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

  // ---------------------------------------------------------------------------
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
  `vmm_typename(svt_spi_nand_flash_data_cache_register)
  `vmm_class_factory(svt_spi_nand_flash_data_cache_register)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`protected
Qc.IT1LH;>D0O8PcF,b,aHQ5W,7+dX;_g?C#BL5-]<+X<S]:eP573)Yd?T]^^X=H
07DEJQ#@d+\BZfH\W_&Hg^+RP+&6Nc?1YACQ<&L;:X\DEVS>0P;UgK4@7H^RY+Ig
-(d&U3&e^4_RT6+H1X+P<3)&XD.Q5KfP4WRG36UHTNOc=<-2Q54(;YE91R:H22^b
:=SO^+-LV^V7.;)TIa\Ya+21fR+\L.&(&(OV27\fad3#VIc+@ASJc#6,NUL39#e6
N4+LaaSE>0W#3>/<#=c<Vb@=5XYNA3X7C>AfZZUT]N::QV7SN;Jf_O3HK<13QD;+
;f&P&0<?98OI:<1#<FE:UE/(M<@^R5<6_HFe=YK?MbTDQ4aD=2=(Z]YRe:UL/9cF
Xb:++cFC]OX-fGC7B9X2_?2BEKL>75#+5F_BK+UV)BEA>;\dcb>2Y^.UagMf.=CX
:9T^CVAZ)XS@1>QZ>gO>7LY9]:OKOEB+1P2H)0M_WQ:BWOT;<YMd4D3Lg@VE.GTB
?;]R\5.AV9S<1O#).OfJ2?+Q7>]=/K1N-=K,d)Mf3U5--R+Qd@X3+d.QM+SSJKMF
0W(J;,]X@-IRHDQd@N0YN.\-b)3Q+E;CN#I4D)H:Me\VV9@a^O:DTb/Ja(8#U5]f
)G]&/,.Wc^AA_+;#5f]4.<A^K\>LNFU;KL?/3C0KgNWG_YdP7f?Vb>;f]EgA&g]g
>cJ6a5#5GS]A/$
`endprotected

   
//vcs_vip_protect
`protected
V+Y3L8+<V/+E2W,QM[AUa9^2]LGS>a9D8^e9;UUMU4J5]BZfU?FS.(7R0,&,\W;b
&e/,7]V:B&M)e@]LD;FYS2FL&4TL:R;gFT6?bf3?\R#0U]6--1XW>N/g+[G@7dF+
L>:D[R.N0BE/fPXDPb4\V,Q:2]HWK6ca79>\eY?TU5]4^(J^)O=:)Y)O4OPW<P&&
-\C4)DC8YB_J@M7JNNUA3L(X)7W[8LXLa\#Q)1/B9YZOJE<[Z;3T_K6>W-.O\I#@
;d?&J/X^I+^^VEb[_DMN;:&HA<a77OYQ;ROL;J<IRaFK-1cYN&c02]]gV>9EUBO;
K]31R(>1,+WR@=#;F4BM7f(-6/M62:93ZD&6C^&8AOa^M.B+H,R?AWc?05SPT/?H
UE[1QFA.=,KM0Wg<RJH1)=E9aHR^U&>0:^NL-g;a6=6;LU88QQ_=<ZX=?[<Jcg5V
:-;P@LMb?SAR08+-a@UQX>?6_VNGBB5b\7?)]bFbWVU5>bEY_Z.ZOHNNJ3T=J[BU
g(f8772Ba;J](>=G,F,f1M-_a@;+]L/MdFT^LH>9^#MTDV2gJR,^dRQ1YY]T[3TK
V2\,/eFc<,6\d2HPU.V;<./,H3)gCc?S(67(bHOH,c=FD7P)AM?T+A\(TNbEM[X@
&MR9O,OO.ZF:^5C-9>H:-82JN:JSgPQa>gZPS@,Fe:;UL_^7^d2Z8D0D0@7Ag-5-
;a/eV)2e,Ye,D+@(6^\HHL5S>7FS&9WSHf2<M7Kb>V50ATA_-]ZECfeVg.CGTaSB
G;UPC4f7_A]KfcDBBdEL;RMUNQAHJ2&)TF0,Q5cb@HOL>aL04/e/2>C9Vfb@=J1e
IGI[K4_DZ4+Z(32U&:-)DVP5M9REf]LT:+>fIW5Ie&U(YED.-N(A3dF3#]Jc@84;
KDdRb2)_/FJeR30LVB11TCLO]?f-V95]SI11H5PK]F2287[,KFQ,;<:UUJ.X;7,0
agc79]a_b,V;NbQ-0GUE-gX[;@]]55cG0S)WRXgIQL9UVK&8Ief9MZ:U:KBT0<VA
2HeTbGD>U1FdPUK-+b&)SDR,#XQfY>(d_c<g6]>.?.X-Z4P-LY95TNa?dK;XPU<E
?F^&XML[d7Wd8X7dV2=#P.5=O\IF+.X/f5(eHQ2H0)T[^GG+1Ke]?W6F,X@\SJ#=
7-6<ZO:e<##KgQX[_:9QOR)/?Xb2gE=.Y0,E7(5(WMDg7];9\AR?;X<d\H[C.c,<
C(LU.;>//?OB0TMFgJA#,=4O<0B8PV-EO)<?O,GXb?(VH(g5aV&NI@57MHIJS_-<
#^<<V/(Q#Z/@4<a1@4b:ADTW+O5OeNAKSRY1TF>LV,IM\1cXE[ZWTPU9:OL0EC/F
3#(8/U\4M?CA;@>J)TKWfg5a3[GGO9FFGZJ-=\>01]g-_\O8C3-TL[B4dGS].dZf
YMYeIPZJ4[6<^1X?7G?0E+&,O\<?K/Wf_T?];ME+2;GN9a^SA4][O1/IX:M:AR]N
X]B7)#Z[CDDT1V/Fagf\UT907#(#88a^E0>Ke7DEb91\dUL\P6H+2<9.XH3,KGY:
8_X8<9M343P@EJcY]gW+HPZ?QAST-;2/7(WDM-+IT8=0>H?I<ZQSZ,?;WHO(UA+J
54b?4TPMCVM_2YO?fefVg^5F6SDCY#de[aCY)Mb&KG@NRT2#c-VDSQKM:UE+Pa@^
38.1SO6#M8OZ2=0M(F9^Z&XcTH<IKF@^aK8+W33C^c+Ud(e;H2RQ-ZX&VB7J<78>
A,)(FXQgU_[^gfP_e2?H]FfM^H2)L<5>69V[J-+V,;]XW@@=@>,L@J-ZP=Ee79IC
]R>G:--#:>6CRC</VFaSa8DHdb5=(cWLP6&ZQ@VP_BFJD5:JA0aJEE8;)U==-2&A
L=>gY\:W]ZIZ(;faDEcO5(?@T+7V3#RgL^5#2c:8][5[HVUF@S)5CbUP8&29/IFK
WX(4(L46K;L:2^M;;0K@2Vcd+)R#2Z0/,P9_GbQ:[aK=/N[-IeaB26DaTTAT.d)-
EI66gBc2a0cSXO/#/gEdb:(I;5<3Ag7KD;Z_.,@FWJ&?TW>fR&7I3df@4/YC(4g:
SD?7;e_(E39PSW.C7J2/P+59.25ZH#K[G&E7+E:<9eVX&&I&_,(#L,H/0&5:Sa8.
YVd\7+=.aWV5JIOWSc6N.ERZ_ZCaEPb/_[Z/DYB3@9/P=4HD\H/cO>#-13PZLO]V
)6]SZ)(/b&HdXUSSDb3M-JD5Yg)&fRID(E>Sg):5LAI;ADVHd+S]EAGZT?9?^<ag
W0AO)DKeJ?f\K)C2#@OgX-4cR)<[\#EEUHR3;3^-.S<7Pe,/2U3NJV2HbV(54&:B
M:5/Y],F8WR?D^T#KQE-A+MA\?Y._._>:YVKDO:4f8;R0][_V.,fPM=bS0J?^Q>b
T=]KZ[bJ)?NbcPO_ccV+F]T\LOWZ+bYEM8c:[d->WUO@3L<WK1.^J:[RaC+#ceO:
CS7_Ge9F6YJgQ8EWT3N^DB6._(\fcG\)P-Q<Rg\JfGcJ6_<D4HF8.Ue4-L]2d9O&
W3O5KK3M0_)22fFAAB6A\LEV-LH-fJ?0K-^?MF[[V+9)B_gCV^YE&9<6(;._>3BQ
/W/?WYBN3L4[\g)B24ad3H8_A2.#@O18TSKII8cF)H0#UC#?H+9g3-5cPg<8-1MM
0YB)L:XAdBB56[B.IB:Xc)WDK?XCG9IMe]L<\fcf/XX2\\(;1d0W)<b1ZdgEMH(b
d9X/#a.E5:QGY&)Xe3S+K[;MVQQW>N4_Z_9K)0=&,.:&ZAMQa]BOI-,bUL2aQ/JQ
&]-9>(\MUH]2@7QJV(;LGQ/B1bMKZ-Ud,LdUHReef6F0F:ZHdfEF1,L:\cQ/,U[3
&+EWd#<=RcMDY4TT-cAd3W?\IGHKN>AQbCP/J2K4R:MNfZ.a1K.6C<?a3aQ;]JA-
+d8\4^:^;PbMFB#WOT;6U->QV[)_622DL5O3e@/VWaKS/J2#bc]\XR2S=G_@)B[7
E)@WH=2,3bJI6,9HE8,L\Tf-&)SEY.)FQ:QQM&O7#M3f48C\ff#agI59cZ.LA;H6
a>N8=MDW1Xfeg3O>V-;S8X<3EWA7=19V+V[X@EMXX265]IY?&3D:62KeZSg6KM4O
1E.#RHa3C+O8I1S?[:T;54I_?PNA.fNJ7F)/5L/DKKY53G=5f1IL\7)?Ec:gFCDT
bGWVg.+UEgHXGE/c14381Q9eL(H(@<5JY>PL+5g-M7LW@HaU[J9^YT5V3M>B_ReX
f>Q^Rc>Q8P+I>1#8&K(DZK^;M-NR^-\6L,F(0S0YCbMYR/ZeER4=#ab)e)C594E]
.a51T8G9X)Y24&<47<R3,:9EH;(_#\]5^aSg7FE#cF\9T:Z</ZR^EP?MeQc(bABU
N98,]R4Ze.EIaT3eUDR>WR[_VfgeJVa=(Wbc+\L&66?FV.+Se#XS/L]]R\T:?F4Q
deQ/P?/1eX-ZR.@ga;BN+1;JXD-Ed-aVEU@(?U7MV^UPP#=^6LZJX2V]@<cYIEd<
Z[3R[4,Q)E/E58Z#^/cX?Ac?c,M:1W)K5MF#KK;;ZM7Eb^56KS>.2X(U>1+D4-1O
PXT87QI[HFTP;2f@<COC8B)H.]-+b]X?d/_HPE:Y65bC_?3J_RfFgHN>4dZdTbC&
36a#_B1>]S.CIcQ3[LfR(#OCCU2MR:MYMMdNGTG]3g4f(XESG>]aYP#IYO:8W3>,
7T>J=da5X4d-LaN(B)_b2cDXFWdDZd85&&W&I/O6HZ6,fY9e:Y50#<NOBUAE@.))
19LVJR0;LfY3gTF5J-<\V,6K.>QFHREOX2MNUE+(0GULVDFbJUFTb)6&[LfBPLdg
:K.^F09;Ig[d(g\-\=^WS-DPc^KKWWeGg3_CfJ7-&&QY5_@K@/b6?3CMSZe4gaIC
b/.c@==ISKMLW3e.7/b\X@=?L]],_([OU@HK&a1SYPM?d,3+WcU_]7><a-Pgb0B5
M55=8CP.<g98[1H.T.ZKP#;RKf]GDXY#R[#gF]N0#;D#ATYT[[Sf-5g8S7=2bV#Z
0f_Rdd[-HQ8AF=7XWe;RY8<UKa&<,9Yf;JJ.D]7VVXD6RKYbM3F=R-W<e]a@-U?A
aAR-Xa3CB3+?A^[:fV:3(C9ORbG648Q(XSN,XI)1MOf9aDfT<I(dBYRcYLfb<IY6
=OZPJGQIM((2gDC9NX\WIP9]c4B;T/F22RP,Z]F>d#J57=98aHVWV6I;;]LCQ0_0
<(PFI(I#3^c0^>g9+=T.AI13HP6A=?>)60WT2S5/V3agc=I;H@M<01cc0S(E+&E#
faa.\\H;=5g3L.S:R/1#V@TafOQ>G=a\2J=(R\AO9?#K.a4DWSReg]2OdJ\)OJ1g
gdMf6#-9?XU[[3X+,S3Xc..D^P5X96A#K7:Xg5;@bd0Ca@eaBXV^6/5dL)&99X82
f)b+[;Y,/JTAB0I)\4:RRPFVH^NF]ND]]H:bg<PLMI[E2@P/7KK+&:8Wba#NC@UD
8.03C]_-U=ace1bFQA[>G28&+OfF5O3;+4f>(6(Lc4^+FD-D>C47VNL&)#SYBI<M
KM:K?R60^YF7CEV-8#+R\@2BJ>5O+?eTYHe8S2d1I_ODX)bLD82e3[DK68SJP1ae
3UE&Z1.d_#]P;4-d1?]4HF6LO.1I=DAL\?C8ce\;43>+,gSff_&fNC.M<RdX=YY0
Ig:FaS&Y+YV,BI>RcR-=[3febePVXBZ.5#b_(SGY5,bC[W^d;.7K<T-LICe[J=7V
ZeB3&):>U[4=CN\UI4A00IQ95a4[J]aLUOME)8O;<Teg+Qa-C7O;X0Vf115@@8=^
A\G,6e/O95P><AeGXWT?+,6])T\Yg]JQ]gXaT\\CeNJQd/b8<&R8d,SFbD-ES-R:
R(YPW411/T;=@>a^\:5OVXLb(g#d]g[CZ\]0If;c/WF#^-dcL)+DcTZNMBT24DLD
BgG1=;cSNN?H=A(?SeVUBcYY)/O0BB3W)^:]3PeA\gTPC/bQJQ1+Wc<1Z[WZY63-
.gSCcVM\I&&<P1F)G^LV7.B2a&e_X;>ZFL.4_Jde^4/:&3DR)F81HISU6N5)(FYF
ZEGVOb7BRLB\)7U4b5>@,^#(P>Ia8(C?-=5U[N^NcEO#4]V6&TNeEaE[EZ>O+a,7
aAfY.NVdBBM?>8_3N+cA<#g\XKeEF[6afcSL]?7#GcL4Le@\fU/5B-3,FE@,?NZ0
a?Xce@VaE-XbI0/1B#O0-+TI9.^bZg>a[/PPD_;YOCT^ZS_7aCdf.d2L[S9QJf._
N70:X3=+23J9UAa\f9BM&)C3T/[&637Bb:34UE4EfgT=&5aE@YG@6H)E>K[0\EV)
VR.JF;A(5:eKM)3L9[c5;20I91E^/eE79JaHV80V+EMZ3F^0eW^(b\LPZG\-/ATO
@M8FR5Rc,W6LM)1/FQg?3R;NS?aeBPXbH3]IKNa<;/N=e13+)P_9F;eF:W]F5L:)
D@2FSb)8:>?42G5]0+O[&5JaLSb7JVgC.OM]fc=gT6R6P#JICLLD&Uf][6-R,[f5
BVA<I;C9VUCA/S<<Fec=IGdSG]@@HR;PFC-d<O\ILU<Qg)&2NL,9@P;S@U_Y0+aQ
,JWU1FT@QO_EBW<E,bLF6,]c5LEWbfFV0_<ITBa(/US84@#7Q8Z53D#,N;Y6VVgg
gB(H(Q7&Gd/C\;VT]F0g>+N\4O>6ITUT\2<(b:LJA20D,bd6I5NL[2ED_1]:9V=L
9#HO:HDf/+VH07Z+gb.=_a)#&_-2Ibg.,^R3@J=G4RPAaKR@6T(b].VB9>G]Bb]E
A(W^7Z;d7AI+<_04MU)Nde8NR[.E\P[3[g](4;a#N56IJ6g5.(T=(AY--)F6Xc?X
=)GMdReLF5^^5[-)6OFEa2?L-O]c@X4<<5gbLP\8=g(D4G9d2J27,-SRH.91)#6^
_\+F>2H&]c4Q&4)3MYSB(:\E?+M8@&.c.?#=FP24<G^IG/LV6?fMB.Xe>#AZTUb@
@?.1;Y2gb/3_dEW4+=_FGC2NJ9dD8:C)/+SXe)5+1<DeKQZJ35[I#3]VOCSJ9[g7
[_)6GA6#0&4?(0:369/-:,V^J;LH5d3-c#5N]Q_^^K0B9E+35R@T.8[A7\L_YV);
YQWE@Ma#()-QE0Bd3&-J@E<68W\@&<^=#/0:L\TWD=b?(]\,SZ>+>)UdX<FOEJO.
)Ub;HO;+;f6W-2gA;#^/N>Pb<_TPbZ[HQ(][]JXBET&/YG;B:H=cIWEe=U3JUC&P
GO4&c[,aAMLGP(^^K1/b-Q(F3#PC)?L/TaZ>aTX7D,^=0-;)GZZFa[^F^XJU#+BW
D]:HD#L,0G69(OP2Gd\NeTfNBS27_JHCSFD@C8=0?ZO,c7AXd=12IHd]EC)J2(bU
Sc8:[]4[/WgYUe14(K8cN)+Q5]OF/B)f4PKD[6S@>Ta(R[g)UYgW3C#0fF.IDZdM
NUB<MJD1R+<#F_GTN,;Be)Md.[3Z=CV?^ZYDgD[b&=UQR(8OBY[c]+8N(M0;3E(+
EfI[<U5Vf>BL&9/L82@/_)]+SH?Cg+/Q/EUE0U-ES@N<fg8fL8TQ+a4:_LOT)7YT
1=b#VK(.3:V6GXJgPIA,7eR@gMH?D\A-+7]E9HdQe.5/C&8g:/Y/NSJ,eK9g=a1V
4-F8f-H&EdI9NS7A]</TdKFC9N/10DL@L0;094ZTD5&=C5[&a2^NI/2-[Mg4U^BM
#]e\LBQ1cOA<80,:(fPb,/&_NE<FC3SV5C2?R0[&7-UaV^Q#KS/K6)/U<VX7FXc6
baXBXS6T?fE-]a[)b>cKKD+5Mc?G0XBB6?RD8JK:8J+e:Ib>L<7I9JM]WU]=&,Q#
;[/g;AXGK/W_)b]V^CQPMRa]f-SGXcN53([31fc<:@;@&RUUFAJ@+SC+1_(e.YJ4
WgFaM^?\-fP5N3=Z(K90^6#3V\R.G0f#^J&Fc1OD[)0eQ;#HLO(54Nc99O.9A=[6
_ge9YEH[KVC122RR,a34E2FPKWM-HT4QS?0UBELNfc?443(.SV/T:Ke\@e1WET>d
83[IX9DMP9B:QFVQ_CJcO,C>g6#eFg6(@.IAW4US6/2?WH)^-<.e\;.//2\^X\-5
(JE.OQ7#M[>75K,gd2:OKSc.^6F)UfV]/b?;2D\JR\9)&5OXIYSeMcfb\13gG@8/
Gf]DNRScJeeH0,OJJFc\cUX1C];AgH1</2_\L.I5ag8)4;;LI^7F6WaWODe\VYLE
=TCZY<\_9G,,e-AFAD>0X;dJKW-#8GC9,.LC<Q,7eA+QdEIK4D3YgP^>3-&1BeA1
5&>>A9C1/F/?PFLO4OR(:@@d_G;+,W0XF2Ad)]#A)XB>Z=Y^J-6P:^YWH(DUg:f#
)>@Jff6UbGP7fT[c>Ug)VNb>cP4^;6PS@6a3_WU#SdHGOI/;W[<<7c6=DUV6]ZKU
P2)Mf#2V];1T\)L>R)&=\<:(_/b2M:GJZ?Ma.]+)N^74B(E6.8K20GBR[J9Z)Ef.
V)Z8^53P]X3PcG_(Q2.8\LQ++a:I4Uc;6^NQM-A\5_gf1:K,O03b2gV>)Rc2_TE6
AbLX@XX2d9Q)5Q_C^:R3bN)[1)Y4,+-UNgedc[)[DS8Q75#+MQCQ:A<T.4YPcIeO
DZI4+<a];,ZA5V,&N@WS8[O94g49=4UQ<:29fa(C+M85#7Z)gPQWB^C7N&EDR3CY
QX2JAP2;>CBg>b#&EL<VQ#><b\\+0FG_d_Zc--O3-J[3,W:U7ND1I&1MOM?:ZJTc
U>E91^d(<FXB5NPPY#Y(5+Faf>Ef^^L,#/Q@?f5b6/[Gg2(9f8B-YRdgR&0(IIVd
\7D_S0bXWROfFGU0)e(D^ZZE4KL2ZI^9-=>b2.+B0VR)cAed(L:LK@U;4WR/=5C2
]dLV_Nb3YRE\9#(LHb>M]=9NP@[?P[T-#fK7eU/V&gI#3#-87&N);:6dHXZB.NRg
63UOT4S<239fKMWF6TG6+L8H:>B?7<ERG05KBK-BPTMg\LbR:&2N#8f@:F,L4NQI
If-dbgMXK]b[PVCU..)+g3MHTRX];XBaVJ^2L\.4/QX--1^/M90L>\eeQ+PJZ&<-
5IG.U:A4&J:#4+c=O-RQX^R6a8_^#PX5NHb?5;,0&RX8S)XG\68gcG.QC,J+/\JI
+AY_W+^b)G_gSD?SbW,e&,CC=9[aB[BR&[\/D.Kba,34R\N,XYNTG7e/AdReOGDa
D)e<YgWd6b?6ZW/b4Ta)[:6W&^/<4Pcc3&&_?eEM\XR,W4-WbK8&eG^JDLFdgVP<
BR2FO8^AH[8W#GIW5a7M/Rf_9c7&Z)TR)X:-c.1E;1SYW7]+G((0;5.LNQ+V+(b1
E+3b(EJ/14fC?Q<Bd3d>5L+[NHe.C)Jc4eSO3:>H&dY,_Y/LQgEb93R5g^\Ig+S?
97.fIW^:DRF?KWW:dGcYI41XbZW^\HZZ=eSg>9b[>NdB&Z1U7Z)XPKa\LcB8A+4@
QZPX_9&6b-R:X-D>M>>f[b-3:H.Z(M#>;Z8\W@4NB+O:?MKeLKR3>?](].)X=_a>
Y;cQIQ].1X\K>dedYN9_PVccXQ+[#)788YEM4M?=][F;T<2<9/c[RU4#UQ?0aGBP
H\NaB?X8U_JK[?5(.-1/O)COO=aM_,G1@Kba/bgNe3G;94F&&.303P(1\(]N[4d>
FdDb9)=<^?SXbTIZ4IPF8H+>W-<2A^F9@aD<5:.H8DVG3)ACc]8Sc:bJ,^>?Z2&H
MRRBDV<\g5BX:0-_g:2E_=</T4&.T92X8NdT\;d>J2TfBEKP^)4VdbaLW?XIXaS[
^RC?<3AFEZ<B>#f0<JM<>Q\C-U?]W.7gX23@aa(45SbB)b#UEN[-SW#?c5H3[WgK
CGO23:V3VB;WH#Y)8><D;9+c(;76GY0Z;V&dZV0eJN7,T3HY@YK>W/73=W93IB+:
^HZYP1IM@>@)5;)gSGb]4&de;PUTJfT03M\-XKX@2Dcg^<fbFUVa\a(WRYZVDce^
:dDO^O.D8dM(C_dAE+&2c=Y[3,W,M[&I;PP-HOA00P<&RKgJAO)F<5_LHO]41fUK
9aBFAb0VZ1@gW]CfNf;g8FQ]>O+Y+KHAA@U:/R]=^a,g\cgJU>bL:SXGC059R]B:
L;QJ#A6JSE[K?FEB8LG2g5#HYc@AbA]6c7DZWRN4@2<JFCG&BD4ZD&JVLIF+GK;,
d1b<ZO)Y4H#/(G8Cf:PB^/KfV6Z&HY?EBT3WE(\,B<G=0(aROX:P>UCL2g5eT/b@
V:D7cK,B7Ig_b7N+@0_0V54,>OMg]0+/Ob[.8_d<gf\EWVL@(PES9)>W594FL&E^
/9\RT]JAU#B0QG5K2/A6G2?P9GOZCT4Q;g5-B3Y]W_C_WCFaOc;&&QUb_4,AC;.L
VH<9HQN_.B&bQ_F,QV?<W:fVfULfQDYN(]FFUCXd&Y8F_5NF2>X8X;CV]^g/2KBS
8K<C+VZA(Ec;GETCM=(]Q]fQ,e3XSeFQEc^.1_EHIPV,E2K\P(Y-aQ+Xgd?dOW1C
C0/BSf.,?)Q>]5V/=B^R3GE9VUW-(MHGVV+0YbD1&<C,2A1bF,c5@@>\SDe:JLA4
ZUB0Cf)Q&OFSYM]DHKN.+/CLAQb_Q1ZDcRP7IF03V]G07P_L;M9+S_KRG_g3F,FD
@J]3fGZ?JcJHb36S:a1^Y]_c5QfgNHYFCEBS;f9WgD2\(bSR9D7&^L(9\I-6TA-g
D\J_X]dADKG8DEDPdI?.@432UGcIK&Y&DGQW0L0O[+7Z&EO.C:GG.H-Q5fdRb(3&
R4B[IOJ\?4SJ<XeFAdg,.9[T2QSd/c0&L<gU/eH?9:BE)4ZF\SKBQH8-&&b\[>g.
OC>VY2Xa,E07Nd@3>E]D1N+21Z>O+#&DF89\=\3LaCYJ9e>GY3PPN[82L7;PeF6(
60SAO9R4dXcg<:.TJ@9R)QbL5+L8PHf(1I(2B3Q4c-36]AY[ZE;B2JR.&8=A]J8U
6<YBZAYRA#3./4/8BgF5B6LN:b=21GC/;EH,8M;C?7DJ1:40g@d+8e]JX,+_HVC6
&4VL+_=[b+@#Eb=STGfMS#e6;HNFDYIN;=OFU^CO3/.E\.ac;/22_U59+<++XV4X
RDQB81(^5VUL.T;fHG,0G+[.2XJ>O)(A_AK.8ICNHS1M(W6;WAe.EYQQg]e_<2D>
5QPgdGSN09JXK49-]J_K7bfRMP0N,IL(UL+cD@8HEaW,dN+Y_?A+C-W_^ZIQ3TCg
RZ4]/8B),+UYgD7YYC[U;FXSFV48.e9bWg#_-UU.#3,E\Y;7d=SYU=@OV5\;/P=E
+b0?&eU1I4Sa30F@=d+7bd_&+&W.ef]BT)/=MJ)PVFf/YR:d3X#[+A3[X:V84K9Q
K?Q-.CX-MCd-9CUcPKe0aWISGQL#F][?](&(8^]@5:6+E\T>;,R(SXE.09+O4)M2
-Fd#+,TMIIBDUN+C5+DRgP;4a)QP1O+KXO^\GENR;Ue5))B.5^ESI<De?/0&6_J4
S.=9L=KS.5RFJV3T/U:JIE^V.13#>R24:F<+&0A#__,[8O?Qd=4(/:(5H5ODTTQY
AB4SFdBO]Ka4RN_a_gL3J8B\TD(X,-J#fMG_[JREa-&0JZC)4QR1?QJM:RXb<0O9
HW.N,e\]84_G1gH76f+?[e6J#].[^>AIF=EZFJ+TH=XY.aa5)2=IgV#RZ);3YMNC
QbJ@\5I48Ga]3U:HJT9YN_/1,GQb9L-D]Wa?<6P#-,9W96gdV1N.a<S/BKQ?M-WX
bRGMg2_2\L77VL+V,/VDO.HU:ISQd=3E&c6XA<3/QSI7Y[D(LIaB<-(S[cP)30K<
S,+URLUP?00.2E;+,c#FEZ0SF35^?KB:D3+7O<bK4RIG(L58O&Sed=@=(AV.E(KV
e6a6A7;:_+Y(B4QQ<-J/gKU>Mb4-MM+EAGP6:^Y.PWS[K3\Z1dL)PS>)&,1=3]8-
5>8RB2718XE9/I3J(3<57e,J^PF<TP5Od,0<9+HZWCUR>X4+)##FYQI<1W66Z>fQ
+f@:E#=dL,WCHM5?[Ub@_[cY/7HgId(TT2@VdJbb&[b;9Ne7MJ?[)]a57+-0[59+
IS94W><Gf^<EGe/a)F,J1cBGK/:Z#,+[;_B--QJ<CH/2g]<<^.=ZJ1eP8c;^=_A2
SWE>TUE3QK+Z(f_6f@^Y<IO30WZTT\<N9<9YRC=Z&=BCIYg7gJO6Be/L_g]?ANA5
E)e:aV.\[E=6&_O/ZP[#=CQ(YXDC4<Y-S#K4T03BDKOc@++8IcbHUH:L56U]34)G
SA2N3?ZDH@&CA5N<AVMa4CJ.g+fB]^/)#V@,e]M0=aCKW(QbbAYEbeC:P^0=O-L#
J9H&)>E/./#BQ&7)5HC)8@EI7R&QTH^\-1??dQgZ)ac/A+[deSP\HIH8dbN0KJX<
,fPGcQ-/NMB^(ASD,B06\#Z^A5I^T6LbXf0g@SXH_I0H@EBg<=M7dUA@+eKYBPR7
^&U4G2]E:L_)PQ>4_VU++M(]621Z<dP@I6cIDUc+V=;CGZ&.I<UVY)UP9N#ZWYc)
9S@6UM;(I4e5:3?c5Va\S^S/OV(\OURLB00)4Qd?YVdedg?#g.1U@]c<>@4OQ:0&
V[eXK]=)R4&>9SFP/c-U\QXUd/EMZ2<UI#8V\\5g)?\&J;_T,cFB.R]_C?FG.Og:
?QZOfMFVX)C^9/FWHU9HHW3V-e.PK9W7\/?)I2\6dU:F+^^?C5.Q+PG9[d3AF\.F
McgQ3&YIG:,\\IKE]O:@8F6_(c5X&P]#c;#TbJ)&ZV<3b[R9UG+?1(YX&<.Q/?(b
S<TL0?aaC@eFR1-Z]d.J\3fKV)6<Zg(3Zb@\aa:GY)C/^WU_FCSU_AL?2,89#Qc6
:FE+J<#aYGBS/ZD/gS#J;P5TI,),)(;AAOLEUd+.?f;5AD7;XX.K(1_-dS,5Jf>^
1LRJ_W#<YE5a2.RW0P1IAV6&EBGPeMEaEeV\>[GCY:7:>N27XZ.V>F-6.\^Y3=7(
R)aW;#,37X43B1.e>SU-<FB7D0,?MRV1-Hag]>/X.ECeEHQ0W[=Tc7bYCcg.FCEK
ac-X/W>f6]IELRX?GBXF2W.<8(]d:TX(]ebQM[<#<J5S-MNQ[fJJ@\1WE6d1#e;<
::JSIgX#,L<6QZ#a@b-5;S_g37g6VRf+#9#W8MY]#_Ugd-9eeYVGEC_Zc?TA1IZ-
Z_T50UJFa003JLD8CXN=)_>B6[(bF&QEAK\0Z6G&-<4+<1KP]eaZX=1IM3<1--NV
FK#>:[-18@^Pb+g;HG;9d<@VF-S/9dE\?5a)TMU;+bbO-Rg<Z3]:^-WMMcc;&FUc
>?B(5Wf>HK]O6c)>9P76FVWZe0>6:ecd@g,EURTSe(?@QSNJf.8gT=X?SFCTO^JR
0_b(g<Ug^F/_5S.Q&0&ZH^QS4GRY/+34(6IFB=+X,NB+5IO6]E#J]Q47UN2375(0
=HTG];9.L]WaT@NEW,SJCP&L=4D.@cag]\4AWUW)M0P=+AQUNVT<@K,U;:IB[?A4
_2ARWe&58cD.9/,N\M@4W;dLMQ\d0P6]H.2[<bQ6&1g-//;SZ_XDG>SV)C8L-FF5
.&R3)S/E564ALT/6IWYXg\?)0?R:JGBcbX+8K:SM&4]^=C7Y+6&W6]4R+^2MAC-B
_W3#XC]NCK^Z&cS;D[aS=I>_;acC56J5F[fP1;49ggIU4^<bWCI+G\MH6QI<<]Z9
X0G6D<N^KD&AFJ@\^)B@O8\3eL,8<_O7S;V2Ob&];;93UMOV][&[B0_RLP0-4.L\
(ILAE>42E1b@_>DTc\7NZ6\8NI<D[NBW>5e>OL>HYQ.f--^UVd0J[)CK,gWF0J4Y
_DLY+P8.\bDNY?BbK@+,<XHd3H+?R)K3.@7[(&@)dH1R<Tf9VNU0F-X)4YU>H7Z(
272_HH5cDHV6(VaSdUSVe&cc@Ib^<)^]F]6088XJ&MCfb08)F=cN<^KTINA#0SdQ
?_b-0LC^>JK[/Ma;UgME7g:(eXW3eCK:F01+ZWI(cD):gc.=aA5D:_Y=O.WUdf4c
DO_V,.Tf/S)X6d5ZeQZU64RD1]3Z1HAdd_D^;U0;60/88;XA0/?=08M.Nc_0[W0]
3=UJe+I3D1GfP]#2N(O@d1]BEaJ2L3^NM?.QSILVf=V;f_C)a;X#1(7gZY#TY85_
-@<4D?g&V:3Q0.LC@_)DZ1d4[W)5f#X8.&b]gG_@Da]5+/8.<TU(U+MQ1YJMAEgE
ZYc2K-T:C5C,25M-_=>YQHMIG#Mg5]e.AG&IZP7D8)\J(Y@GK3-)6-&9\63[a)&2
^;<#79R.&OOY^9NOUH+?_dW_9?ME<<+RbXb?7N;Mf7KWZI0c5;Z]afcCdNg@N.a9
7E.K#A\KUb?64AT2]4EVfDT.^K,/)3\A_gFC)FaP+cd3^g=L.B.>+AKB90dG1ML3
J..<447[Tf>B5c_]^R4bMKWL,I[H.UWB3[02gJb-7Y;O]00P)..I48f>VR9(U4NK
1AaI3=U@NJY^9]WQ2?G8ZWf8=Pg6XDY8=@g2I>bGF+76\1SEHS?P>4W.^E=DJ9<G
7@UJ6X?-RJ>O,8FJJ,<Q4@,YW5YbZ3d]0+ZV^1a99(@9_BD.cT^?]Z636Z=31d?5
R.U,)&M+^GeM+@S^0E[@gdE0b;Q.Tc(]-@7A3[IDZ0bY:(/8D5D\Cg1[V7a;A-)Y
,N-[OFfK)2#7D0K0[6-)SC+Ma4Gb+IZYAFE^E0CZUY,?D7WbJg4I@YFcQgT(BZ==
@6^AcI-_6Z>JY:_Q;5X=>9/.GOQ9\MH]?CgLFWI=?c7OJC+(;OK,JS411Ya)+eDT
#E;HS3XEgZ#+e_O+3^Eg)I9D(KFHYW\<Z\?;;=4=+dQEQbTTT.MTL?@SWT-7U.FF
.&f]+^Y]B,H>KBPQH.Xc=cC;=/__JV/)Pb0&Q0\UgOV#Cd8+MC45[(;H=+ceJVdg
\0E&()R3[4.-I]:B[d<XZZ6H3:KX&7d2;d.eM@AKE0,QY_L4/K_:]U24_a^(7:N/
bYTND>6)5:@AgeZ45(aQPN#gX4,KBVGF&]MBR_06fBV6WD4Q-2A[IL^4a5^B5B?Z
A=4\YSc8?QT2.A?_XUR+c30=Z)\.;a/\3^,A/K2ND,5I8F)_LAB&4+JD;W)6=\e<
_P7^D1<2/>QeNZ7f22]7M<HRa<Q@19#L(Nb#/ONBa:89?#:D&89>[J02)?2:OaH6
ER\JVL[8YL\bgE:4RYH)bM:M[QgDOL\J+)Z=f(UF)6+9D$
`endprotected


`endif // GUARD_SVT_SPI_NAND_FLASH_DATA_CACHE_REGISTER_SV

