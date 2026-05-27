//=======================================================================
// COPYRIGHT (C) 2015 SYNOPSYS INC.
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

`ifndef GUARD_SVT_OBJECT_PATTERN_DATA_SV
`define GUARD_SVT_OBJECT_PATTERN_DATA_SV

/** @cond SV_ONLY */
// =============================================================================
/**
 * Data object that stores an individual name/value pair, where the value is
 * an `SVT_DATA_TYPE instance.
 */
class svt_object_pattern_data extends svt_compound_pattern_data;

  // ****************************************************************************
  // GeneralTypes
  // ****************************************************************************

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Local Data
  // ****************************************************************************

  /** The object stored with this pattern data instance. */
  `SVT_DATA_TYPE obj;

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_object_pattern_data class.
   *
   * @param name The pattern data name.
   *
   * @param obj The pattern data object.
   *
   * @param array_ix Index associated with the object when the object is in an array.
   *
   * @param positive_match Indicates whether match (positive_match == 1) or
   * mismatch (positive_match == 0) is desired.
   * 
   * @param owner Class name where the property is defined
   * 
   * @param display_control Controls whether the property should be displayed
   * in all RELEVANT display situations, or if it should only be displayed
   * in COMPLETE display situations.
   * 
   * @param display_how Controls whether this pattern is displayed, and if so
   * whether it should be displayed via reference or deep display.
   * 
   * @param ownership_how Indicates what type of relationship exists between this
   * object and the containing object, and therefore how the various operations
   * should function relative to this contained object.
   */
  extern function new(string name, `SVT_DATA_TYPE obj, int array_ix = 0, int positive_match = 1, string owner = "",
                      display_control_enum display_control = REL_DISP, how_enum display_how = REF, how_enum ownership_how = DEEP);

  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * Extensible method for getting the compound contents.
   */
  extern virtual function void get_compound_contents(ref svt_pattern_data compound_contents[$]);

  // ---------------------------------------------------------------------------
  /**
   * Copies this pattern data instance.
   *
   * @param to Optional copy destination.
   *
   * @return The copy.
   */
  extern virtual function svt_pattern_data copy(svt_pattern_data to = null);
  
  // ---------------------------------------------------------------------------
  /**
   * Returns a simple string description of the pattern.
   *
   * @return The simple string description.
   */
  extern virtual function string psdisplay(string prefix = "");
  
endclass
/** @endcond */

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
VC375Z91XfK26P3Z+L7kP2MrkK9qVfwSqjrcUm54qd6SQJ7HiCPwMsaJFdH6aZQ7
+1c6MRik5AuXKtI68y0RoDhRbvjCMR7aIuh5G/s665P4sB9zFEMmN7VtTMf06Czt
5Ln76XohGDdROqJlWu0zlOEralsWQzAtIW6bmqD+cVA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2363      )
J6KihE9Xl/023YT+vxpHPDz+KfqW0A3nIg6tQd/6DvG8R0Ngg72BMn1cHKmSuYda
uE2lhPfxSpbyunwnFADbQE83kSv/Sd/Na6ZvyZK7nzflQ/IncehDVRs/X+2BkWN7
uFpv9pIYXEYAHywD7Qmm3MCck72EG567JNjB66L6ef0PMhQRf0WH0V4Vs4nZ3Bpk
Ed6a2hCVbJ8dG5khl3fEdRG+fkwgFBY0ur3C3e+vQDGnAerdWlcPk88ZvHEIH9F3
wKibvqutbReMHrltqRA9ERN+TEzUC+gcGFOkKvTLk+ZKA5hh3BDb4XXS/YAFo9t5
+x3NdPYvkQa/aGLWcnuHvW8Yc6nViSmThXZctj9RaLLt1hEjlsv+PgPiO0eYN2PG
YVsUwZAETrwlWZw7Tug4IL9aIjmIbdjo2a1ScguR8SlIbDGPQZByfX0vvaFgZXu/
lcYS6K4mt8k46gNYURA+rFzQtJcQAKdO9l8fZSGtGRMVrH2St5t70+5eCTYIQA3v
LPZPur4CnFR67+tO6w9fkrCeYrmvokY6M0mnd9jeoWfKW1FkL1Jlf5+ZGsKI17AF
NHZov/MeFW+kodwL+lzK6Exg2x8L34QxWdxPkA/a469/mGS9lzNJ4CSswpONTqDs
huuM9FGgwhR4ZlfFwhGwalMyT69EK7NDFFJmaKHktWrYajIAkmAJ67j2hXbKGETk
2RU5PVOQjQ3spfrHAvJB7DPraGQLUrvA87HDeetl9W2wOHvHiYIyEVMQvCTthGSM
K0EtX0C50wX2bwxW6RfDIbyVGxYOXmC1ixB/NTh/IEtrRVDWjxKbqoBEgQPm6ZMX
HnSphrlLSBxqWxhyphZmClid/GmISSNhpUGN+wlTOd0/ECtf1+S6yZCMOhnDi5KU
03gL5cYI1XvYXCfTCN3NZgHzhw1pM8NZa0tb6v8bp378pj/Gm529LHBbVQ/As38+
uab/LH6M4XQU7UGVAOQMswm4pyJYqwSff2/a4I7iaWHd9YsTJZHIY4uqQ3xoL5+Z
w6yD0HXlM8GGGq1w6DP8u/E0y5WGddxzfPfJP5Ko3Y8HXHW/6dLDFVIbcwvOPseM
mVyUPo28fRhDh29v3kZcESK8AmPZOHunWqg6iMCfv0WzqL1s1r1VoGY53b7YD0JV
MJb6AQAdt7Fdag5eTBV9cjA9RUciB8ts1LxErWpMKeE9ItEYWB+exK6f3XQjIi+s
x+7d8FP/juF288nyxJTumMtTY+h11FYI2j22OoloBlV5LKAZDi9grNaQodmvIdVT
cvwObamQ3LMnmOlEy6v5WjXfl7LHeSLxJ6tJIhK19VbrSiMT4lw6pu44fAOmO0o2
HvxTcFHpXPD7mBek77DEAvakREJO8bIsrbMUPMxIREDNLHcEZUnScSmPRrSmZdCm
8LFSB+pcKw0mbwTIKkKCA/1P7Ee0Uuqe069/Gx42Hx5+x6dXpFAQrwES5XgDymC/
wby+QNViXRLNeJgKeJ6wv/cB2QHMPgkGoV+RnF1TuyV9d0hJv3W4BfbFicd/Wx7t
fN78RPkjb4icgQxQfLcPx2uqo+YFIMCJfVhOB1WN7sbqxyb1MgGAgsy6b5VOQzzJ
lynqPdUf1GKXseAbirPWfBECYfQhNqvyGXbu3It6OOLv6sncrVcGcSm+zIj/Rn1O
XLC9IQnCBPVnGPLNoxzzqRYGzl7l51Q1HdaxUc+vd7wyMoFiib9tArzeVAcLXBUB
sFu1KcTg/0qaMyMha8FrJOWzEdaRfGYBvrTUbwR/QVPqGylwEllf1jJjVYbmUOtk
9jpWeav4uZkD/24+9+/aq2pC3MbOiZ5qOhDt3cjSQqvhf7cJIH1R8OqW9FVifE28
2mKlSB0zKNLMWmGald/8Nn6c7PQzKyjmvPlOR5J9p9F4F3WIUPQL1SuztEuZjwiQ
DAmC+iAfmUO770ZhWIjqneM5epXsxuBovShqr1L8t7TEJTic4DHe2P7MwD5h2BZk
koviOjOvAVlTeiG0voUc7Ph+AEv5Y+N1iWE1ZChtoY3G5dQ9SBfkT6nSwUDJofZI
Frc+4slMAv1rU5VxzjqaboKXtpnUcnWXPsNmMJHjGAcOH7bFtWrVK0V2MD8SQDqC
NXrm6DJQyD6Y3t/hBbQ9gTvG1PvwmozcPP+Y+AsAgL50KYdf/XP/bJXyWIzXHzeA
io/bI91RivUiYVoH0tqT1Y7sFBzAzDY0+63SVmLnPNIJ8ICWv/0KRXHxyyoIynBI
SIygviMzKKlakVPphzXlD18RbH4Ffo7PlXc8OpYgxzM5JWD1bA0c37h0fAJycpXd
opEDj6Pppgov8gH8Ku25GWvLUjhrGUpDe95TWqwsb0UVS2HeTcykD0BhH0eIKafC
5C5FEf1Yug4xVQixnw+LAx2MFOUsszpn5ui8NPHB+RSjRUvM6Aa4N974oFuT4RYN
N4Wm3a6lqVaEeaibh1fl/s9NKRPi5+RBuBrJyd93+CwPC24uLINL3SN9P7Ml+FgW
nHVvu5gXCsx0Xj190mM0dz77g2A3aBZq2zbsFJ3KFX9UsWCOI6yuaYvIii5l1BcE
2fEjun18Wl77Fv6irNUsGMir67U1yWNnpYr0nuSff/fV3qm6lHwyvZGtOhAkzOWV
u4szzi2dha2SpvfFqkqvWw44fYCnvbRC9D30ttdxOzi8tQEPeXn7biHfaIKCuDbX
cWfKUUF8hxtywNzH5eqq1m+rXAgskNFuVu+4Cj2p7yKF8/VO7KTEiWzgknREmXq4
5JVap1hbPlovwTzgkQgqC+XG2mNLA5d2vzmzrJWf2HIIHANLgrqK7UzI6bcSKWca
XFIeXJy9a0YBeagWJ7UWRycVUZP/0ifU4HN3MitKYumx860IuS4jnmQIh3xI8Tt4
uYblnGZT2BU+iUd8FYSIBwp4qYCq5bHX2jorMmeiL+79GlF46dWV43KLnD9pw1OM
kj7sm3O3LeKnjOkisCxILpGNbwS2+4ntXHT5aUvyvbqqzUR0Xn2Rx2XBRhTpc26D
6IacpLyZ8MeikjmrzLSL2BndiOEgUzkMk0E8xsdBrWFmyGlNhaA3gAElsnv6u2B5
6AY6Qhte8rmRi1p02CJK1UGYwLrBEhzaLP2LZ+Quwz8q0h+b6Tzkte94K+h3W890
U0pXdhOYjVChdjBy0h8mPQ==
`pragma protect end_protected

`endif // GUARD_SVT_OBJECT_PATTERN_DATA_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
eBMBh6X/DGemeYa5G1KOYgph5sZdXNswjWTjnMpd3y8No0mK3NjzxLvLmbG7T4g1
MpsS3uieOfG31sswZGvxHJJZ/cAXZJ/BgVL6k5oDXSaIsYdeIpb/sz8z3f4k2S2y
zxUAE5Go6iyY0Q9xEMcZW8KDyZYjmEoUHz/GiwFaF+M=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 2446      )
qbWu3sF69OutawL0OKCx32t4Zi52ThyfbK89HqjXcl+Twq8iZVCOhvck4W64QD/Y
yKWZFB63UmT7NlOvy+QVODVrSMKj8nQWTQF3Xu++/d1nONYPCVW9aP9wkz+Km8Im
`pragma protect end_protected
