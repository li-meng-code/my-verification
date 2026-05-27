
`ifndef GUARD_SVT_SPI_FLASH_APMEMORY_TOP_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_APMEMORY_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP apmemory top register class.
 */
class svt_spi_flash_apmemory_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Mode Register 0. */

  /**
   * This parameter defines the min read latency and maximum push out for     <br/>
   * read commands. It also defines the max input sclk frequency.             <br/>
   *                                                                          <br/>
   * latency code         min_latency   max_push_out      sclk_frequency(MHz) <br/>
   *   000                    3              6                66              <br/>
   *   001                    4              8                104             <br/>
   *   010                    5              10               133             <br/>
   *   011                    6              12               166             <br/>
   *   100                    7              14               200             <br/>
   *  others               reserved           -                 -
   */
  bit[2:0] read_latency_code = 3'b010;

  /**  
   * This parameter defines the latency type:
   * 0 : variable(default)     <br/>
   * 1 : Fixed                 <br/>
   */
  bit  latency_type = 1'b0;

  /**  
   * It defines the output driving strength: <br/>
   *  Codes        Drive_strength           <br/>
   *   00              Full                 <br/>
   *   01              Half                 <br/>
   *   10              1/4                  <br/>
   *   11              1/8                  <br/>
   */
  bit[1:0] drive_strength = 2'b01;

  /** Mode Register 1. */

  /** 
   * This parameter enables the support of ultra low power mode:<br/>
   * 0 : Non-ULP (no half sleep)      <br/>
   * 1 : ULP (Half sleep supported)   <br/>
   */
  bit ultra_low_power = 1'b1;
  
  /** This parameter stores the vendor id.*/
  bit[4:0] vendor_id = 5'b01101;
  
  /** Mode Register 2. */

  /** This bit defines the good die bit. <br/>
   * 0 : FAIL <br/> 
   * 1 : PASS
   */ 
  bit [2:0] good_die_bit = 1'b1;

  /**
   * This parameter defines the device density mapping : 
   * 001    : 32Mb  <br/>
   * 011    : 64Mb  <br/>
   * 101    : 128Mb <br/>
   * 111    : 256Mb <br/>
   * others : reserved
   */
  bit[2:0] device_density = 3'b011;

  /** 
   * This parameter define the Device ID. <br/>
   * 00     : Generation 1 <br/>
   * 01     : Generation 1 <br/>
   * 10     : Generation 1 <br/>
   * others : reserved
   */ 
  bit[1:0] device_id = 2'b10;

  /** Mode Register 3. */

  /** This parametre defines Row Boundary Crossing Enable */
  bit enable_rbx_feature = 1'b0;

  /**
   * This parameter defines the operating voltage range:<br/>
   * 0 : 1.8V (default) <br/>
   * 1 : 3V             <br/>
   */
  bit operating_voltage_range = 1'b0;

  /**  
   * This parameter defines the refresh rate: <br/>
   * 0 : Slow refresh <br/> 
   * 1 : Fast refresh <br/>
   */
  bit [1:0] self_refresh_flag = 1'b0;

  /** Mode Register 4. */

  /** 
   * write latency code defines the min write latency for   <br/>
   * write commands. It also defines the max sclk frequency:<br/>
   * 
   *   code     Write_latency    sclk_frequency<br/>  
   *   000         3                 66        <br/>    
   *   100         4                104        <br/>
   *   010         5                133        <br/>
   *   110         6                166        <br/>
   *   001         7                200        <br/>
   */
  bit[2:0] write_latency_code = 3'b010;

  /**  
   * This parameter defines the refresh frequency 
   */
  bit [1:0] refresh_frequency = 1'b0;

  /**  
   * the PASR bits restricts refresh operation to a portion 
   * of the total memory array.
   */
  bit[2:0] partial_array_self_refresh = 3'b000;


  /** Mode Register 6. */

  /** This parameter is used for enabling half sleep mode*/
  bit[3:0] half_sleep = 4'b0000;

  /** Mode Register 8. */

  /** 
   * This parameter setting applies to Linear Burst read only on RBX enabled devices (MR3[7]=1). <br/>
   * Default write and read burst behavior is limited within the 1K column address space. <br/>
   * Setting this bit high allows Linear Burst reads to cross over into the next Row. <br/>
   * 0 : Reads stay within the 1K column address space <br/>
   * 1 : Reads cross row at 1K boundaries
   */ 
  bit enable_row_boundary_crossing = 1'b0;

  /** This parameter defines the burst type  */
  bit burst_type = 1'b0;

  /** 
   * This parameter defines the burst length:
   * 
   *  00 : 16 Byte <br/> 
   *  01 : 32 Byte <br/> 
   *  10 : 64 Byte <br/> 
   *  11 : 1K Byte <br/> 
   */
  bit[1:0]  burst_length = 2'b0;

  /** 
   * This parameter defines the burst length:
   * 
   *  00 : 16 Byte <br/> 
   *  01 : 32 Byte <br/> 
   *  10 : 64 Byte <br/> 
   *  11 : 512 Byte <br/> 
   */
  bit[1:0]  wrap = 2'b0;

  /**
   * This parameter defines the Data Lane Count 
   * 0 : x8 mode, data is driven on 8 lanes
   * 1 : x16 mode, data is driven on 16 lanes
   */
  bit enable_x16_mode = 1'b0;

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
  `svt_vmm_data_new(svt_spi_flash_apmemory_top_register)
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
  extern function new(string name = "svt_spi_flash_apmemory_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_apmemory_top_register)
  `svt_data_member_end(svt_spi_flash_apmemory_top_register)

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_apmemory_top_register.
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
  `vmm_typename(svt_spi_flash_apmemory_top_register)
  `vmm_class_factory(svt_spi_flash_apmemory_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_apmemory_mode_register_0();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_apmemory_mode_register_1();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_apmemory_mode_register_2();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_apmemory_mode_register_3();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_apmemory_mode_register_4();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_apmemory_mode_register_8();

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_apmemory_mode_register_0( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  //extern virtual function void set_apmemory_mode_register_3( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_apmemory_mode_register_4( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_apmemory_mode_register_6( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_apmemory_mode_register_8( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method sets the configuration handle */ 
  extern virtual function void set_cfg(svt_configuration cfg);
endclass

// =============================================================================

`protected
\3G1a1+&N>/c3GISfRO9gTZB0\d2Z_Qa(87#-Adg^O0-+]@(Z/4#3)\b1XGJ;)3;
A/Z6TC@g_f]UE0e:32+[3_Y<\G<-,7X3(MA(CX0V5R^40MA9.61R:]Eca#MARe&;
I]aRDgCI=)VD4BWYF]+HeZ<CR-ZFYA0,U:CQ,J.dIKMW^WXN,CH8.2842&(G8BAW
;JU:O0QHeP-NaFU43D&1_#F_UQP\T7+L[.g&]3[KB31/a8g=4+0(C0P80-B[Y_O6
b2DSLHHY+gG9#3E(0LUR?V,V+c(Y/6X\KdH#[[)gG?(+g6VNWEMHJ0_WH)ERDNR]
)T6[JG?@?ROMW(FJWLd5B.W^>U6.Xd_Q)NW0.35#6/)baV=1TC:UI;&L7_=GL^0e
_PWKd&-<b=9UQS0F@;^ae\?XN^bbb-+0?[/6YDK:PBUX[+MI2:De7]4.KG53+QBV
d-II[0N@<X8Je,;D+N=ND6=F><E8GeVRKJ]0]\WTZX36dRD[[N60Vf2YaMP^UO3/
gOF^##@1RG.:D.1e<-QeCO2f>g0?]VdaK\C5X1^+QfP)XdgT:(,c)7Cb8&+-S<^#
9I-G7^[+H)\&PgcfH:OBB1cYMH4.VY&369(.PVI#@UO-8+=dZE(g,CIO;(HO?F]0
eTTU&E7V,\Q&a(UdHJ5BY?,egaSJgC/]AIZ+Gd6&b6R4>N8>bRGf,WIOP$
`endprotected

   
//vcs_vip_protect
`protected
6<abRN6XI>C-W<E)W;-T^UDdM9M9ZRQ->M@KZ/AV)BZgWH>aHGG[/(/&dNA/E:.K
JFfAc#OIO?ZMD.NO4,e1^Wb?GH43OX79Lb.AAT(YE,U1;/3#2X\)/45WEfg-@V05
=b]a2/gTR9T,+HB9T31N0YV<S+95MI\fa/_1Y)HA=2JZE,D^<=4Q^3:PA3<c_DBB
(B6WNJ#@C_88[GfT2@ZKKHYP0LZX@_]DKD8TdG^?OG:<J4fc;_c=^QCHJ.391+\)
79?IIJ:/4;<Da-8[.X/HI=V?0H?F#0_CN#[J=FB5OHLO]<.CbYAC+3J4+FH1,X1@
3,TKA=R(3fP6C=,=G.QGRf/)J[96WBK5^Z9aBMZg.UA^O<K:@BL+.4GYQFD1,4Z]
GX)N/9)/8]]#gN2D7T6EVU?72NLa4BJB)<Y)#E^<[AV/Q&JWVIQb:bSK(_D^R9CW
[ZQ-(64@2EPVg_2(8[^g<HWZLU/9A,8>P2EUQL2\6XVa5H_F=aG/@GZ4N5NN2Y3[
-c(c1)^^1_fF8_:0@^_:F]eK(c8egCUgHCd)K9d8c+DLa=8:I/]PSYLONY3(fdLH
TaH-[&F77(GI/ZfP;We;4bSK_;-NUag7.+25?c3BIZ#J66GFB8,,RYc9?^9NIT1E
ZZbc.RV<ZJW]cfN]=T?:1=NS^>]BXPOUeRf]9gUM2[;P9VOXAad#H4MDM)+=Nc(L
(5GD@@#f&OR:3ECc>=NbXGH[B/d5-99SQKeOI?VZQI1;W?8FIMZ.\\N:Ga/c.]c,
8GT-@E=()50W:5c:RB#7NGDDO?DS1bVC)NWF^.NaRb5[4^W_efJ.BJbT<OEK.&_Q
Y:d\gPB#JK8cU+?JUXP\-4>?g@Y_V9J&5:+e8,g88#-M&6BZ:UI1,cBHM[ISKX9b
QAaB78SZB8:U.Ae7S4bM^VHdfROfBS/<@.8?^/^IN?0WVCb](FV7KS6f3?VNeaXV
Og9>3.UJT__G-S5MY@=1DSQMZ24]N?e8.,4O_L63A(R\LZQB)UN4]<#a&.K.80NO
[0)__2O]2L698cT?K-;]-Ke9^)6;FG,@1F[N4MW46TU.9,A0A5g1U4P2>\Cc^eP;
gS((0A;,dSMXNPE_G.:]7JB0;Ia[W.:[;O:Mc>[ST5CGM9^cJ[c8FVb+K04:7PN@
WXd.L-L<&(?@IQ(I(A]LPaG3TB)D5.S2]<[M,L-B;Q193-)Cf?):^NK3/Y,_WF@T
QB\YbB+Y4Ab4@/b@[^YLWe3)<[/HVE3\aJG2_F1b>T-BA23N58PB-8:IB#OJEbVe
,&&QHgG]QH=R,3aL25J\J<&@IH+\&I&g8(4_XBJG>=2Q13QWUZ<^EZ?,&[fPRWWZ
R0a?F(-R@1a1Z>-[:@XQC5/(H3?1.S.V#38FRB-NPb[:5We?b&-RLCbI/:X(N:Za
4YCOf&RG>K411K9)9B2CCVHFNg]IB818;<b_(4J#V_.(GT&L\_=SR\8_<=3UAFUW
G4U(_0P-2)K,W^5E4?8R9?#4G#R2:.R+dXd6F^)@ZG7>VgbDXee.T:>9=6NGJb[S
#77[TJ6MP:(Y1Ic>.(B8X;E@:R>6@_9B4P&3Ug.9V9B+^3J-;@0KLQ7<N-d0V8a=
cUcdNc-XQ8g48#V)9,CJd(IBHa(IVW1(=HG?6CNNP2TBADU>><EW&Pf\)N)BFE/R
H\)X&&V&Z(-)U-2J^C]\VMe<9NXJc;>5:K7E=&HbT7>MN=MPG3)M6SdEL1/&HD,<
d<DP>4;ZcZZJdfS,>0&/S(EU4YU[,db>K6H1@)93A244TUbAY<?aA[f<TQc51N#0
:6(NZg2LVa09-Y#DbeT_GV-8eBJ0]Y=\>:+NJZ@9DH>3COMfSf9Y_7X\CVYgG?58
\+#8Va9->SAe0/1L]NRMb]X.HS,J)B&e4R-+V?&Qe)BO].d(1[a]GaO<(9b).5Oe
P_(T1BG_VMHN]6/[a]-9GC;TNO]JOaV<-7J]FaNACgGF=@#/#B^P9D=W.4edV:7g
Age=?A;dgTB](CCN]I_DOS6fe/K<.;DCK,(PB>;Q=gBc272T[A/]VQNVYE@595=T
R#?&b7RNf<MGf#d?LCA1aeN&XT1KK\0,I=Y3X#K,D7Z50^V#0e4/<^7^=OU;-eO(
-fZV7J+HKA2&PYa]-FM>4f@/)V>Ze4CO2R,fB04AB/:L^>2PNHeOKYe?]A7^(YBQ
N#bJS5B.Z1b>&+RJ5(+N+&-Rb;(G=^OK>aT2cRA8WG12cW_c@Reg\(+#9#[C<ICE
gW<6_K3]5@RFY34#)37aMHQ(R5(C>Q.8f0Ib)BU]=e\&3JY)]09AV0P>EbBVWA^a
>Gg#+J1<;>YONKcbfV26OfTBb/N<\.)U8^BL/V#A??fM4->PZJNS1/Na>OP7\NG9
L.NLI67\F5T,EZ?E<NE51f-02fR-&;K5N]BR\[/#MN=3Fd7VR3bIQI82N<Sb7?OU
c21RdfH5V&RU\M3=.Tc5ET=HRKc&RAgHV);K?5d2GC\GX==CQDRHS<.GdF.(f[T=
I-TNHE)Hg/O9TR,0A4e[)GD[9cGfL.(W0CI@KH:a8EY6LVDbU/7JDbOceLW=>&4_
YG??B8.-REX1CZKF5DCS^_<74d#2B&R#,E1e=g[dTI=KE;SWFb)bfgYJ]Z;(@+:F
gNd>5C6+Jd[Z,9=STLV#WGaOAJ4S>1Y+IYIc,U(&ec>3ca+PIeO?=AGT)@Y/#9c\
W>?d;6_JI?<cEJ@)/5H,5ON>a)#/3L._+839c57&c<Gc(]>HJGY;dAX=9^[Z4<bJ
Y+HQV\:VC_f/LdP>&4[AP2US(:)Q5ZF3QU@2bN&Gg\GKSGSDe_&GTf4@YLbTJ[2K
1X5.M_,)6]7T^3R@E2JZI:\SgC_5J(_+[b\5/JDBMBWOLRDH@\dXZU/,.1>L9JW6
8WP(+#0?QFU\<PRC9=7O3A+,KFg_(?)&(86]^FLUCIM6HC]dQc-H=-bc.^OF&fLb
\#7Ke#&7OTJ\bFIPdMU(OG#BRgg3GN^BTc3H^H?]GS+f<]bJM.MM:cZ<c>?DE\dQ
:b4?#;,P,=^Ud\@_W>&Ec8Z[>gX0V&^gcHG5H>,Ed,WL\>A\Nfg4QMN6+eL0dK#2
H,M=B3f5&0,g0QTg0YQ\79]N_7SCQVDdAfBS2-^:&C)B2QR^.BY9Z;2+)Q_Wc2+?
WO-V_GVZ=_R_b/Q=Lf6DHA5eTA+;+W19=M;_[c72TM9cVH#bPXH4Q?<HG1\9QC)1
Wc]/BG.Z&4:-TE&]=^&-DD9J:>F^Yc5EaeV;);190;0B+0CZONIT9]99,E#5_#Y;
0AO3J0=dR7)#b1GI)BDS30K9C)Q2_ZQN?U.ZNLGT\JWc1<;FSXLC_(Y?bBIZRA0;
W5DJ=-cb(N/W4IG8_5A?BF2[G,b++eaPYJ&<W<GeTDWEL,,<:O(9IDGD1]C>V#Z?
Ga]Z?\,9W_9V]#RG=[-@bBC.=fCQ@;]PRS4_M8Z8T<>_Y1@>->7C+:.5H-Q.[[65
ZbDbG)[X5]2gd9LUXcM?Z#S,VO;e+=M1&E#S\126e0)+KX=4@0&TW@6<b#-3VEC&
/X<2,[;Z?-L=QV,aaXHeA_](_OHOBN+]:-YP.S_AB\E797ZIJ_]V0G;9_H^T1K3g
_9@019&e0OcJcg4+IH[S/eFCYPVPTg((#:,,RW9b&CYN@QC1)@Z(B7>MTN;\c=;-
X+J)KBSU.8WGIXgaIAYYJH<Q@F##gD<[P9I#gP1@S1a/2EJ@)f&7>a<UKOMQ:P_^
3\.4T;cX82b#Nf7g\L=3B=PMFU=e[+]V(d24Z&YO=3cV4?>g&=HKR1G]<AB3EKZ#
fM-WW7;4Bf<PTe?MD<H^QHbW\\J/QI8\0U/2Z4#\a7E=6)&J&8Y6Q.3@:68DP)IO
W3=48X9Q8FJ5BBW:HCUNZ>@eJdd=ZVDSJ.4Y<SdDDE]RDW1dN0@--DV;,/\SM-&K
&=Me3a18Z;gP\XUJ:T.^;//-Q,E09@7#(.:#Uf8&GXJ-:,[HBZ5,>,&98&dA&?/&
gC<R7:>X28DW=AX4P1g,A43f?[14:)WYKQ)GdA\,:L[5U?#36N#bAT#O5;M@EHQD
edCI\T#^I0I-S2CA@CLT(=8?ePS,Yd-W+.PCBT78D^N?EAQXRd#Z-Y1PSC_0CUOQ
=\8C?.Y49<.K-G?VeU-CAa&Q5.\G)8?7c(2?GO;a(P<)(J3DHXK=\IHJ,YSgW=9P
aCM=A<<A]V^T]O;e00L2GD(UPd73,PcJ5f/)V@<^g9]f0eM.ab[Y&=;eEESK:WGB
M_\R9fc+[adGV?WYe;WN2G+3R-d/YIaeFMEH&f61+JC/Qg?\G?E@N-g/WR+[9Bg3
bJEQ1cR>a)bXGXa17dE9R?>L]LY]K71]bO15A#]AOQVHT23ND]f0;?OS,A7M:;X&
d-YgT2YWWdY[G<&+U,75S/Mg?<F<O(<ZL;PE/4(3NAX:a]NK0/_+C]<D@Y6-U+HS
:<Fc;7f7BQ<O#)^TKT9^3=SCb6[^aD9;G6[f=aYObe#<NU#;E6:(PW5cgN],Q>[d
JbZR\=HHSc&<6He.7#gB]+eH(T^IZd6<+)Q:c[.O\H,YJ321aGB+I\GH?K_C>);c
@A/+X8fU:41<BNAGHfV3J&)4P^JJ0G<WEGT(eGD^ZV10_K7CC]?U1bR2Vd?#I?<M
DX0bL]V)6NQRVSK,CA&96=7W-L,YYe4T>YX37.X]AOG8Haf^8B3dHTKdfZ3W1]4I
QR?9N;:W9>bB_M/FE=AgaBA0H,1)JY4(8@gMO7+G3dT</V_B?\15FE+K_>&O&H,3
J8P[)K/<eV+[e1>.15].AZ,#OC<Y.S,0Q7IR_-8S>VQ)9G^AT;a;@Y]-<T#C.))W
<\FB&X<;])g7\0J&,NeBGSgaU4^)8JEGVV#;]+g,K4Q;L+.<d=<K<N#;26e(JG#a
ag,^\-_ILXA^E.<>?aWF\6Fe8)2#,=??A[X+T75M;g^2^8_2-I7W8)cP(DDJ^H:J
,4\EcN4I4,9>Y/ZX291#gPXI;W[.?&;ZNI,C3O@?XQDF.YLH[U7.J=OO6dc-\)#T
\WM><6XJ8Q+B</1_M)bTC0K57Vc_IJ/R@X0^>\4VPPL;?Z&WO-VP7H2.-0FN7CDF
EeS2DAaA]O[:LO[#\a2ZD-:2YWLIG)_9J=&++1I9.5(RIGM5&b:ED27#);T.U;[:
G(4FX>:97.)\U<a[[Xf>K]M,=LC=?#FWQFKX/?I__^U:c?I3fMFgQ>B)8=VZXCb4
E@[_L8EM8OA(GL+=IgW4)3;3(\AFZ1a37JXV)P,<8174X[SdC)P22fE67>FA2X<9
+_BA#_;^9=M?_T]<FI=&JA\&HU^^6-e&19X).FL+M>5]bg1.(g/+\:AaXcL5S^8;
I>N\7cSQ?+HMJYNI7g?1IE067\e;T2c(5FG-4BBI7=1D]MXQP=.ATKc/D?fB.f6)
=:>4)^PTVT716eUVV\2VM0.0c?d^6cSdcBM\:/YB5]bT[f>:[;dMf4eYV8?PRKOI
<:GJ/Y:)>\<f3;YV+8G)[TH;_J;:60cA]5cQ2TGRA@e[\b2??68ffS,VP62011W^
A(Oa,E,/eM<2YI6GfF.K)PBWW7AHD#5N1b7VP0](Y#D5R-1A[>O/VY7)SMB^?&C8
2;2&\,+VXIF&U]ee6S:<P:6,#SQ(Ka&F-G(_79_0-/48C427,ab(Z[28dZ:[Z82d
C5H@b7DQZ34&/:BMD?P3L:bd&6g?]-gcK0]CN8&+WM/)XUg874^b#R6e\B0U>K/J
VHH-F?F#\X)#\N8a8:NEWK;NCI<,51(&>PA\@gg?Pg^8VQ?5ME1_+T[e;M+cZObI
\5)T3#5AL=.JFK/4c.g>[EJd#>e0[M,\>U7REPW]&VJ_4Me7NE?4_;6^.UE[<e1X
/65Jc^VS7_VGMcKab0bKV(P;6YNM[EfgT1<D7LGe5\fGA8N49TBW,e=2YX(XQ)_.
ca7Y7O?=a+IZd_.MQC]Q[-<,<YFB.;QdLGgaU.@L\^RBY@;:G-aGVRc(H7VaFS?^
PW(Vc/[992:5a&MOaOGC:IY=U5+f2I.>EdFAEgOT8U1J\U92LJW5a_)Lb#b2V?WZ
C&DeA&d[YeTH]1:8/Ge#0bUE,aY@B\BgFbLZCT,J<>.E>0&]@d[0]cN3=4f]?#R&
CQ\S17]N,S&WU8EJ[.,+Q4LC+cd-Q1TZX(GG@U^2L_gL\f8a14\eL;HV@ED)O9S&
JZ(<,^PS@)@\5K4G5>PMQc\1@\;R1K^?VE)NgOI=(\:Z8H\RM=G9\V9_<?^9,A21
;Tgf9I_8EM=SLdZKN&2_eKS635GS=E@Y[ZMT_XQ(,-WG&Z68R>AB[NS.eRC?_CR[
a/EE21]7N>g[MNdEL=QL^f3.7I.>b0VBSJ[UKa4)MaO/75?,EK^^)OQT2EJaP.&(
b.8bM#T]9?(@W8DG>f.g11=T>2bF9ROFf/eE5\J]U6P1T<5dAabf>ND;B+_[aL2Z
NU,M)8DA6TdK?EJ8@(EN+1AJFYCa63M&M8QV7]\:[RRDP2gG(]eNJ@]:dYf7/:)7
ZYE\>)X:-N.9;5DWD,Q?<WIA:-#02>@#>ADGD,-K0./.KEORFbbPc(L_NcGONd=>
Mb_,1K7<]fe&2?N8CNAc;_W<\R.@^X26^+HC2REb?NdF:O7PCQ]WfMQ\,Q)TcDTL
S:_S1g>,+HOTTbL&_B1XU?=LRIBBT#61B_7W(S]9:BKHLRDGCEFPJ1J^Hc14edL<
(-IT?W;UJ4=>K57Q&dbR@gGDF#gGgC6Q9N7\/:E5;XHYa7Xg;WB>gP(S2>W79;KM
.V^)_W511HeBc#@28B4Y@X_:LQJ.g3&7Q4A[.:<MI=G6bR/&.UBdIQDbMY:+Od>W
P]N-UOb)Og.d=S0@+J.Lg@HF>dYLdfW>;aD@[5R]I4YI,KU7+aGIc^JAEUVF3A>b
E0e.D>b6P[9,GN7Qc;@d2+5G0H\3eT,]24Pc3Y>T88S9:Bd1G1BJ<9=FS?K;83U\
OT_RNM\;9CgaaMV2R&<K:0c(21YV7aYA+I[E9/W;\)=KGE?0P=R65-c_Nd<M,TUT
W#<_I<eag>N=_g#ZL.fR4N?NLP(Cg#C,1;CbfdH&f##N^+N)>-AJKIJ9TT8eVPOU
PQ,Sg8,O1O74eVM]=YS_DW)4Q)G-W5&cI7-69aWWg+[>?.\)KU2eeXEIXXV_D#H3
&91^L#9URB,;/O7e7?\^9@9.1\R/B^OTae:9g5-GS2\TL&32;7B<TO)VafF6dF,H
4AU1c6?M?GBG#RV)9S5V.>(FLb\>)\P++70CM#_VcQV4>U>NP7#DUZK<MD8O&_\?
\F1@cD?1fBY16@@Q+O,dY:431?JPGJ184XK/X^Kc&DagWG<)[=M-6d1/5SVQ?YCN
f4eO66DD2+S=Q=NZYP2<e,WOWLKIe;;Ab8></2BV>[)F4+8A&,(H2/PZGY0,g=@C
:9CPKT:@abEWfY1[a0>G6Ye1D/LRXDOFY)I#8?Zd42X8//fbUOZ[EG-+Tcb:RaT<
;[KOU/:L9D<@dYS7T^Ve8<2X[V05d93L;]0X2@/9#ea)2?T(G3S<+4<b.3EUU(@[
5#O1]gJ+>;T6.a@Acc:K(QdH3XU(K@Z#I9FVf<U4[bM+^4baD.^@<831&ABN._e(
<?<<+,4>:.U);IAcMI7cH9JBX-2(,e:U0g:TU6+=fDP>dH\Rg,Da;4T>FC/c=ER(
HF\+5L(cGARa4K-(.@C1CN^[Q0>1H9KGg/fCCf^5&MZOc=+:G<\4NEDLV;Y0c<6c
L5C[W#g;eQ=1f#d^P0\94GX#)?f>JUE2N1XBfV;9,e?.,+BRGL&+f8LcFYUI+:D:
bYMLY5:CedXXWc<CLFg?47ZKeL]-#CZIQL/BC,gX^:bVY(,RVGeRYWBKP)O9.+8a
V\1SGSbagUXE0Y>=If1+7)BC_&TL:XfO?C2.S=61c];0cR\GA796Z:UI#_Ide&Ae
d:GaFPc,&.H7+)URNS,Ya_(/b4T:J:\5R[->1Icb#@E8&)9Y^3+L6A[Z,/=6KNN,
;.KC2Ofe8&@.V31PCL)4V1N&I7Y0+g^XaQZ+5S@c0/Q2_g?NNT5C4R.QAa/aH)Bb
:#E088O-6Ub^56-\1GU\CK@=g^SB?;bH4Z(1<2.5X27[#60P3L(5;a1bO/TP8REN
X3&I4c&Of,IVY@-I=KgeC]3Q1<ROc9N>G<:6NaMGa.=@b/,dUDP]Ac1a2Kb]a&e0
?LK_YO+B4<\e#Q5ZP^0KC.a47d8(e;+^,XZN-fd7IPSe8e&MI[Z3N8TN9,ZMSECC
GM+.)N6,O1?5&ZI.8VY,U;KF;bLX:g?7eT0c+#)4a7\5N4K->Z4_f&F>4YR7KLK8
Q,AfQ\WTZ]^1DbRVXOLA#ER[HJd9^e6,=e2Q2Y0&U]+cB6:3Q1WM44Z)7aM:8WVc
]R^^&\geLU>:/+dCUWJCdREZC=03-ZONEF56K0bE&TO=SF(_g.BG)N<-OfCTK3:?
3Y_3?5cJfT+[EYOZ/Kd=<aQAOM.1F<&2?AfD/DANO=TR0D6BUSJ<7<AGF1EEa?f^
/FeJURDA-++3;7-TQCVC4L6K-Q6A^)MHbH<,?+O=dP;QQ+gLW8&#ffJJ.XM_UEK_
bV3^;Y6QS@;-M+P,5DEXBf0T-Q\CZa[9_83O52P_b5,3cHPBN:+G9?#]S039YUI=
dCdCXVP]+T.dG&ZBUEY9H=8KdaONa;Ca<@^P_WC]eWV08Y4Pb5191ICcM^1XZJg8
;,3I)-08;.bMZ&DHY<#PU=U/8e,JVGf#)9CNV>@-Q)=R6a52_86H[e[VA@N=A7/[
G=47:KUIAVSaZQ8@)fZ<ZOG5DPW@HGN,O#>1W;M3;TBF]^9W#^EL-+)dD+11HGR6
c/@TH[V^X(D.H6X?=(5b;6#HQ#_XN;\JZ5/^EF^6GC-[Y3GTa,\XZT&(J;X-FcCD
;_J8YUZ;0gXOO+,&f3BAS=bJ:b0)=Db<^\R::<#4V&d5E;Ld@)dXEV^Q+9_]NNDB
bc+CV2A^;8,U<;LY4],(AXCadL=JV&W)B;G=_N]#b<(-/P22GY=D#b4bLH8.P^W1
=g+CbT>FWc9PSec1;3M1^Od5=1H=fJ4X;U\)H7L?\Zeg2BE2ZJ;=]CTUJ)V[/R>f
Sb>).(SXZc(U&cdVT0TcXZZNP7F&PMge-GCfU0AP#[6J3:@.>KeN@gJWc+;]0?XY
,Hfg-5)\6aDbbU-,>SF)R:CF#4V8FIAL,=3WJYY6>A[MKN)-gP?)P>P^P-VQQYQ^
CT#9(?L&=<a.[_B.-&3YO,eF\[TF8W3ag_QZZ2M@@@XW]M(S^?8=#;W@>]:aQPMS
J9250&D&>E;JSN.1[;FSP3aH11?39ENQPR]QNVE)TEd&.1;]135RAbFfU>b3I_)c
BK_JES7\bM+@7N:06JL;Y24TaK4?+g.^;_013OL<?C)N\4#L1GW&_LbQY@(6KO5C
A-d5Bc_F[a=@Q]KLHFKJX1aN.@]-4PKKcKDC43)IU=&P3ES,OD?5GgZE>&>G;M+4
@<D?1#8?4U1[b^a)G(WW/?c>OWgPa,ae?#KdaJTfO6W=Z]XF3R?B1aeCZO=53>YD
U9Z_(3VY[8D(86A+]@-+]4,[A0_7T4R=cECg@:.&;8J<5+cNC^L+E#ZAe8EJUYOQ
Q8EB@(cH,/8]_9@:KAECP+YNVBVa;/ATgb?DW>KbOQY3eAO6@O#J<e.E[<VCZ&U2
@BYf1X^Q6(CeHYA+;NcF?1;DTMb:Q/84W<=6Re(A_DV&=+DZ<fDaCGM,QPS]+_X#
T(@(_US52@76JUK7\P-gH2XHR8WKEUgWe46>C7JZEG6D\\TPCdYKII3_..Y&MSG>
\GE>NbaJ2,SS<5MO[UY^8;=PK?>KaGTb7E:CDGDJ2\M3C^.0_#:/E.L::,KC^X/d
7VVE^gd3Gfbc;N.FD(1XIQ:HYg)JB?fSRS5.8Y;4JOJa4CN0DREf9IR-dABfIF:I
ecG@EOE6bd>BVSgH2D&[#F>SD.K]C,DF;>4RJgbYXZc.E87aR/R60LBH8:G[0-&U
Z?/d9M=+3dH=<EIWYffD8RDF<G6cG[<U5.]fM]cB=1@c5FaU.fT2?CfN+_Lg,OAb
RY4U6;>[N0XW,K.D4:=T>?I0;E05A)[UK(-,PMF?\7f?2>]g&VS\(fE1#ROb56eW
3S2.YO3HJN/\Q0C>^WZ_]=2BeM(V^c2-B9Q+XMMdUM8J7S02e7--&6F;>H6FG/Q3
RHd6L;A(H,J-UXPG&fE^?OAb.O_HAcE(/1YUX]@S<5b6XXSKG4f;F+SBAFa)JY/M
bF<?V3MAYM/#3A50N(W56a]M<H<W\0Q#6BF8,6)cD:K27U-SX/<f305\.[^H[FDV
eT3-a9I)P5X_D5E)VZXX+C(G.8]a0a+JcCB<e<0Pd#/;=4D9BBdfWZ<6/e(.bFa?
UH3.Z^X2EI)H8.TJfE2\I;#-@S(1=4ae+QI^=^NLM3(\?JAV&JUSZ8dd-g#)M&C=
VWLB]d@aUF]3)?L@(3GF7/?O4,UH(_gMZ12,A^Y#C[YD5QbUE_&95fJ,YF;);7HH
AcgH+V8M]2Y\eX__-;J;2CYdHQ+9/?04B]PMRV]C>5MV7-S(L9_dEQdc:ECW[cXg
/#>Eb?,J^HSEVd/4H_0T3VGLaH5_9O0RLCY6W;<DW7L?.,P1e-e&1N1<)0;]J\Qc
33,HU.N2eEc52E?X3;SB,c1G+9YNYEfG;Eg&]Y?355MJO0dCdT1X+-(2Z\#d5a(@
7CN@[:8(32\.#L5;e2CT5S6>_>V1[Ude_(X0Ac_=:E8I]9(TJ9HDM;2\21(gcgJ(
[&3R??=d<?JO[#0?=J=K7bW9A1:H8e.KR[.F\.S<Y+Sf_FGd&J7+)aac415=/SOb
08H2_5_FNcT0?_C.A>6Uf(>6VCLP0YUb5\g:@S024Z_:/.<-X\ag5MQbW=Y,5)81
aTV3<1abBa_+\J=JR9&c3d@4bRH]ITU3aB^NR;F\HD.I;<Lb4&b\\fL?72UR[&-]
B87KR4?,E>GB,PD?L3Y=N^6M\\L^:BSQUf+ZJ=PIY[BXa;FQa);[)3VX_@(Z@Z8O
;X\FSSW&NA^F.VBZ?VSN_T9)cRbVNcP+9)XfNR@>7[;E-dV\#<@Iba9<8eSYSa/K
9db>3gcV:>),@6)X[JKCJOT=#V111N&>V8I<+\)3E#/GO_X:/RS5G#CaH8U]OP9D
J3F5a[B/^O^@g&\1^fK6T?6+_/Ug9Z6\VX;CZUGaRHDb7<TQ[Z+\(:4+IO6c5QT=
M0.9:J#Yf]QX(3\Ke85AXEEFb.YUM=.3<2#Gc-TSD[5Bb1AUH)J?Pa]&a[g,ZU:a
c_<ECZf[;(VcJ[9CAC).1_eC0]eV?Gb&&N;UcYS&0TJW.J?].;?Je^PT^^;.0WXS
A81W7W>f,&IPcO^^\81=F<<WUf694&B\5XP6f.=4Wad5JT5.ZUfd^IJQZaTXWBSY
#]IOf[U,N)ZSTHWdZ;S?5_I8?=FfL\)O:EM7XF<T2A?M\-;VMO=)EIG,ABK4[IW,
SW6J395-A7850A[>[7YB0&@e>N&D15Q0CDVDRV,_O&c>9.=@2]@>JUMU4SEH(9a6
8VTWCJeFLd&G(VF7dV/^<:SAfgbdFe-Q0>Ga-]fBHQVa)d;TS7A&Jb8>GOfD+.#M
9WP0_>U\Zf?W1:gSK&ML36EXB[U)9A#VZ)]@MGTg(Xg1X3LWB1U:;L:9T5[582aT
:BUNK&#:3F?TR)WG^IdXH@G^?ADZL]9U9g\M.0Z<BJO&HEN_,G)?K3XRZY04[fN]
2dFT[FUD@JTd0aeB[#(R8S@>cY6A/-[(,+=8=\55dZ6;SXe?^5D,8aPa:X:TBKF(
R=B+e^A1KfQ7+bB1,)PF/CGWJ(>VA?;5^H0F54-,_P9,W0R8NJcZS:#\(CG=HY<)
0Seg[OML>g7Sg:+g2U1KPH\5Ad137?g4+AEc7F[5O\_>EZSRS9;E9CDdaD1c7?@.
ZfJRE@CUGe5UL5X(Eb@[9]Y;62-9AN+(QCPDEN/1A<GG&],X/G#2GS<g<SF@\BA8
Q&59F@LQAUA\DD2PJPM>AUT?-+P^QXc,8NdPN8L;;M3XUf4376;8aQGCafG>Kf8,
9G7UPT#[02S-S)8@A6;VHg\13<\IWRO&c1?7N34]^ZSZA+5TX6W;SbIAF8^R9LLB
&#HV(SPSN:bM.)VN\&fH3[X-UbMEDOWL&NgOG(ER7ZBF([V<8AI2c2Naf6,60I+B
YUJ>,f(1ML]cUW,].[[Ma51I/8+YU##R]3@?8gZ:W_]dgXDb[B;e)+@==@,P]+V5
AJe8gT@=H0Ma,3.@M6e13YLBHe/g3W.Va3?c0U=FG?a+DdO.L&J(IIOVG<Q;=:c4
,I7+(^g:EJecdP?K9Z-OaYC4,NVBDK3B0Y1_TcVS^2?GW/&AT5S]-11ZY<O+<H2e
/_QRT<>HD)K5@/,e(DENG?-PTO?EL;F<dg/\X.XcX>e(]TVY);ZDHB0\1PK=__fU
gZVP_U8;f1/dSA]P\R:D+Kd_N.E#_]9]e4S<R&W5f&GA]:OT#7N(GO3K)XK1D^KX
Hf)91EY7>Hf2(/dJ&@YOYB5A@-0ECW\H@cX[@Fd0V?L<YFMaN)M)OC3dKBM:g1Vg
g3#bKFJOGDNGL&VdB>;J_OgJD?T(XCcdM]6BA14)=c8e^gBX[XU+>_;\7D+<O6?[
9J\WTXg[;\d0M/bGHf+4V=T[)X=FJP+F3TC?BQ;F79Q]ISgG)H-]U/=e3ag/UgM_
CTJ3_ZC/S77f(e6JF.#W5(4ecbVRE&)4O28d,YZ2&aU9(#R4eVL(4U:?/);?WOaf
aPW6DPXYb4RJNOS830@Md+)C6I=764EQQS9U02HeZSA=eXBYF=@;;?TaB4R37^-f
K^#e?K9M5QN\<B5UcJI<ML;9f4^,(\_W5^LSI8I^&F4H95[<V5Kb180_24NEM]8c
bHc#MO(@eRI>E5Z>B6Ca#f8#:DgfZ8,VYGTE0C.13SN4fB)bQ5C67UBC?67>:M[0
,CGAegEX_?PU8Q-2a/:Z@>;PC-\b?M<adf=?AS/IC7d_#2eARYWNc4\JSdcME5+P
=:3G>C?U5KB0VDWIF<I96>^T8:.24RG?BD9RdEcXDVUf.&053X/PUUI)aGUV0II(
0\Mf)aYg[cB#P8fbO5ARXV5IBM-c._g3H65BX<.@@\Gc9F_S+]3&/P<<:8U;9IB1
e/g,^a9./D/abaDDL@LEG&Yg2aTZBK#3:SfXBC&g;=S,6W>6S/_E^edIWWbbT=f+
[-P:&67YY\K;.B84X_NAZ.NWNae&]^5caH(PL>Q_/Mgf65baH[R3(9/&:3PbTF/1
AV-aEX)Y41He0fU2QK)IPD>^8208#eB56TXf7\-b2<P(/?=>7P/BQ4]YJ<5;SVLd
-/(>>g5A<F0)=3G7ag6<e?T,:HDNK[/N#M9dSQaNUI7&EA5fS2GXK;C:,9E10JgX
CK[?,/_)d?0IANR:aeRCH-LZLc/.6&Vc^M]D(^/PM7ADF6.bN)+Y06X1\=_JN7+\
G-VT+HUF7P:;SQ:2&KXN7ROVXd&GCF##1K9eIM92/QEA^_bGT\^g:J1685>[XP\Y
0J5f<U=&eDTI-H-<KgNeTL5Y:D<1\PTZaS^(:A,A+H2aOJX&E/O\-(f(]RO48.[^
L8OK4(/@/Z/V4:_@)_^DT72J05^c6a0@THA18&W4+.W36dERb,.T-+UXJMDB?H8f
=^J)Y=g=-bD)RC;9aLe9A4ZZ\M\5_F8870CdNUVGaZJ:PV9DJ^cW4[fO60?4PbA^
LL#YHUB/=abBEc4E8:S]RFLAb(#<W)U8\f@YeJN35M\+8AG7Q7H:SHK8BS2M83+]
6H@5N@NWIO(-LFHe\5#)48-Uf2,B^4LP[;.9RTc]^b9C&Rf=6_RPL@8[T9X2e0^M
VR/ITY@Z[LYGD8RbOYKa4c/XVJ513\W4F9B8fXMP-P2Y[9_dSadC=D,Ca9/MZ_JM
MOJbH/7@=GX#IFTb&D6H,/>R6J4>=Tc3@7If;7TTLaZ(IUMO]Gc75B0HS27OY\JC
CJ-G<069DO8DD.4M@]5D2WgaQZ^g7Jc\),Ab\SFW_5@fTE&RU0A,E?=7+b@e\a55
R;[e.5]0UUGBaL-8HT^Q&Lf_gM;0>TLU&]&(53(NVM6C&3]Y^U4HCGgC7)FVUOZU
J3H<ddeR].7#4G-W9@];0XF[dCN9YDI3H^Kg3J7CR2TGYP8V5XA0L/],daHAJRU,
EH+1K5Q7bVXWZ4g.53R]UDGcbK7O?\/4f87^E[2g@\^4&[<,EM<-2M9DW5&gBLBD
XWGgNQ-G,:73UDG4eNM=:W[TKX595Z,EQM,.0cAN]OGL-Q@W8)CT>dUW8DT4IOaE
)SCDBBN\Xd?&CDZ\A68dacK:ZKY-AX1SO(^cbFSFKFYWPK6b5V3^RM(XLf=ST@,-
BJeUU-^NYE8.6@0G\LaK[7c]G>3\35,Y93)F95H87fc&+\G<9T\D=+UQe\X#DJe\
f+QeIWIZ#@IFLI++J5)G47b[YAf#J>\.[JOH^/E#O1L8.?e2S3/+O+TAC<HdA^GL
(;X,#g_KWBHfR<E&B(#361+@Jec;GPHV?8KJaOU;L+@8d=OA8A9+<fD>bGaSbX=L
ILIG]KB<VdJa.=UgeDa<=(5H=G1SQ^V[4,KSfFCd(d<#T5@Q6#.//ZKO?#(eJRXG
K[Q:?T]HGH@FL2B()QeR1NEE\1eI^L1gB=X3=TD4RQ@E;fXa0S&==c;Bd26][,?]
W?J38&_>SCWBP^3bF=\[G@ZM7c183XBE#O0LYgG=_4Nf4ab4O^M/B5U.+b/<MP7U
?BTb[VHSTSJ@a3_5(^FRW#1W8L@>0X+?e:bXg9OWeEdR1=Y=KdI:/SM:Q]WfLKcE
P+Sa&9Ab(FI>#]GV:I(_I,TedO8FJWc3CLUNS/L(?L-gQJO.R3U#O2PP.0]3eWeN
(Of;YO#GTK4\J0?,J:&DG-?aM^ZJP+e0HL2WO?<Z7KYVf2O(XgZI6g:AeV?SggcT
Ja/^FYLf^CD<+0e,L67EfRHFJFQDNQJc:)-O/6C88@dT0DC13H&#M9H2Hd=B7C^6
eSLfcLD?_@;UWVBQ>_QX2aO/6V2U.]4K,c9(RIUS-74I@1U/0dfP0BG<L=IP5DV5
NOSK+a,G)>B=RJX_&dYeeWGPOc)HOaJ<?9BbC&0)T,e<(V]V-&>^^NTI]UXN?YA<
NLcbWT6a4X-4>C)M-]HC+5H4@aQDL)290@g0a9?V/F1IfP_J&01]8JHS:?0R(HX6
#:3?C]BY0[,A#GaM/7K42c8R:OS_W2/+XQ?Fc&\6W:WNS0RY3Xe^YGNB^/EF37OL
YV,Q,R7DEORD3/6bI,CEP95+1-#.bI^f\e)b39_KedgF;ZNFc[,3f.WS=4-G7I)+
T[#]2eACe+<:=edgE^O/BA]B3D81)d/Vbb=D,J,a<ZW4>XX\&.bPD0?S_0ECR[A#
f_7>Y.HNa^ULbUOQ]TUf>?O:_QTH36))I^II#8)]#/?#W6/HBQV0\]-/^990Jc(:
R1./OBU^&I(c1>#4PNP&g^+d[g<(P;4<\(?JK7,]\3MSe+7UQ+2WNXJ73\f3=WPa
4FZP[ORC,EbeAfDeYC;G2f:K/==U6B-V1K:[?>Lf4W]8dIK;Pede/HG/@IA&;LAY
]PD6/2c)W>ZVZGNM5C?O]/Z?DQ,VD=f6]_&MF)d02&gFc[RKa+2@K48^E=-[Cd1K
Y1A@A7OHgMJ56d&4A5DR0]=/&\\@)?)J4cS9C.@C-H)6[MJXC/KJ<WbLC(Ce:>)2
7&>[cdG.<^9OD@MgH)+7I[b#K3eV3M,&L8C2P/YLg9Z0BF9V0]^4cL+e;35g&,c)
M0G/f:62BT&C#V+^e9\NY13L[I:1BVg=YNP+10[9-_X\):,MFE_4V#GQU5U2b]b9
Sb?E6.RU2#FO?CG0Z3^:0;312G><5G+3Y=/_:M/ef^H^aS,)d:f?QbSafN52=VAc
JI-+DQZf,+Y(L.GI-+S=5=.[C^45X&gV1?N,F_84VTS-_AT?0L/?W,:([M.A8fB:
gD[_0eHIKN&P99^M9^?H+JIe#74L7?I6@<^af^fH]ba[<WAc>MZV86/\AW0Z=/0<
JUc@-HP5E(_(A-(/I(Y6,N,E09(R+f#KBQJ333=<U<7MMPaR4DYbRQVa??4;Q4,Q
O2a6C^6GC-3^3CV(Lc:cT=egEA#D@?M^BE/L^eEf(44SdN-\<Xd?LP=-\f&;R9#A
+>&fUZ#>_:;ZLQOX.8:EVVG8Z-EY>e:\7XF6ZXEPJT[U.6UJUR,EH2M#3M(S^O8C
)W(@0X_HW<M?][GZZ,;)[8F3747\BS@KC6&1agFR9Jb&#_)8<=;6\.(H5eN/+9d^
fa?^EPV.0H9+^c7L>(c?-TC<g03YV=8A[SRL>12/WCCL)=FT#JcRTK)P#V(@Y<JI
5:;HBGcg?O(cFFZe,S&S_>Ide:0KV/U3S#>@G@KVT4G/15gAYZO]:G...B.4TF7b
DA5]+,_S#cV=HG?(:8B+MJVfbFIZ0Ua@eE=PF8RE-W?>=dEK52g8cILb.@D+I29T
#ST3b2K121O>DPVZ9VOK_^BM7-OF9U\L-ELfER,PW]F]M8Ng7:,I9dM4f^^##;TE
e]^A4/bV2LaXW4;Q\2>Xb5:7dMZXFZ/6#.e6@VHDNPJO\VO&?[/S)H&S=4b.C<AT
&B.KHeU8T::NZ(KD&g>?cV+ODKMgWJ#IO2_,U[08Ga&4efb7fLLNAM5JE4;(FHQ&
/d&ES9OH^DT>I4f17ce&1Jgf6@)1<]A<U(3.S9,Oc:_BbSZdTWa@6.1aK62cAR^2
7L_5Rb9^<V7>CbBcG0&U,I2@[MN@UP_L4>I2_VWR23M>efEYR[LgHC:Mg1XYETUF
fD&O7O5,^)9BgXb]5acW9@VcU=:TE6)7J?5:FE&BTWI37=)+c+&CW>/1:L(A^KOE
)1(/Z##_,)I2QSM)EBM5=]NU7BET]9Y=A]WPV=fT<168TaU=ANGBe_J0Ig)A2#JO
[^+M=c4Ea7ISf?3bDEPW6CWDH@3;FfI@V2@A8WSEO1Kc6[+TbbKFDT;fe)^I^eZe
UY)SZ7-WgcUQ=e=:OA[RgPK,>?c3.H/fC0cTc9[YVJXG6(],dK,MXD]Zc<T8F/.G
^USCPA6XC=?TTDQg<ZTbE]6Z@)L64WT-[&X/IF@M>Zg05WZ47HRW;?H:(CCMP\04
b^\\B&<9aSQgBeRPAc_\EZ2_DZXGR_a4:Z0)5_:\\GFFQA&MJ=X4^>#[W2+EQ[<?
21QV45=00:7D_;2De<EUDVf^EGPM3?1RUMQL6<K@Cf,8Rff5]-ZaEZ=RL0ICH_LM
HG7/PX4NXWgN).#FQYV7AWDW=P<JN.][ZbfLF>YWU3e_T(T0^\ZP>2N.8JeHBSc&
KTP->NGWXS3?_FbGKS#TOK85O_g@+DQAGZ&-IUKY5a7)c1UQTQLG>eJ)P1M1TQ15
Y8IIF.#=J[E9g)-HcR2@Z.g-0e_FQ/_3S^KG-2@#5SYI/<N&Vd/&]NXG?7P4U2I)
\.FXf./(1JGaJ;Q.6R_a+fL13\:H?6RC/58)(;K^)B/8_,ZL\I2H@XAX#WOO-RQ8
=+Ad&#1+SR6.fcHO@-SX66J=.D8WOfZ;.0X0/1_B0?ee&)2#Q>41&>J/]d.=MWc2
a9XS0V(OR;@edQ22f<,L:Y6SV@YV/UceV>1MV>8ad+-2CH=4M8J2e-ZVZe1JY4Z.
f4Xc,ZP3OJ/>M[:BJLOF=8[43CT:I67SMMC,g.+0eDGFN#.E+S2V-GbP-)]/<8bY
PRI7,Ke4C66&PN,>UcMX@HJb2ES1XH.Od#=SCXUT=?J2>SL^O1..MCV+N1GPNO\f
I8100UQHZc7QG-QDDcEWfV#B48WCEfRTQ#Ma5I2VJ0J@KPW\QdLK[27>@[CYI<O,
)2#TQ38Oa)_Ua>[dZcMfHR=5L]VdU\e=\<^;K#@8)X4E<UdC8/@G,28cK1#XWWF+
O4XHM/G.cOWR5#C#7R,H7c]1Z+JL.&fX37G9J1WJ481ZPb-aHY2Qf7.>S@5B1?X=
E@_e7C6#P1#5O&=#3aCV=-85EG<d@E&;&?L8Wc6a^a6+d[YNc^d_N,AGe[2[a21)
fKIg^59U(Pdb_R,FH>4Z]1fa)9BX19T#7(T@J2fd>46B>TJ(&-[X]NJ>)WHW=X)f
..GYH\Q[;:#/_M2+SH-B7PN2)NaNMO87&\#H:S;?bWV&c34.^+58S[_ePVIYM[=I
[9=QDFN1\H&7CRX8WPA2_a<\Zc[<KB_C>eeGN,U&8gHgeb(1GYfT-?4I[(>ZfaJY
&:CBL?^ORS&,b579f,^JS?EUHDZ.7X7:H]f()I+W,:O5f[a)W-f.9&KQL#59_&I/
eK_Ee:VQ2adZEWb2-C;923(,89WZ7d,a&@3,^Y6A0/B,X1X@8?R4VMZ:&eVe/^WT
J]6JS4/)<13K#DUS+5CBT<C5O]@PZX]c+D7)5QSf@C17cGTQ1LdSSMU;eOW0\WSd
0<-N?+1-C+eNR3(@bXH^:1[QD/5+/R9-GS?,-Wf3B1>3X>CC<EF5TS]B1>)CIQH>
Xg\PU]FaY1^B##JA)FZ8N/L3R;dEAV^K<6L]>+6<-;IOO:@?>ISUMA0>#8,<2FL)
0=@P+-J\T?\HDT9.,W)5EL<+//@W/S]\@]]_7Y<=8\C5KFYg+H+]_9+@,N[MJH#,
B+^_f:>6LD[OS7=B?dK56P-\XJe\[aU>e,EO1b)JW5Og&KP,MUQ;7^).G&03^U0G
BA==Pdd)-?(^6D.TNI)G1R,Hf85Qb8OX+QV,:?2T=F<XdO2Ve;>TG1R75fB;OI-d
N.[>A4AMfA2,]+ZUN502a#0F<;S;_();4bBKBSQ?7C7)aAG0:8=Ya3P_3CCAIJ)a
RTS[DANE#H2H/;Ec\V>W6)\:(<\\c@(N1A^RQeCDJN@)BW5GPfS2P^^EQ\IHBKKZ
cCaWAKed1U&Y67=7ad@4dc/SJJSJ<72S:Sf\Q4^(I69d<,IKfALU,,g@d4eb4F2J
+bFS.H:K3Y3SD?\AZ)=<8<GUL7ALIY#3[2S6[7=-N_.f<7LK>-(N[AI@[BaN(IVK
:+e8Y,5N5=b;1+UV+Z@#XMVELJD^Za8D[\;@[.[B/V^e;bG4AZMTP;J0ADCFF8f7
Ef1TBf]R&]C]b[dgWEP6>I6&33S;f&ec7g:c_E[A/J.eXW9Y6C:gEBX3f:+1/gPQ
=-)AEC@.c&;c9W/>KRZE3A-L7e9QHJ?/CEb4)aJ(PH@LfT;(UJ[MO^]FBA[B<4;:
#1FGELDH@e9^.\0/^YBQ)5\VeP._DM@cZV0e)+-LO:N:ET#<\3B9-N6\]UT/9c5-
5YVde:395,VGcI[f:R^F##b0#F(g[cL&3f8?8[UG3:.#OTKB)X1M3WUH[8S^PD4&
g)/@<FEQfKa^H7(85TU3S^E7ABX)U4X6D8_D6gTIKAH;<gDY?&bEPN2g><S:]O@C
MCZ9\9S],D@/\>SB1O2fD.DV8g=d<6JEMYdEb\efI\=daN0W?\4DT;_DO>QcIaUI
9;I=_:HMfd9AEL<,B=#9+S)0BC((:7Kf4K_G5/]]73NKb-S&9V-2J5O<3Eg->aV)
a_?RWHccfRJ/dL8,E:3#O5a8>,baKdSEN+Wf#-<4OdQD^d5<2+QVeWZeJ,:9fQ_,
bD6CcKTOHf=Vd6#F[GL4.M=(NTPaZ9^58>+GG.^UCUGLAfQYe5Q(f8:f#,V4?f:]
d(g]&<&,2O&;ZVbf3F]E8[G.8E3O;<K)87b49.TVLZYB\7bZ<5G3f4_F9a;U[=FX
^WWUL9ZJ:2+XO>7&8)V^/B9E#_;(NZ(+b6:OFb/X1I=O,,DR1C]/I0eM@LMR[RH=
S8;9I_;:Z1,JY@XSFCI[I,7L#gb:I;eDLOae.a.996g@F6P4RfZBKT6:60<G?2+N
KdGdGB8^I>=G&c5BGSQ;8\_8C#9c<OT)eCV_B/QA:B<,IVd=/KNXV(#_g3F<D2\c
7c,=<;#CQ\,#<1DFJI2Ye=.OHSRe7A:1FOWW1W75KA\LL,9.0GKCQI9<3M^:9XZ0
Pa6WI4+K1IHR:@M^2HZXa9Z<=aF50Y(ZKBLU0IHA/^O#82Ca>\6HAD\9NS2JS8_-
B7AR\?78+VaP+_B=A1Zfg>P5WCRbB5>Jb&LVfCI9ZK4g1=-CRd9?a8CPdDgYMHL_
AgEP66;;<[^O0FQXBNXa+I&g^F<V6C@1@_LgfSVDg5<I=/M]=XRCOOT27CH@2.XE
I=E;51TKYO4,cF/@0AZSeK9+=&?c,3ZK?K@PU6eYSFHB(_KgZ,,Qe[5e8[<b1MGH
dU/JWKX)gA\3f>RGEa1;(R:;T6#FLCQ-:::]J1c@DD/e)X2WFZ9J._+DC\9B@W)X
1\JCR2Wc9,\;,6\Yg1RXF2KYEOPgH+CdP/)Hf(fA7=W81-,KaX)5.eY0AT3#Q;W#
NA]VcJVTJ+39)(-]10SG#<_+6D?[ZU8.Ib2]a+1\?/CK(IS-<\g/])^;3B,K/--H
6R0/P0/8=.935WgN_?d+[;RK;-POX_#M8T;Y9\T2/:Z:UUO)7)_U7CVFS4/eN/][
fZW3M9,0&Ke_C1]2VR+V@7TA+(?2GNa^-H7Z&,T>+<\3=,R;H0M>Vg7+_8V.Rf-R
3L<b-M/95;]D;0a-K)<]7I]UZEe7\7G6A=5@HA+c25=)WQ7N\:N<BDY))D0]DI^E
<6e[?>]3f_<(XZa;04ALg#&P\Ig2(-,Qf6e;BIa[)DI&DKI\@d^/RV7(>ZYJ]@:O
SAA0Z7VX8?_-T55;</9e+;-c8G-J9UP8M4.?#>0g(b<e>EEFSf0AJR.YGfc_<(+_
?9F.3EE7?I[H4/G5:X=S5F.G8IYV05gT-M,7NK.(V.:Hfb_e#7,G[bKDf#EQ=/S(
3)8^L8@QM=)XR>Cd:Ub_74.KScRM0e.]6..CVIaN?-2Gf,OU[Ng=3B>V=;>S-T1Q
O2IGd;\P9P5@fMK?eEJ8JYAC1EQ0O,X>f#W8UEE@8b33033W&Pe6Y]gaGJ4TdK3,
8,4<a.D0P;Q&QL:V3J?R<Y+B\AX/d(@N6dDSgU4VZZQK90FfDI&>0-UW)QVX&C-Y
6+0T-(Zf^_EEXBFTSMdY?4XCU@D=_JF2,+F:TWV=>_FH7,^RVPD;gWeQJOGB#]Te
#;H2YT#Hc6UERDM=)<P<A41b@AdLA])A/a_OLW[dZL#EdcWT/]B&Ig\D/6QM5Y@_
K<&VUda6.a5]<9/S&&[e=N0PO4G@>>d#535]8NH6FcKaQGgO6LZRVacS#FRSXO2a
g^50Q4_RBa5VYD9#Ba0A(3DD-00A/D+>d.URaee&VBN_8K3-g<ECDb#K=R762e_J
E.U8F<NALLYLMGU1W#g/]30E@;c798<2,H_83BEg<<TeXIbc?AV>MADMSX7>+AZA
_4):&J\cdGQP4IU4<1fDX?X9VWX68dV.)Q&^U:fX-C[Y5]F=3F2b4gV,>US1&^[2
/6V4M/<=eVcaF&WI:c#=093OA1NAOT[.7[WYK2aKEDHcPa/OPE3Ha]U;NN-]g4BB
M4<[LI>\g^KC(>45,5S2F92;O?.2LOANZDB>:=g]G0XD@.4T0YXAJ?&>4E,-=.#+
HPTG-?bU(fSG,BM4(>;5XZ.8#2\9#E;WX-=04)g6-6KU;UKKgdU9UcC#;/_ZW[BA
gf7Qcd9I5;I=WKa[LYWfS\X#LUY/d^JCVKL\BZ/O9UJ-\5#:AE:9VYMC=?O:>AgO
48<1Z,5G^O5<@U>2I+:,R8O5e+6CD@<R]KG?f918Q#dU?+a<T-2B.83U0XEeZN(T
^bI3OLW83_VN?#M;>U),;0I1>XT\\YE]I/F\EFVTCfCAB@6eYUYAN[P_CYOTZ(NW
C9TSJH,88VM26/2M;dAV#KGQVf&:A)FM@^5<D\<XO>#aBSL-E(528bDb=g;Y8#(V
PbSB#+SL2/fQPOH<;c.&AbT.ZOaY.;?C?ZX,FeQ,2N5[A_4/.4L0Zeb=T30@RT^]
U\8^=fEN49;E81L#^aY^#CYA)=6Nd2\:a9..D&>e3B^HEF,4G3T.>\L-\L=99-,P
E9Nf^4IGLTIKY?c(c,A/W<5a,7YLg>Y](@7-d)(&^1<]dK5&BE](G_;MJ-Y^4<4[
HEId9NN5^<&/C\B^^+ZBOHP8U-2I,7B,_YZKa#W)H4OEX+SB61<;W/7g0SK-RcBa
cBLg,f4>>a5GP0WCH>SRT>_/d)F5XdH(T6EV^[,fTF75;8.?X0=-^e)g0GSA@4K@
DD8NJGfbMM6BVPNI6YYBPc]C:Zee+W>Zf^9P2bX@ZO#5.@X\7M&.dCE8+=bN)P5B
cU&Yea6(I<&X5L1\@E)M-H?H&9K#=0d9I&edMX\GW0F3EK9X&bQAbGR^-&<]H6@P
9J_#1c\&E72E22@Y01SYG,@8g(/cOFd4cB6\ET+Sc<0,U=\HQES4g9;UGIO_[OUD
:LEST1(-X@^/&N#N]Td6.&?[Ig7,_g4C@QU)\&IK2+,<]afe=9L<W=c7G6+W6Ve,
9acgfg>.Z:(4]cX6EH[=B4H3C68a#FP))TP-aGMPc]8[<,)+b+_HbD\6Y_bMP.P:
I:1CASc-BXQb1QS,G+<XRdQKBUQ/d6E;BBSYD;c=YU4bW,QHFTV&OZg0-5CH,OeC
FA8DF6W<Ef=TDYS9bBe[K2@VV:0(WNI(,R.<c,KX2+c(3P=]&@+@O6:9(-gaU0\1
UR114/Q46LQ<,\e>Q:S/<15WO&_\d,[R#N36QEG^c-\;>71.,H(P+8?1PUNaKNMb
724U@6:cd@#M^=P+QS6Z,/Q&H3EDP]P.;[K=WASAG]D60UE^>6X,,7&=^?_^LEH;
U1P:R+^\F.&c+)^(W+cMU^dd2PF._<4gd2c^66536L>G+W^1f0+X]QB5=]7a0Q5+
:Ic,accV2A=,_;SJUC6E[GR/G8Y]?VcHEI0KW#-Y/X6U,)4Af7376CeSG,7A/5Q\
V1]8)@=KYY-UJecBe@^:C91UCEUb;5Na,4O6)DGNLOO;SIHFH[)H/7eBN2OH#MgO
-&f&K-KEO.-GO70V9C::-2DMXUHW[Hde2Vg:JXTI9dLQI;6\5RQD/Z:./^;5V5fJ
RZ-aT9MMIOCdV4c=3(E]H8X2XQELO@3aK3OKIH5,:<XP-7>TNa&CMH@KQF86)6dY
G<g4c5<E7J0Q[DY:cWYTI41@@9JH#>W003WV?(5?WBHJPQYcA^.&/9?S_;ObNT/C
d_IAYI9X^F^&(LJ<WI:VBVC76@2765[,F)KO-ZOU[3;@YXP#bDPF7TAU=aR<SfOb
#KU#.4&C^;M.Y-8J+2Jd<M3-BSNMQ7;f8/0b/LEV6INX^(c=#CST:8=.TTVd#\5^
<9BggLfHTdPA\0bW7B8DEN=Qc)+BC2QdK_CHGI<-E-B6ZX]e87YF6UFc[47d,N27
I<gOSB79TV[N(d[ea^5N<ALS+ST+AA@3][I[VAV]H=I7PLRD<:GCV_PKHQ.a9FAD
N6cgPLBF(Q6HO5g-V?3/V@g8,@HY(XQ+<W8JR&Sg2?,PWIK&#Og:+K>0QS#PVc^f
W^/R+e<3MB9P(^cDMQ-1,4C.Q)dBNX,4b\eFf?@?RR[AB8bL,^[I#O3<F.F3PLgR
RYH-eSHC48T__A)B[bN?BA7cCCAD[=f/C2.)0UeTAD]4]A<@:cKZ2KJ6X+G?(fcZ
3]TDU\)(N22Z8?SQF1@[gf)bP^[HWd2b0Dg#JEOK9B#UD1,FU\PM[[-R5)0_9ge-
2)&7S#U[]W/)=2_NK)])d)-S,P8A=CF3@A&U0M,g;Q3:V>0)V>(eI4L046V>PUS/
^N=VUgVP1G\YA<U&eEcHfG:eFS:?A[6U5Y5e,+Zd-T)/(W#-/_ZCb+9O\YS7a>K#
\]/;L);G(62A[R)(+:dUO[T&PTQ>9bc.8;[)50[0fZW_OLRV8/DVN2d]?QFRU9ZL
<(W#;]2_7A=Z]S1g)S3]ISZ1NE0(g>A5Q1-8CZJ_0T2?ZAJK0,^),?@JGI0?A:-c
Na[<(S,>=_cd\P4LgUEY^H>ZK-Le[45.8]V&AG0a]&^>HXGM1Fg,8+MR57Ue^71:
bSQ_,30_6affQTfC],9R#;_JJgHfbRH4fHaCa3X:V:7YU=)2#OA5N[(^5=fdL:T=
ca16U381-ZWB;D?(2cTWBOL7:HE-QG:NU]B\9MP?KMW+[E0W:_SWAR(D2E:+2?:R
EZ6c99)BX_6]JJc+&W+UcGZE_@(/A<Y6I7V[Q[Q[]Na^M=>TNHF8/V()bDT)+;J)
_Eb\<_1dZ87)-9DfD[]TZ4>W=@c;#Y;<;\)/D_?adF;]NBT+JReS/IP^gOe^g8Ec
f_[FS0-7AN[+f__LDQ@.O-N=S;_G2Q9GR4C:^1QE_8efV2=a)a2T;\VdEG/=.W+]
BWOZKX>[IGO^A/\6>eBBf_c/I^Z^Qf<&;YX7F^CA;A+Pd<f_6=3DA16WF+3+LOU:
@M5c4g9B,S@&C\[VgZDEVgaJJ?J_:OTg>1I>&bA-R#cXHGNPfKAJA(I@]Y-P<-Ga
/X#L7ST;7;=O[ZGI/_9gDC+JdY#DKM2P,TU?CFG&(I?W<ZgSRM5&E-^9M8gC;GUP
?A.,48CGEN(cDGXNaaV@:W_^da-fX11]^a<]Q8Rdd=ZAIDA-=Yd0O/8M1dbFZ6Fg
\gC(10:,AIfZNQAW,;]79);NXb;1aY@8BSd(_dPg,:2W]>U2X8AYD^ATHAB(52Rb
c/31Me3dJa2MCagEGI=>[80a0<eHV#/DMOBY+<?^LgE1fG[GL(\PA@T(ZIO1=&\@
I01b>3Q2O@_P[=fB\D^fVT5-)R]<Sg?&D-UQ^D4\f4/L7U:FN_[a]H,Z,9M</<M=
J[-c<DeWW?HO[BXZO/886S8:)]9DXd##F)g94#NEHb;B)O-B+eHQ3dYXUK+Z709T
:L>He/-E+.@,O5TQaUEH(?<_NO&<7O&.=;A>c6_H\(PK^QG(QD\]8fWLU3Yf.#_>
UTFXFg;BdR/c.>9@+JAHd2-aKAM<PR[W1fW9@C-WaA/^=T7WN^2)Q\VW35c0=@;/
AD5F3c<e&J:&8#.^)M[cN56NG-cOGP.8R3;OHM(ISGf&<E]d7.)BAY8-W9Y^W<^#
>Zg(&+TZ_\RGdeVO&dQ=GOdFcQH92_F]CZZdc>2Q.W:fMe:_d#6fJbGO\VT(FfA7
?T>]/PfgXFCT1VN.DD11>YRD8Tb=).BF[Q#(=&=/c8-W:I:&&d>3b,_69O;eYW?&
b2&]JbEOP:AI0QP:Z]gH#8^C_FZKe/bgW<DV+2,D9?eTMO_TD;K,(a2MFf/YV=eG
<2:#Q)]U[-WQOID;fE:WK\J7)5<3V<7(MMNY+1(E4/GMB=EOGf2Ke0B<cMG-gR&f
-KS0S\K>5dIE3EC5-:1ZN\7[X.#gOVeMZb4+C2BK.d__^C240L[,&&X88Rg:2XB)
Mf&bNQ]2e:RUR;5.0OEMHfV?#c+T0I:f@_8I4UB<&ZT&2VaMU?.5ZL1P?T/7,TZJ
+>_3UI9I><-D/](:E9<SPZK<56GK_&-43-ccU:)g(38&Z/.O9Y8+JKH87IWa5Va.
#]BE12R<WO.<#WOS=fc61,S5?a]7))5J_^:_VQ/8Y/\YeMLd&<T[WN:O4:M4?.)=
3b,-XHYcQ5QX[a;YdD\GM798^C<1RYfO4R)7R8(DZg:^DCaO4[R&?21F:@g>#\O+
T2>&UH\I6EWNf>;^>;b1f2,#?_?IL9@g]fXBH+:C<N>4[+c0_FOKB?Rg/[I#IP@G
97e]0A_Y[==;-VSGQQ(SW@@]+=>V&QUCFE+5d(3521K7U#VcLD?GfICX\9Q=N8(a
63\N&,\K2SUaa/;;D0MENV8dUedY6f&Y_3)S?#OA2N5&a-DVe:Ne@RU)CP99Q==@
6<fK6T@fBB+88N<2HEI7ZQ3@24^]@B6<T^CYE#XgI/YUKgKFdGa,C^<OY<#V[RaV
Qe6/^2&_/:C]JgaJMdVc>EIP=T(9>#19NV+(eNS_4,SfbY9I7Xe-0b4>2:geMd-J
98KU_W\LM8==cH-MSdIL]3E\fN]Rf4cGE5>0JBPR)KfG8?Nd\D3O9-?gbdg/+Wb@
=#_EHg0JER)Y_^c5gPP.&/dY[dL4LTDUP+0\=V\5@b9YY;a?1PH,-4@3f4X@d:0g
CVLe6?2P4+[O;FQ]TW[97&ZS64dZ/LBS=8NO,3=S>^;\O[=93CCeY0Bc?Q:aE6G/
S-;I:>b,4,F&8:;/g::4e2M->Y&PG9g7PJ?7Q2#7A[a1?XQ7gaD@-+=./HZ7.DX#
2)_GG;@E\Q3A\8\L8TM&;cWESb6RNXY&&SQRdgcOa3C1E$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_APMEMORY_TOP_REGISTER_SV

