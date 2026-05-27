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
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
6FrdaBzD1amZfBrHuVn23Z1xmakowDe49bxoJY91MlVRGPtXTfya2uuqrKOUJpif
TlI/wRncBkA2e4k2dYR5Gd3g4lu0gWmUjQS//FprWE9vzfyxTYNUF4SuQFMQMSrt
qEPWzfoyoAaflvza+U+HKozYUzYnaCxEDnK1guSPu3IbQaeNkVlZig==
//pragma protect end_key_block
//pragma protect digest_block
qh+54IFj9bVHQbskvY/1yUGPbak=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
KGx6LxIy0esQPoQOGk5K2uxjdVA=
//pragma protect end_digest_block
//pragma protect end_protected
// -----------------------------------------------------------------------------

`endif // SVT_EXCLUDE_VCAP

`endif // GUARD_SVT_VCAP_SV
