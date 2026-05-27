//=======================================================================
// COPYRIGHT (C) 2017 SYNOPSYS INC.
// This software and the associated documentation are confidential and
// proprietary to Synopsys, Inc. Your use or disclosure of this software
// is subject to the terms and conditions of a written license agreement
// between you, or your company, and Synopsys, Inc. In the event of
// publications, the following notice is applicable:
//
// ALL RIGHTS RESERVED
// The entire notice above must be reproduced on all authorized copies.
//-----------------------------------------------------------------------

`ifndef GUARD_SVT_VCAP_SV
`define GUARD_SVT_VCAP_SV

`ifndef SVT_EXCLUDE_VCAP

// ****************************************************************************
// Imported DPI function declarations
// ****************************************************************************

import "DPI-C" function int svt_vcap__analyze_test( input string test_profile_path );

import "DPI-C" function int svt_vcap__get_group_count();

import "DPI-C" function int svt_vcap__get_group();

import "DPI-C" function string svt_vcap__get_group_name();

import "DPI-C" function int svt_vcap__get_sequencer_count();

import "DPI-C" function int svt_vcap__get_sequencer();

import "DPI-C" function string svt_vcap__get_sequencer_inst_path();

import "DPI-C" function string svt_vcap__get_sequencer_sequencer_name();

import "DPI-C" function int svt_vcap__get_sequencer_resource_profile_count();

import "DPI-C" function int svt_vcap__get_sequencer_resource_profile();

import "DPI-C" function string svt_vcap__get_sequencer_resource_profile_path();

import "DPI-C" function int svt_vcap__get_sequencer_resource_profile_attr_count();

import "DPI-C" function int svt_vcap__get_sequencer_resource_profile_attr();

import "DPI-C" function string svt_vcap__get_sequencer_resource_profile_attr_name();

import "DPI-C" function string svt_vcap__get_sequencer_resource_profile_attr_value();

import "DPI-C" function int svt_vcap__get_traffic_profile_count();

import "DPI-C" function int svt_vcap__get_traffic_profile();

import "DPI-C" function string svt_vcap__get_traffic_profile_path();

import "DPI-C" function string svt_vcap__get_traffic_profile_profile_name();

import "DPI-C" function string svt_vcap__get_traffic_profile_component();

import "DPI-C" function string svt_vcap__get_traffic_profile_protocol();
                                  
import "DPI-C" function int svt_vcap__get_traffic_profile_attr_count();

import "DPI-C" function int svt_vcap__get_traffic_profile_attr();

import "DPI-C" function string svt_vcap__get_traffic_profile_attr_name();

import "DPI-C" function string svt_vcap__get_traffic_profile_attr_value();

import "DPI-C" function int svt_vcap__get_traffic_resource_profile_count();

import "DPI-C" function int svt_vcap__get_traffic_resource_profile();

import "DPI-C" function string svt_vcap__get_traffic_resource_profile_path();

import "DPI-C" function int svt_vcap__get_traffic_resource_profile_attr_count();

import "DPI-C" function int svt_vcap__get_traffic_resource_profile_attr();

import "DPI-C" function string svt_vcap__get_traffic_resource_profile_attr_name();

import "DPI-C" function string svt_vcap__get_traffic_resource_profile_attr_value();

import "DPI-C" function int svt_vcap__get_synchronization_spec();

import "DPI-C" function int svt_vcap__get_synchronization_spec_input_event_count();

import "DPI-C" function int svt_vcap__get_synchronization_spec_input_event();
                                                   
import "DPI-C" function string svt_vcap__get_synchronization_spec_input_event_event_name();

import "DPI-C" function string svt_vcap__get_synchronization_spec_input_event_sequencer_name();

import "DPI-C" function string svt_vcap__get_synchronization_spec_input_event_traffic_profile_name();
                                                   
import "DPI-C" function int svt_vcap__get_synchronization_spec_output_event_count();

import "DPI-C" function int svt_vcap__get_synchronization_spec_output_event();
                                                   
import "DPI-C" function string svt_vcap__get_synchronization_spec_output_event_event_name();

import "DPI-C" function string svt_vcap__get_synchronization_spec_output_event_sequencer_name();

import "DPI-C" function string svt_vcap__get_synchronization_spec_output_event_traffic_profile_name();

import "DPI-C" function string svt_vcap__get_synchronization_spec_output_event_output_event_type();

import "DPI-C" function string svt_vcap__get_synchronization_spec_output_event_frame_size();

import "DPI-C" function string svt_vcap__get_synchronization_spec_output_event_frame_time();

// -----------------------------------------------------------------------------
/** @cond PRIVATE */

// =============================================================================
/**
 * Class for interfacing with the DPI code that reads an external VC VCAP 
 * test profile and incrementally returns the data specified by the test profile.
 */
class svt_vcap;

  // ****************************************************************************
  // Public Methods
  // ****************************************************************************

  // ---------------------------------------------------------------------------
  /**
   * Attempts to check out a VC VCAP license and read an XML file that 
   * defines a test profile.
   *
   * @param test_profile_path
   *   The path to the test profile XML file.  
   *
   * @return The staus of the operation (1=success, 0=failure).
   */
  extern static function int analyze_test( input string test_profile_path );

  // ---------------------------------------------------------------------------
  /**
   * Returns the number of groups defined in the test profile.
   *
   * @return The staus of the operation (1=success, 0=failure).
   */
  extern static function int get_group_count();
  
  // ---------------------------------------------------------------------------
  /**
   * Moves the internal pointer to the next group definition and returns the 
   * name of that group.  If there are no more groups, the method returns 0.
   *
   * @param group_name
   *   The name of the group.
   *
   * @return The staus of the operation (1=success, 0=failure).
   */
  extern static function int get_group( output string group_name );

  // ---------------------------------------------------------------------------
  /**
   * Returns the number of sequencers specified for the current group.
   *
   * @return The number of sequencers.
   */
  extern static function int get_sequencer_count();
  
  // ---------------------------------------------------------------------------
  /**
   * Moves the internal pointer to the next sequencer definition for the current
   * group and returns the instance path specified for that sequencer.  If there
   * are no more sequencers, the method returns 0.
   *
   * @param inst_path
   *   The instance path of the sequencer.
   *
   * @param sequencer_name
   *   The name of the sequencer.
   *
   * @return The staus of the operation (1=success, 0=failure).
   */
  extern static function int get_sequencer( output string inst_path,
                                            output string sequencer_name );

  // ---------------------------------------------------------------------------
  /**
   * Returns the number of resource profiles specified for the current sequencer.
   * Note that one or more resource profiles can be associated with a sequencer
   * OR resource profiles can be associated with each of the traffic profiles 
   * for a sequencer.
   *
   * @return The number of resource profiles.
   */
  extern static function int get_sequencer_resource_profile_count();
  
  // ---------------------------------------------------------------------------
  /**
   * Moves the internal pointer to the next resource profile for the current
   * sequencer and returns the path specified for that resource profile.  If 
   * there are no more resource profiles (or the resource profiles are defined
   * for each traffic profile), the method returns 0.
   *
   * @param path
   *   The path to the resource profile XML file.  
   *
   * @return The staus of the operation (1=success, 0=failure).
   */
  extern static function int get_sequencer_resource_profile( output string path );
  
  // ---------------------------------------------------------------------------
  /**
   * Returns the number of attributes specified for the current resource profile
   * (for the current sequencer).
   *
   * @return The number of attributes.
   */
  extern static function int get_sequencer_resource_profile_attr_count();
  
  // ---------------------------------------------------------------------------
  /**
   * Moves the internal pointer to the next attribute for the current resource
   * profile (for the current sequencer) and returns the name and value of for
   * that attribute.  If there are no more attributes, the method returns 0.
   *
   * @param name
   *   The attribute name.
   *
   * @param value
   *   The attribute value.
   *
   * @return The staus of the operation (1=success, 0=failure).
   */
  extern static function int get_sequencer_resource_profile_attr( output string name,
                                                                  output string value );

  // ---------------------------------------------------------------------------
  /**
   * Returns the number of traffic profiles specified for the current group.
   *
   * @return The number of traffic profiles.
   */
  extern static function int get_traffic_profile_count();
  
  // ---------------------------------------------------------------------------
  /**
   * Moves the internal pointer to the next traffic profile for the current
   * sequencer and returns general information about that traffic profile.  If 
   * there are no more traffic profiles, the method returns 0.
   *
   * @param path
   *   The path to the traffic profile XML file.  
   *
   * @param profile_name
   *   The name of the traffic profile.
   *
   * @param component
   *   The component type of the traffic profile (e.g. master or slave).
   *
   * @param protocol
   *   The protocol for the traffic profile (e.g. axi, ahb, apb or ocp).
   *
   * @return The staus of the operation (1=success, 0=failure).
   */
  extern static function int get_traffic_profile( output string path,
                                                  output string profile_name,
                                                  output string component,
                                                  output string protocol );
                                  
  // ---------------------------------------------------------------------------
  /**
   * Returns the number of attributes specified for the current traffic profile
   * (for the current sequencer).
   *
   * @return The number of attributes.
   */
  extern static function int get_traffic_profile_attr_count();
  
  // ---------------------------------------------------------------------------
  /**
   * Moves the internal pointer to the next attribute for the current traffic
   * profile (for the current sequencer) and returns the name and value for
   * that attribute.  If there are no more attributes, the method returns 0.
   *
   * @param name
   *   The attribute name.
   *
   * @param value
   *   The attribute value.
   *
   * @return The staus of the operation (1=success, 0=failure).
   */
  extern static function int get_traffic_profile_attr( output string name,
                                                       output string value );

  // ---------------------------------------------------------------------------
  /**
   * Returns the number of resource profiles specified for the current traffic
   * profile.  Note that one or more resource profiles can be associated with a
   * sequencer OR resource profiles can be associated with each of the traffic 
   * profiles for a sequencer.
   *
   * @return The number of resource profiles.
   */
  extern static function int get_traffic_resource_profile_count();
  
  // ---------------------------------------------------------------------------
  /**
   * Moves the internal pointer to the next resource profile for the current
   * traffic profile and returns the path specified for that resource profile.
   * If there are no more resource profiles, the method returns 0.
   *
   * @param path
   *   The path to the resource profile XML file.  
   *
   * @return The staus of the operation (1=success, 0=failure).
   */
  extern static function int get_traffic_resource_profile( output string path );
  
  // ---------------------------------------------------------------------------
  /**
   * Returns the number of attributes specified for the current resource profile
   * (for the current traffic profile).
   *
   * @return The number of attributes.
   */
  extern static function int get_traffic_resource_profile_attr_count();
  
  // ---------------------------------------------------------------------------
  /**
   * Moves the internal pointer to the next attribute for the current resource
   * profile (for the current traffic profile) and returns the name and value 
   * for that attribute.  If there are no more attributes, the method returns 0.
   *
   * @param name
   *   The attribute name.
   *
   * @param value
   *   The attribute value.
   *
   * @return The staus of the operation (1=success, 0=failure).
   */
  extern static function int get_traffic_resource_profile_attr( output string name, 
                                                                output string value );

  // ---------------------------------------------------------------------------
  /**
   * Moves the internal point to the synchronization specification for the 
   * current group and indicates whether or not a synchronization specification
   * is defined for that group.  If a synchronization specification is defined
   * for the current group, the function returns 1; if no synchronization 
   * specification is defined, the function returns 0.
   *
   * @return The staus of the operation (1=success, 0=failure).
   */
  extern static function int get_synchronization_spec();
  
  // ---------------------------------------------------------------------------
  /**
   * Returns the number of input events specified for the current synchronization
   * specification (for the current group).
   *
   * @return The number of input events.
   */
  extern static function int get_synchronization_spec_input_event_count();
  
  // ---------------------------------------------------------------------------
  /**
   * Moves the internal pointer to the next input event for the current 
   * synchronization specification (for the current group) and returns info
   * for that input event.  If there are no more input events, the method 
   * returns 0.
   *
   * @param event_name
   *   The event name.
   *
   * @param sequencer_name
   *   The name of the sequencer with which the event is associated.
   *
   * @param traffic_profile_name
   *   The name of the traffic profile with which the event is associated.
   *
   * @return The staus of the operation (1=success, 0=failure).
   */
  extern static function int get_synchronization_spec_input_event( output string event_name,
                                                                   output string sequencer_name,
                                                                   output string traffic_profile_name );
                                                   
  // ---------------------------------------------------------------------------
  /**
   * Returns the number of output events specified for the current synchronization
   * specification (for the current group).
   *
   * @return The number of output events.
   */
  extern static function int get_synchronization_spec_output_event_count();
  
  // ---------------------------------------------------------------------------
  /**
   * Moves the internal pointer to the next output event for the current 
   * synchronization specification (for the current group) and returns info
   * for that output event.  If there are no more output events, the method 
   * returns 0.
   *
   * @param event_name
   *   The event name.
   *
   * @param sequencer_name
   *   The name of the sequencer with which the event is associated.
   *
   * @param traffic_profile_name
   *   The name of the traffic profile with which the event is associated.
   *
   * @param output_event_type
   *   The output event type (e.g. end_of_frame).
   *
   * @return The staus of the operation (1=success, 0=failure).
   */
  extern static function int get_synchronization_spec_output_event( output string event_name,
                                                                    output string sequencer_name,
                                                                    output string traffic_profile_name,
                                                                    output string output_event_type,
                                                                    output string frame_size,
                                                                    output string frame_time );

endclass

/** @endcond */

// -----------------------------------------------------------------------------
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
LN6KO9nNh9JSH3QPDVIf52wQAVz2S9sZasykp9xvKwM3cc6G7GWeK+mtA9vaDozn
4ILzNIIDmxhq9qDuttYYW+QSYabV8Leg/Pt4gUm5bfwL2N/fOlUUGmqxuNFxOqkL
EEFg/2J3j5Bl+QnL3OMCrYTctP4fwk6d4coaQUUTQu8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11158     )
BRIDdfRV8hZwp6BR7pO0bi3fK0kWw9wvYzM1suHiD4W0y9zTBiDsmQAIzvg62gv8
kruOAeVjbHdJkTgSanCm5skKKq4YpavhkYC64C3iAj0E48l4H+s2aseGOEtZQxjN
Luu+wtjmzOF3jM8MR4z98k/WHpiJ1vLIMD+dEQb6fINNYy2kJ5sp1EueaFiffBuD
8NpZwHfSAgT6SbkBeT9IFtSYOeV1ZPTiOi2//XV3SCE7yLiRyUDPOXhpnWhXf+xE
oYlVpBYZflLlzOwFJxfjy2gxopGpNIkTy3SetrdGAt51LQKzfX4ETlkCCixTaoSs
u2MhaZk9lQ1F5HIyKX2/yO2tWgpVPpU3wg8aOciPY6dUOPmKFfnOfRGamjzSrTlo
fGWfNhAmzXGFoMFNUdz/grGjM1FKrMWCM/ZVp4Q2/v8SUgli5O3M/EJJp1Dysz13
bpJdcVHQ6in0tjvoR3fl7ypkhdLOCoquWbgfdtnHbpk7yI5gn9zxTB2kG+1momg7
KV1lJ0nMGChfAbSswbWHcbkzjVSS277AENx7gYoM6zru+Z2NEaloiL1sdYiNqAyT
0HRDBFXqJzVN6FQJJmtHi6H59w74A8mDOUg2QAMssU8sdbYLUKr3ecTJf176Gxtw
4alb+lRxNgjcCncQUygnhaFit9aQyIeM4NkTb15CHznQVAIvim7JZphVz4aCZGIk
rrnX53NjeoyrFnbl/LXLfKPmJqjGdl6vk9NKZ1cMLmusKxqQ4o9nOexzbNDKDm32
4YgLPW178I00UIpab0hPIAekQqzEi3Sovxjyn7SQi2Qj3zi8GqaEoQIGU3ohFJSA
fnQ2cOFF5Xy/W+y+LQBLbMK0uk5kWTBQ/KZwD5TwlC14dkiVy57OKtbkrXauVvzf
Qxc1JJeqqGP9K0P/w84TpJkn83UtD7UQd8iBUOFimy+f7R+XgJhet+oy0HhBUYwW
dCOb79TS88IINHkHy8q0kyjjAAKKB+9hnGYD+4v4YL7fbtuqi5aPH8Muf28n6Eub
si45g3Rxkbchu+V62SIjKJ5bkRXH+w5L4T4uqC8ENbTyBjYcNqeFemUy3DApK4dx
jPvFKy+IDE+FjlRqVj+iO5nY/u3xjLDCYaRJnNdzCauImjeuUmQe5aEgYiKQvL+s
QHcxOtA+Ow9mzPfGZKP5bIzR1EOtv4lAWEg6mHDBCkUovP2RMQ8d7Ki7/XJEolSa
i0Q+z3164ebJ1RRdDSBG2dkcNIdzhtgUQ/3ZdCNGXt0AR0S5rJvk7dDZsudG1voV
2qHg4Cn/M+KewpaqawhHDCBB26Kp4GYYD8AyXRtdZ45w7gm1VuuKp/G0wInElZ5D
RB9Wj8qfywrqP+bT0TIZ9dFkrdC69OP/vt4kiwm8V8AkNt7/FYfQnkN38tYGMRGn
BOyewyN89zrovdYfHywlPGs3o8x8SYmWGU4mOOb7PVF8S08EGlboA58ZQYOdE5Vv
qcCCaY1w5iZunJmQqzQGYej63xGxkqdT6sF5ojLdL2pAPxKn3yiSJm2DIGntmFiN
PYtkxDipYpI8MRK9NbN7d8J9Xp2Bn5xEVhLyZ9Jn/10MG3gStVGwouEM995Hujth
IR4aranvOopxpRNA9Pu0jwiTsrAMET/YA/aqFSjm/9pHkj0Nlam5nOTiG4Ur5DCD
96sbwEqoK7Cie39sISSwg9tqrohnDHwkUCLzO0HixyHPc3JCAiRUZaO2mqA4fc2q
ex0bM57OlWCVUyJjfEyfUOOicnHYYHTzobubHpFtw9bBRsmmLNRM0rLAS6ZnGeZu
kob4pnyjyuMY7tdLAXD6N5cCWzfp+cyj4pz8rheFeHu1uv4QD7dn1S2hF/CF+AiJ
yyNbbNaO3JjlSwUEPHnVTrcczM64EU8St9fVnD18QBXV94Yd8JhRiJrQTmGBJ1Ob
u+4cbEtJVqZ4loPfRjm8zeP3WIY0VndZlJmHaEojdu7BVnNcQ0XtnQgq50HJnwHI
8odJLxpx26jHkv2rPNnOI0zyvKMGXFAL1bj4RI3UIerKH04chgu9CzBqv9B49qoJ
tXbA076qhGsyCfo0GwBayVU1+Aknm5twOT3L202c//oTop6aO8Fu5GJYYfy5S935
rJu8OowauJFC4TZkINQ10A6qi4p8iz/coHfl08Bdz3MksYfARoZfgc/r0+HkrkjP
vq4ZLdJKP5pH5mjO50ICKmWsxtJEzdUvV9gCvpW1z4Bvg3zNBCHt0LpXoiBDfJEj
VZrp2WmOJim553tvtp6FZVlPTPMtlKXShDlr6A/mio9MtcGbZppLQyq5aLMBiKoX
kki9l9tc5xdLLQ1SsZlATpoAoSvNAffHs71ZqvL7+R8FNcGxMHk7KvEwKJmx51uD
HAVcstYnSU4piY6v3XcceBeJlRv9xfZkt9h7Lmh0cetkDwvu7UQeVVe/7WjBVO8I
bIIlm+nfhU+Y5995UUiaR270rM2nrejw/aXqdG8JU4qTNEfjqk24oYchNA2o5dOD
0a6AwWnRvlJf+kYli6RlO3QStHZYSQA2yJevnXTX88nsRclrTPJU2z2gbcnJmvYm
LpNX/bM1ZXJeRgyUJT455XQ337NeVVaDEzdrQCt0h5GC7XA4HAYcwzF7ZfBzp8lW
uOFoGuZy6lx5rtesEiRBMS+WaT6/gdZoMdvSIXSix+4Y3gs15CHfYrx+cimpx/ve
XbAyHm9klI29rTWO3sOTYNhRIOeqGuRS+iOFvuWC0DIUWSJ7APGt4Jh7OGi6j1fD
5iiGJlXA8qe3yj3zotrA2YrpsMoShSiFCvpbncLUQ49gjIAgLVUD4jHvqVLoStO5
rZkWc05JrQbi+UWz3cqpnXYZRDjlME74Mj+A5novk7pof5rlw/trdehb2Z2aaFl5
posH7mHBELiWk3TJEFGT53Q1TQcH8ixObwNkpB08U1HhLGwRS95DatmrAoogvJwb
4IurQFCxFMj7fFpuZ6XUXaZnM6jUvjGfQlxXTQRyh+cDarmrLBsHzYrQCvPUx58w
HAqMBNV8kYQT9DQ4Fm4b4WKNMqEOibzfy9yxoxf7N6qFlmibli87u4oVsW4JFQJo
3z5zKsMCTgU+6CL3uvrdY39etHtMCNc9WgchQgLW3jNRI9o+lb5uw4p3FwxE/1pU
wlJGMOMHKwxkHT9dR6VzCoKo23QANWkU3E9JAkeEF7WR2yTSM4/hxJiWxFWW65JB
mdInxBIytWlFAw4J2qq4GjxT+Xhp51UzVarM9wNEDrpLslcfWltlAwOV3r4Ud1Mn
Z9ZcuX4iEhY65QrFbYtTTF1GB3IObpHHAjYgc8GRNSCdWwohQlg+0okvHZ2J4hGJ
aX1bDRV2/49F3Fz4Ae/gHHFVL6dESmbsJlfR55MrWkvHernBCZl9GdoAGBdcISqT
hQuhnHPNpMZWBpC4ocXeETZN+8tkdb8MLBLZpSC1B3M+lwe7dBuA7MQ5Sn4WGV5I
+UUCfZPUH8ntb5bieoM+54pEU5u0a7HFluQR+3mMZjUFoCT4grxpLvFm6Y379zH2
QmECO4joSklJQS5N4f1Zm+kpfVo1fJutUS49MxxeTByrTyyMwCIkJNAQBhu8lJKL
BBwAbZkXKcXZCtslhq/sf0XcBfSyJqxrj5EFAnVz9pORCJa+xPlzzMRWW7gaXWJz
U7okmJ3ZbujvtpjoiUZCsoTEBprY/SzmbQ2iY8Y27IvVBELR9v27xUCgmyOnWyJe
iSnRZXwX6Ude/7O2Ee5HNIulfXCVDvAtp7Zoq1baGUPc4eJ4EgWQnOSncmuIJP98
E70kANddtEOronCeKemKaZTToLTGE9zHuMeFWgkBDTjpgNLHf3ew6MTRElX8y8Dm
iX7RsKWUaUs8VyDLbabQucMMsjq9enmQR+Cv33aB41tddNmlxm0URNhtQoaZ+Msh
XEneH4ck3qoITF2Bc0aVjFM/IDNFEzGTStcWrGQTREUJcwRAOIiP09Mz3bRmKV5h
XY1pe4mDFFwWHCyHkv1jdImAxHRNqQq62XW9MpJKCZ3XrVOCy9eJtEVUPFztw5Ij
fAicJnQ/3SWXNJCJl4F5h/8wzoGIk5kBsfSLj2q2LGD4wTl82nmFJMThkniNdTJm
iXYtI4tNyXeiG6CRL0WT26gLnBgYI1G3yT1XTvtesNP+T4q7KYS00CtCIaeJhC8f
nHqkMhgh9LqpTgvoXYLLt2FZ4BIMUDSu5rMvgvO9stCvpMQawyapubkoFysk97Gp
LvPI9s9wdHqWsqK+wok7imA2a5BKmWx8eLcQICCS38bHo6WxgshEtYOuOjKXbY+/
NvEzZP9inOKI6/Ds4A9lA8LtF6Z/rLNOMnpmvZhDUo1pvYspcS+DAXTuHd0xB3dg
TgnnKl/DCaAonWRWXuMApYdwMrqknuzcfOXtB9hS0eqGpdlmH5sn2QgNvpo0vYNW
4mfXYjPQtXmtXxcxT6bykLR0TMcLD80opkFUhmAnG0eqJj08YToKXM/nkBSI756U
1+JsG2aLPhHpIXcjAHXSE0YzrYiIEBEWrywJfFVEzpfdHT2mMk+VydbCLJi8p+6Y
qA1WCy8IPOrw7TcqTSqxYYtqJX7qiunRZBnjL1Mcw77Y3esUqEZRSaeqTB1alNV4
Jb0pKzMZ2GukzC9uMcldYGffh36r3LW6FR7lrcbrgTa11+jPcMfVBtu9rPiGSPp3
EEWlj5CaQoiAxkVoctp93m1sqIz+9JzKGXRCuUsbt32/wnaXnq/c9d0+GnPaUsWm
Ym2YO8U+w/GImUcKjgXFC7F1+SxBIhkhA7OCpKE/VhSy+3ijtsK3YzRQ06SbYgVa
l+YePVSrYBkVmCanf/gwhT/3rfyVTfq7Mz0L8tVLNy989ZYKynxH/s52KsfsUjl0
6+xeSUXGbNq1iHG01MNjsfNsAdi/XaAjudyVavXKo0qr5XMAwcYQKVyHOBUtuEFn
fVRT+EBz8bnznmMWGdBy5nXjpe75YTJq5wtwWfKJ0aVRE3fJMC5t6KyjqaZbpvgf
uo7PgpCchr2eWf1MhcTblfAh5e/c5VSxkaNWj2N4547iLc3BvNNp20BqbO5lTF1j
iSjXp9z9O3SqgD+ho0HR0rCXTotVF2ylsPslXaCBehaRq1I3lfrI1EWs2XG4nJmE
sce6fk3TioSu+p36z7q21eBEYam+ulPJ5i4aO8OxQE95Oc7SPqZezRAZEfnTx6BX
CF8MBDDS4d21X1XRpTWxPYJ1ZG6YvK5qlTlI0kWYetqipzxd1uFkOrhiL7W73poM
wHZLgieKmlwyHuJEIGJlqZXd4eQwujomzC2xcOOaC1ScUB6Xl3YGgJs9k/p7juF0
7m451CXG1WYwWBJiitaPHSpBwXHz728MR+12p+KAVo3eL2Hn7F+SgL1f4xGZEkUG
zWyktCcSTsOE4PbyKARD5YvM1K6vCTqDURIRZfuZUZIImVlGF5fufXiYoMnrhy/c
JpBIyKfeF945/TcHL3F2zs1EEXSNKzbN9TkWfgdgmNNaZ4WWB0N466idbAqNAvUI
DSuKo/iIb/vJnuZilnJO++yDmhV0MCHmzoNr8dQBeCKdFv2zsRMbaZCaYsuvZ95T
jNSWjoYHsdXREOK2tNl6dIFt6xdMeVZ3fNdhKoY70RJLI8caymk897liNwJB2ScS
wDfUKvOmOjQL1J4TcwdqVpsGjfCLrMmL/tl1j7yoaF6vKYKHBBxHs5WWqfbToxEt
YZpJUHJfeEUh6ERvALA25xX1+7lqDSiTPaqzBsOHGv0lSca8n10/9sZK0Fnj1GOG
17FbG0PJyBRDOnmJRQO29mh7ZQzObyGUlmDiF4dXB9GEnX2ykTkUtiKx7Jo9JD8v
O4K4Kj699xHEP51eUJ47PGTY8wZvz+LPP9GJnpJoKSM937kAB+mFumLLo+pAXAVv
z/ShZ03NqHLiWQ+8vWCQ+IGEwbtHPQfTNEgIDPrVMvW/IDUK6Ji5flbQ8RTT43nU
2Tc5KHK02tM6Nm+3/zRuejeok1OpNRrXu4CDJyz6W7RFIrpLZ+SOSRlUGJ4VxhKW
ZY/PD5uAuvFKrNv5jxTkZryIv6+3pBvmFdxD2jQehx+NWsQG9fksfR8yixTFKYg6
rkMeOhVl/ZdyY2iimElVOt0cU5I5TjDKmc4jGq+GiVKhfxaC76gf4bVjMuys62d9
D1UuzaF5XLU0HQV4Z0Tr2C08Qyvf6osWnoY/DfEtfEwFj0mDmPX0fEJBBb2LCyGv
ckus6lruJXNV9SleZZ7Y0MycxIfc6xqA880qptVOvT67O9XlfZ+wDJBPrldGgws0
3sIXBHLOm57RKwArautNuAOQccBmgNhtYt5ZEYQwRU2Vcxhh4wHYqzJKPB3Ar3Du
kV+4B1/ndG+42KyOZGk1gKxTRsS0ERApDJUdFBemTpaPjvRO40y4hmmYrQamhsr9
A0vh6vaLZVK26RvhieXXM6yQ+dV06vovN8k44dpK0jj5O6+BPDc5gzKlRukuW5sT
cH3Hcg5nbW2iZcixHgnguYQwl/1hC8Rst6wfS/Q8eHoaqNlCDQj4NBDJ6SCwX+Wd
mv4UJmxMdf1Cu9I9dj7bw+IGsg3E4FgXYR5aqkiP8mLJth1diYQIK8wliBl9/5Xw
Nu7bST/afMtV2eCgypQlFEd+b2ovYBB3fr/wpLTzkFEvWk++EMqRlHZt6xa30zpL
HP0aL91SVDH77Wvsp3kOry6uvYwBQaQmKpDke9CzJs9Cdq/L1YR7j9NY34VsqWQa
oDhcY9E/m6EsqHwKeuyHmXM8hqKyqsQdWnY+mkkqbk3yOwPOF3dTMZyEdUz+Qj+d
gdT1vXCDlzS4lhI0BCb4G87gEJfnWYh3zhhrVZLKnKb4rCAF7JtFbdR2LgUD8cNw
5zDRLRd6ZKNd/h2N1fYhW2UmhnA6r7EPJ+7o7L1uShF3Lh0BQmUMIqb6YbsD8cM4
GF18N0jUUIjYMfdhKBBCaSc6hn7/lWFvRB8o6fY26uJHKIIdQTcfOHMHWxB4txsZ
Ziu5IbBbOnGau+9vznDMcIuu7Ew9EFROc+n8IgfeNDfLy+XkqaKQN/7Gf7IyCvHc
9vsPqp1evpDQ/OosTCBfp/d2bJqp9Lx6SXsGburxuD49JjXyFOqyHaz2Q1SzxRfv
dggW9KDYvoEVJiXGlvgU1Skpxrt8vc/XV2XmRSVjPnoqXpCep+okp5KVaRSVPR1+
wvYIYIPr9MtK1mRRm0GBHlvZjl/5TEgr6f/mBvDbGsG6dSIIO6EmVyAK+x63d9/h
okmZsDwxGQ+P8Zb0J5d6p2cBS7fnSbPRN64oHaRLVCNGPs6KLTluWQNEVtpbxW6J
VgRBnEzG7/Kler7X68xLdF6hkdCllnPGkxBWn0qaFwGmuLaqEkHYj19f3IvkeIpp
e1fqRf/j2gON1qWA7Pe/9eOEmdCV6iQKK4N8FfEBK1l6DJ9z/0KYQF6mDEpBtdck
cw8VGF/JHu+k3KC7VMVBHU/XBbG5RUwDSltuzzLKxgSXVQiKBNK1/R8z2T3QkHkn
75G8IKArvPg53enwwybwhQhHhw0AsAWsFLM5fqicY6SeaxVFgf5G0vkeLRA0hQ9u
2brSphkICQ/iiUsO9kBBCOWP+O9ZszEIxyLkiEMT/Oih1KNH9H5tALkHeIsdO97d
ee0iMVwCxXxsp4ObZTTMiCqgV/1CnuD2z2tpr+iBO4pRiPQrhE+ShwBeklCrFhzZ
p+P+xe5jMbaunfla1/3AVx8HJRFnoU5QG7mHwVIrqsFsAVoHPUbg+4HffnPpbhki
7IEJZh8k/kvKty/izeJSPFBoPmZV8aMoG7b03UNl32kGiB6GTpBexiHMLe2F7/3P
Ye6t+36JTPRsb2JvzngppAT+6nnovRBCtkkpmD5dklaG/NzorbnCC4IqpyhDw/Im
j87jyFoRm4YfOHOj6ru/g6EX3W0qausCRx9XXvxWauAw07j46sph+R1XpJmzJ61k
re8GxLTRNINYDNl8ERHyGUTpai+nxuVHrisoTAxXEM6RUAgkOOT//xg9bGYfuFYA
lyY+As9ziKpOXYRFarSg4lmdq9r01yAaJj3D2+HPvUv0FOYjxKqsCega2SZvzsAf
wywx3VSkzaYsguOIvhcA+0kcAabaDgbdhtsw1UaB44K3M4NzuhhtxOxXX5uh5uwm
QIHgalg7rHQQy21KQFoWK72mn4RL5bD+mXvFXYcAstoS+3SLFd/TsiVS87fbRSQM
sgXmXbjAPqSwJywqsehjBp/Dh7UTLTLj3n+Ibu3m9Qlk/5rpPIG32LTUe/TQncBB
asiOo+UD1sI9E2fMMYwlp8hS88tmyc3B1w+Xf/62qkTBEBnR2UlS/p/1ek6sBUa2
bhgYHR1rmu1mIG1TgVBuDQX4arsYsmtMNqhaPJ40GXqebzqqAy4/OMad8JO1HnNm
ZMtHdNZ83SoYjpOpL2LVwCeeGbOBvU7jTm/pMJMiYlzTvGLcyXcT7dyZ6XdC9VaW
d2TchledzSG8YpZjQ9rWm8bYE4p7yjaL+gtysQfUGrszSAA+g8v7186BVTgpxx7U
hVczaysn1rREtGwfTDLu8VurwWtPxtzuXfOv4WYuWv83edF0w68GT9WUv/Wx3BQp
PZ6lZYK6UDay8XrSGWNGJtoghc3pdDgk21TYBqeVUyKky+ijIc0Ymt3zk0S78W3Z
E4jwlMbxo7F9bgrBchCB2HrOIje5SdbM3STfr4iEArsoEqHnBX1Us4/60UVHCSmb
nL94q+JBVpUXKfMrNQY+RId7+sdgaROsDp/5nNnAiOezCyOdl1lCr9t11AyWTdX/
OqSJQXGq/OgosuN5DJbCTvIKpRBqtHuTp66GoH1mnf5ubtIzyFdbsKjlsE9zY87w
tkvCdlVMOHMDSX7U/Teu6n/DikcliaHSz4y48qjj3K86wWtxdcr35j2K/P/ht5OG
XwPa08iXEx29IhbU9HIX1/MHiEN2n4Nilx7HyFZaj8DRbxp9ldfL+/RKC61HCI3y
vhXQJy2ulmUljJyVu4a+fuqNlCHoFZFOh/8VN0tzKUd2M5Pugl7fzHxdiFDwyMb+
bUjwrpbOMLNxNI5CUP49nzfDHPAzGvl5npAUdjZ0r+1ZsL0CST91vTdc+6ooQvGI
UTAR6Im5EFpbGbzWdNmPbSyLGvrhM/Ov/5ytC34w1mDL8zF02klQ/jIS2d3RL7qa
Cmy0XiIjOe7W2vIQfdVMuZc02U7H82kTPPtLwNx1/mF/DCcN34Eru4GO9/oHqRi1
rougapBcQv/Npu92whSYKJ8DwdCQOhAVzsj3SOfg9Znnbwepg4NNqaqgzlsLOf9Q
Nr9EIAF3sW6tRynF5u3KJBMvZqLfZVaHFYQn17HP18jCsWAIy/fJvKq/b4LuPrcv
nOlPq44fOFSgwnaagqYnCvDbGmZoopLdu9z2yrckLTWQ+k1TIpwANZfeuUXVp7Df
wGeaoboGmIfLh/ffm9IAB3Z/y1RtQ//XE90XsvnGod5r+RF/NawO1IaBf4uCUOuj
TiQeuPIm50ndkAJgM2Vf7aBcaCbkXUE4BXFyEUfG+6ZvlxZWveO9e/TFRFa9WTEk
6EDm3RP6ZvYMbQeJtwrm/9lTWMQ5pL39PY6WKib+0MX2r2JP1bDAwg3Nipv825dD
xxs8Se5x/YFI/EyVw4MHUHyfcB6dlVidFRjF33Su+T3qLr308+KuEXLwU0MflLIT
CnKJWBeceBsjPWoAbALvallxkG7VEIIRbJwKpOPMDG9Vjo+sEZjvM74bDptTagEL
aUpWpf2FoSf7iKHEYA/WW3FmjoH3NN4k+IqrKxhtpjYzeahfWnwgGJPym48PV9ac
7B5tUARuLkVQt6FGoojAZtBdA9jL799M3jA/qM6AQri3wBmANilUhN+VJgf8Nsd0
2jFviWW8FCpD3B0gyqHcDCQO9xhsDYBGZOO5QuDhbCLVNwM7L4jhKRXkz1R22j8+
d/o1PL1tFxuREm6EtqDFO53z8JAtnx660UVg+uAS1ouaSf3BYJPjUmHh3BKUMtCo
4fkFqS8NAbDfdf2o+MDoraeR0bBlPZjuMYwDOsvHWX6LaraQQ+YA54x2CXbsiFrC
PcGbw/WKnPi1w04CHwyO3oH+1F3o4x6kkDlbj5alGxhWBNM0Uzh6vHXggegR6usA
44grDvcNf+HjWLaDcLHQg9ijNlEcs8qr9H5H283th+TEPXuwxWt8KVez6OEFtK0O
TFDNUVemd/RxUSIx+hoiDEuXu+cwn/5+qJIt9TS3KgmXpEKRTeEWYjIGrgWeTzJ8
XultOHuLmku5Xl2apQ849SBxkxbrrtcf5FWZHGYBkI2BGN58pQAkWnQV6S3ySxIg
35Y+RlopzcmhpGTLgKj1w1tWfoPsWyILjlJGMnGzeO52/UCoK0xGSrskqGgkP8vj
T+dPRrC1iz4XW4eEB/pikXjgKB3fQOCa0JnQmBmNJIkdPCSx+F4+mU20NG8K1h2U
S+HK8z3rY909E1CH1tM2Ohx+x/OEil5gQC5iwiRXg3eiN5CA5BXD59Cxw+Y3uxzi
qY0aiNBP1LaCA61d+Gkb97Wwkvl1rJSH53Nrh8Bd7DXqQg4GX6waeBZu60RWSb2U
h/JJkk2GTgLAk/4zH+c5/vdw2L5+LfXQ4YMABuE/V1659F0XpPssNGeOD1vA4hYa
4lVSAIFxPOknQyJxS6acZ8g/8Cc8Y+eBZDMccyrSon7JkT5vQJa4/yrTxV5D1l6e
zTVF/A9AcybyTHG4DsAKJEvd8ZoGPhh6aag4WO3GJquqJU8P2esTjtmXuSo11mHR
C22fVJqMOMdy+nMggvJ9ylMLVxYrlU0cs1w4nnMLe04PL5iZB1nFOkyN471fQkFp
GK8oOYZCFJ7/Qht5dGFbPmah+5pX2/5+NypRabP4V30TE2Ace5dA/rHKs8X/WukZ
E2xoBZ++sPGY9GXNB3m3kc53ei7AgRiQieoQ+M26goGPrIS3Y9pYeYipf3b65OE9
YcGwgKQJ5TLqdnZUpD+JTrWH/8HX/zOsJVPDgjr3thTdJaKfP0fKy880KpJklzcx
ECKn9wDxSb1udj7Rf2ot3FThYBdlVFxNEeoHrVzJ4puaHjmi8McQegzcTWAppjSE
yCofw7FpmhFu0Vn3tslH04jWhH8J5w1KvtUSCPUDF3BpBOGCF9miitxvK7JrqFop
c6gubBbitGHXZrDWaZUfxsnMKs+hx85LPdeF1/GPVu9oECrzbOA7+Nu2dsTkycpQ
CL/05oie0JbLCPVJzG3ViMeUzYeMdpjNcaMXgWWBrK1OaSAUNqpFF2L0+L8HidGv
2jJ8Q7mfGSKVys9vgVLQmsU45GP76lPmDLUKu6JsQeDjLeK8EohAe34npIKy5XEP
kGRjMG0FF7q1x2hEwsoCiJ0Md+w+YA42pGpful6UM+VjCxrUNhJiOckDt+299hbm
sHJf/R13ApqirKW6uATZ2//wS7ImA0JPSQ9VjCD1jgGaJht9MXd2FANu5YswnSQ9
/+D6cfWh89hgQyDbNtWxd2Ic0MOgCkXZYak/0R5xfVKwwFM2JvzK9Y6PGDwUxSNo
NTvlOpO6c46zCYCJBOYrqWpyDZ/9DmjgUwltt077xEHNYQdTOu0qJaezqryBg6oz
LG6mEBaycMNxSzj3j+2FVob+Fh1JxtB8PRxIgt5nrqgmFgMKWQrh/qBIsa3T2/mX
Bg5n4Ys8CsH9yTUhVpztsLCdYUOuXI8lSOoDXsSu+JFoyxEO6+2lYmaqJHjv4f9e
vY4WvbPHe7tQvi55CN7ptufUfqcUP7p5whZ40NcGVKgMyyrrFJir05sDV6oKDViE
uHWAWpRLwSzIT/vPTsx/7MjGOo5LJcWZH2GmLhkJebzDKEKYLB1+xHRLtpxhJz/n
dtqGOECAI7MBtgMgADLpML1w1dvMa5hkrX9Pc5b/aov3n6w81mkAFRMuhq5bG6Sd
InoUmRBC94NR5LW1Ez4KGfNg9UrYC3k612BWSlPiXrNLTYbgf/my1K0KHFdwCyTp
YkOPBA0d0H7vWZiObJKJ7xHc5ZWSZhLHWLVTJ1EPaBmdKso+mwQQ0JD3SN6JzsI2
Mbop435ZYdtkHbh99TPMgy510eAg5vsQAi7nJADqEHL4V/IVThShqaTeCq35eBV6
a8wmcSzt1hTEdgb1SHDkEnljXLd+kk73xw1wB4Lzxyz6sQ/u2ZURXfimovU6PR05
W04Ew14iTg1A+tMQQGRXUZpZcxr3cveEzvxlopUA0hUi+3jasvzYhXH2/zCsBT5z
4JXJnZ1Gtjj5dz41Gp6qcBVOn7/FumZnQLHIl2sF1ln0Vi/S7XWYioN9AIW0oPLy
HZ4ajm+2Y02JymI1DqU6iAaQV+sD6V6FqQoFnxSF7o3mWZSX5hwZnKf1zdQUG9iU
WiVQtV6hJfcjahHxpdBkwjZ1bGeRWrHj3oRm4TATy5mUt1xkzpbSFtO2iCEMcIMF
6+UgTR6CKLKWWWdrDNFWHyufyMEcHmTDH8z6KFUArxkXZtKeIS4oEQ2D6yG+HpbC
SoMPnDWJ0+0YTYG70cCSdLwpnzriZCZ102YdZY9laJVp4npNoU+8ZwGpYzNaonLA
MLAkSEDAOelLmjIjw9kKxtmHEpsBP9y1qUbto9ayn+Y2dAi2YSxPgEiLbzKgv6sx
3f0KxYIE/a3714nVu5fG+GsmOXd4javfC7KrQX1E93bNglYvDNQgcWyicf7iV0go
F2r5DP+kqADYwfjqfDSB4ooQM5UnkHcO3VJWi+bAMatoBE8f0XOWXxKDcJFZQcle
vJBI8+fftOH3KLc+IePPnUFb4rCjI/BeEeVUPayLyW+vVoymemYfO3/pSb3qBKaq
vRzMJpE4Y9NljmVyLHKFqxEm9gh2/I+G0635VxBOldx0oqMzGyO1AgMQ7ZFZtR2f
qRTdY8BfnN3w2eiyrONumvx7MlxCIK1sxiwr4OTatDVuxIQmKsZxy37h9WEKaA9c
IQIP4pYnutb77TssVG2z56670pWFsGciHB0++w7eSnsRk3HWF3Bblykm5d9wwB1Q
M2ee7NYI9s6+TlmuAnYtE4UdMX/0KAUc7xfjHhp/1owV3HppoKa84VF6MWbGjS+R
+n+T9tu3p/FsH9nhjQ6hv/OIh211N+XYecQGltrnNZ3OGt5Mcu+3L0o3PZzSi/3c
3Nu5gu3z5aTlYqA7ROaZKNj5kmLdBvd2UYLRglL/DZk1NQtMGXC1nXum/MUke/af
RU17AL05XcUr033xpREgxqsWE4j325bvCTKUtTVAdFeQy2l+Fxhg2PdC5uRRJJrS
rXDbxJ0iQL8ZNIYNhxj4VCSh6qvoJD0Z83X3Lr+J7YyEiMgHcwitLtdiyOYPLr7b
Hu9KsWGPx2QfAMvvOWY6xeyk8qiCRFQoSQ5O8kcmhd9HHq4bnxCx0d94HGJY9fQL
hDVzW1k77HdT1pETjoIc9+K4nbNClaRGmJnf8cocTOvXGR5MBRnW66tqDPTXhOBB
Ttmv38R8hE9VgoHfJ4pAB1eDobRL8+iXekcfgv3C4CJ+FOO7TUXhGCECCopfecjh
n1KyNJuqQyLq44eqGPVZ/lRcnQyUFqGRkbbZCSiET6cT64Inmmj6gU9xYHKriS8Q
VCaAUt6fdwrw4JoLLyR9z3FFeVezY6X3L4tpJqLlrHPCyCgVp4yxDo6WA7wGTD/W
CeEaL//9zoCuuhNi/sxpEEUHeFU1ecgmilVKXDKVJ+YFZz5IW9KB5NcJruLMOqS6
+fuvww2dN8UeCYJBd9yjJRbj5+JVFVKOu5LKERh8BuLcH6JaA1XY6J61M+NbYA0k
fXj4o1a20BH4aZr0cNWdoTC3EIV7cd+7F9Rz+Y1L+Fxja9y0FcIW//s0VlgLf89s
5Rbna/NjJgdcro41JmsDPk4ApVsZrrQxcD7JLTFrc9+RJRkBHXxmbRsapj4Hk5P1
fxsuygTnAL+474OK4OLchW0nbwVK/4w5Tx6nSMfaQANP/UqoT4hVHcNUz5WONu1T
pKi7diDp4suRzS5CC9dMKTAHIPlghrHzzMvH98PJf+Mc5zlP2ofa9FGhlFxGIZJr
38s2vkyavBwCxRP7XFllbBXUJILJk6/CKuiTpJBh6oMuA2u6ShaA+Gxap3HqSzXp
bxTqszO8hk+uwQ+i1TGrXeGyYeP8O1aNhwGw9zy0ww2rNqoJjFB31lrerB7daPGS
8cZx6bQGnu8yPKv0h3O+QvgKZp5pVJFvcW+XDLvm6VSo47Y8ofdtU5wKQHJl3hhK
0ye0bDr7n+GFYtLOTfTSuUCUHM4AWORNGKbpJJu0Ubxkox5Vxq8hd/qdQQg04Hv6
yEI916zUpFrz8I2whN9OWZesiFNAHBhUoJh39jqZX8GMuxgajsLre8yquzhOw/5t
eRFIhHyq/r3/w/m30dBHRiOO/EGqx5I6yl6yTcKpWpkdyyw/qumfeA3VSXRGc97e
gGlIVHBKTfMMv709CSSKCGkzrzVbsuH7QbyMumwGnhl8G+aG51iXM/7hMAcwz5fp
qzBsaWMvMsKhrgafyjwSG9rI9ZelZlw0Kq/CtlofGrRDucrR22KbrPltvPuQSrX9
7389sihhBjiuBQPUF87sNH2boLFXGEk1hGseG6/sSjk5q8gZ4Pl8vCtP1l4qurPN
LuQkrgQiY9okn4JeRmxBPXNLXxuCigr+VMFuVGQKeM6pDmB/shLWMHVLLepUyUiS
K+U+EQzgFoMZOO9bkI0R/4Qgk4W5opLYLZPOHUIoQONxqGWg4A6X8s74P3gU0pLG
pCAZg2prE2T2Fy0+tLdk6FrPa4ckWF+biu9pijTK4iRU1VOp8GL8zN/Hpy7xpDmh
+aXAmIGyHONvaTznd4kgyDujg2ar0X6lMpvyJa22DNTg2l2vV5dJicJmtBct6wGm
VOCQqYgMv7S3UHz0tjZ59t5jhi04uUJqcMbpbumGBQY=
`pragma protect end_protected
// -----------------------------------------------------------------------------

`endif // SVT_EXCLUDE_VCAP

`endif // GUARD_SVT_VCAP_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
RGAOttD+ewWy7A2wZxhThTYeHiAbPGKwpNF0s83UzD0vixEfHMvpPxoqUa6T/rpc
OkHqOyL4VydPZANtMbzhelFDM3UmN0dRf2Jwj5pvAh22GqfT2kAlQEKOW/ztefsH
kj4cpAO+3Zjge22b+7DhMvfW4z4mNEEY+oeVpr79VRY=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 11241     )
W2yiyjMEpoOqcAuLyS2vFsJhUTFv1Rt8wNQzHFgj6mt416cyBAUeokmjGRelJ/7J
7mn20almT2toSFDLupjdIY9RcrfKrqTJfZQ5SdAIYfQR2Sre07U6rjaQXKnjAgSE
`pragma protect end_protected
