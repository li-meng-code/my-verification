//=======================================================================
// COPYRIGHT (C) 2011-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_SEQUENCE_LIBRARY_SV
`define GUARD_SVT_SEQUENCE_LIBRARY_SV

/**
 * THIS MACRO IS BEING DEPRECATED !!!
 *
 * Clients should instead create sequence libraries manually, using the
 * SVT_SEQUENCE_LIBRARY_SAFE_ADD_SEQUENCE macro to populate the library.
 */
`define SVT_SEQUENCE_LIBRARY_DECL(ITEM) \
/** Sequence library for ITEM transaction. */ \
class ITEM``_sequence_library extends svt_sequence_library#(ITEM); \
`ifdef SVT_UVM_TECHNOLOGY \
  `uvm_object_utils(ITEM``_sequence_library) \
  `uvm_sequence_library_utils(ITEM``_sequence_library) \
`else \
  `ovm_object_utils(ITEM``_sequence_library) \
`endif \
  extern function new (string name = `SVT_DATA_UTIL_ARG_TO_STRING(ITEM``_sequence_library)); \
endclass

/**
 * THIS MACRO IS BEING DEPRECATED !!!
 *
 * Clients should instead create sequence libraries manually, using the
 * SVT_SEQUENCE_LIBRARY_SAFE_ADD_SEQUENCE macro to populate the library.
 */
`define SVT_SEQUENCE_LIBRARY_IMP(ITEM, SUITE) \
function ITEM``_sequence_library::new(string name = `SVT_DATA_UTIL_ARG_TO_STRING(ITEM``_sequence_library)); \
  super.new(name, `SVT_DATA_UTIL_ARG_TO_STRING(SUITE)); \
`ifdef SVT_UVM_TECHNOLOGY \
  init_sequence_library(); \
`endif \
endfunction

/**
 * Macro which can be used to add a sequence to a sequence library, after
 * checking to make sure the sequence is valid relative to the sequence
 * library cfg. When a sequence is added successfully the count variable
 * provided by the caller is incremented to indicate the successful
 * addition.
 */
`define SVT_SEQUENCE_LIBRARY_SAFE_ADD_SEQUENCE(seqtype,count) \
begin \
  seqtype seq = new(); \
  if (seq.is_applicable(cfg)) begin \
    this.add_sequence(seqtype::get_type()); \
    count++; \
  end \
end

`ifdef SVT_UVM_TECHNOLOGY

 `define svt_sequence_library_utils(TYPE) \
    `uvm_sequence_library_utils(TYPE)
        
 `define svt_add_to_seq_lib(TYPE,LIBTYPE) \
    `uvm_add_to_seq_lib(TYPE,LIBTYPE)

`elsif SVT_OVM_TECHNOLOGY

`define svt_sequence_library_utils(TYPE) \
\
   static protected ovm_object_wrapper m_typewide_sequences[$]; \
   \
   function void init_sequence_library(); \
     foreach (TYPE::m_typewide_sequences[i]) \
       sequences.push_back(TYPE::m_typewide_sequences[i]); \
   endfunction \
   \
   static function void add_typewide_sequence(ovm_object_wrapper seq_type); \
     if (m_static_check(seq_type)) \
       TYPE::m_typewide_sequences.push_back(seq_type); \
   endfunction \
   \
   static function bit m_add_typewide_sequence(ovm_object_wrapper seq_type); \
     TYPE::add_typewide_sequence(seq_type); \
     return 1; \
   endfunction

`define svt_add_to_seq_lib(TYPE,LIBTYPE) \
   static bit add_``TYPE``_to_seq_lib_``LIBTYPE =\
      LIBTYPE::m_add_typewide_sequence(TYPE::get_type());

`endif


// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT sequences.
 */
`ifdef SVT_UVM_TECHNOLOGY
class svt_sequence_library#(type REQ=uvm_sequence_item,
                            type RSP=REQ) extends uvm_sequence_library#(REQ,RSP);
`elsif SVT_OVM_TECHNOLOGY
class svt_sequence_library#(type REQ=ovm_sequence_item,
                            type RSP=REQ) extends svt_ovm_sequence_library#(REQ,RSP);
`endif
   
  /**
   Counter used internally to the select_sequence() method.
   */
  int unsigned select_sequence_counter = 0;
  
  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  /**
   * Identifies the product suite with which a derivative class is associated. Can be
   * accessed through 'get_suite_name()', but cannot be altered after object creation.
   */
/** @cond SV_ONLY */
  protected string  suite_name = "";
/** @endcond */

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
P9ordnjH5KjIe06Dx3aQUvfSYbne26Ol6+S7dusojctfa01TnqOyvvdLhHRWMasm
agqtdh6y6Qbupd6rIXXQHx3B8cArdMG5OxOUH8nxL3MoDrhcuW+x535kyaE40DY1
KhPeA6Q1Buak41nm6LjX20YEFu7S8RddZCb05L3XNnO3C1Cj+DAtzQ==
//pragma protect end_key_block
//pragma protect digest_block
PnU8LYTDh7W7SHdSJzju7ipQOik=
//pragma protect end_digest_block
//pragma protect data_block
uTOQ7clMkQ6SjCWhvZJioVFjf9wcXls0kOpN8bhKLkxXL/ZsGKidefMr/ZkUZWtx
o7FLCJ3ztBNZxdhHsOf0AAE2oh511kFG5A3DPf8+AlKCza9qZ4bfJsnsQ8oVTVak
G1wUGJVxoJb6Rk0qEx5BVq8a70uyhaPxEvBOmFK6ht+OeYU/k3F7LGE13YXjPSXW
vREuXVWIbkOo5/h8P4a9YWAHzA6PsHP/p7x+GCcr49As+DFjZyp+xAzJUagrfazT
ktuE+J8wKp9BnhCa+wJfeVjvVM5krKlJalDjtGlIJghP0VjHsMMwNvQCaqWvFcXE
77bwej6Alk+nMJpJWudF9PdZrf++K2jCM1HsLjb/JVAuxcpHO2ZTtPqyhmE8rYqX
O4ojgXfIqEMdj8+WOe2QAmmPf8vx/2MJdEMzAdcT1e+ERecTnVro7vUW81Ks3DpG
miqMEWdNX8LB8a6Py5IfbzU1RJukgiNpbO7Lq66V6onrt2F2KcI69UqipK39wkZh
xIdy8Xb4gYKOMk1TBUypJylax62GIOBgF5bHGAoNzcMd8Rb4hCTtIyfa0PZj3Wxh

//pragma protect end_data_block
//pragma protect digest_block
AvLaE52aRD/oDJYn8Pq1jnpA11U=
//pragma protect end_digest_block
//pragma protect end_protected

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  /** CONSTRUCTOR: Create a new SVT sequence library object */
  extern function new (string name = "svt_sequence_library", string suite_name="");

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
1omsTJ1mUzexJOSeJ9IaM4TxRlw99zTAeC7TT1CgLP4TMCCXuMckpAYbmbKzSvMM
MnMt1hhrZTBhkVIPRTRwSMvZEP/IlZtMCwQYV4rY92ovzj6yf5yaGkTDiGadZYof
Mj9qbKZgeA8FAHo3l1W8l7GemtnaZkh+hyX2ED/wA+n8n5XHdlZvCQ==
//pragma protect end_key_block
//pragma protect digest_block
SdgxbnNniqE/3Ie4UTsJlssTt6s=
//pragma protect end_digest_block
//pragma protect data_block
DWoNJqOEdEIAbVygeM7MjiwRRpdNJhvfLC2xoDW1POTU7/714snDreAQJmsThiPm
wJRnM7d+VIoUAHuI/R83XX7ylQj5e0+QZUNoSUQ05a1TyVQ1FllMIyb5NrcbtIl5
B1qXnO/HkX8+lLdHAKFKHwWJQyAfJ7dmEbDKf6mkPp7IMF00dDg4wdk1lKzg0dx2
vhhEkH/xr4BK4nRaOUeDX2UpmSDs/upQ85VvJOOHjepOTWrwLIFKSWZ1e9z7SMK/
AEIAger8qd+68QTkjOQUvj+NgEjnAMAEarHWmu14oAO/Pf2iJ2Knq10m0UdSPQnu
OmRR4p4XKz+5S5hlXPSPwhurlgQQNRFfm9PIqygqP5/EdE6ezHQlaHNF4ZKwxWPP
V2TNfjsLdNDWH6U5UD740/mCl+xZpRwZ6eo05P0/427oync4B4XqpDlXH49NcpEH
8KFTBSEIaiRkrDbiH3L/QBCj621ZLg4iCm3AF3gvOTIf1TpW2chDHVQ4CN9wqQ6M
komM8nmacH/4kGNojDLwrWRMMRi51gtoZtfT8pQDJ9Q2SRbJK4HIAZljpw8rTYjZ
d4hU/Eg1c8mXaGFIfaPbm+CDB6wToFJiGoHTMGqJEMyGd3fqQtVvMjrH9UiQB04n
i7Cpo6PR06xo2A8xMfbJ/yRXrPpJzM8RZ324TaHAIep60TVqaFe6OSfuChsmOtVJ
Bp506ANHy1HJ4to2wkqDkg1cWn3v7vGQApESStZOIk16RUFebMJGT81nmKe2OBvj
MWEn1hD6ErkZA4mkW8oNdaO3KhcFS9Eam6b4DySaVTSDjUVtj8kG/fsaCNF8ypwm
gd0vaOHFhuOjpSn6VjKT/Catm1sqBiQHG8icePv8Di1UwK9XpJqAaOMqAPMWNJZB
KFhbOdoepp3e/9g/1qZef+G5/M7baYrgx2BBWEj4JIZCWVNLQOgEzo6Zhj2nnYjn

//pragma protect end_data_block
//pragma protect digest_block
n9Q+1Fz2c3CGJ1tOostBlEXKgb0=
//pragma protect end_digest_block
//pragma protect end_protected

  // ---------------------------------------------------------------------------
  /** Returns the model suite name associated with an object. */
  extern virtual function string get_suite_name();

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
x6OoxHUTrWINTVfoBdm4tpnZugpjzXgnjfNioEsfTa2C/hMOwvRDGOS6IiYZO376
oVv5W30stE8OZ8OHQ4OA7Xp80fLq39yxRxnkjzYm+52/iuE564BxbtIYW8lchH16
1mgfziTQlGDeE0P6Ai3DnYoI35qNkxZWGQg+Q7tgKfA8cxqahIK/lQ==
//pragma protect end_key_block
//pragma protect digest_block
Gccp0ev6CcOfw4zh8qZ9tKR+ZLo=
//pragma protect end_digest_block
//pragma protect data_block
zxX4eFX5w5m354glf0N7mFNOG/v3g18HVlZ0g12Q6cIOF8hnd/5BC271DV/5ZpQ+
Wjf/rSfyARGrTZEm4YDyBPTfcKiAKJv8zUSPcW2bVwJU/hA7aOtsHgksy64ZeyKF
1t+Ys9cXwRqOXDagkv4yzZsLKt+PbhQobIPDllh01WEAi715hHINXCy8swABkkHB
Spha4kHn+t5rpL1ZwpUKXk56UmkFN6X2dDBg2+zM9M8e9RmdexntNzq1yMenGRCy
m4vEPM+A3lhOlOHMNVHHZD4Jnd19GIuZEBPkUvB0ajACaTR9+bw3lMNqlRh2ccgR
h3tCkdPUp5feCbhlNMI0l74YJFluKD00By2oqs8As/pOqFsxEn9tldaq8Hs2ufZg
Hm4VyoyXMqpuK2k3I4lCy4QBxNKe66yrOXKX9wWvm8IJxns6LVbH3asEZSUYKHnJ
jNrZUb10bi7ai41HzSMMO/bSyV5Gml5RtA+fnh3UUV+/jhMGfZ001o9tubYQasA6
+YLyOyvP+xHU+1v0Klvs6HdBzxuinEwMwsLSXZmR6tgL+D9oEKxaXH08t7HgPrWf
6JrsmSUa6JZnqj50x4Gv9Lb145x8GEg+SuLSRFmA6ecHU3WARewVeiCWzI3tz/zf
IHnTglEl4r2di64uVwTUtA==
//pragma protect end_data_block
//pragma protect digest_block
PP4UY8tcGsnm6NzPHgqF3CJDGIY=
//pragma protect end_digest_block
//pragma protect end_protected

  // ---------------------------------------------------------------------------
  /**
   * Populates the library with all of the desired sequences. This method registers
   * all applicable sequences to an instance of this class.  Expectation is to call
   * this method after creating an instance of this library.
   *
   * Base class currently implemented to generate an error and return '0'. The
   * implication of this is that extended classes must implement the method and
   * must not call the base class.
   *
   * @param cfg The configuration to validate against.
   * @return Returns the number of sequences added to the library.
   */
  extern function int unsigned populate_library(svt_configuration cfg);

  // ---------------------------------------------------------------------------
  /**
   * Generates an index used to select the next sequence to execute.  Overrides must return a value between 0 and max,
   * inclusive.  Used only for UVM_SEQ_LIB_USER selection mode. The default implementation returns 0, incrementing on
   * successive calls, wrapping back to 0 when reaching max.
   *
   * @param max The maximum index value to select, typically the number of sequences registered with the library 1.
   * @return The selected index value.
   */
   extern function int unsigned select_sequence(int unsigned max);


  // =============================================================================
endclass


//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
GsMVlmeyIPJqwz4t2lru++gN+8UfH07SWArOMO5+IvQrN/u76+1ow/QT/vwJ5Y3N
AccKi25POaVc8/SHQz91v0D099VA6hIvUpRrQ7Hs7NNXCdcqcGi1JbAJ4GR6mWzj
oGJWcWwU2J+K8ar3T+5okNkQe7GgF8JnuJvKyZNyFTCKiGKfCAx6Rw==
//pragma protect end_key_block
//pragma protect digest_block
B1qtCjnM6SaHkMhdmq3uc6qriy0=
//pragma protect end_digest_block
//pragma protect data_block
f8Igx2k0XnY3xn8LNUHI7VdYyX+kK1LJhZ/VywalH/EHve+bx0GfSsmika4Hh71Z
jPSwxdZxss4i7aeSqXiTSiMP8i3fIZz33xNJdtbIVx+rsY8y8BJrnP1gBkCZ2Sv9
Al9HulK+zHNAm4zHSqQRY7eew8tQvnirQTAN2ZC+WkKhzxqgVXSaxdZN8tbgjTBM
vFVK6H+OmD9WDY09kIHdQyOD24Tbw6aNSSjY5B3ljUs9g5u79hxe64n3ciOHl+gz
EauyZS3yrf83ucUplmRXF1ptX9ywQF65czvBDHPjDjQt/5o5i0z6fG3zldvc0Hbr
obmnqHhpfzJ4bWM4LI1NUypC4564Vtbj4UrxDBq/CFNH0STjyXRxkf1Ms753eqSm
n/PBYz0JOE1cw3PxbzF10fI5bW6JUJx+j+StSLrNqW3CWVxbAWQy9cc8QXXR8g2i
rStJ6l7m7tcodGzWHwcUdoBAly+6BZrussQm50oc7FLvt+mHRalXPHgWjvtuJRCS
ZyhVTkFkmh/+3o+bHi6Ht1l/IL/Ckhx/R79+BJCk/Y7Dm00EP3FIFFiCfQSnABsQ
z3stEjJK6zjZ8pZWvi8G9A70rJKkNKjbPccw57/awiKWDtemz11JvNNSvbP+AcCK
I0GQRK1Gr9DrJmP3Dj7bow+H6bfN2pBDM69roZxxiGY5bwPmz+35R6VQA8fsgtjz
teEvLTvmPVSe7Z291MSZLJvmHpjE8HS4nL8JsxVTAPzbS3zzCPTepjACuqrX3ERc
VlFKSednBtpy9c2zzBjp9616/NZs4v8V4cXJj2j/96C3pRSLrXqoBHcz4zSc142A
pRKL47pj6KYiOMeFsgigLMERsZwekAOVXZ9TSM6b8bg8YNAvuULHjUCXZYMhgOG0
5QvjjNKFXi37d9QQrUV7IBx7Ppe4VHNN9bVzIKOtQYeN4lsecDTHPr29l8p2KnVB
qKZr/LHPgTP8+UOOcf3uh02nMNQDEfytQ/WaVmNsaRL9ojJ/mrBmbSDILG7/C4gL
SP66jhM1jVSe7DdHleowD3NqYuKIEHFOXG4L8GrIzN6C763dbXp613YDZ9rxEQCc
s2sQrUh62ms8maN5lh1MOODJ2KeHagPmCCZnyAsZUUHoURglfrv32GklR8h6Ar8m
e9iqRxaJ54nbJRx85qLpjC2dLFHLn/8oFsRyv64vIyFTIRz5fy0w8Z/m5th79mSD
LfTkV3HLUgL776VdhuBdalwS5fLJ5I6nz6WXNMi42ln+YOc5ySXT1fbfnPD9VzHA
tLdKs2Mw3cc61sHZuYUAA6tjllLyN/O8eFbu1kVJf6corfJh/Og2L1NTwuomRp6A
cYv8ElYwkN/SUdgNkVRcTyBCzwIuhIwIltxjSLUlGs1JHdd1whPBz2AG4BdRlY8V
Gw3GNxJlxDLyvYBye+h/XAb22rPMHksAC3JCAFbSRzHjyRFtbSgQHGRQOhckNbc+
WAx66qCil6nL2/5+Nb9rBg==
//pragma protect end_data_block
//pragma protect digest_block
UYsgg593BaoZFzA6r4wyaTa5ZUw=
//pragma protect end_digest_block
//pragma protect end_protected

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
K2KxMA+G7n2My2eyNGQmyi9cGUeprBRXdbO5iTgQcI5m69m5flsHqDyW6xIruCNq
SAUv4NWlrzVxQTHDB12nYkA5Daaz3LQM9sMSqWHcpugHZJRB8sauOvZUr/OUrPcT
fhVyJzuYyBdWuaSsFmPVY9Y3gXCZSM8jJL1dGV1Vj02th6WO72CkZw==
//pragma protect end_key_block
//pragma protect digest_block
c0Ch/62ZckCh0UROq3xAUZukPHI=
//pragma protect end_digest_block
//pragma protect data_block
YSOUrxEHAWxv2xLAG1ExPCte5LYdi5s/mU+FfhpYcsy21D2Q/yhzEDPvzCPMh4AE
gCs4GP3dF9WDBZf8WhTkYeRZ/CvZyK3l5AD06SpMYssPRBfwGRa+MprHYfH4HYPW
UzB6w4r82b2eytobeiEEOTbPqsEuw8wfa+b0tXuOMyBiPNCEwEL8zUWcRsW2l6HF
8sxAo3w/XA7W5tATKRZBZzXGHDI/Q4uTaX00fIvTh981vUmKfA4zw7NAATA9DJmQ
RGCf6RM+WUae4TG6uEuChBZ3vkiJpqU6xVQZLyhoC0FXdImA7CcB3gQsqjgbD0OH
tZ5husD4h+W44HcftsPg4XGu9/UNu4KAaTsZ84205TwzsTaUwOEJeIAYt1zC2KZk
Vs0hEhyLZf1MuNCuhhzvo/m4IpkWfLSVjIkNFYiBtlz2rjOsHxk9c3cDnHh5Eeml
vYVwmEA746u4WRrHkFC1JS+Z3J5TdSsu+SDRxF1LKdjPzWYWf3mBbjJMxQmWv8wW
7HT+eRA6Px6bTi1usKcjMRM0LbjJEr2HJMR20lrPD9x0t79WWeV8gqVrwePNlkb6
yEUtJv+3wVK02Ows7varG3kei5yIEpAkXdeYhfH90havZAGqHlYtJHyJalowzk5A
WidEjfPmGaaefstG/MNVaOAEKi11eREDc0POtmf6N6oEhtNxwx3FHALtzr9CGRVU
EBZfF4irSNmlGT5SEluAM/Iu/0TNX4ymB8oVrPT4Kxn2YMQKnQZrYjvLnF+wfrQy
gE9cYtJO2kLNKYoCmGJOzutNwpFS+pt0Vlv+HO7/KovcSDlJbm6Tv+GJT/JUZ7JX
eiG8I9C6qRf8NBCPM374sr49qSxpmBgXGNykeYHgGPS7nXVVnyhVP5FCPLQDe198
5pcNrecXv71hSO9aR+Lg1tlriYoGAl6wYY4ZrZmfUhI5erqEOxKSQh/kKIkafj0O
2L/i2bKsspiQ6RCAo1PBk/tk73mHqyPpx6l0wCLmZfhJ/LnU2Czx0ntoVSKHIHe3
WfVXbLPkYNK98qTRPLh4uHBYTkEiC4Ih5b4BIwuOGLbos/uZ1RFjncAXwWPibfHq
9DiHO4pAUOHVl9b1X0Clh5mM+uYRtGLblN0xaefcVZvGvShmy/vNCHkaKuj960g1
wMGj3S/b/etJRK4Q61EeGT3q9xVP++2zZZwXBlMl/VDw1kZEfaI03MVdoh0JXXKq
ctK4OQ9JkmhW8v8PH/d5GnRBvojVWtkeoGghSA+g0fdSd9ndyJF81q2JLOQr+g/x
3nhwwANcnLuUpiXYysKQLqFYGX3XWkWcCEL8rlY+NgFddO2ATsBS4SQkp/eIfcHL
1K1wtw8q5k4eRBM/unxBhHgBfM8WnnTU0QAnEHX7urvdrea+nTEXGWJwAPGZ4csL
uyVpIYqNeqWJq2r1NgCL8kmjpF9VOjc+MRM76Hi11DT3Z8aN4qYZzUcHXUU9YXy7
Es1noSGSHWav4VJB0JD0dZwiZdbclTtROjeU27TXWe3Kf03aqQRIPTcG+NoBv3dj
V8eWUuctMD6f1ZqeOvyKVJMjo01DJZWkwEbcr2wWismLxWLAvfnkP1MKaPBXl9cA
2ErxZnKZ3ovjmjCWgG11wZwtr+VmgDlma3kyXzGm5TKVS5N6LZtzvP8EaMuesGve
sRyJ8GQhC7pTrEPngGjKnUBNfJ8zYKg3jfYeQHMMzv1HVL7aqK/ZMDw2myDzteeh
t76DMhnJM7myt158f6NxvhRRMmN5U99D+CUaGSqud0gH9KflJzZM/A1b3D1b+JH5
uDw2V2IV0X/4df5PjHDJLw==
//pragma protect end_data_block
//pragma protect digest_block
6V5t3WeubTGdGNEgss2uFBRegAk=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SEQUENCE_LIBRARY_SV
