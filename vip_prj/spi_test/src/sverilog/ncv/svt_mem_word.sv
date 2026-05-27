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

`ifndef GUARD_SVT_MEM_WORD_SV
`define GUARD_SVT_MEM_WORD_SV

// ======================================================================
/**
 * This class is used to represent a single word of data stored in memory.
 * It is intended to be used to create a sparse array of stored memory data,
 * with each element of the array representing a full data word in memory.
 * The object is initilized with, and stores the information about
 * the location (address space, and byte address) of the location
 * represented. It supports read and write (with byte enables)
 * operations, as well as lock/unlock operations.
 */
class svt_mem_word;

  /** Identifies the address space in which this data word resides. */
  local bit [`SVT_MEM_MAX_ADDR_REGION_WIDTH-1:0] addrspace;

  /** Identifies the byte-level address at which this data word resides. */
  local bit [`SVT_MEM_MAX_ADDR_WIDTH - 1:0] addr;

  /** The data word stored in this memory location. */
  local bit [`SVT_MEM_MAX_DATA_WIDTH - 1:0] data;

  /** When '1', indicates that this word is not writeable. */
  local bit locked = 0;

  // --------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new instance of this class. This does not initialize
   * any data within this class. It simply constructs the data word object,
   * thereby preparing it for read/write operations.
   * 
   * @param addrspace Identifies the address space within which this data word
   * resides.
   * 
   * @param addr Identifies the byte address (within the address space) at which
   * this data word resides.
   * 
   * @param init_data (Optional) Sets the stored data to a default initial value.
   */
  extern function new(bit [`SVT_MEM_MAX_ADDR_REGION_WIDTH-1:0] addrspace,
                      bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] addr,
                      bit [`SVT_MEM_MAX_DATA_WIDTH-1:0] init_data = 'bx);

  // --------------------------------------------------------------------
  /**
   * Returns the value of the data word stored by this object.
   * 
   * @param set_lock (Optional) If supplied as 1 (or any positive int),
   * locks this memory location (preventing writes).
   * If supplied as 0, unlocks this memory location (to allow writes).
   * If not supplied (or supplied as any negative int) the locked/unlocked
   * state of this memory location is not changed.
   */
  extern virtual function bit [`SVT_MEM_MAX_DATA_WIDTH-1:0] read(int set_lock = -1);

  // --------------------------------------------------------------------
  /**
   * Stores a data word into this object, with optional byte-enables.
   * 
   * @param data The data word to be stored. If the memory location is currently
   * locked, the attempted write will not change the stored data, and the
   * function will return 0.
   * 
   * @param byteen (Optional) The byte-enables to be applied to this write. A 1
   * in a given bit position enables the byte in the data word corresponding to
   * that bit position.
   * 
   * @param set_lock (Optional) If supplied as 1 (or any positive int), locks
   * this memory location (preventing writes).
   * If supplied as 0, unlocks this memory location (to allow writes).
   * If not supplied (or supplied as any negative int) the locked/unlocked state
   * of this memory location is not changed.
   * 
   * @return 1 if the write was successful, or 0 if it was not successful (because
   * the memory location was locked).
   */
  extern virtual function bit write(bit [`SVT_MEM_MAX_DATA_WIDTH-1:0] data,
                                    bit [`SVT_MEM_MAX_DATA_WIDTH/8-1:0] byteen = ~0,
                                    int set_lock = -1);

  // --------------------------------------------------------------------
  /**
   * Returns the locked/unlocked state of this memory location.
   * 
   * @return 1 if this memorly location is currently locked, or 0 if it is not.
   */
  extern virtual function bit is_locked();

  // --------------------------------------------------------------------
  /**
   * Returns the byte-level address of this memory location.
   * 
   * @return The byte-level address of this data word.
   */
  extern virtual function bit [`SVT_MEM_MAX_ADDR_WIDTH-1:0] get_addr();

  // --------------------------------------------------------------------
  /**
   * Returns the address space of this memory location.
   * 
   * @return The address space of this data word.
   */
  extern virtual function bit [`SVT_MEM_MAX_ADDR_REGION_WIDTH-1:0] get_addrspace();

  // --------------------------------------------------------------------
  /**
   * Dumps the contents of this memory word object to a string which reports the
   * Address Space, Address, Locked/Unlocked Status, and Data.
   * 
   * @param prefix A user-defined string that precedes the object content string
   * 
   * @return A string representing the content of this memory word object.
   */
  extern virtual function string get_word_content_str(string prefix = "");

  // --------------------------------------------------------------------
  /**
   * Returns the value of this memory location without the key prefixed (used
   * by the UVM print routine).
   */
  extern function string get_word_value_str(string prefix = "");

// =============================================================================
endclass

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
smEc8j3nwdG/DHfar310vWnihYN49TXJ6doWDYewI3UlkNJgwK/L5vA8IgX1Mynd
keaPb+R0jmuQJN4Rz9Arjr//3pRPdFu1iazlYenfjG7KQdT+nROzfUOirT+MSaz2
zMBA2NKQwn/4dsZS5hyaof5TQ/r/r66LQqaoboF1UsPLrK7HyRLsFw==
//pragma protect end_key_block
//pragma protect digest_block
Ly5tcErFijCbI4QOon8It1SwuWM=
//pragma protect end_digest_block
//pragma protect data_block
rr6F7w6ZW/3yG+J5M1mPG2mcqDoHxccbThtU7WBvNfT7vO6eAyCOB7Yo9ZOAPTRd
EHAfVKLrDxVXKelETm/1NF0s33uY6UYM5r7dpIr5p9ys6G+KbbpJOGxMeKqzyDKe
omAlnViU2OYS5fiXXRcKWowlZ8DjTRQubNYd5y+HQDiDxg4VC8yeUGckSofSwB9l
Eh0oCWpRflM7n4b800CvWWyvC989ocLxvwiTtRbkV8BU/JI1vT2+lYIvfdRksySV
RZfpQXSoAvJarFzArDbpZeDqr5eS3Z6ARglD3wcrDiUGoC0zXG7nX2/WWb+2zDW8
Cw63Im54Bn9ecq1pe4Assv+mmYPSdUW70aMOUuUrOSJ4t8lm5jUKP5FleXaRpTRu
SxO4rH+EtQdm2bzZKEOgi8Oh9mPW6ePxV/+tCV6vFGj2ddxkNv6WfCGYKxP2I+US
MgErHNJoB+am7hZwVwiBGPQaNL/WnJftWopULw3181FsICpyjgPRe+C03imYxYjz
53Sa6ZaJDcI03x5ZyptfGEvmRR3O31kw++cAHIdRONbrACJIDdov7WLEGnWeJ98k
54hLPyYqkq0H7hFzUxhsEwvEhPHw6qdDklAqupZbWKVikRQumJOnYzuUezJmBtVq
bHR2+r3hfwnNdAYHFW3/K9e2GmrSwoJJrPTqGe2ZCCpegaoAuw/vO+NPg5iLcUJb
pH7ZoHEDs1uqTu0+ZmRqHcYlxt5wtgrjCooIOoIULB+/4YL3AgJKMGu+gQAbYEjf
R2lIrrhxXAKcvAi992gXMg3AeNfcXBepi3YTxoZXp9JJ3sz6gJieqso5etVYVS1a
xMJWy8ybeBD04hdOTqPRkuk0PaBCQipdyBEiJCm5uFoITaeLlawNovklsB4587KR
N9Tja3lWrz5OCWhjwUD6rojxYzEx5AFWYSOLTAOXmBmNg+N50qMiMkt6f1R2EXX4
GNfk/w5uLff5yOot7uM3/b6/VUaPo4R+sLCj0VLMoNvGMoqPQADEO1o5T6E9H7BX
Z2vU27aER4iR9dHB/rcEncXtW7i43h7HnpZqJTv04Qp7rnFsxNWIGkI6ZqqzZ14c
mIWTKqh0xpRyzKUrrER8OUY1RPvJbTznFjMtXbcJMaZfmSqqHP09pUfQ2xSOWloH
o59hw01IgQQkblmEk7iOHJ1IBG1RmA/5jRwUBOS2up/8bLjz5m4Dyjnw0LHqlZk1
PP62Iushy++VvA3IAJ63vwc39NSqRJ3OI3crc42f6UWesVpm4sd1QlpuDSZmspGQ
Lsp8Narx60tFoubGByXnrr916vi7/K2Xeqmympn9wJxwBis1tqjHemu0a72cL2Hn
uIZQpc/dZnQPXuUn+psunFWDgpqtfrWZiZC3DWL/cRB/BHJ86NxaR1OlI5XSOB3+
A6FyQOSlDQWkE+gh3Yd8U1op5CSzPWxIdN3/1othoVwJ5u6D04J3tp/ZCBpPt58z
R97mNJ9ZSwsQUt0xd1nQxg95pqAO7C41Rx2Yq7bWIc3mHPd06jjGKt02SibNKU8l
tcKtx2PoWnreY6pX9oTIqY5oxSu+tsD2J2BCL2ooWAY8bKxNSyHU769ofblgUyDR
pXq1u2JzlnW66xYueDJif2SkR1CrSjfYLTOuoCtJDXkxlTvGRYu+BYLSuvz44LfS
Lh17ZaJHCGhzGQF6Lb3ruu5Eh7umNrkzsubpWhHVTb5Ww1WorcWPIU39EZKdz1lJ
m7/bIRrIaJBd37Ii96uiaMheGuAuiyweaBWVWgBG8sFlEl3hFsk9qfhsDofPOQX5
1/J6qVhg0gg6W7dbQcbS+BeBgZT4yewgKX2oNXCRmgZTgQQp9l8v5/AjHBPYokyj
HiLvpXfU6w+ld01Z3KK4OxVVKhuQwuzRiIS+JxGrkYgTXp2s6lJZ3rNbRIDWI9Kl
LdOqnmMwoIl2u6OzjyfAhkmXi7XnMCfMF0YH2KXrm3UsYRk4c1RnxVhaWv/XFpZ6
hN6KmpewqiYWvIcqN47DcvKKWru6s2mPIm0A7EHuoVqQht4UQUeBtyn1NXu9nBL9
DHZqfrB4q2XfDc2b1BZXlgY2B9aHUjBoWXdzBDOGNBFjnMUTjsEKBZf2d2R59QZS
MsG8yGJjG+Vy6/laRX+GoqeYsIMS7e9mAMB2B1R0Nfs+2/D2SoSCcg7lxCUZRjqt
B5c8iHs7Ylb6xB/jJGnyL4Jaoj0d3UpqQJQ+XINRNbm8a0xws9xYEtIE4whO6Sne
Z1wOBx+wNJUFemOYm4uHicwU5jROFLUcba7WPGtkUNuVK+qq3xyBXSmXmadu2bCY
Ki6bCgoNUisBsBspax3rNKkoUhxeD5+HcF2VFMs8/VPk5YScRR7DwKLv91NB7vti
Do5fRbIjhQcmgSeqe8eZyDbOqELMgKAM0BNIOhj3iDwd0kakQCd5TW0itAfn6T6w
uPfxi6oafZWNQCG8G9aEdj07OsDwcUaqST1TXdUuikxlF+npZBTJfNaHhTZLx1fn
rFuq4Q0tDzX8J3P84L+HqoF0WIMTuNegGUJqy3OJsZWBUATCB5+xra5qxwOjJCnO
/JSJSXgF8zYmXpTSseq7vrqMitCvsYsMEqBBuzhu0cMvp3X6KVEfVlWufrMt+aT2
OAArG6VofAObe1GkeDHqhnrnecmF2l2wAjZLNCr2NIYxh3qFYmvGoeKYX+gW6zQh
0LZeqm6qjnfW8WTzzROzB2Ynp1WFlolZsBWvCKzWxrr6I5P9DgNN4VFhygZPYKUi
feCVYFpckAc2NwSYybzA5KMJID/mc6m1xS0HPpHSP8Rn6zA8/1xvl9uvpzyIGm5g
y8KBdUdsOACT9VKzT9RxT/h0dsiYjg9TlDh0Z2IV4eQhha+km28tCGp9k2rh7wVb
OyhxhvVmMU7n0jDlYnlh0i/rwav9sewyuth6tC0cShm3YsHhkHeVdC4lBY/2i39j
TLfdlAs+gX10OIsmRE+PXAu3BIL0gTYfjFRE4+HwmDflmI8+cafGLBP/tEdP9Tut
/jjZypAjuMMF59lgM8wdt9k9nUh76HnC2xkzMje3z2v6VcEfooSTiLbM8c66Bb8a
i4pLgCTXSahxS1kQDoOyb7YAuH4G4Qli762unJ8vIUF0hFI/lrm5VzBshecTPGRg
Y8grw9g5mlLLqiyaBnyHVWYm+43/y2RT6bWSvBgpbwxsRUNRhXV94RCWZhR9+nCe
Bcu1tA9GOBmBj0YjgKHfNrNx96NGvrCQrF2AD0XF1iZ02ufMCe1NKCeIBRKYvyN5
NBJgkwitfEZ06W9UDApGZS4YRHi31O4iJ3U5QbijJEYDNIrlGDfMCex6IkVdQWTg
fhA0o91kn2tu3PDAss7+YbcFIQFK2w+8GEFTfpZ3legUoT+oizmZOPq4S6wsdXFt
fFhiSIQPFBL9V4OdBoyPjkr2J31OBdBqeYT3vsVrRWCWF12D0p8Mex1mbSHWCVbu
7lNhLd8vkkqZhURKkenK0zHMMnvvAQm/lGT5K+oM6z4K2vgFFEKy5SQga+Q+b3Ub
et1CtEcmNH9ko+a4RVoj74JXAaxZqzNKQk9to3u2KvZAPpk6K3Nw5IojB3s94hSW
LwV+ASX3wfEGI2jsR85HhTr7+LwOyPOn/+e94wAbrfJKWPVrtHJtvgccs3VsqVEO
+Xd588mEX95kGWioqZqD1hsAV01esbgjYQh1mpdZkjIfhexW9F6hZ0X6PziAs+Gx
Tg6peeBfGJs9X3MmGYN3zMgNjnuPZmkN50Kmnrx05GPnPpfVn5N40Of61YuYQ75i
E4+ftVkiRWZUvC2EdInSE31b6JCz2JvnHLDsjgrMvL0qDG/mPJ3MKgNX6VDtuAVn
nvjK5ZOYRzgHtXSaMTuqPA==
//pragma protect end_data_block
//pragma protect digest_block
nN6VLsB+BHu6AhlcySG5APf2Fj0=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_MEM_WORD_SV
