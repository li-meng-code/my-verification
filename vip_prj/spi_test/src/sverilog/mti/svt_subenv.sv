//=======================================================================
// COPYRIGHT (C) 2009-2017 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all authorized copies.
//
//-----------------------------------------------------------------------

`ifndef GUARD_SVT_SUBENV_SV
`define GUARD_SVT_SUBENV_SV

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_cmd_defines)

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
VEIPtp6d9XqCCNaxwTb7dtDbbyHQV+lMZP745P9dXbkIbAcSQLiM7zEaHOm97kLU
1SbF2BcQG+kFVXj9f8VxEKhwWUc/p5PvfBGZDOIzGPf+V47l8HTZDfC/WaGXEC/l
X2FzHNS2Z0KMrPFNSVvXh8dSGYwk7VgPN7bcGxDi9hs=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1282      )
61KXapoSnyxA6b5lyX+ZWweFZMNUbzYH5sAZMSNp46JUAH1FR+FKOic5lYtUHDnX
PEUq4AVNUiDZoguHP1OT5v0t90tS8Rj9ZuP1l+Qf7MIE5pH3TYDv3N0Sf3s6mhb1
LqZ482KGt18aW9ton4GNEgXKXe4OePZZhPk6lCHLAIztS0vcsINaNk7cLCxmW2RX
vpblVEWjYcDF9QobU0gVOi3J9r2/9eiII/Kcr33ntQlcpOGv+qBjsatncXpkAx0N
JPoEM9z/JoUx0SASEY1AXnQu08jIShJcFuVJFzon57p8dJVMK1YkVNUIR+sIt/ZH
grB110B9v+GBcCgjrn/bi+cxTJBrRaopMDgAClhm/BQuiKqMCg/PQW0AXrwfoUt1
MzTLYQ2+AdJoC37jryXDQQR1nTV3JRrCVZywF0ZMjeh9NXPVqKGjutPW5yr71zcq
ajChJOLp5s8R2WKpFUpuolNFppX/V4G8AEsvTAT/k6snSmC/H9ePDIhvDmelXEQW
N1P+L45m/7WWhD4qu+peT6w9lGfMySJoKI1eWim2kFqD55shyUUxZ0E/PjxbwdIh
oqfk1GbxTSc+gCy9gi8HrP1G7RgEOjcyssQNdMCd+QNcgo3b+ZHFkSN7vbBtueqD
werYt53bX7foAf1Pwub9ByBE20fioIXJg+e5FBS1rRaF/w6ImQ7rwIk9ZzJCUxX1
C+2gjQjyf3mpay8btYcE1orB2UL0NgCY35sStHxVWdr6KgxvxbR3c29ouFZdFWH/
wxSyH/gx+gZMNntfyqkHgrQA2fkek6o/oKsf92ODLOQSduwPNKzuLsa3Rpu1sfh1
pB3oOYRikV2mjjjaVz9nv+Gk1nTpgMsng65sTmlm6aMQWUuVE09jFutrrhGINej1
wQbYwLcCwSWBFqBVPvt9qDKVCn7cdhRfmmgcuPGTvnimiq3+UBn+1bPoLHME3tSV
PO4GYqT5VV/LYUmijVvUFeMUAym1ow9YWZ8xOnx9paA4qdNSkH76y4WFFIMbBKTI
WzysLVH2237HJEKHvhmoDmAKyt+qRfoNY1duxXsV2/1sSvOL1Ett96m26JWjP6Sw
0uBCJYw6cdvfOFXaYeK98u79C8viIA/cy+8a1gGAng95cNmksnsXtDJ0JwWZLyLx
xwbwcCuv++Ktupjp+/mkiaOZal/DujB2uYjwuiTa9jkWwUq3J9zvoAvG28SNxuyS
IN1DUhd1Nigi9PpWVHAyvoUMnGEDLBeA038sLxZ2oc15nAmN3s/6V0HIM/O0LPCh
j5z+rToHDmC1nhNcgkTAYdMeig5vCSEkSXSWnLhnkr9iwPVbYabqAwpxvZ5ENV60
y0ccKEm9RKBT78lQSQFR1d3XtcYTznupsuoE3HJXNsf29R6vKj1texKwBJvPlTHo
yyjDUkRsPD771VhrKKkr4LC8Nlxxnx2/jkw0PJArfwvm85nTzcoUu2mOjxTFrjuG
wtU7WjdeXp5rQj26zPFgCKjwI7xqcUm9euRB5rXo0brBSsHGfrc52iYh7NfkqR54
IK95svBTtw8j1lpP2yylLG14IUqQkENgL03tT1nbOOSrAolMRKQwoUS9d4879kiP
tBKYIB5w6b1vcycsRow9qxPdHS/763YHSCcd0Pk4r3xFfak5VlAeu/iZq2rCxHZJ
2v+TOLBhao4In8uEXCBanPbk6U9ZFYlMhkduwTFu8aMF9BmEuqt2DOV+7wW/pfip
`pragma protect end_protected

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT subenvs which
 * are based on svt_subenv.
 */
virtual class svt_subenv extends `VMM_SUBENV;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /**
   * Shared log instance used for internally generated data objects.
   */
  vmm_log data_log;

  /**
   * DUT Error Check infrastructure object <b>shared</b> by the subenv transactors.
   */
  svt_err_check err_check = null;

  /**
   * Determines if a transaction summary should be generated in the report() task.
   */
  int intermediate_report = 1;

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
SsKTQD/nhnc8d/biAgk6glIr0UG3Jvlsyt1BT6LoS6VzdZwbm01lUFFnbtS2w5X2
nHJ81Wt+efqdYLC6L6UELROOqD5k09wxSYSWTNDXDDi1WNSbBu6EGdOdOxyzd7ES
CTHL62eS+KoScGIobjI3nLiJ5deo0uemBYQsI/u41RM=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1645      )
rwHk2rD2yFTCqqnxjq5ofyuByPizRH00XGgYIs63KpSC8z8a7+7GU2jxnpdP5obC
2CxvMp+SAkrBytbXr34WoPgQMsEkim9PhfWTnTBWP33it8jSXvAypMo0ln11y9yc
xdQyfgjmuQ+ndHCN4qUIc+Wcrl1xpVj7fSznVcoyHpZdpnUU9vyAeoVfxmfVwmjR
AQf6Rayn122ctBospKIuSnTto7Dk0tlDxvXOudfm0w+t+wSWzZJdc0bkjvH6bV+N
wEsg5l7/rz8+i7eIpYKAiSaHuEYaFZHeLBbpPAE6r4sS96uYbRhiuKgbujsmfXDZ
Lo9GRTwPYy1/Mm1INgPHclCHf80n5bJPIog9nr6wjO+DO2kH7g97ZJf2/w9tknnV
vjymJGdx9wnifXKTtzrxC8EgU9jHJDamlSWxbPBLVvhmzk6I6r+aeIpaeErV6xWi
asN2iFPkGWRE+vc7GSvpUR4WwFOx/zh56isY4HyF+h0=
`pragma protect end_protected

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
pAMXaFBmTr6OLfEDnkPPAXcKxdjxcFMgOBUHvrBpGImY1qm+aijzS7rqAqart0Qi
tGf0hTJkPekEmSPrDkChhqOCWEC4XECDerFZESXy5pKKOaJJMxna9FMmRnlqGlDP
krYVf4lThpKVIq7gZRjHnfZi9C6bIehzyZdelitfT4c=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2847      )
iC9SRte9jlZRYZEuxJZ+fUEocEUmGG+zl1ziT/3100283m1UG8b7lXG12WJJ+0ii
TXCSc41D2G1u/vEOHYRy6XANFQaiK3KQjc0vjQxW6Q/Bazs6EXjcZdtxPgNH3IXe
yROEiO8sHZ1/sRYzAj3QT5GSylxzG/+t2agm+gxeS6M+czABpO1omKNjtgq7rOq3
0DnWpBjtjgXNocHTh7b92AIk6P/mQlq4Buhr/xo9P58umB5TCI5SeLE45dlfBIfh
gTQQQwKKNQ7ep71bh+aB6QcSAj0wLNu0dYBNNH7XE7mIFdEGSPTdw7CS0NFkh8k4
RplsfwcNqcxhnLHixm7nkRzUU6/PXZOLlol5dQsRRZuUOxfp/a+vA1kU8H7CfQuL
M0FLaLfEb2jEkLKu5IcToPXQJA7MzYYzY59gYPhZrIoZElScBUyxm3+8ksEjbHp2
mn20AH/OHG9es3R9ayEQ27OlRjvzhbnqiD1lNbADx0d30cbjx2CUAQ7smUcSXEii
VKLLDQvm5duYuLQbULrLRy5AKQsLAaUnTJ/kcX+4FN4LzCo81HDL6KnrpCZJHU8D
Bxn7zG0h3UmsY/1Hub1XN5j8AMs2SWJJp6A0adq5pxYScIT581tLbZeUvJXr3QpH
jiKTjFy2d5umdekWm8SOOUOkfdAI21kdh+TGdLf9fCrpBlaoEbodD5kpY4t99l3G
6IeePraej10x4VEC0wrvyzCwHjLnjJgGYm4WuRA1Xevjlhyp0zmUo0ePc5SXfzg/
pvLdXpF65pvtcq3MrKc/5jZe1sh44VMgkhw4Fzz4Wof5MeQ7Y0GvJmX7SoUocDW3
ePDieLtJKN9UkgAX1Fx6IYrpEePILziJZEFmIv5S5eZpiOsqL0PxhrRJgYq074CH
rpo9tKpR2fG0CSFXCJ41SAztuZ9U6xdOYYid/qRtka1rS7D/zdb2nE8beOxKcG84
V5gLyFCE0/1lbhhlkF8UxjGusDr/ECQt599ONbXitJPrRfh8+0BIwb1mvz7+8pXr
c7FXL5uyvTgRUHgMktdog688OfoDQYtxPTlRRwkLhC0SUeYDd2QcIxPfD9iiIW7+
minsf1bKWHZcpZYA1KWacmlw/vdcguZ3Eq6zU3HbhDBR8DWWGUS6I4e7MBmvEn0X
t6sf4EwNpbMk6ka14aMeW6gAVd+rzyYtIbEz7pbFxc6F1DsU0XHHJO9J9Hxz5JR/
CsOL7AFxjHh4/Hc9nRRBJfte1Dy5YiPOXE9GhLk57VMuqegAvePgvA5ttqyCQhkV
wKFpu4E+8Pn7FgNMy9IxDjQKNMW+ECCBmfVKLNWi22ESQ66UcygYryweov5rwz5T
keZ5I0qdoVwryMNqiwW5ppJrRIJQZOErd7lzd9rRWs09O1DG69y5D6TPcVyG+7Zi
8xr93G51baw11c76njbXmrvkFoiW8f+8JPtOV4xGc+NOGhW9T/Iq3ptmXu7O1PJP
KDfy3gWfBDOoBs/ZuSHPo6L3Ic7766FheYe8gpDbLs44ego5JD1jR1AOb8MfkaG2
hFyJu9Dk6tYNpyBrb4MH1JxJwKsfgprXL4/JJo94q4E0Qguq/wrGBgbihnPcXcUE
rP9nKtJOfr/rcEXRefyctQ==
`pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new subenv instance, passing the appropriate argument
   * values to the vmm_subenv parent class.
   *
   * @param suite_name Identifies the product suite to which the subenv object belongs.
   *
   * @param name Name assigned to this subenv.
   *
   * @param inst Name assigned to this subenv instance.
   *
   * @param end_test Consensus object provided by the env to coordinate test exit.
   */
  extern function new(string suite_name,
                      string name,
                      string inst,
                     `VMM_CONSENSUS end_test);

  // ---------------------------------------------------------------------------
  /** Returns the name associated with this subenv. */
  extern virtual function string get_name();

  // ---------------------------------------------------------------------------
  /** Returns the instance name associated with this subenv. */
  extern virtual function string get_instance();

  // ---------------------------------------------------------------------------
  /**
   * Sets the instance name associated with this subenv.
   *
   * @param inst The new instance name to be associated with this subenv.
   */
  extern virtual function void set_instance(string inst);

`ifdef SVT_VMM_TECHNOLOGY
`ifdef SVT_PRE_VMM_12
  // ---------------------------------------------------------------------------
  /**
   * Method which returns a string for the instance path of the svt_subenv 
   * instance for VMM 1.1.
   */
   extern function string get_object_hiername();
`else
  // ---------------------------------------------------------------------------
  /**
   * Sets the parent object for this subenv.
   *
   * @param parent The new parent for the subenv.
   */
  extern virtual function void set_parent_object(vmm_object parent);
`endif
`endif

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
WyOsmuBnVRkYZxjrLHGkdJGvjUpw/2jwZgfVwE4oeyThKx80ha3mk6SKJtKvpnOu
CYAnNV6TDhM/pPvFd6k3vCdwCRB3i8C4FTcZf+qgeXehWNtu0kRyzMrcgrIT0auT
SNBm6sp4rE5knAc6HioHWOtnw72AGykN/TQjzp2GKiE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3250      )
Q2QBloOiWoo4qpW/oMZc/Dpa17GbAb0YFqKsy91QvxxQDTk+jI90+50/VW0SYfKl
JFbkT5EqqlUQKpSMPL4xNf3PHQTrSwTxM/Lez/vNq2Jm5DxAnlNQF8yUud/qMQ8A
88ivE9HRlztT5OkiQH6fWPNv1KHpG7PiaM7X+CsB6Xc8k3sfvmcnllK/VQxX6j4F
Ple/8MoUS6mOnXns4R1K4x4+Y+Q+Jk/9F/d829/FNrSrYMxHUlkukKgtQad1jWgL
eUaLoo7+WZsnUxWYA/R5QxMKYdarS9U7IIVC0GQlJztCKHugHEc1bb/Zj447KSPK
Wyj53zu5gs5XAkX2PYUBXGH5y4vzgrIOaw2atgCcfzOPVtTIpT57rs1v5rKgtCJq
f9WDL2c0jnFJ+/FczXja7RxOvjrdvIdWLU5u4Yl87/LdmF89YP/Rv4jTc4BdtgBa
Ks+K3ndGZllNN+OW2TXOUpk2B38JYg+O6chQ5hNMZoRkmO0hJJvDyV+eg8Z0cmZY
Tv3r6FFtmSSy1dJV/DTPs+oH9nl+3zp1snFb5W2Lf+Q=
`pragma protect end_protected

  // ---------------------------------------------------------------------------
  /** Returns the model suite name associated with an object. */
  extern virtual function string get_suite_name();

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
YsP924AAOtn7WM8vDkK4bjIGzTszavLUyZ7oL/9ICGZ33It6w0AazJehDTYS92Co
4MT/+G0QotgjYmumxUxb1/FgNIE866J/wX4M4aqQWpzczTiae4iFyFgJBJBgIMZ+
nGRSTvOfo8WRx/8wgduj/vGcnEDXeTbmf1n37veBIE4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3553      )
lFbuf1Q7JWhBTCLTUyHz75+s32YYJD4aN7VQMtaZq+DKUozxg1iCOpjwx14PKprn
DrONbbOO4mfQmi6kVnS9+YRB1NhWn55lrZF+88jidu5lWzbQy3vDwuLaK+U7itgt
qJZW5SnNAusymDNGZGjDt3kuoWKET+ES3nKcQzUIQPkcNcahTRJ4UVEsOrornpbC
Atr39iZBcn4ZwqPRl4npTm00c82fCqwM6sn5Ica06eKGS1r/bFNeAdmLby2V6v6L
8y8kOahbrzwrjAlAZEFmmBSrMLYRfBmPlkyBr/0JNX9B/18UnOQbhaiJR3B2Xyvj
Gj7M1gkbYMh+u+HgivluUt4ynNyhEMk3LbSoC5R8nhSHoTx2dteHXdlYk+On0afT
xlwPxWcETFPDHZH00YobIQ==
`pragma protect end_protected
  
  //----------------------------------------------------------------------------
  /**
   * Updates the subenv configuration with data from the supplied object.
   * This method always results in a call to reconfigure() for the transactors.
   */
  extern virtual function void reconfigure(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Returns a copy of the subenv's configuration object, including the
   * current configuration settings. If cfg is null, creates configuration object
   * of appropriate type.
   */
  extern virtual function void get_subenv_cfg(ref svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the argument
   * into the configuration object stored in the subenv. Used internally
   * by reconfigure; not to be called directly.
   */
  extern virtual protected function void change_static_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the argument
   * into the configuration object stored in the subenv. Used internally
   * by reconfigure; not to be called directly.
   */
  extern virtual protected function void change_dynamic_cfg(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>static</i> configuration properties from the configuration
   * object stored in the subenv into the argument. If cfg is null,
   * creates config object of appropriate type. Used internally by get_subenv_cfg;
   * not to be called directly.
   */
  virtual protected function void get_static_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Copies (deep) the <i>dynamic</i> configuration properties from the configuration
   * object stored in the subenv into the argument. If cfg is null,
   * creates configuration object of appropriate type. Used internally by get_subenv_cfg;
   * not to be called directly.
   */
  virtual protected function void get_dynamic_cfg(ref svt_configuration cfg);
`ifdef SVT_MULTI_SIM_EMPTY_METHOD_FLAGGED_AS_UNIMP
    int dummy = 0;
`endif
  endfunction

  //----------------------------------------------------------------------------
  /**
   * Expected to return a 1 if the supplied configuration object is of the correct
   * type for the subenv. Extended classes implementing specific subenvs
   * will provide an extended version of this method and call it directly.
   */
  extern virtual protected function bit is_valid_cfg_type(svt_configuration cfg);

  //----------------------------------------------------------------------------
  /**
   * Used to identify whether the subenv has been started. Based on whether the
   * transactors in the subenv have been started.
   *
   * @return 1 indicates that the subenv has been started, 0 indicates it has not.
   */
  virtual function bit get_is_started();
    get_is_started = 0;
  endfunction

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Implementation of the start-up phase of the run-flow.
   */
  extern virtual task start();

  // ---------------------------------------------------------------------------
  /** Displays the license features that were used to authorize this suite */
  extern function void display_checked_out_features();

  // ---------------------------------------------------------------------------
  /**
   * This is not part of the defined VMM SUBENV run-flow; this method is added to
   * support a reset in the run-flow so the subenv can support test loops.  It resets
   * the objects contained in the subenv. It also clears out transaction
   * summaries and drives signals to hi-Z. If this is a HARD reset this method
   * can also result in the destruction of all of the transactors and channels
   * managed by the subenv. This is basically used to destroy the subenv and
   * start fresh in subsequent test loops.
   */
`ifdef SVT_PRE_VMM_11
  extern virtual task reset(vmm_xactor::reset_e xactor_reset_kind = vmm_xactor::FIRM_RST);
`else
  extern virtual task reset(vmm_env::restart_e kind = vmm_env::FIRM);
`endif

  // ---------------------------------------------------------------------------
  /**
   * This is not part of the defined VMM SUBENV run-flow; this method is added to destroy
   * the SUBENV contents so that it can operate in a test loop.  The main action is to kill
   * the contained compoenent and scenario generator transactors.
   */
  extern virtual function void kill();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: If final report (i.e., #intermediate_report = 0) this method calls
   * report() on the #check object.
   */
  extern virtual function void report();

`ifndef SVT_PRE_VMM_12
   // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void gen_config_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Enable automated debug
   */
  extern virtual function void build_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow (implicit): Route transcripts to file and print the header for automated debug
   */
  extern virtual function void configure_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void connect_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void configure_test_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void start_of_sim_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task disabled_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task reset_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task training_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task config_dut_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task start_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void start_of_test_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task run_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task shutdown_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual task cleanup_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void report_ph();

  // ---------------------------------------------------------------------------
  /**
   * VMM Run Flow: Phase tracing for automated debug
   */
  extern virtual function void final_ph();
`endif

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Veyu2u0hHIVMwe4J7zyZqsSECDm1tJWS8bY2WmSgRZlwLBOeyHCJ36bv2mNGKG7H
9AIrM2vnx5F/rDq2qS8KmS33u/pkiO9VaC2tARZSCB/U16sHi04Ngs9Znyx/PJ0K
o7YomuqMfvvte921q9ysPTWr2Tok3wELoWqYvFLMazY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 20767     )
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
`pragma protect end_protected

  //----------------------------------------------------------------------------
  /**
   * If this component is enabled for debug then this method will record the 
   * supplied timeunit and enable the configuration properties that correspond
   * to debug features.
   * 
   * @param pkg_prefix String prepended to the methodology extension
   * @param timeunit_str String identifying the timeunit for the supplied package
   * @param cfg Configuration object to enable debug features on
   * @param save_cfg Configuration that is to be saved. If 'null', then 'cfg' is saved.
   */
  extern protected function void enable_debug_opts(string pkg_prefix, string timeunit_str, svt_configuration cfg, svt_configuration save_cfg = null);

  //----------------------------------------------------------------------------
  /** Utility used to route transcripts to file and print the header for automated debug. */
  extern protected function void enable_debug_opts_messaging();

  //----------------------------------------------------------------------------
  /**
   * Function looks up whether debug is enabled for this component. This mainly acts
   * as a front for svt_debug_opts, caching and reusing the information after the first
   * lookup.
   */
  extern virtual function bit get_is_debug_enabled();

  //----------------------------------------------------------------------------
  /**
   * Function to get the configuration that should be stored for this component
   * when debug_opts have been enabled.
   *
   * @param cfg The configuration that has been supplied to reconfigure.
   * @return The configuration that is to be stored.
   */
  extern virtual function svt_configuration get_debug_opts_cfg(svt_configuration cfg);

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
aX0/mcY9TsAKqc8WKsgCwWhBZDWxzogamDIvfIAgmEt71HUl6OY/fhLqRsZ839Nn
HhW0iE5xdhqJm2K8AkvekqleQeyryANr7zy1DHCwWDntxxg8AMm2VskaDssJ+QuN
ZyRpOzzXWLxXP0aXzy1hZcCfNwyeeSqEbcI+jBK/qRA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 22227     )
SadRV1zw8t5WfYv3NqDXFGS3oIxAl9/m/38oFBiMioN3jI5eorWg0r/wo3sCJFHi
05bfqbxHWmB7FSOwDjMcRTMYPHSvAyuYGWZrAqch+h0WGTPT1AcjMnMd2B0X7LTk
icaSDalPoESqSm/D6q80MlHpi+k2VB192gBfPCkotWYMwOsWYl8ARmFXEnD04P9q
fTKtWE83OYmKTmp97wtBa7p8CPgLIIxM8xn1LBz7CTk//yuC/bKvmfHEl42gZu9o
AXpyO2anvpTJlKNCf6tNNcnFDdYDj1+wD/Qrqp66HQ/wleU8eO52fKagGO6DiDG3
X9Q9y9xZTed/quqm/QPDNDP0fg22IPhO9jTjfvjHxE+lazWoehRvgQHVgBLzcz2r
7cKv4qh0DqETPmad1nbwSzX2q65rwj0SDl/EFQFkwiL6Vmw+pSy6cTcmE7WFJdEt
+UMbY52Hcxefi1wygyfjqEIln8YVy9EWURTwobeQv5r/SmszKm0I0ATrBxjM+F6S
Z2pbIokjSUoINHjNeDy96NM0rYFpDFeCzjpNlwblbkuZDqCi2OWsY3ue/h+sIG73
ed/tRQgOTO280IYuQx5HdFAMUqm39pWIJFXkqgeL8uZ0YyFqWf4QwFiYCCBo/W4W
qpGuXu/ii4Skf0zT2ytyMbWcpZmtEm/8H2BnSc1sAmCCGOiAg5xLMJtYtUY34jml
K5LOalPSta5B1Fxnx7fFxdoVKHHTM+csyb+I+dscZUWNLjyYwr7FPJLriLdBizXC
Hlr2mavcwT7GzdapzkSkzW7Tf0yJpfxshChxrhFdH2cMb+eVP8bzC4xcfbE0Yzt8
OqGmUIVJtnXHcVFDqLZ4+jddzTAJKg+JcsKonZKHCQTgqEcL9XEbJwVS3TbOj/Qe
Rzk6eQE0HAYcMLbFf/ELfIyWEGOuW3mwgniwNT6GQXtmyQxZ98vya/mu+Q8YqXWA
846ZMGyRi0P/mdXenmRa6csLUlrWbPJ8mcDZKcg/1p0nvJk4BSveqCUUxBf6pGwQ
hVAV8cstV9Wl0yK9/DvsESnGK6m6WDbt8WiAFW/OVOwcSVSbQGocKb7HPGpbbto3
+WshaC9ISzkaANR4JQDnFAaQGgvb6oZ0+id79EMHu88s/UKhm8CtYQsPYSYv0O0m
IWUx1dz+31eE+tV7vOyYS7Uvsj5dZ+aBPZxs5kYsar1CZG7sUruPHer9BKRZ+9N0
ZITEJdLWiw1z6+ZKSGJ0I6xSyPWtW9LSaU9yO71WiZRF/dqFn2VDZiLq2O3TDUpu
tqztyURJ23LXFQ2M0a2AP9riY3yoEr6r2yJr6yofCkzrZUUVXNdDhoc+pYYYbeo2
qjKZaXaRXjRtnEii5YfNY1k6r0sAeFsrJSsbyEo/bzjzITIXdfHagBsiflTBCIwy
HEd9haFNQwv+3/NVZGJA0+GBWlHB6ALk25G7mn+hlQ+qohZ3xp4Ge+QFX/KOLi99
7cvqSyqDwPXtbeLq5RymD9Fmn0laODwzBqQgSqZoHDUcP/eRwOFhxHeKflqbMvGg
6nxiFobbAEUgQUd5nEN2IXqiTOIqBb4PFhRSnxYTBNYNbEPZaWyv8z4p6PVShx3/
VEhG/1RU/qeXxpVyjQiHgfRY2ro79etYI+Go2zllJDXANG1eSttEEuKKx8YvfMNY
2x3E8kzNQmbs8lyDsVud/wryqFbVSO6ay2yROMYGPI4YOIVG1HIKBOdfySd91lqO
cR/EGvuACORiB6fn/IrIHdfEUnbOuTfol0USqIulbb8/9KP4c5tiNZazW95MVkg6
pDhREHVBsp1MkCdcV7ZmrjQHho4JRFw0dwh3CAxk6W+XSftaXatIeWlIiXqSRut4
ssfT4MSisLoeSN5KE3WNKT6NuVcopAlev1IfVZnD0AOD9VHHyRZDkS1ALxhmUZe1
ORQ2im/VGKYcdGAUr22QlZ/jXhXU99dSf/Mdifw2sms=
`pragma protect end_protected

//------------------------------------------------------------------------------
//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
OZJxawqgspBvAf9mEfcO4yQ5UVZdKwY8IjmNOiYRIuGyIXfScyfqsfidZ4G1LsTD
Hv6FPAGdxn+Izc9x9tV3Mv8Tioce5eL4SrlGX9rGJh7tCKdlDvIfGWnE57oGGCSp
7wZ7C+q/HRi+kr3BDTYgxK7H3xAia0D0gYvLI5yYIcg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 28370     )
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
`pragma protect end_protected

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
X/tN5MfS5vF6mKfflJtOovDcOMyeNokdnKthn5xO6ZkylhRFUn4JqaGQnZa9USJM
E38oyVa4OXCqwSNqzGMrNBzGXOenSLHm0mNiFxVqn+2g0PNxnXo00DcRJJXXJUey
0me2X8DuhgqiumsxepqjG+CPPp68WH3idMv+aSRnZ0Q=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 30261     )
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
`pragma protect end_protected

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
dn/Fd4LbKgekqCDVN7EkWpvlm2XQ60mFdb/9XCSikxYF0kR3di1A5SPzT1YAXN1T
knFmSxep34iMQSbt59pwCk541Ock29S9u50Vbo/yUKe5C+p4LMUsdksgZPyCyRL2
r7FCRctrgbuOEP66sh7FQPH8cuF6e86NzEy4TIlMxMk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 35975     )
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
MZVVBTu8YOEmqryV5Ls+mQ==
`pragma protect end_protected

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Yru1cCi8iGQCzquSbJxw9MtkXQY7sgQzaYZdsdO51rA/msaKfpvXjQePI0ZFyDSH
9R+8H6ZMy4mdz7XZpMk0W+Ojw2teKkRWMGyGV0icZxdGow54AvHtYyZWMaXkm+vR
tP25426U4fCaR83pzTdsj6Kekfye9PhXNRpePnJ4qoc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 36524     )
ws/21StOZrCmhDB9hdWBOYV8PisfJnmMDGAY7Malr1DUJjIFNbwndBsMkfWGNLhS
xdmOEQr2P1zp/LxGHH+BAgLtx6lP5ALy1RF5rN8vo32iumKS1mFANIhvGTVx9TBW
7bak4nBiEeC7WQo8LvAb/pHf4KdrT2PVgivLMFg41ZAKkLYHPTmxdkjnLv411uqm
d74uk+4dYsqitujEww4W9k9CMdsEXywzsV6O/j+Srub7pLNSwSCK4ak2t7NcvP4G
tvhRdpY5726XkPTG4u83ovXbOct8TTGupYhxAOT/aVa87AC+BlnFBg/FHB5s1+mB
lTWCt405176pSs0/i+FcDQVELbdeIZmJDcvs0BzATOWX9XnI/9POfsUcomwU2nY/
6S0u9saNLpJ6lOu92OP1RGbftY9R0w+g5CMHHBOkGnBUHKBmrCF6WAXvDwbajG6T
40ruNLJ152jnTRWV/NfSjVUmiREIZShbmJxXQico4Z6+RB7oj03pBo/d1T9BPKu0
ZSVf9xDEEJEc91Q4u6F1ArwuZjOYQSM7eFLuQrugHE7g0c4CVCwV2sLzzu3zqW/+
PB1q1trgWElCL9g+wnheN8UUhjVnXJu58Y4Dxs3Ne/of9WNHuDh2zwgBbEx+e+9O
TrvdBJyrGiJBX3sknmiTJgrk6wjJooR/p1sHewK2fdKnQKvpiR3vPeslMZBAIR0E
oPOkk6BGI/yjSUBW+7lV+cFtKj3oRNgCeHMeB6JHdwA=
`pragma protect end_protected

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
IP7Bu7jVJa9Z5W5YYvwTz/Ff9jCKQV7mhpp0XwrgeBINnquLKRnicE/V1QwXGKWs
skEWGHaxh4v9AZ4NlMZi+2s56oMzaiVtqhMvKapJRsAIXyY/JvwDssJwoVhqZFkU
zuBgiYK458shc3fC/M4/WaneqgPuXSa/jY9sZSYtVKk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 56953     )
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
`pragma protect end_protected

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ZtraRavzwH3nAnD/0RNW+J2F2uRQD5bIVT5/aV1qntXy9L6W8iIjced73fydqrJZ
7dRPGbvSBKzgDHbEdX82iVWskC7CUtmZoZXNcBbfwzcP4Da6lj8u7WFTbA96jgsn
n1oygCGU06EYyAqmcgLNx7YdYiCPpMng0tXBamlv+cE=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 58230     )
2BFqOsil0G7iXNyX/EwBLfpzffbla1d4PPU84dToOmsNDcPXcxCv88SsH6uVOyDb
MfxO84FmhJxH9uOFOEus2yVCcX0yCXMJULLqQWvOd2aC1DBuVGcQfpo9gMbdN1lK
vfiSJ/dFhfe40+Amy4uQJTXJCdmXVmCfggYEOfR69dUnsDcefMXG0aLLXS9DqvMK
f4e7dUU9aicHI/47foR8Tzj5LkiTP6Rh1wqtNli6tTF+QbMDc6o42chrEtjFeVs9
84DvVJf5KEF7pL8jmqVmxAhO8EGdyNjvdE+0hzzWoVB33WBR4YTQ71XbbE+5X2U1
Emd7Cqq9PLck+VVnJtxrHTQkjygMvsAGsauNowyN4Z45cyWbmunQQNA49riiIII2
qTAU2qJt7rVhJEhmnWtX3Zcahy2eDcx8Krqv074jz6eNMFsltfoao72fMp3kEzzn
yKKq10wggdOxMfytVnUdDslwrU2HjxbI5b1ysD3dz90/DgtVBvrdSJHRbA0UXwXy
FmXXd9/TaPaYIrDqiJ2o89eVzlHS0YZBW1lrD5FJTDNufYPZbuqAt7oLTc1l7HWH
xFj/na2SamNBmwdPGuq2nFYw+W0fjkqBe8aBksd+QcPcFUFEfnRmpzncgHakV/Vt
Jfr9OMKXdUj6ofcLkYsq3aGJp8mxOytSOzCRalENDa3Irry2QPW4Db26gtAsg9T9
p0YVwp1lDCxc9wGFAFOGVbkSxBNwgBIikh/FVCGK7L1y6zSR3infgyDI7UJGGoSH
73gEDwWgKtsuSzbTZDfn13NYNVyUFaxepWqANxeIQ644bdeAND2jhjTsMZmvmJM0
BHW2cUsy+Sq+SeCAZL4X8uUmxBK5k0tuYfecdEqJIg5ubk8ocSBgopZY4WT2HiB+
9daz21dbTKGioHI6fLjpR5q1uGEDatwv+2b361y0jOGmfIOOaOQ8YiwQTSv3kEWq
oMNHNAnn050oJtCgQ4we4RPSEQmtLUJsthx3rARWQ+RsJgnR/xcnyqy1pdCVpBFf
5NoiaOF4Tlpx8/w0ZEIsOj82aRsOX7x8M/pUmRLn/E3atiftjx67Xo7hf1G//LhS
OnXm3Z5ODGErXpa8UyHBDAsr71udjnaCFJfrKlcs1SP6sC+K4a1YtYLlXup9oDwW
5p2IqxtoktbgldcKFE1E6soinl8ZGB60gvfgNZ+vbPn4ZrtVF4FbfTQJ2LwScs62
gh8G4ICUM/nCjSNfOII16yRvU+LB9yLCXK8vBy2lIraTue1DjdmOvyp4Ly9L5B2n
/DcdNz90vL/vktZvInGi6bCyeAn4zTrdsabqvEAmh2LbpGpMtpaBOKfLES9ap7xG
sWAYp2NMDmXrj9y2l51l7do9BkG1HhoDxoYtEnBdduueAO95RNJh2DVZwNq7aDw2
QjZBxcdImzGQGmrUgqxESw0aW4Hjhpv6oTSvMUZQtAhhfO58ZZgwwycAfn8m9PhY
wgvdTCDvcSvNAOsF7ByATQVqRrDZADnVxBHqU+RTZcre0MrPJ+XNA7FBpT3di2iA
sJx5Wyr4zpp+1W8IGjpCtU2cmiEcoRBxNuW4mM6m5tpx83tDyPC8Wn4n3lVM7szu
KwPkEkeQqw2A7Ha0wY3TzgXWlfOKP/D6wxC2SwUnNeXVa/MEO+YJI/4gamvIKaz2
0TxWC53h8gRtNCZdSS/dDj2UJ58/SPbrAgjNnHXyq7c=
`pragma protect end_protected

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
fa3pDj0c0X17JINArEzhaCLRmUJdQxchjp6n8vsL159OSooDFKmLkRQpkoMBcbo1
ciLAsQ8xQR3wFEINVkNpSEZ3/eiB0DEMnzelCblCTITfpgkS9kIV6SdhrVpZdMRu
w9jMbylaAUPnGN6r4Wmj4oemZYFcJ1ZfTEtXwvwvcCI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 63081     )
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
PRHTWnLPCnJBeBPs0aC3Qw==
`pragma protect end_protected

`endif // GUARD_SVT_SUBENV_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
d018S6/hvjS4bm51cQY/L/UYmuy86ynqTsI1GgL7gaFaiOkfMlbCwDEtSMS2x15o
rAeqGbxflZZOX06xU9mswjHE5dt1OKrPXmhVcokCvoAYaW+dGle+FzQAesX8O8CE
qqLeuHCFVOqpIlLJIOC+SN9SYoNuxxJl0JLT38RYYhY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 63164     )
YdGvqJUFBmOE/5JDsfqXGWd04tr9xlDS9d4ROxLsGNG4F78iK4wbc+vkrZ/QFigS
9O7kbvFDVnof6dMPDinzhN5Se8qm4oPskMMDdym99ThGfRgjB+mySOuRtNPk+Q2b
`pragma protect end_protected
