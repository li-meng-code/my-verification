//=======================================================================
// COPYRIGHT (C) 2013-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_FUZZY_REAL_COMPARER_SV
`define GUARD_SVT_FUZZY_REAL_COMPARER_SV

`include `SVT_SOURCE_MAP_LIB_INCLUDE_SVI(V-2023.12,svt_defines)

// =============================================================================
/**
 * Used to extend the basic `SVT_XVM(comparer) abilities for use with SVT based VIP.
 */
class svt_fuzzy_real_comparer extends `SVT_XVM(comparer);

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /**
   * Data member to control the precision of the fuzzy compare.
   */
  real fuzzy_compare_precision = `SVT_DEFAULT_FUZZY_COMPARE_PRECISION;

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_fuzzy_real_comparer class.
   */
  extern function new();

  // ---------------------------------------------------------------------------
  /**
   * Used to compare a real field.
   *
   * @param name Name of the field being compared, used for purposes of storing and printing a miscompare.
   * @param lhs The field value for the object doing the compare.
   * @param rhs The field value for the object being compared.
   * @return Indicates whether the compare was a match (1) or a mismatch (0).
   */
  extern virtual function bit compare_field_real(string name, real lhs, real rhs);

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
dmWeZ/Xw9UiZiCcc0yPpcu2MLNMRg0nZIctsF2W7eLRKbK14XS10QGGgt5n5SZQQ
Dai4Bb6nawOIghMH07KHdnueoCawpxeU5n1HwWP2kG+J4hRClVb/4LTTrybSe8KO
y2TjN6Z3TNjnOl1dZAEG6vARNqapXCr/W0QGH2enTAc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1027      )
BFu65fv5Y2EUcNoIy25bL0PjKlykY+HlKvVWPbNa1EX86T/ND2nomVfSzl5VuZEG
UTYqsSNmLy4v1knc6dEoRP7clMRtzQs/RrLadLfpZ35Az6ltEShlB9sRXXkzk8fN
zufFqdyeQbswu64BZfn2yDziaOXPLRvLCIv5uKbY2oE0nDsv3N+i8NrmqfBsA0vM
nu+Xv9SHH3sfDOSMzdq260NM2NhNJsNIrG+KTzmrHq0P0RM5hP3Ho0ZKQW80bW9W
ojywgTu5BIoYV2rAJ77tqn6VmUt4MjJoggVQ2eQfUjNG1jyGbGDB3vlbdDHZfVVM
oAikYQewrHBoaAcMI1AG4l5PJhprhUAec5MsitU5yQehwv7nVzdv3q078YtxC7Ej
8FFdCSD05lq3SYXDk0RXe2CUfVYzKbRRSC5niPX2IKw4wGvFyHXjowabuNmTP8WR
c4QGuR+Vd2l1isoZlQOu25iiQbwT3eDoASXo/KiTLaOnfz/g9jDBr2ejielyihOx
NkdAh6xeYILrve+Vq+IfYEZHuZ/POQrw2NtMYrHZ4dWq62pymlQFlX7wCkRrTVn4
75vSOzSCPDKSpaYWaUe5pwlOkwkNLYkz5dZU1/EJyr0gsWTYXq983Y0h53JxEOju
2DLXS1XYf93uV53w6Gq7qTX/aioWi25zlQWQBnO0/2hsHUUQPKQmXHqTVY9WT7qP
/RlzkVVBOC2Kfb/V5lsyfEQTnIlzd2ZGRe4yOFpmDFGNBFml7XV7LxUv1iq9HGRn
F8d4M4prsWUq1txk9Yx21Fpt+S9apv5WGqn9yf6soeNolqz0kRkyqIl7QJZ0CvLQ
Bx3sQ71P4CeM7fy8ExSikbNfT5uIsjNY44Koxok2XD1nv6KPIGQl0Toiq2/8fOpy
JD60rdr/3VdiQo/TEjtJQ4FWGtf64sEvNOdI1q7q6HaCAuCX96m4nps1EDx2ezj8
++nqFPQVOrddectoRq9CIztZZN4q78tect+CpMAVJNhRcyd9wjmUllGW3V5ELyUq
S6o4UXH14KdGyUpIwbmerxkA5iYYf2AaeTGddK/o/jlF3q5q7ze6+XcnvX6Ay7ZV
Jk780Y0yderyGj/AYteHw5OdYgaZFLtjhz2+Cf4FFCDzEYYQnALZVP0QCWdP+TXp
OJCLE7ef4mIhaVg4NOvsQTx62p/DBY9ilYm0xRSF4/qmSCRki7viJdmDi0aggmsg
5qLNw6cf43KR6osQQFHY3zkQXiPgurhb3oc4WRpfijbxiGdbgUzbQiuQUmD5gdo4
jb9TsiGB1VzULNF58A8oj4GNZU++I7JTpXM9k5va8OKpUvwOfyBP4AeofzLqz03M
hKtc9Z16PwDQOxlr/AkPeQWLU5AY/2ezvZRNfiLAiJU=
`pragma protect end_protected

`endif // GUARD_SVT_FUZZY_REAL_COMPARER_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
OuQTcjOJGuXeHqB2FVEg76w7wlVwBFMlCoOnu13B5+ZOHFcd+uTNiqEnovQtlt+j
X0oTfjWo//hcTKGQef6Nz6y5PQUv6eMjA39INpavWkm6nBxnaBADeRuUoKV1s7XQ
JH0p/jvVoTBbmanxdKFS2SM5tf9OIkeSVl+fo1xQ0qI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1110      )
+Po9HZCQ9FsiivJcaYMq12mzJ14WmgucWHfkZA1UlnbX3Nho4oemYqQVCDc0PSt/
Pli98Zb4S/TjQJ7t1OKnBUCKqIAbqzx50TdBV9+s3iAck85I53Q0M3znDSOzAw0R
`pragma protect end_protected
