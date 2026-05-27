
`ifndef GUARD_SVT_SPI_SYSTEM_CONFIGURATION_SV
`define GUARD_SVT_SPI_SYSTEM_CONFIGURATION_SV

/**
 * System configuration class contains configuration information about the 
 * entire SPI system.
 * This class is used to configure number of masters and slaves in the
 * SPI system and provide configurations to every master/slave agent.
 */
class svt_spi_system_configuration extends svt_configuration;

  // ***************************************************************************
  // TYPE DEFINITIONS FOR THIS CLASS
  // ***************************************************************************

  /** Custom type definition for virtual SPI System interface */
`ifndef __SVDOC__
  typedef virtual svt_spi_sys_if svt_spi_sys_vif; 
`endif // __SVDOC__


  /**
   * @grouphdr spi_master_slave_config Master and slave configuration
   * This group contains attributes which are used to configure masters and 
   * slaves within the system
   */

  // ****************************************************************************
  // Public Data
  // ****************************************************************************
`ifndef __SVDOC__
  /** Modport providing the system view of the bus */
  svt_spi_sys_vif sys_vif;
`endif

  //----------------------------------------------------------------------------
  /** Randomizable variables */
  // ---------------------------------------------------------------------------

  /** 
   * @groupname spi_master_slave_config
   * Number of DUT masters in the system 
   * - Min value: 1
   * - Max value: `SVT_SPI_MAX_NUM_MASTERS
   * - Configuration type: Static 
   * .
   */
  rand int num_dut_masters;

  /** 
   * @groupname spi_master_slave_config
   * Number of DUT slaves in the system 
   * - Min value: 1
   * - Max value: `SVT_SPI_MAX_NUM_SLAVES
   * - Configuration type: Static
   * .
   */
  rand int num_dut_slaves;

  /** 
   * @groupname spi_master_slave_config
   * Number of masters vip in the system 
   * - Min value: 1
   * - Max value: `SVT_SPI_MAX_NUM_MASTERS
   * - Configuration type: Static 
   * .
   */
  rand int num_vip_masters;

  /** 
   * @groupname spi_master_slave_config
   * Number of slaves vip in the system 
   * - Min value: 1
   * - Max value: `SVT_SPI_MAX_NUM_SLAVES
   * - Configuration type: Static
   * .
   */
  rand int num_vip_slaves;

  /**
   * In SPI_STD Mode, by default Dynamic data array in Transaction object holds the Data <br/>
   * bits for Tx/Rx. But few applications require storing large memory blocks <br/>
   * for operation. For such cases optimized Memory Core is used internally and this mode is enabled <br/>
   * through this configuration bit.  <br/>
   * When enabled, data array in Transaction object is not utilized for holding Data bits and instead Data is <br/>
   * stored in mem_core for Tx/Rx.  <br/>
   * Memory core Peek/Poke routines can be utilized for initilaizing and reading Data bits <br/>
   * Memory core buffer space size is determined by spi_mem_cfg.data_mem_addr_width field and is divided equally between Tx and Rx. <br/>
   * Tx Buffer space lies in lower half (from address '0' to Total space/2 -1).  <br/>
   * Rx Buffer space lies in upper half (from address 'Total space/2' till end of buffer space).  <br/>
   * This is currently supported only for Motorola SPI, #spi_feature set as SPI.
   * Default : 0 
   */
  rand bit enable_mem_core;

  /** 
   * @groupname spi_master_slave_config
   * Array holding the configuration of all the masters in the system.
   * Size of the array is equal to svt_spi_system_configuration::num_vip_masters.
   * @size_control svt_spi_system_configuration::num_vip_masters
   */
  rand svt_spi_agent_configuration master_cfg[];

  /** 
   * @groupname spi_master_slave_config
   * Array holding the configuration of all the slaves in the system.
   * Size of the array is equal to svt_spi_system_configuration::num_vip_slaves.
   * @size_control svt_spi_system_configuration::num_vip_slaves
   */
  rand svt_spi_agent_configuration slave_cfg[];

  // ***************************************************************************
  // Constraints
  // ***************************************************************************

  constraint system_configuration_valid_ranges {
    num_dut_masters inside {[0:`SVT_SPI_MAX_NUM_MASTERS]};
    num_dut_slaves  inside {[0:`SVT_SPI_MAX_NUM_SLAVES]};
    num_vip_masters inside {[0:`SVT_SPI_MAX_NUM_MASTERS]};
    num_vip_slaves  inside {[0:`SVT_SPI_MAX_NUM_SLAVES]};
    num_dut_masters + num_vip_masters <= `SVT_SPI_MAX_NUM_MASTERS;
    num_dut_slaves + num_vip_slaves   <= `SVT_SPI_MAX_NUM_SLAVES ;

    master_cfg.size() == num_vip_masters;
    slave_cfg.size()  == num_vip_slaves ;
  }

  constraint solve_order {
`ifndef SVT_MULTI_SIM_SOLVE_BEFORE_ARRAY
    solve num_vip_masters before master_cfg.size();
    solve num_vip_slaves before slave_cfg.size();
`endif
  }

  constraint reasonable_frame_format {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].frame_format == master_cfg[i].frame_format;
      }
    }
  }

  constraint reasonable_spi_feature {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].spi_feature == master_cfg[i].spi_feature;
      }
    }
  }

  constraint reasonable_baud_parameters {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].sppr == master_cfg[i].sppr;
        slave_cfg[j].spr == master_cfg[i].spr;
      }
    }
  }

  constraint reasonable_endianness {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].bit_endianness == master_cfg[i].bit_endianness;
        slave_cfg[j].byte_endianness == master_cfg[i].byte_endianness;
      }
    }
  }
  constraint reasonable_operation_mode {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].operation_mode == master_cfg[i].operation_mode;
      }
    }
  }

  constraint reasonable_payload_word_size {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].payload_word_size == master_cfg[i].payload_word_size;
      }
    }
  }
  constraint reasonable_spi_safe_frame_mode {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].spi_safe_frame_mode == master_cfg[i].spi_safe_frame_mode;
      }
    }
  }

  constraint reasonable_default_slave {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].default_slave == master_cfg[i].default_slave;
        slave_cfg[j].default_slave inside {[0:(`SVT_SPI_MAX_NUM_SLAVES -1)]};
      }
    }
  }

  constraint reasonable_default_master {
    foreach (master_cfg[i]) {
      foreach (slave_cfg[j]) {
        slave_cfg[j].default_master == master_cfg[i].default_master;
        slave_cfg[j].default_master inside {[0:(`SVT_SPI_MAX_NUM_MASTERS -1)]};
      }
    }
  }


  // ***************************************************************************
  //   SVT shorthand macros 
  // ***************************************************************************
  `svt_data_member_begin(svt_spi_system_configuration)
    `svt_field_array_object(master_cfg, `SVT_ALL_ON|`SVT_NOCOPY|`SVT_NOPACK|`SVT_DEEP,`SVT_HOW_DEEP|`SVT_NOCOMPARE)
    `svt_field_array_object(slave_cfg, `SVT_ALL_ON|`SVT_NOCOPY|`SVT_NOPACK|`SVT_DEEP,`SVT_HOW_DEEP|`SVT_NOCOMPARE)
  `svt_data_member_end(svt_spi_system_configuration)

  /**
   * CONSTRUCTOR: Create a new configuration instance, passing the appropriate argument
   * values to the parent class.
   *
   * @param name Instance name of the configuration
   */
  extern function new (string name = "svt_spi_system_configuration");
     
  /**
   * pre_randomize does the following:
   * 1) Allocate master and slave configuration object arrays
   */
  extern function void pre_randomize ();

  /**
   * Override post_randomize 
   */
  extern function void post_randomize();

  /**
   * Method to turn reasonable constraints on/off as a block.
   */
  extern virtual function int reasonable_constraint_mode (bit on_off);
   
  /**
   * Returns the class name for the object used for logging.
   */
  extern function string get_mcd_class_name ();
   
  /** Extend the VMM copy routine to copy the virtual interface */
  extern virtual function void do_copy(`SVT_XVM(object) rhs);
   
`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to, based on the requested compare kind. Differences are
   * placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is svt_data::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(`SVT_DATA_BASE_TYPE to, output string diff, input int kind = -1);
`else
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with rhs..
   *
   * @param rhs Object to be compared against.
   * @param comparer TBD
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
`endif

`ifdef SVT_VMM_TECHNOLOGY
  /**                         
   * Returns the size (in bytes) required by the byte_pack operation.
   *
   * @param kind This int indicates the type of byte_size being requested. Only supported
   * kind value is svt_data::COMPLETE, which results in a size calculation based on the
   * non-static fields. All other kind values result in a return value of 0.
   */
  extern virtual function int unsigned byte_size (int kind = -1);
  
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
  extern virtual function int unsigned do_byte_pack (ref bit [7:0]      bytes[]    , 
                                                     input int unsigned offset = 0 , 
                                                     input int          kind = -1) ;
  
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
  extern virtual function int unsigned do_byte_unpack (const ref bit [7:0] bytes[]    , 
                                                       input int unsigned  offset = 0 , 
                                                       input int           len = -1   , 
                                                       input int           kind = -1) ;
  
`endif //  `ifndef SVT_VMM_TECHNOLOGY

  /** Used to limit a copy to the dynamic configuration members of the object.*/
  extern virtual function void copy_dynamic_data ( `SVT_DATA_BASE_TYPE to);
  
  /** Used to limit a copy to the static configuration members of the object. */
  extern virtual function void copy_static_data ( `SVT_DATA_BASE_TYPE to );
    
  /**
   * HDL Support: For <i>read</i> access to public data members of this class.
   * This method is used by a component's command interface, to allow command
   * code to retrieve the value of a single named property of a data class derived from this
   * class. If the <b>prop_name</b> argument does not match a property of the class, or if the
   * <b>array_ix</b> argument is not zero and does not point to a valid array element,
   * this function returns '0'. Otherwise it returns '1', with the value of the <b>prop_val</b>
   * argument assigned to the value of the specified property. However, If the property is a
   * sub-object, a reference to it is assigned to the <b>data_obj</b> (ref) argument.
   * In that case, the <b>prop_val</b> argument is meaningless. The component will then
   * store the data object reference in its temporary data object array,
   * and return a handle to its location as the <b>prop_val</b> argument of the <b>get_data_prop</b>
   * task of the component. The command testbench code must then use <i>that</i>
   * handle to access the properties of the sub-object.
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
  extern virtual function bit get_prop_val (string             prop_name , 
                                            ref bit [1023:0]   prop_val  , 
                                            input int          array_ix  , 
                                            ref `SVT_DATA_TYPE data_obj) ;

  /**
   * HDL Support: For <i>write</i> access to public data members of this class.
   * This method is used by a component's command interface, to allow
   * command code to set the value of a single named property of a data class derived from
   * this class. This method cannot be used to set the value of a sub-object, since sub-object
   * consruction is taken care of automatically by the command interface. If the <b>prop_name</b>
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
  extern virtual function bit set_prop_val (string      prop_name  , 
                                            bit [1023:0] prop_val  , 
                                            int          array_ix) ;
   
   
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the primitive data fields in the object. The svt_pattern_data::name
   * is set to the corresponding field name, the svt_pattern_data::value is set
   * to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern ();
  
  /**
   * Method to turn static config param randomization on/off as a block.
   */
  extern virtual function int static_rand_mode(bit on_off);
  
  /** Does a basic validation of this transaction object */
  extern virtual function bit do_is_valid (bit silent = 1, int kind = RELEVANT);
  
  /**
   * Assigns a system interface to this configuration.
   *
   * @param sys_vif Interface for the SPI system
   */
  extern function void set_if(svt_spi_sys_vif sys_vif);

  /**
   * Allocates the master and slave configurations before a user sets the
   * parameters.  This function is to be called if (and before) the user sets
   * the configuration parameters by setting each parameter individually and
   * not by randomizing the system configuration. 
   */
  extern function void create_sub_cfgs(int num_vip_masters = 1, int num_vip_slaves = 1);

  /**
   * Allocates Mem configuration object for each VIP agent. 
   */ 
  extern function void create_sub_mem_cfgs();

  /**
   * Set the Master ID at given Master Configuration object array index
   */ 
  extern function void set_master_id(int index = 0, int id = 0);

  /**
   * Set the Slave ID at given Slave Configuration object array index
   */ 
  extern function void set_slave_id(int index = 0, int id = 0);

  /** Return the number of masters in system */   
  extern function int get_num_dut_masters();
  extern function int get_num_vip_masters();

  /** Return the number of slaves in system */   
  extern function int get_num_dut_slaves();
  extern function int get_num_vip_slaves();

  // ========================================================================================
  // The following method must not be called by users even if they are public
  // ========================================================================================
  /** @cond PRIVATE */
  extern virtual function void set_num_dut_masters (int num_dut_masters, int kind = -1);
  extern virtual function void set_num_dut_slaves (int num_dut_slaves, int kind = -1);
  extern virtual function void set_num_vip_masters (int num_vip_masters, int kind = -1);
  extern virtual function void set_num_vip_slaves (int num_vip_slaves, int kind = -1);
  /** @endcond */
  extern virtual function void set_default_master (int default_master_id = 0);
  extern virtual function void set_default_slave (int default_slave_id = 0);

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_system_configuration)
  `vmm_class_factory(svt_spi_system_configuration)
`endif   
endclass : svt_spi_system_configuration

`protected
Z6\.>=)DD+X=Yc2Z5X6NbCg=YCN4&VF(A4,.U9L)&f5/7H=L2WX=+)#/V1O=EV&<
BO\;GMCCL+f<Ae#@\BTJA/S&C.KH81(S8Q)DYQO:e8)MAgLRX11OXc8-Xg\624[3
USZZGb?cAY4d/VQT@);G6[TCY\fP-NBJ-WIfTUZX=B/abU0+VJ8L8+R;Y8a/F+):
0ae(VNO<P8\1ZWSOQb\EWedV2X(SeG6bD,QU[C.We:U7^+-U#5U[6GX1W5F53MLM
WG3^>6(&[JU^c.bF:)Sa)/b11J3DgdMBQ-N0=#M(ZN#QFS&?VIHaYL=JR2T&[f4;
eXX=,f8\LM.b4@BA^[5UbfK06@9-.Pea1B:?0dJ:99V@36+g:Q?9RBTc9L>EPL&b
#H)d6.@#_QBND2#6=;U^<V>PWSf);R.dE=9FU2UFGQX5XVeK6Ag8Y>4Kf^dcd;FZ
bdb-\Y?J)0K02H(f>LT)RV1Mdbee9/@K]7E5dW^,a.L]PfSUF,5(WJ&?T7(Gf<Kf
a1X(B-R(\WU[0OPAX&71JfIZ&9gLG_Be=:.&0adA=I;+(BT@5U\KT&N\/@/gUPU:
=L44(R4K56RN1VR_@PfX;5G,F:d(-5ZAbM<OdLSOK9.)J^[&++:10QNOa9;IY7U:
M55M-eO/GENd;e5]9C<b<DM2EY0-OffUDP7+5KC?&C>^?W3C]]S4f8A0H&=Nd23@
c:Fc>U^[7cA#B]7@b]FHM,S#DXb6IS8Re[^K\g-5Va&aE]bOCR@Gd?7?HH:?@\.8Q$
`endprotected


//vcs_vip_protect 
`protected
/cfKbLN.dTAB1=Oe^<M7e:egdRgcQO=[CVEAR&3D@>c(/W=AEGUG1(g+@a<O41ML
TbN8DYDVAbf8?-X5R&7U;C^gTQR]e>BG&])/A85CcR.VB??3e]g5O=)BO1\KcC<Y
bce/b^P>U;A9<4d7OFHE0a\dJQ[8BXOWSNK\H#O:9ZZ#[.@=H8-1<]Jg7dCIX2E@
2BfN7?e8JN/2=F7f\8YVI/]X[DP240EcV\K1]>H]2X9.R3K;VO8?U-CLgKH^Z.R<
Bf>@CCUc_.O:cdN[0D=H7Q]VM=)B:)bOf,JI7e/(]@?BI55CU(NJY:eZb)7C+SU^
.<R[RK1BaFa:X753JY)N>V#&YD]YE5)\AG85VD>O2<-c?RZ];0,@N(,-\-M8-VO7
b>\H3N@Z3+c;N]YLETW\a+5MFYfH=US5-=b0cLMO^:YYPOGaFV/G:E/)8O=ECa&X
;R?f^?,5aR54O48U])5RT/TPE^dD?Aa)X6g01E>f5=/fc&dT^aT)&<>cVQ@>\Rg^
X=>6C49R>7gV;N:8ZSFgPKO9]KZb7X?UeRNWCd0b(6-1M_)eGAJ9[FNFYe30/[T;
XM]R1cK;9F5)(X+0f)6K16J;gMQ-4CC>\F[^NcgJ6+>8<P>G24Ve)f/&A/:?5D,=
/F7KDPYY:>]JJ<:,1F5f6N9YLf(0,;QC.C6AD4OL\b_NSPS+L_MS<[/LeLUMd2V:
F[JYc0I4]>67cV>6&[3D.JGHG42@:D2AZZf3Y\JegDV2:GAA7RgcH,N@WE?,9b:@
1Q0^K(d?35dK6BF[O[UeSYP<9fbJ.IWTM)f?Gg__J(>]U\XKT;U/WF3KV(U0]g&.
S0)<1.L)0Va3A.&YL1IEK=SU:W;EGe^W7,EV]W+4F[^WeW:_c8DffB4MFC2@P48Q
-OdL98a9-#N=5a^_G;H)ES:73d.Df;aKWAQP?c@BfEW1SX88d]I^INTU0@Z#NPGD
WaUJ;Yc1CM7&E9,+)L2N1,\LM&0Q?H>@]YEJA-SgIc@J:Qc/,=S1aK)0f[O-VCQ(
:eRXA)4C-.c9B7Vc:UZ&TFTb&4/X<;bE&UD5(Uab+#))BV<5Jf:PM.STa5eCJ#BO
bXT\6Ue_5EH3R[f,c[6EJ&&/JfBMO7]33X1)MUM@H#A3(P;F0dMZLa#MU:fKdE==
dEb.JJ_>@-NJ1PYdTF:]FOJ-d(c+8?:AP@8Q_QRe(<4Dc9a=OgCfbb9??->(XSHP
.[/b&L(:_:.YgGN.QU@G5&dc)\bFT.f^4UeIO(H>;XF:GT:)>S&/b#ZP3+SLCQ.c
dWK,g61UU<>YCIJ=.U(]CT74I\\;W#Id7@./UeR#@5;92@LU>2Q>FT&AHON,I?F>
ERcP;@R7Gc425?A5.2ZRHc.FG_))d>4V\_\--<TadaIX@A:7;<DCX9&9#LS(-O6^
CZKC>02B43UKfdGJSa#E=YJc[D>O.)Ne[P[L13?\bDU(>M;#9Y6V9.#.3@@],9-6
E6cR0Bd0:\RV-<;&?)]@J.)D22@a_\^TQK;7_11\V9Zb8(>?AH3.QK6_NIgV>Q,H
]<VZ#QaIO=:HG?V]+cH>^586SY^-]7<eTYGMI]B8f/CfDVE<C/?.\6f,[d)];9/8
2-=DW)1<61((7/QN#Rf[<:D6>4fZNPRH\6^>FeW=KUO]8N4?ZfZ#DYEX40>12]]M
4[LV[5+<NJ?1<JBc^J4&6WY<2<@ITSc>J<)N]7C&JcdQ+7#:/(dLQHKF-AN>;fKY
-BD.M8bdOQEJIN2D-_9/9FYO4UU)120T[8J6bK_R3JUPE]X9T?L&@MY[ZAd5gK\K
RY,O>)]\Z/1W7Q[807baKeC?H)3C1]O6((./?>9A-Q]+.XOTSMIW)Y1YJW?/=Ff(
5].MZ5-LN1L34IYLW9caO-bB#VMa2V#>AGD5V)?<KYJDIc7.\Z;=M-^,(QcJg]N.
6(9bG)&1QR)ZIDd-ZgA=:/S6M68B9HI)8VaaF42YMDPSfLKQ==E/_L2^08[<[.F<
1LID1EYI9:]>^+FU9WZ9F@a>[gBeIAZfEagH?Obb8f,+MRUE]9C^QY,+gAC5cf:8
T.R<F_\P;\EU]JdQFcfNCU(5.af#(+>O6H:T8N9D3I>R4O4bU6<6bP[9)eM#@\FS
@O&eg1Tf6-1dUDAAPRJ(D]1)Jd+XV#6[8C^_^:&R95@R+eGN28BA>_L1K03;H-OK
COU]fIJ:AQ,8,/EEUXE]/&4C)D7R?X9>-aN5Z.[]((/9_UcI^-XZR\d)K;YZQS(1
;X&F[9JbFP&-E>(aQ<TI^BO3-@^+]<7<9#+^DNG5387/YNU>a^VD:,M5:RbZR:KG
]GD@>d)I1,K4&J?FB[K8_(<QY4V^gE:LCNY6>W1Z+U.89&dA,,ZP5&<Zc2O1@G)e
<a+5;H1Q<8?dHJ=[Z@MBWV+CK0O)dA1cA7g>=JD1?;SP4Z(E6QQ;cV(+35M<_3__
&G->LE?aH8^\68STKbg+5d[gNXI\AXB^258,2gF^?_d?]J^3;@Nb.E,5baM\9S]]
B-1dQU]ZdQKAeA0H??F@K=8&^fJ0/SD@DTA10HN9VLL7e9O4^^fe7]R,&#W7QG54
?J;W9,@7ff#a8U8gaI\ZeD=VLY]6G(/BNTGb?V8&PMX)a8(,eJFLH>;]Y#MK2@EB
DO<-O^7D/:=68/KOg3,I7#Q3e>9;>^:c/C\RV^KGe,ReIWc2=F0<<1[8e8S2Ud_E
,f,ECJKa#VYEc5.DRD/38JSI@DVMRUR5+F.;VE2)C/&LA1KeBT6__)X?@:9cY>UA
A3:Hb>;WQ<4G=V[[3b):.Q9Q/KS.Ie>=/34/EcD7MM1Id+CgDK_(Q.^PeN>0Z+NN
>f5;WMHPYb]^U\YI:_H?N&[QXTCJPS=c>]+6(P)O15KCJc<(@89K[@8Ug[-^YF(+
\dGPTV=08;LBZO,#^ZTUBPVdFK4P(c>B9gCS-8,<>QSQEd\_^Q)T;@7\+PX^<-4G
(W@:F^:5a1T/H5::TbH3HN,5P]@)bTcH#ETF=(#65W<^.?Lc5QQWc1@ZIK<Gb25;
\J-]X+ZDXb4]12BR;dDI&)ZWfGgF\]>DI#^@;;)bXc<QYNfSHB<)-BP.Q8]:8CG\
dH.]3AQ(](&5?=>/0Q+NB&XI[K\TJb:8]VCNS?5@.IJRH\@T^_.WMH_SgO^N1dXa
:5;,EM0+U25I7CcPa3Z^KQfa5B4-3AE9<+-cM)M:1EFB1PIGW])_:O3_()T#OFS8
(_=4,f](14/cY(SYI9AaMa6TgK:8\LCYQ3VZ8]/JBcH-AWU=dY5-U3076fMIR(2H
#8_bR>;:.Ob>;2OX:GC&4_1E=fD/]_I#P.DGH#[TU1SR;Y9HJT0-5;EgV+6XETde
c#A,D_YZaZ6d^?_-;W+64f50TNVUT1D?[=R_8Fg_+T&]N.7.,P4Vc6@9Q-#H;:-I
JG21ba./e6OG#IeT]K<#=C.T-?B-YT__+))S#MK_E-?gLQ/;df@E_.[a--H)(g<+
ZI37FYC@041&S0a#f9L2S,])4WJ<,_cT^/\PRGO@Y7b=OKQP6RVc\?4LGY4ED&a&
:RcN6S@GF\\8cZNW.S1Yc6fGD8L3#NL?f>^^NaLP]QMW52^>cgIA)&J6;(aCT9&+
B?-_@gWLRRG3,99CSQ=^UF.61EQ4f&Jf;?V<F>+IPTU3>8I&6]2\8db2/4A_4_)R
d_eB\_@-G;3G9FQW=C1a5CBdF=RD@S[&7TbW?)<JgFc\OO3Ic6Te3QAfee5XT+K4
Nf70)gYQ>IM^Ef)4KY=AS>L?d2^eKdf,MZ1=f4)IR97b]X9RUX##+J_e[<<7SZJZ
3N2H7_X@-B)XN&P?(QX88^6R)UKW71XRcA6#/dH:NP592D.KYc&a;f9UJ=DaR]G4
UB>CfbJB]VEbWfg+APFR(^[H?F:>1(S(79H?7L(d/Rc#_.G+c?.VU<FaJa#,(@7]
<0ZQAaY#7NM=?d2WA,1O6L_+0O;XV>1E^C3RbLcRIZ41#_OLGKaBBWJgN/QVN-L]
FEATC_^V7XHKIgg(,/\g.d/gXEIeC^.7/T(]Pec+ZX]1e87a+fQ\N[,]YW98g>5P
AO_.X<Q)Be^JU4_00NP:\a.&V)eL]?+];g+[I@3:8LN37g-R8A.Z/9MTL@=V+85-
;U=AJeOU?fLRO-^T9RBaOPQE)<d=>C;JN:(g@2O^H-B4,aHX[f-Z-b;):b^^CPf3
]gcaeN\L>T]Te7&#D.8S7PZ/aMXa,4MF^_P:N+]Y[8ZL[,G(bZ](IK<V,b-&)dVU
VP3M/P^N;1cX[R@M--:=;E=?RQF.=DUQb2BX/Z6V_g[/66b]18HR&ddW2CBVDITI
<W4ef=D+GZC7KWF;]eR7G0P:Rc>X+AM:2fKcdQ/.3M+4AA#T#3RWHG#3V+-X]XE2
32;2dKKQANZ=[LD.]-fUY)TE1/9+?;_)Edg_3L:^f8G[OZ@1K<H952ZX8;V88I&+
GBC\_1/fR:BD<g9=Q9(VI?C6A>I;=?O8CYGEK^.?]ZfCb=EPE?:L4eYL@OdcFC<-
c,.6K>b396H_MQ,2:AFaRfN+cJL2cG]9DGc.-Q,[We-1QAL23E8A/M]?3?fY@<:F
T#[E8EV0[4.BA[906S>,A8VRZ1EGR=?5VXe5+942aKWd@OMPF8Y>72>WRcf1)OcU
ANDWSPM7IB4,cIb-47(\,G/3^P\\0-LM9L8AN=W48+,E)M(DBc.@^<6[I.4@)A76
Qf,Y_G22+c?XF-@VGUfT_e:ab?TaDWM(;,Z_:V&&T;@a]4cJb=9E:4.TDO,J[VYd
S=f;^=6fMgbZMaW)OdP:3X5E8+^K?Jb,UWG/U=_^U2)bOVXA7>4K,L,Tg-BcUT73
TVN,V=YSa+V>:Z4T)M:^W^DeNW8XL3&Y81@UCU\FQ;]g0OD,01-I@cUO@c?=0g#=
ZJ>A2JI-UF\GXVS?IP(_+G=&P-W9eCc)Z1])XGB&;E@<N^I9dOX1(@H\?A&C2&R\
4)8UM3SD6fN&I9M::O6=L>IQQVUH>aAgSc4Z(R6=Q5FC)a>9@K0E3I>H-A6^dMb3
f9#(;D(V.95C2dID6;X-U?FJ0JO1_P^C6Q86D51bE2G+:f]-+9NA&>0G@PF3\S<)
Pde^gMDL]@L\4#1K.65CF8YWeV3<dd/5Qa9R(C7>O6T&IGMCG2XBa7\V+61D/QI;
2W3^N<J.d288SL,aaQc7YJ@A5>>2gDF:c/&Ngf,#aGCX&JMDEOb1B)X;g-;,-JIJ
B0>U1?POE4XVDfX,.5\+,=#\N^Mf;dH_@9ICRGC97a3CF?f7a1E<ALJ4f_G/(TdH
d@5Y?eeVXfLLQ#(5G8+2&&MJ9T3b&BXPD53>V/.\Ie\WX_La:JaCT=1B8GI)NgDW
QB+Z=.=9)@?1>^/O4^_dJS9+6MSZX#g5:4HT^?a7N(\M.4JY2/ce6BDJd?_#XT@1
J[X6b1S+J/_SfP1]KfCGTH@CME>?)YdYb8=,PcHK4X_2_PL5\BW2-=)K&WTcccJf
/@YQ^[]T@>IOeQ9G2F;JS&GG8Z7dIF?V7?<g>J1<G&-\PN-.7W/GeOXS-R,#P0^D
T&5?a(>XT9PX[(I\Cg&_25/3RV6_Q?,_T<4N=f(0bDG-_Q;L?GPIH_\XQ\eIDAbe
>/VfDHL<16XB?RFM6dD3#eZ-W6bCKI>a-BRB+4_3Rg8JERP+?Cb>^5]EE6UJ,F\?
Y^N2Y=b5L)da558\3,(Md=8Of-f27C;F?)D.)3bLbYf&7CC:a7=bd<.PXI0O,_EG
/A\K,4]J^;ZG9^HR@E-5U23P<]9LZWNAc=-U5@MV)C?5,=O-6:W5@0+P)C^aU?Z[
^49U5?YCF++67DS5?(P7YNQAZ?/850?IC?8;8H(DZ)NF2JS/9/P#]S:aGg.>85Of
3+,EDVGd)?DHbZbeMg>))XZ)J#+Z]^fF?QF<G>+X_FR>SA<X-;:^bTZI?9-&ZdI[
<TGFObAfVLMaZL3WM5I0&NM[g<^E&[[)^1,B2@VdII9+<(RAg7YD@\0GC,Qb7=_Y
.[(Y->VWPC)J#6O1R-KF30_2b@Q/:,4LQeH6RZY)P^\6S8T;MXeLNZRAV0,N8IbN
\5CU>QYa\U3R[CVILS\9NfF=Z;VTWfY.db7G^273M=D7U3X5CA0e)<#EdM\J@+b@
^OA5OL:2@NCV[#=TP5K98NgVYAI<XW;:<F>feFW-5=BE<)+cf?Wee#POE&N;0cO(
:XW@,(.LfL/W_X[bc)K7OCMV4GYc4-Xda97XT,Q^DgeI\E70V4PXY@FO:VZ2ZDW5
&?=+)W^X]<@46f9,Wd\EH,RJ4O=.8KP=S#W,>:\/6a<U\5X6WL;):,RY)STf]EQA
[X#T+6MRgd:b2Ub>N00FL]#H:c3/.eKB)[>0g^?RN5f(NFg^#;)R69YT@c)AJ==f
;878BO<T7E-NHfIEM@gD^_Q_D)MgJ(cgGNI]+TMMR3[[0=(1^?KOfI#g+gV#;ZQ9
@4ag0X<@-We1]eNcGEX,FQSN8=ZBcFY[0L8^<13#WX+664MW8@(@NWe&U^9Z^A(R
E\a,HT+;E^L](SG3HcDcddGLdX3gRH)<(XK+bN571X=O:0<P61::-7:ZdM(/fLb[
d)TH6KMaW=Na1(fcFe):DK(U>,I8T4LN1:_WRR9+[T8::L8I9DgQbf&0a,>=\GNT
8A59/eI8EXf0-R2U&_.TW[NL:EXMSeC^b#7bEDLa_c\7a7R@])CEUg]AN+Pc1Z+,
54;F6gR/BdW(+Te-D\121R1(>CPD.G][@)[?eE58P/GXb05].WQ9UZ<6FVW35B^T
N+1I8#=a]_6&(Y#Ib&UZ>SEOZ2a+:69_]KOQKX=^.B33[]E00BgE=7\bPF\c0J=?
-bI7PU6QS97RB>1_0:HYL3.B\2=Sa:FCgT6ER8b[TH8c^_/:GKB6T[AbVU@312f:
5)8[8&U,:3V8#M<AacSG:[fH.b]YMD;/5:X75^d4M\L-BU#(ZREMK>(=9[aI^F30
4cdWFT^L9U\HL?B0W8K0KbGM0UVR(:-^>NQ]TR9\gP@aM#.5J+:7@45^#6R=#;I:
(C1//JQB3B92LJ:R7@>3@3G(9QV4e<faP/?:()T-a][5Z5(F8QaM;4;5()4bU>_Q
;\-E&/@Pd#1[=FR/]>0GC;J^Z(09IMfAgYb/f:R6((f:(UBR9\0N].9WTP=H7M4M
;+O/A19&1>c+8\1A(E>b;bJ,-;1H@:A0QaDc-SLf^aHgE\]YGfO[b:^#b?]8LD-A
YZDPV2,>39JD;8_>2)M0MD+\/KfQRMIX@IaYY\GC]BN8VC-g]?BY(IN:X<<])5FL
XH#&Y26+9.^2>JR]=FDV.V#b@C<#_SGIC,955FBY,SWS@7BPCLLI.[UHYV&\YQW@
D]C?VC;baXL18g_bU7gEXHb9IEYf7FG4H+-X]T;AVHHN79W[Y5f1R-[+IO\4U;H)
a;bXHM/(3_66GNC27-98D[]6R_7[2#d2e-)(g;-TE+IeBfTG0bVB&))gQM-\@MNN
O>ab(>RL-Bb[03b;CV+bJTA1]c1FN:g40+8:N4fZTU?1d>N2B,E7CQ_/>^_f^OS8
E[3aS:(6D8__>3<Fd6&eW@#U6aYcV#)N=U+RFGHa]\]1(BFe;ZMd\6\U)QED@\2,
(9V5BK&-[DRBJQdbI&KROF4\SR8-\6>T7OF;:8UZaaD,#:gUO@=+R7+EI&TdZ9)3
GJM-#4-:GHLA5?-MCbG?]Ng@1dbT(eCCJ;KCU3;[A2AJ^X6[<AND+F\gNSM).g8c
aH1IXaA@UE_?BTJaD.1B+)TV1VLPL5HGW-1OIVANNVdTEeZaFOYd.)\+V&?=cC0T
<_\<PcN4Y)e-4_a7@KbgCWK3d[NK(UfT#\&Pg4=W;QO9_/&EHUXXe<K6^.4K4fA4
NMS[2@Od7F#cC@^7MOc.,L1QEPB#KL2)aVbU,2>L6O>JB3fTZ]#MNZPFHe;=,CKO
CW=BR0Q]1ZV.L(dAdOOL=D@V8._YHK^5C><5WgRXE]Q\R]^ceVZAYf095TXT6Y+C
XGc[4@QgU?:OcYV_;FF:C2-b^bD]]U(7b9b2<9)C4gXMYK7AUY_I)C41TO?TbP>c
S/1aMHVPOX8X#eDP5:1Tc1#UcF;DTb)]GTMZI?fU^=8Ve+[\#fe/L]-ER]fEea2.
FE5@>I/Z1(U8D4XS#e@f:,9JAaB8MfFg;87Xd?H5Q0#_]3W52e.E;g]V8PZ+]d\9
#+>eW9+b^&K;Y00CS0b];[g\(J#E=DW;Uf)TFbb@RFV=LP#&\8Gd#VC.bE(7G<T,
aD+^GN?YGQM8bI48::3-OI?4X5#]fCMK;_/72/</edA#5)>C;gT&O&dbeSbS,^T=
=<OSX6O07.XC:fI[<WV6@Q]>\TNKL//B)JHQ@[9=6+>3F5V:IATAKTDf1BM5FARF
I?74K5+gd-^).N:HZLfPN:J;/2bePaD&G49H.C#4:OI@NP5>1TEM]ZJg<#XO#@,B
.[LY4OPD_g4fU3Yd02WS0&9?-3YGI[88bMX/Ze(addFKW[ZYD;d@6Xc>adSD=e^U
@IEfa)N;9E5=W2,RB4K=X3X]<K^<7GeM[3YRg\:<\ZaT^O#QPe^+)+,g:=R4A8FZ
a5dfLb9GCO8.[BdD1&HF;5dT\^JP.@U<L\)d2/=M7D[BbDS;K[_8EIW?1.+XRY,;
+X9ZdLa:.5S)a<.H:<WY94#;c<Y(\>cEU7JcN3D&>-DST^E<C:^22#,6TFR5R^(+
S/@:aV<RTFH8M07UW[M3FfWP+W6UV99_Q;I9_.3S4A^ORc;aM_R(STN_;J<=R4(,
<4gEHR#?4bVMWg7,/DQ1VLR76WH0]^7P.-O1Q5G]2T78fbMbE)3/F+[&+KG+_CQ]
NgEUYX;+719)f=9e<,LHV-&AT+0]+5BB@4C[:ZEVI5.Oa&9:/@LfWVAQ1dQ-+b7?
#TALAPDLSF^+G=)?6)g:3bLe)IgZ>OU,8c-d-=2dY+?CH.<YAL+QEM9;c84cF)Mf
J8,48M(A/FJ)0gWa:_fPUKfG_=Y2Y3,+a@I7Y+g60Y;)YdUf;A=;fU>V2<e1=\UG
DC]1e<H)59PAZFPg2eE-9,R#6cP_Q+UR0/EZO2I\B_<ZC&TN?7Mb#F=)89)O78.f
c02?)8#Z7DD\4AgU:]VK;8CE_Q?J&OS,\>0LE8F.EM7,a31(WfZgO2E<N1.Y+faR
Y(<e3708M5XUKAge]NdWQ/gZbQ02?SV>4a9I+UA64[H+6NI(6Cg:+ZFM#IPR<I7b
^b?C0RC712bC@A2E)\GPfX8255bTNU-2__Zc;=3+2@<aL_V(3<B+&04P1:OH6MXE
,K#,_W^:3ZSc9+Z+OGH6DTWW_\.1aLT,GXG(GafAdRU99T.RT7@T#6)9&g/KV9=4
fS=]/]7eJ/_b=aUd>W4M(ABP/R9X[bV6eV0c(P.:d-\gNN--#dPGSbD:7/0I?///
W@A-OSM-E-.J;;:;fJ9_DW?C=(2a\LM59b9K)5Eb5AN,=D^]ZNV0)eX68Ha+?6?H
G3Q8,GL1eC4fWce<THeV8HNeW@+PRV[0ESL7<VdgJ<P:8=e/PdM/B5-W5.c<[[P-
T4:JU-GLI\K^_N[/ZP4V\@T=c#dZ5QSJHMWJQdV1a_EKMeQ+9I1DFSeUIQW&FOS<
ZAX8A(QK=0W_2?C5LK6.^O+g.ccSfT9?gAXFO)-EO4a]V=e(R:W?ZGYQE17VbKGE
N6b>Z.]5PPQ0<_A8PX+<V&AI?A-c;N[K@+IQW,Q_Q2K6T3E2\X@6a&+,R1Gc#--1
IZf(SaCWc<=TedN;Ucfa]YQARXW77R9c5dgB>@Ma@#HWJD5&g2G@aVKX3;7HW=[^
^=QLaX(><L8b,Q38B/^cMdHIT1_)+Y8W@;B#9?Ia6/-5]3d8&bM3cWI79A^[Ue#4
3F(b>O7b2,7IYRPb=a92c6LHJE?W&M0G-D;ZfV65#T@8W[IG80B(SgHPTD/07g\b
g.SK4OQ+d=DU3^bK\d188[,S@^,MZI)+9fbC:=>Q[L;CPa4.T3?#Zf6;07YJe[Ad
]#RXF<=.F,0JXdPT?#A46,2b,JaD>=P7bXL(<#=+,7A>CD3&RO?L[+6e6(KcJS80
[fg1813c&b49Sa=XG+QKK_(\b#QTE;(,LPUXN]Eb[BZTPY1M[:X\A-dOa;^GI:W(
NN[29G=YS4b5ULTRPZa-dF[ELgJK,VI/SMfW7)Y3\d@d6]]0_+#V1JU3Z5-ZO--A
.)+C1?:Id[XTTEQ;_K-F.7=JE+UDP,a7@W6c&HLW.@ae+06)&]3fI,_XX?\;APDI
@WWg++dYR;/W+Zf#;fL>BYPOXZZTeGTdT+Bf)]V?TaI=ZKE^.L=;]&OAe&dG?5C=
0-V&CcHU;?X<.\VA1b.f+3(_@.KV>#=JA/VR3=SD:ILIGbT_/.B[;.6M5?UFRWVM
ZNHg4\cd=PLX3R2SUa1BCX+eUH2.P6IX>4S9HLeQ>2+#CJ]8MEJf.?N_RM),IfYe
4[:J-_>]>JXT#Z/TK;We4-U.BN<;=;=2Q=&9H&<1X[6W19T8dgcBAe@5-VT?U/cV
3c,7,L;?XR<L@bWQ0:1&-C=[4gWGTY8XaVD]f3HZG@Y3TVO@J[^SADKaFed(ce[S
Pg=:R#4YO<0>657\(ABZL>0M15M.A6[W:3b51+UYQD#JN\aOb;eW@^:=50B&SVcE
9^c8@d^H1^]IXDQ(c:F1G=8c929\;a,F>ZXLJgZ4^TGX.YH9Y40K<OUbQQM:cJV=
E]ET>9,9CT5;VOFJ[U)QF+a;L_K2^XI?QT(I,L^FU:SZe8T0UJQOB@UVI^0&NdO(
5YS[3,\9:)L3YGHR+08Ab.OUc>N8R3\R(dT[FM;_gC.#<)402)W5:D4I_ESDYL2S
HYP@,[=7[4OEe:\N_LJ^[\M0e0FfC->Q71NdHE.0X;;W#9T[<QA44<gW1a@T,WRI
]+O_)8?=FU=fY)OgH?d.A(c^]\g5LE@J]8&H&NJ6[8b#R=UaR;MLV.@)3U8GS6<8
\>]1U/K#PKg2d[BOE]_E[P9.P^NVF4S3,8@S>d[\RZWWQ:BgTL84]+X<L.0@?Se9
3\[ELC\&G.9Bc(222IF6bX.)_P4+HZMB&34EY6NfI2H\A+X.,H.;,>X:?LY,PdVd
H<N]:99[3P(eBGE3aC=@U+V_EV;d9(=CN/A1J,@b[2U0QAB[]Z6H7?M;6[22Dd9V
O?2,.6>@Md@_(=#c.SO[[OfC@@cI7X_eY.1+)@cBdW+b1.X1JH.;QXGcNV78GXKU
/U@(aCA0:_J/>3d2d(6Nb#LeKg;VZ\-WJb-gR=,PTe#+9_2e;AObY\ZU7I3W.1;a
W^T(6.H/XPZKOaO&f.H-R-JS#HQc/<3+F:dMX49?+g41L7=X53K1Z+5J_c8TENN&
S2(M.^.BJb<ee:A=5WI1Tggb-eEK964cdC:ZPRTUFD@D>KD05P1<?,6HB7I]TUGN
^80AHN0PUHS5MVM_ca7Z^g?2M\<3NG\R35^1LXeVAB--](a,/3V6=8RKEBR.2TBI
R39aI<QP3C_4-C0?.Q#/W7OV+E?5M^@,)f66+)3)@OU4+#c#WN@O/I&]CS-G27;]
MYW^3K_\;\<[.Fe]^Z/X^2_Q4XS@>4T:XFUL_@^VMK0S9d\cD=D#25b?#fOY,<AS
\=>eHXFX(cd,MEdO&?&S0^@_=<c]+\]Q[H0ZIW]N1C9:\F46@2+:3TbTBge.9E>]
_CQDT-DM+>A1UMM^.KC&SdfLF>)7#^N&eV8.=f:NF9N7GLYDX0>e=VAD&-Ab.;(@
]SBI&<gfF?/A6I26R.1d&QNQUSb()?&^Of]AV1B>]137:.CX>[..1<Cc4AYYN5g;
F)/NM6QVA6@,05O[/#e&I/]UJLQ??#&E1(.3P/N.@)<cVeA2+?bg0;e=Q@1<21g+
EeO.0HgH6+<_Qa,5L09<OWb;&7B=VWa6T_AS)=YA11R#4<&?fI#F9bbLE9IOfYSV
LE14V94.NR8/DbbH7R&GR332(Q)X(=HPD@JfP<b_d5=<)W,5DO7aR[5P)SV<\bG0
C\-YV8+OD:U,I0MaYSEPR,ES?g1QXfR37(YDYWG?]M8eK?\ZIO@\U,?-/)WBRC.V
@2F04a/5#)K:1cX]2(]0I/0/8>2B=4(>9C>RT9>@QMK69D8W9KNG:#aKS@BXKJ];
7)F(C.V&5f@AXUL67+9gdD0.JM)JN?(XK8QIZ/Y-XAI9M<a(d(J[^27E;=eJ8W55
9:LW+G6g\CS(]]=YMC/2aC0KXM_(]H;gXZ@IT>Vg5?86R9O[+NE8WLB(4e]_]W>S
NAP.QL<,M.B<V?9gO@88U#RGVeW,CX(c:9G8[:KgH_;0H61XUHd,?:Q[VWM]7G-@
c<5)7VHS1KObc<b12&g0.#+dO_c&0IRb72YWFUb\B2,K0^6EB4?A],^>8Ycg84LH
;(.7RG<D40-^NXWNKP/XC-N9HUA5gQ#&d#d4[7,=cUb6:cF5_GZV;YD[3MUeQ<K:
LC/cdOXf\\>V&G@F6LING==I9Lg1.^PE[]g1&XEX@G\d\f@CE2?;g=CdW7;,F:ZA
B&63CW##e=3317BC9QR9g<=I[eDD.7NOBf]7O9F0aWa3(&+6S<E4T[/(5HO(bO72
F):?_eZ]5cFX/#OD+7R\@]=+(A9DTf-#U^ZfG-R#\\:W5:f5531-005E:b+RT-=+
)2@FJCS0N#R7]HGEB\NI5-)B;H]>)_X2P1F1_dNOX<c4I0^:1I\R_<J9Yfe]]TbX
dSA;&2c2/4JQc5>>Z9YY7#g-2_?&B4We(W5f+3UNJ+RLfeQ?[f&M(^Xa7gF5&F@b
W@.2dGe)\:0eeb_cM&.(U/T&2^VH\T_7,(HD1U+8B5Y>+O^Nc\SBC&G-^SY9?61;
L\8bB.S=AXR.Hb\-eP/^C&VJZI<B=43:C/_5>5,\Q?[\&YGDY?(1DT##PeF0_7aY
g?LbZ?)O/@aQ=L?dDe:Vc\4PT7F88>(Qf1&<7M(A1\O\)^27DQdB;[7YBdVb<Y0B
_H<=WGWH@X+GTZF7OE>73a8XbG.1[+3SKcXDbC\_B/bON58JG[_eDObOF)JL.L<1
\TZ@bc2<TG)@:e\ANI4E]SeRId?cNO?5NgA=_F]1.]MN1C-@U,==RF#3.N0MUTTc
)1<+Dd@[YHe=_]Kb8?6>0SVY\^0Ode<_Z[1UTf5SL_3:S)RB]GfU,[=,U#5-C_9>
]AI3,0I6.VcO4,Y17NP[+NDS/@1F/G+F.O)8CGHQE.+.NM3#dg^7OP30>4F8=68:
N:]W=->:cg22#RdDOF1B-/9A)GKD7DF1:@A=#9L?QeDMBE/P_C[NgcV@9RR8#4O=
PPFBM(KH:T6NgNf/S_@RJP:<5a-8T)YfL3JO(&@=;+ee?b5JID,8LE_6DQ8AH5M5
b@1K2O.U6A@+dUagO4=W#5:+/[9LCaS/72C##P,4GXa-_]TJGg5DT/K\\OcBSH?e
Z.CP]M[>e6Fa3=fTc)1Z7ATg2^;/Y#AND&PX23=?8I^R+YJ=^aN[E,gH8c#@a.^F
H5fHMC5;T#4>fc(Te2?-8g@K6a)>&2Y\_+O_[>3]69Y,9UE+c,(VAA<=XV5;/R8\
)#.fRW]BYJWZcE\,&Q<dRK8BT)5^WOKYVDZHf_VVf^eIB7Re&U>H#5V-KbKdg:/F
c+7G_,Ka3T2\<Z5VgN\58:8U,Q+BZ?;RfE1O\>egDQWBYKNH/@+R]Ef-e;a>9aY5
_7eP4R;b/d7O\cIT8](083fHb6EX=SH\,6;gbYFQP3\f;52:KYS7>O^MN=)BVVE9
H/M#-F(4_]JcZYB-(&aaU]#5WUU.4E;J@X5+]1Z1E.MD\4@-=BVCeGe\X1/PJC7S
WS_WU8-3T34Z2Ng6H5=e@:7VbX0(P25N(d+Q[b[1\+RD?Ud\/YCJT3KQcaRR@[H@
8eK5+^]V?b&@^cPV1Y95;-WbB7Ue]FPQP,[89JN+<4L/-F4^d>8J_MdaJa8be9=R
:A[I48Ka;\VKe)N@LK_QP8RIES3eE)@5OC5cMXf;7N.I73I8:aRbM:]=0,AD#9:W
/PBO/]gA_,WAD&bEbB+M)4@1F9[QT..K,XI3(]e&4D7;+F0N1PU\00YIB/g1)b6#
J3)=SPVRYEE[I4&6)S_YLFM(386L1f0<YPD_.3WXYE;(@W,\Q2#^W3^NWX?QEY&R
<M,bW58[&;3;GFR61#aIGDRdQJQ#@H+d5\DVY5UP>Z+Z46\d[6TN=I,+B#HdcQA>
9T#ccg#UeMQ]0(0>a.WGM=B5L?gQ]#6e<.[Z+>:<d@ggXU-21R;8]J1O4bSJg<@c
&F,fL9Y]Z.0(74\_P)M<#7=Y4TMH=eE@S:?:[]3EZ;.4TL3=\GUMS5=\[bAUeS-J
E1.7_ceK1,<E-XO?;:X1DC(?-+B5XY)UU1B@OK>L#YAB;De\MQL.:Bf#bQ78)P)#
U(Nd=A+8fCI+?bSG/JSRAVW]T+>JS@QT2KGA\=P>NY(@A7Yc-]bY,3[:B3gSbJ+P
P?DAD<2+cC0NCSaUFV4JY9,d)P)61A\IK;WBWg3V8Q<ZRbXV+[,HR:-cFe3X5(Id
3J_1>+SfU8WA+X1g_?9,KL1/S6XEYe(_fCX_91T:J.I;Jf:bO&J@79T=W6M?BQGO
/F4K/?Ud2E>M;GVP_aE-f]eeV;aRa/3Zc^(@N_0R+G)[4GfO^gEBXZ@Y1OI=7D+a
YJYE&71-#1A;^bd)7SH;WZcc#C-Idd]URF+UA;0_#J?MDOeZ0\LF=SaS1Q3g3]F6
7Dc+@-HR,46@E+5KTLdZP01O_&^BP_=2dQg?G,&>d)?01gE7GA4Z@H]P?@WXb6VK
\a+6PGL3GWg6a8KaQA)3BQ^5BMG3B,S>@/aHO#BWd]EL\KUVP<:5)g)PBMI71NO7
a^U4SUN_N6^(/Gd8a9VRI:KEZEfOXI:0<dXg/[99G8WHNIb&eV65<If,2+^RH\[L
.+RRUdXQL<<PLad19F63]XID^Y^HgT[D(c3J:@Ca>@BBJC3\:I?7b4N:RMR<[.A(
9PTJea=L:IJAAZU]^890@/CLdJdA1-X9Q-cNE>3^K[98,^BK;IVXZS+YgV;XG</R
1[:f9:?AU13+cR@/C76d;7gOB/7e?dU>0PS3N:;&C>\4-0NTEd].\UPXRCd.A,)3
J&M-7)49\g54g[&c&OC_RQ_QcI.T[380(+]JUKaJ-cAYa&2/Ze6=P4T\^/XQ@SNW
fAURVHL9e<=U1-:cS]OWQIKHHW4[,g=E7b]-&HZOI0EGgYKPF8LB?V&Ad44]8-Jd
L_9J47eQR[?4_RU8]RP=>8(DP)6MF:<<B1IN+A#(_.GA/IEENRXMH&G?g;//B/4+
RG]A;&cbW21RJ)]XUA8-T<-6fgX6=J10UFB>PV-(-3;IGI<fXODFW=]Ta5N[>,HZ
a[##?VCeUHdXD9T4IPD2Y)g?(VA=]U>G?FQTT[Q3@TF9VJe>JV@TSM>FJ&ZU&?Ig
(.Ve4R7BT7C2V3bK-U?CfgBGNbW<YVXF6DPE3W@g,3>)=U8L;C5=GDgQW1gHd5&[
M1O:P/L+SL_RI,g:MA9NP_IDAJ9RPa/U2/R0H8^fabKDXHR;5/-S[)M>a1ZT@X#W
XRGdH+AV/86HX7]:R)ND\&Ia_+W-B.(SZU(^3>?eTfgRKIS8@e>S&+8E10&T-]dE
KA@^:Z\Yf821:bddaP_KdGH@ZC99S4D==)?-^)&.I34GF:]><IHA,>+d#XGd1\04
K=3\I3.ED@\4b+9PdWBd+(78LI+g[:W]A1L]1ZHT,dS+/.S(O0BL.4Y)45BgJI2]
1@.84Y#WAA[:J6LMB(_f&N]D2Y0=g_-RIf2#XIF99FE?TOL6:bC&VD31_<,aCXCN
9N@:VB4bSHL7<RZ6e7e@c.N::[a6<@L)EQY\G66>3+G_Q7PCFSSH?4C@R1FI\eMA
M#=J))@FZ_Yd\D558RH](IX/K^_Og(Hd0aYA[)b5a._]1T[1gR(X_]K\UgM7OID=
HG)LF;4,a]J^f\A.V:-KXQCV_/JVXM?C48@Md.&PJKTY.4Y:gKY30M(:@@;gA^0K
Q5\1d:Me#Aa098O>XUgI<;04H-X:bUAg\_=H9BX+GV&cDgcb6fC\[cbVU/@;d#bC
a6<8S[fbS?d<GO5J[1/5F\;TW[[#8;FJ:E6-(WC+#cJ/,6DE>V+&3_#J?e[F#FM+
B+O);I/f(Va[L@;O@2[(N]EHUD3IPega<JXJ(@D@M--?@A>+6L=gNPT7]Nc^F.U/
aN\92Fa9T2RTT8L8=Q:#Y673Od->5#=SGd9b5D7=U]e1,-E[Lc38ATV/3aI[;[aR
T[#R]@YFHdV=Z<D<Z>[YgON;P7YYe/<#M8W\M+P,2/U6;<R>0B[0>^&U>e^Y.ceS
b]/dfJR&STAL(LD5=+4<>7#UM(W^6T:#UG^,[]A=&)g6Z1KZZ&3Z6K:>?(<W6bEX
,I5Q1f=-DCS_]<?JW-WAeI=<R>/e5Q@=XaP@U17^c?R::A?A(Y;GYABCf#\eIT(/
Z+U#PJ&e<0,JT1\HTZ[FVKfSWY_U@J]/[a=7c)H+3[,)M0Q+^46KbA8DccTU\1@I
8<P#^[UN_gacNR4-;_(SP1QO_P5T1Jc^L+GV]T,R5bcXag^C-bFW^BN,A0VbHFJ5
Z8f3SR#GEXJd]W<LVa-SF(^SOQ17VG>BN1M,9MVHeOP7b75AFL.#@3DX[DgdQ&gN
X&#cH=1=dd+GcB)QQ,2gT-E)0_0J>7[E@(E6WYDC1J/3^(0\/(TQUe8+eGe1>d)?
+<@5YB]4DO\fC05f67->W><3BK56.d5(PE;YL4QIaI5@E-b\1D&(>c:W,JSQ5&1#
OdYQ,Y(^F\:S0C>/3R5IO-0A0+>bXM>QMN#EOK[I<ZFQc/^9>0<bS:Nb]-<0LT2@
(\ab9QP]SY<-1U4A\=dG4+a;6(4W(:6=.f;gc&]F)@IG#S6Y/UJ\+TYRNa^O63Ae
D9BgQYPKFe7gT25MFNd1UcZL(MO\?9Zb7?Y_,A+Pc[5E.J6(;J7QSTL:)JM-G;4K
UgYDaUM,C9Y&(ee8L6KfJ>3Ra9.)N,KMbT;Q]d<1:;#CI3X:;E=W1f=e^8H&4&a:
\Z_9ES]67QGAUf:#O8F://.Z.GP,DBV2L:&cA[Xg\_b2YeAT+V[32A<-E8^7R[QU
0QWgV0e>W3[XDCGZ9+VMXgG5I[C1/UGa]#<:dY7=YcFIHY)5^X0X73C^Y7A#/3=2
_-<#<Dc6a)/W@7R-?C?W?RT9GRS=eF>;R[)R23[Ob<=NZ0P<[IOA=#WP,^0-6D_=
Y&A5M<\@O<LP],0dGLUNJ]4ZIVJRX(cb>DT_77c/O\3Sa.D4K7/@JLQMJM\V&-#4
,CeQP<]6RUT2e\UXYZIg+&2>aTa=_Uc@>AQU4D_F[=O(+eBV]&fU^XGTG2L=OQUQ
[NcdE+G>3FBT=A4gJ>K_EBE>TBULE[)8K]+H3W;5?M5@QH4U<GT6^U-W9HP]445P
/SX2W/2#>fN^IP?V+5gGNb@6WKI3bU13?G(=S05:U[9:;Ba1@M_7-R0dN^I8?0)N
f>b<OGRS(M/MJHO+7((CCKKR<,1#Ef35MebA^ULUA(4&e/&V0[e0-]JME1O=3A7Y
04[)ZZOE+@_)6&g91YV_@VYTaX[/ag98\7-K3T#7+TEKdaO,IcN<^=LZA<2fKJ04
:_)DRA)(3==]5a+=D=H.1W,SG);W_K^5HBJ0)<;e63_/_NeY6E0M)7SVAX>aU8O4
+2GC-dS]J/E(;b=.V,d[8WOAD:\[]_HZT1-e6c?fB40)d>#WT@,6dK+gN+H27@\;
MVBV#@a^(98+dG8Z]&Z>BJ^a#Z(3DSMMUT/PS85D9#W9O)7FBaeF<\YeKU3WIQ13
S<1OBH477VN]HJ3LP>?F#(3Og2_ZZ;#A/C+_&)/Q1Y5QR@T(=KU/FG4cffd^SC+0
[PQ4N]VVP/@LT@T.>:O33AG6BEJAL]3A-4cR4-]0M;6^DR(2F\=KN3dH]6VL1&J,
ZBMI<)gX,9O\52]YRI3N)\gJF\CL#:dgPKMM_,G6S+:ZRXK/>HC;.+O,YWdJ@N&J
T&:eNT:fD[T?[+^P9]XW(MD;728T8Y8:;,f6Q;I^)QC6].:3.e41gCV+4aAg&3J1
9KOB:=5;;;JcDD[3<LDd:PWb.6dFP:0_/+-5Xf8/6\+U_YNSL8F#cF9If.(JYJO8
)e9PF03)3(PLVVfbB7-JQe)fV<Y1dce7ZH5(QTPHaeOZVPAD\9VcII>cH+/bNc[#
CS4VR;O<IZ4]0T=9JcAEEQ,Y=^Vg]ZIeb,(/EK/MPX.+#K;?<;R?LgOX]4GU^;U?
TUd?S&MfZ/QQHL]Y;+F##dS<PE2VB/FG=F+31HY]G^9T.F)O/E:QXNELZ#8db97#
61H:5Kd/PVe,+a@H@e2\I3#/;(^3P;WGVYf4J_Da5/:+)67OVWOd:C1^@Q=KYKPQ
a\b/BTIZIKO\+NUXTYAT7#&L1E52YG[ZVL(+UGDQ+gAB/2N0U\B3;VYdJ(;M&)8G
DVb)G#\.g?X1I.6K1YHA;W]H-)PeWQ;=TXCK\A>XV#@#,b^R^/]2NJ#g-=MN],e^
W9;^.aOFW9#T4caMG7KO>deZ1OEBJHDIZ^+#A:K<,d9eJ)/7A@ea,&<]cDEC\U8L
L3TFQAT0/],Q-5^<3e/KDR8b0cW^,NXba:-5CD/\FD6?:VK^c[K>CaP_TM#XWLN#
dI[;5c#L>X3J@MVZP7>6[/S2a_+<GbGOfK4@GXQ]LN?;EPWP4^W=DX3/2NXD;0^H
[(gZ_FW:=EaWQfUdH9U2a8-C&&Ac+C+[C2PGe<<^K[[:6^V9fN?HcAFgJZEI0b&L
V<HM[L^_&6b+958b/;De]f44,^+#>47GA<P/=:H_;Cb4a<cD.-#8=W)RA]3eCQ-L
..d/_K?G1Q7#1gfMe4P0=\R]:4MaLVAW3X1U.FUC^3:(SLT4UWWWe)bORb)/a+:E
d5&/M[f]cW.B4;;1?9^-VOX;f<1E_RW,QKFB2ZQ-)&<Z=^2HU=FXVe6.D+N^&,EA
@b5bbZKICCJRg(c)+#43-:3?\^A_fUYO<9JI5&UfD7]1.-Jc#9D/S/0\94)See1U
_MQM]@VJB>[TFcKf65Q.1&A4SP-cd4>K5U^.d/I+W0ANZ<:K:LJ,)f?WM5_E+Rca
R)XHAU@#8T.@J49]^,XJM-8eaCg=UK^.gD9602,=-GgF;\O@103]2(PTT>OXZ@J.
H6>@)B=_eK6K;fZ.<Y:f[-<I0b==4:KJ@_:g[,(>=&_KX3-@e^AGFTPOa78?W^>G
/UbRGG8(XP2(AGO[5GF<fYGJ]YS>EF84eEQ735P]B1S:eA]VXYE#4@GXRIO=N5e&
Z+NBc)IP<_PB2)J<MO_.c;7<>D#1KF>EC>N;6d9dR2RM>1<bD1U.c)&J[<d,>FT_
L/R@a?\#_VIXTb.Lbdd)YL0DGHd(&\+BUeff.Y44URcFP#R;M+RgJMd@0537\S7e
4,a/DD^c\/N9X#NA8HHCPO,H#?)4,eU9>_KK?KC]C#g_RC9de7^;6T[H/P\:5IZO
[gHY\?INZ([48VQFSfLY?76O^+EGX(cR0_R/#2W]QE8U86d5.XXFL#_7Se6RGc)E
+:D<^g/N)ZPM,Z62E.3TcW7-)\ROcO:80XH_@<eT@820I?78UKTD4DBQISQ7YA2a
/535I1aM/4D2-,)6a[Q[B+^8/(3>CLC1I^^/J4#],bXF/d.:A9bP]6A)fR=,@YL0
P?bdd[f9O+[U&.:8R54a-cOSV[&g=+1:=83^&aGDR9N@N_=gQ8B&[1WL_#f_E,8^
GJCLZKUJ?],Y2W^QD/D<HH(BE;ANA-J1BJ^?BgY/C&&@MX3SH:6<8I8AJ2\EJS4Q
SBZeC/XUG.W/K7fFd8M:72/eJHK,5].E\IMU#g=b?6:&I^dJBg)-+_=>VcYQ7/?[
P.(46^]LL@AD_YIMIFAUVPEDSGQg8g5g1.aba[CK5^WIY=VI+[ZZ/#KbBO;^F5d,
NVg51YZ6HK;(Z-L9#c(N7\FZ5eKZg0-COX\?^E39Sb/-1A&=;/RK7BMT?f#g:e/9
\aOG=C_PdDCAWU(5(QT&fV#e[fB#5;?V9J7VXWZWD_)^Ia5@Ja4(W#d-V[9M><HC
Ae7eLR@D.R#g<g;I.F>D<\B4\LDaC6;f>09MBEE7D]@1H\FEWYG]d[39bbC^--Y^
^^U.&&2ReIM0]4\SH[E7,2K:T#&.Uf8gKAN<S7g@OgBTfaZ)?38H0cH0>NVWBg&I
.5Vf&fC]gF#bB3b<0TQZ?T.6BN@00,)/U+)DDgG2&bP]ZBZ.Hc@#]DD#)?-V5]Uc
SE>8JUeWcOTf_E44dC##L,E&NI8=681:IKWLJ.[T:5V;7)NH_E7V(a_-&5dE<[OL
[d1@<Ke)CfOL>5f)Y@Z+SL\D;Ka;3A9<,E(M4E/_LbPb@H2MYgEVc9NZb)ePYZ];
=Q_37^NTHGfZ\9:8,Sf7]b:JYR?)<>E;^^bXBVF]=(Y66_3OB,@D=ZZ[+PW<BdbC
Z1S2C@1R>)e>.UN=_L]a<LYPW+F.Q42?OF[JcXgK?:\.)[H?Y;Q-M<&D(7]RVIIL
8dBbGSgCfMDBAFK?X36b1MF9D@7,TLc<f_NNBcC)P2D7b=eX?O(M@DL9V;Z=,LTV
2.@11#)EgU5gCc)@BGbgKT5/LF=AQ&J(]>B:/H&=;4_5ac6KcJK58b@>+HbQVEG,
^d0XQ2M/&\PA5JH7XU@a^,S5[0[\eed#6;8&I)9]?SV5Z/;YP5VZ4FAAE&7NR9QK
E-?0,73CcGHL3-#gYX?59?WO0)f]/2Y>79ZB05-d:8@/=7K=QBJ:ZE2Y];ZK;TbQ
DI=a=X,:7>]GH?aHeAY25I:?3L6JC7@CF+?PSM;JJG=Sb4g[1G\S?GH,006U45PJ
9Z62?R,b<A5(AM+d)\_AV;cdb(0Ce9^R(0^0F3Y)_dbJ8U9)D@7)EDC2ZJ#O=UQR
M07T,H3,-B]UY:A<9=-gB;TJ0f1UW^HaV/U3fDdP@SAeX]V0B+<PZF8UC(V5a<b3
:@MFcc17>DXdIgL?HJZZ@b8Pde(aO3^Y3ga-7e,&H46UN3@f#EQ=.N1N3D-]^/-(
0]#WM4U?-4^Te\5[P:9LME=+XaL)Nc0#>+CY0a73/g<N73XLA\5@_R1=36CR:/_H
gQH#HC_LK^M?de855]Q0#@H7]9;[>#@)]OR^T>ZI+C;UX:1NWbQ:B337DVO@HW]2
M4^&T;QBFRbY.WBfAZ(MDO&WJf4J^?Sb5VLXbMU-7gCL5^a>F]Y1,;BaTRQEI?LW
MHg@JRL>4@cCXZ5Nda:;SXH/+06U^.)O)BPCaE2GdN-I(5DB<&XJ1XO^6W<Q:-D^
=bA9D?[ZIC<WbN@C68DS4egQZS/eKR)#Z&MQ^EWG9I&I-R7>N(YXaDRJM+]IH9Z5
^E7R_-S)4#[[VW_OC#>YdIGO;A)];1MOY>HP/]\MR.ZP#Y7;PC9/(V(GT^(BSPfQ
GC;[W3^46\+A0&N(8Y#7AZD[2446,0,.C(U9>11@K)G<WXFU,B0HW#_;/&@8Q9;J
#)D.[9XJ/DZR^VZ.gU+G\;BTR=BY48>H,4+cEPY00.#\7O0+=eA[T:&3G)FI\CF]
f1Z#X4T(IZTXT&B)_4-SbED@_XO?]4(1N1bR:ZMO=7,#+5TCEb3\L_WW][H?-[MZ
)K90FJRC4/Z#]^JVAV^7N.@,Z<#OPC2f-7K=SUA]:0\HOPa3^H=]^BCg?@fGD,+=
,+f+J?TbG_05+9#Gg1a@\^9>FPT<=e5KUc8MUY,G/T8QTB-#O:\#93(+Q]1(>GFO
KHfH9FX;Te)5;)@>cP=U:2RaBbA;M<YgW6SU3e.EId12>f.Z_[Q8<:0KfUc1D<&1
b0GW-U.P#KE>LG0\M:a)W7\gO6+1/U)2#>4GG]&?3fXI9&HM2,KQQR)/LZ<K>(&4
UcTW#fKF(LL3R.fD=+[+BH/ZT:)QZ[?N?]SS)[[^-cQ))T;:aMS::\PB1GQCZ2/6
_BWW_NZD<KY&R3#e)6Sc[[:&a7<)-6\D+bK9e@1&T?TgH^&XE76376\KB<0M7C##
F/AN)fV6fU2?bcd9T.]DJ5H]T]0^VY3_8CZ4G1J:QHRd9;Ka<EaGE>Y,-8[@QKHF
[J+.J]<dg3^F7g8^.#,W[.SN265X@H95BfX?:(0?OC1Ue#<>U7/9,3?(Mf?(7Wcd
B&d<3@S?9N?#MC(\KG+GX.2BW9=@F+A4eYJ&BD-cHR/,_\OVED[@FKLR,^_6O+)@
O6HF15?.gC9/ZE84-)HVAb[0J9OF0aD59H#[FM93?M[&-Pa-P;U3eAAS_2ZV[d9<
Z1_&IS&VT)FT5FCAEa>IA>9&AL5b4C8[g)A)I#QCE))),@R1_NL6\;^B/(>JO27K
UF8[,f@G@2EBAc/HU8b73@A?02dX4CaI@7+.S,-Fb,J3bWA?A8W0/gWS9L]0<V=W
,U#b23c+S6ZOK>UH.Be[H(4\b;2(,?aN=bYQ?&Y5D]^P#C=\0W462g0//bI+=<FU
2D[ZgbNfD<-5=41.VA^X3>NOg.Z94Ga]YOP#GC)UT;eE<8g:/V2fY_I:0UHW[cdQ
/gaH)GeP,8fe9MXSQ[0<d.0A9:OLD+1(YX.5CTFC=#6aI6<B05/H:5:M6..0#^BF
&UO)YW9-[BA6#:I8<S3F#d(^Je-4O+dIO8G6G(GI,b(YR(^M3?XKTHZM,6^\H\df
PB,(31g3eFND+TW#eRIW>MfHVa(e]AIgNLPV85#6ZDRb\1\/O>T),8HOcRbc(3e5
g.)?Y4ba:[1EY=\YGGM)dA1=WBW,-7(R-MRYT(g^A4C#G3((8I//WER3C?#+b&Ta
<eMAA+1bAD\dO/V)ALCQMTNCCRBPCH#Z<VLbY-L6b5a^?HI4?>ZWZ4_adJc@cK6X
E&NDTY7-R4,92;Pe2^7\&9O]?U3I]Wf4g>2#,6A6TO3^LTSb@[K0]bH8VR#/)@dE
H[GdJK.\9XR260BQ0=(<MK,-3.E_-B0+;WRQ]\JeJ-afeT?I5-4SY1Fc/92PgC_.
0TU8>c:g-<SWS)D,N[R.5HNX60),a/WVL1KNaR(_-T/JL5WPQeO?Q8KY++^Ma@7H
eSZ[-Z8<>&/T<JadE0b\>:6@T#L49d&bd/c6P03X^KR3G06)1&:H.5K:&G?X8<-&
@DGKIadM;gTFR\O;<)I640^R:AfeCg)YB^aJ#CP[S#gFW_7_?PFTG6?>V]X(O7gO
]NbEeB18ML<Mg_W5;Z?97,D#6V37f4>#@bE<I2cCLa=C]_,[cNG\;TbY610^#[eR
9#BG7LgB5g37WFH&?e@cL5J2R?c(R1KYRWbg^,aK<6:CF47M8AXO34::#Ac9If]M
U[(G3S+V1G[O>7XS,HUGR0e^-FNCVf[8U2<M<GcGZ(7V8RD,IV,>+H,GKPJ143LE
=+R@-YAKQVHBS<HDFRP:,KF#6+;-@R_XHVS]S<IL&1GO^DQ&Y:dXH#I2RJ1214Kf
cN=8_>bR<V:;/RF@K6Qf,RI9g1OLNaNMZaR9I[NJOPLZ^_4F:3<85)A2[WN<.S=<
.-;.-]<9#47MUJ5F-FG?TR+Qc:.7=1OKY&Q0#I(^T5&(geVZaG8Nc+]Cf,7ff@TS
TO\AF])J4RIUNbcA:gNfZeg#2:KIFN)MOCR89Q38:a&A=MZdA/eTV1;^Kg^0S4e&
Z3F3R20NW2T0U@@b(:/B>K775;W#X>J(cJJ5[]f@QdK7M2d\TGJJ?e9+@,F995@T
gXY1F@:<.4.H12Z\<>0N:P-X1VA<gg[aa8&Za9&#L\Ld@]c,HT4E[f^,W+OEbP99
YF+\aY/&-._->0MO/[[ED7>904NY\S.PKQ-AYLaXbHYQ&5EYgC0IJIJ>DN&>D:<K
O/\16b+\MgE+Y/X11Dd4S[W.,>KNZeb>7:#dW6R9a-IQ9cV&f(X[YP_#AVW0PcAZ
)-/,)<:\WBNR+C<WW9>W<QEa&Jd:b0\CfW5^JaX_Ld8gI6)8:P3W943@&c?>7G/]
2]/=.M_[Wc9UQ6D6US\5ReVPMc:5BTPHM\JcEG.708V;B^^M</2Y</IYWG:NI(S)
PbcL()QN:[c3HT8_CFBZb7,5_ZaICRJR@RcF@^/[?1MZJ.(R@;9F,QI(75ag_.(B
T,CB/:4F&LJaOU:bW+--N,3@J99>]XGU4IWB9d0cG>,_gYHKbCKVbEY)egEUD^HK
6,-Md,Pg[YWdNKK03aFLN<dgP(S6P0W1N.=J]E&R]&-G<@=3UIENO)#O996=46R^
BUH]F]NNRK--DU0bMKH3&C+N?RD_7T9c/V=g,R1&5,a&W;RBae1Z?)A-MZ?dMe;M
M4[#[?da\O8gDIS^cQ-R_7I=G]70Ke<<,M:,]U[_,JA\&FaL6J/c)[L6SW?><8ED
LbV4&WLWMX&X7/0+Qb,5])^M],7T1#C.T-(&/JdS&,9O;aW<1<??dd30PX3)1b[/
gDU,\I[5\^G4G8_@Aa(0ZSdNZDW?QZ7-ZS1VK<aLWKcGJ5.bO\>Ld[f6D?(98dYB
?KEIKA6MACf^-0R#gP)e#H\8bV2aPMcdOP:FWN;U[;]\dWBWP;);g<<3O.;OA,VL
0+H&0b60Ca/EPH(5;C(P[HRF?9cQ7aP/=J1/T4cW9TCf;SE91a29.ZZ[L9[;Zf@.
SaC_+3C;c4daXgW=eN1d>CC)X:[#bB4Ib-b(K6^3FQ-\Gc#Z@\V1C0ceRF8\&)RD
IRRFF]X&)e?6Hb?-A3A]K=J#A,:O]Y[3b-E<VDRXA:8e[[@HS6b5.3?AfLH6EJZ_
+If>H9(gI.>JZe5(g7<VX=Jb4\&&@;6FBgL)UPVV#cFY=TGUFK6W=a)IL8SX>4#A
^2X9A#FPAgdZD..,&PfYC:2<CEb7LW@XMZ#D)@g#=G6O[_#1:aYbgZ#8>8C/=;J4
L0WaJF6(PQWNgUW#A@,W?H8W<GCI@A,f)T1OeG,=NS?8S(@NfHBcf.5eZC-6)?WK
FgFZQAJ8=a]XPfBSAS)K[@_.0N0HIZa7&aSKXcTJ8dZ8O)&;S5RO(S3LGQNXB^e\
DPA>[eI8>ZF1+9WU;5aAS&C-_.791Y?U#Mc2<BC>4IcEHcG90]Ng[7/bU5W,4d^=
6W2VB971PS(8g/27eI5=:7;YWZ]EafF@-(V2W964,>++[P@)QL]9->S[<TOZ.)e.
>N=R4Y<?eZW2B,:4_2ZH5K:SYZf?PG85gS)I^CA9;(:Q]/1TY&(6TS8PDL8UFFe7
@4;21#He(/B_QN(DP3JeD:.F4.P&.DC,ec7<?1JW=Y/16SbgWM6ef=^(57:I,g[0
c,_SDM<5+fB+f(Z43H,>SVN)Y:,^A-;AGfE+eS&#5cg>2^dLNdL,+CHS]HY+A/eW
aBM#3A-SYOT_-cF<_/.?;9c-53+Q=83<RVT</EGHD+W7-O&E+NJ]9Gc2e&@4MTc#
Ped1(H@HFQ]4M,e_U7KXW#gKb+IUZbERe/4]+cH>Hf2=PE0(]5eV8B-I2)J5#<:7
;>3,Q<1I#?bQc[XA>]MXLXV,=-><1RSJH2TG.L/IMHWJT.ICBM(ee78:>.06LN1;
4&PWW?_>39:MK)JC>V76AR]=3.&?eYE)R1X]LaH95OLLa4X1T4^gFIL]G(L7dBdI
eBf);X[R&=1D=^]</1>c>3-A>JCSdIcNTaC?b2&YcG#JS):Y([/MXVP]&P8FcJ@e
Y(b[+f=e@gTTPUVMZ,QGLU/71MY,HL7I1N_ZHbMIK@PJbAL)&=^T82YF@TT^NY27
E#]^LDZ,]H)_@R7Ld7)(b/B_7\M/ZD60UV+Z>ACffALSFKH4Z<W=L?fXXD&#;De_
M>XQ9X4R+<?G5SBIT;WD]JV5Re-EDH;c0M[g=H:H:#a,J/A516S@Q8EQAC/f2AI6
<FDB+>BUELKC]587,dMfHbFW^.QWYJI5@)1&d-M[[?JN-[-VX\W(V@/ANM7IY?MX
KNd)-2:EDDK0HMe0g3SW@YIbU+_6<SPTQVGg;WFNe86Be:C:gRHJ3<;<W6eKU)0Y
?edG<6BCbDWE=>ec@[OZ2:C>^9S[SEe;DMQF;M.?QNRZ>)-2Y]=\UT[aDd)L>-MY
C+#a&bI9^aO@:gF-0f5F64W@(U]28,8?Z=L,53EZ@?X=6dHD=;&9.UcP>]Q[F7?a
9]<(Me6C+>e-A=4J@<e+]\-(,KU.G(B2U_#3SYLK@US-P\N0AJD;Mf6\+]TUWKIO
,Ub-\5g3]WVTWUdU[>:YQ-:bUDFI/N90KfF=+0]E?cH[fKL#K)J=eL2;TAK<:dYP
BW#M;/&<OG^Y+;,65[]YIgb,BML(<P?3H_G(bL-TbY?(APQYJLOXZ:0FHG=R6.?E
K[b(5>483bB\/[TTV4Gbe(RI4#&eGc=[?6_=8]1D5EXP\=Ad7P.QY6N[#63W]Cgg
g&-7bF3HYe\1K9,;,#@g<ZFZ#<RE?6SFFFCKXP7-/e8^Ica]@]E;;bd99;+AJ&3e
14GCFOOf&FELC&K=@NG&\fVg,QAN)=,Q60.J#](XG&cR;QdRT8#=bH679cM:B8.C
<A?9^1LL__Z2A3UF(XFILfVH6HF\ZYB_+(=_#\=D/6W]Z-dZRbATBKQTX3Q?_AcB
]_ANT2GOYCLEDU\91<A:c(=P_EO:La?d40+8=@U.2UN.9bY0L.b^PE9YB@BHXH1T
=Q.@4.-#9;VQ<3TG.,2b3RNW.ZMef34+8+8#AB>gP#fG:.)C-D+aaY_H2ZEI.Qe,
E++VM_MA[KJ#SfKT\^@7-Q=(QI03\Y/8<7JIWBXg?V8d-aTDLcY@MWd#X5c><2=.
YPeEC264g#T6E7;J[:2O2LZDD]=GQd+FC-:OL7ZW=DR(163Tf2dXOUHX9@5,aD4>
1KWC^&J<5HFA\CB[=W_f^eIWe&O@:\D83RG#<L+&(T(]DAK6aR7V@JA#@LYgC)SZ
E1T+6-CAa(PHP/AN)aGefQ7R#_<fR<WK)RK_FNKGR(MXN]?9Z^ZgMT9>E2f)9\L1
dJ5DID4OX&]]JP?>O[GQ6+722;J0K-N.<S9:M<SgVK51&GK=f1^NEgRd>NM&+\Xf
-0T>Z,-Mb(fO+:FEg6<:CGC3Gb#c1VaM^L5+MMRP2O1[Fa6E,SX5F0bdB]M@Yc:?
cLWK]J#1/DY4;-V6&G?F7L_CA(JH7.f;3Za#K?ZYE:D]?)H-;,,SX2_fYE11_JA2
SM-F4Qa)I@4=2KVDQTXMY]G6OJ95X@6Id@;SS0e:KTTZL7MgBU=63D_.^<G.2K,E
gHZ5EP1VN.<f@X;G:5K\9,LGH49^]LPIVKS-bCaYZ]1,#3/&H7:/e-RW,#OAFDE9
aS29@L-SSO\_XO7U/3SZIQXWXNdIA=)FLUVW<S=,>B;;518+Y67>f8c_I#b^.Xa\
LOG^VE&2d+I@debNAKJ016PDBIM);-4/1S7.1?+7;GDE/=fWM=R(T2<M[^)JF6=/
8WbgHdcM\da);[X^bWBCGE+\=CD8P&F<&K/B#DD==S5O?IDag>PT<\&5[6_U;(E?
\ANf:76SZ5Ha\@^WMPQa_G1.(1=FcY/TF4TH5W-N]F>]2XC&.N)HZLIdJ1SO5UWU
#+K>_BRKPg(Z;B.cIYH@@=bJ0\?[BF,C2ENfg=&gbMHJ\[B#Va>;\9YLF7U?GP,+
9HP2QN+c.I1ZI]T8F^@H0&W)K>HSEQE:7CKa[H,gB0.HG3[a+c]4U,];5Z7HO(TW
Y3,<e,/>c(H)P5(Q]F?&CBMHQN[@RN<SNJ#ZXCLcZa]@CeO4T1,][eV?01dUI/X4
5]&5XNOP7XVXaaAbELVAWT6]eC?#>IK7eJV1.K:I5X;4==)S9e]/^De;UG^KCYfD
(?Q#Q,G,N>@==9MVc3]^DE18OVNWW,;C-TWXT0PEZQ)#Y?VJK6,@]X.Tgb</IS;F
b/a@AbN?(#UT:8G2RO,BLg,a,>2Ld7B(W[94bH+Z6Dc^TV>#XC[]cK@+7RBN-QL=
&C]U+Y5b^e7KH6A@GU2]^(8Q),-gSd)dT8B20c]7K@4F)7:>2>=A>ScG9,7]4gTe
9.(L5R\,:U2_<T[#O4e\]=:8JII>gbV-+BT9AM-I#U^9A[>/7UN@WEXP+)A1Kc0&
HOP=bS/)IJ3,Z6Yf8^R/U1S;7U,(ePODLSJe;,VBcIE+V+CV7J7^6g(GVJ_:bfMI
5cf+1HH:GOBe&(OCa]4U4R@@g@P[.IN&2V\4b4Sd/AM:.@5\W19#CJU[N_Rd5,MT
4.U?(V:&PD_RfF(O,ZKL[JNE\>3+Q_fQf^#5@eZO()+BNg0G?@>SRbK\&YN2+XME
KRaG#8)J;&9K<I;gZLcZ(:;C5dJ>^B_I9+&C#GGD(+7I0dJT2eK84_WdgMB=d(ZF
V?M<_7>[J8LJ(4E,4c1V7:=1.:1c@cJCVcX643eVT_=Fbd/L^3AVQ&9L5Hd.UUJX
Zb7\SddcWa#^GTgW(B)Y?3@d0;F5,:-2^])Fa<A8.F>78U_NEX/[S0>gN<,(c81=
8RD?_0DO0P/_5)0aE?P4b=DcP8K<WB+J_O(K)/f_0B8(4#DXSKH6PfAE5@;J<cGM
\.DTE(4.:^)ac.MQWa23-Ve>R1_ge0UC@Z11GSX70):]eCP2&78]F<.E)G[DZM_@
[8>^((^(TVd(.KB@N.Z_>K<Q^-RP_.BP8,Mee]I\6@I7MD;I<1)H50>XG.V<L3[,
M6IId[JA23A[UR\<R7>a23Q.-f;REYLEgc5ZW6(2&/B21X9e08aOBb+.;?6O+9eI
K>)B-SQ_S<AC/:F&P&)F121.HP58[(cN3UM(Y[I1d[:a4daZgTaXI_.eRaU@42D>
-RI]5Bc:FQGdId0^S8_HFIR1fURKIbAUgNb&Y-G9EO4LZb6LY7AZ#BHCM#Wc@3GJ
8?P6KYITYaS.UD,N\a_PZMTS@6<;]Q/,baIWYceG;6(:FI=CcN:g1NgUb@)U)b#>
:QfQ<S=<bD/eIXX=RO3)E5=DC]Vf)+X/c,W89WW0)[A1a/I]gL)b&WCOH_0=O&;I
[)c;LAb2KF@]0ALJb3/2DRK-9:Q:PX/EV6fdT.Zcd:L./5ZYS#G6V]9cTZ^J+G2U
R>+Ec^Agc3JU):PW4WJ+;.I[Tf0UGf#K2\H#E3F>>U(g^1N:)G7[,#fC;7eN##W&
c@I+ENSTbHGQ^MZ&Q>BCJfSA2gXA-fTY[C,+0M#f9;X2:W6]#SAB.<dVT(3cRL+P
Hca-HUC.e3,R1^Ag=<>YSDNFEKZI:?70N=IbRb#S>82gb5Dg;YeG5Q)15>=N?8M.
-;HdO/SLML<>URL<_d6DQ0?3/g.,9<&-^X.5XD:57/LZ=3=.:SdQUg3eFT2CfIL^
>EJU/6JVR1M@M<MC@.b:J-,])ROCL\=c&@9KJL5SX?bCLZg#1U=@bb(0:RA+J9=>
?:O;@#d;GQ/gBA^@2U13;-CO)=NW?V1-P:]C..77]BST#XU_S))7dZQGa\5KF+aM
ASPaeGe-KNATZ)U&-A.c:I&4[,Q<#PdLLH[_fJN,]^^#^#.B0XIWY1IT_2gP<Cb\
V);C<2HV8GbFg@g(S3_CgK=)XHI.4KJe?.E)Y]VG_KJ>R,)g/O\][AI+a6X2;:2D
acS/:9UZ3g7L@Y5DV-bL5@2O/DE/ZR3J(+E7/7ZP@Q9FAHWHMXFDB)AbU94EJ^NV
AedZfALF:6dJ778U>FKCK@4DM86RFdR-1#2cU2)>@)B1&F9b648M:W36C=O5_SB:
>V?0HHc1(6N+:_Z(4/4c1[6[Y64JJIX[;4RBQK8(>[+S=(bBH=S[X0F8?4O2A>;J
>7Q\02d=)8DgXSY/f#K6:QXg<#IbFWAK^g\8J]2_C&48[79)2OAGP;[c1fD)a#SW
=H@NbKDIdaF:UVC(<]L/2^b,;WZR2&-9V68S_H_JY:2-:<N?]>D,[0Xd30QNb>6V
HIP/&c),Q:S@[c.=A/7fcP=D6O^=a)&=;._aLYM>;(G>aXWe9Z+[Z)+M.O694[>K
JSRC+;Y<b--;6UW1PD-#ZB,48A?GFcb=3A+.FY^@d+agO5URJ1A)&Jb^EDLFQ87S
ZX-A.JD>95_(CPE60H]I?37+Ygg&T4F\:KX8O/3VH&fAI-3BM?#GcXCQ(I?Y0T,b
Ue4-9LK.KQT>c]EG.40^8IZ<^4HOHTR-=WL+b47H4M(\-Nc^CR&_a@N@L)R]28RW
J,G?S/IA6)Y;c;G]E9;dOCH==5T<[GNJB3YVD(3VZ39Z-C;-7EBPSC3I&IA1M-Z8
2R^\?S5bWf6S\=UC94T>;:,aZS,DeNEA=DRN7#[]^>.FF3+RGB9NFTN:8)Y^<NJB
P-KaQD=JF]IJ@J8J_^QKC<c2)B5&CZXY+JDNN10N^;XQ,f4FEa>2LGSUbDdG@//<
1JU<,g0G=#C]UQFOBCL>(@T<UfL7^23FV-6)S;\Z7[P<b-C9\_Ed<@1G,769c)?D
4Q@8):@-B\6ARU<P-6DJP=F;G-Pf>:?Ug\>eO;-CPDF?4P8F)8GOV<Saf/9_0?Q/
2F=Z]-J^YDOTfR^X)NHYNS8C<bT-Q7e+1\6H[8CS,L+,P4Z3Q?3<gQ7A+-FZ4(IG
<.[,cQgSfGS;FI>6@Z?0f-c8QD[HW5\2(6TC;69K<fIHERAPPSU[\9P;1&GOP33D
Z6G.MEIS1a63fLLf/SJ2Z<KK?M8G)TV3d8CIaIX5f?eW9+5\BHX1dId)-D6Qaa^B
R\:cHg[G3-DN3I(+Y231-XIDbRg?,;,cSZd@KX3\),TOe/6Ae2#Qa>_S8,cP^I83
aAW4\]XX._5EOZBJaNVR7-&@F6M,#CK,7WN(((#R+gKgJME^TDd/OSW=UA1@&NbR
;[0[;(?L7C9=,ZNG5Ga[bD&\D(^B4VdXS:M:ZV1]@e<7YbSCN</.dd)QV^=YYOe,
EQ-S;bROT[V7F(VOK=&dc#\WCcJN57e5#G3d+L4#R>Q[#/CdOHDe)bS]B/.8XOBS
K@]F;ge###O;QH4DOE_EK;<,O61Zg0KVBNUT9>a_e2I323/g=+a:U7&AB8]b[)8>
W9eJbee/KJS:U[&.a/.deeS)A=&LS0AeD-&#1@g64]03^/#.^/7FO>CU7(V+3_(;
T;dXNZ99)(CSK.MfdeLdfdNRP<bZ_K:a7#@N#P.?9:H:<&E2Y)I0V(P9TP7d\L6]
b[XRLbE&4MFEdJU0CDJ^3?8>RA;;DL6G+gUdXJ<])W&AL?\#b?_#\?)Yf12[TNJZ
68T@M5NIG=63:f&8d]C\F-#X@1f,NEBQPD<99Tc?]c),e1;C]5DRVJ@/=+f&Q6\M
DK<EER;:GO\_V2,>P/#Ie?7c5&6NF&TKGJ8P)+O7P1)^VZ2^(YRNE0;/JW?8Kd#Q
+8^UOUe88IQY&?gGKFfRBRTK;I-2H[RAZUPd)07(dY\/9W)=U(N8TG5BdQ,.NQ)I
Ba=YD8<AY_DJ3(EC?-@@<081]<J5HM0@)5f-KHH>6P69FP9]]R^TN:WgN5BB\_V&
)MNWLL.SY<cb)SEbVVB;\6=WW25ddO7.4C;,1/H8;9C#40:.S]07FU@a@(B)7DSd
dKJPaWRI=@P8#fT(A=#RVda2RIMe&6JA2Ff]7?54Ge&YZB;USH)O^TBTTO+,ZYa#
Z>0)C0322d9<7O@Q8R6;)9PdP0g;D[9a__P,<<X?dRN:S,7N-#a6QS=\OPS9dBGR
g,d+7ME&L(R0&N3XE]R?)LD&/XRFOH3T=&,^(EPHK@XR43E/_d12.5EH5ebW/b.g
>WF[a1EEaMOW/UJ:;&UfT85#A0XCYS7cN8fVEdX4=cdH0.Q/&.2L-_A6R)1c5TZ_
8@Uc@1gbMR37c5-XdbSA&;S9HA30RAJ7SZ?T9;05HPc8=a;5RRK..74e&Ya3-3/I
J9KFeXE+e7MOHAdAKBdb/TG]AE=8YI-3H(#EINF^AL,L&5TZgH-J_E9-=d?U.KJB
c\+9/V:[6&UEGQ9[Y((#aO9Ea92=8Q7Y6Z_YZS1POHA6/dD\a/.g^DI;PP>ZPJ_0
F7WHQ7Wge0+MPYY>b7P+@MDPDK;<+OVTOddK&ZR;.-9:&61f[X)8;_(+<gP]9H=b
\Y1c^\90Q-#e,>#QMRe\?<+f#.0,ORW9P;ULc[]<a>6PdKE,,U\GeF.-W7HPdXa4
13&^f#ES:0LV1I5O&;&?.]]H./O2(:d&-RY77(#+PH>2HU8_Y\N\81_bGaY?C9CI
UEf(Vd=,N\QPBD>0KQ@A,-=KI,IfB&6?d17Fae\V099XNefTEJ^JOc@V_&8d[N&I
#A#GAR,YQ5/#WGOc3d#;VG6(+/@W[RL\g^5-7G^V-+0ZaHXH2B[]g+#9CRf>,GG<
eg65IL>b::[IT7OLI@2Z4/8e+,LE[L8)/-KWd76,cNC,2W>EG2g(7-1X;C@Zf[4B
K[[/S>>.@F:K6WIB50GIQ=.dI6BP9<[XG<ZQGI?ZWV?&4-/dJ&<ZZJMaOVeXf75D
PA52;6R7+C9I9M62:OB1T91QXccJg;.03aD^3NY+_UbV9L[f9=&HKELA?E6:+Qd1
690e:Yd7?f\&27[WO:HITQNfLI,6<I>G4/GE]?;O<YP^&V.F)2::&#1G>FO(7SAM
&2M-XWJ.S;&^H8a^(A>H2R;J09://gA1aV\a(fca]EA;>UH\,.2A?^@_EF+3#0(Y
EEIEA>fgN]4SW\L#XL@NIG./^JU06K=_F#YHbUeH?,NG)_19ac#\Tc.;\gXQQ;;X
HZWf6L5Tef]?C8dU]4A[R>eOOfPJ^CbN4,a//4GP@9I=835;(1Q[5[@V7UfY+LD4
3SC5,6TCF@2O>&37(Ie]+.gF>df]KgI7U?e4E@6<46a2(#?S&90A)A=<C_9]gXK\
YK=X/Z]#4Na1_WH&S_PRM?aN^E7JOBC7?RY=07542-#0eb_FZW3LcSZc^:DL8dbS
;RaQP37GU[<>@S<M^;)6=I5gEDVRDY[5PV^,.)6<J&=^O#1Y\F#[[fUL2.U61B08
bF)M1g-6)L&1:]HN5)I0V-AKI)W1I0H5\?:e/D5EM)R;I-3f#DDcedCFM5BGC]WK
83_8K7PU_)6-&)_32H^V(;;#?].<g[_ffPeDL[F;<6e4J->?+4)B#)XF_&V1(Y=(
cVOJe/eBeEc6J<>Y=6,TZE35a6>MH=&2K0(G^ITP/PQA:GCWL-bLD/KD5U)VV14\
BH;Q#,FS07a]E^TaU;Z2e[Q;VCV6)B,,:X+>,R_?0#P=HcK36e3I-+GD\<AK6NeV
+ZCKabHG4JUcDe^fWg#SIc9bDOG=>)4g44.d0gW100YG[;6I&3G>:a@1NefR(8\+
?;K\eN-YZSRZAcLIa,d.LSaLD]Y>9@GTBA<g,.-O_NT;bVEe<>=#JU9O#Cc(X+LW
Z67TNG2/DQ[-?O7//=<MNAT3>\??@+T3SUY>?(1)^(/-T9G7RV=0DMA),2S[D\P/
b?ZGT^(+;O=IZ9^<;&F:&+OEPVG&a6#S&EQN@.;P,ReQ8EYaaHc2Lf#B@#SQ+S70
PW7.W^2F&4]8[5WHfb?H(.9GHW059N4+)F(Pcd<gT[>FJF0EC<QKXMD4LA&/9@Yd
8cg/8SdKMRW??[e7[824b5F2gW6]K[MPe](_\7>QA,0V(->\L7673>P(2ScRR<+\
4ZC7P;,<TBMB#40)[J86aCQe5V=#0Ce7GA#^B04N-cIe;N?3;D,TTB>SOcDSN3&Q
;U]Y6SGMafaTX6X<>1/UQN35F,H^WF;+H9.2Q[GN\b;CWB:c\CfMcg[)]/R^.CXR
3PT];QS.18AR1@^6QIBTPWMbFBf-#35M)6MZL_f3Y_T?XD,HIK]<-T3@>8V()H@Z
Z;<04-\I=gc/bJSLY,VX;RTAgf8--HL99gOWW84NM@+@4Z+(MTWgZf^G0fe(JHK2
Z)QJS.e4T3RHgDR,)U/[+6e7M:R7K.+Ce._/[96B=.YNbRHCKZg8JEdR;]?HLML4
&2TUgO,GND;V4C4(NSK]V9LQB3D3(&](c.:AH(IV;=5U8GK4W#>T3SW,cGI3g)F4
KQ#8?BdV3MNRRC=ZC<,6]&0(47MONNN/T^2T>Da@a0H?OIQBA3+ZW:YTLJP78\I:
Q=S8b<?e(dgfLWfUgf6//9e-XGCbF5P7+Y,3(&FB,Z>B4c\)G(9#HN)A&77R]N9X
bG0BUI6T9W_#M(?XEEC25SZ5V^bY-+;:#YG&b?KVDA=gC[4-TgVST.HO((bF\\((
[-AYZ-@,(DM;K.X3,H@R@SHO_fZ3c4Y3VEQ?;daNc7)N;UZG95^SPR#VIbEA&F7S
=;5DXeG;UNSQ--LFHJ2)Y[DRO\13S)_KTOV8ZX^gI>\T)R087CTO9@0IEU[NW=4Y
bIHa1+]-EZbN9L;Q@CN.A[ZA0NRE7RHKJX&(.PHbH[Hd#/<?/-WA#H8MV4ZST(^=
a,Jd5B5AZ+;[9T^-UV,bf)UC,W?W]GJ=7Y+JA>BY.Z_IdfY6aQ=GYM#_fED^&<GN
8S--P;gWKLePPREX?I+)GPAJaY>N\R>(5ZbZW.;\bU;DBDQ0ZG/3P]b^.(2bbO&c
@TFZ<(WM.W>,b;UD=ZOBCJ5OVSVXAgV<YOG1-?YA2JVN@L^cUbG?eW6W.R(UNXPU
C(aBRYe#FJ\4LK789.^J:AS1@d/?BXGPPef(MACe:COGY&CE8Na&T[Z2V]_X@QXO
.6R>QefN@W1#_A3g\6^a<+^PGCcg0D5cdT2I\dT]a2;D9F4^43\9W;X#V/TBdB/(
X]RUD,[\K#VH8WCE<:?^cX^FJL5L5X-/4:OIRJ[\TB/E,\6cGY),H78+C13Mc][Q
8FC:9Dd[fUKIL[67JVGP3YT:^G_F;=.(Rg#FOVG#L7UX.^-0/#ANOU8?aReEaK0V
K:&2SYMK3gN4>YEbCPY][HJT0<],(^GeH5O:V/cBLXNd/<6-Ub3[MId(\QH2H.>]
NP&E=+Y_4Y4K;Ug9/S19Gg<618?2EcdZeI8.Z+JE+DKgOPERRb;S5@FD.EWRH8ce
QEf;b(?c\1PQ^QX]M=-f1S6;O?6c-d.G>ODUU3(;KagT[a0C5^_&74[;[X)GMBXR
(I^8GBM2YLcH/gJFSGOAFb[-+(=U[RRN&X83,LRO<Z@bF(=1-I5<37F_]]&?M(,?
<+4.&AbOD7=BT0O+TCc?4)0A3]+B3ROO1bY79/d8BVK.9T>]RI?b,D9Re_GU+FF>
3\4G6gZ4;,;3R<K_.ObIZ-/>EMY?()NE:PEeIKfFY5.+5f7Q#a&>N5D&3>C@,=RX
SaU<8Z.,_Dcd(3KB8K6Z-E/.gGHI#.J0B-MJHcPX19X:QEdb1UaPK7d0Q.cLSIH4
S+0##eW5?X>EYUZ[?CV(Y^aK2&4+,6U-JJc7>0MOO@<\=N=?S:J]F[N@>K\-eT<,
[5>].]b>cEOMO?TCUU^,-/>^,LGE7dc,X&H-NJ(#1eS=VDN@-X-F/))Yc?-DKS9Y
PGdT56ebOOJBOPLEQY:0EEW5=?QZVF.A@$
`endprotected
  
function void svt_spi_system_configuration::pre_randomize ();
//vcs_vip_protect 
`protected
=)205;BcG5b=-5OIQPdW;J33]NU^L)R^E+J1>RRU,6d@9GcbbfA9,(Xf+FAb64a,
))=QG>cRV4)[KOI90g9WOe^5MbDN(9^DcR4:L+<&.L[b2e=O0\H)7_==#6@81I^M
8@/[a9H\KMe[E+g5agLDf32[^\b_@8O+?$
`endprotected

endfunction: pre_randomize

// -----------------------------------------------------------------------------
function void svt_spi_system_configuration::post_randomize();
`protected
2Q-@?8Va0(Od825N#^B>E[2.ZLZQTcVBBa4YbZ@S_]\-9:\6Za&Y().A.Id[M^Ve
+B8:,3GQZE-eT0]H?M@0,bB@<]VY<=#)W.fNV2SPbWB0CL>SQ)(b:^3@.7YN0cN^
,LPeb00)Z1N<G3N:#589Q&ZEfa3^(<;3E)SVXBU@<TE2Z=U9&/f9e4a19Hc..P&N
<9(Oc__KJ/2M-<7-d=EUe<K+T(;^HZeLJK]8)>cT0e]d=]VG1gY?KQ8UQ3eG>-I[
VQGC0&8E2CU@g6?NEHPfa#XFIaFU;N5)U)[NJK/QGJ)V89V@A].N[:G/BbDI[;L_
(Y4.IMSY9#\f#Kg+V^g7AMXF5$
`endprotected

endfunction

// -----------------------------------------------------------------------------
function void svt_spi_system_configuration::set_default_master (int default_master_id = 0);
    foreach (this.master_cfg[i]) begin
      this.master_cfg[i].default_master = default_master_id;
    end 
    foreach (this.slave_cfg[i]) begin
      this.slave_cfg[i].default_master = default_master_id;
    end 
endfunction

// -----------------------------------------------------------------------------
function void svt_spi_system_configuration::set_default_slave (int default_slave_id = 0);
    foreach (this.master_cfg[i]) begin
      this.master_cfg[i].default_slave = default_slave_id;
    end 
    foreach (this.slave_cfg[i]) begin
      this.slave_cfg[i].default_slave = default_slave_id;
    end 
endfunction

`endif //  `ifndef GUARD_SVT_SPI_SYSTEM_CONFIGURATION_SV
