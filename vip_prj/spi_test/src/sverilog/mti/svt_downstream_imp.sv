//--------------------------------------------------------------------------
// COPYRIGHT (C) 2014-2015 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
//
// The entire notice above must be reproduced on all authorized copies.
//--------------------------------------------------------------------------

`ifndef GUARD_SVT_DOWNSTREAM_IMP_SV
`define GUARD_SVT_DOWNSTREAM_IMP_SV 

// =============================================================================
/**
 * This class defines a component which can be used to translate input
 * from a downstream 'put' or 'analysis' port. 
 */
class svt_downstream_imp#(type T =`SVT_TRANSACTION_TYPE) extends `SVT_XVM(component);

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  /** Queue for next incoming transaction coming in from the downstream provider. */ 
  protected T next_xact_q[$];

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new downstream implementor instance.
   */
  extern function new(string name = "svt_downstream_imp", `SVT_XVM(component) parent = null);

  //----------------------------------------------------------------------------
  /**
   * Method designed to make it easy to wait for the arrival of the next incoming
   * transaction.
   */
  extern virtual task get_next_xact(ref T next_xact);

  //----------------------------------------------------------------------------
  /**
   * Analysis port 'write' method implementation.
   *
   * @param arg The transaction that is being submitted.
   */
  extern virtual function void write(input T arg); 

  //----------------------------------------------------------------------------
  /**
   * Put port 'put' method implementation. Note that any previous 'put'
   * transaction will not be lost if there has not been an intervening 'get'.
   *
   * @param t The transaction that is being submitted.
   */
  extern virtual task put(T t);

  //----------------------------------------------------------------------------
  /**
   * Put port 'try_put' method implementation.
   *
   * @param t The transaction that is being submitted.
   * @return Indicates whether the put was accomplished (1) or not (0).
   */
  extern virtual function bit try_put(input T t);

  //----------------------------------------------------------------------------
  /**
   * Put port 'can_put' method implementation.
   *
   * @return Indicates whether a put is safe (1) or will result in a loss of
   * previous values (0).
   */
  extern virtual function bit can_put();

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
oJKz83smw1D2hXtM6Ys8dG/+DkBaINROtfhqqSisXi1wMDW1EnrSq1O98BrpwD+9
lXIY2r4Y4DLfevCn3/+qmNXVEkS34LSqF4z+wOBsCG73VV1mHmwnv4xnq7QlacUo
ya0OHlff6ImMFJJY6UYidaAUpjCLKXTKDHOD2YICOrA=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1581      )
T+zbeZqZpfv2Hv1jzjrDu3w44/c5MF7UP9p3ORXtBPjy7XHpT727TgAugL64VfX3
fWXvb2KrRQnnFU53TYRrO6dEgHnUSK11j8SwupvUlYnfoUCz0SzIB97/ckRL0Q8d
0MQ1REs0qed/Ge0OCrI9qkAGw/GbxnO3BhBhvCdau5xqSnC4SmKgeQvuuZMlNTS9
QcHIig3FiOIUs7uzD+bvXd2WK/AkFJ4VckyVad9ASuPnVkw6c9oo1LnKMXBiOPKj
gvgjZdmE2zUP+nZWVKfJRdBPfv6OAIov4XoZ/A2onF26/ZGeufXTqmVfZuaacD/3
oiMlYzZo4ofG/iQ7vDcSEJjgr4Btkcm6At2Cdr+2Q2FsdkI4qNWnHMkzlqjG+j4x
tkdrUvfcR3mhgpO3zeoW1BQtLs3V3OeSZjjSUvLvSKLwMV8ur77SHyTlcZ7DKoqG
j3bXGIh5Fj9PNJKbN+7k3JrUOBypSuTnZDscr4bdsLsjO1xjPmsIgFQ4S0y1myVg
aVf35+YtlmCH0s4R4G0P8h8uy5fY37Gjib8bNW243mUXrSRnJ6/4Ix83Ybv5YhM1
bWhNGxs0bq3szmadj+WLi5fZEojaO87K6VhCEQPi53ym68v8qvSSKJ/ZdugDY37y
DuAdy327GR0Ezzsf3dfl/qEUnepylD70LAiaXV1qQxxnZiCF/PTAMbXwMJ9nDs4a
eQx8rl78dVT0C0QWf7qyoAYTlrSvyPz6AbU4z+wN9QOseJ7LL0pTaIgwkGvdWTui
hp1oBLFRzNRTJuiIGf29HV9ixloPVr0dVDO8L3jfaf2DJ5OdJ8ecU+0HcQpPXLK1
eNeagXUVc5b784M88EwLJVSbP0aSV2GVJ+K/fhFGT7VLXNNQFfyH7gPdyJV6ltPj
P+jbJwPuZ9kQbv4fB2Ya3FClC6kwC13p6UkLi2z9zJGOYFFDOywhd1/YyW8UUUDg
wJZct8FRLWPcRyaBKnfv4JmpkxVrGUvOZsHAcrS2ybsx1dLL1hwKU4VIC99re7Rj
o7HF9ymYGcd3os6NQYqIhC4iAwphZ9MRUvVvgvqjVnvX/2fYCwznPHWJwFuiehZq
Li2OhQfbrEMJu483RoBx7UUKEJkqfyUiW/ngsngu9RYlxrafJ2XvsYw4UyFKC8Eb
AJ6WQbbTBRIqNgTjYqqCFTGlzeh1CxySyKdkLjgCf4QZr2JILBQJmxAbER1zKn5M
hDX+GlZBevbpxPym3Ua5r5QfkbRd/DtYmpvlGI78dT5D+0bFLbyVz/GKLtakP2MW
sMPoPsxUqBchTOOuhS+huE3GhC2fDrSIfGIc9nEKL8lpDqWjxKUO+MB+MEEU9orn
Wzstgl0I4s0MjirSUf0cTGWwzFQNKor02yTlBAZhaGbXmEIItSW0b4xXQP4A6Qzs
VAB6zDai9YHLMyMDAM0Z1FK7RlFUWpEyz3OB046+IUuO/xBB5p8uBWq8eMPcLU4c
n+rDzPD3mGD1mZzFPIrzFil8CX8tTZhMOa28uqhgJsWE+ULLE9BnA52HUb8NWb8u
gfyvRCNq0Ok+5ZXzjiZXGTS4DP9nQT553mvrETuWCMLCVJxoaFROQQU4bsh4adUk
7E/j87ujVyaXuJybmcJxs+2ZWU5OojuCK/AKCS75R4ljHZmHH8jmS51twxBAGUFQ
lV6ajkq/SC3UNPeTU91saC68mmbJAglidhwG+RcSo88W3M8WlbTU5RwnzS/QhYI1
kBEqOo9GtiW/d0qbA/W/FmBackKfC9AI3RpD0f86r8pbWP3U0aSUUBxDgva0j5n5
hEnuQlGqL6bIMQNG1dbwe5X/2j0ZNsHZuFOyZgEu5qixV7kEGWnEUDzzdNZrIniO
tbEO+sb2ZLLxWYARdFKmEBnZksV1t4QznNREH7Pcp1lnsfoB+kSS0Jv212Voe5F9
AVxIRVMSrJo0uLoychZ3nwjXhuU2tNLBL0lwOiTSfB66NkTWRamA2SHgtD2DYz9a
RIeOjSC0PSjuoRCWzS0URMdVGUZyaLltnS2HllpviGsw4w4/bdlK7gcZO6USQGER
AWEntkpylBchyz5Ns5iJDVlkA3nsdcleOMP37LKgYYbEPLZ/Hg4iFytusc5bGOuw
`pragma protect end_protected

`endif // GUARD_SVT_DOWNSTREAM_IMP_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
MTGKxK6xsgpwTuwXZLFC+VQurN3vHHApReuDzAQ1Ah1Xt8KFAjs2q0doPl5Fm9Fi
5ryOoUnBaJsOdA7T2lyiDuKj7wF8TrwmXxaNIGohsOAH9AAzZQ3Y9begQzUOs3gS
VMRQiONPhYJAduOZpvqzMe3ezRwCLPaHg9KXig9qwZ4=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 1664      )
DPPvMIIFjcmEKNqc7mmmrLNo82h+l9UkpJYt8BvWhbzhTu1M8MtenHs1T5TeQXjx
IKyn4LdiHMDyENMOpMhmH79X7Fw0K3y8tcSQs5AtboKerAF8bHCHegDFUQDD+BUv
`pragma protect end_protected
