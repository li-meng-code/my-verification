//=======================================================================
// COPYRIGHT (C) 2010-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_DYNAMIC_MS_SCENARIO_ELECTION_SV
`define GUARD_SVT_DYNAMIC_MS_SCENARIO_ELECTION_SV

// =============================================================================
/**
 * This class implements a multi-stream scenario election class which avoids
 * disabled scenarios. It is designed to be used with svt_dynamic_ms_scenario
 * instances.
 */
`ifdef SVT_PRE_VMM_11
class svt_dynamic_ms_scenario_election;
`else
class svt_dynamic_ms_scenario_election extends vmm_ms_scenario_election;
`endif

  // ****************************************************************************
  // Public Data
  // ****************************************************************************

  /**
   * Flags indicating whether the scenario_sets have been enabled/disabled, populated
   * in pre_randomize().
   */
  bit scenario_set_enabled[$];

  // ****************************************************************************
  // Constraints
  // ****************************************************************************

  /**
   * Constraint that causes select to be chosen randomly while insuring that
   * the selected scenario is enabled.
   */
  constraint random_next
  {
    foreach (scenario_set_enabled[scen_ix]) {
`ifndef SVT_PRE_VMM_11
      (scen_ix != select) ||
`endif
      (scenario_set_enabled[scen_ix] != 0);
    }
  }

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: In addition to constructing the objects, controls whether
   * the randomization relies on the VMM 'round_robin' constraint to choose
   * the next scenario, or if it simply picks a random next scenario.
   *
   * @param use_round_robin Indicates whether the next scenario should be chosen
   * via round_robin (1) or purely via randomization (0). Defaults to 1 since that
   * is the VMM default.
   */
  extern function new(bit use_round_robin = 1);

  // ---------------------------------------------------------------------------
  /** Setup scenario_set_enabled for use by randomization and post_randomize. */
  extern function void pre_randomize();

  // ---------------------------------------------------------------------------
  /** Watch out for disabled scenarios. Move forward to an enabled one. */
  extern function void post_randomize();

  // ---------------------------------------------------------------------------
endclass
  
// =============================================================================

//svt_vcs_lic_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
GWNaBqpGmILHbfKNMiWjiJnJwLlTkOQCRXeAk7pqh+ZI8XWSW469RbW+uAgftjzD
VH5ftxsWpGiEGFELWGW+5UcKff+XXIGFUzdB7HfTB82OArrOpbArjD4Y4j7OThxa
U7ya4SkHOavfnU3B/fqupUcXHU8Csn5+gxCqUMidDuo=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3172      )
e6FsW66K+LYjmMsBk153QV7vi1bvJjNnEYGGr1z/Wrpu6fYYLiFmNe+EjhRSrC1l
lS2LKCednEnyLDIiH7OzNdc65QaOdyYkN7eChrim+DQbFMAJ8Yv3vRSAaGr7gEtF
+16etB04YENBEB8SRkKc/oa/f0FXBCrF25EMVm+EZ0+F9b/M5Uoy70QgdDYOesrQ
vftetoloaJ1p4xkzxttVd31LPaVnuecVW2i0knmymZ8rdkYm1+W1bI1M/Lgleera
PZRK0r77FhwsljIoqPW24xuT3NVbadu7+KyqhdTFN+fxiQKFb8NwIX95vKK8SldS
332y2d7h1f9qoACl+vkzPS5LSAT5PDu+PuHhBpwSeEk1U2JiIKyos/Oyz3YpAq17
vc2aKNeE1rTr2m+vmXkZVB9eo9XSn729H9PkgYbppWfXq3y8GU7bguAKKIYqZcmw
bWWIHgMl6fe0DdDbkQlRHAkHEwgu89m3IgKhQmrbsAg6Fqp/p/mwGXLxTgrSdpS5
z4W4aOXdLAUnLlGqjGYF/GJhqWnN+z54nFN2/kv5tkWJ29TgC5Uy0ZNL/MHgvQhv
ZWw5gnlAl6VkbpXcz0SMuxHwFJn4v9iOMT0llbwoD7kPO4ZpTurQmwWc1TtJtRsS
QK8FZQ8CT38Uq0XI8gd9Atd5IHTuC+gnfsPu8mxEXRFSaAirt6cTMs77zo/m6YoD
ZjBK7D/BYuXu9ND7xIxjhfYXLrRmiKDU+EgqnXl0kUxbWI7UTgyclGxAuX1ZaVCd
a2gbWvIVxf07q4iYPnrEyn+iH5KqozAQceTSGZRSsoNUq8bnZZrRb7hyPkNwIkaR
oexjehatgy7McWw4iH2V5R4pmsB63lcueCDQ/3vrAk9lHnkHJcC9pDMRwxNEQ4fA
Yo8JK1gPEjDtIGedvUS8/0Rou9hHT6s9Saoqt6Hf9SDa0HQzhMpWIKv4pYUj9wIp
JwWXqvGHl4EWt7uLVAUqOWt2Q2xZMdcuFHVgvW2LVbsVGf9zn/1vuyjHRDmcercz
vOdSE5xof1yGx7XYWGHLNOrlzIikb0P/H6wF3LLyfSUt6LEVR5Ad5EE3jBlv6PYN
1Ti1G8fh5qLV55ve2Mt9RRwQtaonCLVSRketktCCt2ME6CZX85/U/bGhSdYOEfEm
WyYVjbxrFLRDhIwX6L7pc/pLb2akle38aLH6WE81UTrH2PYavd4EhWeoJvLXpPwW
U0+EATaplJ9DdWSnKaqlBPNaHPyMg6hf1SiG7A7kaIjOtvLvWwpSGxDclVHb6VM7
R4sWpAjUEyhC4BxYAKahoXCqvLU1KjNONRYe9Q0WZCX7GvStC84e7sNHlDXQJKva
Qbq9e2O9pb2NsICPjGc3xSfN041x52YJbMdDhXFQVQuQzcYn58NiGoFgxGIBUqDz
IJFgNhuIn++RhM4qaJ1odeud2graKs6HA4e9XKvMfSVZ2hh2fZqO2MO0MGHGlh6M
U3n9TAEGjgb/Iqmqd7MFB8d7qLwzg0qLDbGZWEZMrJ7j9djpREwbOUioMTd+ggYI
KHzqzLiCnqrb9XiNUyURT+PisgRwFu8fAzSduuzw27xiDZsZPSi5Tzvd3JwqJFl4
fsZ69vE4adO06yzw+KKGOKTuxv5d02Y8IRLgSxYwAjDPXTtyIXT8TG9m0PBZggbi
3MSa9lm+2BFRYQD6BXGIUm9i1pIun7vy0e88xU4rCXPRVp6SXPj2nXBi7HhFkv8P
KOC2DSA4aLkZsVd3tTkNI1nQFLodUxCCY3O6V58AB5EkkpZC8ZQNz+8NiroDb+QX
RKwr+bqRdd5koRGGFuXvk5JO5VdFBMBL9ntdGbS01Ita06e1XkR2w6novn8sZ67G
8K7pCrZBkMyRvEHnrVa4H157q2xvlQ5FzkCPSzMTU6pxa8kDWexBfXDbUHG+ZmFt
Zx22vSGG1yUTjGjLujxYFWEYMR/EkZypi4E9eI8Jzhy8vBKcn1pnsLts+ZjvsL9A
Tzl6pH9EdbmanNHeeUYMLwa89KDbH5uIDEPdjWi8F+hEuzI0+5F9QwZXhZhjFGP/
kBh/T2NlfGPQ47/a56wxP60+bqqS3/QdPSuYjM7OehWDdkrdKAv3MK5DgL97z0EN
X6RNW4k/5jXYuOz06A3Bw5LdgM4BKwy1q5sARzQPSL87eYfpwlnpUERQXYX1XK41
mpWBTQghp4cBQx4kYbrf9X3rn9AJ/s8+H3iMbiwGuEdBowFev/NF8Ob6Whr4qdH7
EFkYTEd1GftU4MAcs7VZdy7vdJdmyFWgiIsp35DDNmLCKklxXv7jvl5tRFR7d3Il
9ZxMWvJpEGFoSnyTXHEowMjrr9iiRhvUEyzRc5PKa/sCvH1Wd+v0TFOHee4ojhrF
P653xUWWhOUUqv10Lf3DEWvO2ala+KWxuASrXWmmFKqAQXOBcJfnhIoAmd6kuIMo
06eBoWjfiMeSs2OesD22ehob0LsfW1zmOwjY4JKlIWjDv+ndMlmai0Dsu6GQAz85
GD4NW+ZWg2K64DFszdqLypsL+ocJxDmO4Qvjkb95OLu+BoGmyknutZkkjLfLfkxr
yLDuZ/54Jb7+5xQW5LznIuGb/qhkwrJvyJ3elC7AwqBcNzUnP63gsPUwU1bWvrun
/lYTh5gpj4Soc3+7Jj0lzycH1fBOmud5tGJ2R1WEGKEwDugf6VWvLvOPy5TiYksW
0LzwKhuiIcfutYBbwsAJZG33XNBp1y2M3vyImYYplmgY3Rb41zrlSvgLWfz7u1QL
ElXPhRaYyqQj4epomR45KMtLPmxDmBQOt5ztpstKAL+xfhoXD4aOZSE3zOPfJz8P
JqhjYvGphFyvPgoGO1y0jgyLWrqwcRTHghMmh/d0/23+2Eyqjfabf/DX6HH6jXhf
N2xOYMakyZb1NvNzcX9s7UDmMfQNz+QenQenGzwW+eRW1wiy1ZcL4xDwb8Dum6f9
qUWHU/CzbkT1hPNEwPJR85Fjlf01lrWwT4j97LEQsvHFytmqewKjFGMCM19QUD9/
GA7It0Ij3fYq44dIrdpxgEnDpzI3jSLug6DknjI0QJFidexf5dBrY2htsmG2S+FM
r+ra7taixWu73iWBjuHLI79v40PQvyFSpRT8Plz/Ns1mTzBdCdTiCcHM3MaTHiRU
bw7+6jyMaQpfXAQqT4ehjW8sPwrrpBPw3YO+65WeBQhyPluyMoJV4tr40On/33QF
UG17a2DxaKnj4Q5+USonkDYr57lC2WrqL3XYvK8GLInLNbECSCBWDDlRXTqhssQ7
s9UVSDb8X6xS04yCCXowm+TG9wSKtKCPNyN/PusvgIfUsK+1IGmSFVtYXJwCu6Jj
tSizPGMMU6oh2P3p1Fo6+q8t7HIqxao46c0DLASma7YLJuYV+sj35ljwi9EpkU9O
OyCKDOh2xIiSExhaBfx/A5yMfstPzLxmkzCEDr6S4Ug5375n1x9amfqXwpg7X9R2
Sh4JvFxE1Q5MdImRB1C9G7lk41GSc775jblD4x0cFZektQTrPQ8KUTqZxnEw6agH
F12TLOahNB0ZRBiQ+8HWImchIUEdPaEUUyy4uPNiBffD/6+X51PyHRqX2q7VHQ7t
PbykJR6NMw4jY5Bj83cZ4xx9NVCfzhYYDWMsiHHFa8cHJAh+9AYf+Tp2Vuxy50Zw
ZyiQJLXf93mVuuvx5ZTPsMJ66nWQgGJrWL0Y9HxO4Xyxohg26URt4zp6x84dZQTM
MxZQnGFr8J56wsvfOm1e8zkkNf7KdH0j/srGGbiEDknIWo3+qTSYmA1dd2onxbPs
X9yKmPsgFJdnZGo00PDXwR3BWFbb0vb+bHh/LV6j2/2dbIqXqxPLD+TCNrSJBk8a
i9h7I3JdrU2QndH9waZUTIMOIYExMVkrqRIcfWIpb/HMeQgoze/7XDawbCgrQdwp
AOrYjHj8iOO0O7Rt4KE9PxhnhIdk5a/M/1pSZUpoT8eFNXHmhZEcr5nbm4dbJzKz
7etDgx4ICuj5HkVZUR7ZNEkG5vfJ2P4+oXKER4ORatYy1T/soKQQlFbwjXuFczUx
J8QB4i2uQgJEe4Kru2GMVcHyuTXdNuYL2/SVmEyKehIrsWvOgtwIpvLt3c7rr4Um
RbFSZ7FilIf03xueIVDtxLlTCt6QTGUXITsTBwc6CAMwc2pb3F1XfsUczTS8WGbf
XCd33wfUH8wYozmmV63GOyqIpgT1LoFJ84Vq0OxNoUoZ9CvMPbHNw/KHV/mQ6edN
0LhXltq47FcEiqHnYm6sZQ==
`pragma protect end_protected

`endif // GUARD_SVT_DYNAMIC_MS_SCENARIO_ELECTION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
mJh086VunItPYHRnd0SgsIJ/f4h9GmjbSsXoC2W9XKXnGnN+WQDr1/M2BfIfjrBV
6dTCErwWClc6ug6Tw1lxc9u2Z/2q5NZGHsxTaNB+g71dulKydf8bfkDq6+p2hyOA
e0jNyxdVNg7eIX7ckX7RwTvJXfX3xpaj8zAMeXxK+bA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 3255      )
HgV1yg6yLWrAJ3yF39RhxMBwql8a+FO4XDOd8rfHyKfS7GjiYkYxubaSGPaPE+21
K92IGI9GdA0xhM2zbdxOA6rMts10Rv99wUY7ywQQZkkkWVASc/McshPS7M2VdRN3
`pragma protect end_protected
