//=======================================================================
// COPYRIGHT (C) 2012-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_MEM_RAM_SEQUENCE_SV
`define GUARD_SVT_MEM_RAM_SEQUENCE_SV

`ifndef SVT_VMM_TECHNOLOGY

typedef class svt_mem_ram_sequence;

// =============================================================================
/**
 * Base class for all SVT mem ram sequences. 
 * It is extended from svt_mem_sequence which is a reactive sequence.
 */
class svt_mem_ram_sequence extends svt_mem_sequence;
  `svt_xvm_object_utils(svt_mem_ram_sequence)
  /** 
   * Parent Sequencer Declaration.
   */
  `svt_xvm_declare_p_sequencer(svt_mem_sequencer)

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  /** CONSTRUCTOR: Create a new SVT sequence object */
  extern function new (string name = "svt_mem_ram_sequence", string suite_spec = "");

  // =============================================================================
  /** body()
   *  Response to request from mem driver by performing read/write to memory core.
   */
  extern virtual task body ();

endclass

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
/LYb9Acnw8g0EKarMDqWz5b8mzMVLJ53dGgl1oijxXqk34IVXopzXopwroc/O9nG
jAnawCIYFKa9cdOM9+5i9hnSHaY3+imxYeFrCulnacvhA/pyuvCKSTEIobosfZJn
xQVWOllC8OpTsjE8oZgvUeLEOoedXITGz8Ru78rpYmi82eFAteHa/A==
//pragma protect end_key_block
//pragma protect digest_block
8cATa5fH2iPSEZORxubu+/c2p6Y=
//pragma protect end_digest_block
//pragma protect data_block
pYqIbyGKvYHpcHbXvJpZOui4SE80euJE4ak8addKuogDv6Kz2Y+9ZtS3WZ2ySDtR
aywbB09AdY/TL7/NW/hQZYQlpG9sBr7wEjkQbj3OhIRfKkJYZWOVLGF85uetWHDy
j8lVuLJ7GqZwLcRImam7ZMmjJ594GS+M28DO8LO3T77GdXyNutnPioN7eKoFic08
7rIWs/ZFhoVLOPxVn8PQuhQjwiVG+P1aCm6qGw8crEwXkKZatdbv3AQWAQ6KHqKy
pL9xSXPAkCMwSxYth3I5LR0dKUTwRkS970xza1Ug7jLXyFFJ3Kv6qjLcTy39TAR3
SIflE51acZMpEEWWZfKvlw9gHZRVQAS/kdU/so5GSfqcgs8iyFJoZKMqFRBqFduO
I41wyhSBwACXoqt0N+5gw+d+rn+TUsJT+STw2C14xsPGOvnbUEZBKEdTtCKuVSnN
AJcV//TDliFFTMaC7xzRts786Y5SC4vn8WsdYVPAhUHc9tMy7wh4k8V9oUofUrvw
fMA64QrJHXIslxzVarKszk8Q5riT597Rmaf5OvVFM6iv2s5vKuJSrS95kbIy4r+n
QMfPt7LXFvCGSD6onSA3Csr9h52hYTtJBCgt8u7Pm/cJILvQRA+u7pKhv33gP6sk
AshMzX1lgYTYuo8CBf0+29R/cklhWccjqfRF+SoozOhhFNwSgYPmyeTe8FmTveTH
1XQZEzc36pQetH4ZQ2n7dTeaYb9M004N4C5tttLtA83ZAwvLpUFSkDJPQ+AjjAsH
MrIqvoe+kDBgYfhatJq9v8m5q1zazjryNQnc/2BchNZqk1H/Q5vjjy6Cbbh7r0cn
qiVqD1UyOcqyS37l79UpDFhsiNq6bqQusNB6y1ddKQ2zbtUP3qSSeA6aaZj67i8v
HXh6hm29r7YicAuA+1ni4RSWZseJ2fDod6QqiceZKQIr8X4JmCiMfoOEK1hM4AbZ
kVdtvAsoeMxH59fhYIrEgPimooqs59iSR4SDwUY/f1I1x5ZxjOQ6Z6pcpMa/n+QP
kVAmTvKvsAZmRMZBj17esIoPzkVoFAyyjwAzQKFT4At/FMSfSlXgNHePgzlUwwar
4W/STGatfbKkYoess7UpXvyyur4xvJpaR446usHq/e8arvKxL9KYZuOuBY9UsORB
vT1oD2CryqUsya5TGdKMA9v/RePF+bzUaIxm9hOosRrZIo2cslAYRYU5UD8DrvjY
CPA3q0tcBWycVfqF3L3laWxJ+D4h4VPL3EWn7FDD8+vo7Okew9sr4fphU8AIYgzH
pXJjvkBVjJh9ncobYXW+G2ofj4kTLkboWaImWhxYZSiwJmtnQ6ETsiR24VlGaxf1
obYYG8SwoyyZEXh6FDRpxacOlhl4R5oNPHhuir2/ekJ1TA9JY0fGv07CS3Kp//iU
FIklRbzVj0xtYtYAlTfGK95KAJXkJagoAGjIA+Zyn99S58Mucees3qybee24zVl3
ej/h5cbJuyA6VTdlmXWkuErEc2rZOqYsNxdDPChEs8D2atcKpC3dpMLRHSxCnSVt
d3DCKKrfDpVAavGNzWwZpBeHe75cyQdY8awhPaCYAMvcDT6Uql7K6jITd1o2nC06
ojqJ8CAkWDIobmskgPumd+uDinUx7mtWghGO1THCVs6lnLwSvLDEsZUmq/Sx4l6/
Lhu4eeHxc/VfkSS2ZqZRg4bzsVvhfAtPbUalfc8WV3k=
//pragma protect end_data_block
//pragma protect digest_block
SPtXX4OSZ/5FzXTI/Fp+k5q3S8M=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // !SVT_VMM_TECHNOLOGY
//    
`endif // GUARD_SVT_MEM_RAM_SEQUENCE_SV
