//=======================================================================
// COPYRIGHT (C) 2008-2017 SYNOPSYS INC.
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

`ifndef GUARD_SVT_NOTIFY_SV
`define GUARD_SVT_NOTIFY_SV

/**
 * This macro can be used to configure a basic notification, independent of the
 * base technology.
 */
`define SVT_NOTIFY_CONFIGURE(methodname,stateclass,notifyname,notifykind) \
  if (stateclass.notifyname == 0) begin \
    stateclass.notifyname = stateclass.notify.configure(, notifykind); \
  end else begin \
    `svt_fatal(`SVT_DATA_UTIL_ARG_TO_STRING(methodname), $sformatf("Attempted to configure notify '%0s' twice. Unable to continue.", `SVT_DATA_UTIL_ARG_TO_STRING(notifyname))); \
  end

`ifdef SVT_VMM_TECHNOLOGY
`define SVT_NOTIFY_BASE_TYPE vmm_notify
`else
`define SVT_NOTIFY_BASE_TYPE svt_notify
`endif

// =============================================================================
/**
 * Base class for a shared notification service that may be needed by some
 * protocol suites.  An example of where this may be used would be in
 * a layered protocol, where timing information between the protocol layers
 * needs to be communicated.
 */
`ifdef SVT_VMM_TECHNOLOGY
class svt_notify extends vmm_notify;
`else
class svt_notify;
`endif

  // ****************************************************************************
  // Enumerated Types
  // ****************************************************************************

`ifndef SVT_VMM_TECHNOLOGY
   /**
    * Enum used to provide compatibility layer for supporting vmm_notify notify types in UVM/OVM.
    */
   typedef enum int {ONE_SHOT = 2,
                     BLAST    = 3,
                     ON_OFF   = 5
                     } sync_e;

   /**
    * Enum used to provide compatibility layer for supporting vmm_notify reset types in UVM/OVM.
    */
   typedef enum bit {SOFT,
                     HARD} reset_e;
`endif

  // ****************************************************************************
  // Public Data Properties
  // ****************************************************************************

`ifndef SVT_VMM_TECHNOLOGY
  /** SVT message macros route messages through this reference */
  `SVT_XVM(report_object) reporter;
`endif

  // ****************************************************************************
  // Protected Data Properties
  // ****************************************************************************

  /**
   * Array used to map from notification string to the associated notify ID.
   */
  local int notification_map[string];

//svt_vipdk_exclude
  local int notification_associated_skip_file[int];
  local int notification_skip_next[int];

//svt_vipdk_end_exclude
`ifndef SVT_VMM_TECHNOLOGY
  /**
   * The event pool that provides and manages the actual UVM/OVM events.
   */
  local `SVT_XVM(event_pool) event_pool = null;

  /**
   * Array which can be used to VMM style sync events to UVM/OVM 'wait' calls.
   */
  local sync_e sync_map[int];

  /**
   * Variable used to support automatic generation of unique notification IDs.
   * Initialized to 1_000_000 reserving all prior IDs for use by client.
   */
   local int last_notification_id = 1000000;
`endif

  // ****************************************************************************
  // Private Data Properties
  // ****************************************************************************

  // ****************************************************************************
  // Methods
  // ****************************************************************************

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_notify class, passing the
   * appropriate argument values to the <b>vmm_notify</b> parent class.
   *
   * @param log An vmm_log object reference used to replace the default internal
   * logger. The class extension that calls super.new() should pass a reference
   * to its own <i>static</i> log instance.
   * @param suite_name A String that identifies the product suite to which the
   * transaction object belongs.
   */
  extern function new(vmm_log log, string suite_name);
`else
  // ---------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Creates a new instance of the svt_notify class.
   *
   * @param reporter Reporter object to route messages through.
   * 
   * @param suite_name Passed in to identify the model suite.
   * 
   * @param event_pool
   */
  extern function new(`SVT_XVM(report_object) reporter, string suite_name, `SVT_XVM(event_pool) event_pool = null);
`endif

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
3/bQvXhEZa477RXRJ93p5AtsmkY4TaJEyBB9CrYQIVq2Lt8RkEb836l6J48rBSpu
hqW7djN8TcTpdk1Q8TOQadjmSY2aDW3vAuc2//b/jw/iznJTsYzEiZg/67veMvw4
p7adtZdu4WkETnAgqB5g5t8a/CObhfOQEqzKJGjJWesgYUB9vu5gSQ==
//pragma protect end_key_block
//pragma protect digest_block
GEe/T3oIVfcHKrw0dcs1ByxERyU=
//pragma protect end_digest_block
//pragma protect data_block
PE6oGBUoNau54SelYdlK7v+uG2uilxz2BhExsyPWiONpxYk1V1vYlXUx6ffsEQQj
iUlSI5hSN6szcWdrMcEzjYQNK88c0s32i1sMRiJT884OZX6Daggpi5yI0ZEX63Os
b3/PmGPpm+4ygbg28eh3awNLSpykCsdkfLG6QM4pGYZsATHa9osHwKci9npgawBU
Uh5q/iXLQebWLaHAXlzSEl26EP8y2L48J7PYwhezYjKffdkRypPu9N7Y+Qlap1ya
ZOP2q+h68wMxyNUBwY1U80me0LT+5I8hST95AP0h2JY1sOPN6UflDus8lkSwNxJY
m7t49QRcGMnFJ7pYi7+1leHhsvsDrXeDpg/6yfTpihBHTwanx4FsotSlkTp/Waw6
OUnUWB1AOuV/sZd61Y30QhrhEl/7kqNfBsX6BYyqKyKZuom2W3u9Ws7/lHxTZpHu
1DADOURLJY2uv9hBnDdNCgC7D/vOELjEmj7+KSmPbVAebbmr8ldVvWdOJC8RX/vR
ZunygF0gPudPbiPM+P1jqlnmrgyDVYehNvYeSBHSnXNIz2BYnCODUXbwGeyaCKPt
bEKgZloTJNnkT9tT8ACsYZ3E+7sGQ8BsUw3p5rIWE221k7RTzR9Uu86DAS/+9WfM
K89W1fRqZ1VKJO1gKLLjGqru0cQpTUfITxxGJUOy4obAqKoRaT3fSGQoK6EazqNd
mH/3AZGofIfR3BusFx26ThJQVG4oHYBzCClGMgwEM5BCfykKHtUQcBGXZLZm7iNO
JuwYGqhSHGZcQ8zw86h11J3nOUStH8dewJeFkX9XMACZAFm6ZOH12cG1PwsnUHNK
AWruVcBMjy22egKGkt7cF6sXdDD+8I1meKbkKNC+FHtkXvOP8BKzKI/i6mmPO67O
RJhYKTAHDH4SAHxmsRU5tVMVTyoXZ4Ydqtcc3YdlGX0YW/gWfXB5x+k9wye0i8Yk
AVQE7E0lKs9CnvtvWQ+XZNMdAEoehkKKCZ66w5tJ02fcolMtyq+X6gFRLahrAMir
tf8Qkv9Hkqtwz8XAxFFrEvxwwt+rxj2vWWd2ApAxywUx6fPDp2wQNRWoAkM1QwEb
39Zjnz/Tg8sW9kecVq+TbDn+iMC2WvOnWIfK/81Hy+bJpmHZ9vGdQqoooNNzLWIm
lZwH4Wczrb56KnQXICtU3q9RXFCM+1tJlNAatS4Y0S7Jm7oyNuz8gWVK7qhs7OGI
fiwKleI9k0bErGJhFkjmAYB9ZiNuOGLKtHiUJhr2Hl+fQc5GzKvWOqKOud1lWeUE
LXsAq1sUTWy+4GQphbHYZyZXxT7KIKh37DKSNx0Tp0zOPuP11jhIV92+3gQ2j2Tj

//pragma protect end_data_block
//pragma protect digest_block
qEhBCWRdeGZFslvtTcW4Ndne+K4=
//pragma protect end_digest_block
//pragma protect end_protected

`ifndef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Method used to configure a notification in the style associated with VMM.
   * Used to provide VMM style notification capabilities in UVM/OVM.
   */
  extern virtual function int configure(int notification_id = -1, sync_e sync = ONE_SHOT);

  //----------------------------------------------------------------------------
  /**
   * Method used to configure a notification in the style associated with VMM,
   * while associating the notification to a specific UVM/OVM event. Used to provide
   * VMM style notification capabilities in UVM/OVM, tied to well known specific UVM/OVM
   * events.
   */
  extern virtual function int configure_event_notify(int notification_id = -1, sync_e sync = ONE_SHOT, `SVT_XVM(event) xvm_ev = null);

  //----------------------------------------------------------------------------
  /**
   * Method used to check whether the indicated notification has been configured.
   */
  extern virtual function int is_configured(int notification_id);

  //----------------------------------------------------------------------------
  /**
   * Method used to identify whether the indification notification is currently on.
   */
  extern virtual function bit is_on(int notification_id);

  //----------------------------------------------------------------------------
  /**
   * Method used to wait for the indicate notification to go to OFF.
   */
  extern virtual task wait_for_off(int notification_id);

  //----------------------------------------------------------------------------
  /**
   * Method used to get the `SVT_XVM(object) associated with the indicated notification.
   */
   extern virtual function `SVT_DATA_BASE_TYPE status(int notification_id);

  //----------------------------------------------------------------------------
  /**
   * Method used to trigger a notification event.
   */
  extern virtual function void indicate(int notification_id,
                           `SVT_XVM(object) status = null);

  //----------------------------------------------------------------------------
  /**
   * Method used to reset an edge event.
   */
  extern virtual function void reset(int notification_id = -1, reset_e rst_typ = HARD);
`endif

  //----------------------------------------------------------------------------
  /**
   * Method used to configure a notification and to establish a string identifier
   * which can be used to obtain the numeric identifier for the notification.
   */
  extern virtual function int configure_named_notify( string name, int notification_id = -1, sync_e sync = ONE_SHOT, int skip_file = 0);

  //----------------------------------------------------------------------------
  /**
   * Gets the notification Id associated with the indicated name, as specified
   * via a previous call to configure_named_notify.
   *
   * @param name Name associated with the notification.
   *
   * @return Notification ID which can be used to access the named notification.
   */
  extern virtual function int get_notification_id(string name);

  //----------------------------------------------------------------------------
  /**
   * Gets the name associated with the indicated notification ID, as specified
   * via a previous call to configure_named_notify.
   *
   * @param notification_id ID associated with the notification.
   *
   * @return Notification name which has been specified.
   */
  extern virtual function string get_notification_name(int notification_id);

//svt_vipdk_exclude
  //----------------------------------------------------------------------------
  /**
   * Internal method used to log notifications.
   */
  extern function void log_to_logger(int log_file_id, bit notifications_described, svt_logger logger);

  //----------------------------------------------------------------------------
  /**
   * Internal method used to log notifications.
   */
  extern function void mcd_skip_next(int notification_id, int log_file_id);

//svt_vipdk_end_exclude
  // ---------------------------------------------------------------------------
endclass

//svt_vcs_lic_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
h3K7ELJJvAlUc64/s2tt5xzLQoiQ40p6KXf5qoJeuk12DWTOSLe8QbrTsHpV6B6Z
y+cv7q2GX+jrl6JcnUqLCFnT/+HCEI3bqvlCekI1npU2YQmBwaMGyQOJJuLziY67
UYEopuvHM9xbIlcIEJTQYO2B+q7eYeXZ59OA3OGFWqBkWlNTjynPiA==
//pragma protect end_key_block
//pragma protect digest_block
1dDKOPYhDULGHhUX1TZvc/w8ors=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
C7ANzqEILVe7d6+ANpsznbQVSMI=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_NOTIFY_SV
