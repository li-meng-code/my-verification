//=======================================================================
// COPYRIGHT (C) 2007-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_DATA_ITER_SV
`define GUARD_SVT_DATA_ITER_SV

`ifdef SVT_VMM_TECHNOLOGY
 `define SVT_DATA_ITER_TYPE svt_data_iter
`else
 `define SVT_DATA_ITER_TYPE svt_sequence_item_base_iter
`endif

typedef class `SVT_DATA_TYPE;
typedef class `SVT_DATA_ITER_TYPE;

// =============================================================================
/**
 * Virtual base class which defines the iterator interface for iterating over
 * data collectoins.
 */
virtual class `SVT_DATA_ITER_TYPE;

  // ****************************************************************************
  // GeneralTypes
  // ****************************************************************************

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

  // ****************************************************************************
  // Internal Data
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  /** Log used by this class. */
  vmm_log log;
`else
  /** Reporter used by this class. */
  `SVT_XVM(report_object) reporter;
`endif

  // ****************************************************************************
  // Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the `SVT_DATA_ITER_TYPE class.
   */
`ifdef SVT_VMM_TECHNOLOGY
  extern function new(vmm_log log);
`else
  extern function new(`SVT_XVM(report_object) reporter);
`endif

  // ---------------------------------------------------------------------------
  /** Check and load verbosity */
  `SVT_UVM_FGP_LOCK
  extern function void svt_check_and_load_verbosity();

  // ---------------------------------------------------------------------------
  /** Reset the iterator. */
  virtual function void reset();
  endfunction

  // ---------------------------------------------------------------------------
  /**
   * Allocate a new instance of the iterator, setting it up to iterate on the
   * same object in the same fashion. This should be used to create a duplicate
   * iterator on the same object, in the 'reset' position. The copy() method
   * should be used to get a duplicate iterator setup at the exact same iterator
   * position.
   */
  virtual function `SVT_DATA_ITER_TYPE allocate();
    allocate = null;
  endfunction

  // ---------------------------------------------------------------------------
  /**
   * Copy the iterator, putting the new iterator at the same position. The
   * default implementation uses the 'get_data()' method on the original
   * iterator along with the 'find()' method on the new iterator to align
   * the two iterators. As such it could be a costly operation. This may,
   * however, be the only reasonable option for some iterators.
   */
  extern virtual function `SVT_DATA_ITER_TYPE copy();

  // ---------------------------------------------------------------------------
  /** Move to the first element in the collection. */
  virtual function bit first();
    first = 0;
  endfunction

  // ---------------------------------------------------------------------------
  /** Evaluate whether the iterator is positioned on an element. */
  virtual function bit is_ok();
    is_ok = 0;
  endfunction

  // ---------------------------------------------------------------------------
  /** Move to the next element. */
  virtual function bit next();
    next = 0;
  endfunction

  // ---------------------------------------------------------------------------
  /**
   * Move to the next element, but only if there is a next element. If no next
   * element exists (e.g., because the iterator is already on the last element)
   * then the iterator will wait here until a new element is placed at the end
   * of the list. The default implementation generates a fatal error as some
   * iterators may not implement this method.
   */
  extern virtual task wait_for_next();

  // ---------------------------------------------------------------------------
  /** Move to the last element. */
  virtual function bit last();
    last = 0;
  endfunction

  // ---------------------------------------------------------------------------
  /** Move to the previous element. */
  virtual function bit prev();
    prev = 0;
  endfunction

  // ---------------------------------------------------------------------------
  /**
   * Move to the previous element, but only if there is a previous element. If no
   * previous element exists (e.g., because the iterator is already on the first
   * element)  then the iterator will wait here until a new element is placed at
   * the front of the list. The default implementation generates a fatal error as
   * some iterators may not implement this method.
   */
  extern virtual task wait_for_prev();

  // ---------------------------------------------------------------------------
  /**
   * Get the number of elements. The default implementation does a full scan
   * in order to get the overall length. As such it could be a costly operation.
   * This may, however, be the only reasonable option for some iterators.
   */
  extern virtual function int length();

  // ---------------------------------------------------------------------------
  /**
   * Get the current postion within the overall length. The default implementation
   * scans from the start to the current position in order to calculate the
   * position. As such it could be a costly operation. This may, however, be the
   * only reasonable option for some iterators.
   */
  extern virtual function int pos();

  // ---------------------------------------------------------------------------
  /**
   * Move the iterator forward (using 'next') or backward (using 'prev') to find
   * the indicated data object. If it moves to the end without finding the
   * data object then the iterator is left in the invalid state.
   *
   * @param data The data to move to.
   *
   * @param find_forward If set to 0 uses prev to find the data object. If set
   * to 1 uses next to find the data object.
   *
   * @return Indicates success (1) or failure (0) of the find.
   */
  extern virtual function bit find(`SVT_DATA_TYPE data, bit find_forward = 1);

  // ---------------------------------------------------------------------------
  /** Access the `SVT_DATA_TYPE object at the current position. */
  virtual function `SVT_DATA_TYPE get_data();
    get_data = null;
  endfunction

  // ****************************************************************************
  // Utility Methods
  // ****************************************************************************

`ifndef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /** Returns this class' name as a string. */
  extern virtual function string get_type_name();
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
kGRJLzfm2az8XNmYZOMDhNB4C12jJU8L6ePxSQDlmxflY2xad6GOpRCeJnlFqFzG
2kgDjNLtb1bL7lOL20PoNO0K/2jz5pSWIDOWLZLYIeaG3BCyS2Slr7j5Jg//UML8
k/XG8ei38oYqQ7faEZSx/gYMZRsFdQivcMQYfPSblslnRRdaAd/Tzg==
//pragma protect end_key_block
//pragma protect digest_block
jhou62Umfk0BikF/De/h6/svgxw=
//pragma protect end_digest_block
//pragma protect data_block
P/wTE46x/2qa2fKmJvaQ9CZ8xeSbaevV7rgIYcMweQ2J/Hc8FtF+ul2luAXxRH3t
vfbksbN27LTi5aUVxvYXWucwN4zWOVR1r/iCp3gS+Mdctx0e+6Ro1MhwVE2gg7y1
+7kZL6UoBDQmQL5VLRiUN9wFXwS8U912DKq2ev+ExMbXOEmkwIaMt0WaX6O61Hwv
vrl7NaGiP6YGmhvZFVeszANPh+yeNxJuttWOfOPBHFmECBLZ8h0seMFU91Wah9zb
alXvlH1w0TwO6mNfhM7xOgIydXDV8Xi4O6/9tTUTz3G0w4gVi9bDU5yMcHiBUVC6
mTng0DTonAN7LANMmGV4jmngySQZMbBFfSa+Qnw8uxUXDrhVCp2h9jNf1LsD/L9O
wTRvng5yJy/d9a7OI+iuF6PV99DrgH0BFNA1xPpRt4toZq6ICnIkvaq4UHLbyg8w
Hf8o5MECfwgys7kfoUCcJ6eN6v2VlLDTW2qj+sUj74K4UXx1JI0gECAWxbc3esE8
oH1SivEAlqZN1arG2CcXU0UH5l4xaVIPplp5J4LMVXEoz5eZbSt6TZwHUv9/y058
tWCLkN2sK26qTLKrSLD6nH7a7RKIAsZHY9tNGPIHO58xu1L57+YpLpsIY/j59xxw
nBfiL/1w/+zjadRFTLlOsBLheCx4SZpcuqtFma2cc7h78hngv0xa+0vsZ5XwtLYE
Uw3jguacFobBBgzfqb0iYQjZ6Kt1GT9HiIIhZalTDlS5366KSlykm6iF1oKu7brY
ISRueKwI6GDSl/sByYC3uOYeUdHOeUc2TGhGkVbGJr11iE4OuzYljRewt3IGG+B5
5sD+oWyghnCYatWTEHTy4aaYWv2sT8qAYZi0P+0Dyc6CqvYvufzdxtj1wxg2fLZ/
ivPwJRit99RJV259U29nrwPMiVBNWz2IQ18LYRyU2ZBmKEZcnF3QeAitYg2elgt0
TGL9WFiW3FmicAaLh5PZtjcZwpZvRohFTeWsvu54qHzmQcxU1F/vOJbtPq3MGOqa
B5nN6+SvNQqLqUCdGGcRbAtC+AvL2PxCGiw40pZZZ8q636qQfkMERGR5X0OiVkqZ
Bxma5Oi1WqQlx+6Z/P2vXozoVFBBxDJIXb+REghcABenBDT6TLWfFVFDUXGVCBU2
xHgPnDq6zQW1rhzKYaMhVlioc0d4GXfFk5XpgTKiJcpofWbElPLflaRRCwVkkShC
fvoxtPi/7G4JrHc94X6W4+rhPPCi2kiSKi1jgN96rfsbS2udyPtbyrMsBD4RhgTg
EiWSpqoQH2PuKM4phbS4HxB+2IWQyCevYIJSAhi2LJUNT031U9MfplmN5ehlkSdh
UCMeKJAInJb1VF/O2YKFrR7evE0F6RCLgdPTm9sVdixRtcWHyMlyhbbmOB3lDKK9
Q9BmQUBGHVYN+mVtd7vMg29ZKWgmmDs0iYb5wT5OPhIPSAHMj2fO4ZD6mfXRg7G5
Y1R36iKq+YL2NLPBEQ8LvRU98Vl7VlbMcwEw+K90OPI02SQdiMqeKpkzmnkgRkwi
grSSmhnDDw8pGWlw4MbjKEoPk+Ia+SCwjvQ8io26P6+divVsD5yvfcOtXi3zP6SO
seddtivufVACMUlIMYEaHIQD885+tuFYkAM2JBkcTaaarCHpAHg9GnUFO1H2c+kb
xzAX/I3maz8CD2SP2OVjM4tNE9tuNT3jFjb5dI/f1/AMNFutvaZMu8LVeWo8LIf8
5pTXUtBh36TfruTJN5d+pjXwyT2gc+laZHMj1PuDAHvbxX8MHL4cfUtdqW7lpAQR
ZsEN6BchphZrkqefDI/Jky2tmdSphmGcnsOZv+bY/2maOcpnU0Z0dmQOvWx/J653
l7VmBkkg8kKMx0c/gXKlk4ZmFJ+/nMoIF4pK9OcqRDAEbp+0mhveY6FsjhIGgXQe
MDLZ2PhWTPodVqGJG0oNjKUNhqmLOBrn7/CQC3Cu5tdOPJYtnhNBv4X/3A0o+zED
u7z5AOfP6q7wCNjud5ueznRowb+B1RjfdVQodA5/CLZmQcq/+kLhnVqGPp+zu7jV
yDoCN1SnY+yhd+6F2KN6VGJXhwdBpSD7kU65Ekf7gKyOSugbsDIOe7RzM/b/w47q
1P5yNOeyFOp4rcXr3bd4rP8cR9CoZZth98vGPZZUpWi/W+XAfMm9d5bSa5qYW7q5
aBCIWTKmtL21VvLnphfS3dvVgn13e/sicdqth6DfyLVyBpHuL8zxoDsgA1o5uO7D
WPsBpKH80e9+7Nf20JsaaPP2bjZtbSSEEWFQppOqZbnkHO83bBS4UOT6TlPKevbY
0T74cHreDOgniOXHeNnJNb5oSS02AmsEEN51VZDk2ge7N8Apy/mzCyoRp1QbL94U
O74VVO1Z4FhGgnKLBteX6qiheTFwT2x1suwAeBobz0+Cq4jrSW/5sj+qdtxjbCLr
iubB5ry3mKY4OlalgeVUrx5kooGluxzmuljI5UeKgf5WZBMHERqXHXWbY4khmsZF
JUESJNTxpPCmal1Cdh+yYT9XRhrfhYlZ8FzSTPG7tqHPWjRZz52/SrOMHaiE9+Me
Xcdxk7K3DZTXVwBAnWCVH0/m14AoDCrP+wnn8kCafYyYiefT4Ld7Z5MA3DwB8TWa
bCwfhOgDBuYz8Bo28zbzl4Th1j6xOcfP+lerfF1frkOndyorXrO4pjs1W9IvHLWw
hmsAsFbuqlHUkt+KKta5oodlcTgAxyXuv+Yaz2+/3hdpjf7VlWSABuWX8b6ftYaR
PF7ZVwoDLwQRe04zHyYWoxCW2wWRlK3d9qwxeapWBbpNToax2+YA/wQQfhjRKALp
xAIcd7VN4wDLdQSOr7grnPj1PeKsh09VXO6/1hVt/Q5XcJChGTB1Vwl/UiLuBPg/
JhUIaXRGmbGbFu0/rkba2lBM3W+c+ixenptAxpuXz7CKYyaZY/a3clqxVQNYxAGa
cwOBQc/NtPQiLXCPpXAAV/KjIaBMXVN2wv1Fq38XIrtlZcYPrn0WDXl0tTKql0lG
mF72Db3o4M514DbcBS3ohKAQGk5awFlnn859nL4rPwriEFovi0GVrQvLhwyiTdpP
7XEBQL0MrSTxkqykgLMzaIOBjSgbiPyWIjP87dhJVCTppz8dQ+GjbV37gR/QDuU3
4Q8daNFvxW83XuXi2LqTzamlMFmY5EL18paWSdlTzOwc7UMuQzaOSDl3uDlJOd4z
GxCADEIjVgFH0iw3t8b5zZD55w17NYA32WscbzkSmBlOzVl0MQLMwIlFWBASpGla
T5dop9yqXIG6ErlAN81joK1XTy+C1n/OM9m456Ch3cKVrSF7N+cNC8LjNRnjm8/R
EMHV+V6okuq+g7qowmwMDFStBVHRqCRmSC/KXmtZZZYab5Bfr3YEsYEnnSETzq7S
u6Gfoyw4kH1C1pSi5pIfZbYexgndLN+dvNKEFoV8xDn/rGwlp9IRnDmsaLFEx1BV
okKpiy21nH2VtXNoJ0Rhfg5qrNmbfrWCtZW8Rzbtdr71KvP95NSHZuXfUVt6MbmE
I9fpWvmaBDp7sSzOiE5tOiNrLEjRZdjK2L6+U03bcg/vzEdUxGw/us6/pVKkVwfr
8rfiyKVAYZHcMVi18KExtDE5NLUVCUZA9PqbeKpdQAKrkAFJ9auIDp1L3ljh1iLN
gBX40a9LGmEqeASRR3rb+UWWjLlBpDWyqQrBe44Ed1Fk1gxw3RK82ju2giHOlnAH
6P0R1a2YvUz+UbGkUf4OEjqy6hYthmCDV/5PIerDGCjivD339XM8hhV1pS2y8tVw
SERg8ZYL43wFLvWIAPxk5FbaU/jeBRb2xS02SXwXLj+yTWqJMXB2YtHS53ZusTQp
OtUa7umOVJu9lSp7k8AuZ88MoI6oXQMJ8UVx9PWVj9cEI7Y+tQZRYnJAvoY51PvH
+N5/pkM/KZlMhTOWIigqm7kUFKTcVOFN5BA9Lv3sUE/rideJ/nTZxMWrxPUJGxfD
Zcduov1PEUSx98zBtfZVCaGAdJIHYUnRlywQQzvfgok3xMbBSYJ+X+aqFOLBp7W3
lwenpQPOOoHC89vVf1QAGodGMsVABd03ALg+ItpiE1WNM/12oEZyRkwv5S2ycVZy
KOJaJOYg+RYqDT8UYXBTYrxX3U4EJuN5pWQz80x/8s1+aZ5biEDmU4nB/2ThNrUn
QgnuW8UdtaKyxKYhc7cBZ0gnDz/s5+4+aoxxgU2+mnvPldFvM/0znWOZPeCh2y0A
ajzo9U/JbcLNYs3VFfMcYml7z18pMl6iRSVSWydE9hyDkFtcsXeYsTz0+HfV9YCB
WWuGSzzWW6bqOGRJGeu+K0AU+/NR1Jxs/4bTGukAWU7XGqr2XwuNDDnnG6mtiumO
psdrSeLgbisQh1QTTIQ0zZUxn+SuT1TJ9ar/+obqncUpqW3CB1y5kV4zrNeQQVoJ
u7vnogkrU9wCCfKlsS7B+3AMeEdsz2fZKGXlTAU/PhIG9hos0HkwlbGlXeWQdm21
uKNAOFFfqhrBONyVfJgOEdYZiEzwznvEX8z5e5uWzQlwx3jnRIPXdIL1Lby9/ytv
MYDMp6R1eigGSPiazW44JfbAeZD22iQmJ3VVROGf99hnKEHM8h/EkU2NZiqkyo6x
G5Rjcaa833fVvd6fK+TtkhX3sParagANgdDEFvQQgZI5MKD+uIJcW3iSozneb0S4
PLtC8J7vIW1BNMxw+3iclpj95HXzIR+QDfSANinu0g+YpzD2k3fqQ1cj2bvIBFku
7My73UJqLAdLzBUBGqF4m7EICAY4uy9roINvMyD8AyYiXQ1FNGYtiRMydCacBKe4
LooNLUtXjo8i0G3qJz6VBvD7PTQZbpI5NbMfV2tSSQC1SMn39u8/w/dnQtTyZS3j
2SE6e/f98fi6Q737UpuLbz3vlT3q8T+qXQbDbK48EtjdtrdFcrDmH7KvtS7zXDN/
sIh5mK8GrP1x2Gv1cVcyO57aNC2hJjwq23mICkHoZ/ebL/zVNIsHZU/1BsCJvxBC
Pzz9WXhZ17hz73paXSMARManyjq75l+D9PXCG1Nu5I1Uoo86327Ih5cOxkOXKqIM
GSYwVJBibSyL3agLK1RZL7NgiEHdiB1GMJ2ymUJv75ydMCYQNkvsDacizmhMkpUI
zpqLWkgSnykrGBo4j7JNlFy8fO1Nod7yUz5zYpUq8JdgvhK7J0QZ439vsy+/QIeN
xEPX6D5QgwOx6FG2EFxU0OcbAvSBU2i0K3uVmFfl0t+zz+4OkFmSxL6MqCnAHKkQ
e5Hxxf2fJcAqv5c2/5gQBIYRky7OURzL9IxhBP8+YLl1WDD7LVQ195y9+64bQNFk
2QZk1gxCSVLotLf2aGgPwBsSAPuTy9CZy7WDkRCwh0d9ZMchU/oWVWqKrNBYRjTD
h5hSA+M9nMKzcruly/NQhhSWqDQQBdeyOFuoseQdpQbaIjgNuByB+3a0yAyiab7I

//pragma protect end_data_block
//pragma protect digest_block
frpbcJkA+csAmfABs0+vZpZrZEk=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_DATA_ITER_SV
