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

`ifndef GUARD_SVT_DATA_FSDB_WRITER_SV
`define GUARD_SVT_DATA_FSDB_WRITER_SV

/** @cond PRIVATE */

/**
 * Utility class to write data values out to FSDB.  This base class writes
 * values to an FSDB file.  All values are stored as strings to simplify
 * the read back operation.
 */
class svt_data_fsdb_writer extends svt_data_writer;

  /** VIP writer instance to use to record the data */
  svt_vip_writer writer;

  /** Unique object identifier to associate the data with */
  string uid;

  /** Singleton handle */
  static local svt_data_fsdb_writer m_inst = new();

  // ---------------------------------------------------------------------------
  /** Constructor */
  extern function new();

  // ---------------------------------------------------------------------------
  /**
   * Obtain a handle to the singleton instance.
   * 
   * @return handle to the svt_data_fsdb_writer singleton instance
   */
  extern static function svt_data_fsdb_writer get();

  // ---------------------------------------------------------------------------
  /**
   * Write the supplied bit value to the FSDB file.
   * 
   * @param prefix String prepended to the prop_name value
   * @param prop_name String written as the property name
   * @param prop_val Bit value that is written
   * @return Status of the data write operation
   */
  extern virtual function bit write_value_pair_bit(string prefix, string prop_name, bit prop_val);

  // ---------------------------------------------------------------------------
  /**
   * Write the supplied bit value to the FSDB file.
   * 
   * @param prefix String prepended to the prop_name value
   * @param prop_name String written as the property name
   * @param prop_val INT value that is written
   * @return Status of the data write operation
   */
  extern virtual function bit write_value_pair_int(string prefix, string prop_name, int prop_val);

  // ---------------------------------------------------------------------------
  /**
   * Write the supplied bit value to the FSDB file.
   * 
   * @param prefix String prepended to the prop_name value
   * @param prop_name String written as the property name
   * @param prop_val String value that is written
   * @return Status of the data write operation
   */
  extern virtual function bit write_value_pair_string(string prefix, string prop_name, string prop_val);

endclass: svt_data_fsdb_writer

/** @endcond */

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
Br+SGe2dGywnZI2wOEbZYyzuqPfYBVYSj6BMxrUsFQshf2uOGg6g7YhKddXeBHRN
YE8SBN32QMGqwnBYh5XjWYeyAreSOEyzo5NCXI8OkteSFxBmwgas8NhM6jj+4OJw
Zrv3OWU1Abb5ZoEEJH+Ud0QQq/ZUi0sofDOZi+/yhYYSAZo7KObBVw==
//pragma protect end_key_block
//pragma protect digest_block
NsSbR+1lm9foUZXYYSnGWT2ydr0=
//pragma protect end_digest_block
//pragma protect data_block
jiZ29XQ3WrTYGW8xoiXVSvVFFt1KsTTELBex3HPzXCF3RAuVjSNJ8nRkMfNT1jLr
sUY9nkj4QotnwTZA+k8ai3nogWPjEmmDd+frYush1xuaTTFQDGCx3aVGhDJfQfeC
GMSnblNrFt4ssfRHBzAKxL0SdvVMp5f7UPLqEEWYBx+Ok2mu7jokXLAr6as2FtC5
F6po6dwPyJXGkHMo5x4AZ7PBuNLV/iqF17fivkccQ8UDJzcrsJs7Qigo+KVT4sj/
npcBkqrKqfnzvz3uaEeoJVQnkvqo8ry4WGuqkdjk6Z48AX+/BaYlJC3T3L5Qa2e5
gTH0kBRaXe9FExp3WBLP98a9/iEhpHGlqCwi/6qqthzH5BP3hvD5Y82EzPJ9t96I
kQ+hcKqAvk8DkJ7c75xlyJbLxYs69H6gLDjshNQncacrerVKPv+BdZhgQAvp7shd
5j/tYftDnJmmO1weM4I267E4FoIMQIMBQMYWrAnhaqhU7NPUHhlcQkZn8aB5RUgP
tD01A+ZgudDf0ktRc0Exc+Mo0cYdAlRH4bCB72z/UXZnDrEe9W9/kFizbqWDV5G0
Q5nvrZVDWDikatRY1FrT/Din7kpZCgVGayYttb093yw6iVicLPtev6Ej0Bp1u3p4
KoizHUv6R5ZfGzexd81ONiDC1yo7G0mkl65EaudglPPa7Onw1SyJg0BK/Qbw5HVf
/K/0GD0OB734utnvajS6UaOKi915JaClAkdci6SQlkrcxbc+UvM1Y6Gkx/oBf7bW
dsymMztvlSUfRTUyACe5TkMarDqsKsHTZheCE634JKSE2zK3gWEjSWExvvu3UcgW
aQ9gLZ3b5Bi5K38fYiv45TIW70EswN5mqsv+ZS9tLeSwv0Wj5+FIDWc0kpZi/jwB
DmOiU9GanRGkom8pkbGAHFoqT3i7l1xWIst+3IjiBltwAh/ecMlD2UOL/ccz/KF3
Brx4G9McAnTozOCndiN+1l9YuUf/3KFIdv52mApNK8DbN03pNZwodJo9SvWEPJgB
IZ8qEBlPFhyNIoHvX7ymNUeaqnEecNVQkT9lvEpt7v9+zil8XhAhht5Sac7k8IA6
LncQ025k3Kyo24e/G+luqwEPhLyXTIBjQDOCrE33Le0Bt6mY6kPFoXLGvM3luugq
n3AMWZDJO39O737YbcFhOSogZabjrQrESZKz1tOjCa0IsUAt4LksqF7wcJMFv/xQ
y4f4W1ONWHE2S2Co75fDY/I0y+9gkNkENri/BsLGBxF/y8O8H4761Zw3FZt//1lC
1fyt7DRIPwqegbG3DNv9XLL3J7D8JYpQu0hByjXKjniUpS19oxqOJbZi1ta8rXFT
EF3b8kCFRSClhrJuYGTxxEJTtTYN0gBHhEVGD1MM0oDE3+7n18Q8IYA1E1iFOtyX
evtN01Rn6iibnBpKqCfxtYGlSYah7AAq6PjTYTbTtSNCF8ZSPULvZtZumPBDB+WD
ajfjSPtOKMfLvsuRNGS5AUEOx+ULxg0u0X32j+XNqg5+4+Kk6nVc4Cm5yFSVCjE2
Gjyjc3aSUKhNoP618HJo8PuASZJQC45hG94HkzRZMORrV1hoc1KbBgkyE1mXjVKU
sqORyVn0odgfAYGThWsUl1ytSS8K7j/IOBu1AvhJDrvgM4sm1s+CLHx1xYIbTBep
IjjnMzNLVdPnCih/3CKopjgP8d46qwR/hS6i+KupPfC8IUYMhh98+6+K8Ia28WP5
Wh3wYpsL7WM/QYftz5x1wfQoSIcaGHOtHJt9ILzaxmJz16eLrgazVQHjJF8nWaVn
Jxx1lYxCgUx43Lu0naKUBicA+0XqwZ6Jfmz0SslO3eC1fMhzhFfmUIvWO1O4c98g
FVPgFIx8vX19a4TLAqmRG7jqbsNaRxAk2+aVH6r8qKWaXWxUSxUzsFcneKoqWbHT
9tDac2PRqf74Pr7CuLa9i7AiSfHStxF6OEkuFucl8BZZ9UXyWWTlG7XhRDX1klYK
ufWSZ0nOK/cmFDPbOInmFajLKDipcRpN9XmZLCH1TAcRCWNespUs5jVWO0MxJG4p
y+hpl/XMBdtGG2F5ilXLI0tH024GqWk0cUpvRLf5qSiUwLD4BP2OP89cavWNP+7v
GN0ahN1kwOG9+4tYtyRC5KYfwjcU82d2W8ebPwACskGYPvHvzKRg8Tv9Q4IVI1JQ
0yv9MQXWhXD+56c0B+cFcEq56ENsVtQOZG8NTSBBAnYmu+9AIb4s8bJYSEVFa/nu
t3aHl3IttAQfDre6js0BtVlq5ZsGzAJrDLe2rhPt7u3AZ0z8VYYy07uLv8qll34M
gi/mj8Nszwi9KFkuOCBs6/dkRsvu4yzzhb4PZm36NgeNtz0s7XGiIFV6Zm0K9KEl
2ogi6rePFg/m1/HFHI+9S7iGKmWlqyiBGWzyeWtAIrm4DWLrx3B/NXAT/cJmymyy
6QxpatTprUTrYi7Qgj4DUa9Zl3+BHCbXVK9opzBgPZhDMYyo3BBaIKVAyj065dWW
7iBqYNRpaFAYAKvnekZU9sCJIB/yA8y6vgp+p+Un2M9GO4EkFWPQ4ZxfHyPN123x
Q7cvlqx1OlsHlElwUF1IOE3exNGl1RdA/DAs4aVuJ7DUnDIeWeVAZl91NHRw+abY
234oNo//kd2Z8uCvJChCQzeAWPtC66xLCjc+M734DuJVL0pqMC7UpQOIcnklwfwn

//pragma protect end_data_block
//pragma protect digest_block
v5rv+xHkkS1Kquzo6HTRZ00ZTcQ=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_DATA_FSDB_WRITER_SV
