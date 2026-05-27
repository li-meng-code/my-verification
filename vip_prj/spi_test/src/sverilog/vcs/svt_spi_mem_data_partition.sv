
`ifndef GUARD_SVT_SPI_MEM_DATA_PARTITION_SV
`define GUARD_SVT_SPI_MEM_DATA_PARTITION_SV

// =============================================================================
/**
 *  This is the SPI VIP flash Mem Partition Data Class. <br/>
 *  It contains Data and Data Valid Array fields to be transmitted in the Upper Partitioned Data.<br/>
 *  Currently this is used in APMEMORY parts where Data is transmitted in more than 8 lanes. (16 lanes)
 */
class svt_spi_mem_data_partition extends `SVT_TRANSACTION_TYPE;

  /**
    @grouphdr spi_trans_flash SPI Flash attributes
    This group contains attributes which are relevant to SPI Flash
    */

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------
  //
  /**
   * @groupname spi_trans_flash
   * This field specifies the number of Mem Partition DATA bytes in Data phase. <br/>
   */
  rand int unsigned data_frame_size = 0;
  
  /** 
   * @groupname spi_trans_flash
   * This field contains the actual Mem Partition Data to be transmitted. <br/>
   * This field width will depend on the value of data width configured in this system by define SVT_SPI_DATA_WIDTH.
   */ 
  rand bit [`SVT_SPI_DATA_WIDTH-1:0] data_array[];

  /**
   * @groupname spi_trans_flash
   * This field contains the Mem Partition Data mask bits. Supported only for flash Mode with DM feature support like apmemory <br/>
   * This field width will depend on the value of data width configured in this system by define SVT_SPI_DATA_WIDTH. <br/>
   * data_array_valid = 1 : Denotes that corresponding Index in data_array[] array is valid. <br/>
   * data_array_valid = 0 : Denotes that corresponding Index in data_array[] array is not valid. <br/>
   * If size of data_array_valid is 0, all indexes in data_array[] are valid.
   */
  rand bit [`SVT_SPI_DATA_WIDTH-1:0] data_array_valid[];

  /**
   * @groupname spi_trans_flash
   * This Read Only field contains the Device Physical Address where the Memory has been updated/Read.
   * This can be used in Analysis port and Scoreboarding purposes.
   */ 
  bit [`SVT_SPI_MAX_ADDR_CRC_BIT_WIDTH-1:0] address_frame;

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
   * Valid ranges constraints insure that the transaction settings are supported
   * by the spi components.
   */
  constraint valid_ranges {
    data_array.size == data_frame_size;

    data_array_valid.size inside {0,data_array.size};
    if(data_array_valid.size)
      foreach(data_array_valid[i]) data_array_valid[i] inside {{`SVT_SPI_DATA_WIDTH{1'b0}}, {`SVT_SPI_DATA_WIDTH{1'b1}}};
  }

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_mem_data_partition)
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
  extern function new(string name = "svt_spi_mem_data_partition");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_mem_data_partition)
  `svt_data_member_end(svt_spi_mem_data_partition)

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
   * Allocates a new object of type svt_spi_mem_data_partition.
   */
  extern virtual function vmm_data do_allocate();
`endif

//  //----------------------------------------------------------------------------
//  /** Used to limit a copy to the dynamic configuration members of the object.*/
//  extern virtual function void copy_dynamic_data(`SVT_DATA_BASE_TYPE to);

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

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Extend the copy method to copy the transaction class fields.
   * 
   * @param to Destination class for the copy operation
   */
  extern virtual function `SVT_DATA_BASE_TYPE do_copy(`SVT_DATA_BASE_TYPE to = null);
`else
  //---------------------------------------------------------------------------
  /**
   * Extend the copy method to take care of the transaction fields and cleanup the exception xact pointers.
   *
   * @param rhs Source object to be copied.
   */
  extern virtual function void do_copy(`SVT_XVM(object) rhs);
`endif

`ifndef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /** 
   * This function defines the print task for svt_spi_mem_data_partition class.
   */
  extern function void do_print(`SVT_XVM(printer) printer);
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
  `vmm_typename(svt_spi_mem_data_partition)
  `vmm_class_factory(svt_spi_mem_data_partition)
`endif

endclass

// =============================================================================

`protected
BI/9WRC(THcb+3XOEKNH[dP6LJ2Q)2-;F.)#eb#/eQ&[ZTHU]74.5)WYE79@WV5f
-8f#FZIUMX;-635=1bL6c&V0HU;Wf#T4,;MPQg)WRAMR80D&f/@N=d;FbISf,ZY4
T&U5a3>/ZcQ^;@7=fZZWRWJ^dRgOMJd(F_<A5CA^>3#>=fM5T&=Bf;65A)-]&WEG
1L4,()S;1=Q:\&ec+dXK-=J0IQ:([a2<V9IYc=.HcQ_g1cf[@?A&W;:^=>M<e7Bg
WE(VF\OH50CJA3P/2I?DJEW/?C499FBN8:8CO4O)LJDK1I>3[DSFU9M?][AIcO:H
<G?4L)Z..E=@EP_dWN#9UaF.e[3.E&0fE+,S:YQ15e7UW=++QMO7A>WDL^&a2P+Y
D1+6b/:&0&Xb8@?ZC(c^52VMb1>YU;\3IO.Da6@]dcP?.#Q>.U4DGDM1YFZPS44@
HS0JJ>\,__EA=CNV_6EI+OW0eO8I)BCYB.^EW\N^;D8Z#>KL(EbJNQIG:,TO1&B+
dXBS\_fIVa@UFDBM-U]+7OeG@\<RT6c\V&K.^?JdJ)(VXV@37Z?/(I6?0BT,S/fg
1/WHb_MV:-2.\W)ZXEMcE=d?WXd1DM9Fd)f?M>IDQ@10FJ&S,I@]]0,CDS8:Ng4Y
JL>/M>a:Zc^.,$
`endprotected

   
//vcs_vip_protect
`protected
.C4]H)8YN@U6PWa.8^JdbH]P<>K5O?2c11A5\H/CaG],^-:f<(3c3(7b(0-D]&L8
W)V.Xc+005aU41e<cLTEN]&/G^(KPdDJKEIFR)\NRM#C>J<TU.@LK[@,d8e-C1C<
+He09TPR3K79U:T<_D9-Ta<KGKNW.\4C3_D#e<ITY&/8YI[fBHfCc+RB1QG)W=6a
/I11;c&g_PA966b;bAg,U/P.T2Ac,(:4eXRU-C:f\WR,&fDHFYQII03=g\9_eJV;
KE@9WdT2+K\::]M:.;<2?dCNMKX(LTM3/\Wd@a>&,bNZ/&U<]B@PA2Hd\e=^)dKI
COCTfPHS5FY\aM-BE&=ZB_F5Fe4^I+6Ob<<DA591g)&[2)aB23MIL9Z??;G,SZX@
d:=9JD\9I<1/c&bEa#Z=I\Q.DMDe7H&V01LP9+4OBfb@-ZCU.HU3gN(R3@ed]</=
M6?J[:D?D6.cY9ZCVXJX6]FD^OJ4VEcE05d>?F0.5KLV6-,X@SW7974,6EX-VgOc
d7#R7S+\82Z2adG8>Ob7T^BZV65X0d28RX@[WfU6@9TTUc,8X]7V(aX,^U9E&E<D
HWPKVf9L4fH7#WRQ],][>S5/Wc&X6;IQe+LGDI=_(I/EX>R##GY7a+R3IWf9,;YU
<@O8-L<?.[^SW[8Y?@2D66H5_Z^+UM8-DR7,H[TF>#3@JFALKL0OBc3gW:^5+d_X
B>eA@R)):/\T3BD+W\&CYBL#E6J3VHG19\]a;F1)OcR)>df?<TWSQ?L=^gPc[I@>
7XE&YM\4Q&OG&DLL/T>22gc<_N;T8S_?FOMdMBVJ6M_>)M;4aS&/P)=&)G++SaX)
WYW8YD,:8UY879_K;;CTNdZ79gb&&KW414G9e1I[??\(Z&799GIL^W&V#B55.8L#
.9A+be(4<J6>8O8N0\QdQcX3L]O\57L/[-[b5W(X.\FKJNRX53TLd252R@d0=0Ib
SP-K6Pb[>U[4aLeXZ_&(^K0AX)>V8;R:NCS17fFA0XEP]KSW3(3aDI,XVV=T0QV_
?-KD,@Ge(RWGR^6(b0GV,/YW[;>g8;:&(L/\771g0YPeeA\fC:DWKZIKgd5RL625
3>VHQ/(5&F;J9^?YY6KcGT4((eVD]3-e_M?5]GFE3-<>^)9d5aSZ_Se&0b2NI#_;
C18W._W+ZQ6C0f>#PC?+F47Z?SLc[GPG:0V>3,bS8DZ3ROCAIaGDUW>(4H1+,]ZV
=?F)Nd&7bLC+EUUAF8a_/;Z?)/\7=8=,ZD(I?-_>-RF[)79,[9QZBG5Y)MW^V-.2
eVFe53^.CB5[)2TSUfZ(]&TZ9&_+12YVE2[f#&/[^:)GR#H,QgbIgX4=+<:AHJ^&
d4XG6_6-6W?3Ng.41,a:e1[5F5)>\.gNAJ62CE++1^59L[K[P&gP0R+05L89W7\b
];;8<61aR6JSdU&V0dbFD1,_SZG@fI&K89bJG1:\W@CQA)W<eL5JNEMONRBK(^L,
40)IT+/DPTQAb)V7^8Z84QXEK?B9SB_K?FZ&P-2Z;U.,)e7C1,eAb/W\(NGL-A9@
\\W9:ZX0U-&Z_#^O2>eGMO8,=g+F8cTATYeQKL071ZA5Bcf[(4)QH2&Tg_F1G;XG
.GM,N\]bXEI,6K6_E^?&D<+5V=+#OKNJQc-,cJQU1Ee3N;baF-I(7c&R_XD-_5CG
+6^=)UKQe.+Rd,K44>V<O9:3=8aA0O&7,6MX8B0P4IYB&4;-]A<.36;(dPXQ<+&c
b],[#B91/556G3NN\1eKZ@&e(Q2KFOfUGaA7+5).caV7Z(O^gb+[@O]QRI-ed]_H
fW(<_DSX7D=LX?YE)Kg,b>8)MX.T>.(P)-^YW.e[695\U\V=a5KNYaT212A:RYV7
P3=:A]Z5<VTF5F^dVfSI?a^=\00YT=GPV,[Ig]&LX0?+&JWF_U47d3JG-JSFP#OX
=4LHUW>3RY)ELS7#;aVIXJ^a=WcTEHMEB-6]<>&P\:TO>7NAbJ)DO/fVH1_#6Q4F
;bR>Kc7LcERFBLEMP\L02FAP1eQ/T,FC(X/WGQ&<?X8ceUA5S^L)>#BfV[1X?H::
D1(M+1[]CK@YB&]&HFa3WaGOPK(eX/X;UT0(>_?fdKHV]:fD)&2EUA;;C=3-5=5U
IJ_9Q+/Z&B2QY09AE<0D)f2VC:Gb.ILBPZK1<W#dJIg7g+(a+@+AdUIDCY@DRT1X
:W9G;G8=KX?f;>P2GeZ,I&W-;6_1.[S_#?Y\\:T_VZ2IRg,YdId/-KSO6fQ<-9]=
>?7?X[#b6c(^&0Q@2C<GVR7QAISfK#;?H^29TM:d]/;4,;/2DSCL:<E0AOX[JFBO
;&ACgP)M#CQfcWY&3D[M26HTfG3ZLG_JAd03/U4^Z#LWL;-@7gH31)RL@PY?fY9;
9>E5\AeIFMb8ADJPT7+)8:S#Q)09&X(+()/Ve9^#>Hbf?D4>BcLJ??9O3.XNKHFG
5G_cbBQ)Rg]EYYO\;]QJQ72W@Y2J4I?c<@b9c53/^)SJe\cc0S/e)4R;g7Q_SIM?
EG?UeW@G9+4BT^TTSJc5+(N>OIZ+B3B9(L<>Yf&I;#;&-aY)3EH+51.7AG>_Xg5_
e7RZccWYM4A)HGN@^C3<DFD6ML(1M\I[]M.-B/6L]:F931.OT@FG66S-[H?AVXaH
P&&MUg(:(\g.90f#48<&VWT0?6e]ea\IF6,c:#0W(8YT)b=YF.QHLV\QM@N6.?PC
D(J?KJAU#06^6TIcbD)<&eDY4Y:^RL@dH30F.?L7BLC#87I@K[,M(EPQ_aXbJR>S
A9L6>X?=KMa/dRPFI=C7@1/G07D/3+\VHE(C<a+C:dHTA.[5&<:?O03,bAKW].Ee
DB9I;UcC1R#fE2^=GHaS<4;#YFOE0A^I6U9](6ICdA[eO(7Kc(C\)#8]EJMd/\DP
+#>+2d6IUS,NXWI_9(P_@&-SeG)a,a7bZ,2JXM&FF:Wd\[^bZDBd:Ka>Y+fcRE-T
G\R[F5T.6fc>L#c6SIL&VM#H-G\f+2[391=JOBILR[f^P89+CHdW5D/LfYU&T/U.
6cZ6Eb3([a13V@PZ[U5c;IX:@.Hb=G8-69C_]0@Ef=KWJD+T1a,XZSb]>58TAY,1
Fb>M+>MB6\_Y#PL3&@9P@a[OAF:5HgD>_HWKc]CCd/<ed.Qa9<K0LU8,IXU_::U.
@)d0ND81:ccZ<I3Y=?77NNG)>,L]7(&^SXJgaIIMAJ^;LDHDUT[DI)IgFI+b#G#b
NJ7#U(=LN[ac,S6^G/X;7./Mc6=Kg.5S>P]/RRG:=E^f=^#_f)9KSPg83c?eGDJG
V5WH_L_9JMVF)Z9A<64<]g5XM(eLITgX:)abSRFG4,#V>;JNSWOP_4?<[XX/72BZ
V\.=U^J0b0)Pb56NTcD20C3X1M]#BJ6\;[e#f4_e3_UdQ[XBS0=1Y7/Gfg8cAaTR
)^2DfL=5Dc97Cgb[+))b<O7Bg=Q@V0P><9d(7ZDJ//P\CUc6&==\UE)f3T<<aR>F
53.Z3>=#W.3#D0?SK34=g\#Y\d&#3?R2FE7;&97I\\DCf&GD:g\.LRMe9F<Q8)a=
g[]I],<IL(M)5HfQ)dXB6bJSLT>)NL0R=P-T)ENWZN&8(\235F\.ac/g:&Q8>4c-
J39Z[N6I7Q7<;GK+\-8X;NgIgge,K:^(e.<XHcSK/=0DL1)6SY_Y)S977\NVGD/f
;G_06ZT(X+23V7B\\C[8URKQ3e)Pc7XO=T(&^Egd_9f1e^]K2.3.IPUW=E6OLE1,
NLc(XTW7H=S7_UXQ=_>e8\;K)@P>CYR/PDJ(V6dNZ([(V[@MQ@-V^)9MM9NIBN6)
O980b^WH)<H8YC^_fAQ8:GX6+@#b4b0/_Bf><UA,VQ(2+\I_--XZ9979d1.>B001
Q\7OgY-9#b4#Z3@_T7J:;fE@Q=TFPcM#=E5,(N0V>?d5>J>_g>Y9BTKa>4/44TGg
3-0G=;@Ea],[BSJ2g(a^H4?F::<^6ga8NRH)D259M:c3I)M;4D)Z=]06<<B3+64:
Q1G)KTG0N(P^O#Y4KPb?MJ4\PV/BUFCaB?H;dN.L:\\?H>@I2f12=6=;.D:SZ5W-
IZ&/:3dZ\8fHQ1SPQO^Wb?Scc1-Cg6XQ:[I9&2=32#RIAgW<I1Q0<fW<8gc/6:gV
I_&#8d,ACOe+NcVI=(B\9)P]CSTaCZfX-^?+\;)E;ac&@-F@7E&71&9_L[ZEV^Gd
R#U+L0.<=]\Cd71?9DC_FH8KD62PK4-16dYMa390Gb?.d==a^WNT(0UHFf.f#=4A
>&cJ_NFKLW&HRUW@EOOHU8BH(3O4.7K\5AVSQFBc<])cMZcf/U([QQIeLO0HE49)
)C;W6#_9UT?Ob>f1e9MHe[U2I[4/2?30;L3+?],^@cEg)4JD3Md,<5G<,,bU9F&<
-2&Ld&ZCJD7Y(;Va9>AZRW6.N=+=5E0VK\(SbKT=,1#MAX&G]582+SMd:e714VD[
GX-,1H?bLTVc#_4.<.\.G&KOWP<bd>g(:PPdX&.dH8cV\;7I@F:gD?48Le^_f.&]
3H_@eZgO[g064-G9+KJ02(<WC+DL4Z2,4,8L&LSYVXYHO@\c1.]6O1XgeZX.UGf-
O>OdYO/^bN-<4c3<Lg5)eDG)K.gccETZJ357c3#M#W6IZUc7MA^4DNWX&^\>3F,\
R[&E6+F5gObI;aK9X6d3YUH3_(UGB8>7b^H,7TMZ?0dMcS3/OE2MZd85]afYH1YU
8&W=V3bCPcQLNO8)[=T-VGH7@cd=]BDgP_D&e89>7Q2@gb,f7#/F<2UNYbgdW)((
L,[63RKW_@+ST2<_ZAAc<S&XX<]G5J0Cd:>H(fD;4(e#+#V:=0]53;A+f5-Ig/V(
d;,29d_6]B5EUWOgT(N5D@c@6^12;5J^HM@Wa<cd=d\bVCQQZ,QLFQKf]?f-cc:e
Vg,[7N&e(_D]:25>0;I#?X\bEAK?TCAEXVIM0Q-/]=V@U.GdfEc/V@=9QL9)dW,P
3@PBOIE94Ke<]EQF>/#?6N_SZ50b,c<H19B,HgKAL)P_b3UQ8COFa@d>L-ZEKV\=
9Tf@_K>>K-Y.7PNbAAUD_3C)RMSC7#WdBGFD&[M@#2XIB9?:OV8&9b=6#9@\ccYM
;)-eM\.7U<Hdc[L0-#&UZ0#&2PFgC,]31)FU6;I^P,AZ6BIH79>;T?B(WHM<IX,T
W&FFcM8XO#U3HE+Lbb>&T[c+X<+.2e:D]T36?W]+#B^9G0,Q4)abKW+e^KS@EaeH
g?OfCX4g,Tg[KXLG8?:&:e.6Q]<1?O:<D&RGNAPT7.W&4];/#372@3YDg6EC#ge7
:H3L&Vf:#cNUPE?+7FaMFg3T)HQVK\FTU;M@JG9)NQbKad;D^ZVDYTDMe+68JMZ?
N:&)6)g+)Q6X\H7<^+I1,ZWWaSD@d)M[d&LOfSfWWS_1B8RXYR7/.?:4g9D?7C/8
V-K2D7Sb-ICS3H7PC=A#&AI[d_;-/N\\8g]H^B.@)LE^b/NGXedW:^bHQ>b)XLe>
9=cJRGd-B[JGHAGRA>E6T(<SV-2L.1(ZMfSHZFH]GTM^ZU9GO2OO?Q)\a]P6\D]:
B]CS=)OE3U;JEN=_a71^e]61&^BMK_AMI?>bbYDF[RCHT1TA&K_1MLd0<f3CC8/.
d,DbLSW+S?A:[#^N8\I@?PDCT_afL:BVNdE>MX\SZ/8Q^?=,]:O+3Q7[B>F.g:Q-
O-V/AU]?FB;eJXOa<SZ1P9<FF^A#NT1E[S;Y5);+:#RAL^9@>2A?#d+T3F9c>(4P
F/308gA?R/\9.DgYY9_fdL=g=Dc3MH5a19]&>RQL8WXc1HGXB8U815@&U<f?F_6U
?L7\#/IT3(D?C]QS-4G&9ZZN4R81+-[ef-=DI>WX:/P>2B(f=3Q<,UIKJQZ+VI]c
.G=<g&T[J8>eDPLT5)#&?01MD2AX2>.\C:W:b>_&U-B)2;3;:\f3)6-)LaK\>Id=
gFSR(/gV<DG1R(eV#TFD;5,P.4>3a3[416We;f]B\4_(Gf/73)fB_.9&,#K_<X,c
<)MeZA[Y8S^gMH8SBePIg&ae^(CKDZ5[D;G),GRP@PMH?9GJM7@X^2:HZQVS+ZUL
cWE:c<g<MTG+O;.]=R@7L07&&g=(g:Jc,=eE_=NRG_HPVPaXYR7#-0()P8M<0X4X
2Q\JAc29)=,:0#K5Pd)4PG(8HU9/,:=KUWc76-7O;F-11=Q-E)fWM(f(c6gDOI-]
eLO]#VTJ>)E-R4g^#[[MTRL9Q@3ZVg#.^_&_4f_)3f_e,=YZ(6I@5Cc8Qd8ca7=U
N44@7TKeCeC(M5^G#;[C&QKbSd)D=.3O3E&<SZJ>_O4A#71QDW=f\=H^EBe1Q^5A
1?>Q;)<O1aZ&54&LP.[/+d;&D-YJ=aI+G_?MBL+GcWc@L8BY)7bZ7_.ZfAT_RRff
[KbGSCHR@Q-SK6:@L9f;ZaRe\-df>=;HO?WD#=FC3W=+\X19?J=I.fe_:A0@g/Sf
YT.@32^Fb4cXM5?Y/]I#VZ=8\dAPQ6E4O9@O(;DIN\(<f792aQ?,N3#/Q2[e[K[&
ME341NaJPeGAMP0)4&P/7RKH-4_deB=\D:g2WMa_gL(JbSW-:3)]b^E;aPM,^,Mg
3?IX<__ESIXJBD@[3-_ZP@K\PT\gLF<6a7fV^;aI)E-B\88V5BSZ>]<9;SEH)VR9
AQ];],9.?;P7_ZI:_S2JJWQ=D5QX\1g5;fNR>RdJ4[10d#gY2Q^^Z1^OWX8FP6;c
BTET-COJAR)Ef?:.a],^/CKP3;Q-[,&A_9W/+D:^b_/d<\5&N[eP^WgX1E1?2]L4
@8(8eBIJ[09J[&_D6<Sb4g,9ZJ@M,LCXP2,.F^<Gcf0-J^#EOIaO5N21XRa38gUX
N^]XF]<98^5XCCX([U85H2:)Qf#G5dd?J0@dQ-&UC:QO\QQX67>+<,/9?CcI2#:X
Q1<bTC9AC=#Q^&QZPa1TZNN1B5UeKJ)XM.Z@NH8Q7FVN+JK3O].I-(^Z7(c8,KOU
WXe(F-2MVP(WE9fKNHJGL\)Q.AW6[O+7JIEEA+\>@6(1_Ff3SP/T#.#Bb^1Q0;[G
(WW(QN?2L=,6g[Vc6V@F>6AQ><?eeP<:(8@2UL+1?0STIS.+>PV;-81Bd:](P:TQ
VE@+QJ,3)(fd8[])8+D1_B^??QaUYeQ1_Cc^\PO/F>I9HL.^9?b=)THfTa@bE/38
?L@JZ-d4=(;e,TJT-G6WPCRZYea=MQ,a-+/F)6ARP;fEL9B+-:WD[8K)>VaVbQH#
=(F:4,1XUc.Ce):^D-#O0a1^5\I(6OI2W\WD&?J=T[Y3b[@HWI(0O#W-g63K-\V\
[70C=1?a1B[78R7L=U._0THY?3,]a.Y^<L8KMW-,CIH[7O?8HNaGDKP50?#&WQ5\
Q&UdDK@B+7e><Vd;Gf^T2gHPd)CV@PIVdLbV4_0P3ZWK.N]PHM7MN>NS6SW68J6Y
\(NL:d)>,48W\71F@>S+NZc^>.NH]:&\0S.7Q[KI(T53(cJKJY>4@1>L=b36M6DS
84X&LHe4DEP45RE4JP6@&IVd;FRc>P&E1@K82;S9Z?>LLH/7_R-\1G.F44d]YO8L
S7W&^XTEH2:eQ<-Y(O@/+?XC5DQIe[TM-Tc^g)bT;U\99#:8DSQ\@@IUAB&F]D(f
B\K[?\#17e+USQG]/Za.?,+a@IIJHH\Q(Q]_9<7&aBE5>A+)eLTD-[RMd1e]B6Me
W+ePI)eG8CME4&HD)A9SDdFMIY>865F9cSbL?,.<O+[0+Z.B)KTS?MP6fU>K:MJT
Q-=?1c=I+>fRUM;6B=1)[=#gc=aEQ\2N6?C0dOO,#DEMI&Q&L=X)KFX5XEA^><P1
V6Xf.IQZE_4g07+]Y6DU+L\YVPO-<N;.T9TDb[#+Z#E&NM[?N&A/^=OUD+g]MGZ?
T^^DaL,ZW4dRZ<90?9LKaf(25QK4]#-]S/I8cd?&<M_#[dU6_0=DH>WEX_I0#=U&
GS9@:I;P;^+_gX1+NZ:fK8>:3_GKYXAP#I-gM-bVV63:[0B/3Y&^V45NB^+gcW-F
3d@a2eaI.M_K48=<H<D+fFL2Q?]\:f.,Z/6)3M;X#OQJA#[K-M&16&b,1fN.Kd;;
g8FGH8<cENV3WX\5;SPNWZ1KbQGKF7TR5b73Y_+#D)2af2c.(Nd8_dQ[SYU8H>g)
?^EA7DYJ3XF+P7&BY0@\)<OD8c>=3(TDa,D2=e[3?MWg#\DZ[A;901OO.&FF]#<A
:0NM\U\OPZ<gQ7A;,](da,GVZg_OESI?bcP=700KdB;f,JafSe82HfRIXE-?E::A
>Ad.N7?X#G2>#@BGCFM&Se.H9g5Z(<AH.V(6+]@;GbH1X\)?KPGV,,_XV:OYJ<8;
bD6TFYU/V#J8#1<Q9PZFUMOK#L,/27&/K.dTQ3)cIa1?K@=P1\0?K<R_6N9S/91a
:cHVU<(E-dG=\_W&G<V#BQMB\/8_I+8+02F,ab^W&>eKHW.+_Bg;>Q9EVT?5+6Re
;X8IQYS2dAPE&LA]:&[C7J7A<N&^[L_YaM,9IM7Y28H):K\0U=(05E7JLe1O[97F
F0ecKXZdD;PUGaeX>3:Q5WfZLBME9FV]?_<_?J.M+Z+LNWU+&\/C:dDN2SV:a?)4
aMHS)(OU-GIfIE;f/d]e#742T0Gc5?\YA)\Kd@#&+-DS<)P+RHg]QOZ3XD,.3#\V
I<4TXaUX:A+d&T<+0=W_X<C&:/7_OBVM=NM_7ee]5(]gY@-GP-U\.CFW3[_1]6MG
I8_]673C0;N8?UDdFOGO,bf?/)M9KZ]L;A4JFO]e;=4[AdJ<Z>e0NNXD+&ID.bS8
d7PZL:\Icc&-MF92SbIP2\Nd/6eW7Z\--PTa++bKL8N/MbUAA5cS/17\^RKA==75
dU=c<_dA2^GgLD5ZMP4L^LDHIgf\@_#(TWWQ96bZ#.8@GVB4,)8++_QY6T1[QU5F
Y8VdfE=deXH1\[OVTa6U=TM0(2X/SBDQ0UV0##7)+\_:<9/4,Nc2DO\bH:]7^0W+
&RV<9H[HNP2DNWe.7H:3BVGB@#a7c;)7^<<bd<LR[3J,ATgG?&NJEUK@7(DEfTVM
B[+>9O4JafQ(6g0)@P+K9P&[9NgK1PQ&3#d1C)O<,=A3+<CbBVaf2b^XP\>@W:=U
4EW?Va1/6cWMEFcOV^VXX6ZJcc=[)0L]5]B,4EGD](.R_M_D5,,6K]L5.IM.VAb\
_4APO?;7P8.LT(&X1f9]BT7BGEd5@\^4#S[&-(d=^W)f@_7.LP2@#>-8=H7^^bXg
W=#B3<Z;-A8dW#]0-V><.B.]]a9R\(RY>6=@NTQcOC;]^QgGT(#O.V89&;UH@+LM
EA9bHH#]_3e)b[B4/+P@b[G5Y?_]\b0Wd+(CDTe478_Og@1NI\fHbUZgI88?eC#\
NObdAL]DNIf>eA=c8;YEY0c2<fSJT5?@S9.R1_CG+VWD82ge>b+?:1NG+Q0T;cSS
dUYD.9C]FB@HED7J6]I-ZaB?g50.SGC51L@V<@<g,>eVBc/_/>UW+SU[P=P/5X.5
3U&aNH<b9bbBI(E.E_;GR218(RP&OK[G7JBUK>a[TNP@e9:Hf,^)3MG;4N\])@_0
5,>O2=Md@;c,3;^ZXP7)9=3):Ef5I\5.4?HRY)(>C@:,<Wb8=#.P5:Wga?IO?\U[
><R\HCf0(Ha766VAM:X;fU,:-@F2)R#E@aGDH]@bHM=+fC0[#F&;@;.5g-IHG-Me
Ad^BL[E0\F&@efK2Kd9?LD1MOK5+)?,98cPAcY1;1a2,6C-J:O\Y2//#FbREY[<B
X?CJ59M;8-dg-=6#4<DC:R<J#aT<Z/;^RgB;8aLYPX7aU-3F(fLE/2Fe0M(XgXZS
QRZ3_ITT4c;Y,dc^F)BRN];g5+I+/U\dd:(._Nfd2Gd:A3W9:-3NY[6+T,&aUG9d
FJJ0)+gGND/fKYH7RL+\dc>J2F>f+9)JT^7=ALeg=S2HNK]<CINSJFebW[e:.V1X
aJL#[M#,5&#E>Jf/M,;TECUW2+X>6B6fA</7F>g@HEQDgHOYX+[0-CBHB+/#bHg]
2.?C?a&))^d>3@N=P>4V)(5&5L4QR];I-HcV6M>TUe,EHaX^X#25\09ZJeQ4bdNX
&R#Qb0_gR=3Z:dJb<PW^;4H.TUZI<K&;?L5g=SE6,LX)&,PJdXcH]3]Z-BRKFH@8
KS7S=)A4^W>Q+-)5EfV_((:S7-SM=ZK1^(g(4CBUNE.Z?>:,?K3,C)+;NQ9&gd:6
<bNXPI+\VC.8faTNd=1YG2;=K1P9YOfN((ED)ZX9L44=Va(Z^gU3R1P3NOT<9MD2
<Ye;GH8WY,//-EQCFENAHBZb8a]1CXO^-G:^#a\\bMSQW8F+BX8DWNH0V6I82H8Y
S.(VV3E^]8IGCSS@8g-U?^_,]+.Tef\+9-[./>(-1)28-TdT9TX8D,Y&D1RF2PN-
X@5AO>M<F.+S2MT4/YA>UFfE7D0;/5.G/9@fY)d#;0^QR#9OT32Z]M5MPRf/I[Mg
--71CdHHGEH,bF#6WX8Gg^Eb0PD.]Q5Wb-[#Ba;YDJXOI=SdT:#d/EMX-KJ^XADO
RN\ZSOXJ^>DTU/^]O#O70F,XB+@RMcY/,UFW/1<)?VVHG3)ZIO.c_afAZ6>80#=K
Kd@e8,SbYZ?D8L.N9aVA9HM,)^Zf-AO\6T/+LEZC_+J:US<fO9[/6E\;;S>16WDd
4N3K>d_.:-;Z9,RdU-NFeDLOXV#HZZ>6I,fdRQS?^b3A0@ZOB4R#/,,.dg8dY8->
N-PU@b-/3SJ-Jd.A-1-Hc0+@?>]3Q/#&CF^D(8GIJOa\SQ>d-J/8OSOH<bU3b692
?2.g\?@Y0Q#dQQaCKD;(HJ6&QOD^L2=7^0#A9<_:HWfO^L(\65f=])0G[LYRZN(7
+Q&:KdUMP.70g]@52OA.6]g^08B-;U(7Ne6/-YgBV#U5g#\cXVZ+OQXfC>@4;Z0G
UN(?3-d)HdABY#8PNAWI]QUf-d<5Wd@M^]YM[<D,6Qa@PMW:S75H-aG6c(,N7Z(N
(L8ZMRd<d<ALS406LW53G8_9FHdG.=cY62Wb/a):BSVGVSLD]=(::IXI@9&A;XS#
GVW:S([#F8DdgL<9T^L^Fcf1?==[-GVT\Q<d/APF1DA@=81<)-@J#/Xe<gYE5=G>
a\N[P1EXEBSJe:G(ba\2T8@E+PJaVS3C^&,HK0\T<XN?6UG5TN6R86KAO]OFG>//
8FK<V?^=J7>,-PYD6&D2Fb]0gO)Q\Y05_;b5[[D#/b2>;IVXM\=^\;5:eW.^DPT]
BJL)^NQ2S]/V3f8D8Kg<RLdF]=aI(eP9J=^53&#aO7@O\+b?9]=;G_d7If:e+C(c
0LH2f-Y#_X88g;V+gJYDT=>E^b::X<\>IORL.;RHID#8aC6a:Za/gab66W3KIO3;
NUeXU32I<f08,]c0Q-U1I-#(eKXQTILP+H20U@G53:?^B;fd\K8]Q8A+(^A^7XR.
0LDE+UJN\Xdf0/W<#QCIaCdYWYX<&RR4LRIWDc,<@C7OM=>>g0+0OF-:H<?L9W+M
c#)]^E]UGX,aVZ):I;]7JR4Z&>AdW#dE=OXaQb,ZW1C39X714Z>5:VXR&1GaP70+
/C2bUb1\VBLc]a8If.&)cM?]GI6=7>3PHfOX;J/de-FW7(^_N4#J(KZ?c=5K/=[\
f1M4[LE:8E[_O;&)Y3^9-ZC8^HRN/T+N_eT4c)gF]\c.A[c)ZbCA6Q61+d3;[H27
[X2fJIEB)E;FOKHUX^@_\5:;3&A<1B@:^<UcCf8T8C:[4MdZ1g:_Zf2_La_;(.KA
G5+WQeTMcWe66HDNRA3RPYYNKUaOPb\WWOWSH&6@\PQCA3F4B)W6;S[_8HY:OJ?&
7d;7OHV?5<fP\.ND#)SS+\S01QM4M(4,EY@9f8bEbS^36;YJ[6N49[If;>=@9bc@
RLO(fL&O(>@Q<=YY2X2PG-+DceT4CB_(9_ZF?3A(X&#QX67@O22P&N]4[f7=LC20
P:FW1>5L]e;^QZg430;d=:7OgWUE\+#FfO\6[.&<aCJKaH_62Z^1cT47;>M\f-<L
-(@J;dL7>gFE&]LR6FaG<Fg[U4eDM^aMg_V<#TYD0&]R)fM9=L:N-abRa(R4HAY\
GPd=CPX:FEJJ[<@0\>cH#Yf^A,KC=<,>QM7X-40TWEI@[f1&>N??3C^G+CGJ@Z=J
Z];CT#UA_A]N-9f?D8<&8UBNEN15Y?dZK8<cGFUD)F5_cO??b.=Od:^/)>O9+5\#
8#=Y<b>;Db8[Hg?UCR(\6Yc/DZF4Ee0O:N.OA8]@=:AH;g2;-Qe2[>)C-1#L/E;D
S]&;f>@[NKP->cc2WT.:cOM--fagJ[T_04_[UYHW-7J0:ROVW[LR8T]eC/LeOIX;
R^&>O.a0W,O3QID(MGP);eL4MH5\#98g(dgXNAY1RKT@7L7AYD=Wa-4TCbOZ&^2C
aVU6ZYZd5EUJ@J_XT_1;>)J[c=T2HT=>/?P6J,afC(=aA[?4_.bG.a&Oab;64ddG
W4/GF.g9\@)W0M/DK^&cA(cG3>4HL?L][b(1-da^cIX01dHe?W(K3\VZ,>b&Y86f
S-#HS..M+,Ua3gU@5:HNW3E4TEeVLYKHV0)<EaJDKV)8?T2B+XZ9EH<#[:X(=,/]
9ZaRYP1=&>[#J38aN8R0LFG3,>AO<FBIOPP[-9_=3Y?DLQ/(CS4^SQ\Z(V7gE@S5
W[ZLc8U<:A:8(Qa^b.0]F<3K,PPW?SDG]4/;W)+OM#E.[T+7;]:J[N((D]+&G(5b
T(.T:O<P26b5BDZ\(QJ0QO3/TTHAX3;+M^]@K<Y6cc2@:VOQ@3K:J04SE)A-KZGG
ZQ&H>D3)acT^](P@(S>Y.]J&X2>f8?9\(-c7aUUg7\.a5,d11d&7ORQ-\0A]S2?P
,D-V46I^N(S>a4I??&6^>GMg+HZ=/?VTQI(RX(->7=OX[a9c^aXbQ&NYTGXEX.b9
8NOgeA^/GFVF(Ofe.EVe\Be^0S#>J/?aZ9c)-55.gVKG_-@cI;##Q,TDL5_PU(EG
3UVN05;PQ+<48D0V2d16Pgc[P?>g<E_]F^6>L&KJEI:Kf1UU.I_UYJ5cX2A[K)K,
W\O#+9RE5\3?SR21,Y1J+Zf_O.6MTS6f,L^Z7L:[a?dXNT=EW6_68&MW<f=X\OA(
@&\@BVO)c#.9@89<=](RDC2TYS6>5F6;YaX+.g23NDNPG9Q//b)QbMWebW[M_MRG
M#bXEG(XT0@CSWD2+TdH7_]#T@7H=9]@SXVN)K<]GKP0dD@Y<,]NObFAON40_UBG
1ZIf9d]bf5Ue<KFW)Fef7#gAEe4a7]f7O(:PIT_)9Q7K6(^\_V6O(cXIEIX;QTZ9
.=WU=bNcZ_8WU8B<,9G9=f@SJ.BQ6QZFD/)G6a+&[g,Kc57?QIOC^W)gf)64FZKT
5-5Pa2/O-]#E^YTBfDT=UY6)DaN,AKcHOdEOM:UZ5ADP5?E)ZV+?_,3=]R8K8;K?
GS<>GS&56Z&10R:7-Q<1/+IIX5&V_Ca[JT&3cZ1g&9O9:.,]GD#TQ+\V5V7e4a1O
HMF_H.c#R8H@C=Z[WIE:YU43M04L.7MNLV&]F:MTT,[I4IPfC.dTfP/UV=3Uf-dL
XM6+#=TDMIc^.^_dC.)E6TT\7]6VR[&QSK#Jg2b09cS8<V+BH1Q70T2/G)PLV=bS
9:f1^/]-[1,XI]3TSNWgM\/)fCGWg[Ed/:73COAb)8L)]/cFV36dUUQUW0C>>K;R
U-PO06#^5M62;,X-CEBOJJ(>8<GAMZH(MGMP71H_P@7SATPKHg5H)/bUc\eId58:
?OY]VfYbg<81C^KTX1767AUB3]VfO3):XFI1f>XaF)STQZV>a[B/K&&T=c:@[MI,
ILBE?3LD7DcM,B7XKbIZ:]MbD&)VYWIJFST[RDN_)@5TC(abeZ?F<E\(&>^gd6SX
;N4T0^<HP.E8=KD;VVUB48&1QVU3>N:a=DW[1Z<+XV4(MK9Ta^0H(gXF)E#[,F5N
]HF1ce03R6f)V#_@<eE/T;/UD+_[)CED1#=\7M[P]O3J#a.ba>:SY(ZUH.:YX<<E
R(_6f4T)3VW3P?c<Q&&.CeIaFd,3VC)<0ZFO/F1SNX7O:O5?fESHN@)1^G7RTC+)
b:d3/2[R9KdI,PC:a(8:U<=#0U8#g4#c#Z>I660TKE:EKg3U-Q1,PN=?=]\J#b04
e4@+>(BaQA]AG3\fDYR&eY]FdZ[QUWU62cc>OP)DUB:TGTaMUU]X-0RD=[58,/3(
PW&L>?,2aF-S8]^@G_^6PfRC#LEOBC4B+D)dW69L(K=B)CEJ4P)\B0=O7:=;c4G1
V?A_;;)_;HPQ,I9WC;>,N5/_L#K_dHAV_6[2B88_G;H@U,(]E2V[D4)SKg44M)d&
c4R[Sc^f#_L,0#.c>D#;@AX4&P7RZSea<](Z@\.IA5\AXFM+@I4X6]2A,N8L:IJ_
_@5JBU,<gAg]ZTAb-NO/8<T6D:D<;];2BI0)VQPTQf[Z:f)Y,+#;a+U>g(XIXQHa
6T.c914&EQ_<5-C5DV\4Ic/NV,_D=/dRaZ=TG\3<N]/Lg87c>MYH_eE.4)2[g01C
9I67FRJ<d+A;@Q]46:?C.#XR\ADUDVdCc/(Dg<MMS_].CQ[JT5_J41QOTAQ/ec.-
),]9c:_;1/B4?R;D,?0_#@9/@I,<0<(B?H.^Lf:Kbc?K3VE,G,Z:eMM[g(Q@,23b
;Z2]F\W,755>8MB&^M53YCD[<K(.Y[F+f#g<#6NG#A&8>O)4SVU5S8XK-R4(<)59
^e_I7Y<E^<&;5dWMD9M,5P5KAd:f1AP_OJNc7^6e0D+Hb]EOgd&5PTM9Wd(AY;VB
,4BQNN)382d3a6E28LOZc=4O4AW&Ve#d?YS/>Z(O+b^V(9QB.FEVa@\]bV]eKKea
+.4^3AF.X:LH3?E:@<R6,KP6dIPRG\4&cM<3K?])_ERT(HJ)f#Xa]Pd6A(Adg>1C
]Be.3M,SF_K8P^./#C+H_YN9\.dWQYMQfL+Y20V7B<HTBZY_Q&AQO\CJ^IO@G&K/
IS7A1CUVUDMd8-I^MXd&HKgMK8?T3YUBFAXT2UQ:^)L(cDaTE[>3KQY4R7\X4Z,)
WK:IeRDSf;..]WJd,8P<2Q]g#[@-)PKWI/=SL/#:160T302Y)MO^Z2..)]gKK3dS
^4?agb)HC2LIX/H\#B@NE<--fS0Pf\:H]><b#MF:8^G4)bA5P-/F;+b##<KU&OGI
4LT)F6E3<KV7R)dNE)dFKQ5Z2##31VX:@M.,>Na7V/T.U\659feJ:b^fd0c6FT8U
eKNd@]e9#_eE9>GA]5QPg>-LBE)dbVgAQ1Z-/E2XX/>COeXdB\T52<)g/847#X+W
b2]U#GVBT[R:,LB9>8X,4b(R5[(X-HN<:?=Z&UHE?29+H9?H)\f37:/\X(?Uf450
B-0[O+0E_1MF&(X\JdeNA_A:>G]DBd;#I\VedPAP[b_\8)Bbe8g/B3QF0XV5-;/K
gA8W8D-0TZPX2Y+R7.T#+XCL;POe[CA6Y46BVe::8cIT7Q=JP5e)0X5Ea/]cTN+7
b+,AV,VPUB3/T+Gf-A(,^=eNSIVUTM?PK7(T]#C?VS,g[A)FE2eJGGLT,GO#/[K]
Ue)W(DW\28)X;N\]]3G>ZB2C0b11-_.X>EU+@8LWOGfD)G#FJaSRg8?gB7[ZSW)U
^S/(2-+/)/<OQK<C&Ze2>[)G-1BU_&-1NgPX)/LZ.#/J]CJK0Y,:Rdf<F,___^<2
T\B5Y4.)RX:]J,.fSN@d?2T(Pa0E_Wf;M/H11aEIMS6eP_\S)B-7YJb=D?,JgFS^
Ac=LT\aN_M^L\]RLZ-LbQLT[V6f?^9VA8CPZf6Ag,Wg3]B2MB&EZQVJUIY)^:\_8
/\YXR(&aT5DK&1XQ#W#g<@/D9K9(LBgbIFADYS\T]ZT]2eX9/Hb>S[JJDHX0KY0g
[@&QOb1PE)\gC&;,3W6FZMEF9c0,bA#UgOBW=DFDA[/XUXX5_W3:.+9MR>CUeCW.
gDI;D2dML[\Z1O8\>E4;4B:Vd3NP_]-:-[0(M7cS&=gJ(6HYGH@0>.&BY<@QFfXP
.;UXX]0[cNKT1eFFT8L5H=)QN-2d9M8F9YYO+(=0<S,fFH;IOD[1Hd?724Sd+M(2
S=)0-UK@[_Q(L0>/0U:d\HVU(U9I&W6Z^OX35]F@dA7+-G4I7QEBN4PKTQ8YBJ[]
($
`endprotected


`endif // GUARD_SVT_SPI_MEM_DATA_PARTITION_SV

