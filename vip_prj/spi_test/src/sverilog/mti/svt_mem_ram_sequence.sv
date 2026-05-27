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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
VO1NZsZoq2E1NVbYf+L7rB0CULnYYihQD/PwFkNp6xa7aSW0FyT/wwYWWEc2464d
N8rqbifBMj8HECwNuSVDHgghfIUoq0cWVkp9iQPbK+aTdnFzJ7ZjTJojsL3zM5PF
jkfxSttc+Te75reL6x+5f/FVct32z8m6CpmvW0bUg/Y=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1103      )
UFJ9ktLgZ2n6wvHiYZAedoZS0t03114ysa5jNeW4pe+6PuY5UCs7e5WS3YxjfyrT
e/w7ArFyrPlRGh97joidEidT5LB3NTiaiVS9JkhySIvNXB7yeW1OkC6aUBV4DrQa
FJqM0RPzQxsmWEKnU8p5Ctg8h+KOOBRthm1gJKvURoZNhsrgkBonRf5MXd8Go7Ki
nx/3/pIo2prnIafsJDsnbHfy93t+dEtXJOsauMGc6dhCjsr37YP8locD9RApYsHw
6W9ubwO87oQyrGmv9j9uyEjEa0wJxTJQ0bDUoqsj13k5EOhgmVMdqReYIiImRYhG
/uHMtz3f195PYkfq+yjAZXG1JlAh+VqBIsqgJcl/lKuqgkF2uSuYnMDS8D4jA8fJ
MmnANBlp8q2OzE1Sk78Due8FVRgdyuDATawuvmPShPjkDBYJ2lqDNtiPoPh5bNiZ
C0cXMfBDfC057Z5Xtog7HzmFqp7ymbpG8TWfbStRcsVUWjbCyPBDFBr+jPORF8JS
bgKQ/5dM+LmgIRK8HMZORlQoneGov+PlCuU8UCUeV3bBneUzhvP0LLkht6DBVO9y
Fufqxx5/3RDZAYQRgrjBqSv56JdVBn6B7NpKI9DUqe+hcD5dxe6fV3cK/ZbTXHFf
RH84wfgSadpys5DL9LiIcZYfTKxZaev1cjljn0yhr50WsmFsQw+HDDMn8g6rHdou
A0HKXrqzKgfYTG2QGLSp3wjXmSZZCJzxZpe6jnsBYuSjYjUTAOHUtexpu4AASBm9
4PidSMjVNq1F4r5nepKa+PSwzDcpc9S+BMhALwvDmJ/ZOYpJ4fboT4Ay/k7ixKj5
CMxtHinC+f42QfsMCgKVp4WEbNG0gfF7EKv38GIjm55ZP6CzlDVBOPEzqG55fQzD
+1/mmDLwaQ+kiK/6KXnlV4CW8Luw7A3gOesfVLHKippuEvd0zjW2445q0EQLxZSR
oN2/wkkodm0k0jpMiBe8dxIxRvLovYSk8khY46V8wkj0t5hss+kg57KD+KGqmue7
8OI3qI5z5I3lxcONRmY6guIWgzBBrofXowVO2S5SJ1fh7qEJkYZM5q7ZUwXpon3f
bWk94Pmo2dPes4EyVjGNk7Q91siJ41devlSluHkDVqgYIZPTx0mEbGWY9eob2qKA
h8R2SEJ5n4skE7+aWxDZv1HvYob0ZlpN6shu9WaPz/yNVqVoxQdEbl4Lm5f2Y2GB
9n166o5WATDwfwZ92B6iLEzU1f/0RtsUsOsOfoe3fMY/T5Q7vLhm/mWcYjSySdKl
OHLep/osR+6g1VjsPFL4yP2qDR2q7yvFtyvKVzpW2xd4998wD78bT6OeZhUvbse8
wC4wccUTI6vyDHjZqONB6bG063Oiggh4cXGn3RjhztAfO2Jsy8zX1jNWlbKSurKO
Lu5kjfb9kzyP2DGDq7P3rlKSvOfc192Ac6tOK3LRIt6hVsnBIQaBfU12EPQfpC5b
`pragma protect end_protected

`endif // !SVT_VMM_TECHNOLOGY
//    
`endif // GUARD_SVT_MEM_RAM_SEQUENCE_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
UGBvWJLa0OL85oxpH/u/a09Mh6oQJw2oUXC9DmVirxTe1olUdUO8RxqY6m0rxbxz
y0WNCJBnIpzk/uQhVSnVWmwfuSitUZN0XPoCPia8Dmq8fK5GyqfJPqQq/+wz88KA
p/xil7zCDZyosGKMNGVFAAHzpnL17+Ex4nIsDEWkVa4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1186      )
pljfGHi4NapGghY5xCbh/LWtLTTYvKDPAXjgQF501iwIH3Fpm6tPFlxze4azDi+E
JfqY3oAmJdre05sAeMoAfL4qqU4G+F7z/X1m7V4and4oiNDFqQrHPjXEwkLxsrqP
`pragma protect end_protected
