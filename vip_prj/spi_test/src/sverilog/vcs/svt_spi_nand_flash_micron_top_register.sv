
`ifndef GUARD_SVT_SPI_NAND_FLASH_MICRON_TOP_REGISTER_SV
`define GUARD_SVT_SPI_NAND_FLASH_MICRON_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP Micron NAND Flash top register class.
 */
class svt_spi_nand_flash_micron_top_register extends svt_status;

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
  bit [3:0] block_protect = 3'b0;

  /**
   * Top Bottom control bit used to control the Range of protected blocks.
   */ 
  bit top_bottom = 1'b0;

  /**
   * Control bit that Specifies whenther Write Protect/Hold feature is
   * enabled.
   */
  bit disable_write_protect_hold = 1'b0;

  /** 
   * OTP space can be protected after Programming it by setting #otp_protection to 1. <br/>
   * The OTP space cannot be erased and after it has been protected. <br/>
   * it cannot be programmed again.
   */
  bit otp_protection = 1'b0;

  /** Configures the device to program OTP locations if #otp_protection has not been enabled */
  bit otp_enable = 1'b0;
 
  /**
   * Configures Mode of operation/Region to access (NAND or NOR Read MOde, OTP/Parameter/Uniqueue ID). <br/>
   * CFG2 CFG1 CFG0 State <br/>
   * 0     0     0 Normal operation <br/>
   * 0     1     0 Access OTP area/Parameter/Unique ID <br/>
   * 1     1     0 Access to OTP data protection bit to lock OTP area <br/>
   * 1     0     1 Access to SPI NOR read protocol enable mode <br/>
   * 1     1     1 Access to permanent block lock protection disable mode <br/>
   */ 
  bit [2:0] cfg = 3'h0;

  /**
   * Device Lock Tight <br/>
   * Specifies Whether Block Protection State can be modified through <br/>
   * Register Write command. <br/>
   */
  bit device_lock_tight = 1'b0; 

  /** Configures the device into ECC operation */
  bit ecc_enable = 1'b0;

  /**
   * Specifiy whether Read Page Cache Random command is in progress.
   */ 
  bit crbsy = 1'b0;

  /**
   * For 'B' Generation based Devices like MT29F2G01ABBGDSF, MT29F2G01ABBGDWB <br/>
   *  0 0 0 No errors <br/>
   *  0 0 1 1-3 bit errors detected and corrected <br/>
   *  0 1 0 Bit errors greater than 8 bits detected and not corrected <br/>
   *  0 1 1 4-6 bit errors detected and corrected. Indicates data refreshment might be taken <br/>
   *  1 0 1 7-8 bit errors detected and corrected. Indicates data refreshment must be taken to guarantee data retention <br/>
   *  Others Reserved <br/>
   *
   * For 'A' Generation based Devices like MT29F1G01AAADD <br/>
   * ECCS provides ECC status as follows: <br/>
   * 00b = No bit errors were detected during the previous read algorithm. <br/>
   * 01b = bit error was detected and corrected, error bit number = 1~7 <br/>
   * 10b = bit error was detected and not corrected <br/>
   * 11b = bit error was detected and corrected, error bit number = 8 <br/>
   * ECCS is set to 00b either following a RESET, or at the beginning of the READ. <br/>
   * It is then updated after the device completes a valid READ operation. <br/>
   * ECCS is invalid if #ecc_enable is disabled
   */
  bit [2:0] ecc_status = 3'h0;

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
  
  /**
   * Die Select
   */ 
  bit DS0 = 1'b0;

  /** SPI Agent configuration handle */
`ifdef SVT_VMM_TECHNOLOGY
  svt_spi_group_configuration spi_agent_cfg;
`else
  svt_spi_agent_configuration spi_agent_cfg;
`endif  
   
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
  `svt_vmm_data_new(svt_spi_nand_flash_micron_top_register)
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
  extern function new(string name = "svt_spi_nand_flash_micron_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_nand_flash_micron_top_register)
  `svt_data_member_end(svt_spi_nand_flash_micron_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_nand_flash_micron_top_register.
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
  `vmm_typename(svt_spi_nand_flash_micron_top_register)
  `vmm_class_factory(svt_spi_nand_flash_micron_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Protection Register */
  extern virtual function bit [7:0] get_micron_protection_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current FeatureRegister */
  extern virtual function bit [7:0] get_micron_feature_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_micron_status_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_micron_die_select_register();

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Protection Register */
  extern virtual function void set_micron_protection_register( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Feature Register */
  extern virtual function void set_micron_feature_register( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_micron_status_register( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of Die Select Register */
  extern virtual function void set_micron_die_select_register(bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the Agent configuration object handle */
  extern virtual function void set_cfg(svt_configuration cfg);

endclass

// =============================================================================

`protected
<]TIY<HR35>Y+S/U+X<TIL:cQ.(/AU-TH(#86G9:5N;V0-aJ0Z3D5)XIKSH\,@,.
W\)c=W;d0N>-g3Z)<@EF)(a/Udb3^DM^XVV81:-\@)E;EOK&:=J#GPb9CTg4?LZ(
VL18.;K8LaMWPPG4#Q404C+_@45;<)Y=-1,]JcE^b:;QL#;=LY+F/aFNS@;O#<IR
^9)=c?,TGQJ>L#QKJf45MDY_5.dcaF2-d<L,XAg.WB=Q^0Y2CEWUR39EAMgE#fM2
N<LOaPT4@JR(AGU>UNU4G@7)UQRa[SN-dEIW6_0_\8b9#/c?c9Ab,,c)F/@R:g_A
G33S.D?>@^C@bK(+AZ=JWV]\/U-T1fEf]Dg0bgE+F],<63#K\PUS(,bX@TgO,^Y>
N,XK8:LNW5QN.K0XT:Ja8RERBPcK@\gR?H](QO6WD^7DIJ9b=WDSKGX/SODSL(TY
X\4\_]^:_7E^Z)/3?g:Y?0[1[EOLX/6+_X&)@7Ab?JaRLe[[FW2L5E:-g2e-Z48Q
OdKZe\Ug\8,C.6&99N-WVEE[eQgR>-2c7;7BM7>c/LYZUEG_;e?]L#OEUJ7+TTa?
I\cO7^Db)_ffLcWD-Ed=cDT+-B?CJA?1@UKY[J&M,I-1.Q\)7C80AU\eK[=g,PAG
&)J(UQ3=[\PCS4_(<0=J?#22T]f[0[2BK^EPS,/A1[?IRd<ZQeXE.COd3NI-?,#6
;NCU@F[F[D&C,$
`endprotected

   
//vcs_vip_protect
`protected
#-8F.JR<9<H)>==:_Nc7T7PSSe]Y7A[I8bF&YU^->[af:Z+47b_V)(b5A=H0(LXX
>AITAL[5Y)_D:WH&;;FL^L18cLTZGV83dU:15B5-([GCO?>:(\Z0Mc+A;--/gN1,
@YUPJ;:U&c(HX6b0)+IHDBF]))\SV81W]ORa7=7_T]eW:)\cG2^@V9-^O&#^@Ocf
U@.YTaQb_5L)J26D[9:N2UJCRXg<[YQ[CaObI1CbGHHAGJ[OeXa\L/VaMOYP56gH
[.dA3=1UNgODg9OGaGfND)OTGMFEDJU\XAHR]09,)252V)[IDA0AeKZPD4\Xf1#(
T37Q:D-64Z#S<UJe8+&[Wb3O1eRCBI<9X8QMK(A4Na6EKW<?4I#Q2>,LYH^+)7#,
MH5OI&e,U;bWM.4EDF1&.0O&;RS8b9NA,-/abRV>R5=>=8MZ22gUNN^aOI_CW.\<
>?IGG.:fH[5CQ[a3#R8)^Y;\OZ2=_?OeL+/bH0BYW6#@[K<,PW#EdJXTK4+84<e.
?ZZU9EP63QE2OG&Y39?aCKB6D4DUB\#fLF6)QY.R8+V@7GYAPWDI_bK.>.V_V?.4
@RJe?8\(.12)KV4.79[.#4F:Md>3])7_;V+YYC09RE<7,0Q==AH@SISR1(P[;Y<+
4.2,79OS5<@YA2R?6R2(2a+^-PB(BXC1S/UeK&R,cb2_^?(F6XZX#AW3gT[CN]Q,
,(IM)TV].PWM.AJHN4>e6#NaWUGY]&<+F:IWFUD>Sc)YeaN_-)<V:[(&65PA[V<O
ANC@ISS)G58=6U8&8DY(7UV:A(dN]4&f[+UU-bTFZF_,e6;P5M?RX+G7&(c,EBI5
DM82AI\X40P;82WT1[=N)>L/_,UC8CU7g>]Q=QbOGC)),OQ4^BI]<V\]B8Gd)-+K
7g=MYR3[&RHEFAG:G>::eJ<Y5bBb?=6fEDG:YANT5-e<._9.VE,Q+YMUSb<D\9@>
(4,\^?DV7&>AfGX4];4Hbd+dSbP<;)?>4ZVF+&Q)3+9ZF9;4:YgcF>[:O.-EF;[]
-M<cE<G=[AB7X3,HJJHD_:e?eC.+S>RIST86GX?Y6VZ:XYA>7+cM#9IZ&SVPO4B:
CX&3\]J5O2gWF?P3QB7:PG/KO/fPa@V2VZ2SMb(HX>B_BOH^:YX\;+TS<,7b<KXG
5#+V=<CL>W[I>[EEFRN-cAT?//EX8^?S<gHXMLUM.C;))6J7QI,U.86g[9FUcOf[
2F+2I-ea2^U==(-:gRA-Q;dDHJY=3O.gMZX5ABZf;E];)R#5Q5V39#D4,;g7H=5_
UF(?agBFNgE4\Nc<OLVEL+&gH3EB5L?8D2,I\+V.Fd8.HeF<VQV79MD7,B:+6=F9
G,:1V7VD)XdEI6LA?PI7KgII2T^OKQ40+:4<)KOZ_1.DE7L[_,6DcaW22eWC?V)3
OV3DdKf7+BUT2)\.a9>(V#)1_YcJK3,7>WRCM&B-LX(,^VE)?QVA#\GR5HHF.2e6
9CI@9L0]P-VJV7ca7#8E]73//\e[P6I7DF1=]4XG)8#fAO79BZ73@P;]+?)4=-gN
a&0:D,AWI;L(-[MG91)#g1U9g[>9:aF?:#6]:cO,2_N<KUMA@>F3K5UU#X3-L_2N
VUN3MHR?f^\93[)<eB_4-9+B(0R5IWJH7TPFVP2b2=\(RB0T8N-Gd.6X3.F/@XJ:
2\K3BIB5fXa>6F@954=CfOM/IP8^0/9XKP\]:37>(A&Z<\2LFE&B&Z^=9.8.=e3-
/H>IRK65F,/E=H+]b?R[cW<]bI06E/TU);</)C>0<GVZA^5f3M@]I?X?-g-L7a2)
Tg^I2/XV);]DWa-#=3\&:g<^QW\O8):\@V,O_2Yc-OQd+4#OZS0.\F,88L?]\O4b
+9OTMfV]HLXc-2dS#/.<B:KIK<5)I(@8FO9P4BR(3A&WM)2FAaBXOc><VEMHN_J8
N,Z3^NA/8>JVLIN=5S#IHVLVNV,8Q:VLS8a+c36;[8-B;TZ=_f&J1ZNf(HQFDXI@
P;F12?d\Z,@PM>3+;g92b=W00F0[Qb^Z@<6-.OL[LKU+45Ic_UH&D3KfSg+1=-EQ
dY4dV6Y/[Cc,6CE;\cZ61)ddA)3;#)VV4J7ZPe;TS)aSX>\K:c6@ZEbOS@1;N1T-
#a6Q/\;KMJ_0Y8Y1>c=;,LZfLEX9aW<e)fJb.?O8LR680-Gf(U9CL11G._CKa=[P
E8<)c2.#JIgI,=36V\+bPONWZ7U[X8C\/QEKMbK7g-:g6G1-SK[e40QEC)&8WJ#C
1UVG)>BJ]LV,HN\^)T&:_?71FBP]2cR+&W+,8.NEOIX[X<P^CG)V>JCX_]E\f1C5
2A(:6UUUK#e,T4I,2>^>GZY3@Gf_T,XLL)<XA8._<:-/gf+?AZIDaM-WEf)1^9.&
Xga-9U69BfS-VgW31G(_^-2WL4YD^?XX?Ke^_LA^1<>XM^cQL[e5e1aaId]5\cVG
Za3XO;JGW]+&@9W3/Q^I#K<O=a;#(@.dL>OC5Z>?)T[AK,N650&2)_Q0GdJQE&9&
Sb1?.8_7HTDS/YZb+<BL#b0Y<1BP]2a9<T93dg^DUYBAfBd6Beg+8RWE>:Lf><>@
aZD;1V=3dK.3XVcZb+KER/e8NDRP;I](Kf)agIM&DU;X)[H\Z3cC_J=BaP@.;Q?d
9G#D3\SS\X;L25(9<3U[D30#<)0]O)E1,,@@V7X=?Q?+_0b)[&9\:](=;:ZgLbJe
?fIZK;EEaeS)&;^)HF\O;Le34BM//ON.?-ac&e8ObZ:,Y&[1SW5C/E.gT_)J&[\;
1OCg=9gGc;YBa=ENYRP,gD99.#fTec0GfL[8W_A1]L4]?1d@FRc&PHf0O[ZX\78K
A+KHa.&5,2+2O=E4V@PJ=cbX[M6]f3IQ#O8@\1MCV2YGN&2^#=P-/(A[eO#9e1KV
^AH71&=CVc(MZ\X8eAWFYNH);=WWBTHa<_>_GQfe5IDEXa5gI8?41a,VH9VdOH3T
4Q88PBT[@WES]24Z31YBZW-P&1BUSK9(bBD=:X:&Q+2a&.+/94+C4:c9cb3YPFJA
H_D0^,c_OFUF&dT0g=&UeX69Q\eKOXM,Z:AOWd\d(=>^D0/5dMGLW[Ua>;@#&UCZ
(&gd<NEY.#gLY^G)CUAb?8Rf(dM?RR:GaWB0^bb&(6AL/)C4JY]cN0,M3<#>,+[Q
Gb0CG^K17/[7MJ18HI\?eK96+>0G9,S9)9DBE(gPF5<Q)XX:fX679Q8-&.??Lc#)
>WL0P,\(7W3+7G=aMD#XVgTU#),;QA8aHXK;,S.;P;F@5@Q/I?]312WeAB\^(cYf
f<S9S8_4e4Y(+T?V7ZKe\QY]aH\+cdAP^8BLDKBd:)]X1ZPU=Gf44=I303]@]+9L
Va9&RK4d=FGZHE;X>Pd@4V[bZ=P2PQYF>U5NG7Z-,17X0#@_R-_W?7PJ4VPUB3Pc
+,H=G;GeVA,_ZKABgN(cEgb.7X;Wa4c^89]YUHd@GVK4DNd0OE9A7GH(d66VJ^1X
C;<]Q\?5bDMK@6c]Z&U9+@[2CU+L]d>8e6YIT9#-&PR<GWJX02:PH6W0LS^D4JT#
,Bbd(.]@+(6cQ]gc^-N@>>M8_aD<XE#=K^FCDG?Ub-)+B)OWX_F#VfcC7#DG=Rc(
>V2/JDWH:<4,7BeSTKBA=Q]@]bOG5+).4?cb-Q]K(:VMHHdN^R=;\G<\Ag?C<[e7
.N:1(01&M8_;>6RF/TW=SM[=6.PV[:RcBW_Y;M2\A\.,f]^::XAfJOa]Z^RM;UBA
-JM>WSDWK:@Pa;IPfVg#EI03=O/<J+D8)J44d_9K?UbD_IPAR7e@5FUM9WCB#H.<
CJ3c0/R>@17HE0KO]_36QRbR2/AE?F0.46K@@(5/+5X6VR4Z.BTZ@NY+6Bf6,4>8
YIGD5SU1AYO]&SBY:P,NSf&4B\c].H5.,82/+&dC6]UA<09?Q\:B:7B6dJX=G^ca
INNGdYeb^WJ?181/gbI4TP.(5@46CLDg^&b<ILe+NY3QGSZeY9/94>6@(KV6X;-,
HcXEOB0CS]9b5cN)g-YZ8P[4eTcRP+6PG7=OEK)YC.\K-g)][#?G783Yf.Y?GX@a
5U2<(CLQ&MN8caL23_5UARGYN^0ASOgCI>F<_=bG8@M:>,<_WY]^XZ7(ZI2,NeY<
_,&KY7V9Y516fP)MW+bB7W>1A,C(+-JPfA;]LO2bA\H;L5d07YNTEJI?]ec-f6^)
2G//9We]c+Ja-P8=\a_);g;LfB<;;Q>2?PZD0^GGHQND+Q&JC_:<g+(<XH:;DBfV
SQ4N,VF6(@9\(M&_@fd/8C4XW;-XR#fBMdAA-_>0gc>1C^e=_\)<:<\J\(g<MT[[
>=([P9B&LHUQcP-ZK?0I4CMR5)P3F^c[+UQ8;eK76[</MM9JHBB\DB[3^R4FAN\&
5_V_Gdfb30<[N-b:d5Y@LW#7=0-d)KQ-^YC.Y,2@P\V#1O>gCW.-<@KeD=)G7d,2
>EV#EVMB(TJ6LQ-[63dB@F2HS9Teb594N)B;<@@FS#A,9^-A0P,Wb8,,QN5)1?d,
1f;+3ELP+<<7b:Jg+0O#T#9.TAJ0/D2a,Bb54;SND^QYOH2ZLF22^Q@6R#dET1QY
8\6Y/LT.DfOd#=CG@,=4f<.^^8Ya&H+bb&FM:a=L0T9[]T]aR1[@AFJ7d9?U.4LA
W[E#E\?e&YeP[[=VeEVc^Xa]cD7LQ7Z29ZK#P>O9Ag3FbXJ&I4cdS9+LZ,;>WDf)
;^^OJRQ8>2DM)>Ic2P&dgNUFWb>?0,.&>S>(^IV:V/H9.a+X@9B,<[V\)8I0+T^7
+dT2B@2,D9b?)J-1;bIa7Z2\:2b)]95)G-1ODdP]BX@C_9M<Q-^/HSgMYE=@bW6P
TK_(3L426Q.G0WC=c2^T.Q4gF;88:X,VR#Jg[WG/>?5MDDI;=O&;Q,\B;CO?VVa1
b-EK\HZe<,g+9/2KM#;DPSQ5,JL>6+&UQ\8PfEG/ZJ0U/(7L.:[dQf&^9;X/ZXWU
OL4HPO[QKUQ^N7<=J.^C58gEe,)[PP4T0bQ4\I)P[(7C@.Mg,4YJ^Y<^SA+<aWcD
K=O+>FOcf7=.#TOIG+bGSNXB&MK6WM:H91B5UDMa^3\.5(VGe+55@Cde;BTd@[;7
3DP[^c4@WOdM9+Y,GYfDI=X3HE<GS+N9.J+a[2T,8;b:[7e3=4)ER?+^^T:B2WDd
\=B@H_HM-<?@<2ECVTH(EQ+OKa?V4ER5b(0W1>M\3ZO_B3dU^S2gY8Y3O2(H&WPT
XFK]5-8Y^H)E[,b/SeCYY0fYB;/)6dM4P^5^f?V0e)9KdcI6U7Qf0-G)Z-0bLHJ?
LbD5-S13B,S]#d>cedFV;&X9V\eQ^J_VgDX_<Y;(-?GO=6&X6.SKGXNF+0c&0g2^
MPE/1W4V44/,bZ&Mf8Yc4a+OeX>WdRf?(Y,C6V?M/IELX4EEM]Na3YSc.S^SLRXN
P,59X7XPW4E+>eJVVY=R<]:W5T=1P0Y@1C\F^Z5Y6)9\ec=27:1;.C76([V.>b48
=BgJ\VL_@5,005KCa^@SNMMW<05S2a\9K,(IWMY3&ZP&S@)SB8./[fR?Z)QT\H@C
TO;&?YM+dZVLRK\54EdHE<OS))DG1U)88WVfbCfG)UUC(_-QD>2Ja,)1LE8L\OfS
=<0Jf2=_,?,C1c&IQOP44G7HNGAf.<cB1_Rb4A[UVJ/BR#1Y2OEJ\GZ-TKV]S2-Q
8@E)GW2LdF(d9YE]62@SN2YgVb0);P&SdH@g\?f01b]/QKEeFLO&d:#+HHY.S&<\
,W&#.>G+/.ETdSS0\@]BSDSWC+#W2g:4J3VP)+OTfU-OQW.86B4ZI#KM70YSDTMI
(V??B-W,D]-\1\aLXRfbU&,LL>c_A2-M7C9XK,7/>=\AcX+#9>_.&-[:b4:JLL7W
g?AHJZ.R<VB-K+F.ObEdF>V,dg@&M-^=KF7-YS/MPI<(U;62[W^JQN=^8#<^D9-c
<2JJ^_)8g:e6&F?T=,A<(Kc&4QPdcO7YeC<Y.Jd,V[0TTNA?MF0AAVYIIHI8,I#@
]J5+=X5;cVD3ZaQ@/[Y=AA_G).\A21AR)^bZU:]/]GC3DY-.YD1[^H;\.TZ5?XRJ
:fX9EB_Z^I<T7@J&=M&Z9.N@S+UXO)DUMO68QLD:g^^D9L8Pe9O\LI6IOD1)9B70
UT.+e?,VIFKYCO+:WNM)-6KE9]A45JD+JP77?](EGDXbN7=<0[<85fN.K5F_ZYDS
[WNK>6cBXLHO5b<#/&J+<E3fVPS-7B4c01#.QA88,V<(#f.HTbdNOa<3STNX)a@P
(f\b-N4VBBX]3-&W\/C,CC]D>4O3N74&8geB>NLSD/^f[dg)fI=ZJOf0a&,E?\8C
90ZVGMN0;Y-+Ba)M^^QB#6cC6+V0=IVLgHPX78WJZ0_JQ<C(9OJUKMb-D#6g40X4
KD(g\>LOMLQS/V(RCc>\P8A9G9&c?+R:A6Oc01g&U^7W@=F(g@eCI^HR\K:DOIW)
.YZ((>Y<Ag+CH[c_M&?..16\O._GcbT)4L##MDG#,T8^P(E2@C5::S(N4SA+fB2e
6B(]Oc+00>J1C7CN:.)VKOFHE#\&e#6I3[9,bCWZUS4ZVRJbRa2)W=C8KXHNCH^B
TVA_?/TBc@e,bZc7c(Qf5TR)]e?_R-TZQ[_=d,/1/CGdC0>H2&ST;7Z5M)K&FF.P
2(+NO[0I?bLR0PDfgPFHN3XXNREW9KF47Z8_+R;WMY^;:H]17YR[R&H[PM_(M-6f
+J7-/H+-DES0OK>BAFH\gdOdeJS[R/b@\KX?<L6H:Ea/]0+M&[/2V50RP_8XEF#<
I;H);<T=&\]fKNA9O,9SB-0\aSII,YE7/U\8eW=#XP:G6Z3c].CeKd82FEB7U<bN
:UE2/SFQTC54=)Xd/Id11V9ce8Ved?N_4>XegI02K8;cQG&##dNF=1SH^Rc0Jc-/
8X,)Mg\)O/ad.V=_[2RT&C<d)G^5LRM&Y3)25]T\D\O(Me.&^dMEcd3&&K:/gH.S
^4KE:B-8bBJcLfY+7Q;[\+.7H(XK0EC0ZH)APT=\=#U>Q(ZRR:&^2I,44+&E)]OR
eV=eEd)L5IAC[MDFHTYW)(L9g^5@AZ<=AFZ13Dd<V/43-<c<N91;47?7ZP@02JGZ
afK.,-EM3717GIbQ//@GG(#05W916PNfDIbIAUBNOZM/Y:8E3G7\(3IJL?H8/8:;
g.Lg@3a:gWgX;\g.@Y;\O:fS.Lf\N):/g,2=P4\Ca?)87L78Vc>@<3He-EB/W<d6
D7<>D@R9<1=>0GA0C33D8:Q5Db^+3K/N42EA\77BJQ6N<\X>-/S4MF;,<a7CH4\F
Ya\=6F?ZF-fX>.-=EUHBQ_A,:g8-RPUNK15Y;<B-TM2G=eZFDD;g9c(Cc;F#[?Ge
cRPXG/aH;2CN1T4X#PX/42)+NF]d>eF\8=;A@)a1Y@J]S@dAOL+ceP.ceWeW0^LM
UP)KMV4KEH)5BN.:F4e=>R(@03>R14[#VZAGI?C3<W3NSLHd_JTIQWFO_ZaY89=E
FO[2L_6YdX2/a;1I5+G\EP&I.7=Bc^-RG&1=Y5.W\K^]IQ7:+#1P<NY9L_\S7I\S
@38bGGTGe-YDZbf?]_[[d9IaW;33.V^NV3WLQgE;7G>@M37^cKEEV/0GNQU5-,Tb
XYM8PG]KP:REaZ8KV\NZ\=I+7Q9b(SS>#Y(_d,.X/gY/WgNHJ+WIEDWI>&RG(9X4
-1JZ3&d#.[CNH.(I^+<PD7<T(NJ4VK4AD1:\;03(M.6KJEB.<\EacMYS\8Cf?W#?
H;PQ3QR.??Z8[9VSW3\>_[eS:bgDT)/&g-@HK@7K-Y_QRL)A,Od<ZHP\J5W]<@1V
Xe=Z<)I@e>BSZ(ZUS33&<^<XDLbG2^+50</a3R\4^6Va_W7.)]VDe:0-//<GJBQU
;GRRGdTSF#E9F1QD,CVd13)GGFfAZ<OM3)U:Kb7(UA-JMA-+g@2g/-Ka@4<.9b2Q
>(_=BF4eX]PFe4_F763_H#<DVd@DN@LKbP-FceF-HTVaP/-F&#.5]>MD]EScXI:N
/Ia7bNET^=c@ZS/1N(XG(YR2H3JQC->(9^(?dK0CYP3]TX+VZc&/K<:3c__QN;KH
_<EE2dg0@P]Ccb(X]E=ZDTRM<],Dc7KYBBAd\Te;C_bDGc)QEgFM]8Uf?_54X97Q
DE/_JV(15a(=L9H8VD:g&fY0]e8,?Y#CYU=7Y@8,7B)OH/6Pe<X2e)<IVGaac7DX
AVP@=-dG0L.a753/KBQC>^5RaeM3O4YM^=#OOA\Q?9.^\7+(WZI]Q3)7]cR8]B.>
;I3;;5^.WTSL#H,Q=V.XG4#OTBZVO1517K50G6FJFF<c;7M^(B./2<>@)R(e4AH@
PE.:?F_J/0,\eg_)>6&TO9HN.b?C=_XF-Q5T;HV1d6FS2;/^)c\GC]A/V/X@Q@aY
Ze_Ca&:DbLQ;0DVI2<3d<E6aF8OF.S.ZTAVE.RTdV#)_6A55dgP-SGR-)JDR:2.9
M6R_X<F99K1GIag;e&C2gH=XWW;D7g@URM8JUIEW2V@SM3dFN=I+_D0a5[(/2d#H
\O(I3<]#2E--]:JDWa4OI:38+:,UeJ4(;H5(^N,A^A8[dO7RdI(/9P(K[=DdNRXB
[N/g=/]0_3Z9C03KSOggPPXJBaJc2SPRN82/W#:&&HYS84TJ@Q:,;&<:cBJCDTHG
O;b(QH3_=^B9)g)5D-Mc&N(H+D3<?>BaP9YN:I#M3PbI<0bVBQ<]0,L#N[QdB?5G
KZT9-V77SLQ]^38[+fO8;cJ3R4:>-><Le,NY@;/,0NB&-K@16Q+_W6,?6A9NB\V8
Q&e5C;H-)b[6BW:UO2B56DNNUa[3]64:C]Wa),</e#::IPB7@NaD0,Wa.cN<RM]T
FQ-WXT^DAY8-GWY9cfU.a-0@I0GQTRC4KV/1XKdA3>AdI?^fULZ.W@1e5A:^06WA
L,NR1.Y+dBfHKXHZ)(;L\R)U:2e_fTe>_AI&f+A:,-G#N-XbU_&AJ=aa^bg_fD2,
YVK+d<S;g=+I\WV>WRO9V;c6)Q&H6X2.P:0a.NS4>,5g.]7/<)8:2f?QaU+,FGe_
VeT@L]c/(MWI_e5U,<A;cdWe8/9N^MS8<+SP3K&WN4N/)P1:cYe)YO0D\<-;UO]#
S>-/38H[\(=R&LCDR:NS3;SbF@Y__I)=?+K-EebR?Fg3N[/^X[E-.0_#fMfJ26I(
eaE>@LSQ@PXcVK>g=aLY[BE0L?#C7\#<2dAE+<.720?U#>2I?EKMSC.Qd]I=7X2(
;K]VL_H33I<\>1(<?E+NQ@R>dKR]EcfD7.6D62CM-ULOXSD6X6A#ZaEG,(7&&.dg
If2Mee874&3Le-JG(UHNFK^D<@a?RR48OH:]6Rd&:f.(I^UMPH:-dU:7^/dS/,f<
6PW7,fb-4dKgI<-e/0K:YWbUO6#TB)2H0[YT[22?^IO2B:N]DGH>CQERH^N+Af\R
]/C8_\e29^.&2G+T0Z&7P;_3gI?fKJdgeMQDRHedgA=<&8/RR--bV-9W-26:F([]
++f>3ddZTH)4?-7=YC4GFL<B__UM7;S;BALgCYP;V;WQEQD/\eW9?YP:N#VG_-2=
[607HVNU@/YL;QI\.^Jc>J?2TJ8bEeHb99c>FHBB4N^563MMR)PKRD<=J=7PIQD,
THA:BR)6A,D^-VBL-agFC+#-90/c.6;ZK)+61H.)dK[:&Ig4=/R[G13M7C#Ug86U
a(a,.).BUQQP#g--4>.Y5YZ&T3-7I]DeU&GBdb9K^BDN^+<HGL6BJI\HZPFSS56X
]Zad7DF]BI-O83/UabaGV2EfB.RAO;P-<LQ^W,ETTTJ1.7XFI7DMG@1NPUXLIE:U
;]-JS=^fF933Y58R(=Wgg,T9#=1\;Lf6,+)A+)QXQ>Z#A(JESfAfB=.c?Q2c;=9W
TIbD/US-\.6(g/FYc>FAeY\J1&AD,IC6gN3gV#QKe3)-48(dQa/1R,+@QdZ[(/P9
;a1^a33S2Bgf5f/eVD50c6?Y.92/,H@,S90LW.F5bJR<1A#GbY20_T^d?0_c:?V0
SE@\65F]@?&WH#DX_QCXDYEDG8NKZNJ;.1;[@.8C&]Jb:C)daTTSB?6)+3>EbZKX
W\5_\(B#)ODAQR<A;3DV:RY[fJ:S=g9O>NZa@&G<gAO8T8N#+21@YIcJXS/CdBJI
c^A7L8RW]]P/8YSENAM>.2Aa5:QF3&QLL@<Ob9A8<b]NgEEW;,=,JdV8@U]H[Kc2
9XQY2fd2VP1C)KWO#&G,HUMYN@?MSZX#O2S8ZgP0<[\5O5,#W1]edAZWgeV_:I\,
#UW6#.UL@Z0g5J.0.B\#CU&MA.J<BP:.;FEPP^@>IR==2N2H52eC<ZF.;STaB]RT
3HKWe5L30_YdN1YPZAEZ.Of+=agV1TgDMa9d.-,RH50A\\-5T)IeE&DLSCY:#70R
(8+S-)1+B&6PML0FgEbO=[09=J+JAH>B>P0E;WZ=5CW)HGI)+S6Q.<C8H(H&5JCb
IF@885[3FfV8e@,V\W7AS;eX3HgKJEeJ6Q6.LD3O&HDC-XDGcT]XZ/TR2.]b+c,P
Z:a#.)CTFW\Sa=,6QD[;/^XbCBB\Nff42ZG#)#W/GeG:a10[11^4;600YbN_7HP5
J=AMD+2,9SMT_20NNR2;SL8JELga^3RJc&C\[EE;1GbS-89&@<E0O)F4R6cBg(@E
<V)IF6?UQ)?:LF#O(f/Z@Dg:0bYBgDYZ.7a8=,R[8GX-NZ]2SH4_&>GeO0a[^#f2
H^\&)VW:8,.<.cD]EJ?8(]2;C5@V<5eeI)ET6:OR3e2#JZBOd,4>)CgVBBR4:3M1
5;.>7eKW8RBB2c.6BbESAaO0)#66IUKU6\RCEHD\2DUBDf3(0GW2_-J-WIPcP)XO
CAc.NM2d59^J^V6ZcP1B,V-I]ad=3fO46ZPdc,gEfX^VDGbUC5F(S1+WU3-3L6.^
+aODIAb0\GG@G5WB^&gb_F022,DD1K:R^O#VH@0JBWHIX\>XW>2WXM7U6GP_YXM)
&Oc>651ZM@84J7@0WZ>eeCRgV?XCKX:0SRef_:3LCbbdAG2M78&[2LY:faHeJ^MR
WRc.,NEV/&H^/U0==^V6SL@C<:L3^2I\R+L.#6TVKB3CL@((-8=X-D[=&3^<HJV6
Cg]INFVbD=7,S9,3S,;8MV4&8Q,TJ=NK?/,c)N0.#eHQL)XPDL4&b@HCY6-fH0LL
:L9>EMOQS^H3[R,4-aP,<_cfJUZ-aF)E#ZWFX+8=0N6SS#]OddZL55EW<3Ze)2[+
TH@_,]>.A6Yg+f0^e[6Z?:55ERLG3[CdN-&02@==F#PAVDMb_+=?8:8;T+1@9g_g
0dHVB09f1;C#URZeX.>::CUdE.:TIAM(^fg]YEc;H5[#J5F^H4c73YS\WT27,V9F
,]XO]SeJ_a<[07eLgZ1)CR0S+QG[KeK-X2HJ\[IX33(.(6F/U@OKdVg7-;K9G4O6
1,JY0e^@\[^?;;^-OPe@c\KS,-S\]B4RN0C5OCSA<[Vf4B[f]-=TXS6?GI_FH?RJ
#9]3f9\RgMLb<?9,_5DQ,;=CdS<NLOE6-.[-gDOYgZJG0_\IR<Y4A3IL_@,fRga]
Ka,=54IZ)<0b#M0A+7G@Bdg5<\XSD3\=<cZ)#I_]B@P2C=?g(SI)ZPb8@Z(a\gT9
A,+;(IN/PBSe5//8C))>&@KM#45OFD>M&E:WU82?_K)-L1PUV53G?:-1#8^VJ_#@
@(TXPZ<8<9BFUK4A@(R0\(7NebI481,>L&gXV.0X.CfN-+6+PWB[;EJ/MXS>g5+9
:<(g2d2QOd:Bd@PALDc2[_-(QFf0G@U.[7.L[6,K\a#fR&R0>[#VC5>8#gY2O,@\
XW2)EFIMbc@:Jb]R3>aHN^Y\,U-R2WR&R1/+TNXa19](8S7N.,MFTf;2(=aHYcE(
^L_TLCQ:f4eH23bFg-45IKR)eO7V-NTAa;;MK0N>;I76-f9FT+.90]4@-W)8]KC4
bCMFf.I-DOLB=CXX=/QRa#.6HHcd4TOC19H2CEN:;ODGbVI9PZK608]K_#-e/1MK
ZQNaLN4WL13ZQ:<Q;IXf9BSJJ0@FF2GB\W>b52fP>NB]^>V9^EcVY<T.7Q<.61U6
g^.[?7W;HSe2d+QTV[^-_:SbH4.)XK1^IU+4^+:<46.GIgOK<+c8&W(YHcJbd-RO
f8?eH^AaYSP<V[/SFV8[9JGCR0JSTCH6gf2\X1R(-6@1c/Q#N/3cUPYC=.(,QCY=
,7QT[gQSZ=OSK.ZBZ403A;>Ic(VN7P7FDK))IK@.IS@7VORWPMDT;109O3eI7O3g
PG.S)WN:gUKBCK(\/>YF2cY9=1ZcDb:6;JVQK;Q?BL-d-0#G<2H;/VAgL-(;R5IT
P4)GF..ZIPOc>\dG?MHNJ#+L#<fUPAYC:L+.Q5<-Oa&<eMcfG9IW#=Y_,?FB[38R
f9=>?1JGTL>C7b.C\QKa@&;?c9A:@6<_LQ]W014YcFH55#P82M[TPd1:bH\C??b0
GMQ,#[2.3U(.P7-(KU6+IW/>dgV0Nfbd6c(gZ-3Fe#HfG.#BDA\cK85T7,YFE#d<
OX:#cb6V.A#Z]QS#.?,]P[e2)5>R?3DJ^2P;O@Nb,.HIZ<)B;U#2X3TPM\+QQRE]
LKHOO-6P+S^CAI]UBf?A9]DdQUSR])R36Zd;#GO_d?>ZA9A>2Hc@A0(IZO@R9a8)
+L0<AL<2+;JAQg<Zf[ONA4P]M^C.XF/7PM#c.CCc>@aG0/NaPGSJ.>dV,cRZ=fYC
,]WcDIGOWDe4c:T/g=_^XF==YL/)+YbR)#ZJ6dSY2BX:cL+=6ECN&cV1QG;IN654
+VPcO,=K^@15U9VOB/P9eW4C1;1[EC,]B-G&9C4NK(<CMOO\^3H3Dag]AASRH+8/
VV5)^L3>PB0>PX1PNZ\aXDE9H&UH.UHUd&HR0H[P6RE?:B6dfd,9gU@#.X=CL>U+
]f)QST5d0<J@2?78(9FLQMH^5\DPFQa1B-Y[L)GdQMQC4Zb7/#gRCW.SYU+K7\@<
ZeIPeHb&3b2V;VQH1/IS?Eg;<<&F2fK7f:0fYSURHK@T=4_cIAf,EK]FYc1d+(5;
)eZ3e5#W956;QF=-a@TN/_[a)GEOT0#?;JcJUOR]M30P5@4Z/;e3XTHMMSVJe<Pe
U^R-(W8e4TN,R<_P(TR=C=SVPGf?d3CF0)E]^eS^)R(51?H/?BD/MR+[D.1^4AY+
Wg5_=bKNR;()N0\aZadU-3-:c<V<;7E(EAKG,Y+8:V)V(8&[/be3YN/ZOFgXPd(F
Sg7D@4@d4+C9YN0T8@T6@9T4XS_AQaECY,fU/^\M=0,4fBZgR,5Y@K#X84(c&d<Y
7#5HXAZ_:1](DZc(6\+SF,JCW:40PSCFFe[&22@c5>T4NXabHb28eTKdJ9Q]Y\E3
5JF(g-XFXHdGPO(^cVB.<BT2^Y_LVL-C=EQ?5/8RR_9@?ecG7aZX;&0)6DC5+f<B
KR_\Z)]#ZC,F_@N:Ze7P\PILDKCgK@=ZP(Yg#TI7WO]/1KcZ^6^O./;\@#8U8:,P
[KGd[_V.HJ^<_0.Ac?gL#dTC4g&6#cLC&FL,KPeIZF(eZIK[_cAGQ2TZ&+JB^79:
?bTTZACB1.ZXde?\g89]HO=\Q&8X9^(gKGcAZR<S)&@_26_OcP/cDE\&ZU=MgbRA
R_;EO&[3K]UCJdFdQ;KI5#F[(D0:IH_U>0geG)7-Q]N<^1U3L,\dMMYd)R/<W:TG
Q/AHUHb:U>_:N-UQg,N/=MIAJVGL+DRDMfg/;P0d\PXgS?N=bT7?9\BH-ZVO645,
1dG&d?RDV-B+RAZ_?ad>^(V7Z12F\fgSMG;0A0+\a\9a.>QC=[;feOW7K,FT,(IG
)LCCg3Hf2=[5QfG/#8>AA9/cMPaf.+@;\/1I@C68F-dFZd63I1NS^BSS36#;0D^_
@,]PC=9HY242gTdO4R.1;QRRVR:?&EL:J\H[C6DGEJg]g)Q3O@gOIQ@(c5=I=;/?
QUW?]D.PXZP^dT<B[FG,d(>_9S7^W>QG-4=SG>=Ld9)V0.PUCT)SF_aLg]/J.?57
:_LT)fI0P+F2.?&YS0b?]AQ]7[S?EU;<DSK.()GMY;eZ.7J(07JWW^8:4fSSWR@#
\6.:,<ea0d^SCQ.MV&#D6Y@\WD_W;:.KPD6(=Y57Z>_D8^,e7gRQRDCR>.]6L8e)
gBUf51?KB6&A5L#9_A,E>_C5>c16J-SN5H/-1QXV)<JU;cUcG3G<;1;<955_]MV&
E]A<Og4-Tb8aWH@>0>U1gXg99DaKZ^2^O34Zc_5J/LJFGNOee9=V.>f]H<HM[P>M
eUG(g=MZD)c<YQ82-#gdgQ(1R&&W?;>db,D#AcZN]U;A6=_Ab_).497/BfG-CU[E
EFU\S7<U+XLZNI@aDG;2DUD1]Wf#ANR@-K?&/]<=KIdWEQfQ(W92147Y1W+,Tc^-
[&3Wg\CJ4E:LfAKgNY=bG9fG55gPaC)fEXMaB5Q/@b;2VRZ^G(7T+#RB^2YW8N?g
+K^ZM<>&>]7N8AJN_>PDe925G2+JKPT+0^<[XRWIcbWMJ</)7K:Z?:beT-+Sb@>+
e>Jfe;,^O9AMXK1^2-6OBBgNSDLNDa>eb(Z/Kc6E_18/.:,GX<<HgS9]6FUI.>F8
,;T7Q/DY9?OVW<0WG5T5+D#^]XLIUE\K8E(?a\@LAMc)61?>Kf-<JXJDS>7+=&/c
:XV_;_SV9dSJBXUKI=-[/7ZRB_Z1/W>+HX9bH+0VBfL0Kf94<5^Y,g5=5G-+OCBX
U;_S>=T8.98+<D1b3f^LTgXUYCGC&>;\[?7_#D,];E5F4MbMef9?.L4\aK(Q:N=P
1KgO0;TENfJ9E<1N??;KII+1TFe:-8:^4dfNDZNE4bL]4_>/Rc]&K;VN2PfE2WAA
]CgST.HD_dOW(3LLga-CVGY&d(^JM7[W4V?a.7a.=:S<FQcJW=OMNWfIF014Jd84
+WF<RO-bT=2))2D&^57@A;5-dJ3?#&W@@89+E_HVIeNYKPK+6V(K5ZR[F55)23V#
>V.]L4@dF6dV+J3AdO+^22.46a4/^cN0(/6Gf#@XQ@H)APJ3/>0ZE9Ob[,O,d?5:
f],#^8SRS4H\fB43.^b95[]@b<Tf#Y[aR98;A^D-M;T12VCGW[S6Na+E<TPM1(@(
(ZV^QY@N3gd=1EP/2NHRFY,RIKb4GG0E]7[R)<e93[U^9^/]-]C_JKEJVT4d\)9Q
4H&;5Fd>JggBC[JE[RS@/YOc2,@].2&J_c))MdAQC_W9QbYEaHbTV54c5S>YUDC3
P9>JU6XT_Of#:b&D>e:N0\b7<93Q9IS<<9DU<P/V<.36Sg+;G/6H>9\C&<@2Qb3b
Ee-Q8F;\J0A&MY,J,(::5]A,)><)3-X>_ac3UJ5<=AU@_/SWMQ7]+d>)0]Uc0+G0
dLGa4Y,BN04M.2<E/+F][.6>f5Y@&>4=U_a[7VN(aaMOJ@X9V(UeK[T&<8RS.B@1
(2)0;U+:WbU=9YG^FN_1[WJ[8E#7EA-RYDTBTbe:P,O))IfTaQJD6?CS\U(aN-0;
VRfC9d_8aHTAQ=1^AP3fAd,[82C\D\<-_[7KK2;GW.A:e5H/.eP=c1d\0T,6JQLd
_=_5/Qc)B8K51@18+KHFf#2[3^/^7VQJP<T_3YN&_f)f0?\89O<U6,YJ>DDQ^88Y
=F((2QR\&NMS6LgE0I;B.=3L449gc9Z4NJ^PLRF-G9X^;aK\@OGB7c8YDb0&_8CW
XMOfL,.Y)F\HG:P=A5KT:2XAdOg\/7Y[:KGJ52dN5/?HN/HY1+(TO;(#Rf-aU#<V
E-A#C70U.U-K)H>EMQa&Ee&Kd+eZ[LEBWD/POOETcK-6GF7?dL+QF_RbBUPZ<QXf
@aRAVL6Q,CV^F88;-TY8T5V9:bIQ9PC\a<e6U/9F]V(KF&1+?,Pb2HE+W&V[3fU_
D:5UH-BQ/Lg/D)B<-/C7Lg3d1aNe8g8f65D.&)YK?BL0TSIYJdI8A0MJ^N.^;F,.
)_LNPE1ZM@/bO9g^SMf&=&/7R3Y(<2W9/+Dce,E+FVd\#GLUG5>V+3SU+]UR6:/P
8@SDV.Z3Dbfb))-/M5c81N8B1P/QLU3)Q:;,fNf3W>c?DJ:-F/&3&dcYPP3[M\^b
=]]X;aW<5bGNb8d#E4]QX<W_cdKJ]SL8&OV1;.f9#95._eeR.\U^5P2\N>cRaNgP
#&ccC]Ub43S=&Y)0SQ\^SW_G-9FP4gH:ZU>)U8YGB7;cDZDU;W:W5a]A&\0L6^V0
-bQRRcd08YDA<LdIfB/5CGLRGY5X^B:dN&J;_8Y?B5P_:4^IYZMBbAF,JWGOM^WX
0@eJ>3GK@L:4Q_@2&AMCFUR8:,94#ceBAW)4Yc[5G.9X;4X&EUbKB/Z;CT?#[_IS
C._>=>::NEZ^P+.S)<=KAeUDf,,RfV:1H35KVBgDE5S:?M]L]LDSJ959Qg]<<Id\
5PWQ#L\0^(bC?ae@1[YPJ\_L,9EX8YXT9bK+69B(=T;X#eB-HfCBO/@aZS5)#U;E
.@bD8(-138)CA\<]M\0WT1YO3Bg/7WTB[PgQXLb[:9M:(>B+\d1MHB84@Z52^7dW
A8)ZFMU:(&X,&6BJM=37Q]UQ]<5;G82J[1&5Sgf-fb<<JD+P?3)-=CRcEfH..;4M
F__V0bV+fgX7U7<Q-.aa9acOS48F3=ZCKFVf\MLd]^e+:Z?N>Kc&;d.M;0Md-EZ1
?J[G9KX+N]D&ScAJdea_.aM[U6G#5^CKP@W3T;L5C;:;e&LRD18L-)S3eR>9N:C4
+a/Z,#:D[12P5Hd>7BBBQ<.R^V5HD)GfC<](b<OIcddW7CJV-CI^G1F<RR7e-EeX
fD_YN#O<=dLA[R;]2>Sf7_+gLU40K\Z6R0\YSV45=36a>RMc=?:NW,092-#Xd^(R
Y\CT^J_YY,#[(cQ#/-cc4>6D@DaZR/;9VG_UQX#HD@TN(]78_Q5c61:Y\5RU29cV
>Zd;[QV=9#:/)>0T\VJK\A0J^P]bT;()JG,P[_7(a#WJ@,bbT=4eFJc7A7gLD0aL
/;0;>SAA6UcW\1HO)7E]DadH/+AaHDf\(B-(P@J8Y(T>_+#(a11&PE6_@;H@:729
G4&W8R&LLPPIV>Gd:Y9/60bA<fFbZ^H,0a_XJbRc1H/#LAW.Fc9G_+OTF\AZ;Ca[
PaO.3_\a;6R),gWAeX2K7a.XWgX<,&1-7?#LCSW@X4HEVRE_a^;@36AUQ9<#7cBD
KZ?_3R6f[UM)9PUKQ5GZd7:dISEW+2R@LI?Y3JV1KH+?-Q68,C@UEa=7baf]^,#e
M9:+e7QVXL.K&<<,=TQ@#85KfD;\Mfc5&NHg^3A<K?SYZJ?8J7OM]JD(IfcFf5^<
9MIg-R(aJA4(,5KO#&4QdI1<>.C;B.:_)ZP_JgVNeM)W/VRJJ>4S(QNT>DTD(gSM
_)H&.W)0.fXN_L>b^L0B&#W3YCSQgc@)_YJOL#>S0GA=,ZFdX<]df/)J8S\YZ=Q@
V^?^LJIL&8P1gNbE/-,4)_I]JGAHadOI;4Ead.bf7Qa=SIJLcR]3HKX0WL#d^#<S
ZJFWc7UX-/1JaVZe6<O_78@#]=<@+B3@8::c2Q_RgTD/g)c9?/d)_DEUR,G_N,E<
-=/[b-S6VH&>ZR7O@/#Xd4f/TF>C5/W>OHMbeSOQ)&E5QfHBU>:+a,Mc9D>bGGDR
WDRadLH<U^g[0_&;BE\eR&dDaa)V;&=^MZ;fS5,ea_.X.g5,XbE?TEYR4AbS@c..
^I.bIG.@8@YT+AQ(MX1PF.F]/bf=(8c)K\P9Z])@.CZSC:49[T#_\UEgA+bH_C/(
:#^F-gT)\@Y6\#J5Wd5SSQ^c89EI\\(U/+NLH+GGgFZ@c/ON.e^+KHHI7CA6d[I<
5_=AJe:=F3UPNI+UNUGC&+BW7_.NG4g[;=a:Z3a5R_?)B^0RS67\LG@G#Hd,?9[N
?X4A)RJB-O1L-M/cb=N)</2AeM8Wcg2M?44G86f+\e/P?HfOKVT#,.a93@GbFAN-
.YUNUZgNQ?M.-CE]ZCC;GIA>PNZ.?Wb6LQ&H8RS[H(S2-dRW@U80;D3[Ud[&-f&)
?AIIeDHB+-)X\U5X<U-GDQ71U@Mf:C+G#eH,9+aV-E/IP&@bVeR;#e/gNd8-2M]Q
6:8=(,3#[1=aS\cS/^5RW72R;?V.PW-/aZR/BXE/.R36..-4)\OeLRISLFC)NKI>
0-TGIaaUI9]6^_NA_+50VKK_SN1]Z1CfPfWS:L?TYC6;Z9)JA:eBWWbSFT,HS5UM
9DOceK]g&Q7beIWIC,>CAc/>^2>,8ZKA&R>>Oc?J-QE0e\CAXU-?9@f6W0TFYgfa
4F3PD3?:V?6SbA)2])dedKF:Zd1RY1dXN((d-<50&X74W.JRN<=3Td2[\D7e^T1X
3c9/1LM1<_?bSM2_HSEGEY(ZBN7d6N-ND<H?EV2Ke/8GHY3Y8XLP#QKe>A953;)4
EUe]>)QH6]V&g>/I)IM]TK-QM,GJW,)53DbH]e,cN#cU8QOH&3Nd\\CW]L#6d7N>
c,RT(X\8[L;Z3<7L[&DfO@1@>CF01N3^8bSLcCWH6/II@P):SN5f#a)GN,SU.a.+
Edf//TL424--/0,PXa1YE;g0ZCMZ-Og2O3<40LG:#QM9.6P3D[KR83V5OKL+1RMa
^eEVHf7XTagCSgbG<34#,MGV4;-FVB[#<E;-\VHS<Wb4S)CL]B0#/>^RGS=?</8W
HGb(Gd(A-W6YJO1_JOR3f7YbBIO>/RJ-f.7bgbVS=2-ZV444+0f]M\\&^45->c1U
M6=,^/QF=D@Bf(gUcAHMTK>b=PH=P:aJJ0,V_6CP]\&RZ)TYZaa_S,=YQ/d>SF=B
OIJdF3\^09<^DIM45GLPNH0CI-[0U79YPDZD8.CZZcU9>XCMY8>Tae<Sb3\c#U:H
.:eU7f)IE#C8,^_gY#>.C+-Q^H1bDf7U6(J+]8X94Ccb,@#.&\#cB_0dg+Fb0Ba(
g[=Zfed+_KHCEC1Z)Ua\)45_X[BBg;\4EPdV;@KM\X=W>O&V&&WBcXRN)32SOeC7
H=X+WT8O/\Qg5^KCS3(eZ0^S@eb>T<:Ag7eGSYDG]G^@2UC-8f++VGD@?d;.N<8M
YcDS\=ICA2^g:-0(OY,+HRV1>=6^f+MIR9(cYUCK-fg)+2/_L8ZY>?24U4T9V7QN
)H=Ce&.0MR3QQXDO3;R@,6,_NHS2b\beS]P/TTSg;)QLKW4=FMGYN6ZWMQC^.A_[
3I[FB8_8K[&D2bU>\3c>>NY_4K0g(O)+ODgQgC&c2V).2:0RR8H_O.4gb0]dUEHZ
/V+JEM>XS@f-@_Y+a=,9O8MDWF4@^_Ja9fK),?N]W5[V<;-gO+##223?VWG79?O,
@[GFEPAI(fK51>1SP;PC[]@Z9gKXZTgdLW__2cAO=H;_]JSgIX(4^=8I][TA,4U+
_9NN-Be#H?JU#a0=8P7;H/>6[3+<_D:L]#O8ONLe7,IT/7UdR1J@C.;XO;L8E_#Z
5G#>O+?8<ERUS\Z,?a1H12@>75/a#0_:XN)@0;VQ\YBHI8SX;6J&aY\Rd7&/0TAR
)&eccc?]BW0bCN69#D]]5OZO#O3ZgZ9J]<V9QBCV0U5dV432Sd[S0bP,19VP]<R[
;XO5T2&@D=V12P]TF4H()2IRf.7(1=9c1>/E/WF5^M9FQE^7+^\eZ.d6S:]?fT6^
dA37-SK;/05X.>8;N9K\=gB&&NDY@#7+cNcM\X.IT#1e=_+?R+4_BJ(R3\9DM]?8
(P12ASO8WXG:1J4)6Q8#f7bg-c]BISC8c#[;X(?.S(fDADULG[1adIHZ[>dbA2,I
b-70ZQB;YP?XZT64IA3IHg;1(@)M\4\RF4#QJ-HZIEba(@YRJ=X7SK#6XZD@\LW#
]7)5DYDY]4=<[Y9KQ5[/=H9adMZ,4&KDWNNAdAb_/:dfM>\T)NIKNZU>A+(bC.gX
=Z]>X\P2<D-6M@9)MU^0N[MKPQX_Z_:c#)Q?:?R<:da3LRCVFNGQX?TX/7-V7#d+
Bd<b6_bAYLK3W;[fZe2S9B\fV1D/_(4]E>C(NOJaJ7OF)1=DSbf;)4\YX903=+-Z
Y0H3E_6ILM6\^@IJ9\V7J(W6N//]P1C/FQ?WO@)3Y]P99R-JdB]86)[R7]LQOf4e
g38]I:\3FM/UJ_c#S&&6KYc[O][?RM12KJL,)4/-HASQ\6-+[-XTKE4.XX&LZ[gQ
bYL9ES3]]ROde4X1U9/Cd>65Y;7(cUJgQ5>X9fe9SBa[GYPe.b\I5-?WbON7c0Pc
OO#3.T(QX\-_LM.b8LD_BGF,LL[-6>+@Z[=1S7Y8OgU5#bOd-G2IYBB7N0E=N<ec
R.\,,3<&Gce>-e;a+??1T)E[f-95+\/D8Hd5+B,V7<)gU6HCB:d.1@=+[OLe:Z2P
69PDQYS(8)H:8QYP_F=9P4Lb[BUHHD2V<EaLDN5ETgEb,cBOR4AdY&>_/.XI)ZTa
;bP_6A[-8Q=+T0EO7Ne\Le4ZE5SVA0FC,#&36JW^AQJ=^&5a[^NG<dSGRa2Y#FR<
;fV7MCdc@GPCI#Z@.?L346\P;6YP,bHDJILSB)[_dLKb;VBI0LX2;49X\J,K;(Db
d47B10=E(GUR>2Dd=9c7b0C/@>FFU=@/FKMd_dC:72ea?gC;0C_13AI^;IP6=b@1
F#HVV199?O7XfYJSL4Z\3?#Y&;(4LbYc\;XeSK5M?2(#4=KU9Dc_PKX\b0RTPJ.>
Z^0[D0@&XD6g#Qe&4:Oc7b(7:Vgb(059g;9)(_-^APMd=VISRHUSDe=Tf]J<0C-W
+d-c(BA2IAgg^b#CWcd\5.RMLAe/O4K-;LUB]Qf&H9\;Q:N8=F_2WS-.00M[K]NH
NW[Ld#;;WefG].2_TJH\f^eQDD_dg_=17d)C+9cb(#OG4B2>1f0.1J>@]Z&S1?#;
<Yc@U-9>BSQbY&I?\-J,K]Q55CQ<d:PB\5M4PKB-ZWYU<Z+(=APV9EJ<d^dEHK(D
OG4g0+>_#:A<<5a3UR+(eU-c79g[@OCX^)(IBBVfZ5#Y41fL5=f[IA22S<8gc\fH
@f-BUVa8I0fHK77MSL^4?,(Da^Xa?(NF_d9-BF_>\4QAb&TZ:#]04/C2>c9FdNWN
SCQ-c3D&0)Y@e.KBEJA2gI?ZSC>d]M:]=&eaGNB#PN-A\IX(CZJfX;b<.O)L&LC/
[DRL25;5/6/a\#HBGOJ?P<c)@a](O:CVR&TX5AZ=fGC/Sc<dc#0KbB/>KZHeWI#H
]YRM9=&F1>Z9JFK_?VYbH9f7J7JdHR:_4NLVAI9\]^AT>aZa<?bg--/fV.YbM2B\
4](F4,2<6(b.E/SJS9]6O-GNYBIZO>&7TF)3@-P@:Wb,<AP_QBRVBL)6XKBL(PK-
bBYXPFA=+:4)^9(S^+4;>D;L>>ZV28OOb#BHA@PcZg8#^MHS/L0[c_5L<H\2JcR0
;/Z>^PDS@YOd][CK=.+708Q(T<:MeQ@+AN/eH)EA7?eg86+?T8#DS8.P&X4L\Gg3
MJ:[/YS38A-=;VOIIZSOR\^_MDCe?>7H;/M[EYZ#+VSXXJGT^(2#Z3R2DIRAK[&)
>#S]6AAKFL;.M:AF.>8#a+#498EOX_eGBB3O@&S?TcHWGf_+\L[DQI>Hd\I[5DbS
Q#TDZbK9cK>)S2\D/We/>[PMFX@\K.,\E8),YLYeSd&]=<L;LWT>IO;MM9OVeNN)
QJ]O0WF;Z@7^?EX)/G_[N&U=?D;DFMZJ3H]+79_Pb&6N?DE-UA3d\.K6=TUPeX>6
NDAV\)e.7Q<92_M8/HfDJ[HQJPI4H-M+,\ZXTCUVa&^fQFegYb7W1L;KbJC+@(]#
CSEAY7P?O@:^@7RKL-\RaY<]E@V:77/QAL:R6[CXBF2BBY06\WM(I=7SS@D=;=(0
Ke&S2?[4Q[.W[C2A)DJ(/T&b@1,)^W3.]f#]29d6c.Ea4\\#XY]e(,IRR^@SN/V5
^fA>W[N[E@YRa;9>R#[QC0>G_bd9U_1TFc69c_UWFdM\I>BcH;DdCUAF32?DSf2e
d+?&f9Y^]:B&J3Z/BG\<fId6\C((A7Fe-029C)c/dC=_T\_-D:RYeRdUD\1R<8NH
G)_::K9?A=/2AbSa#dUJ+JN;a147\/\6\V^V]PT3f)2)1B2N6-bZgbB84@PUSaHP
gW-aY&;\a.1+(1WH/JcUM:_5f1I??6@2aMI+JZU9MTB7R>6H?1RPEVAZA&?#[],e
=Tg]),f:8?1Xc?&6?];AEZV,;-Z)Jg]03>0Y1Rf=Z]84?2+[0NQ1J1VU7BgfPO7]
X.[NS>C/-&DCP?DD88_d.c<LbV(fHL(H^9THPIZ]5_T705X_J&O<(Z57UM<LFUg?
-RL#9?1+)<W>3])4W\BJg?GVW7:#Hb1f>=G#GC=Ne6.>&cW@Y?d)_HLFW#D,3f]Z
ffL:M2?dcgJ74aHY[Q](,DS_Z&8QHCO]c8H2GceQ\BGO1PaS0E-B6W])A8_DX<6#
J3e)@.LNGZHf#YCEg5-\:&a-N:&KgO3SBJ4R0;SM&/AH8c8QLY^].APJ_->S^-;7
Wb4JLNAcfL?-T#&_<J_(b5;J_\K4T;aF[C+5E<#704CJa7=Ed>GQ8d^_dT5\(6[W
+OV4\#OMOcH5L)X\]@2V-76OgM[d3IYRO[N,5XIYA8MNBW@ed?7BT-I+@P5/MW6Z
D6OP-g[N>53.9DC9d6O(dX)ATOWG3b;KXD-#FfIEV5RH:cbHIFOc&YUFIR<)_;L,
fX)QAPW&KPS2TdZ5SZX#;(T[;&>0]dgH2KeY51>XQPSYE2WKIP/#>4PY74)dT+cf
,V;>J_2GM])M9d>-,]Je7F\F32g12ELF.N,+;cg_=VU6,86B4ef=NZPYK$
`endprotected


`endif // GUARD_SVT_SPI_NAND_FLASH_MICRON_TOP_REGISTER_SV

