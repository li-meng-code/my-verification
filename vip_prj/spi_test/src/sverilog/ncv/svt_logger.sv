//=======================================================================
// COPYRIGHT (C) 2010-2012 SYNOPSYS INC.
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

`ifndef GUARD_SVT_LOGGER_SV
`define GUARD_SVT_LOGGER_SV

`ifndef SVT_MCD_FORMAT_VERSION
`define SVT_MCD_FORMAT_VERSION 3
`endif

/**
 * Used in the command model class body for each callback to make it 
 * available at the command layer.  Implements the inherited OO callback method.
 * The base transactor should have defined a virtual method with the basic
 * prototype "callback_method_name( callback_datatype data )".
 * callback_name is of the form EVENT_CB_...
 */
`define SVTI_CHECKXZ(portObj, portStrValue) \
if `SVT_DATA_UTIL_X_OR_Z(portObj) begin \
  $swrite(portStrValue, "%0b", portObj ); \
end \
else begin \
  $swrite(portStrValue, "%0h", portObj ); \
end

/**
 * Logging support:
 * Used to log input port changes
 */
`define SVT_DEFINE_NSAMPLE 0
`define SVT_DEFINE_PSAMPLE 1
`define SVT_DEFINE_NDRIVE 0
`define SVT_DEFINE_PDRIVE 1

`define SVT_DEFINE_LOG_IN_PORT(port_number,name,width,in_signal_type,in_skew,ifName,clkName) \
begin \
  integer sig_depth = 0; \
  $fwrite(mcd_log_file, "# P %0d I %0d name %0d %0d %0d %s %s\n", \
          port_number, width, in_signal_type, in_skew, sig_depth, ifName, clkName); \
end

`define SVT_DEFINE_LOG_OUT_PORT(port_number,name,width,out_signal_type,out_skew,ifName,clkName) \
begin \
  integer sig_depth = 0; \
  $fwrite(mcd_log_file, "# P %0d O %0d name %0d %0d %0d %s %s\n",  \
          port_number, width, out_signal_type, out_skew, sig_depth, ifName, clkName); \
end

`define SVT_DEFINE_LOG_INOUT_PORT(port_number,name,width,in_signal_type,in_skew,out_signal_type,out_skew,ifName,clkName) \
begin \
  integer sig_depth = 0; \
  integer xTime   = 0; \
  $fwrite(mcd_log_file, "# P %0d X %0d name %0d %0d %0d %0d %0d %0d %s %s\n",  \
          port_number, width, in_signal_type, out_signal_type, in_skew, out_skew, xTime, sig_depth, ifName, clkName); \
end

// =============================================================================
/**
 * Utility class used to provide logging assistance independent of UVM/VMM
 * testbench technology.
 */
class svt_logger;

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data
  // ****************************************************************************

  protected string in_port_numbers = "";
  protected string in_port_values = "";
  protected string out_port_numbers = "";
  protected string out_port_values = "";

  // ****************************************************************************
  // Local Data
  // ****************************************************************************

  local bit  logging_on = 1'b0;
  local int  log_file;

  local bit[63:0] last_time64 = -1;     // Saved 64 bit time.
  
  // ****************************************************************************
  // Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_logger class.
   */
  extern function new();

  // ****************************************************************************
  // Logging Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   */
  extern function void open_log(string inst);

  // ---------------------------------------------------------------------------
  /**
   */
  extern function void start_logging(string inst, string name, string suite, bit is_called_from_hdl);

  // ---------------------------------------------------------------------------
  /**
   */
  extern function void log_time();

  // ---------------------------------------------------------------------------
  /**
   * Buffer the changes to an input port, this task will only be called if logging 
   * is on, so there is no need to check if logging is on.
   *
   * @param port_number Port Number
   * @param port_value  What is the new value of the port
   */
  extern function void buffer_in_change ( string port_number, string port_value );

  // ---------------------------------------------------------------------------
  /**
   * Buffer the changes to an output port, this task will only be called if logging 
   * is on, so there is no need to check if logging is on.
   *
   * @param port_number Port Number
   * @param port_value  What is the new value of the port
   */
  extern function void buffer_out_change ( string port_number, string port_value );

  // ---------------------------------------------------------------------------
  /**
   */
  extern function bit get_logging_on();

  // ---------------------------------------------------------------------------
  /**
   */
  extern function int get_log_file();

  // ---------------------------------------------------------------------------
  /**
   * Replace "/" with . if exists
   * Replace ":" with . if exists
   * @return new string, string which is passed in is not modified.
   */
  extern local function string clean_string( string in_str );

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
eFN7O1HSe+R/guBSWZL6XX/NjEY95GZ4XRptu7+zdLR4LcYtQmMzLjuBxgqi29p0
zx51jfHuvT5bkbvASDitZqPuwtf90RZOA8IH9xI69WnRpeMBwAMFZUbddAAy/hw0
+Mv0VKoJV73wR6zZWSdmVlAyKFiNeaEDHOJ4kslbRliKO36vUmWrWw==
//pragma protect end_key_block
//pragma protect digest_block
ZM3689Bo1Fyc/ArU4ngV1nqKNRI=
//pragma protect end_digest_block
//pragma protect data_block
drofbYGBGzDyJcxNnJwSZNTF6lxq33Dc6J8nzOg8/sJSSTp5zquBrS8wmTzp7XEr
+vwE8BmeToY9OO5ckSP5ROZMxA1F0LGxevHBZ3SAoVNozjt+fdtBFyHOwi/39Zv6
gAFbzKLp82CBnprZI046KOYGFISMbtMBBKIw4/HWhuA3nhFgBCYunL4SEEqCRWFs
DbZoAjM3fqcIzxqEzV0b/x03sD6qg9V7RiRlG3oGd8J93Y5JxPyJkFXanGgJSwta
omAG3ruLaDyxN2gPjhD0O0dmWt9XX2T0p/bpJs8aR8J3t7hKh/g+Bj+/RaTqUJjH
2XMIxSxXI9VsXuRn4x6lVt4ylOWqm55VNagApVAjHfViuV9VF3WEt3QwjKwgtJLo
GCOnBHDzGRNk7vqxvG8zl0nL3GM6T9BYmZV3Ebp2H42Y/kj5vwM3kxSSwY7bXAeP
8dhmoUQe86bYr0Tn59+ncGh8Z5dgARCklL2Gc5rrcaDsPaE/xVVOI7WM1AblEVQu
XhRy6rDHB389oWxwdWFkBER7f98idA3j9YT+ZGkKUQ8jH3yLkslt596KYe63Zmoj
ZJGXUNCSC7uZ6IWFDKOjwWyS0rW3G6/KZo9h3wgwpxUE80h7ThMmV91NwsWsFfIT
LUyeFBIcJAoeul2LtnNqRWBy0jq55vgrCwmASj6mvQ1QUNN/y8I+vNBY3tXBeHc4
XovUoivvrJzNboXCyTad75/A/UXfV8kXwJLCajPELIVSxozsaOWqNAjRuO+a6tFm
a4eBZyDiJ9AM5DhSriWl/sR/NgpdXxlEkgqGrzXG/Z26aBP7WYx1YoYIJXI05cPJ
aWyaunFSBDPc2nZNmNL0y2h9s5VbPl7AylbHAho/VsqNwi6/s9mgcQwbZ4B0o6+b
VQPKPXiNiN7hV4cCfceXuK862WffwQxGsrrq6o/rTuE1Z2Nb5mBWjETCEiXaC/dH
OF9zG6kohxkZ/Peta0dJl4MELjkCzxm95jQJvtJGGzj0SBJxtTj5yBOhhrrwAIBq
f5WSsHo7KFtaUwt0b9H4/FHpsb3EdWCrXHYjFTkOaeAqMvV87+iKNiDswn3n7isl
Xz0SkJSI00oVGCbnewUIzTydYec85S41BEtAR8kF/9MaoRHzLeAZjyv55+l8iIs+
I2CdhAqSKQ6mJTXBdnsWWm+FRaS8zIFtg2bchXzcHYCSgSonD9VupYXIRstgijEX
xZLQIob9T8e5T0FGr46jLs5Dg0LzgF1kgQHa5mBfAafZgwvj2fhSxg4czlZ7MhDk
+znGF8l9/vbdRLrHuP3GV5j16BYWhNUMPk1f0ly9X51pZ7/7Qd+fQTBSaO0VUCKE
8n+raWPx575Uuwvbwoz3HT0QrTHbA/Tc69p6MH5KhJJsN6VHE/15yVK/YGep60Ul
d1Y4T64tw/KJxLfjNCeZAjgpanaFfOEecHihr8CwE4Yg1enzfQBKIl1TaCWR/Qjj
+mhDj2Yx7V0vH8MC9YzMU0aILEUSw0icWar7W4gtEu5gLL9wB0WCxGECjKpGyESa
0vhm+8pi+5LVFaBAkyQo7TyJbNeQjD4iLhWwLnO7gjnUADK6SeZ2wI9+sCMSJ4DB
EYCv1ghBdRe2owl+OKv50T86H/ZNOYIHEwuy3mP+WbaI1yvVdR6894GOsYRhdbF6
3XkoryOP56kndU8cpOD70aQNiDtrBOVN7ZRXV/jac8HwbCX4UXF4PuIeMDRtt8Fh
FK3C6yMKpgcEFdoHJAm50jwvGYPh2MYsT31MUoyGCU6ELpXPdtlG4dWi1OAcuMxS
fBYCoS23O9Jr1VhO0Q7+3d871avv5P3y39dmx8dFhdGLhIe/bKZF2690y88wtDW4
e7I4DuowN+FOzSI+Y0cQjekRjEcrqrr2dzJEfftinE0OxDgySSW1rHcm7Ra0aKIx
lSknF8sIz6LZKt5k8xk9LMe9zwnM4y9cmuf0IXUCOrmBs5wbiDZqWMbt42HyL/o/
2bbtUsMYygabT+slyDHskdrUJyo/9UmypyGiw7o0ALHRVpHuoYnls/IwEPzZADyN
mG2l5jxlm2uYyO2NBFBXEn0aWODK5E9I1i4RMbJ5WBW02R/G+UKGBKg5VoG5NaDZ
kDzaHQPW+WYfr6y5/rCS5vKLacDQQsOQMwF7vgNVxfvybrQSdUyi4Xck2x/y3ycQ
KHVEZ8K9m79BV2kJfGexHOhBXPYg46TuP8Jiv/WNRQSlFTwqUvdyYUAX6ph1wSTv
TlXqyF5H8ySLKReySnWFvPXE5tg19DEgnyG57XaTX4r7xjkOQtx57AGQv9fYYilA
BdZ/a7Vz/R68UoW+oWAkQ8d6y79ntLlDTRn170sFtePOeWfbP6uSEsySxxW+/Mx2
w9BVpn7PsAmFS0WiAMFO8CYfM7saHLCCTc2tQh1H3xMiKuoKmXWA57+ai3G92W4x
AuEutNG8+mbNsRRDm+FBemlcoA7XSjzj3DybRiRMHfhmacA3aduzBCicqIdcHnnA
QZcJU3G27mqY6gs2GVAaXe9oM+THTLeP0omNMNM5D2cdnQqxmuhBd6mdZRujRoBQ
3lrKm3TWQsXF29Ev6/8j3z2lIRNQ+trOZ7lWntsbTCUPq96w9jD6Nbh1PwrdHHgO
4WbQFRob4BIRROpBD82k9DbsMvsYbI8VQ0nvadgcJxh7MNqTO9JCYajfxFvVppIw
0rSdxlgY04oGNclpwZiJnbKuR/4juI1JvnNdYoa8RzQNwWG1cT4ASOyXwtG2zIyE
VIbo5N244zYWJLCkDgFYrBuyalosm1Y9gQMMqt0V6LqUUn/Oi7H/WxwQF9qwAW/b
rlo3Ord7/uBB0irdBVEjeJX5q+LLAAv8Hfvnk2SvqAU6meHRYtlCH3zE9ORUtQPI
d2zlRj8Wx6nWyzH2rsZ2QOgFu1aAApqWphyMkAZKUE33ltP/gErKccd/AEuQ0TyF
xEFY0oc1JWb64uVTHd7SJw6fJUyix8eR+SGyhiiId8j1G+rkp9Sedw73jRMFmvbl
Mb8X9Xnv9GkA+BrZzm/6IeI8abqrSp5ozg+tGXpw/vbUbLiDrNrYLr8gbSnaLdXv
p9QiCxHr7HddWIOH/ToPQRUoFPCn3XStjdBI4ID4uU9LXqA5/4newKz6GPEqRDSE
RFPDptavThNEmYYcakXmsNeY8KHxaxC0QFKNW4pM4Azpd9WvGatEXQWrCNwnHoi4
NQaSIKPotqq5AGOaQQ/7jya9nVJhNJrC/5gYjA+/2HSQ8DuZUBbIzPf01hEZp4L7
Pwi+WZcg3FzLNzZKhENruFQRqQSYFluPf1CfLfo1+FnMR060Zd/CbPxdD50xB4Mp
wClgP0e3O0zRUqEBLQTsJCHOkxtLR0rxEPiEeEsL7dt4xhtrSqFj3ehEHB41+mQo
LwynIIR9bMHQIbadHReXlqPLZoKi4cVEpZDuWDSXqjxZ4OLrWmobW6ZDfB3qmJeM
YEXan60z8LVN5sqmVU+4lNaK5J1YmVvGs29M3q4/sgGCSSpZoLUSgqZFw6GXox9B
vRMjPh2DDO+qZH4I1783KSDz5anncpr0Zs6IHcAZtsSp/piLNWyZ4dQ4i8q7VWuO
NTdxS4A4CAnr5w/7XI4GADoodrKYVRDKEhMWJHOqQr0S7cPiIi1+xw2htgG4z/ei
pP8qvtj68CQREK3QG//kNHEZ6BkYnzQa5PMo/eKLhLHLr6zDtbO4CN681IAmltnl
NWiYd3qUCG3OnSFCd5uBQc5iGuWCtKoy1sdco+cSeIQusdfRGwPabDnRcD7LczYT
8wHFO1SE61KJuga3/Wg5moayEBeWL6TSIuVkJYLTIB9zA1xwXzZFfiWB7EuavmEs
Vl4/GUtNoncAzASQ+89enGlhqrXl44HkLxGE5HdKSziLeOTxmcEgS/4kqzho8mJH
ixhVYYyiFFZeE1sSvOaJn1NUHZwAMlR369UC+ZYwmRGz/vQc7Xodln2HlFBiC4bz
E4XTSl30hp/Ece3NnBK9U3netXRw3TcBPUAXnyyL2zWvjaUCz8HIBoWTUIQu5NlJ
jb4k/4lWrfILgWx7YruXqTL4JsJZ8pQ+58/ya4Wys2Jjp9PQZ+tJZ2Tl+jZEeckJ
0l3CUO2XQWzL8rIg7Ip4sKmkBsQTUqJ18chhVEnWZHrPMwez7YBzcheRS2tSS5Aw
QRQQn4TxD12JjRt3uEzXXcUeTGp+lHz3osuRKd8rhPjFMfzlP/qc0muX20EX8PQg
GIu9yYf3HjR9urYINOJQpSmE1dV0VCO06PcO+9/HWWi33ttiq6svzhHkNjzUKzXA
P7yBivvndH9odcSlHoAGu7wMietkuRy++e9PcoRxrMVI3ADei5JTXjDAdb0+f7MW
GnNV1nY8+IzVCI27q88fNiVR6NdqUZMemPOXSL/BNjSRo3hRfPV6RyUj6ZKpuX3g
/TjfxZbzrUlXl6yC7alQmQiJyIEtYqsb/s2C/615+iuMCLcdttdTa1yNKY/VWX2q
oUMgHsszsRBVnyW7fvBTgOz8Z2PuvpMUWlZ/T9wsu4onbPrLuxXSWZhXFLjdRik2
vRUu/tBck2bMkgsUihPeln7YdbJJJPVvbpiufUyKcQ8SrrTTh2iUjg7wfUZrqZ1l
XfX9a3fgMXpWETEN4JQr70q1SGQGPTHGiHslETl7ms9ywat30LOk/bk7Qyh7gXvn
suEQtisq1msqknkhjU5E9DEn3EfnClCq63u9BQ/dFvTLb0LZRZLDNCXpUi9w2AAI
Ni1A+By/3l8And+TGqo2413Brya3o/IN2MxhvYslCKMKhRkPVd9YX6LQ/NnHcOok
V9Kgm4JDSMAwXoQzAsj+Zz0yWAmIju/Wa9G6pIq4wrBSgexJZHKXlwU7W3OcOJFV
0PuprUWxWtsS7aB8jy5U84d+RPFqKq8awYbqtXRk5H8zpezE8bAGOol3vCWPNhSd
/EDYgzDpyX5gFb1zMlTqMBCJQJZv0vyUtrcf2UgIQX/8VHENKZcisstiMrun3Bc4
M4JY9XGsuh8M9qQBnTFcoe6nwRFRY0GqTt5vqUjNodo6yvv/URNuFrcebQNAGl9f
UqaDTIG74+mtOH9qlpgMtWY4JwJvdFJc2THi2ohjvRGkffrp28UVlQ9gX/fOLndK
QkLA6fJEcZsPWEgA7ArSz4zrQI9Cwo/sLcESp5JqocWlComLdq7X5OpCJ0m+Yybd
yNTbbBl981OgIJdBvcufBrf9JT7jD/qTWn3uy8s3c5KaG6m3FRDhhF8qhUNHuERd
tL0SmPy15pYzQwdtJnp+Auhs+Ti8uQqYt2ZN5UPE2mizKMUUPup0WmP8nZ9smFif
faoPaPxGhTZ4kTepM6D9s0BJRLHCS4kjBrqqNcA5gR5/NoZpXYYvsmWP5aKmLpfH
Tu0sVlVrSfevs+Wf6d4Le4AfyXNwVjQmoKWqrCFj6raqVsW1YfA+43o0127P9FFd
KwWWhSbmQqQF+anzjpshGrIpt3egn3aqbiWKz87IF++STwd424KgtHBBkRpEnlAB
TjmWk898fmJCjLTdoNhh+aO2nvyMiH1TVGBDPygwNgVd590ZoHnYH6JD3pAltlsp
zZEhE31AVrDzQR7ebcJIW+LC4MZmZNWtghK4j9s9hXF1pdDdPe1tS4QjKz0Y2sJc
J/FollbNE+3tCUCqDj2iq/lC5BWetuhE1Qo1RO+uzKLKXcTblNYU0SdbtTZhw+sw
UV+mhAXt2d0167J9ewGAVPS26frEcRaioCv54aOd45apXsiYUZy/98UTKs3YV0WF
Tr3CiD7r3kTSskvWBePlzk9X7+AyQlCtyVbHN3G3PFg9uej98oJerhdnf3G9kwyL
UDlLeAPHwjPrzYZG5WDxbu5CkCd8K3FO8JbmSAdu5OrNYW3K/ZSNUx5OpR1dEz4B
gtesVr4aYzYiSxJKv8fJ/g8wxrVi7RdPVhcgO8uDbbq6DryPwRxNiNpffky7+yr9
j9ru369N1YVJsnB0FbeaqRgUL7lhqsu5obcKox9c2J75Ys3u0PcvbR+IgFHw17oJ
YkUOQGfgh4cFJzxTDBsd2Rotsd3dq1mKU3ApvPC2Yq9vlZhr2Qovr8Ngoa7Ux+T3
VkRksoQh/Pux32smEEQ24jnFTY9jIY4Zjh9Y7pPwbjaQNZxElSw4J5+iNgXNQRyV
3zop8Kqffc9ynNqGGgtzGZJDhitCa5N8mCJQrR+hj7H3N8EU8tuKHZ7Z7R+om3qB
7pwEQ6udq9EtZwKBC7PtFAAu/5bLXj2klGJvZCSh7F87CnB8MZcdUHjdHI/8/GBC
eIGjqrLZBXJTujHR3nJz9gt/PcJUiyFqRBYJXguthIoqvmyepJ6JxW5lvzFVBwp4
K6gPXWXjPYr2ewa25VvB4HTNTv49SGTEDHixwbvCYt0nFfsopWhx3f3szvEo+Owu
CVWecr3EnlyWszI08ayDufflqmDWBfVzvX5ajbgkks3BJXMXJVyPP/yEOTP43Aln
lQG4QXl/m0YfC0tnM/cxPatKkjrAnxU14Zpl1gAkr6ZqMWALePImKydoZqzm7V7K
3rhDEUqbg5in3ktDkiWq6Ym3MKUjSvGAzi4sGMHoMOglnsblsCQobDPQPZjie18o
6eUKULeq/c7dSI4sDjWx/wbumsCurgqUiWJMPmegYJ1IUylZoDySBN9d5eptEKvZ
8615rqVlUauD5kJTqNnt3OR8dBE0KHOxQhmjXqArArNlUqtaKUZ1f//aRDViDg+D
V+M6Xz+dpT7/slK/dJodh0h7mpzxc8R8voyteErn3A3XLmVTFrv8p0nHDKeTKUyC
55MTrabgIDogh2C/gGcPp+9UvAeds+56JTCRqqT1s2x2q2qmcra3jsav+BFt6f4t
JmakGItBl+XwOyCGRgIbNpb3qKHX4on4o91nYP6lF/xQ9bF/bGOlZAjmHan3ixvK
7YSqemC96KNnqY121bzsCIlun2j3ylXUv7/psajgegcKWrFcV4Dx04pAQnnM9IlI
gq1gjcVfswX4DOCZCv1D/7GdwiQ6BW6+eNCWyaz2L3jwvcDAi2EgHizn9qx+f2FJ
EdkZtK8bem+8QqTPQMsQD/JV+YEZNpLuAJGAGSRLIN6NNX2bIjRtr83a2NI6GgT3
gi7Im5C8sSOt6yoH0ZX5MEw2IQM2oyL/35cnsa5D3ASdj/TlR2nizRifus5RSik0
zdbgisbv35JxUXOPlnJuLvdqe0HPF6BKQAYeCNWNxLky/Uq/nmvQm0aaEMCU5nwl
2ARzgPFtlKmmE1LCe2dkRyWlWcMc/Kjbvj6G+nMun0PSjAEZVM1l1Ew89cP1z37r
9UGLtZCoWnmSD/DbraDsdGpeuKw4YQsdC6iIb5x/CUm8Bn0mvY1r3NYSk0ZW4foL
ZCrIDl5hSk2fM0wmgzG4o01JF0pNRf/z1FO7jFAnFuimqvjDG5zWUVnZzCkrf9N2
eAOoQsjbclOUXBPXi9msNJGgYb08CzA3MPna1XirGi1+CD+FDvmKI9GloXWRvHuK
+6MaTQlXhJXDoyo2wxXuQx0W4HgW0jHO8bxuCt8qm/To6Cy/krOW5563JNdkgFNV
aQ6Iz6siTYEbI7xEPn2eMV0M1XW5Y8tqeYWCL+An27cZ5hH4dAELKwhqO5oPJUqI
NPVxrD6CefdGtfMz09cTish20kbdgHk1dOD6eR47JfcMUixNVM1sOQpC7EGODm5m
Y8fuynNk1Bb4gXTQIVkJtXDOmCXczBi3vpkKnYBoLhcqJtocrnTNYzaLnvs7jN2N
/WP1NAE0+r11bzX12OrerptHQ8t4LIo4lur0UUbaWXWuLwODtElrw4DRlqGKqh/B
ubbOMtSI/HgxSHXIYZa2MqpPCQ6PFvqR90CJ1i9jicB07MVWygaSyF8oQlnwwsyr
ygK2m6L38upqivFDq8ye5MXNkfYFgDLnpsvWlQtcnQS/750YpH1x73hv8WPQ7oKh
mdkaN6uwXXVV66uXYsfLo8ayyJlbp7aJffycaHmvgCzDVMC9QAuKDfKteEaYLiXk
XEc6gbbbM4cS7dlae6y3yYM8UYBsK3v5wENnA9OsOezHYXUn2uNPJ+SRPvg7RKUd
pPgnlHNVmKAsMvg9+c0myjwNhKuhFZNQnrihJqwg10wSxz1eX05qhLd5yjSv5y48
fc+5o+1d6RjfILpATfcyRabcLjhJNQwDSKW8j/eihWjc0lAt1cMxIMQkutoadQsb
Q6uJiSKJIkyeQlLnGJkyTqoBVjo9kll6bUk+ShTwnCzXRZ032YK5d4/sqP0riY8C
5ACNj1VgpXQONG0XR1N6PUqZOhwlJAi6HSNbTv2FgYi/w4uSWmkP6czPuMF6BcAd
eduCGxHdUjUXKp14i6LhGCoyQzM9dekby0Xp7zc4+DHkCvk6xaCmdidU+XmGe+sA
dImcmyGKuxYpE+j+V5ig8AErZ7K1DZkG5VB9Og66CQ4Nw2k78qjVI7q+ri3gum9J
+iTyr542sG4er+9ff/34HGzE4UyaX6JdmrhSagPuVymCI5okE3fR6Djx7H/4xa3d
Wha0aqjjSmnFWI29in7+CXAH+gwOhfU71MCO9hvpKr9LGntWPb5shivzoQRXXsa/
V4v3tpTo2FTjZwjbxurR+F2ulwt8ScRyMV79rbIRlq1xCtCX5c7PDwskaXP4IDiE
vi5OW3mLp868FALCHKi9wgP9M0OuU02Q/H4/JDlkUeMqKS3hlaqgMRViY37Rk/VA
gy5ZGmAFgUnsmZxDIw/wr9whjNcEA/pK0EKFZPTb46b41hZnxo3nXFQdazPNtNGL
l3yLe0oGzujZtRXBXhQaHY0bfeGgyvG51GlXwD7Hgwj7DMtTeu0Li6ZUTIfo3j/+
PMq17gK+9Po4lZS1BBuP6ez/NzQndGfOlh123Q1ANW9469w6QZqSM3/tP32VXI2O
CWUh4DqAgLjwD/vip/iuMwk+hkKjxZndnXv9GfvRZFZiKbrBaiHCZvRRKD4B2HFp
kLj8FxR/1asb09fDTDAZlnZExpj+6vuzPRU0K9Id64xQJ6kK+nuVb0DvoSP0wMlU
RIygkk/T5a06LL9UcmMlfEuEGHjdCyJ7oP9WGhnlJJMGece6g9SUf/mvMf0wuhrk
1ApvRhMRqBSkpcN2dVQaRSN7nvsHt3nyR5+++6rJ+g3PCvI6QeZrgxhfy2q2RHMr
4TEAbJMUMXi9aBc4B5FqRKbLu/n61nXejOiwsZJ6zChKiF4oCPp9gcoknzL9DIRP
XeA9WUYsrWZW7+o9UZvHOS5he5TtzJ/LiFbxp97/9zkQ0j9JeDd3yWKACVFzFiy9
KlJerONodmrAJXGFVcDeN6bFKHaNuO6JKR067bcwcUE0eQBxHVgztF8bo4D8CYh9
VlenxP8drIbLJIqTuZ7L0VJN2Vrt02p4tlEIxIyWL3JFTPt3OMVoQgpQAVIOE1oz
COLUSecINX4zBuX/2PAJ6PIxnuGWZrsQAa7SEe7B7h+glLkn7Sd5EeRaJZW0wk8H
SknWsVlZJ0x5/AkcPgcRl1xhThd955CBRMJx7fOdktQeBJijBqKySEluYsUw0uea
4jz5Ki0TRrRCEPOzJ/u/Ddg6F6epkHjhFafAkAKhPMNWYZ816nJ1iPe499mPPEET
re/RNp5hCJ4NvNmovKMi7n0KFHeUL8VfxUWuBU077cco4nCaabv0Jbvwcm/FOrNw
DIrxgUcbnK+/U0Qt7bR1siBHRvJ5Lhl2mRML5A4Z76EXGWclU0PiPZBM8wZ0AYNo
dYb4xVB7yRw7It9bOPQ/EpA+xgFfZU55RzoKwM7jCfg+FJdOuEnYk4UTF/DfioAj
PjffEFIVz+cNqGjlc8SHF3k4aqF134u7k+8QXNfuJqjC+bC23B9Uu3CLpIle/kmS
iWZkdjY85tWKztbdB/dQMhmqL/pUNx1MTvbEXvxJqABQ5ihFpbjUxDQM2X+1XHRH
6t4oCo2zuHlSCUFI3YgB41//E4D/ug5WsYTeXz7/IjuBxd1y5mLqxCN1rwdL085V
zgZbegyqOM58m6K4dYJqHcXbvNVZucsIf17lrUT1T7/nWWlGUdyB4GpYxdeuSjt+
zbKtq/ghMauGbl0MyC6d64AU5pjKpX2ca82TROU9y3wHMcY7WZDIqAcQSio0Bd+9
AuV+mTgf+hIt6Zwtw9Hm6Gmm8Ka0hSh0eVujVGitr9CXYn925ao7aCWneUXrzbbZ
Dezu05kHxJv9PrMiVUNwFfhjX2rLeVw18JWks3QDuKuKLyTSYjw6GY6XTEwYONDh
K0uZcSF/j9CcgyzDxdEsNW7d05xxqNGwUXiERxgbDUfzBDg5544Zs/fNbQaLPZmr
s0ImAwnIKsscFTo+1jZEzlPPmE0KHB2lwRiDmRKTaDcbSQdyNl+0jYMjKkbQ06G4
ttYkDeQ9zu8ENMedz45+NfJkgm//I9+5CmT0geIylnx7CKByzuvjFawC8MLcPx5m
Em0SZsgY8HuKFKFXNkONvy68J4uJ5H1Uy7o4pFeiCvrjjtnCo83bTf9JvzxiUV0R
xdORUMTKV+MaEHwHSm5/U2HiLFtDNZ/TlWPQvlW9h89645wR20RrYpNHASebROZr
AvT+2pZaID04qDvDw4yKf/z+w5w8nG0uCdyxIkA0y163Gp8JMBR3BHS3Prl3jPNT
Qz/NKjS8JoV85jNmigAYYdqWHTftnsqU+jwLjeSGKqgTwhvTME1Ib8sj1/Y07U3b
lIyh8NsqHSAZSHYFRU5iYksHPW1F7qi42d5uFjTrvRR8dm5KBkRnH9ExPioeREC/
9ZCis/meWgnrIaAZwV10PPcTD5Rnm8/tMZeF0iMwuIGtgsHPBE2jbqQBTqblp2Yx
cAqVkg5HW/VQ++yPNV9XWxLoPhuCcCgB5D7fpMwUo/fdJgyZnA/0tv1XCNMOuLkg
klFkd47kcdw0xBBvfZPkaN2Mp0yHeZjpa4LgkKZGzDFkux9fg4f7JO/hIMJyW2ga
qeZh1OamfyQ0eW5uWRkRztjD9Y6f6RloLQ1sQ3Nr9vKE4h5xLcOlSzJl4DcLOgAt
8LIy9wYk6ZH7NkBHSZOafmwg4Z3UK6QEen4KouZjaHBVIqf38LIzUukViWukpeEd
6LSudcgVbyIWLssCVRvgIeFAF5AqsOs1Xw94efXDh+JZCWtQqWbcH90Nf4Jt4CwW
7Q1jQjSOAnw7qVzNt2RIp7lvSIs3wldQRPgPGFz0bSYdQYXG1Vmt76hCX8ze/30j
s/61GLXLSoaIwa3T4Ne7lwYnY04bPZ2Z2l2mfQ1h0EkW5v/UbvPHnfxg60hqHBcW
zXuYIVnQeHauswa+Lg8CFxu9JZ2+B6scJSQXMojBFeUablXirQ/GW3sYVzBNCJE8
0MGPXoTonHxtqSW0hOtn520AytO/bOh0s5lS/dsmm4tSJWIDufD1oEuCEtadYWmX
TFW4DsOV3pG1skTYw5RjQFI2+ZKo8QwNRFWX+iawU3q+7wnsRXweg3AfzRJoGCEz
xNGYnrnBRfh6SiPUqQpoq9/3XDzWS0IwlH+ZEa6rBvrMUstTSDZS68V3mZoEAzq4
DUcSihb6VJOk57CGS7k7+Fix9aLVO9+ImFn5shGAdejD5gFN/Nlgl0GdJBawuoAC
yAHgBvV3MTO21XnjlpSJ/h0UbaywSUPfaWAUewxOhbF1ormqoiACG9epzfRc1eCl
PAWcHmbPIFGASt5K/wJBeX0E4T/jiZhg1pU+vn5U81a1ZTuyFFkN/lt7Ryx7UAPg
hWf7zt7BolnxKxHxl7he2Ipqwe0WMNU/e3FG+GRCz0EQ9Y/x0rBF0WHBoUPub79G
uI2iXrvPw5yogYbDne4WM8BniiXduulwn9lCi33qxMSKn6ps/lLAiwteG2vvGsv0
LGyt1MJZVCUCT5bYC9wmsYApQ7WNU1z65vboOa6XXjYm9yUbio5HbO/7PjpHkFov
T7UYgBZliy2NN47RkBwDF5yqrt64+jNsL0Nkmz/QeFPdPFQuDJ3sLilUMNlM8d21
fvS/3FDCn2xKCBDF/ohpPpV2j5/hhu5FkfHAU/+LAzzH4vbaEZ8O9yKs6b5WEW2T
QRMt1o2pFOgLuIh4T2+oMF5kpoqixq+Gro0FjNMafmxwmL24ih5Gpa1JYgm6juxs
LrsHW0SPaRyh5tCtiFkUpaKlmTJ84PW2PldqLdXrs87kw+0zz6VaJiw2h02abOm9
0YLGcLVdhjl2f8dGO3IiSp1ubn0/TPcXW6flcZL3FYhObVOBsiKWFz0z3TcZNjzt
DT0P8DSlYiqfV1CYJlP5QpzVR/NjnyUwSx4D83efBh1z5cm7TpRtgb889WEp7yac
EAlBTo3vKtCqGRIJisMQnZD/+R5ewlLMFi3iCzl0tqj2oqWYpNnWaWj1K6IGVp8B
hqjv5hDijU3HaJmh3Ycb+DVyiqqarsNMl7jeXQc8XsuKzZTHwYC2b3T0H5hdbggX
MGV/gOcV1630Pq8uV7mj/d1nZV8ctYOBNi3pq2WxUegDjfM9vbfueVGKW85C45Ru
av0exDOFoaa+Ge/Fc0fRIcBov2QQxqd6PzXYtMJWrJSqUwilosV1B/BmIHWNq4ob
XPK/Hi4WnMxX6srq1o3BBRtoYawKKLWgZtIyG4n/s6ZVFFBmwxe9CBYVQIr9XHy1
eoRGircm32PhGmQFog/F4UZlDN7V7OSEaA+DNPGQV1L9buZPMPcOTVrrDhNWvrz4
DVFukkYs8g5JBM+qA7syqkyLwV5OSQWk64640CNP/oqfrFCpfK87+TZvCtXOrf5P
mvagbsaKdlyb8435srxMOJjyBYOhJ46PAaGlXEIhc7yDb6Ne9M6/KfkTajm1hEgP
2U8PS8NsxWKRJmuHKbBDHH44F6ePy3DCyeksSxiLlujve8lvRmwYE1B79xRDM2FG
mNwklk+MEPqrAK1AIiBsCXm5UeGJhjdZUA0pMg3/2VhoTaOFvkwwj+sEsvfHGjwj
OyeGVUzGnOcfY6/gbe4ej11yhEyw+B1jxZXsYRo89ytuGQtm/qE5WeAUSTGUdzvY
2D6Wyz8iQOKREkJ59c5WWbizQdzNR0Gd+nkdL/izL/gIT0L/a+T36izavdR4ef7S
nhzeQpMWvj8dHvY7hg4Phf/AW4vigE7zkKgn0n2hXJ/S6OiNWosB4i+QYUNAUaJ6
iA0K+nevzYuJAKhw5Z4GCVlZm7Vw+dl9823uJ3KipVEyUzvDvywMT4LzRCfBm4eC
R0ouNNzMeGgevqXxT1kxZjqnTRNr8xl1qVCxPFIL/dggYFPlPgShHBw/iJ/FDiJ5
Q3Vwi2O+529Ncj3NkURLe+8/V45on8yq/yUtYRHeT+6KGVhHduFxK+CqFfRf9siU
p1L3PohYhzD4ppl7G+zd+oXepG1CbW9t0V5qPQj66NijgzGPen+21Qu+3wEUNTUe
1tdBw2SsYY3RNtc2iZFHaQV+PQurSPPIsP+eZ0VoD5HYSZqMAu4tGBaO9ZJ+Enaq
5iC9JEhdTIzr07k9Wp9eq3QvrzLxJ4y1d7IIgmHWfwsZhR8al+ssTGiuRMkENHeB
lWRheZM/+TEcc5tUbhDwomn4rQzdQZRLUz2Y2UfJ775hnr982MAHZ+2ck+dPk1aa
VQCD0MY7JgmedVFIs6LiXFPT8Vv7vR49DWlcYoh//6GHpcAmR+OaGVs8MwH4mjcm

//pragma protect end_data_block
//pragma protect digest_block
/ZDnVcXlAAFfdZM26EH3SAkoL00=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_LOGGER_SV
