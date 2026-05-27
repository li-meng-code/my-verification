
`ifndef GUARD_SVT_SPI_FLASH_CYPRESS_TOP_REGISTER_SV
`define GUARD_SVT_SPI_FLASH_CYPRESS_TOP_REGISTER_SV 
// =============================================================================
/**
 *  This is the SPI VIP Cypress top register class.
 */
class svt_spi_flash_cypress_top_register extends svt_status;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** SPI Status Register. */

  /** Used for enabling the function of Write Protect Pin (W#).*/
  bit write_protect_enable = 1'b1;

  /**  
   * Defines memory to be software protected against PROGRAM or ERASE operations. When one or <br/>
   * more block protect bits is set to 1, a designated memory <br/>
   * area is protected from PROGRAM and ERASE operations.
   */
  bit [2:0] block_protect = 2'b0;

  /**  
   * Write Enable Latch indicates if the device is Write Enabled. <br/> 
   * This bit defaults to ‘0’ (disabled) on power-up. <br/>
   * 1 : Write Enabled   <br/>
   * 0 : Write Disabled
   */
  bit write_enable_latch = 1'b0;

  /**  
   * Indicates the ready status of device to perform a memory access. <br/>
   * This bit is set to ‘1’ by the device while a STORE or Software RECALL cycle is in progress.
   */
  bit ready_n = 1'b0;  

  /** 
   * This field stores the value of Status/Configuration Register to non volatile memory after
   * Store/Autostore Operation. 
   */
  bit [7:0] store_status_register;
  bit [7:0] store_configuration_register;
  bit store_autostore_enable = 1'b1;
  bit [7:0] store_serial_number_register[];

  /** This field Locks the Serial Number */
  bit serial_number_lock = 1'b0;

  /**  
   * Determines whether the protected memory area defined by the block protect <br/>
   * bits starts from the top or bottom of the memory array. <br/>
   * 1 : Block Protection starts at Bottom   <br/>
   * 0 : Block Protection starts at Top   
   */
  bit top_bottom_protection = 1'b1;

  /** 
   * Configures the device into QUAD IO operation. <br/> 
   * 1 : Quad IO Selected   <br/>
   * 0 : Extended or Dual IO Selected
   */
  bit quad_enable = 1'b0;
  
  /** Flag that indicates that if Autostore Feature is enabled in SPI Flash. */
  bit autostore_enable = 1'b1;
 
  /** SPI Serial Number Register. */
  /**
   * Stores the 64 bits of Serial Number Register(SNR). <br/>
   * Index 0 represents 63:56 bits of SNR. <br/>
   * Index 1 represents 65:48 bits of SNR. <br/>
   * ...
   * Index 7 represents 7:0 bits of SNR.
   */
  bit [7:0] serial_number_register[];

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
  `svt_vmm_data_new(svt_spi_flash_cypress_top_register)
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
  extern function new(string name = "svt_spi_flash_cypress_top_register");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_flash_cypress_top_register)
  `svt_data_member_end(svt_spi_flash_cypress_top_register)
  
  // ---------------------------------------------------------------------------
  /** This method sets the configuration handle */ 
  extern virtual function void set_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns the name of this class, or a class derived from this class.
   */
  extern virtual function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_flash_cypress_top_register.
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
  `vmm_typename(svt_spi_flash_cypress_top_register)
  `vmm_class_factory(svt_spi_flash_cypress_top_register)
`endif

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Status Register */
  extern virtual function bit [7:0] get_cypress_status_register();

  // ---------------------------------------------------------------------------
  /** This method returns the value to current Configuration Register */
  extern virtual function bit [7:0] get_cypress_configuration_register();

  // ---------------------------------------------------------------------------
  /** This method re-stores the value of Stored Status Register upon RECALL */
  extern virtual function void recall_cypress_status_register();

  // ---------------------------------------------------------------------------
  /** This method retrieves the value of a single named property of a data class */
  extern virtual function bit [7:0] get_reg_field(string prop_name_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of a single named property of a data class */
  extern virtual function void set_reg_field(string prop_name_field, bit[31:0] prop_value_field);

  // ---------------------------------------------------------------------------
  /** This method sets the value of current Status Register */
  extern virtual function void set_cypress_status_register( bit [7:0] reg_val);

  // ---------------------------------------------------------------------------
  /** This method stores the current Status Register on STORE/Autostore */
  extern virtual function void store_cypress_status_register();
endclass

// =============================================================================

`protected
dMJE\EdPKYb(H&Q?L3L1DfUTAff>7][K72T2Gd[NE3(W?[FUe=0W2)(f2S2IJZ17
@BeFV&B.D-@7.7^<[WF^FL=3c2bO+Y9WZ+:IVT)g<JfT63?B-OfI4cM97L=ObBbM
_F5g>4G-#[7\NR\_N-P.B)aB.fU7g;M\/\;UT9A5R,2)_R]eL2_M>3&BK2XZ2H]P
[\)<>&e?(BgVQ7S=M7TCYQ.9/<&fT,da-,J9.3E\.AAXJ3WYGG,#AIDYVTK0+^d?
5:8CPP+;4D&S82,a#fVN>&PY/cT[dLHUR[@\L>cL-RdWgH2UD/2MZP(00XR@6O[^
JEAG?2UaB8_f1g@G#c#JPe#Kg^^1??^?611_@68W(EDeN+T)^+4J-TZ5+7.e5G3M
a;[\bHO[#OgV0AdK2UE94&;1c\/+Q7U(<TBN9]Sc?.&5O3,;geUcG3&-d=NC5dga
-49EgC7K4>Q#CN7cU1XG;dSV9VE:1(_=I6^3J]WO71DI8;b9W@>]70T[EN[JL_->
<M43ZT49YRRZ-KT#@CW[gK[7g6)JQcb5F90Y2,7Z;[TUbX=6,SMOSa[QecgfU@b@
05.)MgV6+0525QGcDCL);D:L?_F<f,]4<OF4CREG>;?&.cH?WSEg?A4YR5?0Q=]-
,-E.cS2abA\baVV+F_4g9a>DGDI]a/>O/_N^dR<@^D[::WfKeLQT/A4YL$
`endprotected

   
//vcs_vip_protect
`protected
U<<JG#G_LS<T:JgF812Z=YLcIDaa5Z4aDX^,29P34GZM,I.93=X@1(Y4]Za=6LQa
WYU_;6[,/.<c+bHAP8;3:+=-DWeE3HB+7H&8a\_BVC#JPV4PZ:,VCgZJ+RF+Bf:Y
\U3A?MR&U5QZ\=f;J^Jf\PNgYXIIVL.aTTJ+-RY+=90gW53.OX#c>V#SDd9F02R#
+4aQIbWV6B>5a987LXP(/;6/,752D\SG::E99R;98=<=G[X3bEYe:aMbR2=-.U:I
?AX.R9D9HXQ5KdEMI@[4-bV3IJOH>49WecI1#YbTF54b+MOa(6]W#V(\6M(Y&XZW
I5C/DeM-;MOEB42+[RQYY]Z5;Sg#FeS,NGM;(IK9;0Ma@XL0XQ-3[cJQGgFGS),.
@Efg>;\FCe;9]FA=]O3?I;<,^QI##f>MTIMY?4:W88Z?5D)PE?51#K>I#ZV0H=1U
9R)IUM&#=-P:b,9c[.&dcE1S81SWD?6)G66GZ1/:91I)EHAA]MSE7^M/)EGeXgF[
UL7E2CXG,>?VN#cHS96_H)I,O\0LW(gO/X-@-=RDae)0+Qb4ZC0:a,Ccc9Z,)63\
D_SR^1G8Qgf1YBPeQ-^UB2cL?S1[=d6X682EUZYMJ8<.434&7^.Hc2?]e-/39_ZS
gBGcU:<3b27=2&.SL=03?9fO(GL#D<WP4R34gfc1/18+_K.[U[3VU-X#ge8:GLKS
0e.UH[CV&DY:17<O=8\U,3?FE&UN&PZ+.]UI.TfK4J9741^&+b2-_92be)ZGd+:D
&@fC<_E]EN:c9C>DS3YRdU:]8D4?XYg2V;A>0FU#JE2SB24_8Z#?2?\/[e7B_)0X
-5LGSSdW2b;bQ/e.>BcYPP/UXCY/4IZH(CP(3A3Ra.:#cWb95FE@IO53Y1TWZaI3
LD\9<Sa#M#BHBN>FEMJT++F?=I-e@:Pf.<70-fL85gZDT>Z;DGKNGdI=/LK_cDI?
M#WN#4LKO=dNBWbQX)_6W@CMN7EDdHWZB@HKQG1C+;R.3[Q,/Vg)PZCLCL41:?HK
?DHXXbX-gQMVTe7PL_&E,F[#_,JG..[4d+(gC_;KET>aMc)TO@NKPY,5>6[Hd=B8
bY2Y>,VR[a[F(PYcKAMCPLJ-KJd=#@6Y?=>(841Y]<N9IRLM?>5TDXKL=_ALfM4J
RNNZBJLdT[UL^JNgfF[#7:bWX[5.WNag;:+2.:FCZc@:g+KU#R4G0Q:CPC_EP=Bb
]3NJX)/@#B5Fa#8U9VaKMXYO9KA4_Mc]51OX5WU?e=68N9PV@YRZ>9?O<:a?9.,@
MV/A4T,\ec]VMce?B<^0Y0CTNN[.E-:Wc_HUD.(,,6gO,P65)gDbd(eb5O;O#A-J
L>J>:)Qd+IgIQUL.)5+<>X@SWNBBO94aGMLF=B:O-;J;f=804C0BNCEDJ@ecW[V0
\=9e;)LK_@3F=eJ@3c+>R>3)517f0bGAeDcMgD3EY9;g5\O<G\)U#I8f@c2T_=>\
)XO@fQ-HU_PB(3-5b-OTSOgO(>fM.VYf?0</#L5P_U4CKgCDAQP34.gF7QI0df_Q
L7?G7(,RJT_EHAb#>L2[Kg@K9CJ\/cKOR/a_4Bc-;_0<H7#70gE_I.fO=K+,:@ZS
g)EZVV5ad?//OYBCN,9^EO/\M^7][KAF&4Qf>gY-UNa3QR7R]Z7.R[f+Q[Lcc>_#
(5ZQN:Uead+-E4Z3c[I+L;E-)fNXM(M&IP@E]9b#Cb^bV7.S)QK==L6VdQ^U)eOQ
/FM#<L1R?-[^6;2\XOAZGQ3dF7f0C>AG2X>4ANaF#Tag(KF3QAT^L@ZC=UcA1?E9
UPc<a[Za89JNP,2JG\@I;+-aQ4fMgYXcgV6#4@6<PU;SPZ\-AH3EJ-Y_@D5?39@8
.G6U)U<16CfgF;0B;2F5DU\:.3<2/f^2)@ARDPMCEK[Qe+d3P86\dXWB72HZM7IJ
U,JH-9U0T>#1dPSfHW5)&6e(28D3WFH3_=:a3U:Z04__QJG2.fRV/fE#<?fW,NY=
FG#aJWXU?:b49&fD]C4@N6T4-c:gR<Q;E\N>/Fc@-dE(Q,DM^Pd;H/<,K1R&c+<5
9GQQg&ZS>43W\EB+-M^7SZfcP@Gf4cEG96b,8(VZH>BMU9XE=2+a=B0Z#GX0U2/g
D/dM<NRK?W4@JNZF-,=;KcEN?ZL<#6.YT5YT<<1U&.6=f1RSC.)5H#K]V[@7I9#<
V5-TP;Q.0_:?89f\DT@AOI:OH+KQN(cBU3Ic/R,^MLN@^K2GJ:+:A]MVR#9a9BK)
8\K-1c\T8@6P3Z<_LZRDfVC:#DM#b6Q)bPQEd5_C=OSf2a7Y=2gF+;DT_,]>EG;e
dP3:Z7387X0DWTg:G.d;PEg<G??eO3T6LRBG8bBaLMEH;XcHM.^<gW9a2eT?=b3H
S0(7TJ3C-,aIJRAOBQ;9,3V9XQg#HM8faA.d;J1a0K?X#Ud0[7Tg[G6M4V80a=58
N75MTYD=/S/)8]Q)W6#:7\Y_.-G7LYcO+6DGHa/,N;<.eYKC(E8c>4)#6[8AXecC
)T/;+LdOYLc>X1dc.gZZUgEM6HC.CARO^Pd65GQ\A_)0(?XN8#4PS7>S:5_Pe(@2
#&BS)L,GWE,a8S8VVed6:1c)_3^D_::;e7eY8J#RDg8F-<d.fg;)-L^Og&aCBg9F
]YB=7LBa&QQ^JM3\9S)#7bLeB2^:53R^W,=Ya3&5\S5=0d)RUgSMYEO]2N2/I9V:
XcJXSL&+G_a<KJT5:IEQ3VTL:Vb>4V>T7aQ]:Q13ZgY;_&XC:ZJg/T-I6WZ&cZXH
.-16fcb@B8J1bDST8fg]QYKQX_4=LEEa^<PDHHNWN2H;7Q?:-G3RYEO#C_6a0eEJ
H@_RP7.UH&c&?PD#^ZS^,/-Z.QFL(IHYP([X>5CQ[@YUe56AW>Q+&H+ZODJ9-2\3
.&;feJQX5/41L#DP7ST+?C1J[_[U19.IE&#SZa/f\[WDd4P+I#RM&4G9;2:2Y5H2
\bWC&L9L>BYUYaV2MPSc506L:QQKV6^aB+(/NI/)PY22.7H4+B/15B@VN9+E7YGR
?=a1=:86CcgO:O#=0F-5@+Z0@?TO]V7GCT./&)O<J:LN?fU;eUEV40L@;[XU&3D?
>NY>I7P]]fJg,GMP\Db9DPF0A#@K9O,@S+\B7+MdQI4.2FD&gJ2.LB7O:74JL?4L
(>cB3F3:]-:CW9T[f:ZO]P<?CDd)-7\ITaP.[:FJQ-MM+V_Q_-X,M6^5VHY;AH4,
BfN0=5Q>)^K(PC9M4M5&M:e>8Y+0+bR8Y.R:;](8RZ8bD3DH((_eZXS?0;_;..TB
/3X3=g_</SJ6I1[R=:>P<YULT4J=TUJ4<ZT8fGL.L2]-(Yb;QeZGG)cT9c0&X90K
N][N<.b?R<J6S7PAf)a^d>XdFK6a;:K3;7P(O+6/__93)T^=#AC,?Y]-OFgDLA&7
(2#-O9J+.(54.G9aA3g(<)E-X?\aJbKd8Ze4(W@CeDCGGTH8:JKWXd=(IG@=ZY)0
9?[\0_DTVLCY>P&PTFMYI9386B/KUOI;2TWKDMOEZ=aVIPS5,Rb5POP=ZN?-3+RF
U?F^R1OS1(U^.dT5Y2X=/gJP#)DZT&g@Ga]9?RO/I2,0K8]FKT>\R@E-Z@]a,>TK
:.D3^MT+7Y\ZS-ZCE_0.PP#T/TGP^,NXO;DTJN95SRUOXAGaD:gS;KX9dK\Y9;S:
#>M2GZ?LT6F9VL[#d0W(]T90U:;HR+_)YPD53eNT[5]M)F7ZJBY2,V>]01LFd(UN
I(--P_KBQAFCKQd9B3fACIF^c?[R8=#(@9IW]5cR_I\DW0SSdA9;0N=)aL;baPX&
edRZU(_YWJB9c-.08_=YPI?MdJO+:b\b7UbCfHG5c9dYA&2Ad-X+]15AX8T&5X\@
V\)e\]RaBP2X?CK0gH_d^6J#FQS9-L49bO+dYLM:SIX@<@0P)&f-@:=CRTT._HQ=
DTT\3^OW9dEA@W,27&C<07P.H_T;_V;H91CAQR],f])S8]K6F0HT1B+Q2DM-.bEL
;#GdZgM0If,:gf;BMQ]O337(^Rb@L/NgHd.F[K7-dLTR^9[Rg7+:AfHMf&DP\0;J
DgaF..B3b_@>[XHPdfYPfO2>]7X,W)3SS9K.ZPPf#T^N?<f6Ub<IUFB])G9-e.;d
:.T64[F;(N0cgW;)LC\E;GU-MQEg\GU4DE#N/J=EPI2A,Z;RJ))00K9E+AQF:+ZC
SY.3THc65ND/A<9U?+-P?d:MP3=3\TM4\AP?+))Z@-5TT84E@HQF4U/Wc0GM^KH.
_gX2V>=fff+1RMCWNVVD/a^FEd+/<WWLWA(>)USL1X_;7H>BO.=fY96Q/gZZ#M9f
KMR&:V/DQY=PXSV04aW<6SRS9X<GO#&P\EH6cC[@>L.4=VW6L4D_80/O=E8/DW>2
YaL8UYCUc1S2B3SL9\g]SDWA;(6<7bJ(RcJ]6(AI=J):-\\_Ae2d,4G-6A-169/)
G>]X,I\fJ(.Q)H_X:C4.K2[T\+gfG2Y;F/U/\FIO9S36aQRc+#VI6>RQ<@.bf>c_
##ae;RLbB:4@S(YPM^._T)</c_9/VYa/cUHB<U[IAH8FaU4P#7?KPbK6d]RT6O+5
12Z0SFX\;,UQ>/_94RK@.,LI32V6F@IUW+JGbFZ4,+XKLN^FU_@O@CN-ZCIHC?:H
>-VdNA_DC(?[,Z[/Z]d]Q;cF@LL-@?A[H7\D9e>I+N,K^,2EXYeT&CfUZ9+f87[0
]Ge@0FLQVb=L+>;YEK-bI]T1T)9?FBc-.V>RGHaBOU;F06WW3\>g3RD^OYc^\-\L
1&/6BXe7-TK<AE(-WM0PP\4:(E(>_+5[UXa^R=,^/1C<C;9R;f7M9a5,STRcCS,?
AB+2F0UNdDWGP@TG.J:gOg-R39Q?X7I+,V_8[DIC=DX?^95f;BE8,#H[Z<6^HZ0)
DTcWJ:.1A:AAO]S5Vg&;5g.CdfZAZ&K2D@R:#8)[78_T<fP=I?Y5g@SV9L&KOaBe
,.<\UJ#>RG-_Q-#3Q1//IaCP(6Z\,&E/6g93[EMN699Mbd)CTe.WFJ9;E[D\JS)b
8M6R;c?@:@8P@GJ-SS^]<DS7:3-6J]gAHW@1eM_^]S.)D#g#K1bR&##B<0^UYB:J
WC54Z&OgEU97(dZMcQ:7K8=+/><g,>?JC[>T?NQ?e&V)XNPa^.H@W)+d7/c]8C[Q
CA3aED?/P])]e.bZWPJAbaF0\O&?[M)+<\BY:2YUK6JQ;6[GP2CFOJaIQ-LC/5=K
YKAeAMKB0OAc#X49PWTULMA_ST-g<A,D^],PLg&]XY(Wc6>^gRYbL_PM58OOc[1I
2:0O-)Y;SG=JED-gV;USAL?2be2Tc347GM<IQ->JIX/6;KdY9U2fVBe:B1@<gFI2
7KV)S4UC3D=B9C:-\215bJgU/22<MJP<a-05]9#aG5.dG[gMf8_/=RW:(>E6gV,b
?fg<,D@I:Z<#WN03E2#9AJBG;6P)&IT5P<6gY+K;E<Ib611(-]gEDTP5KE=aVESN
N43U9Ie\bf??LceSRP-5F&IF,:(&;?BRMfJ4--1GcP3:IN,DgN;UUZJcFF5062UI
b^a1<Ef1](B3V1+)IZLJ_.^J:]1;+9/</4&P.U?I#DcWa(>2D6gE/)4bKP35WYc&
@.TNc@:N,398HYb81^H5WbZT&GU+WWKCV=[K3?T;-I]T@04P@EA?.B@1Z/1S?3N;
OCW@IZ77f\b7gg(QeUW,]3Q:-W09IFLM[,ZeVWOP(.778V+5VaD1Q-f:_UfI/DNA
J[[J+/<_;>2gd?Q7UH_&>>)9\[<THVfBg0c&J:TQMQG/>DKAR(7fb.)N<)K\7ALJ
4^Ca/J-eC[\9.@@Z1_Z1Q6E@BG^)Y&6[]X)F1(dGW,PWQ#3Ked,36LTB)7QZHF]V
T@AVf3.#+7)S@IF,YR)2ga[aHVZ,>e+U[COJHPaga\:IBS_/65Ad6PNUAK+89Vad
QV:YD(54d,9YED2+@.JJA(-S)_16L/P70R^2\\NTO83-==8XGAY/JO61+8V,1cK:
AFP)=SGHF,J,8,;(#[N2R+@+D\e,^96VHA+1L\Waa#e:B.38-B2^@@96VD5WD1dc
gLK3?1CBX5[J;cAe26D#g@65=2&7?b2M921^^2<036bDO<6)Ja/@d\Hd7-gdWN+O
FOd_<4P671PDQKWZXC;dPD]bBB]46W0Fa9b,Z+9H0DbdV-M?>Z3ZU<X4G<\a#BSC
F\4Y+Z7]>QJ2J+,g8_Ed<1d/&NV]P7R?OcG<-5PB>^gM]7.e#1</RGA:T@B\E(K5
<^MJg>L.\<\+G>SS62.EY[g-0Z;7]D[@.7[BCbP6J3:Ng6ITUY.[g&SZL@O+KAg>
:L9ZK/dIQ&aC-<8F&+R:W1/=@M0?,9(S4OE9A>e6D,.]eaC(&7_K?Z&?/X-OLU;@
d:VP=CCF9LWT>^S5#R+FC@=c6?Ze</JQ0UPLJDK(W29L90WQI&HWV@J#VUXX7\De
Y4LDVKA5Q81A>N1-RF7P876\8H1VW0.LJEaL;SRNP-5[4\bNFS6c6FagM.]69gb6
\&\ND1OCJNS.JSaA5UBS(SEUV&KIV,4f<WB]C5(cMTWWFa6I_\@[+@^9YcQ@KCG@
QM&>);E5dOV<?DcVgQNYFLJ@,f/6>\5Jbf1[Q.Z(V^f#c<@YVfXf70A+_1.L<c-g
[R3;eM+bO&4b.eUaaS89ZD]\83<CY;6(5F0(2ca&5f,bHa_B8c#TN]Z;.7QJWc--
KaXC;9>HJ,2EB+EMfVD#(+9BU^YX@)R<56&Q.DDF+:C?8M-93DcdD18,g&/)7;AD
39W2&bgKbWN9OLIK#C<WK3W+N)NH>(L>I4_6)557KWLd>X#Q0KI.#YFegEQQ)A=_
]4&_^NA<AVbPE2?PROR(J9T+<<(9]<XWJN0c9e#3Y:O_ST^>UJ&:cT??LgS5<<g7
4/bIVcPW/G;:a2SDP:T/^>cX;b&b^#7>J0gXH7f2@DVHZ^;G&IbIP@(JEM#gFRS6
bUf7B.]@RbUe#PVd>eFUG==FU_fU.cK&=[;cZI:3FO=]LPLOP,KC.>>PJ=X?3708
D_eH2<eU\&@:4GX-RS?X7+2GY=?6eG.8@O:L;N9K&,:QGU]@^YC45FX_CF?@8YZQ
=4<X6KB(=-O@B(6E.Z3=QUF#TG5D]@J57c6EERdUD>Y4[0UZHea#.[f(Ibb=5,AP
fD.0F=/aUUY<_f2TX&5@N:f>@[Y(#bE.5gGdC?00YbZ.VbXLJb(XF^4@RB.N^\fQ
G>f\_1-[02B_7=;2bQ>?g443\MAL]U-+NLQ[A)&QE,.O?QJB\ZF2LHA0\FRNS.>e
,1<^WDD)/1JJ>NJ?&E3E-WYICU>:.[-X?9[9C9Y^_.[[bI;\LF,HcKV+N>,,8_.B
;[dgYIGC-9ea&9S_\.=J)JW2RYd293c5V/QHH:)<+L6(Pe-)M3UAQ.&O8QC[&FTM
283MgMK2CQC4QaLUPG2LLZbH:OW4Pdg+@Y/F_g+bN299)\XHKY3QeH]bSg,&@[QI
1]QCCed-]WC=GXR(cJVeH@d/[:D0U-:9B1=M;a06=X+B#cO#_#6:V>FJE3\-PBRS
^&#XU&54-HY(L0dVaLZ0E#CJWd[a[#M>XX#]F2=50OO_0\MU1+II&W(Ja,FN<G@3
X&_9HGU#M5L<KMRbJZE08/7T4g5Df=:UI3&1a?,@GCG8FeC=>OY_K8a4K)WWBZV(
IT]8Y?FM^Q:dG0\f;V_=L4PJ]Q9e9gX\CYd9g,-CCc_5FGG,DV,,K8<V.^]Z]Hc-
#L:=ZNeOHf.#T51cW-HL6.DB9d/aRQSF<YUS#C2;E1a7g/:0@LceE^PI8^aaTb_)
\CfJcFOW4AX@&8(fTL?AU.&Ue8WF4f/O_,>=7=UO)@7:Y#[5BO7>T8DDNU9(eI-2
b)G9OH+4SYY<@&]e6+AU_SE2/4c?7K3[SYKEEC&Bc.F0RXT-;I4Z4:0Q9XgTJb)4
&..#/M+</Wd+&M1)6>=XO;LW6<H#<8a)g1WUN@&MI8>K6ST7=3Q++JFa:VXQ(X?N
9Ac]J4c;4311YCQ[ebZ^g?-+O:1^eF,d7VM^U,RI^\:LF[93CYUBQ58/&R9SLEQg
MXdY?.5K0=:2Q_(PJF+@/W#-PJMK5H5/J-&^991F.)>CM.b,:;R]V+GN+K_1T2K;
/8cGe))9JXJ#-.,f6Ig-HbaSFAZe#_70=,,YN18=]4RTf&HHIS9dZ<7_L5H@=@aJ
N27N=b,.]NGKee-1P43ASHFQA+9?EF:,I^HI68V.]TCS@,_\2e2._<dSF;2583I=
];VgZ699cdW8(@Qb.^SW:?3(c]K,P74W2YgMX\IRSL<Sf@6RBA)MAL\Bd4YT:I.+
O-=JD+e>)C#DGg5,]e.6SAN^0YDe\299S;I)gIee-PE2gfQ2bb0=KRO,56<719-#
DR#UVBF\C2OF-&FPPN+;HccK+:1<>P?Me[3G&3_?Ee2@+XU87Z7-_3I?_@J:6?e;
HF;f,VbMLC/bA^a<8LRde2LLEf>CTCMOXJ&K^6377VUB(3GM,1L:#+QT-AUJ4H0K
JeDLGRQEDg+;8&UM-fJ+RcMd#__,SX0(YO:;\+PAOPW:RJ[LJK/0Ea-XQ8@=>Y6[
V;6Ve=4_#U7@3-&g,?#,WBc=EI[+EVC._WD&4?5R3>>K3>Nd@/HC_aZH#.^deORR
@O7N_bAUQ<H[bXfeAV;bca2U(dQ@\I)@TNCLZG]g;AYN7/ZP.cV3G]Q3Y+?78-,;
fQ@S>+L=aGU\#I/g/&1MWPYK,->fCB@1E_ZUd5ZZ)DP7R72X5K3_S\b-Q;HaY+@J
4-dQLN23#aH\C^gGa6)DXN?fDBA),>\e</\=/fTS[]04&/a4PXB_TcM\g5M5:Oa9
QGWY[Q3Bf@CJ_)4d>BS>2L#/P;4H_M04-AC_CTQ,;KLGbc;ObBc##AV[1;aO.=DF
WP[V.KK?I?3ec+fXbc1ZS9A9M^C]XH8@>1#c9gF0Q3e:DVELPR\1@)4&-=H@/C(Y
,3_;XBDK\_IL_&83/b&)6KY]YCFWW<@Gb0>4)aAaQR?bK5(D&^L-4[ZDQe+0XP9.
(ZC(E-]&XDA=bg,TY@H8?1Q380<^^OXM/gDRORYRX,4R]<@P:L#Xee9_&da]L.1T
eL\/OKd4//e5S[JQeEPQQYCG7I:Ab1OU9S0U2Oe:d<0>0.A.LYKC<bJQPAUA#b4_
YG./6>8Z#V92d84QJQX.4<8,gHTK,46X93,b#7>KgO<6M9@?M0#IR/e2_f#7R:9b
<&?<A@IFbC,Z9,K417)dH,YKb^>0X4g0GGG^^/.W\IJ8HO+aO/OFYc((Z;H#X+cA
)+[9DS;RYS3G+,8GF31)EHf#3,+e7<_60a2/?g,Bea#].1S)&K]9IIfADf,#/Y(I
=JV4c#K-3Xf:b58UeSU\3]RH1gd>4gH15<^V_c3,<8Z.#AHKM]OL-HgR:96LPE3S
QV@S7IAB-C_43#M)/<<4^LV;K1K=YgLIgSW&67MdP;[.JZg.g/C?bS3T=NFNZCLA
SaBEg:.3.WEJ#]Q-4#S?(I^=87_aaNfddIO/#g<KdQ72ZA=89c^7+INdL?_GSOT9
2H8#Zd#?Qc8C1</Wae43O_DK#OA-Y;GN9,Nd=I=II:D;/fTP::OE:(32]/bTTCS#
fV5Y-Z5IXXGE548<#Ve6f^]B1&#^W=DK4d;/@LEA9MA7&Q8JAU2R3.fY_>XDIN?8
]FLc#N45F=^AS^6&:]J),BO=GX.B(#LBE-L22]gYRdLPbW?/f-X&I\U,IM-\)La0
aS5<?&WKf=TZfO\<+[BU7:HCZDQKX_D+Ib3/8N6GX--?3a86QL47NV#QTIM+^H/(
^C#>O_Va9dZKER=RJXFEGN/R5_Q]@b25<I3eGD1b]Vf=d;D2Z9.7N+WW0YF=0cG2
_?_d[P&&Ie-V:AMPETUKHUH];P@IZ=82,^^.AaT[KK)7H6S[SI;=8MKR:IOB]@7.
4U2(L_83N&6XGfX-W@Tf9&,3>fXb2H^A;-S]2TZgWWSdf,C0Nf7&B^6WN;4JXQ_1
E1VMeW6Z#LEQBAd:[+=]RbXTU1C)+G96=XZCSfb98@a8B2?6?OUK>JEA/H<TV2?g
V(C@VTPA+5aH/X2H#_)/Zg#0WZ<GRXf8F?Kb)TfY_9@2<G7),3F?c(c/eOe<#58Z
\cH.D(=RJ3/1V402SdU,.)B:HVT/eA[^A4BBXdBO8_EVZU+=#C&QQEYBALZ1]dH>
T@;NQW?a[7DL)Je=DBTd-]f^:g\5RWDQO3@_OTd+R7Gc/2f8:Vd\A;&_7[K@Q(bZ
_I9RQLd.>M_C/a5fac105_d9GQBM:X+5bFa(B&]\P2/+XS;V41b_0^&VG:6__a9(
/=b&O:<21JaI^;LIZaWW:[BCdY_]1)?QSYV5cULM6K900D6L6@FaOdRZO5aM,O(e
;^;>V9Yb8^,f_XL=ULSDP2]ICJ),B98O/B)6&AXI;^]F96<44BL8(=.O]1O5NZZ:
45T;d2KVdCFJA:^?Ndd<YI@H9,>16[A/ca/JG-1)>.TC4RB8BM]BZ<F)Z0-b+,_2
b,.[0;)IQ/PE@F;5_dOUK<1(CLNbUX<f/f-AV^JRSG@BO0[6@5KRdN/Je\a^a;/A
7^HfO_TN),KP4.>R@Rf<ZeY<b=WSWK.a2))06N@(.YZM;g^gUSG9K(HI7E_-&]W_
EDWa/<?aOb->)W1:X9Y@#OYdD8\_6<T7#_8C;CaIXP>MaD63YTY3OH71bZWUBQ[b
5KH;f@@,.Z9DaS#\?JE1gD(82>X35@D-O@]\=<f:H_5EeJ>><(2?DPBF8&B+e587
ZMgB96.EHfDWN@TR9YQ1QW.6eQ4R(JA;<W,YAN]0\C8.YU3&fP3Rc-7;+)5I(C0U
3L,QPc7])UYR3DJb7?PG+DJHK?-3;0(d?Tc@=L&RE;QY-b3V>aV=JeFLf.3RLgIb
_G6,[;+[7(<C?N>-5(Z,[:4)gbT:JGB+3\XO<E3:OG<-06U;f(4eH0PQ_L&&XZfT
LQ0]eFSL442EBE:T+EAd>e-=H&AeJ&&_;e.?B)X61:QIW+6/@d>4?/1.8[/A(0f:
a+4gI>(5U_EOb8K_K6LR;1-HSECA90_[=#)-YL_(bS)6_]Kaa)T^Y+])Y9@S,@]8
B8T,&g3O9)YU3LIZ18O.Z@2DEG6#K>YH>@YOdWD/9JeZ58?\#Y\6cV1ATMd<[(cA
3]O#7g\PG#dI0&:BEJ.M0>S;8/DGY7:ST<(8>V2NBNQ<&R(8@U5)VKR>Q8?N>^a9
.;XT8BX(3T6H8)OC<dAGLZINc+EAb^Vg97:AIEJb+U/(T)b/I1=O8?WD2(b&fgOF
2@N];LJL5_CJXTTQMg0c9R+E5&;-P<-0eD<20AOe2GbZC:EI1Z([1ZI-#OPC.J:e
ZcUCQb(M+9AC+b_=e[X=?N=S(+eTG7-7Y.QF_eD+=2L>1],?U+PA^)@XI<LJUND0
9^07>M<Q9^7HX6g4\-#R[Y+\&CXDF#;5I6JgGa@6,UB9->+;Ya])1&cZG6dMCC>P
[&3\636?.KK0f?G5T>OfTE\)XUEZa4S9DIK@7HS_ISO4.d2B#PWa7X;9,Q-U4MJV
P07)==L7Ze;WRO>FZgU&(>Q&[T2H@?--c\TF.?#deIS#K&RFAcGAW:0f)X#Jb-XZ
WS,d;(B,J>UBL0>a^Q9<[8USJ6F?bTaS:cB;H.V6\&0U0:]^V8Gd#],RR5K#S4EU
J^4EV#[/7-BP?H,8ePIPc/,?6Qb3390ZVabU_^+G[,5;6X6dC[S^=fU3U+C2ea8H
=2V-T,S,^2[5gRE:L[_-_JObR8[<&&Fa=D;eTU7GRI5(D&8eYZY;PHIV1XQ2R5+F
PcDSAKF7.?5c_LLcHa?L-N^1:,/1ff,fdH=73@K+>F>DNZXT:8A>:6M=;W-<\f44
^:-FZCYC_7b(A&I>W5O0.AGgKT734^-L8X2C]A0WE63JWAY])/WX)a/KeH4a,(#F
cFHU[P1J[dRP>)NJ#g45?O33a&V]@/W=f2>62gJ#59c\U:d>4HcLXUa+YYMURZ^I
8ce8gIKZIWWW@G&E?TQ6Ef_]9:FDU>AH032_V<-Zf;D_DeH.].Hb<6_aU2Q9+a2<
DR@KW3;]fGC36E8TELEd=VZ^L/&1U[W8T<K)QOfC3FdXL.4::@:e(HF(TDQ0d4PZ
[4bScZcT\=[Z(W-]]SW4c:#J<CVc#bCA?J(_B<F<JX@.,?@S=FB7O3QB@eOO@Z1>
U>0&.N))0D9:SK3Z@ARQg,LU@(\--XC94P#CZ=\CTL2/L[Vc1Z28d2D7SB#VJ#W+
_,.DE2(G6S1fN8aMQY\)G[e=L/ZW=FYDJ+d;cTO_V0X],?7_g6HE?K6FdF<;W7He
IBbI/&LE[R9G_\7g0I9c^fL=S@ASCS/KIE]FXVJe_;^6Q(3c3TNcMgU14C0E,(1c
)J3)9d@<\=&+6=9gPJ@;2gZ-0Rb82Y<QCIZdaf\=R8DI<bT6D;M6@=,U9GKb_&#S
X508OD/,92,cZNgT9]QT=#8FV?8:;V\8R2.6\VZ5NT-KN#-;[GJ@E^&F2EYa_6D=
dIg@@6;7V)c]cAaF;5aP=0K&Q6:SU6dVK5K3^KW.4J.E7J=e(a2[@N5P/N;JMR_Z
4&Z.4ULcPC36fK=M7F5DSC5(dOW-PE=&RUCANfd+1:C\b<G]X43=D;cZ5Jb&(U@,
;>4MO(8=^d-[Aa=#\9:@2Q6[>dQ4LYEWL]Oe:&-I4aMN_f?X_=I[GVb119^1B\>2
Eg.^AGQ.fe.@.>CHX#5YW#WcQZ&OU]AZ;GA,Ze)V6dZ5#8Tc0Jf(?UXd<;@^:U(5
g/1K7)?ING)TcBG66,b9HXZ^+JZO/)@TW2(634IL:T?f<fE0?8R0E8N>9e1<<B\4
8K11LUSPe<@=)?10KNYcK3<8NV7ZBgLK((DQd/UTK#?&E)fY,f_KRA#2T/)GGNcV
+O3ZW-,(\?c(c);@YW=-^0D8P2bSQA7=;_7ROC2Ra^=;ZI67O>gI\M7Q,KUR-#_4
H&D]H184Y)))?<6:]Xf_I:F2_SDGN:YN4G;ZX7T\L:]bNbERaR1[H_/=4HLeP4>-
-N<QBg4L=+I<a@3:2#SIe\&.-Ib/&<Tg/dCXA[.Y4>FUdD35Y5[B;aP/TH1O&,Y+
dHa:OKOQ_:e(Qf/EOJ1@,QH6ZJ,;)O?M9L>KVRWTF0#::;cPRRd_MNgODHP<0@(4
5BQaRDPW#0:9IR3:-^g0S)YdV,4D:U_Bb,WO<cF2<+Ae29X(J\D^1?SQL.7;b[]S
@+GTcA0Kg2^</<\YM\W]6H6c1-W8R;Ag[#/^FZYJ80F-JaREE,T5aF6D0?QJ^YSH
WSc[&2EfDFg,F\cM]#@F.W95N<EI2>LU/JAb:Vee#OA^8_2V6G[Q4JS,F6=6BH);
WfLg5eY#7E,0@KJ=)aXC9>a6KF&?K1;b?&b/fBN^.LFZf2/:+][)F74Abc26a77#
93=Ag6aY)VGK\V<c31/<+Z50@3FLZ+62CgOMK^NTE[4>C8)?)B>[N^dTOM-BWXfe
B4#b\7>.Y(-02@\6L^S@2OYSKL0^Y5V+[V4B9+E:43LJD30V+PgWCSY80?>7d80.
UQ.2>fU0#HK^/)8W@HXM_<(?2/D./.2^O&:K=J[U_-+_d-J@]8cI3H,,WZ,/Z_-I
eFJ)DXC.5-,(D&dYc1a7.KGMNT7>S<;U84JdCQdd>WA5c8<MF>@]Q]<,b/ZZ8S/J
b4D>/O@aI9VJD7H,SdSQ];L0CUaUYV6D#E;<2RN5QSX=G5ZRN\c-<;<#A\MO,N^4
DQDPKT/?EPYM]E(4O1U:g:MM,QIO)0a1L(d\U[;Hc]a@_Md((>0&S#]A,4MBA:2b
[<35CS-X=EHJS&IWXT-E,(=>I)/+QB<B1-,c/=A?]+GPK52gI=UdJdccaICS607_
2^XJdR3)B.V&A\FTaS)W[MMJZN3[LPCL2Dd0#_<[T(&G;6.9QD]GP)X\HNfP2,9]
\;<.51#HX@H;0,PX1V\,c_[[\:7eUC];5W>b;N2EYO?>M+UBJC#:NZ1S[1I=<(UN
c,SaWL@g^e.OGbWQQ.34c\:(#.;/=b:^/<f&\<F=N<&.?a]N9#O1XR3.^g)W8:]A
;7F9eEMI#KHbZdeLg1P.H,6K?<Q5B,bJ6dW7(6SME8WAb+MH_/,#WfdC);W8B7FI
.XfWfB[@e=5FIU^gN/4I/\U&YY/TBf6Y]F_OG5)A96f:TcDY>R>IJE1\BIC:;+]<
Z0,D]gDF.#=6,4T[G:7__,c06W^@:PYY(gOG#PeYEM_2(?ZC66:6-NBOf_ea\M>K
+b+:QK=XOV2_4-BI+S<9T[&7\=:HKQ0G@8EW;C;)BeQ&VP?e(CaXC,=N.E#Rdg]0
NRW=Y_M-:WS?)9,7Qa=c5f;MQfZ(\PH?5_3PF;NQZBZ?c:[dgF)+V6Ob2Xa>fLcU
5(C_CTfW)4V<HC(:4aR0ZQ5LM2gJ9^2<<.1e<TV5B=ANU?#YAFV]L##:HNL\Q+Bb
b^Y70\a#G[#\E&G8NO&PgF8AVSFY33/.Z.LL.X7]YS9d84U0N=4I?5ALKW4f;+XX
\KK^U9ZM]^9^>D>?86:1YYR6>::c=QH[5>RSO3_42;.M8:0YU>eHCZCQ@LM6QXH7
HJL@&5IL?CJb(abE\XeX0)UCbL=W3AV)gW4P:_<G]a>cNF0?2-.8/6<20W0-K7=Z
E&2)@<RP]gG=dZY#2MG#:EF3^0<U&F2/_7OT=#c55HKSd6_\MSEd-3\UY:=bGg<M
(MZ6P)4+4^W,G[0#W=e7<F);b):=\PC3^eEBCREDEEaU[/2AG3WEQd<f[OIbY6;b
5]LM:aHf.Lc:c38DN^>C9Z]f_PVf>EE0U/R,P9<MFMWO^:;V7fQ&4V9G&(4O.dg;
JU+)SQWY:_L5A#O;N]>ag(OB\L/C=67CTNDW6+]c]bgK118@7(^<\JBe.ffMPEc5
USG/:Yd+<B\QOWbPER5)D/8]OZC-^?<eA@W(8,RSc>5c35CW6S].LbMG_eK\28EK
/?K^V8:W,;7^dFQ6B>aXLTW5ES2Q75;T^F99DcTN,dRfcDWd_\1fDgWN1\d7N;F3
+<C0&db9gAEcNVQ]\c3U-30ONA\fGd4OXX2<?Dg9P7]+W][T(L&3Z,(Q4:WX<Q4.
9Z<Q4&0bA[(39#00#RTf=XWU_@g,M]fT;B7LNB?gWEN_]-#FVIg<b_#9H63Be7c,
=N\N)2J<H\-TfPJRT?:=YBgF\HG3ga=<E7OF614R=((X>)#@ZF=K0AHL8Fdc5KX3
@d;)<bA(LD,6e^K68a06?4L@)eG,M^.WNF@aBVB,EX\[?:;d6=2ee;]OY]?\.C(1
0M0@CF-MF7b5b5Y.Q19VC_9=//5D.Qb0>N(#H/\eEWc;_c]D=,FX@-c&=[.3S[Lb
Y7FgUY6+[Ef.(5I:)BaVO6D[(OR9-dA)Z=cQWFVOC5^P]29TJ8?5#CKdS:aUcZZY
e[J_1RSP=9V72A^U-_GL?3Y6,W7.0\AK:AFRCDOf&ZHKYP3R9+c^:EKZTX\+JD9,
7b>?H+9EG96O7bJPgP8/U_AQfZ;VT7;5]K?X</>XMbSJ?9f3?O,,L5#(U_:GfCHK
E,97>DYHT?VG>>+[[HMV3ZRD6H-8g7-]-[EI;,C]HZ[4-#eBDLV#S#^ZWL2>]3g#
P<a84>HKT7b)bP\W5E?ADd@2f_g;Yf.RX/?2fd5L9;dJ/H\Q]@QD]?G6[_BPYaWK
b68BJO6O83:9(J/YS<?WU@;Y#+UH(=<F:)LZV^/aZF[M^3E[M:O27RH8T8Y_FFEG
J&<24W,e^b4T?Ye77T2]IR>IHUD@g4b-8?1[#IBQHTHJ_<ba/-R/KG^MfA#c:[41
51b,@2-6gX:UNcS0bReE9f@G;;4@aETD2Q0,.T4H&1/<C0OBE&RO=PeE1a48b;T)
ccSZZTObZCR5F<,YJQf@9#7^H>;L[?=:AER[_L4VWa5=]:_6>[N76C5L#O]SXfS>
Z>_?EJ/Ug944#fXg>RO4-ZHDaGZd??[bSd></7M2-._<=OVg^VV1P(1fQUG+K6D/
fWeT_G+,3G,;a69@gBUIWB^?JTIFYS:-_cg]]7,&B&]8X:\aM<58b-X(X4=F30a?
+dM@c)@QO<ZcH3VW\OHGgOTOP35QJX\Ba:(bIIT:4fNBg4UJ79A0N)DKODcV_?@^
PAZQ-K#12NagZ,H6<SQ,f;2:1):1JOeZTb5I,-Bd]\SFLQ\&7GR(CeeYO\ULab.\
Ka:(Cg:1B7C/Yg8K_JD#YRb?URSU6J-NE4J4)H;_OOH8]S9Y?Zf4C]a(NBBNa)2F
QMY9+\RLgDaLb22b)RVB=Q3,T0@]Z2e9=F:V).88QUU5T:UI)CO898@X<&.ZKaY2
Fa,-3)(\ba+8VU05?NdWHV)H.\)]GA6HA\WefMMRbO<K=9fXV2XG?&N.=^\9;C2?
+G\W-9^2CML&B9I:aM3dY<K3V\.Q-8QX;_1QedBAP2[DfgEJ87<&#Za<0UdI=QgF
3:?=FXV7O<:+DIBFV#8-B_@R=>-J3W,9N#DVV4[V]ZO&+ZZ@J#YRD;/B96J?P<,D
AU;)K\7b]V[L4+8KTB1>7=9;I=OJO;e4eb3)PT?>dWEN7Qc8(3[(0WU47?LK-32H
<EBZb5QSQX8+@b[ZU?9_Gb3>eD<Mc?U0/(P)8U(ZWd[,DfS/Y17&-=A7B#:L3S5/
?TBVa8<O:Y7U.>ZG,9Q:d?77,C4H6E(0:+FFY9O6cVTJTCDM9#>f>TB5e;J0N1CI
.+(CLB8&U3ZL7[Ff=14cbW4)LCP@FQEPW/T))GOY?C_])0F4GM<VK=fA3+O\9N^_
a48Y7XOL]G>gMYDOFT,R@S@XX\+YX+XZ&,fV2VYD#YX8@.eN/Gf[1Y:SHMMK6:b_
g-)AAL;90-]V)-B\5I&e,JKY+ZJB6XI#F)H]DgHgg^9RbT_=PEUZDLNQ3RF]<&Cb
JH,@bD5]\9?^\?aJU=P<GL+?YbdHZ;,8+>Z_d)^b>/H9Y57#?5;/0M6>9cFdX;cP
].R=H_1dRV.898dY>.SCZ+G.[a3FbPTJ;?E(d<]OYN8970S]GF458AV]V8.DQEfF
BQ<6.BO4:LR6(cNUN48&4Z)Re?F3.V-6f\f>?QVA4IH1(N8TEU/XP-)Aaa@J9LQF
0QNT:)bI.=;:E>N[X&8<Ha;[_D5CQ80#MDOW#I:)-:8S4Q)Sc+/DFD50.=9:4]=3
@LEU<K]FRA)E8HW?TV;:#C7]N0O4B,0:U4bS_f8dH&?.MOMF.9V@246GA<)/2Fcg
<HHb0B5GKWAa)GQfIPfe[T4.XX+PVS[33P;EX(165Xd-I/)CL16D>S[#RSU4^QMY
,X\=XTED^][cAEYg;Y]HGLQ?21.Bg0?&FHRcPU.)+4(3VIfULR@S_=;3L(JHU:fL
G7H.:R.RaVbVBQVM9B^1:7Fd/RdM()QA^Wg?=)<\X]IfTDFN;THP-P05]f6];._&
R4)/N,2-W#(9(c6A2BB2f?PFV\&]<=T5f8S]^eS2EGEQK8&F(aLI0@U.LNT>IDU,
1Sg?8:NJ5/ZDY-?[,EXX?_XEZe))5;gC4?#@G;eJR6/?BfPWPg)Qg?4B,?GdGV4d
O-1TQ-BAPM<XgFecCGG[];_a&]Pe>[3;G55P30]M[Bd>eHV0-5_0e2>]7P5BSRaB
5R8D7:MdBTV?)b(E&TM5T[,gRDZMF^MND^_J(WL>3)KFf3EPL(-_)X)]?a_[#JGV
^PJGbII0LVMDI.\T6ge\bf^)8P,FE+DE3A(<[HY,(PTfQAb8b/D.8@&Y]5CXI[47
=?gM_Z[@IbD6fe/6=@K15=+0@8)a:^FFMJ2DBVWDUT\;Y7US-OHMW60\578NB?]\
BB9cFR5R\CERYWZ<;O/fdO290G1fUK#N2g@/,2[XGaYZTL4e(3P#Y[V.SH162M9Z
(\CECfU5>VA?FSIPEe,39F-@a/ZCVc8&(IffSMa^??fgfPc5)//05G+?<I,Id.8=
=Xa5SV_SD3:J\>WBf3GC)T5SZAY0]7N/&dOMAPgfV8OQY_TT[-aJC=dQ8^,&C72]
&##-W.aDY]27^K,>ZMVAg-1/SdW&3eO-.CFXAN#^aKf\S-1:=W._+=CB(+T)-DC)
,BY]f3Ef=@8NfMWNSe6/Q5#?L49C(/J8+]8C49g^(a[G6UZdQ=,Fe&I_d,;d#P<[
/Y+&-SD.<Q6YA-MC^eRIJ0aT96N^g^B6?9G?6ML,fTFZTK_KZPJCL6G<J,0BXa6F
4d402F<Ved_>#(DgO:R0Q2aE6.4O[?+&gEaCX)RP:b,\(\1a,@dLHVZ^I2FCVeOQ
N(eOM>T2G;QF^-5K9GAWJQ)7?V=_\N284K[2]BBL/6OA\.-<B3fZdH<U@<;MIE-+
b4)=:(M=1AGc):9M-:0&GE+65;HKLZFD;:bZS2fF.E:c-N7_>1\CD9KWRA:Z<,7I
(2geOOT:.2:-,5DgJ?).-[].@?6f=Fb0Q<bcH24TKBUX=7e0[)6MP22>?POQ4<L2
3U/7]d5LBdECJ+52d:YOC>HBM;#&2_<GIAeA64B^RP[6-Jf0OCSL5IKWaG+0HO\3
@IJ:b>1GX6IJ8&X;#cVF(AQ8;[.<>:RQ3X/47E[d2+;&C>eVETd(Pfa+>50_>Ze@
fTAF5RPN\F91T[>)A/KXXMefHUCGIPb^7FQB+TcNCcW8ZZb4L8/;5BKRL0g-0[IU
1/#bW\_G<?,,KNUON^.#Rd+_CZW1\HP50SHb4f2cX;/J_-LXT6JDb4XL78=cM<9.
#]?E+;TXYJcEE,V,(Sg,=d].A.1[e(IWdQ>3D.WM>aAa/&=15=:M_EcSELR+9D6)
S(_B27dA?24=-@(KCQ>P@6eN&/PcUNbBS@C>6eP>@7]\?74H-JZ/QNNK+]KNa[c8
M[IOY)P85:Z:#EdQ/?(W=[,d:C(b=Ib[?fOcGJd-T6KTa-WE&D89Td\CgQ@K\YMO
RS]4dcPIBL9K)-+#5eBG?gU:NLJ=_PY[AH1UY5M^)_7e7?NL?SWK;EW,0V4<99WY
g#K3d(Z-+#P.B:TTOaTRdeX+V)51bXGWO;-N.W4&A@5^^J-)^5SJ[@(:Pb>I[@8X
3RDg_P-[JQUB[+L7J9>2MXD^ZDP.f\fT=<YFF2O8V2:RLF3J(+OgaX<A7)]2MJ6T
BBf]C]TA3I&RQ6.4G8UV-37]d;&P5YNR(agN]8&gHNVb4.f2HZ+?VFLU45Z79TI)
Z]5:5KbLI6;@I2?7LCeTKDK-#9<7NP5aF(CXT?\+c/WXVb.@[<=eeBC<Ye#V10:Z
0a3]HXF=M6C9fV/UTNW-KS5W6DP/?CWGM6.Z:QU:YNe+#U4<bKV5bA]</&\GZV;[
S0911,Y3e-XVTQKL1;A+@T^:Ic9>=K)OIa.-eeeSDRDbYYDc@G&L.E;V08W?If\^
a)9:)8bG-N282[;@a0gTPSLdZ?5U,+g/0WYRfGO<)?<[44:K>8_:V;1He]LJ^NA1
US&IM0Q4I5X2/-eaf&,O.4S3G>Me[[&^SI@=N)ZPO>S5(1g,4;0GPA\?0/\;R,0U
d@-,4Ae5eeWR&LLZ@7g[U<8e1H>&be6,c5,HJTMH#4AV@XKR8.La4R[BbBgR][.G
<GbDX8N3b\#N6&Yc9P[2F?I[>N.J2+XfNd]N)>H;_fOPDd#ZHD3K:[/dSY2BLHgd
U5(J?IX_#-QgM9.R8K]a:=GMOTN<X+L:VAI)\HW2R>OFSf1LG9#eL_cN&>F@R+5B
>)2J2W#WRH(F]9TPLgTWda#N/=YOXf/UHg)C]G@4VIGG9eS?/3/a[F/LF55W)=Cd
HMc==7Oa@9Q=H@b^]-4>YMVFf_\?AMdF;-^@;<g1)?(>,_@3dPXD-L@C_K:7[=&:
URBdXWJ7BIg/^a2N-EgSU[;a=<@d#FgWG7^&1[;82P4F<6/gD;Wc)E=fS5R\+eE=
^;e(N]0Dg?Ue+T\b35F^4Y:P,DTAR3=fQRP14<9122RED6@9?AHXCHSIB9+.,+Z-
8HCW1+2O7[Y.5HKIG/RN.HY3M_.c6HbM[<aE.@6CgfJCG(^;8<=6T)OT\7A?0.Pc
UUS091_O7]bK15ZK^8GNKeEDUaT^1g36Q.4J[@\96,9]S>BQ+ab&2Q(WGU@.[G[/
2(5\92/Nc<c(FZZ6f8ID67_R:5U[2[/0d,.D&]U6#f5gSM/XN[<^^:IG43Tg5fGa
9f/5.Vd76F]gLQHT0?>V(2Yea4dd1X<7J=5./eSWFV\#QT0gNL6LZXK@@G2PO0R(
2DQOIHgIIY-YA.>eac3WER@fPOX2.f)7[8U1G<K9cV-eHKb_NB&6/TBP0d.N&aEb
Fg34\6Q,2Z-bGE[81@P=VT/5)\CO2fNTP07=2+68(#0Y2YTIWZB5aE8E.CZ&:&[3
fB?A_YNeF_FJ5#/Z:AaWI@RC=@?-L3(BTDW^;-9_e?bQfO<LF@<W0AI9&Y3=2VJg
RJ_\/KK4JMYOBNG/C5/^aTJLIYK9OL&@F=)8)ZU91T[?RU[1WJUA)ac2<E)DCQAT
X=ME@#:(ASD\P7/<9[U[A1RZI1PN#BEeGga1^[W8W.S6e,91D_DOUeWb#2^GdFE\
JY#cE36AT^aD/Qf44(c1T:SGZ=.G@<Z^+5D4/a#W@HC.f^+SH=)/UM^?d2>4_aQO
/#gW4ZI@(QW>4BYgg>eZ^&DJ^Y,#D5Q&cC]9,WF]TSIM^[@]gc--9N3_cZW@&e_=
&.NDXKN<?49,=e?6F7LY0ONG-0U]a+XE6ZRLIL>GHP4bSD<Nd-EX_PE#FXW0NH<f
CEJda<cHL#TRFb]C09Qa_.0I/1cCLMfS8)@_\e^DX<P=^QXUGC&&FMC&E2fa#;N3
/0N4WX:fd0Z\C7)\XC;]HR6&9S=f8/-I-B-7+PK>@Ve_@G/<H6/6,Z]X>RVA--d^
/KN1fFd2Y5KcI_\a+1T2\QeO4#.:X7W;U6ZT4]6H0/0>WA@dXJMX_@#F+&f>4<R.
?V^CNI3/+C;00[JTcQ5/KB,OEW27:(E#6a?&:))99c[^]^T-(NNO4UKeIQLMJE@L
GEL-PJ3C)d)G@#^NS07b=3_<7a&+&N3b67eWQ8ZR/HX_<:2[Q&M0>BRFVQeVRC1)
Q>?F8eP:7+<OM2d>^.5T]F8]8=O6cC=K+/MCCPSV2:/c&KII)_EO;(P;@Z-&>3\U
F]=6J0)<(O@?c--a&(LY8@gKe#N[Z]@OO9>59KAJX[BQaP,.;K1\3A[_D\6@6XS=
g5YBUb=d;Kg[\DTc<Pc_W<]Y/OD;)PE?B2KXb4A2/F](+>P#Z&:)bX31@5].9:]M
_?GH?=<PS?0fb=]MR-)b&8-H<)N++:.RS:0_.gKI6(#UF&WDd>BbR_IaW@c00J,G
3FY1R0c/,-f>Wg-0#>B)HcYQKE7CJgLcMR&a>Og@4HX<N;,c?E6Z9,QBX<2LHe3_
=3V)PgN6GNH47fP6c4)6=Hb1]bY-/<WU(&deHVS8]TVMSEZ^9gGWEIN_^Sg2N4fL
b]W5(8=Qg6WZCf/\]McS]T2PY6:XV5QW@.&6=Deb-V0.+[cKb6D_U:e=c0\HLe-=
)^C1CdUXA7.b\K)TASLXP:UM0I^/N+ea+1\>1W4bCT2<VO?Mf<DN8)d_#&[5W)&Z
a5(Y?YB:PE5COf=FU^60<0E7ID--eOX[(3I^5HSBH=McD]3,.T5gL,GMDG5S4^a&
G,CM&;W7M+BP#W.H2:/DN^C:AOYI-.7,2e7\7Z2[<0#0<#AN(;ZF=@9BZaIP7&_<
OQ#+R;@<7&T4@VcR;EH-0L]XFIJWCcdG7b)?,V8V^^H]/OVLL/K?6SJ^E^U>_XTX
GCW\:Vag?Q/gaE;K0/4G>C/M,#]>cST11dRMIQ>/SD:cf59L0=ABX2f[AC;cc]ge
81BLRe:=1PS#a@RQJ)F6cdcZ=-Ib3HW(aZR>ZO>B8f&?.]HZG8b4JNY]cO0fLYdd
BE[4La6=V<5J;3R3:(5[K7#C>f+3:F#-ebKM.AASAJ9>KX3/?L]HcFR&]B;>/(@6
[@DY&g&H@>cH@__(^bNWF0=5Fac.?MZ.09\^I:XNbc9?(<f@b6N3cI_bb]/QTXY0
(B.HW(N/,/.;<M?&71&/a/9g,#LP76-Z\dcLX[L^1+/+\9+#F1YI7LVSEY1RSJG<
dH3P&O>eb36L8G8[ER#LOJ[CRTY(eIfJZZ:D88Z5BE_:.(:]M)5?8)^(BBcbOMWQ
f5<-8,\))YKS<EZ>G(T;YI+:RFAJ.HOg-:7NAeAH:)(3G3HNQg@)K>cK))[5MKgV
8P_W#EY[DV(N>]A(CK3SX_#F#2H5;fZG&Ka6c4@a#A+EAUU=6QHOPOf:(K^&YSGB
Y-=POX=FV(A2.G6Sb-(&<3D_HR+NAM+YEWI1:GC4F06(1?YK5&Aee)0FGY8,<]K-
]J66L,O&MKK9X7LM>T3+AbU+ff2TfTWfc,GG/4<8K\#R;Q]T:,<CRQ1P()PC-?e\
a#aX]K0W@7U#>IL3QI8Y^WX9VD5FZRbd;$
`endprotected


`endif // GUARD_SVT_SPI_FLASH_CYPRESS_TOP_REGISTER_SV

