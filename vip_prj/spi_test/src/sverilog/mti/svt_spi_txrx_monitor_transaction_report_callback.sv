
`ifndef GUARD_SVT_SPI_TXRX_MONITOR_TRANSACTION_REPORT_CALLBACK_SV
`define GUARD_SVT_SPI_TXRX_MONITOR_TRANSACTION_REPORT_CALLBACK_SV
 
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
d4VeSK1w5lxfMufzBpoe4pQe9nOv5VPBuGzX1rwE0uqEqLZ+utteR2SQv0cWSQvJ
Ipgwpz4bFzZ+seH82YauFx0LpiX7nI9QlU4r9uOHkQYW+8BX9NurRTGqgBs12kD+
I6y+JmVu1DFebvkPxxCt5sRUaABIi3dQX6YkSBjuYA8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 486       )
jyteZr0LjNjOrKCeS34QBCjsT6+LdxSFckTA4YI/ZiCoqWRqFDpYDuU7XjWdVlsE
1nocNxzwSY+KxEOk1+7N6BV7vzN8paVqed+3Pzt5GJd60mslISjdVOOQa7CPBU0P
9opfMVHJ9sXtCsvrqaIxDiLrrER4ua/O29dXdveeMPSU7CzLPti+OkfY/dSyU/ix
MblcGBUSeDO+ZFxQSAYpp74BzC4lr7pT0Bn/qts6jlZT1VWMwF/HL5rkgZerqPd6
vc9emfe/Dr6VBTbINSnq80zLThVdbthZPTaZVK2d2FKUldRoGJY/lpWxjcTauxB0
aEFTY2ErD/8CecGzIzjT9donZQchsFuBuCVcv1LSgvk0bWYre2MD4QoDx+sHvByE
7cQeVn/jFiDTbfYD5vOqkJvGTZi9VwU386Cwn7ky2ULVpNUJlmpIpSwGoQpIfuEs
rWA7JKnIqzNtFL3ynYGqYg0kkMbJoGe4SVGbQ0DKo0sP6xSAQn/Gmg2TSOri0Y/8
JjdXlyWTmlVU9zwAL1ePTD6NnQOA8TaSKs02zPc8nVFh6x59/bvFy30Oazp43qoH
RPM/+3StltGPOooYJHepvoafNrZ7JSbYNl80vnAwuvUybL5v1TMWSBgJaXvW8aMg
xfQUcNFjwOXQQ1Tayz3Ijw==
`pragma protect end_protected

// =============================================================================
/**
 * This callback class is used to generate SPI Transaction summary information
 * relative to the svt_spi_txrx_monitor component. Transactions are reported
 * on as they occur, for inclusion in the log.
 */
class svt_spi_txrx_monitor_transaction_report_callback extends svt_spi_txrx_monitor_callback;
    
  // ****************************************************************************
  // Data
  // ****************************************************************************

  /** The system SPI Transaction report object that we are contributing to. */
  `SVT_TRANSACTION_REPORT_TYPE sys_xact_report;

  /** The localized report object that we optionally contribute to. */
  `SVT_TRANSACTION_REPORT_TYPE local_xact_report;

  /** Indicates whether reporting to the log is enabled */
  local bit enable_log_report = 1;

  /** Indicates whether reporting to file is enabled */
  local bit enable_file_report = 1;

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  // ----------------------------------------------------------------------------
`ifdef SVT_VMM_TECHNOLOGY
  /**
   * Creates a new instance of this class, with a reference to the SPI Transaction report.
   * 
   * @param sys_xact_report Transaction report we are contributing to.
   * @param enable_log_report Indicates whether reporting to a log should be enabled.
   * @param enable_file_report Indicates whether reporting to a file should be enabled.
   * @param enable_local_summaries Indicates whether the callbacks should create localized summaries.
   */
  extern function new(`SVT_TRANSACTION_REPORT_TYPE sys_xact_report,
                      bit enable_log_report,
                      bit enable_file_report,
                      bit enable_local_summaries = 1);
`else
  /**
   * Creates a new instance of this class, with a reference to the SPI Transaction report.
   * 
   * @param sys_xact_report Transaction report we are contributing to.
   * @param enable_log_report Indicates whether reporting to a log should be enabled.
   * @param enable_file_report Indicates whether reporting to a file should be enabled.
   * @param enable_local_summaries Indicates whether the callbacks should create localized summaries.
   * @param name Instance name.
   */
  extern function new(`SVT_TRANSACTION_REPORT_TYPE sys_xact_report,
                      bit enable_log_report,
                      bit enable_file_report,
                      bit enable_local_summaries = 1,
                      string name = "svt_spi_txrx_monitor_transaction_report_callback");
`endif

  //----------------------------------------------------------------------------
  /** Returns this class name as a string. */
  virtual function string `SVT_DATA_GET_OBJECT_TYPENAME();
    return "svt_spi_txrx_monitor_transaction_report_callback";
  endfunction
  
  // ---------------------------------------------------------------------------
  /** Builds the data summary based on SPI Transaction activity */
  extern virtual function void transaction_ended(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

  // ---------------------------------------------------------------------------
  /** Builds the data summary based on SPI Transaction activity on TX side */
  extern virtual function void transaction_ended_tx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

  // ---------------------------------------------------------------------------
  /** Builds the data summary based on SPI Transaction activity on RX side */
  extern virtual function void transaction_ended_rx(svt_spi_txrx_monitor txrx_mon, svt_spi_transaction xact);

  // ---------------------------------------------------------------------------
  /** Return the current report in a string for use by the caller. */
  extern virtual function string psdisplay_summary();

  // ---------------------------------------------------------------------------
  /** Clear the currently stored summaries. */
  extern virtual function void clear_summary();

  // ---------------------------------------------------------------------------
  /** Utility which produces trace short display and verbose full display of SPI Transaction. */
  extern virtual function void report_xact(svt_spi_txrx_monitor mon, 
                                           string method_name, 
                                           string report_src, 
                                           svt_spi_transaction xact);

  // ---------------------------------------------------------------------------
  /**
   * Controls the implementation display depth for a SPI Transaction summary log and/or
   * file group.
   *
   * @param mon Component reporting the SPI Transaction. Used to identify log and file group names.
   * @param impl_display_depth New implementation display depth. Can be set to any
   * any non-negative value. 
   * @param modify_system Indicates whether this change is applicable to the system reporting.
   * @param modify_local Indicates whether this change is applicable to the local reporting.
   * @param modify_log Indicates whether this change is applicable to the log reporting.
   * @param modify_file Indicates whether this change is applicable to the file reporting.
   */
  extern virtual function void set_impl_display_depth(
    svt_spi_txrx_monitor mon,
    int impl_display_depth,
    bit modify_system, bit modify_local, bit modify_log, bit modify_file);

  // ---------------------------------------------------------------------------
  /**
   * Controls the trace display depth for a SPI Transaction summary log and/or
   * file group.
   *
   * @param mon Component reporting the SPI Transaction. Used to identify log and file group names.
   * @param trace_display_depth New trace display depth. Can be set to any
   * non-negative value. 
   * @param modify_system Indicates whether this change is applicable to the system reporting.
   * @param modify_local Indicates whether this change is applicable to the local reporting.
   * @param modify_log Indicates whether this change is applicable to the log reporting.
   * @param modify_file Indicates whether this change is applicable to the file reporting.
   */
  extern virtual function void set_trace_display_depth(
    svt_spi_txrx_monitor mon,
    int trace_display_depth,
    bit modify_system, bit modify_local, bit modify_log, bit modify_file);

endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
CU6r6URB7yUzjPf91Jc+eRU/lWyTsGxbfXbi5VPXOjnYW7/tNXKHq50EEPNsWe/i
IHcRvxQWF4hM2BqWRf/8rnfDd0AJxNV6PBKcX9LyU35V7I1WP+pCWS+UTZccHJ0X
I13fX9vnAL8Q+Nxxe0IKFpI1APop/ktZx6SOa+KoxHA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1459      )
tmddIEtAIraw4GVnV9zdmZXkg/k6TzPysUg+LPtjJNy96Yk4AhsUuWSKsDqd0YXR
75DsYAXY2KrKjqqcJb8CJuvQP4nFO6qZmSCM4ArUgzgynPkLBbAr8RtppvbTPJVU
eG5vzw2eSEIplbuelaeqDC8p3G3fquTKt2jr3LFEseYH1ekO4T2wEFtC/DrCNaPv
USQ0VTexktTWIWKn1M+7733OLV/zR5V4vMBDNinCrwbVQ/+EYjlO7PVLu73xy1hW
bhH8rfGosgtVTK/7PIkST+2TGuBS2izd1s2gUDZKt8REPTe0c9A16zS/+wcC4AvM
oOvavt4x8jdNQG3ZvTs4tJGIUYxicKkMstif/EKsbRwoaxdxo5m/3nvUg15sYlo6
4mOkFoWlh+K9L0bEuijJK7xfCIQPOd9jkFykGYODLbHF2nB7r7nYx+A/SeUh49Gg
r1er8VDVIgMBRK9eeSkfiEARZakTjqrKz8TpeKzaporIWMz5SDGRVq/OxWO6uKlB
W53TPIXaIDR4jqNIOhKduCaHA/RWiVO4hGYFplgP0HlQ88//b4AGG25U1G0Yf98O
67XWziXTUI03GvN/jtbNUdlfNPQIfaEEpZf2akwHfP4PhO2E5mF3w16KR174y5fl
kX2zW30acYuTz8My+HC/doIVm8OvLOWvMOG8d5ibQAEKBIQZ9Im0zcgt8COpyfIk
4KXGX0flTBAhXumRXcEGpHv5vI+xAW08eMIUluexaydK7Qh4XSF6fkJO5JCOxoy7
ke0yxxPdqwFZDsCX1/WPmoTLvHirpo5AcR4VrWu7CHXsktqPUnvmS4yNwCn9kOxx
gejuyPpePXIbjFvzC7H/DGPV+e+iHc52rnOtcF6HjlVKmF4OjeKjpjMTZeu79qTW
7liow2LNyyl0Olzg5GK0VI93NuLYVSUgt6jm0ykVQTxA1nRw8KM8Rh7cFl/3ZKDJ
hGdcS0VG0vQ9fhdhhfEYWmzPQKM7pL8XNWuw2aVz5Hq08hFDwYwEY+WuxrTSsyAw
ydq3q/zvUgDVBwxzlzEjyBZvWZglTIKTX7Qm47BQGd06iCoUkVkZajdxqDJCa8d5
tIRwH8pPAoV2Ua4JjoClqxBMZir/kXY/5XXMuxiUG38nNL7d/XEIU9YUJN7NHOIb
c82N9kFkPvAysQpA+TzRR3o+4ME7lRRivNST5z5lwe4Z0ruL8oIhThe0Xfp0DBgW
MNdXtis0XYunBJg9Cd1bdZHtnG6yWYEYxtly/itMWloFryKqEBsWNIt7NWbCLOZY
UQM6gGfwRG7Lrift/lzfkg==
`pragma protect end_protected

//vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
KbezSXPnuqNc0yZjGawqKlWpkM4vwY2qdSrWU22jL8TObpWRPiU71JVJ7UwKQtIm
Vjemz6XQPUG7vIjJDElv7x4jEKJrek9TjU7B6goFziBXy7s1I87s9QuMcoMCc/ga
wWbEPqiPC3uyvgIc6KoXVOly6mL89McfvNH3X3XQG70=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 9088      )
feqBKj+EquQE0o0uo/+UiLDcVjkn4i7gkm25pasjWWuz6Ho3T65qkui+lY4jG3i1
/LQLq43yjDjREHEWyr1p0F76mDHXhGc9G0C+wKT/xhFazXIiM+54J0MGOb5M4evv
xXwjWSh5R+Px8tipAbFOeJYpyOB0GfKI4UXKO55FZ44qsBx12qY/0AsqirbVwqrj
xNs8uQe0DojFKW1JgFqLwhMICnrpKmbG6VPpCHf9vn9c6oQn0QVlxDqPCCksUJFE
mc/4wnjjFQhQ+IeeNk4+2Q7ieRdvLkCJEtuMTmuAKk3uUVbjXHYttRHBwzGTBVeJ
kSclmLcdDuax63UUO9NWo/7ZxL95Rfg8eMRCPjxRkaLesyatTMKc8ozmWidgyByT
C+6/YOOoOpHGwxX3hFD+bTwdXU6/TSxNG3loZbTwlL8lKD3FSib5sGMrMYPQpc8p
xLGV/rnRUBcuvJI5IXobcL4RrD3/AFjguN6WdCVb0ilIY3GAIwOvkmJWk1grwZdX
j43FaDVb+CzUnKg7TdgDLv01yDyqJBBauyqbHcqgJU+mxgn23+4m7l37fGqYrmoM
RiPmoSpsyCz/DOZE3Zn7V+gKfda4M+ptPLtt5PjYY8onUDLCYil8aHG10gDyxQS3
d/U6nTkvIrjWXbLwh6Yyd3URDyOUGO2PJgU5NRsh8gGTD56p7BbjPtczuNcb/fJY
j3uzPlJMGlvENbh5jXmAuJJNQoy2BOOncAQJHf7S44s3WgAqDG/K46+dboQ+QJ8V
s9mP2SNJ/IS9R+gx6NMG3rnkzd9plRu0YUC7k9+EbpbOd8+2+daOD3Co15Q8z/T5
2s6jk+UIvbspqzRcwK3yj3VxgxcA59ltyWJrR93LJwO4q4D7JZWpwsv5RCvkIZT9
92npwfd9d/fCLC0RiKjHFLS8P5SAlef4mIPleO3Lh1KRrZW9dZm/w9xydFON+9sI
v8RVpxlBOGxjciknD8Pro7ZQ4ARXm8+1D7rpz65mryryL774kgyPoqSPYfsE4Uv+
kSbjczOSYyys1ZuFCxzMRI40RmFLkNOcG4DMjmg5Ii4v1HVyp/X75+AzwPu5X95a
8hmjEeeYdL7p04jRkUOXj2le8AMr2GPwx5nkPe/CkvOPtsm8vV3k2ATmT4oQ9pSc
Y3uHs9UvxxEyt+CfkYadRIlaViEO1gWj7qzC5N8JsYgdmGLpVqV615p0IrrSZVYW
j1yBPkODlGS3uMSk5L1xsYynluldNwnqE0AsIBWouLiSo3cdxUo1xOqu1TCyAyd+
FI47dbK8R0c+VVQhW5gvyuXoKkX23gG1LnjPVTp4pC4cZQ6GEKLaOKhDWy+vbWWe
ySIBAjOyabBYwDeBudEr4p38Agscny158GFdWWtiIEF2xNOeoEca6C/8j/9PIZhG
LmPQw80U3+Lmd0mtbXMCdpDwYxlMUDqaWgW8UaUmGGIM3Y+ZVo7Iuq1FDT41Y8Ul
9vOlxZ1gvJdr3IO4lnCncdkFzVH24PNj9GajEyslmR4yuzK8rCnmDZA10dP4WRsD
fIWnIZNHx9nT44wmVzWVQf70BtfA/J7ZYE5FvvqyetRNzD+/xTZTKhnLQm2tymHz
XofJukz6WU4tG1X4t84XrFLg7SdxB/C0B8yzvsefk39kZy7MQBRDSAMUT3CKZs4c
2U8ZisyOS7Hpv/n9/VkHCBiRS9tEY0pzrojPCX87bt8uuEO6sUIjQg1+l0Hr31/o
jN7ejhil8YhleFgV4NI9u2m8jNmsBRb+BTqccVEuvjzw13mEjMSVeM2g2zCJ8Kpm
ArTN/yuWuSpJQyFxcsOg5ULUz/ggqlliKYe5CBjczhESWTjkpQPWst/pGWVI7rJg
1HdlHBB3awYOsCYebCqLvuSSrLv1Xs4Eq96zPCSFi+suZJspbGW8iSqy+ssRqTN3
5tKQlJzF3uDEIj3xcXtRGEFNgXd+25Fze9vMh4RXvXQ1GyHlolCUdzmyQt+fW2Ea
gldGY2Q/6CMPbf+mi+qhTb+NR/gADZDKUHg7njIbIbmbsA/ReWGF09T+RK/aCpZN
xdkusrPAqLJHvrWWwfQ+tx5bq/ilNiYYqi2GX1kACQDs59hKmCt8QlnHufobYnOn
U2bb0sRBq6x5tSGQi10lAcbleBCPhc/ZRov9onnQ6HjLjzJSaUTeqKHbAVrAoRFQ
a43aeEn7l7RVd3nZt4pmGPk27sXIIw4IBaY8X/Pd4MAGON5TKA/jTUDtB4TAnaXG
XhekGtdeFmU8es35UOs9qc+OuSy+4qnPCjZ1/XrTFi+o/EJGO+Kyz9K+dVBZA4gX
8EfmX0ciFy9xAE//7M0182a+/vJBr6EDnMDYel6hSu4vc9D6v5ey/ZeAPMIopSfR
HepRgMtGYfD3O48eNeG/9FA7l4UsTgelQEikucW6D5A2npIb2cWO1+dcn+tipd8L
glX4yg+DJNvlyMKovpNnG5wjIhjYhbqWgNrqfguIf0LmT9MJFp3UiMUX+3cJIzBn
PBHte7ydziSMhXiE238vRACnRSTH6bU9cITYWlt//X1xN3ayv9YaOZ5iu9FJi5QU
Vbe1Vo0WQsnvkZvZehpWPpqeiAN8L3X3c6kiVNnLli+9uvh3jEwi8AuAN9gHw6eL
mq6hHxEZsgUcFRyj5v+uzA/Eq4PnI1n3S0asxIS7GYoQRfh79RAGHoTkHgEcfQ+E
LkWhWp6vtpJfe0wz3QVsB30zk0WI08l9788E6BXCUGqF4AmyaTkczPZkDy/VHvlB
hycMxTlK/CXr45AdeUwXOt1XG0cOTw5FxfqP/0fGMhBX4H8aaXkaHXyEWP9ZQ6ax
XRU3Qv9TzovPEbCnRz9siwJzY5a5hrgi9cnNLaFSMD60DrtVHBX6DlGyrJC5VdNs
6pS3JL48mw0NSDMyJOcQLWTTVqRllwmgQ7I+7kS6Bor3sAys6KyvdP1DW2vB0mD0
fghocADDlL6af/ClCMkZI1uJjSdL2lXIUP6olWQrtBsugTx/zYmQZYoZneSaQU62
NH8L/vZDXEH+q44EA43l9ecee7u2dgXT3N9SqoWKq8phEZgO4g25pdRl8mIjZurY
JmNGbtOeyqg2H6SEyZiyU+nlfXGAyQFDdup7DCNntEYJPF9pOPXubiBELN5MOd0X
wG41iAXfRorlRX+Ih4gGNTsQ8AMrLzvYxpHgv7oRjODYOQM6UAofa5wrMwdajZDz
JPfg6zmp7W9VRhVeFRAe0BaiY3zW4O5/1ixUJbUSPyp/lbJ6I/tQsBMmQakUsfw6
RYQjj4TctbynPavr1ZV/gVbvF5oiI7z2cq5p2KFldQaG5KphsFIEskNPEdbpjFH+
pLZElu57DP6YjjPfIculxKfVopc81IsqqoIX6G61mqSoRIx0vOyVPLQ7xNucVh+n
+5m26jmCSeMAlPar1cRU/cvC875ubKL0lnevFpsatbO5ejxt3A0wSSB677ym1sSU
0Z/zeKVL8sXrBZWg0v7d++k/zUVP+H/61aYj+A0K35ONrZ8KomkoxPCp4qEqRwT9
QrKAqcn0yy8/4RgKyBXthmvcjDKkoBmcGg5SWB7E0bh4NtoySy0ZkDmpl/niUvcP
Ng5IyTgAGs4aXxkg/Ff1AlJlgetDoAnZkjqQlTmn49EIH5XoFzoqYCJEKiorJGEZ
jENZdj2yA1Vj9IFGmMGzMEahdrkrL3Eh/PSDic9QPRI9rZ3tB/bWQISAORiojzdv
QAat/0mIKCf1dApeRTYQMDn0N8zcx0IrayCS8Fst7Wb4LWRanFljCB1kOyCuEeTi
zvF3faRYDFuqyZmDwEs2R46TTHPeDLbhbLzYiOXSEKR20KAcr0zSZrF/QmDXB85C
uObkAvNwbjfwXXt5fXjZXabaS/p24+5FM0yRwkyr52GzlzwV2HY54waE1omFxk8v
/K9xpux8YnUFzn9Zh7dT9NR2O4VDokhvnxtV3qNEKppYQ7bQx1kR6vu705EbHBuP
3/RhoraPfu0XLsXgfIOELhEOCoAkeqU7jmafuODBl2ghvFAST0VQNae+OFdXCL6R
mGZ7HoprTu5ce6gMpU+oeH7U52GddcK4lYVkuQiLXYWXtdIpy1FtJjAUEpmuAS6S
DOnhwXT1x9qdn8z16mYCUVLlRatl9fTumiRAGD+MBD5Y2fca+BQussEXnrndM0C5
dJ/laxo7SiwuHVXE/Bl0hMEopznNFypTQheBDBMwPHkVSfZbnM1sWrqJLq/tRUBD
csrIveMsVab+hexxNwwN0PtjEKtU/yj1Hf/MgGhO5/LUewFfWrMHJnNTA0KEhzlg
Rwwp/WRxP923RPVpfj81MGW/7gQl5lgk2xUm+iQdbg/XMZ0Lx96HXeqOicwDZb+e
G0UYuS5XV6lFJuHVQf2ayw8sYt1VA364h67A5zks0ID5D1Ey7ShowwMnWtGppb3Z
OuIvPEMDFSCHA/Q/IC5F+E3XUL6MqCyOT+adIgzHLJmuqQJfyjjqNv/05KGpiCAW
SVJGHLorOdaRWhOKqyph849SCg3bPWCX1DxRHyRuUvftBJmIXVatDBqv+TDL8iJv
OuyuMtv2A815vEPp66iz6vuvsRGUte4YhyCucGuK4GD/6011VjQD+60Ox2Osnwwt
4Ek3h0ZjbsWem9UDCPjY5uknZL9UrE709hB/D7OWsSyE951HhpL2Kc/HOvdyt9q9
0yD/4kzGhp/w/WAKlJw1cm8HuIvsMjQs8g1anOgxoSPBb2ScrdIXdHxHRyFRUiM9
RRhA/MSS+sYdEb/Do7MFEbjKlwbfmn/Erq+jgH2xX23uyyrTvqSlvv3j9dZkD+nH
gqDdg3m77MYOxzqNOjpnR/RHsTWASo/Ga9VEfXyThNEaLjwAO5skkLAV0zM/xKHA
R+YLkgxRjP16UYXBfUpNBvxhA1SFywz0/e34xNvjvrHAJGH9R9O9xwKrbO4jhqv+
3PB/5y1IpVhYZ3oHzuukr05qZjCY8nGxe/e76FnjX4tNgpPllEtX2Ms3+3gAeGRs
XO/v3CR1uK5GLkUrBtahdVPxf4Qaoh0t0mbBfn23jyodBNn1KzdntlgMKs7zfnvV
XxtZErwg7mxxRbwu3sKwYqtIfQ94mydo6VPA2oKjOQ6lDFjkGH04DJlAH6HUjMdX
YXtp70Z2B323vG8MKRjKPsC9/ITOSPsk3eEbax3oOO9X/XhWMumJCEbLDiraOXyR
4Ga/9Vn8oZzphZNfOmU61D6uAIQV5KqLd9R0N/q6xEbpELiba4wIehl6L6AOf7by
1dgPhsscv8aoGf9y1k9hGEPyPPNApnWBwYbsBL8xDXgQ21TbjfPbKDGak8mUUmxC
4pC8q1m5YKeeqHaMtL0Bc/O5k0LQbTOLMqzHGQ4IVm9zQ9kuFIB+JbvkTQm+Jd5t
E0g9XOd0clPJuqZAQRUNsnTnkCearMRR0n1pfYGzcnOk+lG6Ab4ICWJEOdv3uMOB
bNcDfADuRyXB9wBbNM1iy4Xg4OWiJ4+2Y5ESGnlSOofBYkjbl4WbteJ7BVoc7VQh
B8jBMdGuuS3yatFQaOp3P29pQ+eU++0zSty2xe8rSBMbw6wXvoFT22H5OoYBW/1H
kJTVxxxdI91igQUKT7XbJPqITzAAaf+wGjN+jo2wQ7qzeWcxuROWqJp/6mr2URYD
urKw9VMcD+Z+COBJffy5GGrTmgDCDLGPFoJwbH19zsS2GeiBnPAHGTYlRm582BEh
vO0Jp/3vwDRVliz8kiK1RND5XdPFR7OpdculJ4UoIHTLpvF3/a2dRe74b5FbE4f6
TwKyIhIe/+782otTYWFCRgkHbG1bkl0G+WDD9tLPJM0Mcnxma76v+kHKvTJlQZqz
BejXg1iBNK+XbyMtsHyWpnCEziPHcLaTPNQkKA8KYBNdAT1zNm9skYb846hs9GC0
yvwa9J57Bc0l9LxvOZF6ttL/JNeDl3EHOt4eFDO3vdSClRaaNu7Q447spiBKgHRC
6sMzuIY+M9mZ4mHOnwkhUp4tqevN4MvZPGSily5deHZmS1Jb9IGFxOgAi3Ecx8zX
KEa5uPLy+RLS0cygXXkoPHXqTdO2iqK0+FnJixgZrysntxQ0jRmCwrUd/+Vf7fNC
2aSz50AYsBye0ms7uOOtI33dviKXBTlbBjlytrUIygC9ZqmgpCr53Dsm1I+eH81z
9OTlf9vyom5K23u02CshD6hDtimJFR23kK+Jb9cddfBU7zshJ8Ql8s9vfzBACb4I
YjjpDJ3DbJfkwVkCGIJi9uhJLRWcJ2yYlP7QDfsDPTNpHRrenVSA892BlG042lHh
tT5MZ5Mw8bbJuc6fMWAy2L8L2PZG5omudrsOo03ISio+GgtUZ743jZBL3D+fEMIY
m19z2DL3vx02hTLa+n8DfUfJs4UFCY8fkclJrQOnEc1sFS++hkioeg6zZv6MT+VT
jCbTsFa1Ml8RYpAYoNlhGe44xdFi9SiO30fNAbPAK6UZDe20lhxHPsMTTOTDNsqf
kBD4Pwpy986JIR/AmeUyNuc19THspsoOjFMd0MbSgDXU+Ma8+dfa2cmh/gHsrRHM
I3cAwB/TGw2FNtpKO3WCNlayob9Ps/3+vnyQ23OKRCBOSvQZthT/9luTp9i0zX7d
5yyoPU4YxIgz9si6WdiNTHO2r7QD6qiIo+xuDIQRBAABFLh2nZ4sMlo7n4a1X9qd
On5EBPUe5Y7zKlNJqLs2VR9eePoxMGgYQDqJjNdHEMyu2SnFiGXShhnGAgq74g1f
EjKw+n3mOoVRZnkkvjP2jU1WwE9n2LgcdHriNZKbOPCAI1byuOUCk5kpM4yInXP0
CULt2G129aWM04YdRlk7+84GwXOtnhYI9mGntAn0iLU6lBNWCJel/XXxvejg3bdZ
XdisEwMzSZK/1X8TDfhwnqUv57/usvZ5gIjPF/k9F0KDyOhb1sxYwBfrasDQ6D1h
EeBA4OZVqq+nsbaynacJpFBzsPczADLgBvCf2ZDFiyLeV1aRnCTRAxoG2RsRLnFk
ueblCc2BrJIZmMO+Bkd1appEhq1ebAnGQM27Bw77St4dQwapO8b2fV/Hyr38TqdC
mH9YHRLQszhnCJ3ZJjoM/m6t53YstpiMsi6v2yKkDeICk1lFgrwlFj41fe3sqaaq
tyY5lGLsFUrKmUMXuU3vpNQQo42eljQSCZx6hK5/e+fhtFKIhDlkc+v+k+IlgmQ2
TAg8uf6GsHqiN0OimhObdteGGAewK3EgIzMkrFxhAHsg57JsztBJ5R9zBFHIS+cB
CWMQgvZ4vEW5mBaPt1ixqdennDmBT3RMdrW8m5p5sXxAUo8aW7lb2v8BRDf5osDC
Z8WFBkA/2JvyLIYZMf3V+fOvxZEWqtRYG7JLfuYB47wGGEtr1NFFAVpA8cP+aHC1
/hMYN06Wr2Iu7rUUTSKHtXS4aBSHR+pkuBsmMVOId/gwOSgVmv2g4vjHzDOkgoxf
eh7ZUod/00yTMXsQQ1X+7oua+gBd3QTmO+wGtB4HPQ+2rUu9DUslbZs6lIhQL1V8
R6Ldcvyh8ZB4kHtYdb/Ke0t7a8YfuGWJNYQyNV6kaF7rricgmzIHLqJWTULDc+FX
iJJcMs76SzLcp9SudHiGhQxMe2nD/ottVP7fGl8BNW6dSCR0tltkyLyedJPPzi+m
Yw59aR21Z4oVKFZ8waXMYH00EEJM+lzhs7OJROSjtOkS0gLI5sKKZ3mmMny4FJAw
aXVOTBe8vPHZDf4mbdDOO7wjLcxW74bvr+15GdZWkeURgP06L28KsyI+LyXBTyk4
8SKRGDhonN8oQRgElkfB+FL0bJcg4V7rjV1l42UPJAhQ2LcKRpk2THQC7uMuj1YW
6jqiyp6yHYzfVAcQ+ZKQpTkRuoQEpY4XNyi6SJVKEm/4ikVIXCC7ud5Znvmvqjel
LPU0Cf6/gaalo5826c8sV2F6AJjVGCbYFOwWO9Ovi+91Fr4VooQz3+Vvtq7ilAUi
/4BEO4TUQTvKZljHbSFQiAeUnbfMk722t06Qbn+lM4ttDVH/G3JtnqsMrJn18jk2
DNt3Y6MN6TE9b+iel1LStdJOO1rwqqKZ3A3aCL5GuyYFpXeDlHT6avlEsG4FCZYJ
BcsBs46m6aT+8koYknrY4G931lDTCqi6iRj/07FRryRkb+HCfDtHPbdGDqWWhksN
vrcTisH6eo/cBvZ2hQLl5NQjwZPYULh1YYikBuKu6x6+kgIDFAzAwEE16rwvo9yS
/bMJU8a8/kb/aJwC+wEuGJhSnfhsNnG9ao1Fp1j+BAmhj/+ltpV4xMAjzzh9VrH4
VE3D7Wjkko2b+JsrjvbSKS37IZ3MBzP/c3MemdSQv7bJALbBBOoli8aSFAc97znY
qt/M4XXZX6iJ4tLoULmBfBUytru1U7SEHuMiiKVUNVnT9FxgN/s8tV7OUFjRc62R
gZzROim+/GmFyzZIflG1kaSAMjzgsdkSW46CW9V1zDvXdKiw9K7EacTD4Hg6imve
16jnFWLpipq/XYJR4klUT37h+4lMtCTgD61sshDboX1xrxAyUqbc3z5+KaW4JjJm
Z9d2+y10c+NN1kNykzOEG4zRD4O4lCiTZNKQ3Sd38WxZPDjCDiqiQUwtjnCi1GlA
UqjdmJliyokzlOILu+4zHNrr2270XXUhqLFgAOw8agKHTwcBO2RuSBwwmPlhxnev
HMRD5IUrnWYYVHpyyVg5F1X9lVnf14eRKU1lGeWNM69s2h8MEHqIuvOd8vJf49N5
qAqqp7OpFsVWzAqiogVqg4FNJV2YQp+cpJpnokY9N6GbIzTOJ4g2W7MSLIqZen/F
ekFn3ZREcLXzonVKJRGclTsU+xrNCn9cYJjhiOUd9qUohPq4idi81z/kzTUyitre
Rq5pYncySWfiyONga++kxFcuk6HdBeltGf4sdVRTQT8Yq9EDDbpMAFe+B2SxSOB8
z/zD6LVOwfMJ2rHD/rnD81uGzlDMkJc8EP4wQu+4m++YpTpefeei/cWqBYbc6Szf
oOOpD/6FZBYxLPpj5LiPApy0QAEL2YLidwDYhWuHICqPEOt3FRo2UOuj9EhcCIYE
wbxDxATYbpPFe1Z8virxQYrZj0elRpVtf5koalreg6X2ErY7HsdCzNrMM9TG6bdn
eG+ZluFKGGAuR4UTZIKa6XG9OHPL+ah9Dtawrwh6OOo5EWpWecXwMWmxnv5G6dZH
2uc42WaLwtLbtAZsPucGbzw98hx7qX1iIemMHVnH2N2O/B7auYtxNFS4RlhHpWjp
xo2xaFihj7wZboKgYR4RbailU1aOEhhZ9DYODGNE7+NihnL/24eZG02BD0E5V48R
X0xSeMQKQKgjnSIm8bB8FUylMNtL2NHff6bOpAYOrBa21EPICwx+ZDim+pzwSppd
HkYXzVc/cys85OFckwxDpSa0ngmOuUafS77UUQmPys+w7pqZHHczWgLXrKf5KXQB
OjJ2A8nayMNgBjnY5zQBahPtAGl4sxSHDLlIyHQYFaHZaoTZW4s3N7fy2OIETEyj
zS3acx3uBq9RaNhJO5r0YF6O7bP2QWCk16QzPy0EoCjfNepnnJ/G9xxfxMJv9Mp1
GyBMYiakBE1np7G3zqEEynWnqXydBNGB0l3sIRGim0dqpuRLMeA022zUTyU1FIAi
o9IkxkKcSle4dPm8mCfSjXCxxo4if7ipRYcWyUb0I76rr47OCoV01UIQfXqVroW/
bLo0pxrf+77hYA7ldS+wkwUGJNEkNN/zAdOPslI7o06RmHYfSzkaRSJsdAi0TaD8
kH/jgjdXtiC3ySl+ZtaBVVdqm0AQ2LL+kDJ7hjyL8vNRm6o5WOAq7pcS24JfWz0p
FK9Gpln3AO0pqCuCw+ed7NukSdS13UMrxfZUrYeUb5OYiTetdIgf84eT9Q/4qPWQ
dOb2b00e1nzB7BrSRgWdrhbGqOX8IAqqA66YNQ2SiKkp5mq6D92U93OL5bM47rmR
ueHbuCe6e+cC87Hh55duBkcDmAIb55a9onkHwQlRCYNvG3H1arGjn3CDHKYBWmkF
/EseH3AIoWhyN0FswwJwlrXhnYINgyLYfkqZHRYfB2JhzDqSH+4+2H4IW+zJuAjP
bTj21CLvpsdVn+1MiYfj528UykGuxAn0J8eygcH6KtdJrVUY8cIjQGjvRCbUEo3t
f9cpe85cCTeohDHTQ2pk1LwnaAdnixS5LFTPBFwqLBFGONLaMKk6OfElLx8ljFcO
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TXRX_MONITOR_TRANSACTION_REPORT_CALLBACK_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Zmrl8ROh8goxozc6wC9X2ISSadX4uP9jma3Xxaf6eWmdCw4UBf0KC9H/l7YahYaF
/RsPxqLK31lMcG3Cw4QbXVURY/z/6d/ODWsjZ+T4pmuCkrDjhDdyUB/vWLGQ4Z7A
Tt1Hy83T26R2X6LNgxFLCyXSwLrpg4jA8cEgIh3maK4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 9171      )
bmPVN0ueISBDf/3smiYAibtRaPNgkEXIPv39Pn8RAJEUpVfk49eXt/7NmdyOHiR3
q3lzk0zwHQGyL+eYrVjYEEbw9UpkFTJG0izD6n2Vn465sN88HKDfArredbhp/1Xv
`pragma protect end_protected
