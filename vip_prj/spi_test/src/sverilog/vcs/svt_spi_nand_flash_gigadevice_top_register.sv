
`ifndef GUARD_SVT_SPI_NAND_FLASH_GIGADEVICE_TOP_REGISTER_SV
`define GUARD_SVT_SPI_NAND_FLASH_GIGADEVICE_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP GigaDevice top register class.
 */
class svt_spi_nand_flash_gigadevice_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Protection Register. */

  /** Used for enabling the function of Write Protect Pin (W#).*/
  bit block_write_disable = 1'b1;

  /**  
   * Defines memory to be software protected against PROGRAM or ERASE operations. When one or <br/>
   * more block protect bits is set to 1, a designated memory <br/>
   * area is protected from PROGRAM and ERASE operations.
   */
  bit [2:0] block_protect = 3'b0;

  /**  
   * Determines whether the protected memory area defined by the block protect <br/>
   * bits starts from the top or bottom of the memory array. <br/>
   * 0 : Top Blocks Protected <br/>
   * 1 : Bottom Blocks Protected 
   */
  bit invert_protect = 1'b0;

  /**
   * This is used to reverse the Protection set. <br/>
   * if set to 1, previous array protection set by #block_protect and #invert_protect will be reversed.
   */
  bit complement_protect = 1'b0;

  /** SPI Feature Register. */

  /** 
   * OTP space can be protected after Programming it by setting #otp_protection to 1. <br/>
   * The OTP space cannot be erased and after it has been protected. <br/>
   * it cannot be programmed again.
   */
  bit otp_protection = 1'b0;

  /** Configures the device to program OTP locations if #otp_protection has not been enabled */
  bit otp_enable = 1'b0;

  /** Configures the device into ECC operation */
  bit ecc_enable = 1'b0;

  /** Configures the device Bad Block Inhibit operation */
  bit bad_block_inhibit = 1'b0;

  /** 
   * Configures the device into QUAD IO operation. <br/> 
   * 1 : Quad IO Selected   <br/>
   * 0 : Extended or Dual IO Selected
   */
  bit quad_enable = 1'b0;

  /** SPI Status Register. */

  /**
   * ECCS provides ECC status as follows: <br/>
   * 00b = No bit errors were detected during the previous read algorithm. <br/>
   * 01b = bit error was detected and corrected, error bit number = 1~7 <br/>
   * 10b = bit error was detected and not corrected <br/>
   * 11b = bit error was detected and corrected, error bit number = 8 <br/>
   * ECCS is set to 00b either following a RESET, or at the beginning of the READ. <br/>
   * It is then updated after the device completes a valid READ operation. <br/>
   * ECCS is invalid if #ecc_enable is disabled
   */
  bit [1:0] ecc_status = 1'b0;

  /** 
   * Indicates if Program Error has occured. <br/>
   * 1 : Error Occured
   * 0 : No Error
   */
  bit program_fail = 1'b0;

  /** 
   * Indicates if Erase Error has occured. <br/>
   * 1 : Error Occured
   * 0 : No Error
   */
  bit erase_fail = 1'b0;

  /**  
   * Write Enable Latch indicates if the device is Write Enabled. <br/> 
   * This bit defaults to ‘0’ (disabled) on power-up. <br/>
   * 1 : Write Enabled   <br/>
   * 0 : Write Disabled
   */
  bit write_enable_latch = 1'b0;

  /**  
   * Indicates the ready status of device to perform a memory access. <br/>
   */
  bit operation_in_progress = 1'b0;  

  bit [1:0] driver_register_bits;

  /**
   * ECCSE provides ECC status Error when ECC Status is 2'b10 as follows: <br/>
   * 01b = bit error <=4 were detected and corrected <br/>
   * 01b = bit error =5  were detected and corrected <br/>
   * 10b = bit error =6  were detected and corrected <br/>
   * 11b = bit error =7  were detected and corrected <br/>
   * ECCSE is set to 00b either following a RESET, or at the beginning of the READ. <br/>
   * It is then updated after the device completes a valid READ operation. <br/>
   * ECCSE is invalid if #ecc_enable is disabled
   */ 
  bit [1:0] ecc_status_error;

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
  `svt_vmm_data_new(svt_spi_nand_flash_gigadevice_top_register)
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
  extern function new(string name = "svt_spi_nand_flash_gigadevice_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_nand_flash_gigadevice_top_register)
  `svt_data_member_end(svt_spi_nand_flash_gigadevice_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_nand_flash_gigadevice_top_register.
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
  `vmm_typename(svt_spi_nand_flash_gigadevice_top_register)
  `vmm_class_factory(svt_spi_nand_flash_gigadevice_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Protection Register */
  extern virtual function bit [7:0] get_gigadevice_protection_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Feature Register */
  extern virtual function bit [7:0] get_gigadevice_feature_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_gigadevice_status_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Feature Register 2*/
  extern virtual function bit [7:0] get_gigadevice_feature_register_2();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register 2*/
  extern virtual function bit [7:0] get_gigadevice_status_register_2();

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Protection Register */
  extern virtual function void set_gigadevice_protection_register( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Feature Register */
  extern virtual function void set_gigadevice_feature_register( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_gigadevice_status_register( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Feature Register 2*/
  extern virtual function void set_gigadevice_feature_register_2( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register 2*/
  extern virtual function void set_gigadevice_status_register_2( bit [7:0] reg_val);

endclass

// =============================================================================

`protected
7@SESKf]&6HQ.d;-LMN=L++83,)6ZQK9#R<WGa9-3Re5_gG\<<7A7)2IO,W/4@Y3
8<4Z9-c(9a4TS;H9](I6VA7D\M;\G]);Y<2(7LQ<EG340.D>]LXHS^G\cI\T0)X>
[OAQ=[Q&=WM>]LR+1)b?;5D8&9DPFRZ^/7+Yg2;b[/:M;;f<U;V2\EUYa6M@6)Sf
)7)#N<eM_;(8YD=]-[?=5:3ZP]<FZ5GU2/443PCf-FY>L]g:U/3H9^d57BV.?IY=
8(\5^VDa(g2;H\OTCAM)+EX>V#e?[B9HL[/+0F.G]G+C0WRL=@]&RZCL^P_@_8)4
+5R9/5FL?[X.0&]9fFD(NE2cV?g1-\14+7&Z-_5C\DHdY735db3U6YE7fBH0CM^e
9eWg[U<MP54O,?52TaNC?,A/4]SFg1\0TE(:Y7C5Hb>8<be1^S\5^9bg0]NP(g0f
[N+AV9J88?HY71N+6gB,-->AeDXN^-?NDRMQ9P2,\VK8^2^3F#\94(0N(Gc_=Ne]
1Z[.1aP2Aa(b5_XVg8^8TOFB-RQHG1g(Q17HL_>^3JC4=]QANeI=&JFC:9^OHY03
&;a-CVDO9:K&@&=?7a,5]9-g14L-X4,CN4U[4=IRfRR#<W.GD3D<=bg)4_Sd[d=Y
51R&><=JL&(FFQe[]:FdeBE&PT::[aM@+MD1MY<==W_g=,F0;;W-CJ2.I-=G0P2E
0CCDGed?]T3R#;R@+baEbdQ+VNXNY9ZM<$
`endprotected

   
//vcs_vip_protect
`protected
(:_5Y/1Z756&N[);>aSKa5^F[F5T:U4^Z57M(<N?WEGW9_,ZJcA:-(aX5RYBX5g9
5RQFeR#O>cCET9]R^A4e7_aR(<c1,E]CM(IEedR5.?RF.-->=d(2d&<37XWW\8L\
+0:4##LA(aO\S0))F-F<DbWGH9AGQRcGb./_K>.](IS7I(1U^eI<QC=I8B</(I5e
:X)F7H9:+L;6M,RYdKg9G[6bJGQ9VgW-?O#Pe1>6^]cFHd24Cb]P4_L\RCB3gK\<
0[D&P-HT06^/+Og^)_-BQ64QM2)L\:DZ1DI7Y3Pg3+33g;/6)_BR,B4]Y\[R(&P1
674TXH(L-)D:3gNS\gS&[N9egDOIO^T\E-XBgMUSJH,F2J(35ePM03(](.HPdFCg
>3E^@MZ\PX8W-S?>,F.Q:fdCcK>4W;UG@=9XB9.-bJX&:MZM.e:a#VVc0&B1(dCG
<5R7geYb]X<^d+K:;4E12]Nd;T26[NW@\L2G-(KMgCTFUL/dH7c?X44C1+e^Q(DW
+3,,?6\&KJI0CQ44gP=FE1[S^,Ca\UA9f7,E,AN)-@3K?OF2Sc,ZfS^b9^SDcbGA
,5ETJP2YaCMA8B;.#,cE7<M0TIWaMDGe,:(SM\]b5bNeF#?c=&L@(DJ8=.A#]ZC:
;fGI25,b)U1(aUW5:,(g]8JB-A+b(T^+a.Z7A^g1A@];H+/PJXRZY(?P8W/8@eJE
3Cd]BafQ=<H=RWGab-g_WU9ZG36O2.I?]];]BI3,<?#b]K(36a-7?0[1@N<d<eg<
))&>=-&(Q?CbQ),_YX9FLdCgDP94\b#,A6\dGXP9DNa^gRYE4H(9(@]B,L20-:,,
CU/Z,[-4IB7Q@GMM(bHO\<4<@^8US_FNgMD=8:H[I^EePA(bU6?Z?2VU52#EDH7g
N>J\AbXTb74-Y,..HHF>>C;/@Lf76;GKd@g\eCE?<COEF<\Fb<GX-<0g\I6FJGNe
)1c4[[Pa2<E,7G./#@gP[aE,=-GSJ2T&C>&VK]:B:@F9D3\8<dT\\_78V;>J,A7S
.>W/#PX\>G@0b7WGJL7dZ&T(ZWH]A8>g:YWYUdPTE&=[?a2F@?Y+I@6Y8NOf5b7@
Wf^H925P1J49P(bN/1R)7Y1+1-g?YXF_V+SUa54)-V)4C?:-DEOB.#Cg>cU]/#G5
),5\>CW.HKPY?2[SGQXf#_VA9^#D=GJNNgBGN=;aN@4P36_?13W+)g3e0J?X_KKQ
<E3RR);0Xf&)-JBa[]^N\HX722^?F#8XM7Q[UBL7YVaIQYIXRZ&PE\fI<a1Bdc\+
#W&3K3d/UHM=3#V#[_RcERN(WK<JRWO:_eB.YWO=VU&a@4/cBd/+Yf=Wc5R6V;O/
0U92UG[^7BL1Xf\WZVQ:+PQGQ4IaAX5(.^2[Q71NEP=:4<GSHb-2N[dID<de-T=d
f_]<?9:WQ_S8N4_BOQ?JBe2R:80a?Se_.8N>_.?R+:V(g:e--2X86JN;Z/e)L@XF
#))O(@/aCfA-,T3R?/4U4)[YOWVI.eO(Vbg=34E0E=:?6E5=+1GIgMDHdD)/5UV6
>6HeR[TT<_CFGZTS3M1e7+;10E_9G2QX2E-DG\Q/e.YY+7;_U.U3OPUQd8J^8DRb
CTb^;MB+6MP?YT\/O;b5d04WT3#aDH2XZ;V@GF;5#&\IEf^-6gEcFd4>P7DB/XX]
4J,LN:7dP\9K+E.^SQ72C7E);)UUL4AD&cX+WM\7,5E9V.4HfE:39CM\OSd<-\4f
>6XGL6:/M-,.C@JFI/<1bZg(ONd]PKf8,?R8^U#_&LX.MPgA>W.T6LHO]b4RF)^]
&/g;;+&QF+PKXC;>,=\,Z::P:8NcWV@)SeZ@dY/K&()9QW<6J(TW[-FL)VI4@I/[
4a3^N[2e_AQTTP&,.)2XRV8#e-#&>-H)\YHN9DW@RT^eM?4^35/A;T5;948CJc)J
gW\Z9XP#U#.b1J_QOdB(]6d8_Q\Ec&&acE_/aM?,]9cbI39>VW=Nf&YeD+5EgEZ9
9GAg)<UbIAa5d0ddd@&I-)T55AQ8](-Y(^8Yg>bXG/0SSb5/B0I,8]@cT_]a/[A0
&gX8;-OMO[Y3EMN@TCRaYA<B[D^+GO7(\6K)Mg?/e9=gcaS=0#]700;dEd[W?,c@
@35bTYac7.aI77XW3B-?&J_&O<e[L+g0+5Uc,365K3JACF[F4=QZ]gMA>]OQ_gZJ
G:_KN=D(1P@?J5Dg:g/>eUM\=335KXJ-NZK.Qg,CdCS,I#\(A3H/^JTS-a+FZ::^
_\,]D#d?1VSgB0B/RW7J^6P>D1cOG4d;(bDHbJAY^Q,Y+XDOV2JNS[NZ=P0ePGfP
6A64BM;_caK=ObR9HNAV/&FEMUY3fa4X&aeC-LU,B/;UF(;f#&QC.7N+@Sf4YF4a
HR[cWDGF7ae_CFNfXY(?\/G[ON^4HB([PZJfSCaJ<D[>ff0GVKaeVX55MDA82,Z^
;]bFeZe):_7+KRUD&0PIbMX/[CHU2ad>YJ>XOOD>=PC6XKE[TIaLOCHWgGQ1DVdU
WJQVE#+]P7Rf3Z/VVOe69SP#EL=dRVZ1f<8+F&gU/SgJJgJ>?-f97)-[2_GaVTe8
T#YAF^EJ_0-9VO[4D@:X)VY39@cL:H9S;Y=gDA8Q7?(g;V>H4X-efD-MZL+G;6b,
NVVPGTM;b[+@>X.>Q]@dZF4@9+4(g)I5[<dM:+A-@E(L(B,J+G2]O@B9Pb)(#S5]
Q(DLI8d[=SO--d]QI1IAL(#d;-BMXISba@G2WOg<,TJg#&,<AG])56Q#Q6B,@4@e
YLKLVLFHMIR1e[ObU1^025SIX-)9WWE(_eUO-eH03L;5Jc9fVPbLA78F;EH].g^1
<IBgb3\ASX4E7F7K(7dZE1f]QY[e<1SQ44:()Nf>e]T9X>+6@#:U?_O30dR^7,HM
_8=Y5.UH#,dE2Q#1NWZa^7P,e8g8@IHJ(bG.U?.G/&,A&PBCZ;f1O47>C^RcY+a.
H[0>Qb6_YW(R/bf7^.7Hc\fVR[?(:AW+)@__,^]:JKb_G_+&.#?L@O@8RB9,:FeX
Q&gR77dXG3GZT?9C0W.(_#Le\<AM];2X]]\8,ZFPHbHIK-[aJ]+D#dE(BLJNZ&O#
:A6L4_2#691bf^[-O.@U3V:5e0([ddEaSPY],MbU_7+]dEL2GbSR)2Z8J1[NZP)-
&G>6UGG-G(;KT1T?DPZf9WB@bEg.cM]5&Q2MNf(O?1-D8J\8+efEYV/G(1Zf:QAI
50/0]IQB4d\f\c7dbAZ5E5RAf7LHMDc>,-gY<2dOJ2a>[4Zf4)NY+_cDAU=FQc7H
/MMGA=S[P@JZ(QREV)YKC[T,Q],JQaX2,,=.\IO4;Tc4=G::3GU5QP7<[A:@@fUS
DM4KDdVF+OT#Q]G-_=U9(R\Q;+DfN34D]1)Nd>c-UR/4T2Z5PWIa2Rf#;fSSJW+:
0:T7C@:,3WbRG7]D0#SLK==6g7a[U)[T#4Na3@?T937Ia/P]Se]P2;dSXI8Ab\(9
QgET;=>Ab^2O)/I2?d]I6-@.#[H2)b/ARP4-C5+X1,^C;_J&UV[#V:^MFYOU>dAN
P6H=1^3LC1S43[+aW^YPFI,A;J^?W,YJ\GUTB3@+49;Uc#/.a0CP<9S(TLID@eGT
73@R;6@DXXPX-DQ1;XRR1.7#F;4YeQaK/fU@4[Za,D/9+Fc.dFaC-fYb[Me1<T+3
A[5+?cG^])b4b-);8PTK;V,4?VH.^E[DXX&EgXP_NE.Wdfc4P]T1/\c6aU[@eSLc
HX72-B4^f^.eJS0=<Q.UK/=BcAR&_#N&69Q4?#DP@+BDV3?3Y#4eD/AAJ4L.I<SC
J+C++LD.=f?f55KV@[[4S1C:cFL8g01\(:MZ,6Bd4)A;\]+F?XXFD)EJLRT.,3?G
)#W=feAV(@Q>9YPf@4E/;E?FBV7-+gTL@KI?HD=Xa_[&[QfM0-MEa#+aT=[89T1?
@J<>^e5EaHE5;IP&\E66=WMa]=5X_Ac>f2@S(_cFTC]A#?5B=E0FU@-]R2=QCZ,A
Uf:<CI>Y=,ZRM>L7]VX4(\bW^@Q9C0EWDb^#0KZVA#_cXId[_G\HFAe>Sg:U/^I.
21_XYZ7TG0MJVZFTf.RO+aFT(F()AHKDA-N7FV.?gCJ:VWLHW=Mde@<?Gcb.LP\X
/f?-AQ?7I)RL^=UT,EdZQ@Y=Xac+W,.E?<P4a0]FM48EM[P9)F1,eSA9]C+a^.[g
eU72#@;KZb-L.RX.\BHG1M_b7eUQVZE,f67@GgO7YF0QKAfGaK+4N)5YB<43^C?8
D/d&Z3D?cL=SO?B?FY>H#bHD4<9=&[OPUSVJ1J=D2;)SW(.)M\J]:0U2@>_W89P+
C.PQe[?X@E]CB8Y=A;@CdF?N8&R>f9\YR5aO#MORg_GCN2K17VH3QM52e]cFJ>A0
C4BNM<<RX5?+[(6gH.YN@HJ+&,bUgZ0GC&ZUg_JUJ@>\;gg-ULf+E<9K4@Ed-+Nc
GUQFFY6Tg;gZT#DFY)H[<]#W\b9R0NNWMEI(VfOIE:0E9;W>OBZT^:Z,,a&XeJ.L
Z/5A7S);OcOTd]N6V.O^J7S[JFAPeAbZ=XRRa6VY+D+Z+T^WB/+69]?/)B_0(-Q[
:-&@?/USdS1D^-XG&dZJ5V)DMc<WVJ-b?YGY1BMF=5N_UeXWef4#K#E^N\W8^>Bf
)UMVfX0#6;RQK[+7Q5M3K,C1a6-@E9+,4WPe5T0J)f,P6#F?.]\J.1A)-)aEfLWP
^,,XR1]6cD7[4Q&d)-^E1(?YA(.<>9c<7d_&4.V;2AGBeX-1,6[bYI1]B4LQDbca
/b8.8POGEY,R@/W=A86.>b.LIT9WEa;SIOY5_U#d:<5S]]S:WQY&KXeWDGB9(+C/
FBRb-LL<eWJ@NZ+&4^>H2W6QO-<>9ZfXAY1EDWbSS,@K;;7FVb7\.>/05VUIA?)Q
8fBL7\D:M17&-YW<Ab@4+I7HM5FdKdgVG=VSAC-f\<\RC<IFO3GZ>K@I<D,2,G4Q
^ZDW)8/bdLFI)3BOHVDR?EHW1YU/U0+S1+TLW&6f7Y9_<PUB6=S8ZXRX3IX<K7K?
^\>S9P3bcZB>-UHEU08Y.LG#dC[G]I?DQ9.AD@?F.)Wf>]gZ64deGZ2F0+M2\U6K
_:Y1_9LT2AWZ/.-CUYRB3TKP/EQN&X8bCCBbRV_.e:.9LSg5JbE?MW]9W=63?.K<
HAVV\]]UdVEf?Z3T1,(507_[O6S/P6d,G&XS+XO)B7[+RM<7KF+JU+?Hb;Ld\QbF
D/-6c;aFb.bd7^=#/EEHbf#TE-c3Y,-YZJWCE3ZgM;_H:d/Rc0#H-?d?UH5^/JKf
C?#4K;IO3Zg2dZ6g@2[fWP0DHcYA(>2TKT(IP=7SKM6<FL\Db6PFSLM1gF2U=#ND
c8Q7bHQAJMaSM/e]41G\SJJ&e_?FM61A.]KUP/A5D5aZ-If:(;.KF=U8QF7>;@SI
YQR2XL9N,UbJS_CU:a(#>>S37YL_bOb6:Ge,fW9;YSXL?#c-M?XbMW:^:[],][ZT
&c@7#/ffTZ(L(L<-2NdJf9\BX24gBP@PE:DH0QE?TRNE/I@@^M[T90A_7Q8/^\;;
+E(#;ML45)LPN^CNd8Xg(DHARNT6,N<)Td+9^#Y:B_?[OFCg[V[_8g)1[T]_)3b(
=:X6f;1\K^[]N,Q)@^)NK3aV[X+E@.L154cV9J7AXJP>FSe7C=>R-.Z4>M,b&H@=
b0Q.D/G=HL_B=2R],VFH8)1Q@P5;]K>Ig-9=(CeJBXNcJEKEe,+:U=6EY<CZE6PY
N6/6F<JT&A2)@,#K7,&gbMg_&/>U5K01Z512&L9\VEKO,J<11Cb\Se8ZS#&Ug7)a
=C_Sd-GU228:F[e,,H@e5_]22^44BW[M#9ZDGCfafOU2d)<JY8.D_^c-.7d:cN?:
SMc<[Z#c^L)&_g[K8WF.]C#C>ETE^c-SgSG:fKGc)-4]I4XNZ>?44d\DTdK087G#
35]8A(&cg_\?g_U_6JB6J2/BHbKH+GF^6)=(I8LCac#MN&aCH/@;.5fL.Y.-WAHc
RX.?\d^3#0?OP#)PWTbbQ[SZ\QdS4B6b<4S5+CWIQJeIB^,F;S8d),8FNZ-IZJLN
gIN]LJ@R<aOZ<4&X(-H:/c\J&I^faE;JLf75FUR.W4VaX\/DW^UPL2ZS[#VOAS1_
aL,Z&NMF-;0VNcI[LS;NBO[Ua;RXG[2SA,\g3AaM#.Q8R+gO^Z,QKI/G_5D/(T2#
;DgXO@JW-1c_A@_bb^4SVRVJb6HgeK:Rad^]H6dM1I5>cV0=:JCDZ>I\bH^fQ08I
aH1IO#9B6(8.3\/_bI#,=]/V;HIETXFN2H<b:I0F3.;\GY;X4(\96J0J\e8)fTg@
:^TN<8FW;g#^bFHHL,V;VHSQaHD2_7+/-FEbKd)fS<S5Ge;R.Sd(UfHS4Hd84ORW
5)g+Q0?W&L_;R@BQbV,F[21BZW@QZRC6-8QR@_2SI\WRf:J/]5@?@<RDY:RO7LaG
#TA,/?eT+I3_>bW_8#C[B6FJR]<2(WF]7dE+S^LeAV=-F@_7ZCH,:TK[))UZ:8B3
5g49@D_ZaT1D-^,0<<SWUYZ-EDd-,Ia:ZP:5D2N/Ob,2OW:aQ-H9[T&<7QWY&+?G
BOWTNL&<fC&L0W7H#)aJR<c[W(8I.+4K#]#_C??\bH<AcQJ0R[CV_2/E4A)g_[?F
2_\36g&:g/V&Yc&,(PVgP.RQ6+T,\d<,=(8U3DQO(V+f>,@1#UNO\+;MXWK(]b7+
+>FEb[J_(f9LfU[PKYQ^eed-#Z6=O:JJ&^fOIIX:/eK(=5H,M:2(4>;a#^b]QB>^
Lc,.bN^^g(=Wf/M-9XQ01ZYZN8AJfIdK\1F8g@&M]d)W6<[Z6P>;F2@):Kf[ZD\3
)-TL#<d<LTF1BT.H,PZ,-GE&gL+#2]:)J53+AL:?GPEY/ZHdIY0@cR00:Wc2;caD
-J8CZGE+B,:EQ+7T/Xe:fJ,I5/CZ/8,P3@JVb<eF^V?D2eNOH2Q+)H7CT([Ma?U/
DJ6^=ad-DO9RWI;^b_D/&H:AWOR#HO2Q/=J>7:GO^(=&HTE@5)Ne/fcE&<6M1(M0
>-96A(0cC:=7H0>E810_ZMCc&M1-KHG<#3I7>P-X?-9I_MRcVRN@^ZKN-D4<CC-Z
?SB5bQJdCZZ<JE_B150P1SOFNWBWAge8C=-4<041Y&AgbT2ZQJ:a3dfI)C5HK(^U
IJb7DZG++[g&QBg_HKNDX:07LQ8Y[VU(X8_HUU_J7+=X.)C@@TJN?HXN[\75bK8c
dd+]ZW2:W[M>c5YY]PKY4]a5017YKf(:Y#B0?]QQEaaR)>?UOY@N&US(LVCeY#?T
ZXZ/3[a:B>+;X:I;OeU?\M7a3c&VC[\QL7X@>JYgWRSKZJPOe-/gX^1?1M\TfXZ6
GVF2M=42[Nd\=S3ZG:X,fAZZ#,dL[RW+^[@6I35OAOD^Z>T7_Tbea>LAKHE6.WAb
9eL.Q;SN_.g7Kdb:?3F,5;Q9(++Z<FKEB=50a<5FKN1<_63f\Uf;(#-G&(N_5(g>
=K=B+^&\\9>3Ag1U;NVV;PM^VJ+UM#489ETEM,VQe:XW0IL)(+J/A(#2OP;7?T]=
=W01@aM&7PFG9K6D6:2MBYd-XP<Adg-J,SV[^,9/Sf@7/TSFNcD\EOI,I[[^^?P<
I,K:TK4^BbYDNI[Q(2c/HBb=2;C:F:+/CF:McJN/@V-LNbR,dg:7OT,@-;OAXKDL
-,aB7@XRdJ0)HH<]c4JC[>BIL:)LJA]-<V>4\+2AeTL]d:607/_<YbQ:0ONX=M;,
]VQA&+<GJ8aC8A,YPR6F<gHU12:>.3eg9R/dILR58.AD6BGdSW3Z7fOeZ8+a961c
8VV/C#2?+Z^QGddX/6T/QKEU:.24<1f4NHRUOIMKI?#KTFZV1]=J+:BHHa/SVGaM
4B85K073S>3e2AT^aN:g0bU;A5\T@?H0REgZN+V1PO-b3?+WfA8J_2:H389+>EH>
07fT?a>?O0@<.&ULOa9(J<PGD\J^Ic?GQF3&>c&;Y^7d.Ta[95&#@Z+ZS\QOC@1J
3;5F#S/8<1[S.ZU4cI:7AOT0geXW+F>Q_B#U-62GCa&7TLXEOX^[AOeK/Gf#aUM6
BbS+[36H6A@Z_aJW(T/[:c--0cY;VTf8^GV-=(]3Xe;?HXF\Aa?W9/_32<=O(dCA
&.WK&K:A7J?0cE@XJA-)=9N4a8I0JQEANK)#g1&/c:TNCaP0]NKDecYD7U=GG))@
b&>-I@LD@TFf+=ETL-RX>2/f+&&MDKg1H=T)=7:J;P\WZ@8,[5\?O,ebT2cCL/HQ
gOe0BNdDC@QM<c:@<E]/V\gF<O&aE<a.^ZVQZO?G@>-FOTV,JGd896.b-Y#M[F^;
RVX5f0SFf>??XU.M4MVR9+Q?H-]KX-()(]TP5U26;?1CN5<O@UX_WV=#:<f&JT+<
NOML4YZgOa?8eTEWE[JG]@Vf+/9@2JR02D2/AX[/WX&HC==,H_X34FN;YQ=CV;V6
?,LMJL9#JG#.4[aaG)BW,f9#584BYLDQdFPL=GGQ/#YU:)fQNJ/Y_^RBJJKe8<I?
F5I<A>?,&(Nc?J,?XFISTA5A21U0]F2#]VJN-&,[/#1X0EVUAL-G&?GdYJ.L3OT2
NU;^RVZ4VM;f(Y-a<ZO]0X_4\S=9CV-PG.+BQ8#P[VgNLOY?[Q_BJ6T8T+QAE>a7
YHZK4XFJ7[:?6]La&:)3WEXOCVa3#PaB/J@I^I9<:99CT1IZO1A\^aVU.Q-N,88O
d]_[gTg<5>;AA4U#.:.T(OSD\07[TGDcG@HS.N(e+H=NXJ^BWG>KAJ8A]59H4A/e
J[88+P1,PYAH&d-\F34gHALI3&g[L@\^J(A@8OAR9UA,T8\bW4>[7TO13VH\BZ,W
3FT/QHWd<XF30D@MO):Y=&96THH_&AFdOf;A<H77O.=Q_.WS/CFd#W@I[cgQ5,>Q
&C+dg?&5M([_aK4fG]86Ze4=c]/30928W&9G&@&^^2]O<.)[fMGKM=bC,e0,=9F2
@fUAbS7A<@M#J>)?Q^P(XGS1[_c=S76:TK:HQ9:@G166F?>6aHV3a+\d//.Z6/51
KAY]Zb22K2X5?<0S[FdQ>&,:[JV7<)a[-_Bf:]&DT?L6>Hg-A1f+3Lb[PaU6XgYX
aNd(F50+P16f7-=a8X2FPbIZ).J+YPA[AbWfc&(+C&eOB1FUebATe(:C]b3DRG@_
gX,_C3(4^A/#Lb/LgK0BC6+LH2_=^/QA9^e^).SGZ?YTffQQU9KD9cBOX@:fV<=g
-+f=M90Fd&/P-]9e,/8Ve6DHM>&T2>R7g.P</QT4CG#KfYV8-Wc.gV6;QDM-8(-6
9J]?B_d(V##DN^>8_1V81;O?(BOMU+3T3:R>J5HSV&OBA8XUdMJ8_Q;I&,4F]0-:
;KUF,F26Ta-/0-W7S@gTWB64cJ_@QNg\#,Gd#0D(0Sb<NEGPY:YK1>gcE<(@Y\FD
4VF2TNWM?PG+<R;=ZLI#?bf[ffGCC1)(E&\08.OM_J4+JAZR3\YdKFR^A9\5NN8[
+4RL,T+MUC9PRRV_87a3T>^+T+-;dPWGZ#bX;THJ3H]:<?KZN<B^AEZ-#Yc(-Y]E
0.ME>]e2XOSg0_;Q<=_f9-T\b</&U90SG9Z9U36dZ+gDXQBOA5<F+MDOV6dG=-Y^
Ab2JG:<];SZPM]N].DUggF#F-N@1afWD:EZ(:c@+#a]AKOF^.KXfE[OR5X5JP245
=K^fHZZeP-?ASA]K775b>942-[UJ.?-WV)+e3-&JV5P.#2g_4Ped,Y7>0ZW@^eO0
agX279f-R)S#gcAWE0,bLX0dT=-HQ5B^a7#UL559#VY&T6WM.K>1N6,Ie_b)[5Vd
BH&_5E=HO6X;.DfQ<][PLgAYc/O/QH>Rc,GHWA82Z[_gAZ7(d5U,GM&I(?DZ3a^@
Xa>6T81;+7dW)GX1]?@^cO6;VBKZaaBc0V7N.&2F?d#a6ZD>(V0GAX<V-SB8BT++
]\?L.d/\0/a,F=11&->M]_4BLQ1aV2/UC)UB\NCdD^T_;<-H>;C8RS.(M&(9S\Y9
_T^^-f>&,-FVgbEaP#Pb1EZKW:4P;G21[e[Q0:4MDCO[B=a_/:<)cWG20TA^M8?I
M+]@D#5LH5?_X;c00b:A[6EDXUbLgRC\G.Y3S<J=6UQ5S+^YJZR2eU:3;INQf5Y2
Q4SP2e->/&+V-NG?\M7B?6-.^@;F#V0O0E.7@d;1##HfPR[K1#7N\e@C+]XLR?IQ
4[8+#/f+A8OY1@&SEb:1YVJd_#b8Kdd6,[bG&L#UZBH81gY;1U5)C93[RM?V]#6O
4)V\R_Ce;BMK,6JR.LH=W0cC5P0_,;\FdBU]PaB#;NR(UTKBO<,31gJ=5Xc7>I2A
]L>0UYVP47SL_F3-OWYK69-8E&:_E_(KR:@]8+ZU0C[)9\>+G=Vg72eRO<Q]@L4L
+5E5-LP6EK0_\#R62@=Z#b^.[Hb>@KM.N]Y@b>A]JR6-cOU34LTM,;f0\GGeN=3=
)VTU6O0-377U6<AcO\]O&35OeN4d6UCc80eBK_P2@,C+OdO5B/<U-XY8N;DBN+<6
_>18=#3U@^E2DJ#2\A&&M+4)9+d(7e+>N+EAC,ZC_\B))ZJ97]dRC[Wb\L]@L)Z+
\<T5,_;AV-F=Te<=Q]?BJd18)5\HH^<X42#P/]6T0eS.7KN6;X[,Oa8YA.MI^DP0
H(JV.YBD>cRS<-?OOK/Y>S9)&a-Z2&=cCLe=fb@>&M)B?SQW;:&BH3Q1M[:<g1D5
Q<TZ>C-E<ObC<0;a_:3\THK13O2<JD3>>^d3ZNK9N^?#9;)b<T2MJ@>W0O3S4REH
-4c/-WNEJPd;/IXLTOZ0?cF=fc:FONe7a]SEI=]<gCIT2@]cNOX:,3cXdCK0SA+J
e:A,ZJK>5e&MSB>41SJ)I1dD2>(&g=X1c9fd#H?[ODRZc^bC[J8-^ZG/W.R=><H_
_2OFL;830I&XTaTN;1G1S):gJPGdLV\9=L,[6\#KBCMT7a2WKCfIKH9aH0XEZX/T
DgVd1=^CA8AX[_?&dXDV5C?)>L@LT[GN71eMBH4<X_2RC/YL)A70ZK<b4Z9E&KK^
?7/B\>A?M2O9A6EUfQ+Q+1=(CbFc12S&OU\]dZJ<2(T&1fc@\]J^H&cGXJ?R=2[N
(CDFX\O>=#V?71AG(+AK.HE8G>Ne-B<;F]^c-ZM9.\ZVL):c?J80RZ^>-.1g.G&U
gRGM\0X-@cOAB[TdC0PPY8<-PdfYA,L592dY-\^I@[5QL)VFW[+UM/cOFY6QS@I.
[,C]aR.E#@P9&A>=3eAb65L=P@F.d+8_?-H/b2A\>a>Efb3&8>]AP.g,@(Uc#&VQ
?4(7aXPS_a(RDNINR7f7=[P_gI1Z5c<g[.Q[W9bR2J9\Q.3>:GDS]9Z-XAA+=f5N
aad@QK#7CL]F4\Te0#4V>3T7K5bBRGd3JRABe#0PM^KA#2CI.O0WO>VBcO1AZVKJ
^HA)CSCW)YR--=A2A2X2VQD5(Pa3+)>)R#c[CK3#XB2Y>ZF:AFFP&&=4N0ZTBGcS
f&.K)]4dAL.[F2J.,#V#aN&0eO&JLVGbH1/AGLGQFDcf1V]08?)#A>^4XL]2<)e=
(L/H-<;HeWMa.1KaX,?38MO-)KFg(NE;6eX^XDA0[>VJ[=PJg0AFWXd_&W0PJ)BC
2PNAe-L3^?-.KaX/@@5+>K37G5fB<F]Va<W9,CD3GR)3:]d#IAUX:gC@La4Z(W]M
V1;f4Q]4O/8I?VQXG5QIW1QIQ#b?]\JR@A=,V1JVcQLe&/C>YOg-WB+HcafX;Lc\
eb&[M-cCXR?D(bGTXE,,S):7GHXOY^JJ75+AIYY&[G/ETe8b(^@]gX+?D;gb-KEW
3(LG(;07Q+_4Y-PC&>8(\L;:FU(+ECAPd>G=RG3#\FN<eg#GCP<4L3b\W0-M^FRd
;&<C(@eg/LT(e/dZ^0P[DJ]^0LE8XdXX_=8?f@)E;06be15T-:]91dA30R+5)T;;
0UC]\/[L3<gdL&V[A8@1MS;NFS)52SK\O\G8-U+&e<HPRL00^P<gMZNNQ)JB\cPJ
bSL(B/bgH=HE<46a]2E(62Q(a#g?GBFg,@c)CP8aF4O8/&Xgb5e,R<>]V17@PV]>
F]#LB+.NJM/Y+]@cS[I<E<Y,7P0;U=O^-B.GdTe^K2-b&HUZ_X&g4MHJgN.)aWPY
+dbIT,c&JH5T;.SS]f?+QIWgY&,__ED9]-T6M9YP5(fE)b-O\Y?B-)Ie<R5<S5G[
A9EbJ0,VJQL(8SVH^.9@Q9&F+7<_/Y(3VaSX]e7QAR82FJc&DaRaC\)g=IJ>KTG)
?NY]Q(OW&F3UW,]BR9,S2bC3++=SFRMH7aU5O(9TeH[5\af;ESW)):KC4FV4aL;6
19>&D,fH+#=/aY3O+CfD>VZCf/aB_8X]U+DLQ602f=QHOJNbe-V+JbGWZ1Y:cS:R
S@?M@D@/96]4:O;Mf2TN0Wb<_VdA?bT;>NI/H1-Vee?\6LDg;PY32I+d\VBIOf8c
1Ue>QY7[YX.-G&BB;]9==\FI&P#-?eUM4-O</5>^AQg.PHW_7&U+?1A=MZ6<eZ\^
,(<NY)Ae]7@IHQ]CFXX5:9O\De:a2=,[#H7GA1SO2CHJNd\WWUK.IJeAG2dK+@ab
NDW\:A_(Y@=GTdeQ9.^B_K)Y@UA:8g;^[I#VB3S6c\HIFO+ZE^c7RCa-ZM(f1b:2
FQV/O3NJINH8/[/(cB_H<8EOJVLD<\cRMHMP+Q;K.1M2^YRe+_FB14e3>c5O73e,
1MH#)<:Z?;gfASQ9]JBTFXHMbb9,A>5#&242gPf)dRP?=;AFG]>J3895T=GUbY+5
^DS=O+;8RP[M(6V13g8:@g#]K5>J62)\7a(,WfK_F_<NYJU7ePg8_.YdY1D:&JJ:
M/1L<d&IY\:=):M@WKGf5\=SK^&e#1_d14YIU1&Db.7ebC52g+#La8e.62OVd_0)
1#=6Y(>VY52VZ0&+@></V4>SH,[(_PQ[>M+4TOI5+b>QZf0S-fVTF\cQaN7M5<-O
\<JJ;8U]M?QG?cNG3cI<70;FcV1_@.]]2:^HgbQIb7DdN/Of0RH;b0YB7TKg5M1&
#MST&(4/.M>DBVIH+fc#S,^T.Z@ZQ@7X,>DdRNfX,P(F7Q[J0VV^;9D)[?^d7#de
[[]#MBU<@(^fE\1b7U((#d^,\?XYA0e7EA:)2MRJ@g,35L]1U7;a@MT1LQf>Ja_:
aLQIZe0-WSW>D9YIVb=ZKWaH+9D(F59baCYOYcPINLa.4Y0L>#N5VfR\.<VQL81a
aYUB34:-R),Q73^::8@]Dg?Efb._b_d3.SM?A0c;(PK;:8SI5=(;UMPd&&#J:FVI
#1W.VZU&F?YeWNZ[DND81b2SG8#6D]:EW29(Cd>4d-.HICaR;^408OW3AB+Gc5].
YB82g0,698g#M_Y<aS+b>a/SF-Q>#A,0RfdSXKQ0(3Ng&+RVeN#PH8;AW9Y4W7O)
48b<A\2FVW_g,#[WdH1&7,@J<\,Q&1<-0X:Fgg.S\.IPRNT8L^@G4)S?4OP^b(A1
8,Db0:4LQTV.b-[D.B&C4HQXfGHUV[)].5RA:=DJ.DS_&>_cMd/O07ZL=ZJ/d/<-
F8:5MSa#^]^E3A#[]cQ0L?0=(NG,T,XN5T]eK3b8(63c&C+Y3N(T&;M?UbE;fD<R
672/XOA&6W.]<N8,.>;F7KKV,3?22VB_?0]V1a=C6(0X38#bgCKQTU=,O5TPg3.P
M+[+YK.YK-AZ]d+f3T35fJTf0)3<7[,T1>:V6:5=(FG.J3;,[C7R4-&[@O<V,,Og
:1LS/-=0LddYM1LROPE=S&/7d8I-,W0aggD.T^.YgFCbg3ZQCY?g6bJOMc1&d(b&
(+O2+2RKOOJ&AIG<)M;d+DE@S^+V@d/R46E=TS])c^W#-G?R:&Id[H)K]6g+9f\B
I&1S@]-_3Rd^2)J\:cF(3>WGf4M(d6X(cFG[FYT5,MU9g)ag2=E[E]ENCDJEZ^D\
0\=[7NU[-7PY;OdHN[#4>X#a6MUO)80fA.H7a7,O8Tf3dF=;X^<3ZX(SZ+)]gP&R
J=IZJ70#-.0SB3M=?Z\/U^cDHA17;@D1))NC<V2IY/=Z,M5d)dd9f3H:>5J^X=-B
T7X-[,@1\&aR15gC>+;NRJ3W?,=:C1LS<./VI>Y=PXe#/ZSRH,.G?::X#X)[X=/+
O+,B<^HNXZd;AV:_>J?6a;Q>0>[_YeeYW2?T<[0J\-52A5.b=_F6=PPU4Xd0JYR_
F3I2YQ,5I6R1&C_IR_b8[<[/5XdQE_:a6O_W7K.HJ;aZKDX-D7^J3D@96La^@XZ<
:DA0R&UcIH@\ecIG0^NJ0caO>M?E7MHd=P:<6NS9CAW&47_.:GX>c&c7A@ZLIfU[
UgI(-I+MN#1BS1X4G<V+#,GM,#\W)NR5TKMU-ONBSYHX.AM/)ZGV\JVS_0KX<=@L
2_KW8S)L\]-bRNBRe\;.G3R;<Y9P,H#ZDf5AdTG-EX=Y\KN)KLI@&BT2RB)NDK=>
OA]2R1MS0-\HV#E5J:XV-8:]BYD2=)1e6\TG0>G4a&CcR),R#IR=>3<Y+3?O..\6
R0(f]?=1FMGAX2M96e:CHa0_M92U9(A4g(fD&b5(ZbLM98[7+Z51HJYNXQ3KL?9K
?)eF3C5UJJG_OUgc4\#T7<>/[3MI/A8Q>6VQfS\=cAbE:&,3Ie[aIW:UcKR0)=Gc
47L;YaAf9DfL.B3:6V7Fa7)))N57\dd78&R-D\./>9F.9]Z096D;KTWE1T8(CL-:
O/NC=A^He\1P^W0,K1Bd_R(W+\^,QUOU?I=T-TeL9.V:.EPdfBXE5@C;ZW>SBQM^
_3O;.U+XYLS/I8NENe<:)R_BOJOeY-B[Q5:>VR-6bZ@Ce/A3CfTP+YX3N>]/]=(_
^^e>0VC(114+D:^BOQ#/O-3WASe9MNDHH5FTZ</B3Y2C\Y>MOGMZ\HSa7E]<QSeF
X=<.fUG6#BKQRT7H8;VZ1/W5R>C3.#b1V\(472LPNfg6?PR=;^M/M6D)=:+<dO&0
a7b+O-/8/2/G8+Q@UVPIM2T.5bBA]S9OA;J&/4)M-&f;DM0.^)H+:^=G9a+g6DO?
McZ7b:@7V=U0AgE_NC5<;.EHV;4T.IaX6gHP/?AU-,gU@VL\\;-b>P#ALT=C]5\]
7;eU#8>,<9:W:bgcJA==00Qg\e[P[[_000b_b&7,\bTT5+NUMgGLYB.a@[35YQ_=
+XMXfQgX2PB-F1&U<PI_25C0.,,,6JKDD74=8g6L17P:&f^eM;O<_))TfIZd-b;I
)I>\[/3ZW,<dc&5G\G0GgA00(=..3IbdXaMHLYb6^#aT05^T]L[bJ)Y4&9KMcDUG
JcFT>[1-D8PQ)bDBcS#Sb;ec7XgF3:B&2E&L3=Z8KY+EQRa>4^[P?EW]]W^.6de.
U.Z/d_>>R),F/0#^>g?L-b0R4FNKB+,PEREVHZEFW@)SYJF;EGGN=<NJE(bJF2O_
^61W.dNf;@RY=@:1bG2R02b/6+2USAb204d;)5fgRVC.HIW^94T-AcL[?KaATW\(
:@@AB216>BD95Y;)<;?JGKZ2U_QVB7+_Wb(QK[/Z2\CHYYD?[[<c8UZBb),@ReR-
15ReO;[_;/L#e+,BL28^8N;F5WEaX:_>Q6C\UD9>O:QK7a^ZG2D,NW_5e7)_3EE?
6DYIY+;Y,<Y718Qc#3+6)XBd8+Z/dW_b[_U6g=KUVZ_]J+>OH&(Y97dOHb9DY>52
f-&&GEcX2dM/9)a[P^._+_g92V+#e.0e@)8O-N1\^T\E99GTVA[2Z(FbQ9WU9J^E
:61,YCK,#HUR[CCTZe+JF])PM@Ga+WL2Y2HTb/;FCRbMB#XL+BMK,0>14J7V2,U2
<5_QIIE0fK,Z7<DcDAd(@Ye-D\Q3^U>[]dC@\+\A7T?3]g4f:7b-M1OFI2X5#cC4
eX,O,N4,\26IQ#6T\-\F;C_YbM,K70W#7=<^]>\YMF>VTeT0=]:>KVcYRc)N7T1I
]YCL[T+IF>IO&a?(bbTR3>fP,H-.6&5Ab89.0O#X(6GCeF1;QYRXJMeF2]POS94Z
gA&ME]P5C3cX4X?S\Q?E\9;H2=E0[TF/W<=#90NF3#D&g(?]W3If.RO]Hb^R)XRC
KWg/_&NFf^eUd1,9,_DE\9bTKeDHB>6RL4OTaa0NSJDK?555(7&PXa-\]XeSHf4_
2E=D[1,K&KUJ>1(O\57g8ITT-\7DJLF5\34YJ9:OIL_CW1HEd4N&^FLFPU:12GR2
e/9CB.S=75_D=1f8\<?;19^<2FQ9D/D7A\)LJ0cS>f-)bNa(8/4_SU+UK5NfMQgR
-ZU?,GabEYM],Q.7(Z=1K[MN/IH<aD+-TH>0D/7+NAc2E]N0@JMdUZVMgDIK^9M]
g4&82]8]^0]7GD+K<HTJD0JCQF;PN4E9dO54Y(#2?)Af3C(:XU]>b3V>-R)K:GK0
+WZfPY>^S[Y#b=V-<XXBU=_7)#>+H(LDB0(0#,,Bg\>)A5a>5^6:3+R@+&:F/UI/
Z,4VER_dJ2=(GA-?;59eR,=Z>6f9SLSO.])Mc.+?AK39EdFQ[=R(@+G;>@>BGf\b
Hc2(SHG3PU1DR19[Y:Q+WZER/W<N5K78[;4K:6be7Y,PH@^-Vd0GV2a<V[=/^&f4
Z01[+eY#>)NVSdQUBI#dJ1FJTb24A&FER^a.^I,P:Gc&e5SF6@=T7^047U<++RQ8
+5^F2D58>-ZY0C^&ObbSa=W&3Z)0/P/NZQH+b+1O=3Ob?T(X6gEKJ#C^QY(^f=P>
)]A.>76fQN^a<DP]IaG7c0M2?]0e7VK_QF^6)TKA5ZPZH]YY7P3BZ4-;eG&=URgV
K;=M)bLK?DN()>^1F]f5aCWcE>H<Y++d7,:SO)YbUI9@DJ8EOI(F-(#55e\3dH;H
@3&P[Q,KD0abY(\J<DTAc>R-8VPQ#+\,^)-#cFOfMCGK6L(CT)SYZO^Q_8V/0ED]
#:9VKH4f9FUM6+Q/)AZZ<UQe,F.dF1TMR,NZ;+BEdb-)aB_;cgC_U/@-WC/4SC8\
-8&W67QB=#1H&=C1VbTPFB]J>@@-YS_E]@DRWUOZVX64RA.YH497N&1\7ZZ-_AM1
Ic6^<DdeNUXcH<G<Q0e].._08aG4e&KaNGNPT7GbU7FV5^86]TAb/Pb@d7.9;d,^
>D^RPU6:+5B85)UH+5[047[=fNN_56/=JD^9]::bV#S#XC.V3Wd@=+8aE19gBfF4
WXY;>L^/9F]+FQ,gKGC:aU2=S(N[)?[JNA_e+5\-dHL91UeG-d3#\=f;1ZNN+8Na
:a[;)2S5Q=L+:Rd6>#,P:Z26YM=&@O<?.1-MUBEZc-:B(,]_B0QcE::[,fY9eTMQ
faMTH5[^5eUS>54][1BQ6cK5C:gIFY7TU4J[TW<NWI3U\LKSE:OK-Y?(e)+2IB@[
faM;K,,BH#BBS7YEHP>dCWF./2CQJ06.L:Ud,BD63+8V45)f75c7#^+[.-.&;K6X
H>E_??L><7Acc<@F?K2VSGI,TFZgVTAabGb4OFWI<C8->8bE]YK](C(aC/P(LXf&
IbA5/V..Z4e[Qa37J8cXB,?[7DSVRVY^.;:#aG]\gOSG=)9?&EK]eEYTP6)UR:=d
P+:M(4AYKLa6[=3>N5(7K=DaB+#V&&d&K#VR=?K:;RETc-Xe3;IT1XH9N+\EMgN[
9CVg?L7gRSK=>()3D.(B1-,N2CY^BZ#0AO)@,Ia8bG(=+:aYcEL^dL9]-d-]<c1J
SJF3FAE]e],\FQ#D,(3A0e3bX@Aec[-:SF&ZF9&dX4\a(#<N8D):RB[2G=>KS6-0
f_=Rg]X+cE,bQ<<dbOM&@^E(KE93[dG^D/U,FJ\QDA/PY?SKQ^GKDHO<1<708HZb
7MFMa4a1KZ<b\N[=<[4gA/KJM;4I@)?cE9Uf^LgKO24_^K7=<9FEN:)e],0Va&C;
PCFecbIOc#3Z1^62G;(-8O#AQ^\:YbWS5,EL4MY/,K29a2C0]OV5\YL1f7G,CXW^
fA:\/e8K\IKAC)&MM8[^MC(IV6]fG&4f9^KA[[I[:O\@gIAWdBM5G2[)QCJ@_UgA
5Lg-F/\KW^G:3NT19B[I#cQd1eaeE@[D-^K\&&#CFAJZfYe^?W=K-JafaDRCSL]9
@b^9fR_KHCNP7cA-Z#V#Y;\/L8bAf2T^02_V1d1UFYSQK;<#JQ\K?b6Xa4?cFae2
DSLEb_@D#3H0QD==FO^LYZT-bWGT_a6?M7\Z)B,TRSC@NabW3]MeB.K+^4Ze6#9I
BdM<XS8.SNWBe;SVd^.1fYdaZAKd+;g7@3+S]4^ga;NV.aQZNH5aVO2?>T_\(;\=
ZO5aU,IaW<L3YOH,+O:D,Ye_e)NdQK##P0?^RR3;8a\@ATX_Ff\^XPQ:fQPe;Y5F
G?RMD,1;6#JJE6W<T+O3\EOKR9._dU?>9)AS.1O]HMS&.WcP6H.S2XC?MBQRc^T?
P84#^&Gd1RU745M4G_H=[9TFAQC5CZ6F.X:G+(5\/=a(OUT7D3/]5+?.XU?NK^Eg
>HB24A,J@?PA,3G@VUc)A0;20Y<DV30DW;V<OG->daOPK68=3L^=PU-R/0Q\.FKA
TH0@V7BX:]PA00M?8-BB+7X==QE)123g;F65P=_-HPf[Ae0QZD2G21a=^:#agO7:
QdZ@.]<=3OY:6_dd8ND)(2D?:#L(X?C=?]C0bdV/V+X.;T0d;RP3>78b^VV>TWWa
_/RbTZ7,,2<\\L.JI<_g^4GIW5X:EbAL4b9gDW=&.\GAIA+V_=KIe8eb=D@1c_3R
_aQ?52<3PaP4BJ#MW9^1MIK?-@T1bX,De4C[1=Q3(&)Z#eU^fB@fb>0(9X[OQ<0e
_:Fa59#FIK_(GbbEON1dRg8HDO,=8T316VF.,M6QL:Z73;/SXES8Lc.&Y((9^[38
K^MPIG:Q+_3L.#TYGY4(aC8e#:?dRNMXS[<1eZV]>,&0>ZTL.;S#-_UD+IXa&?Se
6U.\Y5(>YV;H,FcWYgSCHd#LXU8ESRHgcY6>KDGF#e]/:SaO_.X7CF&X_D1-3EU,
K2QC+W(<T&E47SfR@<?d[3LU_;+G?d@(C8GOcSdK4O__A?;GDI>0I1KOTG&=887B
dH9agJ9#WCN1/a=ALP^7ZXET_J6:U7YJ,0:KSF^<a[K8]V4??IaSE[##1:<51_UL
A,/E)270,N_c#\Z(39;IQFWH_XV;7@Bc?DJEZce+/O.^4^9SfB-56S6(N-J\P1bC
@[ZH0/9Y=H[d\R=W4(K;680c\U:(S7-J28YT+F7Z868>CC?;aM5L^fF].U9XVb^g
FASNJf/IKTCN7&R2\I&\<PJ\>98dL@Z^<8E8:44g9-,M:f2XY9>6b2.BfIQTIE/F
aaYO1W:E_?<]Z:QGcMV82AdYQ1J0??TQe&;[\GQ]7&:6&O<N[9,YHI/W)T[Xbg.P
dg,Z0VS&A#5Z92/4?N_6F&/I?)\IICac8=M/30S@6LO,OR[9F:6.ASX5DPGLT0.6
7[Z=TT8Lc9^(OD.MC.&GBbH:9[=\:[\M#-YJ;3KI+a4N1+;\Y@>C3:.]]Mcg;<@a
H-E59,+4eCLOJIH=Z,ba9#JZg4QfFVF+>@8/8bT8(>Y7ANSUL:K8bA_WC:BXYG6E
.K.Yce<-X[+@J[.DE4PLbUB]6U=BgGZ[7ZY^Le0+1W+Y9INIF:\)2#AY=--T]e4R
MTccSA[M&McEE.F/WfNO[DRR>F[I#GEJ4IBL[Td6@CSF.cAaF+b?NO;<fX[b;PS:
5XW3>KIHU+Z=>Me9DMYO0\Y4F8C-VOF9N&=&_ZRI(\3/]bCGfBLdcF6PUF7Y9/8M
PA2[]68N;NR4ag#d[#.:WdG/,eS;(&MgB0=LIfOIe4OR59S9SaZ_)e19PT(Gg0J9
R=UA[cR#([gL&\cTA,,3<V]&+\R6T]F=+Qff(DBLUV[;3aJf._V+NUf-gVBba]=H
FVS)6UTX(O9K1Q@Y,H43D/49:HORF>9HT20LZ3:-?3?Z/HY5dJAd,PI6C3ZRQV_F
#26CcYdf/CEVdSRKg5U4I8&+\K:Z8V^?8M<R]=7>J>BVK5MR5#TB&^W0PeeLH-C=
,,NT+^@=E6cEe(CR-GFH:O@[N044EfUcJ_Se#2-\1_&]?A8,7]A@=,58.Z1N:I3-
\0CS+(9628HcVH+H[Aa6T=WEYRM]]fD(V@AAaL]3>&9a5X7efYPZ<bEOVgE?&NcR
9g73eZQ[L^\@#?,ZHGCI]LPQ,#(9MF(,TD/E5LN9H,4K_^EdF4Z4)+4a;IR)1S;(
cc=?4Cb;VKU6FM6BITRZ32MK+@C<b:B2Tfd=CTcfVF4/Ed;=b28e5D^&f-_(ZU[>
\H4-QK\_)Z3X(\=GW#gS(VTO&Q:C<7N6Q>bP9UYTF6A?^=MC=@^B<07(6Q]S4d^)
R@\2APc,FR8D/8E[M8EVW/FD;5LNOB:AR;<(S1CX2LVD5Ta?33<93ZF1MKb@IdXf
]9G04ZeP8YD2U#Y.cSK0]@JE:>(@08eJ/Q/fb7D7Jg+GVR^@O2MbPB,[,6K^#:<2
(d@]a9-e1GCbO;:[b>AD6393T0QD,DWLU:9F@?SW._Xe1<U6fA96JGS/gUJ>>gd@
6XU2L9ZZR+B1+M1S/S8g.C[UD.cU]PM-@=7<E<G_R+QH<b0D3<IgK=L2:8<?IHZd
NI6-LY7@LHP[eWaE)ZY#gYIFQ4QQ1O&&1)Zc58f7F)4N6D@J&[2R2g.Q>_GA+E84
GBf1e3SQH4_BMO_ACJ8K:7XAA2MUbXVY5&1NP;@g]:eK[d.OA4.eZM#2:TJKS##c
YfY]0c4R)Ra<IcJS,b[6O,8<)2X[VVXEeMM<6R?KEbX/eNf::[M&e(LXFLR[I/I=
E#dD@,47\=/&OK)E=9e89L^=>9J/O1US5#)-N@_cb-8NK?bEECTT><369K^:<cLQ
g[@>,C^5V+d=E^O4W?eR?DU1_M9c[UfQJBY^Pc8@C?4+Z<H45]NG4QT;695gad#5
L[UUQL+Y-Z-A@^S5JIVHN])e93\):2K9NSKSUE4+,IUW.),)QC8<F1R4=a5A9<Fb
dCbDKa.4X:aF2e/UO495Nd2TNI]<gI8-RMJWO@b8Z6K7Oa8:AB:1Q7cE<A=Q\=HV
=4EgI^_H9TRJgfTS-d80.N3DX8c5/G&#Q=:?6-gQ<E)=@BBTCLg=0RKD6)_;#f71
^3/c)MQ[\SGU?0;HA2WFN#4+MF-dV^E;EF[#;MG14E_^W1)KF:[V,7c\(?dfW8MX
--<<VTZH?&SNIIdW(<c5T<CQRJ4f3bO]=g[2I>N)&&bF#\Q2586;S<H(Te)K=E+I
0=KE-Q#T(eOB.TW@KG&YOZg--Odbd-If(3)f,PWf>71-agM=DB24B:)VbXf=Md.V
,IZ\d]9YP+;L>W]d;_SP+8OF9:)YH:SBYYSPU-IPTOIB,T0TP]5LX?VO:RI,aEHO
bX^f32aS?V06),Q,Xaf6VY4>_G-NE=X3f=?\#HQ/(Rc:2;G9TKOGK@IIFRI69#GB
-J<9^DE.SMH9MTSc8f/GC_d\>g75+;K.5VD/R#U;(+W;/,];\]U8&\]VS&]Q9W9\
BUJ36?T=JWg^U;CL)?1-ZfAH8(VBB4\6Q80e@2\W9b>?RKADWIBMWfXfQ^8FK=(]
R5Z/?M/5c1N3_EO4R[?2V5P&,4X3FO2#(R#FN56+#??7)JDKAaTd:0PAHb;Q.baO
a5f5)IQ;QMP&[V;a6KQ:OD89Re.<J3@bQM,@.RRYF&c(#RI^\fDN9B=_DY)7[KQ:
?@HZ^be^-:\C6QgXe_#DM_^f0AW/CD]KI4XU=9AKD4DV(((dKJ=VKT[[c]5bR&Z>
S6I34+9a5Ta9+-Q\TA4ASFB;9UFT<,6:W<2g,G.M(HLU/)VG\N#9=2U#R-7#(#Aa
aO])[Fg-XgAd?A4fc]8?bS<]TN2dX4Nc^,a((7_EJ+WWR8a\8b)Z(E:aDB77e:#[
LUZ5XB,7dfL8KgDWdP]#-?M#,cPZ<Y3F6YIeN2C>@2F^TG&>d3S\ALZNV5:^VQ)R
K0XADBJRJ=6VI7)8D95\FON(Q,W)MO5(,I;=?4b\+F-aIGAf\.Q4SRNW?AS>/HIC
QLE]ZI#\Y#aQ,LIO/_XF6JDY8Q5=FD^+9<eGMOG]R&27W7YOe:NJ.>AW>f^PbL7Y
dX:TW<9-+-BGN,;[#1;IO/\2UV7,.U_BQUb_,P,_,R^:NWUa-/)/-+Ia+Z.9ZTLR
JW+H8(NT8#0_fT3A8d+FTHbPfE7WRc?1C2a25^d:X.a82F4O?&<,=]UaCS0=M9:\
V9Y#FV\.J],BOVM93S@-5BJ#VD4be6d5c\LLED8D5&M4dLK/CZ_G6)P9cIQ=\IO3
LX]>V?R>=FHF2(@85>^2Y[F#[e)CH?F4S54-ZV\Y+SIV-^[RL]D2_9,aFg;cUg^1
<_?bX,PK0\QNRS51UT;HWE&+dNcc-LB3\2+F8OO(]X5(D;M?J?#<Q;:JdF]&b-Pb
FG1;E0@TM(.&@0Y^INQHESIWN\/B8Ybd]472CZWBB56WLJeS1)VYL;Sbg>Qd:X+A
Y?C5,1ID+>(V2ZH0=ce>aQaF/a(A8QHYIdcJa>TF<7BFZ)W#3#g/IQ&eC#6.3;4]
fNPIMZ\53[73Wc)L>@e#;X;?a492Q\7(8WRFYP;.<R\4XOOH=OF1d)=XbObfaT4_
IL6VKQMK.V-0VJ+ZAOR]8[Ia0643&aZF8bFK)_=7J5Ag4)gHEB&_NM?0g1eK#/[F
6#D=Y1X@DggF9EeGEPD8=?YaffW?8b&1ESCA=3bf^XB^NaUH)cMeK)HH5aF(0JF2
2<3^&b[AbMY2.]OUAg;OeG^(E5F._RPMN3D@cMFd&\g_<9SA;FO0/HL0aH/;4AK)
S<2?,AW(V3NH06;/@?L]>dQ@a8RB5;IH@_=6V_LG=B5<^SBc^cT(FcJG_]b52JU&
KO[g-F5[SKY&C-+7QY[SSEGcH;b)gdA#X&N_V=3?P5C7/S_.23=N=]\2Z)ZK6=ZJ
V4NBCdF:SAH<NR7&@7?-ZH^M7YX\XE1C:5_Sc2BY(N:eEEf^C6D\KbP-g[=a)EY/
UE@d=<+:a9[CbIaFf=7eYY;>JO]2Y\\;44:F=;,VX^=]5AFXddAf4DUUIcG.Ze+^
d)4OAQ4-R#G\A8RKBNGeEb<6X@O)=BY,::5BC4WRd.f_b](@TD,XC;ZB]BecK,RN
cQdXW;BKBBSJ8:HRYPGNb5[66KHC353_Yb\]E)G3_Bd651\_.)e31\):f@=P#K)W
X4X.S_FA64:1Y11R+:=P,;G5L;/3L)1ELC88YXDL2Qeg0eAa8GV.cc-MB3&S-MJX
<Q2_BQ?0H)a1&_)E9,eH5J>[c3BF61?_2PCg@5]=<AHR29ZbGgSZP-,g6=A=C.S+
Ae^g#/b3WSCUHNP:1)1)5]c&U7QU=8S@@I)8+RBK_IP33_SaZ(ACea(#eGa970b-
C^;#^?X)aCT\_?&@^gaX[8NE2GJUZZ>]E:FXBF31YfO><3R[LCg.^+S&X:BM=^6G
35=f#W_&K0bB9LP[LF<EHb]0BG7WMP@9F3TR-dg-V8(#X##.+>e]UE>2^ab7b&EB
0P>&ME(SVS-RI5f(PSKN;^S7<NOLLF#QR=eae2C,873-VeS4Y]UU\@R+YMC.QIE\
1X75VM@gQ;0LH/SML>0PDS@LZ#TV9#FLb;<:IR[14C#-A$
`endprotected


`endif // GUARD_SVT_SPI_NAND_FLASH_GIGADEVICE_TOP_REGISTER_SV

