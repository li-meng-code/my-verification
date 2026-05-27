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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
U/BC19wX8aXuGVBaaLzVRyNdRU029BZ6IuGsZAJEHiGIF0HeOVq5roHoRo6sGfvu
fD1b4zWaa7S+8s5E+ramTzzdm1hCgCW1NZbv5vw1BMkUanLu3XXthrIt90M4z9V+
e1OkSPd6WvwCWKPxJByCfOlST4DBhI/O0fjRLEtlQ24=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 252       )
BRHtsWxUXxss8z6iaJq/Vr0V8Fyj8TlMv+9/XX5Aivuxh+hld9xzTowK8dP0xuxC
iEc1i88abQELgv3/GAqLU9ywI0kg6Yky/RyGJH5KqFe8j/awkrwWQMe6/HzTm7GJ
m6lCB6hpy4gF0S+stu9x1Y+cv3VTtE/G3yi1xJnIZr6gZeazMPA8hsuAyBw7ADTH
xREfoAqzpUpOHNqyiewCNis10vNl1MIfRYgDEX4/OztTPJ0lB+6zBiolqI2ZxWR2
HKdBRKcUzYhkKhX5si1w9mvSfnDpo/moqq1T9xY4z1UnIQs8oLYqO+ccoUTWVmNE
m0L+QfYYAGwN+xmxwT+Hgw==
`pragma protect end_protected

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  /** CONSTRUCTOR: Create a new SVT sequence library object */
  extern function new (string name = "svt_sequence_library", string suite_name="");

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
IGTd0q9ECkkrUe8kjO0o7KZIeA+pgcsJa5E5TcKA+9NJjn1tp0SYAtAPditXMOtF
Q99J/xkC7pZpFaLlppkQaKvPQFqLpyZZyfnvnS6lYdMLnK/5mnSkRLF6TDih/IK1
6L43DV/sTIFfMUiwYw4Cu/ZotnlYt7LO4y75KC7dx1E=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 799       )
HFWARd5VfJzLCEsV2yUVkpnatVDfWBwrMWoVP8eDoESp7f49TUSiBKReDdCKKyBi
THBhKUwKab5kMsx5ZbQLiF68dIg8xX0edPWXQ00MKIup5M8Y6C/WqPQ3iCFiIgcj
p5KSDEjWvnR619SQ8AzD79OKGlqnNEUdHR3bEHUMbSEJ5mYugMlG2R2TOC4Z2IED
GXSzQKbGq1iJA6TRnlW859R5xV9iOXAKiopI8xlg5m+N4eO34QTR/sCGpaXoIvF0
qnd4YvPB21Hcnc1RLBBCcJn2wH7fFTvDIttrGPRzisRlMHUGkcLZq2sybA2ro3PL
JJ122d9ZrwY9bZuwlRqB+IJQsZVcoiigZTJZLPSzl4RBOfbjw7bhruuvNV4fOhXm
k/IIXNiySikUnmIgYt2qkuBVa8VgfpuKW0Fn50BoVStpq6UhE4QZXY+fdzPE/J1s
iy2Z3x/dx5rvF6l/74duLqvp5qck1JqhbYRSZRtLo7K6ROcV/NkyL/UpmH5AyiLI
ebkHGrPCYu35FoY4QlyjYW1bK/4geiPqwE5p29q2HA3ul5XmY3bjq0GQdXXIcad0
nx8xujSNydiG8yP8OPON02tBwVH7o1R3a10FmzigvwXdrGyUf9K+hG0o7MKdPAj3
E2rg1i5J4Da9BrRr0WxVBLAvSBXzHMmarEQIKd+hpI/gyZo5SQAoSzsvcK4Km3e0
IjBoWid8/zGD1A2zJ2A91+uKgdJJpoqgkB15iqWRVj0=
`pragma protect end_protected

  // ---------------------------------------------------------------------------
  /** Returns the model suite name associated with an object. */
  extern virtual function string get_suite_name();

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
W2m9it1PZ1doQwG68iUg1+hadyF8NW/fbhKH8rDntsx4Es33+G8BgLgmZFp/xl0+
cu9qvdnJffaUuwiVaY87CMIV5eHOWi7hBv4ylhZM1HqqDg1j29PURB8xGAbGASOm
6kTnsIZQzcd27+3KG/WvWkNou/h3ppe+mutP38FeBi8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1123      )
a4KzIH5WHKGCsz2eQTFXjcp/qV4ONfoT1xGewqI82KSXpa7IrEaf992Pb6gyejyB
PP37+l/ZxNwCygBSJFkLIuIotK4iOubVSid1+sJANkq3plVE2881Ck4Juqg0jU4k
2u0UUrB67BxNvn81HttYW1rd4iVc/tti2k6NJE38V405rM76ZGEiUJMNAjEXo0oa
Ey7z5naWJ7HpeHR/zv3UZiK036gKY84pdOfKBOVrw8vijPqwi0Yz7AkzoXA9yCoH
AphSCXows8FbgM1VjLKo2Cc7LwHUjVakoH9HPRzTmDChvxA62Wus1Ju5CW2kS1nJ
t259xcdJjIeIYNummT8Lai4IWD7jeWuYpnVaNrFazYrfrxb6iyNbL+n2IY4SDV1W
RgXRTgBmco+4Fs4rTb5LeH8aNPloerhwJvCUYZCXpePkxl9ntnXkUjS1PdGqHgfe
`pragma protect end_protected

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


`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
iGQ+05r/D9/9pJ8N7DCxdz1SeVLrDk9c7Ke4c4NufFBNiExdgLYJseZ3EtDR5QB9
SCvrtMFIptO/rq7vofWaGWnSElTUC+r51gqWHl96uOVzd4SJ9a66ReYeThuf8i2i
dru9feghzIlEKprm6ZmU9zR5l2/x2UCMVDXPXipsU3c=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2069      )
bu/Nw3cyFLs69iDPQzkYgrD4bqiUZQtFoV7/GQpWHYGsTroSx7kD9DITzTDGUqha
ugcpLQqTbeARLPkxhDDXcf19QwMveQodrJVs6SCWDpevgHTL8KWVw2EM5YRLGr0D
X1XKWchqJkEjv+nqfWPFvRodSpmIuuQWxrSOFd6XgsYpJ/XYpenJdIoPlutJ+rhR
7T/II6ifBqTqpBPVctrrxtr5fZBjzEtIteNldiLR99WbLKwTEHMYZPeiRUl0YJlG
+1bbAc8UAjE6INS4GcP3wxi6Th/qIyJcV+70PJdLJUMuZT2yxz09RY3egCbRZHPV
ilb6dZ1vM5ytb2higzGKXZtzoQzmhrlQ80iZZcXFaQZO+c42sbAb6NHdoJVmQl5i
cK7ALpNOKK9H0gdZLzDuZ26zc4fq+PGTXTVsmYN5F0PPPiZCfTo5DGq6POxmdRb3
QnQ/MAIhbmo80BsX8XxUlrhGUzE07PPViwO2l3x8Oq141ogLx9MrU2VyNKNLGLsG
BdPqc3ct5R1AgipiL3HAN/eUosEZwf3S2lcPOfryahovXf2Znn14uKjU4k1ZjoRZ
HC00EoPyN10laGmzStBcOTmCxVoS4nd2k24q2vTHhG7dz5Dh8ytnol+TxD3qS5fc
lZO3ixhxwHRul0VhLFHrOVwX+bJ+EK4uzMMNUhjCH7+1EbMNU6yYHUXjfipTRI8d
dkCPb9IQ3NrMYYQTKJcrdy3Ldq4OOLc/SAM4Ssjq7/h/ra7hQiNexAzG5LAGmRSg
OYSpI+Yc6I7r7t0+3V3/4IoqgrtTtUA0VN/adHq+ochUIGlKTEyfi4PQJaA1FMa0
oAIXrKpUtyveITLBp18Wif3vEvjlGjm7m25tjh0VG4nPS5tiKKXD5vvFkf+qAJ0X
MCW9RSv+Rfr+WWTM0VbUUGykxEfIKNINf//MsfU8JHkzvVMt1uSU9QgZU/LY3q1g
Fiw5nuhWgfErS/ms3XyCWgC8e3imoopHmLY2NqxL+A53hdFoRw3pwJj2RKvACrYQ
BX8tuvJj9PvA3rhSOVjHon9A5bnsr6xAQOVtlbIG/iQ36/EdqtcM8CWw/dRgWq3g
4ISGS/OhJxQjMEQbcuh3yG9z7cch5cecxbj7/MW4Jlz0igEamfE3vcTxNWJ4zr34
1Oj/6KXOm9chd2sAL1r2ZaC7s8PZGykssPZ5d1bJ+/uuuIIP/wLIosMv9pM8p5/G
dHKISGvqMP5wLty7Dr2DcWmW3V9GOQN2dcpWS5+Nn3OjbTywo5rtXJUCttoNKn6w
`pragma protect end_protected

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
OBI0M/jQaI2QCJohc3ZWWxZ9CPETlj1yoLdenJDQ7dQ42Tx/eV+r4iFqY97XpfFh
Ph5Vk+LWewYkEDHvN0Q/eKeYjQpSoTnmnjmI9Iw6PKYVw2anMqMxc+k2n54Kv8v3
NxQLd7XV7ufL3M5s4O4QT/KDrVn2S1rrbEn46YeLzQo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3252      )
M9LmYEWi+wTTvHkx5DI+Onsny3sZS92SCjpIX9tMNOCCTwVZ9RfPqVHmRqn4Ralm
C5RK+GDGN8gHfl1PKHxD3VedoC/2lHTrWlCEgSXGhW8hN25bzDUhOw26xQK6vXTH
nQXJqTg+Wb6ARMLEbHMU1nBzPENBfEu09IrhE3ivhnLM4WfT4gk9PX6pZi58h97m
e/5MM9Lz213BHAnxGf1qzeC8WGdXaEITD7biFrrZB0Ivmsmb7BvhtRrpHVWDUg6J
Lp+fzpvmNzBPbq84+qbPR0u5LgqytPJhyHrfYV2BtAo0CaKVUX7prwbTne+l1DhN
nkHB4qS7phUHsJBnw2CDbU5xYNtrCqyXSyuSofyDxd9UBKxXcyzsp7Tt1sRkjfcQ
dYrGHJpv4LxjgVsiJbmxlu7y5GzB25lg5xIgPc2yvpRAKgitncXRma5/uhqNGUz9
Yocy3lghBuzIwzcuva8PlVthaLfx/FKiCLX2+xziAD09NqESuSFePogKgHYk9OaD
L0i25KAscwTpzdHyQg8y8dG6PBccmdwHh1HWE69upIqt37o5rBnKHtwmYYMl8RMB
07HCb59LhPWhXQJRWC3SdgvM6bvief+hy6STCjypb0rIBRSkC1rS7lh5oX6P7H9f
ojVdquVx82YwJw51h6JBQBioZLwcONx89vnVqBKq1hBRoJ4RJs7y3mZdS0BIw7tK
5p6ERv4B0VqiWTUiz4UKWdu2iI4aAbIfIF5s/gjx+twpRwzYepoYaWcfbol8hwLU
Y1CR9T/BG8LKb2LhftdBUqMLty95zVQgayiO6SfK8lye0qUCi0i40H3DoFD6nGjs
NkOSgDJC9kD4L7Lrwvu6RWijVGcC/p11w69ydiVkT6ej1+dbZYpeM6oWhFoIHrT0
tVjxBpLjp+64CAcDu8c6SGWo+uunf91CC7MOdcwyv3ZfabJP3N0ioh8YRjdlarUR
Nu4hxdvweIvXKGJs3L93gqKm14vMJNgGk2/SBRsXQ2FuHfVh88j0z12jZj1jZfcT
qAInedaFGfjqkuDxXyYMmlnkWZzrQU/ol4ndzVAabe2P6mA7d/8XlZoP/S+UDq5q
TzifkUUC1zT6SDcZDydKr/ePhc5LPoWOr73NoP+yRTfOwQED5T3yx2wt7BwjZe+3
dGY7cn6rAWAnLI7c9dlthm2y/aZyJ0HTxVSVP/85NsLEJi2zfVRVJjCNdrjK9712
59aH+m57oWX5vxOLAZeLNGXc7TJdOQI1c+PIRM7QZKKf7lU1KhW9W1ZvYeLS51e0
SCBb28kIn0FyuEoVCk66N2ew4mfiH4THRj+jnL//UDaNiFFCmM4TTc+UplTH0vd6
IlFZXTTwWDYBWkueN7dSUpB2LiXJ11v0RhbA4Wp0IpfyrAzPywencvCDxYRiwNnM
JFdTmtHS3R6yFcxR7YJakgEykLd3jIKWRziSbNWOcOUWiPH58YY0n2LuLN9jsn0m
OSg8frBSYEgYWY4jV/wfqGPoeKjKbkuXIbIS7Wkb/Z6nh2xAXleHF751+az6ObHB
5KiWb3ONwuEfOwAf05g9I3aOOOVfgPwqy4I6iYnqcIw=
`pragma protect end_protected

`endif // GUARD_SVT_SEQUENCE_LIBRARY_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
blZyHV37nO40Dgun2EEhewuQFMDWGED/mH/pHIeKsyNNjs9TCpOavVq58UYARg5X
o6tVG4k0t75pfDkfUrnoijoKToQQGz9FlyEoqzcelQ53YGYgEgiixux6mqmzjBRz
+kqaFeKvjD8XOWXy615AWPg0ypK6n3fY3M65ycPGkzU=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3335      )
bFYafdmsGiuQD/rr5ubj7vNdaTsCXSj1AFr0Wib0B3xVRcwq0KaKVhv3P0oq6R70
XtG3g8jBE2IIq0XbI2ZsBZAOXMoBkPIO+dvpcdKn3wd61+3S0iE/J81ebMb8TNvy
`pragma protect end_protected
