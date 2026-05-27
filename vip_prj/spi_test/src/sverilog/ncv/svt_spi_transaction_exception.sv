
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

//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
dysurP8638h8KhGvM1174TfAR++TrgUE0hMtUBTlwxEHEcsw9tMGRRLkBYbMe4i3
gD21fAov1ynPrJtL+fuEqfSDxwltQ2D0pRfKyl326AY0SwszcvP1naWwRY3i1eVW
1ctRrLrphVnajPKEHFb4EFGkEhygN5WTDBvQXWP4CJsLgSKqEVyBYw==
//pragma protect end_key_block
//pragma protect digest_block
LIMeLZoG1R4mDJKyfJZuaLdB880=
//pragma protect end_digest_block
//pragma protect data_block
qwSjCJIgzEDxkGvNHqOx3nOyB0lr6WY3dKa+nDRzHs/5kE1tz5J9iCmciBckQYE7
nZXoGoS0NUvJqtetcyGMCN9nPpGWfkdvTeo6Ayn+qoreA4pPAIWpt8a0i69edCfF
ndxFiOWVYdzM2q/HVjFllpHR1EZW9ChXonHl77W5WRlkin/4AYy5Bg+CKlq/DzIi
2GhrtwJweVkg9l9bwLzeegd1JtYSmjM0w0CCmwc/RbIiaXq/vzbf2AzjlUEvK66k
eXmNyTq9gIIlBzc07N+7gdZqy4k0vju2JuuZy15JZ1ZqsN6i3iRTv8uW9vyWe1qT
UYba86yyM1MvwtHaVoNnt4eG/jLvawVJlf7PIN0l7j2qGHQ9jNJxVFEYPlulZgqr
wH4i+t+HTA7uZlf8rX/VX/a5jzvTcNTe+N+I/4Byuk3asGM0f4j28mTDhv+py3mM
vLlJGbwymXTLzoEey0fo6dfW51gLWy0KU7wyRIr2MUZ4qsuu0eaGCliBb+mNCCwM
y/SuEUzdihS3oe4HPPC/q3R7PtIBAV/MV6tR5CjRuR3ohACALOfo7Xbufnr83NJe
5ImEda2YUcWbWJE3waSC4IhCbfAXHRYcZ6odjv4Tbqi/VtLe40H/0aUeSnW04nQN
2c5VzNj1VhPv28qvFCHYe30/rUS24oT3a7OjX9B7+a8i2E909BbNecp0KmA9r6yU
VVLjJzUjZ8I4GSk6h8f1wzCOk9XqGOt4zfj3a93U8fAV/sz9L0Zihbnm2Ph0c4dQ
3Deb6t3Gehbzqyguk5bKpzkKj31eJTayLa4aKesLViThYiYlpjDGHHwytsrXEZuj
9pt/IMlsG9uA7f8pkfTuvvnTVQ91LXfBJIAP8xTsbndc7fJOwqyMUb6Pf+fyNg39
nXzZRiG8VjRvV4xatJdmTqCAjoZLUSM7FVN+Pwogb5CDzHFH1tvFYsd4hXQviU6p
vRapOj+sPN797Ct+W+EaPsos6T8UiCy4uwUdNqqkubp2Pu/nxkqzHifiHCxgtpRc

//pragma protect end_data_block
//pragma protect digest_block
oaMBrrzpHqDchuscfdeiBIjqp8k=
//pragma protect end_digest_block
//pragma protect end_protected

//vcs_vip_protect
//pragma protect begin_protected
//pragma protect key_keyowner=Cadence Design Systems.
//pragma protect key_keyname=CDS_KEY
//pragma protect key_method=RC5
//pragma protect key_block
gVQRcMTtEtzT44+MtHQkLYhV3g31Ju6yi1VTx0aoKdmjgrflVpKIDi4muMXJi4bo
7swTaYeuq8w8sFlTwEVZlEoBqwtrSlMSQi63DLQBqfsYnf69EhnwqaVbbr8SKz0h
ngdLv5OLnIl/te1Fr5KOJUICptECETUlCo+LX47dcaQt3jPHga3WMQ==
//pragma protect end_key_block
//pragma protect digest_block
X30WW2ZKWKBNmO4+KLYHvd0A3T8=
//pragma protect end_digest_block
//pragma protect data_block
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
//pragma protect end_data_block
//pragma protect digest_block
C8vs/qyMIQKSAL/ipTw4T0ZfZFs=
//pragma protect end_digest_block
//pragma protect end_protected

`endif // GUARD_SVT_SPI_TRANSACTION_EXCEPTION_SV
