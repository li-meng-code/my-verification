//--------------------------------------------------------------------------
// COPYRIGHT (C) 2021 SYNOPSYS INC.
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

`ifndef GUARD_SVT_TRAFFIC_ARBITER_SV
`define GUARD_SVT_TRAFFIC_ARBITER_SV

/**
 * Traffic arbiter class that arbitrates between the traffic transactions 
 * that it retreives from the traffic profiles. This class calls the DPIs
 * that process the traffic profile xml files. The values returned by the DPIs
 * are used to populate svt_traffic_profile_transaction objects. When all
 * traffic profiles are retreived, the arbiter arbitrates between the traffic
 * transactions 
 */
class svt_traffic_arbiter extends svt_component;

  /** Event pool for all the input events across all traffic profiles */
  svt_event_pool input_event_pool;

  /** Event pool for all the output events across all traffic profiles */
  svt_event_pool output_event_pool;

`ifdef SVT_UVM_TECHNOLOGY
  /** Fifo into which traffic profile transactions are put */ 
  uvm_tlm_fifo#(svt_traffic_profile_transaction)  traffic_profile_fifo;
`elsif SVT_OVM_TECHNOLOGY
  tlm_fifo#(svt_traffic_profile_transaction) traffic_profile_fifo;
`else
   // Currently does not support VMM 
`endif

  /** Queue with profiles of current group */
  protected svt_traffic_profile_transaction curr_group_xact_q[$];

  /** Queue of write fifo rate control configs */
  protected svt_fifo_rate_control_configuration write_fifo_rate_control_configs[$];

  /** Queue of read fifo rate control configs */
  protected svt_fifo_rate_control_configuration read_fifo_rate_control_configs[$];

  /** Queue of traffic profile transactions from all components */
  protected svt_traffic_profile_transaction traffic_q[$];

  /** Wrapper for calls to DPI implementation of VCAP methods */
  local static svt_vcap vcap_dpi_wrapper;

  `svt_xvm_component_utils(svt_traffic_arbiter)

  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new component instance, passing the appropriate argument
   * values to the uvm_component parent class.
   *
   * @param name Instance name
   * 
   * @param parent Handle to the hierarchical parent
   */
  extern function new(string name = "svt_traffic_arbiter", `SVT_XVM(component) parent = null);

  // ---------------------------------------------------------------------------
`ifdef SVT_UVM_TECHNOLOGY
  /** UVM build phase */
  extern virtual function void build_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  /** OVM build phase */
  extern virtual function void build();
`endif

  // ---------------------------------------------------------------------------
`ifdef SVT_UVM_TECHNOLOGY
  /** UVM run phase */
  extern virtual task run_phase(uvm_phase phase);
`elsif SVT_OVM_TECHNOLOGY
  /** OVM run phase */
  extern virtual task run();
`endif

  // ---------------------------------------------------------------------------
  /** Gets the handle to the VCAP DPI wrapper */
  extern function svt_vcap get_vcap_dpi_wrapper();

  // ---------------------------------------------------------------------------
  /** Gets traffic transactions through DPI 
   * The DPI gets the inputs as a byte stream from the traffic profile file
   * The byte stream is unpacked into traffic profile, synchronization and fifo control information
   */
  extern task get_traffic_transactions();

  // ---------------------------------------------------------------------------
  /** 
   * Adds synchronization data to the traffic profile transaction 
   * @param xact The traffic profile transaction to which synchronization data must be added
   * @param group_name The group to which this traffic profile transaction belongs
   * @param group_seq_number The group sequence number corresponding to the group to which this class belongs 
   */
  extern task add_synchronization_data(svt_traffic_profile_transaction xact,string group_name, int group_seq_number);

  // ---------------------------------------------------------------------------
  /** Starts traffic based on the received traffic profile transactions 
   * Send traffic profile objects to the layering sequence
   * Traffic transactions are sent in groups. One group is sent
   * after all xacts of the previous group is complete.
   * 1. Get traffic objects with the current group sequence number,
   * basically get all the objects within a group
   * 2. Send transactions and wait until all transactions of that group end
   * 3. Repeat the process for the next group
   */
  extern task svt_start_traffic();

  // ---------------------------------------------------------------------------
  /** 
   * Tracks the output event corresponding to ev_str 
   * Wait for an output event to be triggered on a transaction
   * When it triggers, get a list of transactions which has the same
   * event as an input event (ie, these transactions wait on the event before 
   * they get started)
   * @param ev_str The string corresponding to the output event on which this task must wait
   * @param xact The transaction on which tracking of output event must be done
   */
  extern task track_output_event(string ev_str, svt_traffic_profile_transaction xact);

  // ---------------------------------------------------------------------------
  /** 
   * Gets the xacts with the event corresponding to ev_str as an input event 
   * @param ev_str The string corresponding to the input event
   * @param input_xact_for_output_event_q The list of transactions which have ev_str as an input event
   */
  extern function void get_input_xacts_for_output_event(string ev_str, output svt_traffic_profile_transaction input_xact_for_output_event_q[$]);

  // ---------------------------------------------------------------------------
  /** 
   * Sends traffic transaction 
   * @param xact Handle to the transaction that must be sent
   * @param item_done Indicates that the transaction is put into the output FIFO
   */
  extern task send_traffic_transaction(svt_traffic_profile_transaction xact, ref bit item_done);

  // ---------------------------------------------------------------------------
  /** Waits for any of the input events in the transaction to be triggered */
  extern task wait_for_input_event(svt_traffic_profile_transaction xact);

  // ---------------------------------------------------------------------------
  /** 
   * Gets the WRITE FIFO rate control configuration with a given group_seq_number 
   * @param group_seq_number The group sequence number for which the WRITE FIFO rate control configurations must be retreived
   * @param rate_control_configs The list of WRITE FIFO rate control configurations corresponding to the group sequence number
   */
  extern function bit get_write_fifo_rate_control_configs(int group_seq_number, output svt_fifo_rate_control_configuration rate_control_configs[$]);

  // ---------------------------------------------------------------------------
  /** 
   * Gets the READ FIFO rate control configuration with a given group_seq_number 
   * @param group_seq_number The group sequence number for which the READ FIFO rate control configurations must be retreived
   * @param rate_control_configs The list of WRITE FIFO rate control configurations corresponding to the group sequence number
   */
  extern function bit get_read_fifo_rate_control_configs(int group_seq_number, output svt_fifo_rate_control_configuration rate_control_configs[$]);
  // ---------------------------------------------------------------------------

  /**
   * Gets the resource profiles corresponding to a sequencer and adds it to the internal data structure
   * @param group_seq_number The sequence number corresponding to the group of this sequencer
   * @param group_name The name of the group corresponding to the sequencer
   * @param sequencer_full_name The full name of the sequencer 
   * @param sequencer_name The name of the sequencer 
   */
  extern virtual task get_resource_profiles_of_sequencer(int group_seq_number, string group_name, string sequencer_full_name, string sequencer_name);

  // ---------------------------------------------------------------------------
  /**
   * Gets the traffic profiles corresponding to a sequencer and adds it to the interal data structure
   * @param group_seq_number The sequence number corresponding to the group of this sequencer
   * @param group_name The name of the group corresponding to the sequencer
   * @param sequencer_full_name The full name of the sequencer 
   * @param sequencer_name The name of the sequencer 
   */
  extern virtual task get_traffic_profiles_of_sequencer(int group_seq_number, string group_name, string sequencer_full_name, string sequencer_name);

  // ---------------------------------------------------------------------------
  /**
   * Gets the synchronisation profile corresponding to a group
   * @param group_seq_number The sequence number corresponding to the group of this sequencer
   * @param group_name The name of the group corresponding to the sequencer
   */
  extern virtual task get_group_synchronisation_spec(int group_seq_number, string group_name);

  //---------------------------------------------------------------------------------------
  /**
   * Gets the name of the current group
   * @param group_name Name of the current group
   * @output Returns 0 if there are no more groups to retreive, else returns 1
   */
  extern virtual function int get_group(output string group_name);
  
  // ---------------------------------------------------------------------------
  /**
   * Gets the name of the current sequencer 
   * @param inst_path Name of the instance to the current sequencer 
   * @param sequencer_name Name of the current sequencer
   * @output Returns 0 if there are no more sequencers to retreive, else returns 1
   */
  extern virtual function int get_sequencer(output string inst_path, output string sequencer_name);
  
  // ---------------------------------------------------------------------------
  /**
   * Gets the name of the current sequencer resource profile
   * @param path Name of the path to the current resource profile 
   * @output Returns 0 if there are no more sequencer profiles to retreive, else returns 1
   */
  extern virtual function int get_sequencer_resource_profile(output string path);
  
  // ---------------------------------------------------------------------------
  /**
   * Gets the total number of attributes to be retreived from the current
   * sequencer profile. 
   * @output Returns the number of attributes in the current sequencer profile 
   */
  extern virtual function int get_sequencer_resource_profile_attr_count();
  
  // ---------------------------------------------------------------------------
  /**
   * Gets the next name-value pair from the sequencer resource profile 
   * @param rate_cfg Handle to the resource profile configuration
   * @param name Name of the resource profile attribute
   * @param value The value retreived for the resource profile attribute
   * @output Returns 0 if there are no more values to be retreived, else returns 1. 
   */
  extern virtual function int get_sequencer_resource_profile_attr(svt_fifo_rate_control_configuration rate_cfg, output string name, output bit[1023:0] value);
  
  // ---------------------------------------------------------------------------
  /**
   * Gets the next traffic profile
   * @param path Path to the traffic profile
   * @param profile_name Name of the traffic profile
   * @param component The sequencer corresponding to the traffic profile
   * @param protocol The protocol corresponding to the profile
   */
  extern virtual function int get_traffic_profile(output string path, output string profile_name, output string component, output string protocol);
  
  // ---------------------------------------------------------------------------
  /**
   * Gets the total number of attributes to be retreived from the
   * current traffic profile.
   * @output Returns the number of attributes in the current traffic profile 
   */
  extern virtual function int get_traffic_profile_attr_count();
  
  // ---------------------------------------------------------------------------
  /**
   * Gets the next name-value pair from the traffic profile 
   * @output Returns 0 if there are no more values to be retreived, else returns 1. 
   */
  extern virtual function int get_traffic_profile_attr(svt_traffic_profile_transaction xact, output string name, output bit[1023:0] value);
  
  // ---------------------------------------------------------------------------
  /**
   * Gets the next traffic resource profile
   * @param path Path to the traffic resource profile
   * @output Returns 0 if there are no more profiles to be retreived, else returns 1. 
   */
  extern virtual function int get_traffic_resource_profile(output string path);
  
  // ---------------------------------------------------------------------------
  /**
   * Gets the total number of attributes to be retreived from the
   * current traffic resource profile.
   * @output Returns the number of attributes in the current traffic resource profile 
   */
  extern virtual function int get_traffic_resource_profile_attr_count();
  
  // ---------------------------------------------------------------------------
  /**
   * Gets the next name-value pair from the traffic resource profile 
   * @output Returns 0 if there are no more values to be retreived, else returns 1. 
   */
  extern virtual function int get_traffic_resource_profile_attr(svt_traffic_profile_transaction xact, output string name, output bit[1023:0] value);
  
  // ---------------------------------------------------------------------------
  /**
   * Gets the next synchronization spec 
   * @output Returns 0 if there are no more synchronization specs to be retreived, else returns 1. 
   */
  extern virtual function int get_synchronization_spec();
  
  // ---------------------------------------------------------------------------
  /**
   * Gets the synchronization spec input events
   * @param event_name Name of the event
   * @param sequencer_name Name of the sequencer corresponding to the event
   * @param traffic_profile_name Name of the traffic profile corresponding to the event
   */
  extern virtual function int get_synchronization_spec_input_event(output string event_name,
                                                                   output string sequencer_name,
                                                                   output string traffic_profile_name);
  
  // ---------------------------------------------------------------------------
  /**
   * Gets the synchronization spec output events
   * @param event_name Name of the event
   * @param sequencer_name Name of the sequencer corresponding to the event
   * @param traffic_profile_name Name of the traffic profile corresponding to the event
   * @param output_event_type Indicates type of the output event.
   */
  extern virtual function int get_synchronization_spec_output_event(output string event_name,
                                                                    output string sequencer_name,
                                                                    output string traffic_profile_name,
                                                                    output string output_event_type,
                                                                    output string frame_size,
                                                                    output string frame_time);
  //---------------------------------------------------------------------------------------
  /**
   * Creates the correct type of protocol transaction based on the
   * protocol field argument
   * @param protocol String indicating the protocol
   * @output New transaction handle of type corresponding to protocol
   */
  extern virtual function svt_traffic_profile_transaction create_traffic_profile_transaction(string protocol);

  //---------------------------------------------------------------------------------------
endclass

//==============================================================================

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
w9E2Poga+XCt0a7pwO4dwKFxly5cNabYQajhRD6ryrer2rcaAQ7UbkVoHnsnykN2
w//KYPmafnRQ9ZRYN+gFwQy48POfKLFG3hXNVjf/qASMe8YSSQ7VbHodRt3lbsuu
pFojO8Jk7Zd5HC0/IxEE2GGqPZFQugUtAg7IPOTwIhw3+cX/MsBndQ==
//pragma protect end_key_block
//pragma protect digest_block
vcx+PcmxvXcTlbchna2FjYCvUFc=
//pragma protect end_digest_block
//pragma protect data_block
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

//pragma protect end_data_block
//pragma protect digest_block
d9Hp/y0B/Jw+IYm6rCXqPVY5A58=
//pragma protect end_digest_block
//pragma protect end_protected
`endif

