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

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
G174W5YCNv7l8cBGwrv/bp8ZJ8GYyhkduIwK2/AQOLHSZeje2J5UJyvnzedJ2Kul
LzAlxuJCgEZgoIJ51QLBjBVZVY2SGoVDXos6vmHG0A3lV6JhD6prmkyPOUgxjNnx
aRA0NCSq8Yf4Jkc3vaGxb1tbynNvunOk0vWGSaJXZ8E=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 29113     )
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
`pragma protect end_protected
`endif

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
BhMe09rllH7xLLJj4QkZz7DJ3dtJNKUSDqGKY3tgaJMthllaUMcQZ7jWi6t+U5lo
RWha5sS4z1bqQ8rZMSG8Inc8rd2h5YlQ7aAZH+e2nw/WmXm/J2oa9IWhHM3KDnqv
Sursf3QIHEcONshsgRQwTQoN+F2gsvngYKFemxaYFvg=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 29196     )
VZDxtwy6WGY+3Gb+aJORtMhv7Q/AsDRh+3NxNpSvu0FRBgBVhQbEPlwI5ILqxbrL
/o1v+legKVnOxAyAIQVHl0+2Mio00itVSjwCyjwSd9psJC9Ibl7dppzDD2J4j1/m
`pragma protect end_protected
