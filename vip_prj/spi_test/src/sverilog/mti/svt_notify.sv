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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
Ey3jpHEJtMrMUdPYQSNVrDW8+Dz7yBbgqo73xJyBHP7O05/Qtegd/ZmbewYIiytJ
Cs75XnoRhRI1SVbkw82IOdACKLJFDwCEMw6v0BDSFKBI+BmZXxewkXCdTpZ3JLJm
WhLJ0VQBiZ9t1lTYuYRBP+6jFHU3jUBHO/0ZrRqc2a8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 831       )
GeVqhivXVd4ijsLiK33S+jiVG6NunmIk9KPdCt1+0HBtzMZ/DITS3NYFwRELBa8i
e7nL8aFzs253sY6XofwaX794JKETAcJYXb8SqBu3RpOxsPdGgSoRJcXXkoUcHgEq
uGwnjYtvEglhq0ycQ5MdStEunp5xLyGQTVqR7K5u9q/OmYDxBncwBMY7vatiCdXU
v5mBe0H/FnBjIv8XR17czpkuqk+UUzmhInXlclFREQ6ynHlmwMY8SK8HTqHhASk9
gORkpWIVRVFYJ/oF/6uDwML9k3gVr+sB0zQtUgtb030dZtDwHj5Y777hLJDi2oOO
0S4/yfa125ZeQEuJCQLV12q9UjSkII2TQVUB2ayITVuyGJvDlnGH8TvZn99vZX4C
zUU15G3y+kKr/jTE92P+aPC3UOd9SCyVqkzq/o2Ie4KNYzuyrahGOgXk+9KB2F6a
MhhXqeuns0kiHho2PdDOwd9fl05/NPy/vdjYmi1TszMEmSt5ocxlOlzhTV+u2hrR
ooxw1WB+9ds8hiPdsg4XLQ2L6GhFgnVEbcRjcJvSmj+WU0tWyVU1mIIx5BSDy0Dz
Y838rsoDqf2UrK6cczQ+SJ6tWBiHA1P2UZE9xwrA5fgpEm4MKFIUWiXDyYOZJ4fV
YSvKJRPMxBiQ37SId5iPRmRYciWFENu0AjZi7Nw3izj8NnzxnXAVwT9N82JTA8a/
kw27QNzmXtMKLxASqxU2k7ZPGYnTKVtd6I6IJI0ooCHjzdPMT+c4erOnHmlrYs1r
kpc0r9wWWWANV3s/MffoECYpTVNvBokQ74F1Hnhc7iy3N8oQSc856uQI1anoKJxY
pXO+LAL/Vi0xam4ODzXj7L5efp23j+Bn5yI3v7tWzmJ3o0QEFm6BmhsbkGlwGHJV
jZ3kIk13Qk1/mREvxwQqEljlZPV70/Q3tJoQnrDM1TGEIeGs9c5LSel36ie91lT5
73WBuRlc9rwTjNv9sNzNUuoISmsk8qDvZZvAOqhyst4wS7dbOO3MYmb/nAkZlLKU
23Zs1wX9yegMt0oVz8UjtRlY19MFGM9dt5OSlUD+/ZVpm0/CRWKlWrTmz3otzCyA
w+e1Nt5BKGixwUGmczLw/A==
`pragma protect end_protected

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
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
X42hG2oRnzfiOwUcOua/hNEgNhD0pM926Hmb1zyCqb3KnTi2zcl58bN25SNEW38v
jQhl+dZPyc+bs9gD4LaH+MJ5bntA3358bXaeGFKQae9EfWom32x6SRQS+QWujG/O
4DrQ/CwFsfQQrJgu5JlpVdnjjd+4gtngXFEeUen5KqI=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 18565     )
h2yP62dzFAr8fabCLA9erT7r4cikzusGCp6J6ekBKytVooEK0sDlh6IlJnE5seic
cK+DhO2ENYWseG+YBjlN/OJ8XrdZkSOOjIK6U1hqT6te2B3THqqxR2SHo2Pttwfa
hQtRRjsd1Fvu9so1z+Z1IrhcbDxWx28sVJ18ur7KIABaxHkeeKIypugm7YebWEFi
xLJz7+1ROz88+QmGMdq/7i8kBsYxgN+voTmP8hJe2GRvqedDOhF0nf1vByf1OTzf
0RvzBsL96FunMBTmHl/pNgJQQVH8WG5GdHRMj7SOosC7tBl86nR3BCRnlod304YB
ERYcF1t+tAJOIlYONy4lE3fVP4wmFzZcmwmiTUQ1EmkB7zHnHD87y/IdbG6ToCbF
YeRYadNwwbRnwTgypMgOD+N75oyJpu4VdXpaFQksYNHnblUeFYS4ZnBjzZpkZvKG
YofqmNuIATJii7G8cCNoxuBbuQsDxdrPngKS8/tz7OgWtjguV04H7t5jCL+vJlIW
dqRcV9JNFd35O65pAl7P5Ai1fMpSGcBtryegYZ/k4pkaWuGPdGjoG9b9lUmuMeMc
a2If47btEd1gixMFpbk5kXiI/uYc2CbWz883no1+fifUI1p/8L6zmfCTNL+QW0BH
S/p9GfDdmPyMWaBjsJaJQv+MRQVQiDkfaAyvOZhm3pRZA7gRvm+XH+h880QSTF8f
HoWWdZ3b0M1EL8BhTsPKVcuGAXZsvZBfCe70pwmYG08AoqAOIVLTPWavEKAozXNs
MQ8udP6U9hiv881SGYgGVtSXVDLVG1kBR+Jm6j2kHwdK57XzbXFXRqdMJwhEBFe0
xhclxpJFMaq0trGmUGgrfY+E4tsVvFuAjfTh5rhRHC2O9VzMuJacoh9SQfyugYOS
2KbQGw7VeXcyuvaRwB+hvIlQiIKvTjnI3sq1QW1aO3S4CKnQ8OIm0eZX6PEU27zF
ezX39N6e4BWZct5Z2HK5jtQNGhxOokhi3QLX+2ttg0NHRf3mwb4vR1PVQTipsUtk
qTo6eRMMqR+SfKh24/QLy5ycdTtIxREO9RvDS6tmvHKQcFIDX3LCySqRhbXha4np
CgliJVVvqPgRzbNKNgDo9Pi91vNjSlw1Y7CzL4Lo0jqDNah8Iy7nsTN1TyL1A2Ke
Kt8Ly8uEUbxTYJfJoHaubtInXExBM4egBM6BdxE4CCRMItUGcAymGxajhQePh7N8
LCpDvh2sasFjTygsFngmmqPxV7RufaRq6nI5zWEaT8vk8zessqmRtKluO+BmTAtG
9IozwRl5uMjG51+C0irghas4zYOxpr1B9o49CYKb8Q6aMNcwVcIfw6pCAWSBpxlD
bXzgkYgbAqmY7Hsh0giO+gosIJIf/4WADTZaFRyoFmCC6vexbEBFkL7UXmFdb9P0
7xF+H7YtqOOeaEo8CaRQIE7nVyk8BA4F17hH/M67dOVu8+gaW4dAi94VDn8vpycz
ezS4WOwrud7cS6vP0f0OJZuV3J679Q+6yEtzjN8RvWvwRMuvkrHnCzg28r/Jr/27
85p64Z01F0oCEnjtzTWgqlfbGdHLnlkWmKzyJIXIAZgCukn4CU5RlmDHmAG8TxhN
CPb4v44tuE+gi+ad/kXlmNQDnkuJN4E6Y8o0jmQ0NCNd1vhcYS7AZMtzNptmKHYZ
hKddQEYCiHu/08bfzp5BjU6sqstAzL5ZmJzSxNakOwoDOGcp0sCEdgE51jvxCAiq
xAAZcEflyfKFt3KNzX37HH7FXeD0Az0fRrQhMWhCJVrdSXBIdeA8C1IZ72f9z+cA
oGHfCj4olkyKhgyZH/qIfkTDAk3tOt/62bWxreXw1mU+msUS4OZ+w+4vbsG+SwFr
85bfE3YN4PvAtNGpiR6Xntu6n05cIkZOYHr6jlju8ExyA4zMyMPhHOqdU+Dc0hcL
YViVt3WmyGjjTTECJgNc7+4fb8PQVQbUcG+aLnYG58w90j12nSTd0etq9uvwy9lw
RsbD3MiOGqQYUrHeWYBmiEWlEnu9SFOl6zqb45KIFppK2iWA9gpTOtSWsjn8Gz8n
EZM6yGLsGGmhyeGbXX7ei8sxkdaUn0jm5kuwUMhReyJl1foxETADKPqdeOU8O4EC
Ja+y+G7uBZO8y1ZZhoNYxQeC/5uDq7YzgvzhqG7H1vKlkaEmoZycu/RJ5SW9W/5I
qxZhrvGvcVODvVeSnQnNnjc94nnIEdXPUhQjwjU4CbAk0ZfbZjhvHil3vxxzVzO7
4txqWsFdK5wcUgnU7OQRVNOifxBHlMZGrxWx/mCEqZAxaxoEj8auhBFi8E8eJC/9
mqG4QaiwCQt8+BK02HBTrxHkzyLCmxeP1fX8N5FuZe9C8Duc/i2a7xkHmq/Np67f
Fdvr3oC5ddPr2xJ2eoCZx7N5KsWwIBYQ38UasfvOkVCr/xO4SpZX5RAuQcuXABfe
W6kNDGSTI+ILsJ/uKguVmPK9rBrUe4yKzQZ0nQy2MxGo9Vqn3y/rJOUmGGMLgYvg
cESy8UaDkO2HU64lUTRlA1oRTUbX2pf56WymD1jep6gUtYxleNVchUsX37JuWH0Z
4XDhdj09fFqKQ+++ASURqAv0WwSju1yMEIoLosJAjpGWltEqS/Qpv3WGKk73kmAv
YgmQnGnyp0vMe3dRO5H0/W0D/ysCM9lEulKaqjFsRts3wH/8/U8Rox+yT98VLvSy
/7i9pbXbNrsFdrQISn6Ln1woLU1leM3VmiBzZsJRODTDsUAQ6YHlD5bihjRI7uML
Nyf/VX5EpkNI0E+Bg4mGBwMTxnREc9OASm1ZTyAgpNagzl8j7fFatjWBaA48sVnD
vgn1gHJEBSfBqUjdhT+YTWeXACaly4VYFwcQeW2Yj8aC728JPyOwzKyqrjT1U5ri
zwkajbU7Bulo9NJpBbRl/tJBoEIU6jB0bYhAuQcc39Yytlr6VrAxu7FmGG7AfUU9
enXs4oaVePuhmQmx30C6FHRy8RiehCyjSZKdDXqVjU6przdWZubzBJ9kYqE/ytBS
NjbxbbxFGU1p4OuH7vWMt2rZXnNrAC6iC4VleZPdd48QKWTs1QlPVBSwLTmDNmY/
zECUvS55Nx5lV1K4FanKuCED8QyEPYYEEnWRFoBOuUpkCHIxbzrb9+dMrFzRLKze
X9vi4H0UtnWuYAIx+HQw9MqPV3nYZqau1nUG8Uvg0xiKdAAOibcb+1CV5fqoKjxq
sjsWXwqMukmEfCUqCjdCe/E4P417mgzwXknqKWk9WqUU37TzE21+xHqV11gfGLng
uhDnBQtdN3TAhIPp+yEyDzRCgUtFtp8wroBEucyzaNkCsYg66e/+ePO84dB2JkN4
fjAaMMhSpgkBjWnT+fe6cq2iXmJj+WNcTguautrJPuP0JXwXxlJeYJtE+cadUL/N
9obZa19X+u5bSCECk9u7trA4pU/o9kllg8ROBg6oxgR069jk59WdGWHZbxuiw+4N
bsdZpSES5JvbTHkDxjR3M0OaNxf/FXkTDs6fUg6Kv3jveLMHV1imBn36W9eUJxff
YTkbbsVo85AJkzXqP2VQJlkLArKqLCxL4Kt68O1+ZJNLcYrO7iq4imoi2oQrmFSm
uV9gJnSFrBoBAtaPi8I3FfksLJnggg09oSOSqhnLBihvsqxXj0cKpEqwkTGLJwOT
TEG9paRehjqMAa0o44oGNrurqVf94H5FW+ie7dZ+UXB47pRSsMcfOhBsmC2bln6D
yGmCR9ss+CWMnYcZCIhsq6xfdbc0AuhiNfYHRjVuHcP/1HhWGTRZCvgXa5wzrNQN
7AmS22I5RuOACPuDGed6KVa6mzXnz3n0StGpAQ5FBCtSxBLhzJaBjPvSYg4OzHwV
vFXsU0LIAuF+t02Wvhk4JNiFnpkej044+VbgPuqFVk9gLg99++b6SGpt0MEc/Hyh
vpN/zNHWNHFK3inUiBXEWQKJkS6msZ8+N/ZGGDShUjdRvJLzvXpc7txGrM0YUV9T
ya+3wyMgRbmt7t5xjZ7rTDSBc8HlFtc3JlIIz0gjS6wIpl6w0M5F1CJPHxW4jS0l
7dFte/iXY3ozDB0STzzgxdr6tVRyLS03gNOJAiHvmZO+A+ilasP0n6bm5Td3UxAO
dzSFPBufS/rdnBOW1DJeq+kmoENoLDfsVTvAdPWyYdhi3pCXxGm27TE+d+AlMzBG
28Vyoa+phQMB5eHV7INDvjehTqsBTAufiIboGUAUNWshf34N2H/jZxfpq+Pc2097
FOy/0iW5scePIQcI565pIFk6OpFUkYgBiID9HeXBUP41njAfjXBFqVAWuFc5ut1d
Hh8EprACOU27ID6E/8o1mpHCduCX5KOYTmj5NNn/uRSDDtxJulSUZIhzlC8riO0V
qoQHiyfd8r1t/rSwOidqKuw7OWCOGYCmgE3aX1vTonhq60DOdfUXrsSmdlUfhP6o
8B8o5WBSwenpPVLcXR1u1Wwi4yX+HC7tVnkeSnGWbVE0B8eduTOqMrbYc+Q03yoI
K7Dmw21IMY0tmmi27h3yl3ip3hlKJEjFPytpTkfP8oiktu20ztWcAOBAKFtflQ+2
0wWxFVkxRMdFlYhJTaJf84HI0FWe/0KtDGNIrynRBvM8HXG8bkGqsds0H8b7vP0L
o3oznCcuGBPjL3o+U2zHqQ4WeH6MprzXVAI+801ggcR/D1tshmtmFYazzcQu2TmE
hmT34IkKduhMzkWPlL3Xf5rBPl3cN8/6O5YJZD8SCULPJJNUFT0ae2uU3o+FJ54/
ifvKhBhAuLN35FNRHYywE3xc4DDn9x/1HV0tHIG1RUYOxU5Dt+xoGi3N7eXkF09H
sQlnGuoXUm9nyNrTGqrCvggzkC6IPvizLOUkOV7Arrzlb7xYWtpiPFpsK7BwJ5y7
ul2xsB1/Af4QL6plhSnV4mktq8KK+qixTMt4zFS3zc3BadPxB2hiWXEQkUHsrn/P
M5H6RIQ216k0se5b7aTAdJBl09yuo7mrWFLOgTA9Bcq2oIs44sZa/HWYK0GAO2vQ
ESONd88gNHrDbjH3Neh8No3GLGFfj/V/wnRPqRMRkk5Tk3jbtZOwsK5MVQ0jAFpQ
G4pfr1LZeWxEh3Lqs2HEIAisWwe/B4TDfLmSIGG89hsyukgGsYqinRJV/ouvcF8h
+AFhYFAztZvLZXH5JtQwTon1zeOqPRhwmLiizK+vECpwQ76jvgQC99tlby1PXtTF
86+CpT+684RB8Cd/nC9Mr/n3lxyrBn22mUlNtspNw2Oannxx2GFZ5W9KBjWYsIwx
N+Zvb+nHwj0ePHiEkPQdn12uT9RJxQx+gN2yslUjIfPN+p2G9ixhILsY+6+0MYmQ
fFSUQPH5gEjgfwbjf5nCoBzo1kyY8Z5mtmQF2CvZPsOEL4owrbFic3n6atsmqcNR
gcGAjkmauMY1dvuSqtTXACZLFjm3AlwQ/0uHPrINHJuOnDIvMnOe1UnPSfcqkd5u
qC1UU3q30BjzBGO5uJidIN1ZqJ2IXMEgtQqtgu6I67BTFsxXYLjiXInjQgAE4m2d
vFgA9Nzd9hAgJdS/dDzj/2oK0xBowBVSFU5EySJIx9BiaREAf8La4uVhGdX7jOjp
bVVqLVcyANbcrBPeA5dQfHgAtrefUyGmzCi1ThXahC61nuxqWQJeD12vJbvrZ1YY
6AEhW0brunnbwyEtvZAmZ8UYc+1Ppr5wBFDX5ifW36Rv5An7Uei2+2e7TPkxq052
YZnLxhGREVSs1/j3+O4xXCFyjtvvfEldm7c1YemZxnAqVU6h0iZZPwm6nw0MhMhy
HBt4libmoPy/omflLvB8lBHqcQlLQosWNR2GX1XgoBEhRof2hRmIChJIkdrDq0E3
kK8zvm7HoZSp6B20KkJYIgzsCP1QtkLrM1Mezj66pDJoOoCEcfQ+5g3sdJ4mtU5z
sPfs+VbchqosQhrtQOwYoP7Ki9/GD9UqiBLaXCu6Fnl3o2Q1yBdBjCXqhKvF1L3Y
Rqn5t3AKNsxa+T3buIOSjZPCRNIVUmIoCP8ySdTT+/BRLLjBU5y9tXko5acXkR5p
IwT3ovhEb9roYlS1WPPAg25l64b9Lf+Cs1IZaK1zlaN3zhGp/ukK7CmcfPISZ8ze
iQkEuk7tLky3uenomJu9YsOJvcIDmcOWm6c5bUcwGdxSZBRaGC78QfRt3jJriZLE
PENmp6kOCdSmYyK417q4vnalqo2MFSQ7AkY2jjyB9EjIJUopB93AcNA+6EoDuBQu
jgcni1X2qTl1JZSdMgSSMoQ4ZeHhYYclwxQP+8P+MJrwMLHn2mh+ovk3CaLSxAm3
6hpkJDzFRHLKe2Hub+JaXlpvw5Q4HqDNqd9L95CHBuuVHsk7vDpR9t3ZRGuD4wZh
S6N6lrAhuhcbcFKwu4U5x3prYywmcmwOMHt9RsPQKJIIigBwCxoQ5zKhwisAGAlG
wf1vXx+amSL/6tGFnUsbvtKzrAdKUzphwO9mAOH7oN2EHmz+LsLmFnHTQnBNmUxs
UWs7vsdJ35ynaoppn0BuBrtWAVacsTmdi/4jr6VUAw6PNg9uO6WWnBhIw+D/N3u9
aWMvvI9CtH4qay4nS5nHmoQpp6ze5hCR2OEKAPbcci2F/sCglASwv+3BxrQLyNDx
SmWK5k3tQ8soUt6azg+VxFiYJCLDPc7Mt7Vr2vYeFZPWVCX/9/D0OvGPDKn5R5sk
7siaPaew2SUL9EG31HvBRK9wzl7txe8mWYQ5zV+CoPc/4jwIHwObn9CByGBJ1geK
GTwR0kejZvVdaC41x+csB4jx4Lt39+2U6q8oTJrO4DHZdm/laTF2v2xvFuXuy8hm
qCfybLSHpPBMQDunh/WaunTYAK64l37rNSMfunsfiZi3B1Rr9/f9YqafDcYcr8U6
HG6Q+ycJCTHMQcZbKTGjdAyMbUFUIC9VFhwhahtn8PXUqwlB0NV0q7T/2QNbwEur
4laRhIb8YDCzFRucc1eDlvuaFnfzHXRDtHfU7nyjTuHANAyErMgn4tky7rasgHw1
LjX7dW3EMIK6a9yggM8FxgBw7E4yr07N6OjbsXDr+qZMOWI6ekJ+KH6+PaFsBM+v
FLSri5SGsH5CKbuNZHlrswbrFZRH9I4mEgSCAsQMu6OG/R0jSclQ5gYqw6/LBhA9
/nZD19gtprpUqrNOiAkB5p0TSvq6mzHHIfbAeSm96ZBRtkWkrNAPkpNPY8yA8481
hCi9eU8N802B5lVDJGmURcMXeo7pnD42DJftQZ485FKF68FjM0VT9ENVkB4h6MU+
YSjwRAtq84Gv14iTF1K64OrtgSFKDJL/aWi2gCUy17KbVtPltJZNT+e+FixvxLDk
2kze9RVWKCU8xKMQGIJNufB1xtS7JwqOotKCO89ayAHyhyK6w4LhP5u7RiPjCDd8
khu4udfB60manKoSFw/JWU06At86bQAM5ywSHPFOcuJYmr9Hhh1xkSeTvWsXyKS0
PBe9/IkXuXIME/bubiChVm2FCc5IE8D73zTYcxyeZ7fj4F3eSiAkz8PLn3qmFaSF
ztwKMnB42lb3PwCs29+CH2f2ldfOxIZiUuYIb2JF0mBLqa56tc0SVNLzhcoYmHsB
wnrUF2WmKjqY1uHc4kAhekGPCnOWCzR/EqTZE1497yD2P49WkWl3x5v0jtue4ljF
UdpfXH/VYsnio1j7kwTbBV2ccvTZAz278XbhJG7TrEb6oag/K7h4JqFFOstNtKPA
4wzrK9AWxJWw1j5xdUOW5udfCppMhaOZorgd9ZcGfAcDS/W9zSkuu8qJp1umHwlL
fgcqK1lYcd2wLeNc4Dlrdy9UpFTP9pzYt8Blhh9eOin7FF1bL0fr8+PmiF//z0sj
Ts5ww2MTUdal9yHcGyY13Or2GleN+BrZHm4d4WQKDjZVlmoX2XtHx5zTYuJKHV5B
MN/sArOzEj9WOkCTxyf8jhJfLHBRXHFbpxtBYIW/O6FeqbPTCyb6sdRMs9z3dTBs
xfJvKisjmmLTJ83WYCxLvwvDZIP/4Mdyqn06OTLgJdTnXhCwtE1g+paTY1DNz73g
DirXfA/420DNx+hb6Hk/W+EWEstvTttHJAdOJVunjeOZ60Gz0ndgFNv9J8w9bWDq
JrdLgR0BOvr0K457oB/RvxeI/f7w5hN59myEI6/RitWrfDFn0zU8dZK8bqU7TwOC
XsPb+EwMf/UTtHfibUR6pLdsc9+rEIDCDUxUFWrxAvREnWQH/fEKiIjtpn224P7n
1U5Pg4okjckB+NT9ap0ObVplHYxz1wLKK3Y0tbaCjU0dJB+8NRjtjIoQbCPKGsvA
KHPBc3UjWiiYVmF2xbNAm2Ak8lYKLx/8o4wVXTAhaAzb/lnod/pxZrbsFgN2ymFW
iLMV+mI5WKa/Q1csrwN5PBfyR2qgnmH7NihdwUuIIPNT8HAEKsvI14+H1zI0vo1U
NUPhEOul4zaMMGlSXPq6U3vGCb9F7J3nz1V7fen/Z5uOnf700NA7Oy2TjrcrgHaT
yxku1q9jmFSBl953MtRMHg8yynN5JD7u43OgADPUqI9s4nPT+9mebB+w9/fy/z1K
BNBm/9JrRtB7kGBbBypVC6OIohfEfcJdKy6rPZlGuWzQdCvHb3PSuKD6DKlgp0Il
YfOWevHxlwO5XEFcxo46M05T9suiKFSATN3SVnMOfnqywGLSiczLjo52tvgNlfBu
OO1h8Pz41e8KhZoAMDjXtKx71eW6YcJ64MNVdnM4u2fZz33rQ+jlaqCkZnLv07dB
2rVoLPxFjQCBooi/2qezBy3T4VHxysC2sZFbbpHp3mDk2nhXqoWaCn/p+Lbp3jlK
9K454FUZgWxvZzYLNpiVsl4Wg6n7u/eoaYZz/YTLvTceZ+A/FS6m4Hk0gCwqM0w6
WdzJq/vFil1YCZdM4AoqQ+nyCv2qukxxiD9NHzIuhjXf/xkO2fHjA8FbwHtcV0tY
X4Q8ApHk9wORCyk0lRnbIIcXyIlDLZokoJAlikRkX4UT9UxQOpZ1ZxXYxRPb602/
MM7fJpQu1mhVvDnW/Xwm/DxGsEpYmnZPT2AmaepHrgOtwkLsiL47aZ1kKFmoA1Bf
x2KhrRXonavU00+V2Vds9MZFYoqtSKXA4aLezpZddFOF6rePH5c+TtBuhFbeHcj/
8VL9WkG7k5fd2FdzX/mi89xevZW5XHXCM8776BKSdRMilWUnBmhRXUMK5zMTeXg8
8A2Rtbkruo0bDSH7UlJgzwHIfNbUIHmZE6Sc2hrhxhZy49yKvTDeZOvt/gzw29aJ
5jezJ7woQoc9eCBPbqDQ72zPjieZ98WMPaxuyVRsqJytm0s7DnNQwdF1aAifR/ed
Z8rJK9fxU74w5aWdFeAy8FgO4G8iIlDX7RJnmuxeDGMknVAQ0ONCINmycokXV6a7
e5359HyOCzdUQYwJDSVlpGoI/aYni9hivVuVhNDmIuEAmepzGyEyhBIxPvx2Hj6V
9KeO0VWMc4ytWXArQATI2VF517Vq/bWuU5qiGtLDftZ3acQt8JEamLjpfumAHwDU
e5bOZzSw8wnNuolbtgp+XanIr//vtQyNz/tJk1Tk3aYQtN6Fv6h7uXPf4zcjd4QV
NEZtx5y3WgdO8azlmrfcPVlSKrvjIRH3BIBCcGJFL6lp2tmi6skdwbvaCf3Gj2nx
gCdPXUaUxppnuYIItyWQHm7tHE8xsZ8ujEFFPDvIVDyDatLhtmAuKnOiguGRKt+/
Z9+7Sjx11/eLHNfypBPH1cJ2vUsmakjJ4woVDh0I63QlWgXhaMFRRqt2sQGtqaFH
5cKVWM/h9KTJaXGWUi9Nsww0C6RVoInkwLdaO9z9dOyY2M6J1atA6UJSvVqeSkjS
wt6aVVciei3Q+5Ihyy10XHw5Ywwvt3ROMt+FFMJphfVvLs7WHsVxhW/F498PVa2E
Yu5351WGRMCIpDCV4xI0pI4yTzGasTA1yJZlXjBFPlUCwtukg0hLX5u8qD6Z2wir
aJRMRS9cNVSCIsXeVjS7It3G6bDhWxOxWD18kAFPZdGgjcBBsZV03a5RpMbVBYRY
3dKvJrKO8t5suL49auKGQvPKBUw41CIb7u7id7prGulQmoWF7y5ucGRIc7qxqa/Z
CClr2xWWneb8sKKa23zGv0NoLXoF1hZMDv36Ktw+Gw+rz3R7qZgaD8dzbEy+dgI/
FjwCMqOx3tdGGycJQ0nVXEFpVXgc2R6lPWzmKTX/ZVvpCUNno/u8zVqp+PC/EChX
c84ge/e5RbhjRGrqD8sfC5worwdNsUURD6drONMjkOqfeQMY7mdtDszFg4McAbpZ
PMmE+RdhSsEA74ACni9GKzPpOIIRLBU7Hea7EKAUJerYty4/8uYDRcHJTd0eD3As
CZt4KLYdZiJn+iWAjgiRdI1CCx2pioN+xfBJHCy7YCWVzoc0yoOrx3KqMKy60oli
vLkmYqaWO+3m35tHh7IdZVTsYdReFs50iNHX+rjiAW23bkRoW+xdu9EQBJJz1KB8
AMHnAwskn+Qm8E9VTM+jLcHj9BzMmuS18qWZwv0cF5xqVwZ6xT5r/lglwlypnRWW
+RPLe3rWpBHHBgar8pbmV/Wmak82+V4Tg4fzMfKkx4qJJW7/IXsFwGo3NfxR2DaC
SHUrwMpxwK2ezwFfksIiwgr1AtLPY+BwcE2Cl9hAh+DVTTAM6Fic6voAKDoX2nyB
mgZ+9rVFmcmuAhddW/D13usYQnmpDHSQTs/FFI8anFJZlVodB9O7bC0XwiE6z2kd
N9TPhx19g6lGyCsiyqJhR9YeppLpDJpdEdVql1V8uPfhIb7+sM8eza2LHOPLx2+a
t1XvYNxvb93yiOscsleOYfHcMeD8svx/jPZ/avNJ4HeGlda/fWetA67B8MmqgxII
b5XtSfGB6WQPjnqYiPA7rmV91H9/CCZD0HLOcjgmlHJAezrTg68JV/TP8C2HzOtX
dq+7Gu7jDOtcpAE6Pfd6GuwduPOqZ8X1xJO+dvofmwY/V2ErTZeO+hxga2v7YRF6
2qUm9k5/LEStJ4MtrSxykhljvGbECfxX7xhpyr/Y4DrO4tPtSdyQTw4IqVP9PaMI
3vs6+e6tONbbuQcyTr/tTDChzdw9NfG/oDA4mQHJk5ncT3a9oTpcrGbdRw5sZWNn
DJtFXy3+4+3rfZ6AAdjdwuBpp3gjWKv9/kzO16GQ29kBKleeAYqR1i65iA+5va15
76jylQVInxgyMVq2z+fLFkeWJviGiqu5W8CbAZ31GcQhN5eMYi1wKd2p6K7FQGnQ
m3X5LRKgOsMXMdvN2MnhC+sI19+oFnQSRsqvA2nwVMNhpMwl75S1vrhocKY/YU22
ZC8u3SammNuvE06AZUIigPgY9JcaTQUVreaqyBbiF7rL55sRFdpPXGbXdPqrR2u3
xCZy7zLd6tt4bJeFtSD7fhGXkvom5fVH2yHRlimxMa1jBYmxAzcVJDCTH4EwxoBi
8NIbyzEVtd0nOSTPsieNtN9Idh/pQOGF7WehY2BadhUvrxRuDxEomQ3gW4L27+Tf
N3ZelrHdn5zMUDJhCUTGr6OnFfJ26d1lDVIZKRYqtRzYedHGrGpokGZ/rzZ+845O
EIK5tn8iMDwbvcYdwSBp+MxuiHh0QAf+9ykwof+ElPuH9a2rT2HxFFbRoEyVNsnk
MfHFKQTiBbOv8jP+4vYDYrcXP/ZdCcCqq6cgmfDXib1l55N6dl10g6iXBkZ0pJSi
pY2Ag90MiawCITprOVNEpFu3UCiinFxtDkZjFoeGP2ga1XWpTGPBLEm+nyzUR2wz
vv11KolY+wIO6YN7WFpQeAZj7p5SAHenxL9EeNnaSrq4PEXH1204/AReNqKr4WZu
n6MknERKYjUSnGUFEZapzh7Vhe9ohwaKS4tYx6MIxH0nlQR1U9+hsDqP1A6a0Hlj
iOiNWzUaxJn6HBIV5SAwP02LhRVsovD8zyVgXW/7UHroTJ1YXYpmp0OPfakaSH0s
3pr7ocK2Hd3hiSAjxAVLdsBn2hDXiKTBzaH3ol4jAzD+vLcrl1L47B+hmRYpCdPy
eJZ4w0MtBp4Xde9INTDiXXmqwMr/he/ujyRS5wrQKN+ME1XYJ247naJM7JLgpRlA
iK3/1AfqcJ3AmDF++N40IGm6uyzKIvgTfknWsdrYKJfTS7ibF8HhaFn7mfucEB2Q
XLA4g9uFqh4dg9jt+Or5g6SA7Fbuq4BfjeUX9fipB7KQur8s5BH05bHUVdgkiJIY
DnH6NqBgdRGLOgYAl/nmC/2szr7ckk8doR0qMbpxRxBSh3qem9BspRlLzDYaNbRd
IZQbi3+YtM6CUzldenRrxHPVzeO1itdbD7fJbA+IeJLVpKerdS2PwLNuy2+r5D+x
7Mg90AMO9PZfCZ1Ag2WZv75iCqsaTCLR7JPbN1wYRxNDrwclEt9IL1npOAoytqnN
kToC9YpjPXt484UL5sbj/1D495raPzQQJ7t35n27biSccAHnAM9eVQxodmgWnPbH
rmXvLJ+M93xLGv8m9Q4fwpaDbLgiIX/K8smtqEzgtb4JorcxvBmaq1xhaUvzer4C
UMoMxpu4opBKXKaLuD7kIB9HvuP+ZopgfTeUuEF1xxizqaziOP5IjpLCb+JXNH/B
0lO8Tqx8WoNCbTpz1x+CPJ0bAh2ZXzOfWbsUc/jHCkTxOixDQ3yE+VLDqX/ojlUq
HLMlbtxfSrbG6K8Kleun10J74t+PQU2Jak/mBTv8gGnLCURJS5Lmgy6ep8c0kYdK
p/bCzZm0piEtOOZcImgznykUD6EqtOLN3wPZYlg3fvOXyGFJqv37cGYDG1kazv3/
GHx3HVBeE2xyPWiRqhCuMn4cluaSDiSguNlMWhk9Ci58v7FAzyxbfWqkS7FXFn6i
XPzo8BMF4HVJR3lqr63gT861vs7ZNrlR3FxiVIwOsyIDyyUOhb5479RYroZWlz/7
1461aUU88v7ajHdok/suPVDUvyj+jjoP7n84OKklc7gAhF6BRkwhHAdiAiy0S922
SJYqzt2qz3j1AtD5JEjPU7YT65PU6tN88dUrmMgSUux5bQpZW5f9jsrdmp1vkJkT
YjBdbhJTpnUVLzA3I+wOpmPoLGy66i6IkTwDNhxJ7slxWE/klpp7I3bLBuV28Ifa
CffNk/6o8Sf6KxGhjqiI0PJYagXvdBMZNlPPcslGkORLJok+UcvEeHaxFZzhREbJ
cF42SLPdW0iLd1MIgSMM+QXELNCDhBFWgDFKO4gcZT72aRSmpPkZPbfi3EMSJCoY
TUbNA5AxZITHKFhxxxDF12D6GPbhR0MyUUPRlHXWMfbjgWrSaLOApOkUwdemROCJ
3Z5i5ydBYy3g0RYNX3eaKaFv6jpwOc9akHK3gR+sd0bkiJn092cYGkJore5Z2/LY
bMKL9NgWndrEe/ZG9yomcGft/VolkqcmXrqSndY9uJXI0PPLBCYYsm+IWZDsDr8a
q6cwaRxhuZbwAKwHDMMqVLdcd4BZJ7SahcAj2HUuL3z8ymEsXWrgtc7UXqNGx5SP
tjOakwJ5yG7FmD3oE3qdkT8pcAmc8n43N8v4ktqoRwfeH0YNTFIy9iHGgk7KTFvy
pYi3ArgANt9mxmiIGY02mzXBM9280SRe5a6g8w5nuU0VqKMuGNqa57e3BiBtO7UC
s6LkYahHzJoqlTvmYzc7qH6TihpDHIBgTRzr0IRpNVjgi+y7gw8u3uAV5rhJKRRP
VcQ4ilBM3oW3Op+oKdnC4jhEYK2s/CGEurB9loqabul6b8yokhQJg8rskyERWd1C
wFPcfW3RZsNM9HsxlOTazTXYpVBG3WqWupmZXaBD0CsWu+qfzEuwfVBXNjU/F76g
veirPfJ7GSvp6mqI8KELmiezWq5jLI22Z3nzi49Um1McvSUx4HF2CJYEI9Pcdm94
7Cjg291xB0ouPSfMC2UD9GTmHL7w8RjMRmnIs6md8A1dPPZLIyHEEa8Ay8eaXbKX
TpUSxLMsgct8Bndk6M71LtoQr9V9OFlGzghcBgzJcjAoBHcnXfHOr1j8lWpszE0Y
yVKy4yi81toDfDxWtb7BO+8A+joVO3wj+bkS68ePsQZYmc9/gUXJW+h+ecTO/lOH
xtgqcYdhw7z+smom5B9rbL+F6ztAZ+23+UbUY5X9IAFeKSrLrLOLf7RyAK64EVWJ
IjYwFIGAhNiU/zP5E7ZcFxO24X69TgXWfe8I12snRSSfiWvdoT4kI3HU0JHFWUiv
8SqS03er6QJidTsJH3HC7qcVFsMY2oesRfrQHMza1sK0a30AwTefg3Hvwrnfsvoo
QYAab1IXCgs4pv7R1sAtDd9wC/q0AnTofa1DUJK1dXT1Q7fBL3gPmKzqLNLDHyQ+
xN4WXwH2Rj1A8F+1keq6nVJ3HDNhFtPRxJ1gP6mD4/pPa4oDrcWrDI+P8FoXIOUr
LvzIz+evZpZi2p1lJ//UPx5DifTLKDeP1mcqdJFQpRwSwyjealM6mszZVRQVTLb6
YDaGnrqwxM1G48yHYx0TSaj2EKQjcv1peAa/YFbyOeIXxcie5uDD2L0/QuZk9RTo
u5G9yB3+n0x5BsbUxkuKDmuT5nDT1p9Nurs/NIVZjwsax3JQlTMpon+JBLEqSuIq
eVhHwgIpXnu6HmdvOGmowmGiPKgD+v0V0ht1ZY8eqU9Xi+EvMlZ3tDDpZwSkIXqi
rnDyK8IQhxF47Xb0yIYLLCYZE+X5Hn9ZinStoQoaRN5c6BmPNkwUruMrNiEAgQYM
lpqcLmaFzDGJN+F/w24xim/Mi6OrLooR4EC5RaewVocliMts9bROMse5UyInNFWi
2M0QYXcMbFq9zjsrXEzAoF77g6qMxRRdsm+F7EiCxfrWmwmO2s6La70Of7xgxKVE
9761t+fQHyqfPS6aI7Fyss88vj2ncPiCi3yQs6Nq8U4GlRoAAptUNcgdXZ/hb7C7
sZCHD2RnknNkMBTqkhhpySHikzgmGy70t8Lf3BJK3xQMKCIa+dSS8MObl5VWc5+W
1ASstv5BUTTQ2LK67JD61IgJgoqlSYcVphxMgn71Ta3DpKHZ5m7zzT7KNKEwzBYx
oVyyCIYxzfpckL7qxTRAx+Qg+H/jz3Kyx4yMb1tTcqIJTHtk/zcMrUnUkoJTCqif
VuzQM8id2KluZUfvZD2oGNaX+S5oizpGsTX5GhkVBSjU3AMihAqFVQghH6mTWcjV
gB2P/Cn0CvdO8cT4mTrmoRwmh01h/XG7UT7eeRTMvPO/Xp4VFuc1n1+F0cYyMfdZ
RblMvC+7KU78i7Oyo+Yt17o+zgRafR6/6uaTp/4d8ygd/JqPCmowQXZ2DVCt1cQn
3Z5qaRRY+myAkZnzJY2rv/0Mc7hSWdI1q8b3Kc22ZY6cWp1DLqx/V3gurXHwA4OR
ky3hGuD9wouk0ENhhVCYKLBqUra6xqixF3ZcLYBPFGOp4BG6ClWXT/0BScT/H1z/
G5nJGbFG67E+TiUfHkknJxMBm5A0RjMPslFNna6cx2e9WFAsnR8wOKRymqq3h6UI
vZf0U6Agz/MvnqeuGntcx6KaHieYLR9WeS6s90Tb+9WByJl/anMCCk+Ly+qwLjOv
E51qCn6b9c9tn1QWJF662ImGJN41NGhMqB/0+XZLYhA6Z9cfFXG8E7/ueKWbeqby
kn+wkZwDWdCDZ5xOQDMy/KBwdR14lR/oHwMf7ys1MHqErrWOeuZRI9WNuafvwHhA
7oqcFkrt0yaoBvbMEbl0zJSKSqaQxafeWW62eHCmeQhpICD9Jav3owteaTzA4M+t
kaKl4/T62/msxgvZgDrs/uLmgogtgdb5ajSTqcdRdBS71LqUvDoSdiGIU693Dh7x
/NZPXC50Xx8RlPlr36odVNGxh9eZLdQxumq90iG6cdNPe8vBiadLx15AXAoV+heE
vLEIv7vW4+/FQdYpOGos7ywqEM+VltBa8iKRjS0Xc2nMEewAPqOoAnNrccXR+uPX
8lAWjE13mBo+Pz09GQpi/NfDczUyl/Au/HOe4kg2rmg2IOwm/B4qpqpu0gVdC4hA
VA+j/Fd1A9MToAFl/l2HJnv29ukQWA+dGNCH/XYCqzse6m+gTIsUvzP8q41dnqZK
rAqZgahTl+Gh92EoJ61mkUl7RTcHN16u+yn6Ba+hv329RlQ0RpTm/9lVCIpYaIzE
Dy3xhgGEc5Q3hCHOy23jOeLVkDH4zxfhSO5yfapM0alYaG9rbPOX6fO0FUGSKZQu
fa6mh6Vh/Szjoc/TNR/UYzoueICC4v7wHl1WvOxhNTF4kt8o1Fa9uGGIynYyKcG+
wBdrhQkuCBJIWr/cs0y8zQ4z27QDXh0dFTKgr/B+/dQFRFt1xjFiHLo0PQtfVKk7
tTzYyuJlHmk8HK706cNzBgGbsun/jUUpuhQw80sRUgeNPiSHY18b02q0nSK+CYMn
W016yn8BtLj62hmogoq8lw/WvU8O9GqdXKdPV/8Rp7pFp5/MMI7bTHA1S/9pqab9
N0URCjFxIgQ7N8w9NVI/E7Vmr1lITxHHgDQGs36Qz9nEIrpo3nBAjwhcVFQMK0MU
AsHhUFv01vuK0Pr30Js/SJOXgfhbDPZ3wXH/wdED9fljAK/sW5++EG85xcypRGr4
hveixJ6evAgL4SekvKj+w2AcV2YAjKiXhDeea6KzLYD6CyykAhC18Bnr/5EY6gZf
F9ceOGx81xd5wZAqYNHTT9p+Iy6om8yC47hEtROq8/afcHdpZByCGNtuKenyQOjW
56Cc5qzvn8Ee7Y4dG0zpD7NaaeZu0YtNZAc+wr8LSUa1SWzGAY2qVPV8gCQEziBt
oloXkzZsQRzJrdJAL+SekGQ+t6Z4z1PskhdkHb57gBZbn2Bc6bPh6bShKSFQYA+e
N0IGwuwVsXvetanG6pbrTtCEZuyT1ullXVHia9hxcmwd09xaD0JT0j62JjpVaD6W
fAyUM7CkJ2Lvbh7PWNrEbB0Q1nr1Ms0dBf616EhL2X3u2baG4MSCq6077rE75YC+
rlcdt7SbH9/k1Qh1UJorvZ0DUJcFlmgU+31g4rMB4bYWZRY21xFR8LFY7qoehiv7
3oxrldta78d8EUcla9M+WzddUmEUtErzhkKnMt6jKnecjFKMFvjriMkJ0chBH1ja
aJypon0W1HSIoeqrqOXsJLnS2+8zxwHg9iqTPMWCzkML24Oz1n8zOU4CJNdCUfLF
fpxINcUaeHblpTXBVzIAIihamCSqJ+VtKJGNjfTXzosydk8hS+Be8z0x6Wth24rC
9WG6Q81OOl+RGyWE4xVVJ9DL6Jo8sAYWqhyNa2cHcTd+PSSc/HxVKy+UcC6Qtq9T
ruwCWW+Et5AXBA8Hp/VxELFvfH7ZVLxfGbV4nJaLbZQoQfr9Tp4Rw0BdpiTq70ZT
Bdm/IUPPpeBkhhmZtmL2XnZQou4MMtluapGzHjDcXpWK+PMiVTiJLysUYmkVXzU6
ln2XH0I0KTIwVHJeEs6S4mhIO4TdOm1Or72pyL0scBm9O0cPfZOiUU1zNjwNHVK3
SwRi7ciSkan2Za4wbZcyHFOZ2qHXkiUfVnAEARocTd6+XjXd8V5qrDXSOCuoVtyt
GdLnpkEXsL2gyxQWowVwCHEd/1LXToQ3lGisr8WVwR6BJBxmzbQdlE5/qOt6eaT6
fmx+ly8AZq6nfuOc9N/lyFCG/Qv0WnK1EtcCknJnz0jlVXOiFmF3Htg5Yi+FSQ51
7nGFXkY6kMECJrWABdkub+iun/LI0JT9BEEPWB1uraZFKL8V+fd9DZk9PQvHjCds
MB02KOQz8M4TQlPhvUV+Bqzps/2dYsAKU5tPC58tu+PJuIi3VgBamNVB4hlAtqjQ
UecantKTzfNgof8Su408HsATQwwSyohLXh5V/6fS//NE78d5NXfjWgwfVC+rRcaT
/qiLobxNDWYjkcw93Zc1ZqKx5W8eGo68WVIPWJSMn+cRyCYQDXYsDFMnKbOPHSVx
KtRyq19Csr+TSrnjjlSB2XNIzaVykFdAk7rhBgrz7BhPmB8jKHyYUfrpVlwdFucz
M+P7oiwJXFwtJV5778btsHr1OlufvzMXHD/Ef2CG11xRHy5HRBMCydoS2Ik1g5bP
MZx2byib/qhYx1G0JuVBBGFhIp3SvCvKzANUbqKwlo/cr9pi457mSa++RFoubGym
MvrohErG9RxE22VITjjpXFiO+c65D3ekQmxhEVCs0fiuf7fqI8a7GcgOOyW19Cb0
X+TsW3yADdbmdEosj5bbnIb00ypxQZvxxLKQGapDmWsG51uVfw2TgdSoApZfsIat
oEY3qE5W1ImRK/D6W5boSGef4EjLWw2qFrdkG1DrvbA5zYrpDOwuuFN7w71+NXWY
trsFqRTMywT4q2lDOeNG/Tp2zqAx7ihzlfXA8GfR+8lN1emrOkZnwyPIDhM+eOao
fZjdoJYaeJlHLZ/go+O7JPgoevyv2czc9lY5Qx1sR77kBMiR2qHM1sGMgZR7+uC0
gUJnABFrfEHcC6KLWJiBLi8ZyMMbwGfAYqxJNAhiNgcmIJVguyH4+I9vHyR2+MWb
JA6ClwHGskISx7menOsHuV8OSByW5xPT1zM0FeO8SkdgYwW/NM/1QLBSVvhTdC42
Fkfob4zg3PflklyJZ9/X7lguxcElboIj/elhJWU6u3yEfTNICFkVgjatPaxCKKqB
DeLZ38DS0juF4Fs7lUBczMPSQaQI0IqtiEDbnvsXuxdDETbN05ywvT8gt2sK8Kii
82MNMbDZpnXvZ7xP5UOW2a41B2TtyfYEtxvgW/h+sFcDd1wNsu7VhtozlWS2PrPi
gBPJtl4GYSxNxZ2WDWrByzhxI+S3d9MQjn9vuAW7lzleYfPPhK8V50IE7JQog0mL
LekgEZGyGe6gLjC8Ss0KtO8ag3POui+InY/4BKsoVQ2R7jFDDBXoEzVpPw7EpN1C
LVsvGKHgglvZfpnFOwcxJgXX1UqHbZsCo022k3vJX4cNnZxU2OPx6sbxP8owX9QX
QQfT+BPRHtkOvQZNdaetDIi6+nipZirrwVWqzzaxauZSyMfPCuSvFbkFZQdcjTdq
ycgrK95e1WkJAGaljOX8HfTXFYcMU/+Zd25jUFIdb4B6sPV4QJSvhHitw70ItmfE
LGwWKABHlNFy2qX5knzEkKnvK1uE/MDTvBBpo4Eqs4tv1T2LW9hygoNhipv0+gtS
IHDugR4cqx5JvyIJGTupvalaaBuhgho/Q8tlBgrMrQNcYGdrBQ2NJVu+Zg7dVA+2
sIJVjiika2cEoywKIuKEaARSaDg5U/deppd4BDhAqKjipxUJH663MRvKhIYMdutu
gUlWC/qDP+fHB/yGICsSe5mvFrcIbKhN8DIB07LNl6iw8RmeHbRtVSh8gMeH7/Lx
I8g1NrED9RPWc1YZjlGOKCuqnUEvKz9fppDIXQIofc9SiC+k3hCEvilxajuQrdr7
YXi7tDL3EtzEl1eiWQqS6xNSvlPUlDalUuXGZJ2WlGlyaOQvOe885ThJ7fsevEKo
8P0PMhmKSGHCO5/kLwDZmoYdzcWAnlfeuDM+SP8zBuCrrBAVauDTmTBYQRyl9KXr
oflvVM02aHJjq+vaqMLJgUiNITZe6H8ArUrawmGwsKepQ3X//hJJ2PjtMcm9jNck
Qo8f2bhNXLbIvufVucU6aNK5y7AtJO3rpAhygtRYLArIxl9m1EGrFGvgkak55flT
GRXl0C/MsWUTHjtGxecuKBaKIkyci+ckhZu42jrcK2cIRQiozwN7Kxfg7xBJUdNn
SQu+Ob+idB0KKEAUlvjwwcr/7C5AOLf/u+8SlaevASkS+iubH8Ze99b8F7eLjy57
UuF1zaopjp0H8AV+eI+PFWlTZFp9C5WCoWPW82OWsY/S6JfBYV5ceqqWMaNVpqId
u56vl54TURBr7agcA5VbAFB/FMcNWeqm/Q6Tg2oLAhJUxKMdMB31JojSSoi5Fhgv
StgBqThsKccTjlZB4Dk7GBmMit8/SlRt7LIKLnT2Aqq2HnmvbMvMRhkQn2rmzrl3
za0ltRj+HajqnwgNnq/1rX2TJU2YyOQ8tVKvjnfBz/fYYQn0u5+BAErkXw86jy8K
cReg3UZWx/rwsLNDKOe2zbKCowOg2PFVphCvNqQANbLC+/cWVug/RVok3JC4wlQo
X5/2Ld3viFFTKr8OOy6R0ofGwGKDX8jPzhu2m4npAbkYw+aL0D9uzieeGaUwb+jH
bKhwYbYheFn93qNka8ioIfKni8qplPOo+rndjM+INAiIQHlLD8Hz0UVCR/7+KeN4
Xdn6xcoQLBZA1uGjjjw6ht50rtCRiz3jNPNEWtuImMGx3EW+fsws2mEOkRNzZQ7Z
6Mm+StePDGFvOlZ4yZ4giAzEF6ilBRe0ggmM9nd/EsXQSbi301EzMnUTXKhy0RXy
bLz6UYpGID+eMniMLmHRHKj8AnBjWxfOKl2D8taLdxPfAvX0ndHzFN9LFF4XCojb
qjuZcT+wFsqKHcBnlMFyGSqI/4TKYasJ36P7XQ7rgJvmIqCGNq3Qt9NnsUpQaLlY
FvHxbBfVP7fQUwQixppGKQv21LF2pJMiJJCT90EHMm4DSdabMwwJyIXjX5EoTNDe
PDZIwWOhih74GLeH0k21MeF89VwvOXWFDhaWqqKkUINVHvtqxZUhv7YEz2Q3+ZIO
WkXV6TfRrSDHCll0WN7CbfpLaab6POJl146XDOo296egmzaYQt22FidddD8k2+VW
RYBeD81Pkz/h+YiLBA+fDEwJUHFEKAsXYLRhxrBk2qtYcR6jAt+3UI/PxNhrq6en
Qfur00/Ef+V9KTYojPdFfh8j5wxFupk+J6moEv4XTgQp5px+W+vEWV1PpfLbgeLz
od8d0AG/sSkcl9Yi13+mFFx8qYwHhdmlLd46MMyoSpac7DHgiiVfxr5jSjoYxXzW
R4RnK1+wav1IvoDPtHAB9CWDC1fYhTrKMiikBox1wSxRFQ4ckTYuO3b9IP1MOeeR
yh5TPk0JN9Pe4TZ4oFAW+W6LoMAziOr0pKu+lPn6+zd0uig6yi2Cr65luLq65xSy
OI4GqSdYY1sxhLjTWpe8pr0ydBr+qsLi+mb04mAzG6ASekk+L96A5NglAAdpEOGx
EDT/2UsPBb5Td9jTe7Zn9LvMGz9wbbrPBZe7yMkzwrnzrfyd6jMd5IAruRm7mqjz
AqzKmQAXsgSi7ax8cRQZu+VFtENIqA6XRvfc1lRT+aFkBsKgoPouDp1ACbTLd+dI
HoX4akw2wm4F7VdWJ9M4cq4jfwUxGW4ankj1XCjVxb65e2sqwJfgLnSJRs+orZ6f
bA0Un8NDsYURm0+5vDCQkwgioxChgjnH4P97x3A7NYSPVo2dd4vsZAwWf3HMHauZ
8q34qIRPxSA4T6T6Ed3IorkVcFprQnwiEITNoIArT1518UUWyVEMcBWe0mg163ct
sCt4nIVAxQBId0ISIpp11fHpNwcRFk8tFiZj50bk4FBUm7h12PoO9tCgtJleYu/X
IYjFuNIb2sQwz9vR+WZRhHrHGVoW9sR5STWn0V2BgWsnXnvilJGqNHiDWxFHWLR0
vuk/NlDhx2aAkCE+L9k2uRBlU/xVazv5dpSTgjuecM97lb838Y7AoB29NejbqsC4
Zeaxq/wjrecCnJD1f33Bph1FKRRvFEAzmKiBixMhg2QVpGErmm4COLFCrwTr55Az
qo8RgMKwvSyeVSghve0jv9I2h/+LjGEwET+a2u5Ey0cRloPVGEjn5h/lis1H+wo6
ytNIf7IgjsyKzj1eguzU3GTcIzRM7DZwa6kxeJgNgqMK+wBFrI+CbkldML8Sfdjy
sEB2z5OgN7RJBD/CgsW7tbZG/D5UbKNd1GWdZwtH/Si4j2U2l2bX/7EVtoqzrO0/
E33z0TDv1QHF8C6ICR4GL3CRgpfIVFAqouhnFdDjRFt9YhUxHn7Z9Gdxhax5ong5
IQ+YpEyB26TLhmaP0hxHvapJRzgxs/a9AgV/YVF37gSCMpnZQz30irWheIN0cnkZ
4QbO1MG9le7syawt7O/stlRcO8b4/kNqLd1CjZl/GVmkXcyuj/txeGGwEB+B9rlI
UwtQVUo3G0WjCN9y+Zbe7CIQAOZkdikkVIDiSqa2JXyVvUqDnNitoCiY3ETM/w3i
DB74JijC8UuLmnY7htD9nB0WWoZVl8jsFJj848d5XdBNQVs0Y/lz1NIJYwNf3uXn
wjEBHWofn/yGsfVdGyblSS83W7q7B3e9i8WpLi13LeTBmR2vpyCu4XSnK+7ZO8u/
2gzTdjq7JQzVxVK5RjsntjkRh2P7tp3IL4qWh9LEefgOSbsWJgoQ2VifATbSVaHO
VGccBKVUFobkmcUn6D740nCnfEdg5cctkHwHRKOkujWiJymy1HwqspdTKeHDcuVI
f/ygMym5GS5LUnZnEsExykvn9VWDyXOM4JOE0ZqZRZNjak2RKXQQ0D45oUbQFcL1
OzTJoVqSq8Py1QHCkWCYGtJPDFY68+xEFLWbx0TsKVvdjeRGPeKzcODnGLdbRUBA
GHteW59UY+4Km6EYkqdyNWhSBAzl1GznEXeBhSnqUy31I/lXo/QBOXQcnwSXEWre
oA1hB8dkM+f5yeDP0MqEO1PacvRpjsxu5ArNlXu8icJ3CMZjgeNliUoT+ibNZ5Vg
H8Ac8jQIJV1RvToLi6khaIzIWjI1oiTLppX05YT3AVG0i1v2bHybsl5evaNbIJ3P
SG5tL95QIKQmWE7aMQKayBSmjxhyp/klP3WtSV08V1cnxJPoK6tbDs4uUP6A8qra
g3QXh7tZVTu7sYzaqxD+wvJFTFvRgUyrn4RI1YUqNwodpY5HoWtKz/0dU2+Ltl9U
0q8+sef8o3MbHwHh1gER9/mI9/2V/QlEiXKu7uE5pp64KjsoEYMUQlhKQ9ETRGzV
VIFO3lINYlaBJzyDb41nBqwjm6ydwZFAB1xqcI2LAMPMI1w+JLmX7A+TdQq1c7Zx
1gk+lG5/7E5sr8quR3/Gnhi/36UhrksW4la+DdYeDXAtuhntiLM9ruAHbiqDQ9jX
nWaVv+L2mA/JPS8JKlJ4uL2whI++nnN1apgI+WzrKZdemViviJymno9qQJQxGWeg
EqxU/bFoQ9SPmCYHbGlsF5MUm0H7MEvIitAEYkjBUTrSVbDertGgefhkusiD6t3Y
q4J0xIt2+9JZn57A3AfxUiTVySQMZ38OAsWqYx912DOdRnF395N1mi4cvCOyXga5
7x4RLBnrr+hPoA4lLO50CUEr2v/Fo78msl22Qgy6FTCcfDvl+Dln9Rq8lmNNtD1+
ETM63xD23K9ls2Hn/VhAunbLuEA8mU7OnTOuT+0OHZ1FfPgMbDkozoAsmJjPyhKS
0mnXK1sy41axNuaoU4Lst2n+wsZSB/IJ8XxUlHeJiJDvAgEunex8LbjEAoOp8+w5
yLDMcj/amMc+gzqyhUv3YCmc5waWb79bWvXU6RzoDbrzLjw3JozRVL5Jhby0Q8t2
I55MN++rd/DWivHIM90NLFoLMQWLUTw8kYwcurg2gu6gW+HIcCm2OMU2jZ4bC5uy
R+kiZl2uq0qjtisL1dNhBHSeE4Og82Jb0K3YfiyiPhnDLPh3/fn+UL4Q8IsP3pkL
UFr7Ex47sYV4QTZIWgLN4ckeXveHCkH+xLom0pUAMX1NvC3UlSU1LF9E31uPUV1C
1N+pgkpPXUHqVSOJiOKR9/9oc6X7E835JfrOOry90Hlol58MrMeQNn7rEkg6pRvN
/Xspp/UPHSHb8ZVLmsKrIlPT/PF5z7zLzub7ymhYF7c=
`pragma protect end_protected

`endif // GUARD_SVT_NOTIFY_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
ZTLbUwylpCiohitLgnhTQE8nCX27LhJ5zU4KORakWZHNM6/Obp6X/BQ+aZs/L3ni
RjElPSu04g4UHrtpvAWzHbb+LlKBbdpYBE61m9nXMZtgl0T0017ib23gq1jPiVrE
Z1noLZUm7EK63/vu5I86tyAkJcTpeCmQHp42lT4eRmc=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 18648     )
ng45Ecm42EUQyDq1U6BIr1ZPlgZgEuNC2s3ilyKFHVAAECipy7E68QRCdIFZPyHx
Fe7jG/1AeGY/XGJRaurQM/nbp12CueQxRwKLO16NXw9zdGp3FIQodGmTUOOm1oE8
`pragma protect end_protected
