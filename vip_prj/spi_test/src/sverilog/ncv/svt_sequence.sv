//=======================================================================
// COPYRIGHT (C) 2011-2022 SYNOPSYS INC.
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

`ifndef GUARD_SVT_SEQUENCE_SV
`define GUARD_SVT_SEQUENCE_SV

typedef class svt_sequence;

// =============================================================================
/**
 * Class that provides the basic infrastructure common to all SVT sequences.
 */
virtual class svt_sequence #(type REQ=`SVT_XVM(sequence_item),
                             type RSP=REQ) extends `SVT_XVM(sequence)#(REQ,RSP);

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  /**
   * A flag that enables automatic objection management.  If this is set to 1 in
   * an extended sequence class then an objection will be raised when the
   * pre_body() is called and dropped when the post_body() method is called.
   * Can be set explicitley or via a bit-type configuration entry named
   * "<seq-type-name>.manage_objection" or implicitly by setting the sequencer
   * manage_objection value to something other than the sequencer default value
   * of 1.
   *
   * For backwards compatibility reasons the sequence default value is '0' while
   * the sequencer default value is '1'. So by default the sequencer will manage
   * objections, but the sequence will not.
   *
   * This does not, however, reflect what happens if any client VIP or testbench
   * sets the manage_objection value on the sequence or the sequencer.
   *
   * If the manage_objection value is set locally, then it replaces the default.
   * It can, however, be overridden by configuration settings.
   *
   * If a manage_objection value is provided for the sequence in the configuration
   * then it will replace the locally specified value.
   *
   * If a manage_objection value is provided for the sequencer in the configuration
   * and there was not a manage_objection value provided for the sequence in the
   * configuration then the sequencer setting will replace the locally specified
   * value. 
   *
   * If a non-default value (i.e., 0) is set on the sequencer, it will be propagated
   * into the configuration to be accessed by the sequence. This will force the
   * manage_objection value of '0' for all svt_sequence sequences on the sequencer.
   * This will have no impact on sequences which have a manage_objection value
   * provided for them in the configuration, but should override the manage_objection
   * value in all other situations.
   */
  bit manage_objection = 0;

  /** All messages originating from data objects are routed through this reporter  */
  static `SVT_XVM(report_object) reporter = `SVT_XVM(root)::get();

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
dYP92FxQRACbCdmFhCUg2sPWVxBsI818cMa0T6QewQdv5Z09hn2Lz4dvV3vETEAg
YpXXifYSz8mMu5zWP1kmPmh3cx3m46F5KKyJM73QqshB0fZTJ575zaO2QNryr7xC
nU6/ExFFllSGxBFcabAeAGfEijsCvz9pLr/eoBF+AUEWi2azBNKwLA==
//pragma protect end_key_block
//pragma protect digest_block
cBs+bZMEnCU836yFsifBPe/Xwn0=
//pragma protect end_digest_block
//pragma protect data_block
ar7J2G02IvRnJXJxndKxPA2b9/iUE8HzMep9+4jQ7vnENRB5+0ilpFcKhagwp91c
pwh0uriYHUgJF+6PFgoMZpGCwq5BM6e5WdsCBc0AnkPpqO4dPjZPE8m61033CR19
4L+NBte++00AAc9dQaSdVbbBdqO+sFvCiMfb5scS0N7NJqHBoyYIVt9u+O3B2o8W
obeaGaSMTUozqQczZQB1bsaRxNtFfOeguS7zhasnDUDHT6KxMsZNk4kf5A0sO0wm
O7iznGnjcqFV45M1k2r0KfRBTwWbHjt7nyoNVONwvc/dyw/rBmVampyqILLylUvA
XaL/1BKLZ6mT2vtFpPP/Pq3lVyF1YcooCvI/vrm7eaHEOFbeakPEo0RUG73Hc96j
AtKtqrq1G5sNYUooLDQRLc+BY5wOiGo5nEHkxUjeyAXoV7aOjgw6yJTDkJVPLwTG
u/M6g2jFMvdTGPCNOKAIpdTzf2MtfHrPfBebAii4yXTQm26ThvvaMCiC4yCAxb0b
jeL117AfnyZpAZMRW0iw2w8dW3XO4VuJIcXZvxxZBPph2K1xVxgJ/DeCVia2rG9Q
BvIYeaZ0xtNq6PgfbUCgP3dUYay1yavFad2+mtK0cL4=
//pragma protect end_data_block
//pragma protect digest_block
OQPti2YYhH+6ioBuKHx2ZOl6c5k=
//pragma protect end_digest_block
//pragma protect end_protected

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /** CONSTRUCTOR: Create a new SVT sequence object */
  extern function new (string name = "svt_sequence", string suite_name="");

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
1XUp3MNm1QZpxd7aAJD4rqbYLqV0DbEocbfIopra0zapJhsUf5z9k0pUrXtayFLS
WtX39fu/zPowbYpC7N72IRpbklAOMR3LrCJ+WauDQuLu7k83bZgT8Xq1TBK4InWm
IdFT5xfOPnpmA7eDGoASJfaLDKlBptb5pyLiEG/FMU++RzhNoLW65g==
//pragma protect end_key_block
//pragma protect digest_block
Bx0qS3Gcq9HhQuyKsNRymhV/kbs=
//pragma protect end_digest_block
//pragma protect data_block
kOcc0uY5AZa5sr1s3GPBOOdjhvPaY3chBioxlFivShcN629iTwBjEh0ENBb8e0GL
BNVeWyiA8CVA+9goiTvmPOkzQEon37XUwbnXKOg9Z2wvsXRpt0TTKmyL6/J4UEvO
9S3vPcgTWTdBnry7Ck1SQJxTu5rBl7J9WJFybI4q9c35AxogC077+1pl5aWqRvBh
FI9kFrzdOzTyRmrXjbEVz7f2BFpT5ap8u5vjwnTlYxWVJQ0g2PRZGuqAqtwVP1aI
kZuJszGqOJrkPrdtsNW94gZu7NxwbwVuRM/KJ6JOjlxN9ewyUtzO5s35o785JVZ6
2woOXWFi4fQpWQSkdT4axzPa9XCuo90laN8KSDyzgaxfuCmIj91kNXniMK2nBGbF
It5D+oI7dPii5hbamxVVBw+TFFxaGD9Oofcfc2ILGO6oKv/5K+zRL6MYjKnSNcI5
o4+IGebpxOGpb7EmIdJu7l+rxucd9tLw7t98757Xu8WtYOIBreBTGNH/ZD902Siv
riN6Gnc8iT5h8NTwtE8tIOBQwGfhDQ9CDUkxcHrIvXnCwxQr2wiVZrwhYQi5Qa8w
diqwp1umogtZchj/HnYHRQ9DNY7Y92R6th/FuLVXDoXE+a1I1eucFvitXvhijZ0f
RR8kKcJDgKNGOrvz/N4m+UCiCYNiIV8+qPN/O/xMR+kXsBJZvwmutsVbDPPVD5ye
ZS7oKIWid+5NZFFoBqZDJMBAQoFd4bFpA27yuYnOKXxpUOUpVxdrhS6xgpokErS+

//pragma protect end_data_block
//pragma protect digest_block
t6ck4igxwzd11Zoilq43aGJGqQI=
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
1ZdiST4z/9mBd0zLhKa9dYMYKq1N3bsCaI7qasfwXubPqOu+ubslAiUrlxG9o8lb
SfUyybfq8QbQy3Qx5/TIfS18Whwq8VdtnG1pUuLQp9OT+rPMbns0zUdDkod0C0ze
E82FWf5UWXQ65R4FXtlbkFytLi0gBqQ1dbdqtmlyi1U2cGfXPQQC9Q==
//pragma protect end_key_block
//pragma protect digest_block
M0muhdNTD2eiwGm/Iym3i2WjFoo=
//pragma protect end_digest_block
//pragma protect data_block
J5eOt7HDI1HOjqG3hbegnYczcSgJgl7AqtxN4bVoEQtjiuKppXr4KdlS3FWwcL3c
50DqAMxy/KTA0PFWtQI0JmRRBGVUhX/ISfdN/IBKjpys6xYF7HvIm5aWRYFlrzpy
jV7iZGEHP/luJIBySN5JRgALIgH+W40V8Hiwdhizkm7frXP+uzRFTMf4nIQfu0qM
HmzO7fuEB3/CtUJMGXnrJx1yvUD8D2dAoI8swFXZC8tZkEIV1dQRczkqlGqaueEg
7+/OYpc/0q2+YwRJqTwwPf1UorVoQiAHxcpsqUOlCaDzvflK7J1U7XHz6RVtZPOY
g8Lk1CeH9+5qLhCGSl0cMT96r6AFkuHwqaitTuQukrOos5wS9mp6OtlTWQj2ZIuS
e7upBq+OAY//jG2hnLyxm/IJ7dXLYoOZbnXUw5Wub3HP80NKGbSUqNKKHXo5acH2
955ESnmy5xfpWQyRdCMb62VuHSEdRvdohC3xzHQbtqlCoR3UIeZXQQg+/qRXq+O+
5krxwL9x5/i0gpYcJwGcExjNR+bGJFceq4Yg+JEz/OoTs3xvK/TbeVCUgCR9WNNp
FYcYQF8MD0Uw9muCaYPQGcj3YGrsAIfsMQ0W6W1/wrsuuDAZJy8x0fQAeOhEYhEt
Jd+FrKbaHG+BR6ynJrsiIWeibJXsz1aKzcr/MhRGCzb5S9QdPqREP+V45MYCx9Pb
XWh5utFSFu49P01B8jC5Yw==
//pragma protect end_data_block
//pragma protect digest_block
OGr1vJMmYVetBuNjZuuu1fODebE=
//pragma protect end_digest_block
//pragma protect end_protected
  
  // ---------------------------------------------------------------------------
  /**
   * Returns the phase name that this sequence is executing in. If the sequence
   * is not configured as the default sequence for a phase then this method
   * returns a null string.  This can be used to retrieve information from the
   * configuration database like this:
   * 
   * void'(`SVT_XVM(config_db) #(int unsigned)::get(m_sequencer, 
   *                                          get_phase_name(),
   *                                          "default_sequence.sequence_length",
   *                                          sequence_length));
   * 
   */
  extern function string get_phase_name();

  // ---------------------------------------------------------------------------
  /**
   * Raise the objection for the current run-time phase
   */
  extern function void raise_phase_objection();

  // ---------------------------------------------------------------------------
  /**
   * Drop the previously-raised objection for the run-time phase
   */
  extern function void drop_phase_objection();

  // ---------------------------------------------------------------------------
  /** callback implementation to raise an objection */
  extern virtual task pre_body();

  // ---------------------------------------------------------------------------
  /** callback implementation to drop an objection */
  extern virtual task post_body();

//svt_vipdk_exclude
/** @cond PRIVATE */
  // ---------------------------------------------------------------------------
  /**
   * DEPRECATED METHOD - Clients should implement/utilize 'is_supported'.
   * Determines if this sequence can reasonably be expected to function correctly
   * on the supplied cfg object.
   * 
   * @param cfg The svt_configuration to examine for applicability.
   * @return Returns '1' if sequence is applicable, '0' otherwise.
   */
  extern virtual function bit is_applicable(svt_configuration cfg);
/** @endcond */
//svt_vipdk_end_exclude

`ifdef SVT_UVM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Obtains the starting_phase property from the uvm_sequence_base class.
   */
  extern function uvm_phase svt_get_starting_phase();
`endif
    
  // ---------------------------------------------------------------------------
  /**
   * Determines if this sequence can reasonably be expected to function correctly
   * on the supplied cfg object.
   * 
   * @param cfg The svt_configuration to examine for supportability.
   * @param silent Indicates whether issues with the configuration should be reported.
   *
   * @return Returns '1' if sequence is supported by the configuration, '0' otherwise.
   */
  extern virtual function bit is_supported(svt_configuration cfg, bit silent = 0);

`ifdef SVT_UVM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Utility method to get the do_not_randomize value for the sequence.
   *
   * @return The current do_not_randomize setting.
   */
  extern virtual function bit get_do_not_randomize();
`endif

`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Utility method used to start a sequence based on the provided priority.
   *
   * @param parent_sequence Containing sequence which is executing this sequence.
   * @param set_priority The priority provided to the sequencer for this sequence.
   */
  extern virtual task priority_start(`SVT_XVM(sequence_base) parent_sequence = null, int set_priority = -1);

  // ---------------------------------------------------------------------------
  /**
   * Utility method used to finish a sequence based on the provided priority.
   *
   * @param parent_sequence Containing sequence which is executing this sequence.
   * @param set_priority The priority provided to the sequencer for this sequence.
   */
  extern virtual task priority_finish(`SVT_XVM(sequence_base) parent_sequence = null, int set_priority = -1);
`endif

  // =============================================================================

`ifdef SVT_OVM_TECHNOLOGY
  local ovm_objection m_raised;
`endif
endclass


//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
YwpJSqZQiuOcSCofK63cwfFQ3+oygJMfYJOHF/2FvSUwLUrEhzjd+4mCT/r0A6nE
t0aQYcN6q2V9wzALEEt20FbkDZ0LYBqz1ZOffSqdJ3iU6oMA1WQ9lGi+pL/qbHvK
CttgxbXqBJTEJ6+as5VGMAv15VyrKpRH9kMxQKzgqdjCIGwphcjsqQ==
//pragma protect end_key_block
//pragma protect digest_block
Xnlywh4iiJpr/zdr/jKMieyoduA=
//pragma protect end_digest_block
//pragma protect data_block
pAJcYKLH9qdLZ7MxLpv1vy7RqNOUwp8rHJA6R8rkNXsETj+35BhbGBwS9fu21qGp
aLF5RJFRDzOhsd2/GaX3SnUq5vLFrzuqZhTWG/n73YIg5F0TEuG9LccVBpTPwFKL
QWGjIjLsG52m3XVQyHURQqE3x5POrtpDSH9SUAixSMUxq7xbnKUocwfs6LBgDBVN
/FaeBOO7gumGhNRms5InRZVIyJq8Shf+bGDqShnMARPAB8u/b6VpnrFTb/rF8m9s
14dB0pRGBmwGGoYax0+kdmxT98bjUUXVfYu42DRzId7VsEeNzd8OdQN+Rg3MDHhD
VxVlZGFj6L57THTtJgJfWRokhXmRkCn9/u1fAk1k6bW0jszptzeLLtFZIYbYKkiX
rhXq4YB+7XFaudcVW6g0AfBlJuNnXynhdkd4V7sh++mrpdJ228b8noH+L8kyux3/
oYmuRA7SLg2nR401fALTKDj45sGtwm1QKK4shnptSBVcXsrcJyDy3kLnPGk1y0Ju
JVtG5Ydi6sVq0W3a3tqGVqy51y4UfakUie67nAdOskngeKaB5CA3LazjHh6ITReO
6L163FIs/QSR7X1VQ6DI26FrUdeVlgGqCzgPn2wXgUzKoMt5GjWlzkviJBL2wIKQ
/shYUanacVE3iK0bs98qIqqEGMZGiUgG/LqEiUwws3aaWmjCczqjDUFk6AUBLtaq
L640fQGaFBq/7Ni1to2nvctpsO+rvoUd+Tc74kp0w5fMKQMQyWYoY7WZC8DD5Jmc
01TsnxWGdmk5J/9Bd1zJo08WKYS8G0W/l0NG2ypfX+29fMpz/mHW11K6D9qznLtm
crtxwg9oiVjzryMXq10rW8wwcOnu/69XbHvY1sYvn+9WncyV4VZjcKTEm+ylfJ7N
Tmflyv465RctocbmFqbPb9Az3OjH2TNWUY9AmoDOvqv0mP20ltStPq3+f+LvPkRs
tAiorIBxRCQMVB08ja8HopKVTOOq0crv3eRzggHvKo3fOhZcKyS0yzkSqmpmDYyH
McgJXpv870w+NR5lw3rAJC/Jsut8J8Z+gf/dOm4WbWuzKFgYzHQdw7gIQ1dYzTYv
UpFIqKcBmdHLMeXqEFyGubI2gli55aMjvj2bvEmeiqnev5/c5KTemHoo9xJb/KRz
mhD11qaPbOKElIy5niB50Lnys8zzZsVV1R4wFhFTrJQChz2aImNJf/e8sUL68f2G
J1aTLf3E9QpB6lUDYqpjxjRML/jr5SC2/3W5SH1lPxd2GZoXacrguvfDIjyg9Qtt
712JD5A8OFy7KXNYz7BVpkHtVt/1GbCalLhF9D35KqWTCDn5JPb4FruP47YKSt+E
hFKhWyShLsBUKKNEG0U5gMAH5JiDSkWkZNYlkPZgtaWmea9hzr3Hlf8QrELbNmne
dvHjE593/SPs7gjKj+xAjnBJrtxgDTAnP2hSan0hKw7Qq1Xta+yR7IvQkgWuzPrS
rBKI2dzcXCPQ5SmRxuFuHcinHH0kkbCDX037KJGv8+lrKJnOighi+yyYFfATSOPp
NVST/5ov2ML3mXT63NyADBj079BhRzyzv64bb1nGZl2U10p5yqTV9goWYLNY3GrY
HB+HsbA3pcH/JpzDkvIMWZd0rdshCN05ARa+bQP8O9LcPmHI/1Vtyu7fPOv4OfFB
G08Fc+AsNyHOrcrcFHaBVdE9HbG4GHj7QEfhzQ6PNK0qaoZVTh39lIvPr0HbRRCH

//pragma protect end_data_block
//pragma protect digest_block
e5AKzsik8h/B8mpbC4OaNMVmtRI=
//pragma protect end_digest_block
//pragma protect end_protected

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
iLMasnbdle/n75iI3WqRdjGybC/JDSnRiCdZCC9gvYzAWnhZJziExNgh8llgV5Ax
3VrNFcgknUnU7IOBF6cQdHziCPw3dc8nR/vtzcfLJmBMMU9kXeO5GQILxBrP8Ju4
Co1vNaLIXOxwdCOEiYhvNAbZwjherDORS4FyMbT0k3zihRF8OwqXSA==
//pragma protect end_key_block
//pragma protect digest_block
SdICv4Cvqtw0Xq0LeQDT4TZ7iq8=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
Y9ZUrGSBQjsmPwArui7FrgR4FjE=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SEQUENCE_SV
