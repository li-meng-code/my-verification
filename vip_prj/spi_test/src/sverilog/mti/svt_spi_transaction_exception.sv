
`ifndef GUARD_SVT_SPI_TRANSACTION_EXCEPTION_SV
`define GUARD_SVT_SPI_TRANSACTION_EXCEPTION_SV

typedef class svt_spi_transaction;

// =============================================================================
/**
 * This class is the foundation <i>exception</i> descriptor for SPI
 * transactions. The exceptions are errors that may be introduced into
 * transactions, for the purpose of testing how the connected port of
 * a DUT responds.<p>
 * <p>
 * The ultimate goal of this class is to describe an error on a
 * transaction in the following terms:
 * <ul>
 *  <li>Which Signal is Affected</li>
 *  <li>Which Bit(s) of the Signal is(are) Affected</li>
 * </ul>
 * To accomplish this, a top-down abstraction-driven approach is used
 * to define the error. The error definition is based on the idea that
 * errors may be broadly classified as <i>Control</i> errors, or <i>Content</i>
 * errors. This class defines basic error <i>kind</i> abstractions, as follows:
 * <dl>
 *  <dt><b>Control Error</b></dt>
 *  <dd>Error which affects a signal that involves the control state machine
 *      of the transaction, but not its content.</dd>
 *  <dt><b>Content Error</b></dt>
 *  <dd>Error which affects a signal that is part of the data content
 *      of the transaction, but not its control. Errors of this type should
 *      be transparent to the SPI Protocol, but may affect higher level
 *      protocols.</dd>
 * <dl>
 * When an object of this class is randomized, the basic error <i>error_kind</i>
 * is selected first (defined by the value of the <b>error_kind</b> property).
 * Then an error-subtype is selected if applicable (defined by the value
 * of the <b>content_error</b> or <b>control_error</b> field). Once these
 * selections have been made, the signal to be affected, and which bits of
 * that signal are affected is determined, using a bit-wise masked overlay
 * of the values of the <b>error_mask</b>, and <b>error_val</b> properties.
 * Each '1' bit in the mask represents a bit position for which the value
 * of the error value will replace the original value in the transaction.
 * <p><p>
 * This class has built-in constraints to cause a randomized object
 * of this type to select valid error kinds, signals, and bits, given
 * a known configuration and transaction. However, it is understood that
 * this may not meet all needs. As such, this class supports an additional
 * mechanism for user extension. The <b>error_kind</b> value may be set (or
 * constrained) to <b>USER_DEFINED_ERROR</b> (in addition to the fundamental
 * error <i>kinds</i>). This has special meaning and effects, as follows:
 * <p><p>
 * Built-in constraints for tiered selection of error description
 * property values are bypassed. The user is responsible for
 * implementing their own constraints, which should be
 * conditional (i.e. only applied when <b>error_kind == USER_DEFINED_ERROR</b>).
 * Within the user's constraints ultimate goal should be to select a
 * <b>affected_signal</b>, <b>error_mask</b>, and
 * <b>error_val</b>, as these properties determine the effect
 * of the error injection. The user's constraints may also be used to
 * cause an error subtype to affect a signal that it ordinarily wouldn't.
 * For example, the constraints could force <b>content_error</b>
 * to <b>CONTENT_INJECT_X_ERROR</b>, while at the same time forcing
 * <b>affected_signal</b> to <b>cmd</b>. The result would be that
 * the VIP SPI Tx will occasionaly inject X's on randomly chosen bits
 * of <b>cmd</b>. Since in the built-in constraints, <b>cmd</b> is only
 * selected if the error kind is <b>CONTROL_ERROR</b>, and since
 * X-injection is not a type of control error, this user-defined
 * error has an effect not normally supported by the VIP.<p><p>
 * <b>Note:</b>When making use of <b>USER_DEFINED_ERROR</b> support, if
 * <b>control_error</b> and <b>content_error</b> are all constrained to their
 * <i>user-defined</i> values (i.e. <b>CONTROL_USER_DEFINED_ERROR</b> and
 * <b>CONTENT_USER_DEFINED_ERROR</b>, respectively) none of
 * this class' built-in error selection constraints are applies. The only
 * built-in constraints that apply are those that determine the affected
 * signal, and bits, based on the configuration (i.e. the built-in
 * constraints won't allow user-specified constraints to select a signal
 * that is not in the configuration, or bits outside the configured
 * width of a signal).<p><p>
 * Once the affected signal and signal bits are selected,
 * whether through the built-in constraints, or by the
 * <b>USER_DEFINED_ERROR</b> mechanism, the default (i.e. built-in)
 * error injection mechanisms will be applied to the signald
 * defined by the resulting values of the <b>affected_signal</b>,
 * <b>error_mask</b>, and <b>error_val</b> properties.
 * Please refer to the section on <b>Transaction Object Error
 * Injection</b>, below. For errors that are represented directly
 * by modifying the contents of the transaction descriptor,
 * this error injection takes place within the virtual method
 * <b>inject_error_into_xact()</b>. The user may optionally extend
 * or overload the <b>inject_error_into_xact()</b> method to implement
 * their own error injection efffect on the transaction object.
 * <b>Note:</b> If the user's constraints select an error subtype that
 * is covered in the <b>"Transactor Supported Error Injection"</b>
 * description below, the the transaction descriptor object should not
 * be modified in the <b>inject_error_into_xact()</b> method.
 * <p><p>
 * <b>Error Injection</b><p>
 * When an error is defined, it must them be injected into a transaction.
 * In the VIP there are two mechanisms that make this happen, as described
 * below...
 * <p>
 * <b>Transaction Object Error Injection</b><p>
 * For errors that do not require special handling, injection occurs by
 * this class modifying the contents of the transaction object itself.
 * the VIP transactor will then excute the transaction as it normally
 * would, based on the contents of the transaction object. All errors
 * possible are supported this way. However, for several special cases,
 * the VIP transactor must interpret and apply the error. Those
 * situations are described in the following section.
 * <p>
 * <b>Transactor Supported Error Injection</b><p>
 * Some error types/signals require special handling by the VIP
 * transactors, because they cannot be expressed directly in the
 * transaction object. In these cases, the transaction object is not
 * modified, but the transaction as executed by the VIP transactor is.
 * These cases are as follows:
 * <dl>
 *  <dt><b>CONTROL_ERROR</b></dt>
 *  <dd>This type of error causes the transactor to <i>supress</i>
 *      the affected control signal, forcing it to its inactive
 *      or default state when it should be active.</dd>
 *  <dt><b>CONTENT_ERROR : CONTENT_INJECT_X_ERROR</b></dt>
 *  <dd>This type of error causes the transactor to inject X values
 *      on the affected bits of the affected signal (as defined by
 *      the '1' bits in the <b>error_mask</b> property).</dd>
 * </dl>
 * <p>
 * <b>IMPORTANT</b><p>
 * If the user intends to take advantage of the <b>USER_DEFINED_ERROR</b>
 * capabilities of this class, it is important that the impact of the defined
 * solving order is understood. The <b>solve_order</b> constraint block in this
 * class specifies that the randomized variables be solved in the following
 * specific order:
 * <ul>
 *  <li><b>error_kind</b></li>
 *  <li><b>affected_signal</b></li>
 *  <li><b>affected_bit</b> + <b>error_mask</b></li>
 *  <li><b>error_val</b></li>
 * </ul>
 * As a result of this enforced solution order, if the user wishes to
 * spcifically constrain a property at one level, they must make sure
 * to constrain the properties at higher levels in the solve order to
 * be consistent with the desired lower level result.
 */
class svt_spi_transaction_exception extends svt_exception;

  //----------------------------------------------------------------------------
  // Enumerated Types
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Public Data Properties
  //----------------------------------------------------------------------------

  /** Handle to configuration, available for use by constraints. */ 
  svt_spi_configuration cfg = null;

  /** Handle to the transaction to which this exception applies, available for use by constraints. */ 
  svt_spi_transaction xact = null;

  //----------------------------------------------------------------------------
  // Random Data Properties
  //----------------------------------------------------------------------------
  /** 
   * Error enumerated type error_kind_enum: 
   * Select the appropriate error kind for inserting error. <br/>
   * Eg: To insert error type EMPSPI_INVALID_HEADER_BYTE select error_kind to EMPSPI_ERROR_KIND and empspi_error_kind to EMPSPI_INVALID_HEADER_BYTE.
   */
  typedef enum bit[2:0]
  {
    SPI_ERROR_KIND,/**< This error kind selects #spi_error_kind_enum */
    EMPSPI_ERROR_KIND,/**< This error kind selects #empspi_error_kind_enum */
    FLASH_ERROR_KIND,/**< This error kind selects #flash_error_kind_enum */
    SPI_SAFE_ERROR_KIND,/**< This error kind selects #spi_safe_error_kind_enum  */
    NO_OP_ERROR /**< This error kind selects no error */
  } error_kind_enum;

  /** Error enumerated type spi_error_kind_enum: */
  typedef enum bit[3:0]
  {
    SPI_OVERRIDE_IDLE_PHASE_TRISTATE,/**<
                             This error allows Master/Slave to override tristate('Z') with User Config Data in Idle Phase <br/>
                             after SS_N de-asserts. <br/>
                             Master starts driving this User Config Data after transmitting svt_spi_transaction::timer_idling_between_transfers (trans class). <br/>
                             Slave starts driving this User Config Data immediately after Clock Generation Stops. <br/>
                             The bus clock count after which User Config Data is driven on SPI Interface is in #exception_error_position, <br/>
                             the duration for which User Config Data is driven on SPI Interface is in #exception_error_duration <br/>
                             and User Config value is in #spi_override_idle_phase_tristate_error. <br/>
                             */
    SPI_OVERRIDE_WAIT_PHASE_TRISTATE,/**<
                             This error allows Master/Slave to override tristate('Z') with User Config Data in Wait Phase <br/>
                             after SS_N de-asserts. <br/>
                             The sclk count after which User Config Data is driven on SPI Interface is in #exception_error_position, <br/>
                             the duration for which User Config Data is driven on SPI Interface is in #exception_error_duration <br/>
                             and User Config value is in #spi_override_wait_phase_tristate_error. <br/>
                             */
    SPI_OVERRIDE_DATA_PHASE_TRISTATE,/**<
                             This error allows Master/Slave to override tristate('Z') with User Config Data in Data Phase <br/>
                             after SS_N de-asserts. <br/>
                             The sclk count after which User Config Data is driven on SPI Interface is in #exception_error_position, <br/>
                             the duration for which User Config Data is driven on SPI Interface is in #exception_error_duration <br/>
                             and User Config value is in #spi_override_data_phase_tristate_error. <br/>
                             */
    SPI_IDLE_PHASE_CLOCK_TOGGLE,/**<
                             This error allows Master to drive SCLK in Idle Phase after SS_N de-asserts. <br/>
                             Master starts driving this SCLK Data after transmitting svt_spi_transaction::timer_idling_between_transfers (trans class). <br/>
                             This exception is used in Master Mode Only since Master has the Clock control. <br/>
                             */
    SPI_LEADING_TIME_DEVIATION,/**
                                This Error type allows to model scenarios where Leading Time at SPI Interface is less than Minimum required Leading Time. <br/>  
                                The deviataion is captured through #leading_time_baud_rate_deviation_factor.
                               */
    SPI_TRAILING_TIME_DEVIATION,/**
                                 This Error type allows to model scenarios where Trailing Time at SPI Interface is less than Minimum required Trailing Time. <br/>  
                                 The deviataion is captured through #trailing_time_baud_rate_deviation_factor.
                                */
    SPI_IDLE_TIME_DEVIATION,/**
                             This Error type allows to model scenarios where IDLE Time at SPI Interface is less than Minimum required IDLE Time. <br/>  
                             The deviataion is captured through #idle_time_baud_rate_deviation_factor.
                             */
    SPI_NO_OP_ERROR
  } spi_error_kind_enum;

  /** Error enumerated type empspi_error_kind_enum: */
  typedef enum bit[1:0]
  {
    EMPSPI_DEASSERT_SPI_INT_IN_MIDDLE_OF_BYTE_TRANSFER = `SVT_SPI_EMPSPI_DEASSERT_SPI_INT_IN_MIDDLE_OF_BYTE_TRANSFER,/**<
                                                                     This error allows Slave to de-assert SPI_INT before its actual assertion i.e..<br/> 
                                                                     in middle of a byte transfer. This value can be programmed in terms of SCLK.
                                                                     This clock count after which SPI_INT to be de-asserted is in #empspi_deassert_spi_int_in_middle_of_byte_transfer_error <br/> 
                                                                     Applicable only for the Slave. <br/>
                                                                     Usage case as follows:<br/>
                                                                     Direct Write/Read frame is fired with SPI_INT de-assert in middle of byte transfer
                                                                     */
    EMPSPI_INVALID_HEADER_BYTE = `SVT_SPI_EMPSPI_INVALID_HEADER_BYTE,/**<
                                                                     This error corrupts the EMPSPI Header byte field of Direct Write and Direct Read frame.<br/> 
                                                                     This corrupted EMPSPI Header byte field value is in #empspi_invalid_header_byte_error <br/> 
                                                                     Applicable only for the Master. <br/>
                                                                     Usage case as follows: <br/> 
                                                                     Direct Write/Read frame is fired with corrupted Header byte
                                                                     */
    EMPSPI_INVALID_PAYLOAD_LENGTH = `SVT_SPI_EMPSPI_INVALID_PAYLOAD_LENGTH,/**<
                                                                     This error corrupts the EMPSPI Payload length field of Direct Write and Direct Read frame.<br/> 
                                                                     This corrupted EMPSPI Payload length field value is in #empspi_invalid_payload_length_error <br/> 
                                                                     Applicable for the Master when Direct Write frame is selected and . <br/>
                                                                     Applicable for the Slave when Direct Read frame is selected . <br/>
                                                                     Usage case as follows: <br/> 
                                                                     Master fires Direct Write frame with data size 10 and corrupts payload length with value 5.
                                                                     */
    EMPSPI_NO_OP_ERROR = `SVT_SPI_EMPSPI_NO_OP_ERROR
  } empspi_error_kind_enum;

  /** Error enumerated type flash_error_kind_enum: */
  typedef enum bit[1:0]
  {
    FLASH_DEASSERT_SSN_IN_MIDDLE_OF_TRANSMISSION = `SVT_SPI_FLASH_DEASSERT_SSN_IN_MIDDLE_OF_TRANSMISSION,/**<
                                                                     This error allows Master to de-assert SS_N before its actual assertion i.e..<br/> 
                                                                     in middle of a byte transfer. This value can be programmed in terms of SCLK.
                                                                     This clock count after which SS_N to be de-asserted is in #flash_deassert_ssn_in_middle_of_transmission_error <br/> 
                                                                     Applicable only for the Master. <br/>
                                                                     */
    FLASH_SCLK_DUTY_CYCLE = `SVT_SPI_FLASH_SCLK_DUTY_CYCLE,/**<
                                                         This error allows Master to assert SCLK High time as per the percentage of full clock cycle. <br/>
                                                         This value is programmed as per the percentage of full clock. <br/>
                                                         The value is stored in #flash_sclk_duty_cycle_error <br/>
                                                         Also, the values of spr and sppr should be set such as the Baud Rate should be the ratios get the half bus clk cycles.
                                                         Applicable only for the Master. <br/>
                                                         Ex: If value is 75. Then duty cycle of SCLK High will be 75 and SCLK Low will be 25. <br/>
                                                             the baud rate divisor should be minimum 2(spr=0,sppr=0) <br/>
                                                         */  
    FLASH_NO_OP_ERROR = `SVT_SPI_FLASH_NO_OP_ERROR
  } flash_error_kind_enum;

  /** Error enumerated type spi_safe_error_kind_enum: */
  typedef enum bit[2:0]
  {
    SPI_SAFE_INVALID_CRC,/**<
                     This error corrupts the SPI SAFE CRC frame with User Config value <br/>
                     This corrupted CRC value is the inverse of current CRC value. <br/> 
                     Applicable for Master/Slave
                     */
    SPI_SAFE_INVALID_FRAME_SIZE,/**<
                     This error corrupts the SPI SAFE frame size with User Config value <br/>
                     This corrupted CRC value is in #spi_safe_invalid_frame_size_error. <br/> 
                     Applicable for Master Only
                     */
    SPI_SAFE_NO_OP_ERROR
  } spi_safe_error_kind_enum;

  /** 
    * Specifies the frame format in which error is inserted 
    * For reasonable constraint please refer to #reasonable_error_kind
    */ 
  rand error_kind_enum error_kind = NO_OP_ERROR;

  /** 
    * Specifies the SPI error type which is to be inserted in the VIP
    * For reasonable constraint please refer to #reasonable_spi_error_kind
    * Default Value: SPI_NO_OP_ERROR
    */ 
  rand spi_error_kind_enum spi_error_kind = SPI_NO_OP_ERROR;

  /** 
    * Specifies the error type which is to be inserted in the VIP
    * For reasonable constraint please refer to #reasonable_empspi_error_kind
    * Default Value: EMPSPI_NO_OP_ERROR
    */ 
  rand empspi_error_kind_enum empspi_error_kind = EMPSPI_NO_OP_ERROR;

  /** 
    * Specifies the error type which is to be inserted in the VIP
    * For reasonable constraint please refer to #reasonable_flash_error_kind
    * Default Value: FLASH_NO_OP_ERROR
    */ 
  rand flash_error_kind_enum flash_error_kind = FLASH_NO_OP_ERROR;

  /** 
    * Specifies the SPI error type which is to be inserted in the VIP
    * For reasonable constraint please refer to #reasonable_spi_safe_error_kind
    * Default Value: SPI_NO_OP_ERROR
    */ 
  rand spi_safe_error_kind_enum spi_safe_error_kind = SPI_SAFE_NO_OP_ERROR;

  /**
    * Weight controlling how often the RANDOM value for SPI_OVERRIDE_IDLE_PHASE_TRISTATE is chosen
    */
  int SPI_OVERRIDE_IDLE_PHASE_TRISTATE_wt = 1;

  /**
    * Weight controlling how often the RANDOM value for SPI_OVERRIDE_WAIT_PHASE_TRISTATE is chosen
    */
  int SPI_OVERRIDE_WAIT_PHASE_TRISTATE_wt = 1;

  /**
    * Weight controlling how often the RANDOM value for SPI_OVERRIDE_DATA_PHASE_TRISTATE is chosen
    */
  int SPI_OVERRIDE_DATA_PHASE_TRISTATE_wt = 1;

  /**
    * Weight controlling how often the RANDOM value for SPI_IDLE_PHASE_CLOCK_TOGGLE is chosen
    */
  int SPI_IDLE_PHASE_CLOCK_TOGGLE_wt = 1;

  /**
   * Weight controlling how often Error type 'SPI_LEADING_TIME_DEVIATION' is selected.
   */ 
  int SPI_LEADING_TIME_DEVIATION_wt = 1;

  /**
   * Weight controlling how often Error type 'SPI_TRAILING_TIME_DEVIATION' is selected.
   */ 
  int SPI_TRAILING_TIME_DEVIATION_wt = 1;

  /**
   * Weight controlling how often Error type 'SPI_IDLE_TIME_DEVIATION' is selected.
   */ 
  int SPI_IDLE_TIME_DEVIATION_wt = 1;

  /**
    * Weight controlling how often the RANDOM value for SPI_NO_OP_ERROR is chosen
    */
  int SPI_NO_OP_ERROR_wt = 1;

  /**
    * Weight controlling how often the RANDOM value for EMPSPI_DEASSERT_SPI_INT_IN_MIDDLE_OF_BYTE_TRANSFER is chosen
    */
  int EMPSPI_DEASSERT_SPI_INT_IN_MIDDLE_OF_BYTE_TRANSFER_wt = 1; 

  /**
    * Weight controlling how often the RANDOM value for EMPSPI_INVALID_HEADER_BYTE is chosen
    */
  int EMPSPI_INVALID_HEADER_BYTE_wt = 1; 

  /**
    * Weight controlling how often the RANDOM value for EMPSPI_INVALID_PAYLOAD_LENGTH is chosen
    */
  int EMPSPI_INVALID_PAYLOAD_LENGTH_wt = 1; 

  /**
    * Weight controlling how often the RANDOM value for EMPSPI_NO_OP_ERROR is chosen
    */
  int EMPSPI_NO_OP_ERROR_wt = 1; 

  /**
    * Weight controlling how often the RANDOM value for FLASH_DEASSERT_SSN_IN_MIDDLE_OF_TRANSMISSION is chosen
    */
  int FLASH_DEASSERT_SSN_IN_MIDDLE_OF_TRANSMISSION_wt = 1; 

  /**
    * Weight controlling how often the RANDOM value for FLASH_SCLK_DUTY_CYCLE is chosen
    */
  int FLASH_SCLK_DUTY_CYCLE_wt = 1; 

  /**
    * Weight controlling how often the RANDOM value for FLASH_NO_OP_ERROR is chosen
    */
  int FLASH_NO_OP_ERROR_wt = 1; 

  /**
    * Weight controlling how often the RANDOM value for SPI_SAFE_INVALID_CRC is chosen
    */
  int SPI_SAFE_INVALID_CRC_wt = 1; 

  /**
    * Weight controlling how often the RANDOM value for SPI_SAFE_INVALID_FRAME_SIZE is chosen
    */
  int SPI_SAFE_INVALID_FRAME_SIZE_wt = 1; 

  /**
    * Weight controlling how often the RANDOM value for SPI_SAFE_NO_OP_ERROR is chosen
    */
  int SPI_SAFE_NO_OP_ERROR_wt = 1; 

  /**
    * This register holds the value of error defined by SPI_OVERRIDE_IDLE_PHASE_TRISTATE. 
    * Default Value: 1'b0
    */
  rand bit spi_override_idle_phase_tristate_error = 1'b0;

  /**
    * This register holds the value of error defined by SPI_OVERRIDE_WAIT_PHASE_TRISTATE. 
    * Default Value: 1'b0
    */
  rand bit spi_override_wait_phase_tristate_error = 1'b0;

  /**
    * This register holds the value of error defined by SPI_OVERRIDE_DATA_PHASE_TRISTATE. 
    * Default Value: 1'b0
    */
  rand bit spi_override_data_phase_tristate_error = 1'b0;

  /**
    * This register holds the location of bit to be corrupted on SPI LINE
    * For reasonable constraint please refer to #reasonable_exception_error_position
    * Default Value: 0
    */
  rand int exception_error_position = 1;

  /**
    * This register holds the duration for which bit is to be corrupted on SPI LINE
    * For reasonable constraint please refer to
    * #reasonable_exception_error_duration
    * Default Value: 0
    */
  rand int exception_error_duration = 1;

  /**
    * This register holds the value of error defined by EMPSPI_DEASSERT_SPI_INT_IN_MIDDLE_OF_BYTE_TRANSFER. 
    * For reasonable constraint please refer to #reasonable_empspi_deassert_spi_int_in_middle_of_byte_transfer_error
    * Default Value: 32'd8
    */
  rand int empspi_deassert_spi_int_in_middle_of_byte_transfer_error = 8;  

  /**
    * This register holds the value of error defined by EMPSPI_INVALID_HEADER_BYTE. 
    * Default Value: 16'h0
    */
  rand bit [15:0] empspi_invalid_header_byte_error = 16'h0;  

  /**
    * This register holds the value of error defined by EMPSPI_INVALID_PAYLOAD_LENGTH.
    * For reasonable constraint please refer to #reasonable_empspi_invalid_payload_length_error
    * Default Value: 16'h0
    */
  rand bit [15:0] empspi_invalid_payload_length_error = 16'h0;  

  /**
    * This register holds the value of error defined by FLASH_DEASSERT_SSN_IN_MIDDLE_OF_TRANSMISSION. 
    * For reasonable constraint please refer to #reasonable_flash_deassert_ssn_in_middle_of_transmission_error
    * Default Value: 32'd8
    */
  rand int flash_deassert_ssn_in_middle_of_transmission_error = 8;  

  /**
    * This register holds the value of error defined by FLASH_SCLK_DUTY_CYCLE. 
    * The value is in terms of percentage of sclk period.
    * Ex: If Clock High Duty cycle is to be set as 60%, this field should
    * contain the value 60. The Clock Low Duty cycle.
    * Default Value: 32'd50
    */
  rand int flash_sclk_duty_cycle_error = 50;  

  /**
    * This register holds the value of error defined by SPI_SAFE_INVALID_FRAME_SIZE.
    * For reasonable constraint please refer to #reasonable_spi_safe_invalid_frame_size_error
    * Default Value: 32'd0
    */
  rand int spi_safe_invalid_frame_size_error = 1;

  /**
   * This field is used to inject error in Baud rate parameter used for Leading time(tL) calculation in Master agent. <br/> 
   * It specifies the deviation of BaudRateDivisor ((sppr + 1) * 2 ^(spr + 1)) that <br/>
   * is used by Master agent for Leading time (tL) calculation. <br/>
   * Override_BaudRateDivisor(Leading Time) = ((sppr + 1) * 2 ^(spr + 1)) - #leading_time_baud_rate_deviation_factor. <br/>
   * Effective leading_time = Override_BaudRateDivisor * timer_leading * Half BusClock Period <br/>
   */
  rand int leading_time_baud_rate_deviation_factor = 0;

  /**
   * This field is used to inject error in Baud rate parameter used for Trailing time(tT) calculation in Master agent. <br/> 
   * It specifies the deviation of BaudRateDivisor ((sppr + 1) * 2 ^(spr + 1)) that <br/>
   * is used by Master agent for Trailing time calculation. <br/>
   * Override_BaudRateDivisor(Trailing Time) = ((sppr + 1) * 2 ^(spr + 1)) - #trailing_time_baud_rate_deviation_factor. <br/>
   * Effective Trailing_time = Override_BaudRateDivisor * timer_trailing * Half BusClock Period <br/>
   */
  rand int trailing_time_baud_rate_deviation_factor = 0;

  /**
   * This field is used to inject error in Baud rate parameter used for Idle time(tI) between transfer calculation in Master agent. <br/> 
   * It specifies the deviation of BaudRateDivisor ((sppr + 1) * 2 ^(spr + 1)) that <br/>
   * is used by Master agent for Idle time calculation. <br/>
   * Override_BaudRateDivisor(Idle Time) = ((sppr + 1) * 2 ^(spr + 1)) - #idle_time_baud_rate_deviation_factor. <br/>
   * Effective Idle_time = Override_BaudRateDivisor * timer_trailing * Half BusClock Period <br/>
   */
  rand int idle_time_baud_rate_deviation_factor = 0;

  //----------------------------------------------------------------------------
  // Protected Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Local Data Properties
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Constraints
  //----------------------------------------------------------------------------

  /**
   * Valid ranges constraints insure that the exception settings are supported
   * by the spi components.
   */
  constraint valid_ranges {
    spi_error_kind dist {
      SPI_OVERRIDE_IDLE_PHASE_TRISTATE := SPI_OVERRIDE_IDLE_PHASE_TRISTATE_wt,
      SPI_OVERRIDE_WAIT_PHASE_TRISTATE := SPI_OVERRIDE_WAIT_PHASE_TRISTATE_wt,
      SPI_OVERRIDE_DATA_PHASE_TRISTATE := SPI_OVERRIDE_DATA_PHASE_TRISTATE_wt,
      SPI_IDLE_PHASE_CLOCK_TOGGLE := SPI_IDLE_PHASE_CLOCK_TOGGLE_wt,
      SPI_LEADING_TIME_DEVIATION   := SPI_LEADING_TIME_DEVIATION_wt,
      SPI_TRAILING_TIME_DEVIATION  := SPI_TRAILING_TIME_DEVIATION_wt,
      SPI_IDLE_TIME_DEVIATION := SPI_IDLE_TIME_DEVIATION_wt,
      SPI_NO_OP_ERROR := SPI_NO_OP_ERROR_wt
    };
    if(error_kind == SPI_ERROR_KIND) {
      if(~cfg.is_master)
        !(spi_error_kind inside {SPI_IDLE_PHASE_CLOCK_TOGGLE,SPI_LEADING_TIME_DEVIATION,SPI_TRAILING_TIME_DEVIATION,SPI_IDLE_TIME_DEVIATION});
    }
    empspi_error_kind dist {
      EMPSPI_DEASSERT_SPI_INT_IN_MIDDLE_OF_BYTE_TRANSFER := EMPSPI_DEASSERT_SPI_INT_IN_MIDDLE_OF_BYTE_TRANSFER_wt,
      EMPSPI_INVALID_HEADER_BYTE := EMPSPI_INVALID_HEADER_BYTE_wt,
      EMPSPI_INVALID_PAYLOAD_LENGTH := EMPSPI_INVALID_PAYLOAD_LENGTH_wt,
      EMPSPI_NO_OP_ERROR := EMPSPI_NO_OP_ERROR_wt
    };
    if(error_kind == EMPSPI_ERROR_KIND) {
      empspi_deassert_spi_int_in_middle_of_byte_transfer_error > 1;
      !(empspi_invalid_header_byte_error inside {16'h0100,16'h0200});
    }
    else {
      empspi_deassert_spi_int_in_middle_of_byte_transfer_error == 1;
      empspi_invalid_header_byte_error == 16'h0;
      empspi_invalid_payload_length_error == 16'h0;
    }
    flash_error_kind dist {
      FLASH_DEASSERT_SSN_IN_MIDDLE_OF_TRANSMISSION := FLASH_DEASSERT_SSN_IN_MIDDLE_OF_TRANSMISSION_wt,
      FLASH_SCLK_DUTY_CYCLE := FLASH_SCLK_DUTY_CYCLE_wt,                                             
      FLASH_NO_OP_ERROR := FLASH_NO_OP_ERROR_wt
    };
    if(error_kind == FLASH_ERROR_KIND) {
      flash_deassert_ssn_in_middle_of_transmission_error > 1;
      flash_sclk_duty_cycle_error inside {[1:99]};
    }
    else {
      flash_deassert_ssn_in_middle_of_transmission_error == 1;
      flash_sclk_duty_cycle_error == 50;
    }
    spi_safe_error_kind dist {
      SPI_SAFE_INVALID_CRC := SPI_SAFE_INVALID_CRC_wt,
      SPI_SAFE_INVALID_FRAME_SIZE := SPI_SAFE_INVALID_FRAME_SIZE_wt,
      SPI_SAFE_NO_OP_ERROR := SPI_SAFE_NO_OP_ERROR_wt
    };
    !(spi_safe_invalid_frame_size_error == xact.spi_safe_frame_size);
    if(cfg.frame_format == svt_spi_types::SPI_SAFE)
      spi_error_kind inside {SPI_IDLE_PHASE_CLOCK_TOGGLE,SPI_NO_OP_ERROR};  
  }

  /** Reasonable constraint for #error_kind
    *
    * This constraint is ON by default; reasonable constraints can be enabled/disabled
    * as a block via the #reasonable_constraint_mode method.
    *
    */
  constraint reasonable_error_kind {
    if(cfg.frame_format == svt_spi_types::SPI_STD || cfg.frame_format == svt_spi_types::SPI_MULTILANE)
      error_kind == SPI_ERROR_KIND;  
    else if(cfg.frame_format == svt_spi_types::SPI_EMPSPI)
      error_kind == EMPSPI_ERROR_KIND;
    else if(cfg.frame_format == svt_spi_types::SPI_FLASH)
      error_kind inside {SPI_ERROR_KIND,FLASH_ERROR_KIND};
    else if(cfg.frame_format == svt_spi_types::SPI_SAFE)
      error_kind inside {SPI_SAFE_ERROR_KIND,SPI_ERROR_KIND};
    else
      error_kind == NO_OP_ERROR;  
  }

  /** Reasonable constraint for #spi_error_kind
    *
    * This constraint is ON by default; reasonable constraints can be enabled/disabled
    * as a block via the #reasonable_constraint_mode method.
    *
    */
  constraint reasonable_spi_error_kind {
    if(error_kind == SPI_ERROR_KIND) {
      //if(cfg.frame_format == svt_spi_types::SPI_STD || cfg.frame_format == svt_spi_types::SPI_MULTILANE || cfg.frame_format == svt_spi_types::SPI_FLASH) {
      //  if(cfg.frame_format == svt_spi_types::SPI_STD && 
      //          (cfg.spi_feature == svt_spi_types::SPI || cfg.spi_feature == svt_spi_types::SSP))
      //    !(spi_error_kind inside {SPI_OVERRIDE_WAIT_PHASE_TRISTATE});
      //}
      if(cfg.frame_format == svt_spi_types::SPI_STD) {
        if(cfg.spi_feature == svt_spi_types::SPI || cfg.spi_feature == svt_spi_types::SSP)
          !(spi_error_kind inside {SPI_OVERRIDE_WAIT_PHASE_TRISTATE});
      }
      else if(cfg.frame_format == svt_spi_types::SPI_SAFE)
        spi_error_kind inside {SPI_IDLE_PHASE_CLOCK_TOGGLE,SPI_NO_OP_ERROR};  
      else if (cfg.frame_format == svt_spi_types::SPI_MULTILANE || cfg.frame_format == svt_spi_types::SPI_FLASH) {
        !(spi_error_kind inside {SPI_LEADING_TIME_DEVIATION,SPI_TRAILING_TIME_DEVIATION,SPI_IDLE_TIME_DEVIATION});  
      } 
      else
        spi_error_kind == SPI_NO_OP_ERROR;  
    }
    else
      spi_error_kind == SPI_NO_OP_ERROR; 
  }

  /** Reasonable constraint for #empspi_error_kind
    *
    * This constraint is ON by default; reasonable constraints can be enabled/disabled
    * as a block via the #reasonable_constraint_mode method.
    *
    */
  constraint reasonable_empspi_error_kind {
    if(cfg.frame_format == svt_spi_types::SPI_EMPSPI) {
      if(cfg.is_master)
        empspi_error_kind inside {EMPSPI_INVALID_HEADER_BYTE, EMPSPI_INVALID_PAYLOAD_LENGTH};
      else
        empspi_error_kind inside {EMPSPI_DEASSERT_SPI_INT_IN_MIDDLE_OF_BYTE_TRANSFER, EMPSPI_INVALID_PAYLOAD_LENGTH};
    }
    else
      empspi_error_kind == EMPSPI_NO_OP_ERROR;  
  }

  /** Reasonable constraint for #flash_error_kind
    *
    * This constraint is ON by default; reasonable constraints can be enabled/disabled
    * as a block via the #reasonable_constraint_mode method.
    *
    */
  constraint reasonable_flash_error_kind {
    if(cfg.frame_format == svt_spi_types::SPI_FLASH)
      flash_error_kind inside {FLASH_DEASSERT_SSN_IN_MIDDLE_OF_TRANSMISSION,FLASH_SCLK_DUTY_CYCLE};
    else
      flash_error_kind == FLASH_NO_OP_ERROR;  
  }

  /** Reasonable constraint for #spi_safe_error_kind
    *
    * This constraint is ON by default; reasonable constraints can be enabled/disabled
    * as a block via the #reasonable_constraint_mode method.
    *
    */
  constraint reasonable_spi_safe_error_kind {
    if(cfg.frame_format == svt_spi_types::SPI_SAFE)
      spi_safe_error_kind inside {SPI_SAFE_INVALID_CRC,SPI_SAFE_INVALID_FRAME_SIZE};
    else
      spi_safe_error_kind == SPI_SAFE_NO_OP_ERROR;  
  }

  /** Reasonable constraint for #spi_override_wait_phase_tristate_error
    *
    * This constraint is ON by default; reasonable constraints can be enabled/disabled
    * as a block via the #reasonable_constraint_mode method.
    *
    */
  constraint reasonable_spi_override_wait_phase_tristate_error {
    if(spi_error_kind == SPI_OVERRIDE_WAIT_PHASE_TRISTATE) {
      if(~cfg.is_master && cfg.spi_feature == svt_spi_types::UWIRE && cfg.frame_format == svt_spi_types::SPI_STD)  
        spi_override_wait_phase_tristate_error == 1;
      else 
        spi_override_wait_phase_tristate_error inside {0,1};
    }
    else
      spi_override_wait_phase_tristate_error == 0;
  }

  /** Reasonable constraint for #empspi_deassert_spi_int_in_middle_of_byte_transfer_error
    *
    * This constraint is ON by default; reasonable constraints can be enabled/disabled
    * as a block via the #reasonable_constraint_mode method.
    *
    */
  constraint reasonable_empspi_deassert_spi_int_in_middle_of_byte_transfer_error {
    empspi_deassert_spi_int_in_middle_of_byte_transfer_error inside {[1:31]};
  }

  /** Reasonable constraint for #empspi_invalid_payload_length_error
    *
    * This constraint is ON by default; reasonable constraints can be enabled/disabled
    * as a block via the #reasonable_constraint_mode method.
    *
    */
  constraint reasonable_empspi_invalid_payload_length_error {
    empspi_invalid_payload_length_error inside {[0:31]};
  }

  /** Reasonable constraint for #flash_deassert_ssn_in_middle_of_transmission_error
    *
    * This constraint is ON by default; reasonable constraints can be enabled/disabled
    * as a block via the #reasonable_constraint_mode method.
    *
    */
  constraint reasonable_flash_deassert_ssn_in_middle_of_transmission_error {
    flash_deassert_ssn_in_middle_of_transmission_error inside {[1:xact.total_transmit_edge]};
  }

 /** Reasonable constraint for #exception_error_position
    *
    * This constraint is ON by default; reasonable constraints can be enabled/disabled
    * as a block via the #reasonable_constraint_mode method.
    *
    */
   constraint reasonable_exception_error_position {
     if(spi_error_kind == SPI_OVERRIDE_IDLE_PHASE_TRISTATE)
       exception_error_position inside {[1:`SVT_SPI_MAX_IDLE_TIME_BETWEEN_TRANSFER-1]};
     else if(spi_error_kind == SPI_OVERRIDE_WAIT_PHASE_TRISTATE)
       exception_error_position inside {[1:xact.wait_cycle_count]};
     else if(spi_error_kind == SPI_OVERRIDE_DATA_PHASE_TRISTATE) {
       if(cfg.spi_feature == svt_spi_types::UWIRE && cfg.frame_format == svt_spi_types::SPI_STD && xact.uwire_transfer_state == svt_spi_types::NON_SEQUENTIAL)
         exception_error_position inside {[1:(cfg.data_frame_width/xact.data_lane_count)]};
       else
         exception_error_position inside {[1:((xact.data_frame_size*cfg.data_frame_width)/xact.data_lane_count)]};
     }
     else if(spi_error_kind == SPI_IDLE_PHASE_CLOCK_TOGGLE)
       exception_error_position inside {[1:`SVT_SPI_MAX_IDLE_TIME_BETWEEN_TRANSFER-1]};
     else
       exception_error_position == 0;  
   }

 /** Reasonable constraint for #exception_error_duration
    *
    * This constraint is ON by default; reasonable constraints can be enabled/disabled
    * as a block via the #reasonable_constraint_mode method.
    *
    */
   constraint reasonable_exception_error_duration {
     if(spi_error_kind == SPI_OVERRIDE_IDLE_PHASE_TRISTATE)
       exception_error_duration inside {[1:(`SVT_SPI_MAX_IDLE_TIME_BETWEEN_TRANSFER-exception_error_position+1)]};
     else if(spi_error_kind == SPI_OVERRIDE_WAIT_PHASE_TRISTATE)
       exception_error_duration inside {[1:xact.wait_cycle_count-exception_error_position+1]};
     else if(spi_error_kind == SPI_OVERRIDE_DATA_PHASE_TRISTATE) {
       if(cfg.spi_feature == svt_spi_types::UWIRE && cfg.frame_format == svt_spi_types::SPI_STD && xact.uwire_transfer_state == svt_spi_types::NON_SEQUENTIAL)
         exception_error_duration inside {[1:(cfg.data_frame_width/xact.data_lane_count)-exception_error_position+1]};
       else
         exception_error_duration inside {[1:((xact.data_frame_size*cfg.data_frame_width)/xact.data_lane_count)-exception_error_position+1]};
     }
     else if(spi_error_kind == SPI_IDLE_PHASE_CLOCK_TOGGLE)
       exception_error_duration inside {[1:(`SVT_SPI_MAX_IDLE_TIME_BETWEEN_TRANSFER-exception_error_position+1)]};  
     else
       exception_error_duration == 0;  
   }

  /** Reasonable constraint for #spi_safe_invalid_frame_size_error
    *
    * This constraint is ON by default; reasonable constraints can be enabled/disabled
    * as a block via the #reasonable_constraint_mode method.
    *
    */
  constraint reasonable_spi_safe_invalid_frame_size_error {
    spi_safe_invalid_frame_size_error inside {[1:xact.spi_safe_frame_size+1]};
  }

 constraint reasonable_leading_time_baud_rate_deviation_factor {
   if (cfg.disable_baud_rate_divisor) 
     leading_time_baud_rate_deviation_factor == 0;
   else
     leading_time_baud_rate_deviation_factor inside {[1:get_baud_rate_divisor(cfg.sppr,cfg.spr)-1]};
 } 

 constraint reasonable_trailing_time_baud_rate_deviation_factor {
   if (cfg.disable_baud_rate_divisor) 
     trailing_time_baud_rate_deviation_factor == 0;
   else
     trailing_time_baud_rate_deviation_factor inside {[1:get_baud_rate_divisor(cfg.sppr,cfg.spr)-1]};
 } 

 constraint reasonable_idle_time_baud_rate_deviation_factor {
   if (cfg.disable_baud_rate_divisor) 
     idle_time_baud_rate_deviation_factor == 0;
   else
     idle_time_baud_rate_deviation_factor inside {[1:get_baud_rate_divisor(cfg.sppr,cfg.spr)-1]};
 } 

  //----------------------------------------------------------------------------
  // Methods
  //----------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `svt_vmm_data_new(svt_spi_transaction_exception)
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new exception instance, passing the appropriate argument
   * values to the <b>svt_exception</b> parent class.
   *
   * @param log Sets the log file that is used for status output.
   */
  extern function new(vmm_log log = null);
`else
  //----------------------------------------------------------------------------
  /**
   * CONSTRUCTOR: Create a new exception instance, passing the appropriate argument
   * values to the <b>svt_exception</b> parent class.
   *
   * @param name Instance name of the exception.
   */
  extern function new(string name = "svt_spi_transaction_exception");
`endif

  //----------------------------------------------------------------------------
  //   SVT shorthand macros 
  //----------------------------------------------------------------------------

  `svt_data_member_begin(svt_spi_transaction_exception)
    `svt_field_object(cfg, `SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_REFERENCE, `SVT_HOW_REF)
    `svt_field_object(xact, `SVT_ALL_ON|`SVT_UVM_NOPACK|`SVT_NOCOMPARE|`SVT_REFERENCE, `SVT_HOW_REF)
  `svt_data_member_end(svt_spi_transaction_exception)

  //----------------------------------------------------------------------------
  /**
   * Method to turn reasonable constraints on/off as a block.
   */
  extern virtual function int reasonable_constraint_mode(bit on_off);

  //----------------------------------------------------------------------------
  /**
   * Returns the class name for the object used for logging.
   */
  extern function string get_mcd_class_name();

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Allocates a new object of type svt_spi_transaction_exception.
   */
  extern virtual function vmm_data do_allocate();
`endif

`ifdef SVT_VMM_TECHNOLOGY
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with to, based on the requested compare kind.
   * Differences are placed in diff.
   *
   * @param to vmm_data object to be compared against.
   * @param diff String indicating the differences between this and to.
   * @param kind This int indicates the type of compare to be attempted. Only supported
   * kind value is svt_data::COMPLETE, which results in comparisons of the non-static
   * data members. All other kind values result in a return value of 1.
   */
  extern virtual function bit do_compare(vmm_data to, output string diff, input int kind = -1);
`else
  // ---------------------------------------------------------------------------
  /**
   * Compares the object with rhs.
   *
   * @param rhs Object to be compared against.
   * @param comparer `SVT_XVM(comparer) instance used to accomplish the compare.
   */
  extern virtual function bit do_compare(`SVT_XVM(object) rhs, `SVT_XVM(comparer) comparer);
`endif

  // ---------------------------------------------------------------------------
  /**
   * Does basic validation of the object contents. Only supported kind values are -1 and
   * `SVT_DATA_TYPE::COMPLETE. Both values result in a COMPLETE compare.
   */
  extern virtual function bit do_is_valid(bit silent = 1, int kind = -1);

`ifdef SVT_VMM_TECHNOLOGY
  //----------------------------------------------------------------------------
  /**
   * Returns the size (in bytes) required by the byte_pack operation.
   *
   * @param kind This int indicates the type of byte_size being requested. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in a size calculation based on the
   * non-static fields. All other kind values result in a return value of 0.
   */
  extern virtual function int unsigned byte_size(int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Packs the object into the bytes buffer, beginning at offset, based on the
   * requested byte_pack kind.
   *
   * @param bytes Buffer that will contain the packed bytes at the end of the operation.
   * @param offset Offset into bytes where the packing is to begin.
   * @param kind This int indicates the type of byte_pack being requested. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in all of the
   * non-static fields being packed and the return of an integer indicating the number of
   * packed bytes. All other kind values result in no change to the buffer contents, and a
   * return value of 0.
   */
  extern virtual function int unsigned do_byte_pack(ref logic [7:0] bytes[], input int unsigned offset = 0, input int kind = -1);

  //----------------------------------------------------------------------------
  /**
   * Unpacks the object from the bytes buffer, beginning at offset, based on
   * the requested byte_unpack kind.
   *
   * @param bytes Buffer containing the bytes to be unpacked.
   * @param offset Offset into bytes where the unpacking is to begin.
   * @param len Number of bytes to be unpacked.
   * @param kind This int indicates the type of byte_unpack being requested. Only supported
   * kind value is `SVT_DATA_TYPE::COMPLETE, which results in all of the
   * non-static fields being unpacked and the return of an integer indicating the number of
   * unpacked bytes. All other kind values result in no change to the exception contents,
   * and a return value of 0.
   */
  extern virtual function int unsigned do_byte_unpack(const ref logic [7:0] bytes[], input int unsigned offset = 0, input int len = -1, input int kind = -1);
`endif

  //----------------------------------------------------------------------------
  /**
   * Checks whether this exception collides with another exception, test_exception.
   */
  extern virtual function int collision(svt_exception test_exception);

  // ---------------------------------------------------------------------------
  /** Returns a string which provides a description of the exception. */
  extern virtual function string get_description();

  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>read</i> access to public data members of this class.
   */
  extern virtual function bit get_prop_val(string prop_name, ref bit [1023:0] prop_val, input int array_ix, ref `SVT_DATA_TYPE data_obj);

  // ---------------------------------------------------------------------------
  /**
   * HDL Support: For <i>write</i> access to public data members of this class.
   */
  extern virtual function bit set_prop_val(string prop_name, bit [1023:0] prop_val, int array_ix);

  // ---------------------------------------------------------------------------
  /**
   * Simple utility used to convert string property value representation into its
   * equivalent 'bit [1023:0]' property value representation. Extended to support
   * encoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort.
   *
   * @return The enum value corresponding to the desc.
   */
  extern virtual function bit encode_prop_val(string prop_name, string prop_val_string, ref bit [1023:0] prop_val,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  // ---------------------------------------------------------------------------
  /**
   * Simple utility used to convert 'bit [1023:0]' property value representation
   * into its equivalent string property value representation. Extended to support
   * decoding of enum values.
   *
   * @param prop_name The name of the property being encoded.
   * @param prop_val_string The string describing the value to be encoded.
   * @param prop_val The bit vector encoding of prop_val_string.
   * @param typ Optional field type used to help in the encode effort.
   *
   * @return The enum value corresponding to the desc.
   */
  extern virtual function bit decode_prop_val(string prop_name, bit [1023:0] prop_val, ref string prop_val_string,
                                              input svt_pattern_data::type_enum typ = svt_pattern_data::UNDEF);

  // ---------------------------------------------------------------------------
  /**
   * This method allocates a pattern containing svt_pattern_data instances for
   * all of the primitive data fields in the object. The svt_pattern_data::name
   * is set to the corresponding field name, the svt_pattern_data::value is set
   * to 0.
   *
   * @return An svt_pattern instance containing entries for all of the data fields.
   */
  extern virtual function svt_pattern do_allocate_pattern();

  /** 
   * This function defines the print task for svt_spi_transaction_exception class.
   */
`ifdef SVT_UVM_TECHNOLOGY
  extern virtual function void do_print(uvm_printer printer);
`elsif SVT_OVM_TECHNOLOGY
  extern virtual function void do_print(ovm_printer printer);
`endif
  
  /**
   * This function returns the Baud Rate divisor based on selected configuration.
   */ 
  extern virtual function int get_baud_rate_divisor(int sppr, int spr);

  // ---------------------------------------------------------------------------

`ifdef SVT_VMM_TECHNOLOGY
  `vmm_typename(svt_spi_transaction_exception)
  `vmm_class_factory(svt_spi_transaction_exception)
`endif

  // ---------------------------------------------------------------------------
endclass

// =============================================================================

`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
jEIXfgNMZqawEH45pKmBWDZypiunz3GLGPldCg0Z20599rWbO2YqWZfMOxsF0/Jn
FSuF2hAeflzYYMMgY+faSw6sUzqMC405VcyRwWHile/iFtAJTd8Mta+D3rhE8q0x
z1C3+6bpNKMybGLNhxz6EwrRmSAyaoXnnyazf5s10V8=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 596       )
XGS6qPW2RaJGXcz0VYCbRQKxZ/T82BrCuIQkJN9xm9jO/crBVEXW/eyjjcwk8Z3n
U4OC2/PguzBzvXDwnrx24iYKR50LTofnmDCJAOtb1dodsds/TZcSamMzfz6ioUjx
D7UKZLZqtNWRFnDbPEmNymo0xPsH4Mll/G/3UXWhYCpiQTBeSnigZvj23xHevQR8
y3lNociunEjtvw+UH/MlF/22TtSGoOnd68KZEhIpPa0Y/kHx1zIeUAYA9xzBFWb+
zrE8TrKP+VhMdWZ8Sx8zavf5w6lTBYi8Fm8HgpFOVs6cO8TL0RzuuMD/gCev6VCd
zSiRrChBdNVFYuAf8bmiWY6p0GsgS9jg2Y3teOrTxioCwFXokcGQW/jBJ/O5uO04
r8SZGUDbCDrgSZ8Kljq64pfh9i8hEpzZPsiCiYiCdCTHneXKYWb7p2aV0+l3PqxG
1Yr2rw0ssdkYyHsebaEV/FlQUX9ms0uhKFRprCrFe8LcZOzWcwGg/ysVAgUzGILV
brDaDHsWmfv+711Tj3Z9tok7hRIJ1+5mUoki3hFAEqov8/Z622Lt16HDJSXL6NU7
Wsa0Xj8U2sRLh1A2BDz8wxdb3QCtEqCcSHVeR/Y7CUO+OWQb9bNHK5MZIUxN4mur
49yzarmzzIxjL8a16BmGKJWoIip4In1AcdB9V7y3qaThcf2JkMRl5q0AnjF+eDGl
6P0ZMcB45iwAwCDox08NARcuR0+IJsytD+osMUgMFIKcLq/LazTPkD+7gQ2ilUB7
n2So24Uz/0mEdx8ohnrafxQbvFquWCfM++x3QnmRrIg=
`pragma protect end_protected

//vcs_vip_protect
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
fDpS151yJ4FeGQ0L67PvsvxseVR7h3BpORbkGUx5yqJ6NSi3AuSBG25HJh9Eu560
+G+iodzVqOI9Mb7BVzVAn7vTt5i5tBT8Q1zoX6GVix63jFNzHzTvTJeiVODmKRh0
IrbayevNS8c7E/iclj8o56U4S9/HKsAbAN/mqTX/lgk=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 36406     )
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
oeYfHa2kzH4D76UAuAwZvg==
`pragma protect end_protected

`endif // GUARD_SVT_SPI_TRANSACTION_EXCEPTION_SV
`pragma protect begin_protected
`pragma protect encrypt_agent = "Model Technology", encrypt_agent_info = "6.5b"
`pragma protect data_method = "aes128-cbc"
`pragma protect key_keyowner = "Mentor Graphics Corporation" , key_keyname = "MGC-VERIF-SIM-RSA-1" , key_method = "rsa"
`pragma protect key_block encoding = (enctype = "base64")
hVfsfgg2QEOdDjlLi+AXcjlMxKMQjy7YkkHS2/zzE2xR3gWg/5XbLDli/DcxbPYZ
MFag0xbLrH1GlWHQqOzRthlUanpi6Cw7IrARcbzD9Yn5fxei0AX719FFTAv16LOM
HPZ6sAuDk4doonU1w7xmCRQAHvxhJJEtnvp3u7F5Rm0=
`pragma protect data_block encoding = ( enctype = "base64", bytes = 36489     )
gPDtQeOwsOfa8tLUWQu1N+nGua4JaCpnMPwDx4/SR2DtObdvwSktGkRXhy1ew6PM
8zoXPhaMSboXARro+S8R4dCVJfFCXZSVmNXPGms2DGiiHMDqJFoe1amaO8ltu2dx
`pragma protect end_protected
