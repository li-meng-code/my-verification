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

`ifndef GUARD_SVT_TOGGLE_COV_BIT_SV
`define GUARD_SVT_TOGGLE_COV_BIT_SV

/** @cond SV_ONLY */
// =============================================================================
/**
 * Single bit coverage variable used to support coverage of individual or
 * bused signals.
 */
class svt_toggle_cov_bit;

  // ****************************************************************************
  // Protected Data
  // ****************************************************************************

  /** The value being covered */
  protected bit bit_val;

  // ****************************************************************************
  // Coverage Groups
  // ****************************************************************************

  covergroup toggle_cov_bit;
    option.per_instance = 1;
    option.goal = 100;
    coverpoint bit_val {
      bins b0_to_b1 = (0 => 1);
      bins b1_to_b0 = (1 => 0);
    }
  endgroup

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_toggle_cov_bit class.
   */
  extern function new();

  //----------------------------------------------------------------------------
  /**
   * Provide a new bit_val to be recognized and sampled.
   */
  extern function void bit_cov(bit bit_val);

  // ---------------------------------------------------------------------------
endclass
/** @endcond */

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
kELomQbKkORAn/CKhKwLJ8K0VOhc6hHrxqRoAmKorHTcCQBAfjqkAj1yqJGwFij5
YEaF/ezfzIavWZro5/esi3SCelHxfACxFBLoEn/HdnjMJWRnVGY5ru3mz2re8lPb
+Cxnu9OWgvBiUiIDPjGkj0px+BYzuluj4qg7O4Fr3aeL2fjLiAujmA==
//pragma protect end_key_block
//pragma protect digest_block
s/hgSC9iC0JCQ8Ya5S6SWlmVRTc=
//pragma protect end_digest_block
//pragma protect data_block
6kTTbG8iLpkfpcDL25d5G0LFQnqW3klr3q7QABnFLwJJ6tFWS/s7RXfvT9uZXVQ5
y2bG7tZBG3uJ8OU/THcrITDppFx8KYY8O0Rxh4zOlcXrKQI9HMKUNPbzBWakyO3/
13JJX7H9wO/01tfPmi8aoIxVRzcgaSw77vnipCxHALXeTxrzhxV7dZvqWkzRCwfl
k+6cr5SRtHG9PW4dmO81AVrB240OwgTsGlb2uwjNvkHR/IPeLZeeYIJWsSyuBvtC
88GRsyz20+c8yEZUFhWLlIJqsUiQyfQDjqEGZoCKXmF7w+GfkWenUf8UsJyuY5iv
WNiViyMME1JRYjfTAvmA8MbNXcMcBpXk22R4RLxFtGrrXfPZa0HgPfIJjIJIOY4Y
3ciM7gjiG7Azzcu1vZbLTeb4nV/JT/SZfvtWxctHb3nBojkRfwQ84F51ZqDF5UYe
lX6B4u9BV98ZRF31pkDy/7POz0Qtk7vtEhC9mFBQpqipGpXOU6SmxEJIu7Lmmfwc
X4+vU64Qlfbolm6eYdlHondxV4I33XBmFiIHKM0SyKVphZiIK4Wx4pvXZeG5voK0
alx5oiq1dmjtnEiPmO09udR4j2SwtoKO1Q+q2WdXm4n9EpXUlT5CZs59EiLkqkvw
zgysMgaT+tJF70kd4ybJ9TcLNF87pxHSo5OsZ7PKqibK0ewzn8ljzpA9yN15WRaK
IdQFzt2RgjrJnvzpxJlQqrx7jCEv+dYFS+oqdbrSzZ5pYshE7NaS56xdWz2q8f7O
M1viQtoBGcXFcz8I5Qoalzy4ZkMHQyPU3g/LqewozEwwh+tUZdqX10qR3gYGV70D
yScAChzL7L92CSW/GhJ/bCDMq32sq+8Bp+ePq6KeTDC4UUCTNgehAeT3atbu40m+
lx6fZba/vhdv8dUhNmAimUPSdchhxGZBW5E/t/EKD4owz9U/5/dAkEwkpupu0cOj
38GSB2qpoUqPlTgE+66y5w1swHhEjmkLM+LPfiFTJaRQhtnDHNSUJrN3E3FbtE8W
efHvWyiMc8sXre5epJLoK1TqdjKbraphyjQaOqgIg7JB9dARRWWRS+sCqeZJeRYH
SP93so6H1bIGs2rzzmB7wy7+HkIGHbJa3gHULD5AkwE=
//pragma protect end_data_block
//pragma protect digest_block
tvoEYLYd+SQVYBMTQfXhsr//A6U=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_TOGGLE_COV_BIT_SV
