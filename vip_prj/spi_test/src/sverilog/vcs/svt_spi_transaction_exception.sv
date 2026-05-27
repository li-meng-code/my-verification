
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

`protected
]VWC.c/O+GP6&&+S/VE@Tc//FIeCW(JbBcX1fK6W1N;@=1O)P-^R/))R]>W/2WR6
O[R<26SF&&.bMGD.5X.A:HZ>K(cY,PLECRf3C^AIHAA#37^>4_.HTMQR(X5D1D)e
.7PKbQb_B-gZ(:f26-JQ,/8(5_K-D_,eg:H&[LcX(A:UgdG4fSb6>@8dWI?2&BMY
)ZYY9#:A&EB??Fcg(U5Fb2>3W:/TH#YbMg)OS<&MXV:@AFG<R3H<CZ0.43ENLRRa
F4+9N0d#?[E/c_^-N[Ie1F^X.[O#((58Madf=YJgB/E^CVE\2,]CH;[WacALM@Z<
JO@R,16,e)[A+bO[D2?[9P.]476/K2<JGLCcJE81M?d#1?23]^A[M]H4V9#I5QF[
AH_YS2:/-fFfeFd+CZg=:UNF4QZN].)>EETSWE8@PZFJ_XWU1XYf>#R,LV^b7]\]
GOR=:fgRM/]&,#W#@4Jc,W<+H?73X;3]TDfG[N@=F&\_CGYVKb&/G;G4aX5)E\]N
)YZGg<[NZdVg#F=cFVdRO=3G[D/QV.YQFf/)/?_Ha)e)g4f3BNfC06b8d?c:K.J/
=K_@H+^-ZJY-1<DTe)S[F:F\L.2OV23[3DaF(5LM4YSR6]FD@T=TQ>edT)7GL7IL
YIH69P1?:\R-*$
`endprotected


//vcs_vip_protect
`protected
II/e0A1UX[#E=;PS1&651bH,4,e-[RQ,\<f\QBTF4Pf_a#)2g:C/7(6G/N7T#Z14
PSV;BEHge67Uc9DS+)^3\Rg+fW.KD0&2A>,>@^Ge-)U)LKO.b20M.E,YdXUI/3R/
RLA2?39:BM\Q7QC7.VdI@B<_Oec[-==](DU2&Mc^bK=c9a]fAc?SKAP#41\-OTXN
B:8W.@)Z@62=9P.(H,@]FE5;RI&RV0a;NA5UN&2;]:NJQ?b&6fF9\J:P3LT<6HRN
+\<=EcE.\3b+<VPbOF\3CR,8Le(3W9Y#R1@N#cRTCC+a,3BR_,W980/ZgfV[^8(H
6,.[_0dPZ=RKcYBb>>ADJAMP\3VCWI(61HQLY^Y,(^C@VSO/-,;DPU1&:<:aBMc0
2<NY5DOU:@T@+FY38cQeaP-&b;H@b7?#gPV_Mb42R:DedIT[.C#XY3g=cNPPg_2O
J-#?)+4gZg^a(\F;9QdBN)2Z#S>+eU[[_dfW1^BN>fHG:2K.M97Z>)F\UgX/e]WA
?aB=1+9,XE+d#Q>bKWX/VC<069#Xd3=JfEeY64;IKYg[AG[K5KM0CfBbS6?1,)=a
a()^:#?>TOg_YS=P;e\-S+K,2@/TD+FeX[I0H-K:MU-YDT1Y2&fU9YJXLN0F0UPY
>NcBN+L^Z_Qc87[;IHLJc7CDXIA\(W<4YTX4KZc5=3.JY?.b[8E\+L^#MMCf;MUK
+-W.g;I?MF9\QL9?_\8a+g&E_8=[-N4+P,J9HZ3:;f5^GUB+&eW=OW+]QcI:4>FM
0QY3[0N#I0<c9-]E+/UcQH8JN&2NPCe]5c)4ZOXf&&>;BSK:?D4)>/b)^T<F#\^:
&aR?D;W7,K5HG\20b;.B;FPL<06e3^(Oc_cI@H@Gb;#0.,G:NF&b[bgg=2XIgZ<]
U_=4,59P2D?f)#VLg3\_:fL)gM[,g.-3[31E,eVS+>0O=,OK4a/8MA=_]e.c_K[^
P:AK18\IBKREZ=Bd@V047-d7.4>DD,1->;]-T[AD4@gL,dZBef2g9C-8U(?/1VZ;
fX#;/(=eb>BS-e7<[7a,=B&S)N.B;6_ZdJ5gL1MS^Z-2D+KCa+UN>&ZA5f_I<4&0
3b>a=+@TS4C^1#MB78AM\O#O4_HFV1C_87DBT#]X@3FU+W37W@?d36NRP85^&\AY
A8^_e@_CY_N3T6BBT@Kg6PZ\QaJ=-1Y1V;]1c3\<g:<E)Ia()WQNC@9LV/=PUE2E
g5./=O0LPbURc550RF=cPW2B\6]a1G4LbZQ)f)a15?d1,cQQ,d)+=N^A0M>V+87\
\fCKBJfX[1.>ES@(eQ:1F&J3-TRf.C7U;9(=9CR;5^-::Y\/&4c99:\_W;@bcV3D
F1AW;>L[LP-f\YH_+XJCaGZ;Y?g=E</6cDJ]g2N?0YJ=F[LP7U<b;[I\#1V08cfW
#D5fb017I\Qb6SL3H8b1KFZI;RO1&<YZL0ONLY&5KN_ag@QeD:gaf238acb)7ABP
B,T,MZeE9NG9;O9aJ/DBR5OfV]3KJbQ[:,+3U2>YRB[9#,e6]FJB>^@ZbIGNZ7SY
dD,IEXRY#Bd\Q\[(d_,Z>\V-M(#HRK;\5^X2<bL:aN#BIF=QBcH]686b6FG1d<fb
,EA1@[_Xg[.(C^F_Y?9R)],YWQI<BXF&RGP:IS/NEcR9#K#^RJ1K4Fe[F>#9DS=X
RH6a3L/IF9dNK_8PY2LE;bTI(\_Jb??9IEa^5/:.74]9@a0ZA9B#MNA9YF)A@0?f
8TTPJ.^.V>=(6[87Ca_NaFVC;UWV#Q^(D86:C/]>Ydg\dc(VC>+>6X8S6?1J7/)U
5W5#A#ISW)&59-^6g#+fLa^Ud6@5C4J2H-IbU=1JZaMEUS(fa1,K8TNN;_3VM[3.
H_2I-(V\KS)M>FR,2,YGV3/[PJ7]-T3Cd/;U[(\/9/_Y7)ID\V7;<8OXAVQ=A25B
\HX-#8=BdcI5D+8X]K)).[e5UF3@e^(-ZY)?H9\V3+R]I=TRIV,A&Q9?(/NF^9K>
?8W[N@4@FeB\8GUGZLf>@bJ5E+6S.WKR^M4P<bY)UCWZ[cb4Xcb]1K,IeX2F]AEF
.#)/L^ZfS3VP[;4Ne>P72\QG+Qf<2@4,N8A[C_c78#eIOeHC6NJg-(TC)H0LB<N9
>=]^8E#<NWgY1WA=</=NJ..LK#RB.U5TT8G(HFF8;aD,ZFX2>\Kea/aeG66>PHd]
C9Q=P]5/0N62MS9C.8e=\WOELY[^)QOf+DV#>KfHB3,XFY3fLA3f_73<(=g;.274
.&(?ZNU_6P\S?^a]_Q<ac0U,46X/BXf]Y4&)@U:1N>=E.G#3fd?1Pc<;5)a3b@eT
a\-ZU>QV@;Lg/=TAP7Ie]Rg=(8Q74_aAd-#S?&[WM;QX;Q#83\D>KO0g-HXf;d:X
+(BGHSVZKT:?DZ+D7<NeXJ,T@b9>;)[;e:M=1eKGb3dO\;1@U>:aS[;L&,cTNC<G
@K\Nbg((\:e1H<6g1I1X2dO:]&0L\M0D9ROFeU48^(+e9FJJY?R>4&PD;Sg\GC;>
([YIK8>gLFd[S=Q;g]CL1=Mg1UEQUXFJL5&]Yd9b8@9S=cc=TdMg>?c]45-DMa:6
&]8>4,YI,-#AcE+@U9E7@8R[4(?HGg)aB_gVKUR=3E@O]UR?b1KLETY]WN4Pa[9f
22#Q,JYJ\Z2?@aUcH8@PX+#]&a3Y,^-Bf<6W>R1&V++/O;S)/-_FT29beLf24;:O
fEG,2#NIZ]6RDgeB96C04C<gbIeOeH(?.8[61d/]=B,IdQ>NF@:KUR2=gf6&ePMS
9H42b7M<caAIRdRbCSWQHXM+_+Z8-aFH/@^IFdbJb1^MNURLC(gIGI.JN_Z&>SD@
OMGCef7RdP^QOV[HPX)S[/T]GA(5?.EI-OSaV(/eIL/Ea><+=Ld)_,CG\NcE=)B_
W;c\B+8?,/9>c(UabB#&.-bdPM.:AIA.)?PM8e>)V0_#eI^<N@>V[#4RVd;WG.<.
6-EY;Q6P/:ReD=LF8_Gg@QM8O<<ELH2L5_eLLG6P;I)1+#cd-Fb2#PgcYB)b(8W7
B,-2B@1@;1Wc;O7@Wc#RdCS/O&HD&.EBUdI)30If8G]XVDNN-FMA+EEY4_b6V#,6
+V79=HXaJZX)\QAYa-ODg<JR+G]I_9VO7X>c<Qg0A&cc\b9&@WfLcTQ5VU@TSe-F
+QgURBUJHP0^K\/1DJbJ>FaI\+XPJ6(MSF(JD4?IV:-+c>LE7d-KH8]e5ES68T25
;HeW99NBT2U/IF/?N]PG2SSQ3+DQ0V?U0X(>bSg]TZ>T_67\31,2(VY>T:L3.G;;
&W+Og\S-Ra5_(P-S07X5]OJG/R)AM4\c^_4,@YX9R@/KJ[ERR?B_7A=:P@C6T:)4
D6=C+&OV.H3./^2bg#)9V:)#<MCc?3&[gJVfX5N)2XF#.LKTG:bH^0Y@N^9,[G.0
Yc(_PUbX^e\/5[TV<Z#E=6\YZT\BL>PB?[UO=E?NSeZF06[Y4cD+&A@L=K-S?61D
[KYcRURJ(15D\?R])a)=eZLf#EK9(C>B)-0Y-SX=DDB6=3R]7+bB^JI7U@4gZ9.H
-1G+&.&?HB=?+5=cf@/BU,V;eRSB#JL[:5f;RSDAf?E\a5-OC+;OC#<)0c_Mg5=S
AJEZL8I/e^Xf1R7a=7D@YKI/H3_.Z6])2QF[/U+H#_6+0SOK\F?>(V\]6/<JNL\8
5[V0e/f@ETeORMZ/&Q88P;(XXXSKR,A04NP.;U=^,I.EH_dLQBgfa[Qd0YFFFR-T
cO3-PZd^I&Yfa<e^&_HLd4Fd-W:)&^HJQ[=I8I\-+UY;@KT#g4UY(0.I,7G<UeAG
A/(T]MeZ-+)24b=9SMG27=S^&5HdM]7+gA)eNC3SL:P)dY^RHcM.7R9EUTL83?\1
19@HF58M;;Ag:=TVbYZ9aR;OVgQb7CJ3GR^Z(=O-35LB(S^FYXNXVTDHGK=4ee?[
_+O@UbI1dJT&-A-226&:O2)Z5/GL10KTQ9:B3GIEMc[P/.gX?8YJOQ(J9OcHEe(F
4aa=_:#U1&ef0S)?>C#8O\H-d3H[D7H/Ke,E^OA0(d9S7X_.LAR?\_S0e#KH34Lf
+1,#JI_#,]>Wb=,^Af\HfbC-6ZScIXJ)V+XZeH4a<Ye=e^d.(G>-Sa@[T?ZbCP0T
4EHD/TPNe\3A4KOgXb<f.V9RE2NX+Q,DRYgg4?aO(Qc,b/+/C/8N\J2c(CdHbU=0
d0:^a.gS]c6?PB:_3T(19@;c)MCJ9=<Q&166]bUK_+&999?Z^1,,:DI[B#NR,+X/
)gb;)HC\2^.TFN/L>GAEMJ.-PVNCKJgBG@UOJ0fbOVd163+=VC,-MG^fRabL?Me6
.2a;C0I8>&28EdX8cP&Q9X0+dF?5P,=1D7W1H\ZAC(b1Ba7:OQ6a/0)/fBWB^@Me
(MJa)_V=6a17g<KNI?_Q,J[.Rc>;KINTU1;T_@>d2e-MA4[A@;dZ<fc)c3]Y]6];
@C@[WC0,EbDZ\G8U\;3e=D.77TE9W:0Je)9,Y?T5J\.WB]gG=^L>ed9_>9]@W<C#
T:e2UEQGLg7]MZ&XB#IF)d5A06UM9U0W>CEIK@a3-_@#\9DPbX_[fL;/eY3TYP+&
Q>+8O6Y:eDEY?VEI4H1:(ZIQTcN(T>D]/e_MDE.B2,ZDeMQ7\9O:M;TJ=Le?3f,E
.4#J:-\:^KT^U@CIX(TV(X3,^fK7Ybcb3CAI^&<d8SV-MJAc_KBeZb736g1AMJ=.
4Y;ASC:V8@9V?^)TNB\?JO@Z4#1<,]VS\&\#=E=I<,0Z[2a7E<H-<,3-27T05I)3
L/S=]7QUR7LdW2KN@89V/8PT3(Xc>[G_=c74YIBG@^>dDMcW]I.b39gU+(R=3UEY
f(2[Z99@TOd1+8-<ICFbfW<A0++HK.VAWH9gC-ISO9>76J@A@>905#dc@>cMU9).
/X/AANWVFe:P8+8UX:E39OF@4>1.XE\@dg=Z6FE@X-P&HZ9GJ+9P17DWTC9ML290
##DYLCKII&3^&PY6)S20:.>WIU,ae1VgT3]TQPM3Q^S)M?QAHXE#)-fLcEXK(gSb
]b8KE3#9BW#^MC^+V-FMR?]G3A36@)^)DfH6U1UH5YX^S8>/QgVJY8E3WS1A4Z]4
e6Se4#=BdXYE9PF5b<K&R<,6;Ue,1e6IYF]CbESN),e)@Vb:787=?FC@AQPF8=8&
@fLTBP(0LIgEWdJQ_[.Z)]5QgJ)H60#\T4B4=AO9/b2.BY2Q;70ZIa\OEJ^(Q+26
g\=92]OB1?G-</g6&RG,9GCJ-_W67d/a^)B^Bg:_^>aX2Z-9gf:H+I56@&T\ZcF[
S_/PS68g.9@S4-PI/.N=VcQ:-^45V[bg)HQgH3)^:M0.UAYB:<b3XIZHV725L+A1
6AK(J7aFOH6U7ZcCY61<7cO8##^_;Z.L;1b<,OR]I=gdW+/=@:-=cQc4H>E&ZfN+
^;#9DafIU5_DW)TG27MfBDZ9><S00>RQHU5APM2A-C3Q=W7a<QY4;BT6<S)WCH+Z
gQ2WT[H6a1g:I+a=:H0]H&fPd\K?_Q>gE[4-G@f1:J413P?6^SQ(#&ZDE,QV9eT)
5W4+>a5AJ>e71fD_O?I?.E,YSZQf:?cbg+Da6^9\#4-=A4U+Zg98O]FU)]#?fD9:
+G^]Z(]35VCF30BZ2Z#eeSMOOHU3+1.+6@<:ecYgT+&H2,XL265J;GPSLN-]c:W,
#cX1dF\L\1+150FJI\0&=+W^d;N2GJ8Q4DOIQ0PJAV7PXG;N^;1bM7-U0[IP4Z&F
(8_JMYKMNeH@3SWAb9NC)d7_E5JXbX_8(CJ#_@fGM+f3A30)LFW)&PF4dB^MQg3K
TX768D,O3YA\4)\)>V.Zbg5:\=#(_(eM>LB=&BK#W.U=R:MN+HPL6d0-4,=\N+Z@
HTVYd#Z?fE]XY(f3WUQ5[<L4VDc-5Ve^Sa3NHQB>-d>K,O&TE-gZA6Md-?5=)0K/
UdC-_4Wc;bgQI_g-J]+--9>,3e:EDL2XQ5U<DXgf<T:)PMd^ZBVZS)5g_..gBZ-X
C3c[B]gb8<f9:Og8AI#L-B4/YELM;df9])DFP4?#H(A;IEF4;17T+A/^E2>S]GL,
(_NYd>>\PbYFT[O=;=#Z2Wa+XJ?CQ-(11AER]bW3N=]8V,+4=;b3[:UbI:5I]BU]
3+KN+8W7J4Q;0&D&&HNBL(XgH,<P:_T&RA13f),8Qg2N5S9(4ffVBa/Y(WK8gESb
F,@HXc[W)5?aNgcZ8_JO^KF62,P39Rd\Z&fNIO(dU[Pg.SedfXEgDL4MePUH,.2.
=2g2IX5A5=aQC&TP#-,(?F)@X]W^Z<IG\3QNCId+]C;R1VOeIM^J=6WN>^V;Q,Wb
=C\@g?)Cd<.I^E^@6;eHe#9fUC.GC-UBP8SATGH&_HRMV;Jc,@bIHaF-^6Q3FF\0
[Uca>4;cX6X#g1D5TJDcA<K0?.M=V:,/e,)4:-4TJ>f9<NJVB5][9-^O=YG.28(_
F4Xb7aTAAK6;/13AS04_6R&M#b))BY.J:=V)F;<gZV:7IYSa5>E7f9G-GJN>.^;@
YFH0Z&M9:JB,JG;?VCe=?[59_/QNGOPG-Na4TNGN49gO0)a&b5GMKd>;FQaM:4M<
?(S<U+(A1G/00K(b2;>V3K<A>\F;1>WJe\M\Vf2(<)C3.S+:e/C)U70SO>KUfG3K
?N_MPcJb])7#IebH.V,T>-[:C-D]KR#Y1>E8/JCB@C8T6@FRUcC,21DW8G\W/[^<
M[(4cM85A5/RA30PN,NZGXW,7@20;Ma4XdQ(V.?\Qg/gS,B_FMFIEa6^HRDO/8@^
;2f2<3G[STBQ-0HX#J6)Y>P[NY[EA3BOKDJ4-@/UCU.3#&5UGb9?fRQc]ZC#f(7K
AA03e(MP>WXN;/.7#+KdJ?HefE+Q+FaLaB0F.381O+?8?8Z;RaDDT(S/:8@OHRT<
75?cRALU\694@\J8JO#d&gI1f?J>J7S);_eMZXAM+N6>L.TKfD9V(3ATK1A]BG_X
g84^UADO(BdV:g0R,+[G<I)gJ[cJO+f=[dfPG4.U53;(,#^&FeC\(@ULg?@^SV[a
e/17K3KPb8>&+FC?JZ26#1^WCQP,C9J@+[aXW6c2QW>IJU4@=KA&J86O1H&60FeU
YB/&RbVCb/\7)S#R-&-5fX<[]Sf\Z\29E&6[e-,H&bc1LV>U=MSREP&SVG+;X.C@
^F<,4_7#KdQ;2=)-G95U+LO5QQ0HVX=)X>1Z\#Z]B\1+I#R6\4PP_M\Q4[8DBd5H
L46+gTbVdSM\PJVE8;\X6B:Ce:U(fP7RGd[0GaFc1=2bX>eXIL[a<:)XUDdOT\0J
FSB10Kf-+O;CA/)Va[?,;g_J^U6B<2J]f+#V;T\FDd[HOQZfM),g_8_Y/1:\W&HY
Jdb3--SYYRa3I_2PZa3:SSE+C>4CW/7KCJROSJ?,-JDZ5@3;8MO\Q9,[P8&R3cU#
@ffAJ=LN7XR+Q(V.&C7U]6O6V6dK@=-0^CB9+=V4a77OI9M:b8DB-^?Fc.<P)C[>
I?5+DSTJ]V>,I/1?T@=E4^S\B<0OVgb[D:BD6Z,Y4W5dd3H,\ab]aCcd@,?8@9?+
)D^5238)TAFI2?JUgWd81?XR7=:O4M+DP(-068Ae5/;#96(&]UdBd#>ZH0gKIf8,
eM2QB8WMY4B@6)B[IZJcU=c:K-G)>Q:5&VLS#\dDLbCEV?G)N01I,cG[0fWHS-:D
H3D@DV.Be[8A9fF-WV&-GRZ]L:C+-agWHJ):_.8\P0:>(,1#>E(2g+=e4LFd-G^B
X-FRC:Z5SG\OXTP#cD-X?c:Ae=\+1KG3OUD;;6g;TIR[9]O-@OMg>cMSC^^gUB8_
/B0F?XMBI#:aU1e__:+W3\G[XV#Z01d&Z&6]#Sbfe5:b-5SU9@d[2-[\5BYO&40(
(<e/<&R8R8P<-?XP,I<QbH2\M_]L^UP378>#U,Ia&bYUR?30PX(J=3-5Q1)]19Y<
U/Mc,PeN+9_>O>OL>e_WX3?Ne8M94CS5/#0+cME?f]=d7E7;6.-(WBOF3?/5f/=g
HJQ3YAYV1)@a@4eV>@UU#e,B/@JHV0aV2?:C@B&62K+=216OQ-_fb79Y)TG25cC[
M]Q1BTUI<8_8L0K@[@W=WCQ^RK9O+KOS):6b2PZeH4>GV5]:54R54QQM6RF30bRK
IH:7_;bCeRJ^;N=)fTM12c60^^d5F_N4J9PgN,/A]P5V)1#QTNI97J)?8:E+,P:A
=e5d]0?Hd3c?15HPc])a466WBDF98UZa3/8Se_bQ<(R2O+DL=14\)=?f8K2H5+bM
eR.O5\<XSE-gZN)W0MM15H0NF4)C17S3+,M4BUQDZN,b50V&AKRY6<Dg@a1Zd+A-
6gd3/)@NI&.BNM(aZ;I39&R(Je+#;7IO7[c:Wbf>WL#+0)5fc/>S>8E7@JbaQ<a6
UEMgX7gJ5&G+]Ic]3.@QeC83,dXQ8/.UB4dXA(_PP0IR>Z7+DOJK[aAXE7GT,(;b
Lgd8JBBG._e0JRSTM(0,_J3dfAc+>7NI9E(B[<K4e(:/g=+BIN5?O?DH4ZD_E=P)
@@g4<Nge@>#L6FAUALM]dA6,f6M<3.?:;<U-5RPdV)GWg(\4;TD#baaB-7HR\OfK
V<MDbYJ9\Nc-&:H.XH@?DA.HJ[g<M1?:N.^X8K=@,#>KY(e@2L;UU/-^Ig6aGC],
/((1<=WQH1BH:2]g>gK8C85Y@PAVQQ):a?+=WU]GPFDa:2MMBT[@K)ANJXDEMPSf
FMT?&R/<#>K9/9A[8>9YP3f@C(D-9&?;F<\2A&RbN9SA,[69fG+B1)N4D-WCK=/T
1JKY1H6F\&a_Xd?DJK.9DZHV8;??Y_13PB]GGX>I^<RMdJ5;3<-FUIO5K<0cN=Mb
U-;ZX-@T,?5ZZIBc_0e9G&:-dY32)c]1KN]>GHB_B[\42O&OIR/PE01=^.)8a5KF
&LJU[+fT2e5BP1SC]O;)=3.=K>56SFJWR,GReFW91M4,\WN]AHeE1AS5YC1cZ^T-
L:b(S/:T+X@BV_9-aA0YR?DLg50,L^5WgVa1(V<SB@=68#FUc1).8K9a?Sg03@3B
8#6I79J5W(FE#X<e2I^@QJ@OUAZ>K<5bZ?VE2b1N@:I]JV-Df?fHIXTN1BPUQU5R
Z&XRdIO[OO-?e]C5Y&8f]C:EHD?S8QKg=@42Y_=48K8b8d1&8\>)A#2f+DS2:?>O
Q;DC4CgWX:GP-),6JP(Ae3S57)fE5U-;+MI8YWe36Y+U<4I>c)U/@YI9_(9O-VF]
5J51]?V/1a^?ATVDf\?KgRW7.-\R#K9J.e_I6@Xa_3BH@+<AH&LIeRWR]agdH>bg
\S90feZ.Te]H/&Ie+Tc7__aXQ1\BU1FL8@\0;>cP>L^6VFR6gOX)IXN<W@OaXW\/
6]W<fcW+]6MXK)KKeDg]1@K>bL/))a]X;;)JK:4=\8b@5E^]RJ8#(E2JQ[NSbR[T
Y&-0\09ge#H.b.ba,<DR7^FaCW4g9DVU09-ZGH;S7\B8/0_\@Q2AF38R4Kf/a-HR
]RKX=>7J#V<A0Q&:J4:\27-?a9gY22=0aYgEI[+Z5R6,9FGf/Q((c\_X9IeNE5\/
4WG=eW-JRAT_?.5aR[bN-^5OHZ9RX&e=<=)J6?=S=+e0RSRD),#V+6dJJ,a^::X.
8A6H0>\Y>d8bNZ19&<dDSS:<NaAcD:6@;DS+-&Y#CP9172Y,ge]EY:1?.],gAXYP
;@=;20NF\KVZWbSf2B&,VN;(,.<Lg+5:7c7GL&P>(??9@OI-F0L.EKX\?9WOQ,/0
C.IG\0<V=PgM4IeRYKA?_f0[T,V@H3K,3[bcb@8;[JO5N,:/eYHMb)ZgZYId(e;^
Va/<]LY6[,S\TR-eZW((\4:VCN,,WX[AZZ9WIE9#ERdS>/7G/H?eN,+[(::11#T0
1XY:fUFRc(X?5DD<<=E,JPH;W](/6LQY?V#^M#?UdT#KdgA&2[_UOcQa+6J^cOR_
AZ/<-(E0(0(aTBC(VHTe#3YVK5G;-fRa^:+)1Lg-X8+ADG,RF2UMA6GVPOQR&8/]
C)G6c#2J/;J<Q46KONM<+QQRR#<408aT_bW:69Q)C/=e0RKS[Cbe9A;GXCEWSX6K
VFVU68LG=SX2LYg#;>+[_T5^UeY;&,]F2[.d#_S25]g0MN(g\C4c<a/8g[F4VFVZ
&C^]fPe<A9W6M.JSB^C+W4DO9R?S]EA_J8OQK@aYEI-fJM/_INE1B9c=f-B0K4fO
VK(2T.E?F-Y8AO#dPG\I(+ZcPF9-(FFAZ[H<VED8+]MK<,7)E\B8/DI+..6@WOP5
-=@dJb(M,N,L2_FbO=W1A:=[YQb@aZ-9c\L62]cd-Ze>_WEbG>,8[=KU+?BOO#?;
F-8\8H?-X5]cIMFC_=WMIeQ+R>BX00[<Y?,OeK<_@;8:NgUaVQP)c^SL^B@;O2I:
b-T#^.207S04DG/[XY9-CZ=b@b+\VLKETCES&H;]CLL.2/Va,<,H<C3EaQF_=MA)
_e^cY7@&)QH[dfP3EEQ0P:7.,c--9@^@?8E;@4R>R:19dDNdJ<9N[dVZ8[/d3H_.
3g-_6IGVAeG(+A<GW&EdPFQ70?JG(@U]=dS[B_+2WV\<Q4dgS6QEHIaE:UMT#(OD
.PT5fIV+_J;b#T<8@SH@8U]#EgU]BQ?(<KFRD0DA2H);V+]aHL#^eO[&VbJ&6X5B
J7R/SS.^6RPC\=>]WUTFWECVI[@9@U&E:F\g>9W5cKQfTQ<B@8BF+D#]AO#\+]NA
ZZZEKY6ULfK&)(Zb\Eg)9+>,.-L(;A6RdEI.^a4<\\]MRNIg=ZX_W_D4;0<4CB=1
WQS2\(?fad7gR.dGVR#M86c)6O,E/T1,H,D:;VRc=&RI+F+cS1LX.gMTH-#[TAQ)
&a+/E467L^MJV>;(fFKcXaA=SCM^d0fZIQ)3Z[CW0,-?9eZ-dYI@JZ(-G/=Y0?Z8
A(&-8dQ;>LKWE12#PTN-fG60JRFc1B&85))&,#7ASc3dX5Q_;-03)Y,VJNg=b\<M
.Y\?Y3:4NO=+#/AMJGa>KYc76_HB)2TW3\bK_GGA5OJ19dW]UY4XYQXQ5BCaWEBO
)fEbVF08WWPFXXM973:J3AX>6_QR&T=YW+a^E,6<\)ER&11bAb3HP0N01DeQJMBX
R_\Ra[;Ae(&1^D429RMBA/Z=NB-60_H7Mf^U([3W^WEd^5W]3>JCTVPIWI?(/)(S
/^3DZE,B6@)[]3[W#D\S1@G=,(9BLFM;DYCZ[M\bgV3&=I[197WW&T\WU^KH0<=S
IA;=W3Q;\I4\MSM]#8ZbP,33YE=N;ILD+[ZQ2[O.RNZQ>5R#<]\7(LY#J7&10;8J
4RTfRM^=72T0]d?4&UG7/UX-_J7(bH..M6_K)FR/d_N5D9Q.g+e1RQ9gdS.;-<+=
g340P).-L)3cc#LZ>T_5Z<W43.B;IVHU]7\B5(@6.F3/#B/&;3X478?K91SO^C;4
<1Y2_F>_OMR+-4=?I^Q&V9AL)X7G9MdA3FP#(X(fT,PPDNd8KYK;ZYXRGV8/;VA5
7XY)ZcZZ0fD?1acF2PTMR7KIF20.ED(eV?gX9PM<^5c.5P5g5gLc>J],_-f&8&+E
2/&FSA;2eN:;<FDSB#8YX4MZ:=1VC[c5^M#26=6PSA.U1.DVRSXLHW(^1]/J25M2
]AZEO#c6NA-37BFP4_RI_L<MH7@BEcBND1_2H/g,64@B7aBTJ16&I5-f3I?Y]>+]
RJLf]735#aDfIHI)?5(g0J#]447d7AE1-(^MD,c9NO@Kb;^@F-Bg_[K&^cFNVA2a
NgJN2fIbOHPe?Y,FOZ#XE][M\Ye16]#=B:@F\:G4,(F@_?I;XB_.7:ZM,?VWFDX;
ZF(:>32_K?4#.P5E:7+#(^@?<H:>NDRU(:M<JI;=.LB+4&=M)JFKR&Yb3V[bJ\KP
)^:&S2LN+,55cdMGc?1/LK>+2e(8,LPA_c/c/\\6EW:/f-D[_R(S00(^P7CK/L8Y
K+S?./S]c\7U0Q\=7c1ERg1e.9c#CV@@@Df>L]\B\02M=_e:=cBMGG9#[T.QGV8/
^c:\(.H:>L2d>@34fN#M21b+U+(AV74Q17Q;OcV<.[);H#_@XLTKM<3WK+)X#IJG
(&/LIFe;7)\@R?5<TNBdLG-fJ[=\eAAA>80a,F;4CW>#5(3<g/2R18EV7&d\IaaN
P;N2>6@&J1\KQD)MaK;4a<@M^?G;a_#-_USGJ8a_e:;2\:QQ->;L=6_\?GJVa\=7
C3@5JHRf5=X8+[M6dZI]R/X+V6agf\:T>HXV2Y7(G\c3Nd(&eD?9\AY/ZAdSKD8V
g25DdC;U2OS38.JXBG5eOV6E#&-V:BaDGQM[9aX@7>,JHQ:VbbcdTPP:e6g6a9=_
A]):g6AN)aIUXf>=5KFF.?4G+;bE)3SI7/N\>AMPS0=T<.CdSCTQ;VEAJPAI2M;6
1/]dPd3H31\S2:\A;gO@X^MGKYKYCPW)gOLH0b+)FLY(K+I865K;8fUXUU:]L)IK
]I)](UGgF^_8GDW=GY>O2>7(4A&9Sd/e/B:X^B^@e=&.&EG_H6gO0(G?LR+d-AFL
.^)Q[RJ9J^Xfd0Y@RDCBcGHe=Z:VcL8[Q<<:\8?2Kg@cE7H[AY1^fd<;fY:#,&(#
F]JW.MD&B^caZKE0Q1Q:eW(a?(.bCD>D\^faUC,D=34^8a8O.\IIVe4b,K<Qf-cI
D7=+-32-a4d,(?O9FU&O+W)#@-c\B>EDYP?=0VaI@O994)gYHgc9dUCXZ)PLd2d,
a)4F9Y\+g1VAOU^)BPR=Sf6/TS<O[CKab^6c,?19dcgI3,3(edGaNG8QgW7?57&H
5KP]^\IPDRK:HNT,;/NX-A_1:8bK6)O0,OT>VP#7KWTH0>4(>LT9eY8TNN3FKccT
K9@MUa)_g?L+[1N)(I,e#1O&F^Z]/9>Gg3e@@09NV24eQ7^Y^0&N;V\]BL;?U<F;
Y(#9)(e.@>GeZ?KdO4b-=X5XVXT-IQ<NG=W1S\.9T?<DfPR6PbE.8AY?Y5AecJK;
YA^K\[(ggD6cA9_9S6TA/=/)2-3W_CT>1c6N#KaeI@cIf]GZPW8WcL<OIRNedYb(
@aJE3BU.b[W0AUHTPR].&Z?357aL(Y&R=K;0/]=4/1=3&F+#-6&TLO&C6;CFaUa+
aHL]L[..2V68-8?f-Zf;O.aLbcXC2LKYf9C3_ZAYJ]b/FQ?\GA-IfeI#AS?=UPD[
,g;;.f.1?c&I@]W[0LI/P_c3&Vb@L8D0P35D.;aF_S,@]F6KS4K#NI@ALKZIC<=_
D]-2Fc::]be_[DR=\^56+=?-QVFM?R]-\PDEJ:,Y[OW0#+9M.2JN)]4\>[2\X6f#
_ROg]-_U8ZI]ETLWa1?O-U,=VE1eKaA(JfUJE=faIa/G15^^;.TE<Q]LA8fU:O.P
=Y2MYB\5>OaXE5D5HZ0a]3>2(c:I^ZHHT4;)dgF)d7EDXD/<<&(e:9B(@g1Ce(05
MYCVCB_G?W&\dAY5BIS4\X8E]=L]@//WbD2</<4])RfWc@CFQe,8=La13Y[&^bX(
KLaK=3ZB/_/fS1]+?[BS;X).BT5[#,dNZE,>2EdA<FX(H1]<J>a[&d-\ZA/f._L\
=+AZOA:2@SYeH1K4CKaD?cgHK9@J]+2VGAE(4c+F<4#MP;X4]E/c1ZB/)DW#9H]f
CR@+9<FV#0e9O;]_;cddMA-XP^70,^PS^)ND3Rf4If1,_<Z15T8W1e1;>aI^e2PD
[VFB7/L#U=<5Q=RE7]cIfM=,MdfZDK4?:>IQCOF7T)g0?,:<Bcc2Z\2<UgV3TB-J
LU40(^H(7(WbR4P(;_Rd;I1&K<.CdH51Qd1=-HC;0^<A\>&#3DMJXe/W9;ZDc<4g
;a:[C?@Ga?G1&C9Hg,[]/Y44BS;e?6d3@0,>=@;O8/\b-#BH,OIQB82.U(a#BC[E
B7]@HCO?6#8Zf\,5Y0AOV@\H6,RKMgbK]DJCBA-6C/_eCD+K;O-7=bWQN&E7<B\T
80V(U/SL20?-@<2<=LJ0&)>>,P\;[)E&N/#-<YF0_/VP(GZd>1[AECVW?A/>7L4J
Re^.<^BOK/2+J7J=BSG#N,,dI6&egF:;O\\A1W8.UCKSf6,2R2D<84D4c=.];#1B
Yc=8?IP&N[5&KRTY<P>E&[CN&FeUWD?3_4C-.8&AOfc?I@W^AXgHe\R.Me4D<4Q(
Me8^c;FHPLdEBGJHV#2326WdcG49g.T5M<eRCfQH^,I<2cCEY<bgggYG[.1WbU5B
Ue&b>@b6WY^-fJc2dO8/Tg9[;;;;MD<Zg5eBNFLJa6<X.7XSOYJ(Wa2MfTZV9-Jg
0,_d]RcHF8a2=J\:92Q?Xc&1&=XJ2NZ2++681;O408fOQ2dEaYBcaM<ER]),Z3^=
GVCM^I998ELRTT#VGb_>bI-\Y;U^EC3+#,gYSD09\[SHPF8);X_V8dZaXH9dCLDY
c+6_SK93Ad+/ADR&C9#7Fgf^Z64e_<^?^8Z^+LQ/V:JT\(T.&Y.7X3b@8#:TCRXH
TK<WZ44b.8QaV1E=,&L)2JA@]L8:>1T3E_c9V80e(6DeH89AeFN+;]dI24A0Ta;2
[OV;g6f?dd8?]&[PfULMLd2eY9\1AJ#Q=&]cN4QOEN14:_I_;)N-NFQFK1df4g)E
2/agE\fcKH\CJYYggKGdd+,c>Z:R_T.EQ0=;T)X-EI9W9VNX^^M#@B[7U_3g;aW=
eF<[QbG>_8>.LEV0b3=YNe,VRf,YEXKJ/9R@gQ+?L[74D.Vb,<J5f=:OLH=]MTUZ
FZQEU2=Y-E5fY?1Kb(.S(8Vdde2A5eFN>e;E3/2#Xg->e_cKTT9#X3R=S^A>#NTa
@-HX&6RHW;5=F/TO)B-2V8CF3GH+FT.N96MU^?;U^&,;?,4-2eYJ:We-6JKbX,W/
_Yg9_ERC,b+[FF,>gBR)fPK/EY5R4SE8#;(DbMFc7Q8_9fRgI^R7R:(]aY&((-dW
@&0SO\cYGg@>::X:@4QF[\(f@>3;O<@S1=M.P-2&]54_96D8HIY[DVJ#A3gS(3be
aeGVJ-X:3IIbK3M]=+C9b=0.@1P1d/=fddT0LHVZdgO8++O,5a18\Y-8#^QT3326
L91^#>>a,3d)5RfMWJa5.3_8ff1a;V=S/V.@B_=TTgFV>).<J^C2(-Tb0d>K3,SD
,PJ<7bG-_@C)]&4MS/R_HC&/?W.ee?()7Q8JLaS,cM\E3W-/8@_;aM=gY/ZB9_YT
4a]IVC3CEcO&ID/()T)T+R=34H7>PY+YD0Z?&CgX004FBU:GLX[\J#^SV6/B3T5,
,68a6#S<\B3G,Q0_3932>UHW/_8/-EC+#FQ_45,cTa:XB)Bd[1F)K^3S0dP@<K0N
ND?-,+M(\A&-B,SC7_(eS/NV=[WSJ@;^#,<L&ZfI-<=\)\03&#<N#KgWPJV]E]Q;
TM6[]75;]8[CU9b#.ZW[?@F@Lb3GLH]_R]VOaWGZN=[9W((^.c,?#Z\+>f,@[G#U
^\>Xa/(-0H+UP7@T>/T[SDNAcA[D<2f2P3N229BF>G=7eCBdWM^R7=W8/dYG97Df
56J-]P+D?\^Z9,8E8Q\PfM8e+3:YQVXG\V)DH;&K@JaGOgE(L,LFX&36N[?PfO/g
1de:QG]>#dK.XNSB2DO?_TMO>WeMPEWRfI-J(30P/87&755@MY\,GA[C;MdEG@/+
U>GB(:,EeQK(a(J5QFQAOKJ^Pg/_6+ZDAe1/EF&YD/R?P5J4N](g=92Bf2b163aR
,H[<dQ+]1N:_<.=eGYTaOV(2#@e9;0)5U-4gA\geK^CL]d^EX[PZ?BR(V,Q#S(M>
J\QU\H+aXFNKT_#43?#UW2=)IFXF10_Z?;NLVA9&J2PZEcHKH74XA#dS,2\:9a;>
@EI/+ERaf6HWQc3V6f@VFU8;ILe@&<E_R&+8S@I/N\I1>.4]+5DT6cdcZAL7gd_R
HKK_B57]R5IeGMeP-#aDMAB:9(I-CSG608RA\ebBTG=,A\<^>S9)NbF.:A)TOG_)
fX0.WRFgLPPDFDgYQ/4]f&1W17>]L.^CI^3GVDQc8;M7E(@M0XJ&J2TBRM7JQ/\.
VCB7D<AM75)68@IX(G(2A6P9=QM51OANE@VJ:E=CD6+KE?C7\(PUS]P3U0E(9#T,
EQ[-+9T&?f)&>?8bHBUHQZ4N\c&A4:R3+=fO+6=[6=:JcBALda;^[Q9U;aTOO@CT
NKD-(R3fbXR+gA3YeW9R=-.6E=:2-@GEA;e)>92G\,PPZV[4fPZ=\>O@/83a\3U.
/^R_=S&aEC[4Zdd9DZ;@-&/e+V(?\@_P))4.Z3/6LXg<<?EJJ<[R:TagG&T@XA@K
.C=U5;C.gO-F-?S\<a4P_1>ZGIc&M5dL3E1d2/f9Y^MWeZCTg+eJf/eABN.QdUM(
N?RN+SaF=HYdAcZ#1)=9GOLLYI-.A2L@UKAVFDCCWd=[A4)ge6Tf1/&[G[+f3b#1
\5a;QEg>J@+g.Da8.bVg3>V^1)0H+&9fOfSc:5L\\)=>+QWf@665)60&3a6eWZ6b
_PF7,QY:6IaEY+F<G@)]GCP5)JLRZ0cVfN-F6gM[#1&e3VJcQGTG>,[,NO/X,a(^
eY#ec5V,37HPR@@JcRIKFcUW,M>cM,<FTL0fR7&124d\4HEeaNDGR4ZN_LR(VKe9
Wg?c0/N81HAH,Pf)@+f]9#74(eb>N90@&ge-4cNV61d@_H6]XT>3V(e3HOJd;Lc8
5X[)#68JV&3EIf(H<gIdG1Ja7R@=/]GFaG4_bXM[BM#0^6aZaH(EZ9dU=Ae75(6>
)TNZN=YJf>68S/Pa?ZQgLQZ/GeA7P?^;W&]R+UcVE-2[[0=A#7YSf69Y#L1W8\SH
@+V-=H#7-=Y/^=UJ34,V41KHL.O(P@K#&[F3=W8Z3C=J?D9fJH=RS^_I4#6g^W>Y
SZPHAD-7.J9Ub5L]aQA@g[^D]0=V&[b3J/20D.H;9F&O=<Z@Z+Z#L3+GIf6/c5QK
1)MP#d:O10<bBUI5530AH^RD_-VK:Rd.LBQ_:7Z_>B&f4AS&Hg0Q.EM<P\:HIL:9
ZOa//FE>TAK1(T4B[=Ka(\IK_(Rab\IB,N6\7QS&ZW>?EN1).-CWZK@-/_-7OZWQ
,>gbZ]D8(BVVQM,TT\)5&#)UEZPeKcKZ<,E9R[[5W)Q1+c/@c0LS5_,[ZN3]b>(H
_Q(3<gf)RLZ>KVAdV8AKVR)Ec];>YdEYQOK#/JGfF++CD]AQZZ)KGOJ;/K5.N3]W
9:GHT=)6\O&3HL-\7^0LTL_59CcI9OWe_3DIKg\DWY[_f4,@8aVFB0fKeV35T]7E
&VZIRT=7=Y-,EU-;cgN.;f;,-5GGZSHGX[HVM)_V\AYS)Xce2Q([,TATEIGfL1C:
LG&67GP&WNL&\,-Z=2B8UdSUVX?G?6(5SGb18Qa63B3.K5aE=<;KRX&A&8[3aL\2
T2[b_&0JVIcT[2/G9./])N[\V,.3HR^DPJA=;,]A<K2LgS2GaFMROJg2VFPHC+16
_RcYCL7(3bZG<\N97b=3TIKOc[O&A+&M&Y>P6@Gg/V:/QMV^X2O+RSB]A;A@e0T0
)=f)>g(L2Z5-G:,_aH0#CO]U;gaa#0a\BfG(6.F80ePFDP]<I2CO-\]J?YRd:VOU
1(I=WM<8b,=8KZ#1BOb3S&c3D-AVQW-XeMA3c-6WUeIbd<S3>H6#SfUO^[]\THeJ
eF^gfZ(S,#K;acCDJ.Y=4BfV&\\9Z>M7+8IBM:OU=9^->CA3LL=&:UD-3fKADO_]
_]Ia_UK3P8g4OS_N1[8<H&W_?(@OLA(275?VN6Hf=g?GPLR2_?e]^F?3L=7(UVdM
9-L03YX^1Z4:\X;e:^.MQbaEVZX.U)g-_VEVYP[fdYFY=Zb;/O-:eZB>B+65?)Z<
>0Xf[;4KZ=5[Ac0Ha.\Q0F&3O:5VXGTG6@6(SZWBPP#O[-:a\J0B2##E&8QK0.D&
#.G0SDcI2M@7&PgW[VXcX._>A/2?cR&0,=:RfC=)B>X#fY3Dd;g-B3:OPN4\6^+C
]1Y&M\7T9^&0#;>^dX-5IM=<#-3@GbMD9H+5YRc,?DM66N,&TG\>[]4WXWK/+).C
KS^g.a<[@2,<633fKM2b#SI)eDaS(aHSc#7S3#^,]E_ETN136EW]._WOR#LCAaJd
7J,IU)B&C]X.X9#G&fVH8aH)cDNYTE#J[QWVb&61P6ZJ([6Cb<_)4#6P_AS#&QXZ
Oa4XLKHS&YFdYQS<<aeXA#\DgRcD0V^K(ZaO#T3.]0>^&K1>dU+8<&ec-;[^Q?\I
U/<,Y7N4:ca4P>=d=?VQJQ=-:C[=MT2Z+O3-G^]NeZ;+1?Qc]@-_;F<BMN9R4EI(
6ObN#.;);U1e)gP/8UDI/T\K=MQ6WV7f.=0&H1If?V2BK^gR3PSOb]aT?96EUR,[
>0bRb>+#AG<O=&AD^WWOc=)BJ<5+20MMW\+Wd/XR;2e\,]WL67B)I[R&:cHY/BU5
K:0+L#5Q.+HVABN<X8Gaa5NYIGGD@I&14_1XU\(\5c#AN:=EUHaL1N+K>[UIJM/c
=Q_?HE7>S;-g;Pc[XE>Rc;YD#.5RbS68b8;\P_O?>B1&2^F&Z\IJIEZVT0dKe9Oa
9?bbES86N8O3EPB^LG93dCF/>)Mb78SO;f-H/]IS4^(F#>\3D)d)I@N])HPBSE2]
OAY=O\MPZa3;,(RE<@-]/9=WE]7&8OcdF[W>Fd8[&9H9I65Z0YR?WDJKSS])b0fI
TZA,^1ZgG7&#A+3[ZWYG3.?PHU.eL9(,e-;#HVS=8/9S63V)\38^g?5+JLM9Y(GG
@=)6ZL4aNKFN6TVd99KVI:+F)?;XI&eHa=?Z[bc[6E&[.-][:58>_1@3BYY4@L__
;BWKHWAH]OZdX39+=CXGa(\JWE[:_1(W5?DL^>>EAMX+TODUFQ_c5DfE#F-1OXPJ
@#fSb\d\KAN9,8N^e?g2>/?aA3)Ve7#)beR44cL;K3J5<F;KC8TVLBBB__O;[e;@
XA+6A-&V&378P#>GO)N7gSH,3.6Q3BPT/J1,\_](R7THX/9IeKKI7U.D.<3LdW#F
6M^Y?2AfD\gEFb3g3,(O[:.QL8D8BM-O[3X9887+Z5[^[K6:(>8::U=bHH_1-cf@
[0Z&XG#+R=\^@aCRQ4CXD2H/]WbN#;#AY[[/8dTaUUZ-YY7(Hfg_@55=4_=LD3/N
G;F(0MK[T5556TST,THba?2+^1NB)>-GD^2D,-)CI@9fL.+5,f#_YXM[<IHc,f]X
,)A]/REM_d6Jb\OKVE-2O+;CCWV6X=(5VQg.QMXXeVe&;?1-9G>2;1>e+.fLdW;1
(=8I#E:A&Y>EGD>9Y,2.4QLD&>0(:L.9S,bS(IDMV?WgbL9)afdbe;8g&BG5Jd)G
AeDSTID(bC>b<1_<Ff]Mg=/V<4)-\f1;/2fTLML4-?89QFGL(cYLCN^,+(1M,IUJ
<O8B+N_+Y=f=A5-=Xa7)?<gR=9H=337aT6Xa8gEXFZGJUaS5E8LB]>7H3JO>PT1:
1FNL0fVLNQI]#S57-g<@H])H9aW:5[5XSVR9:X+ZA^<5F,9,_9&1I5,S=CT?dA.N
L7,A(5SXcIc5FEVOb]C&OE]F,=^=J+,?>gcY)TaNeQ,,2:PKP:#bD);)1W&D]QK.
C>)_[68dC2#:^1T7Ic.YQWK+9e]GdCR1IA]c_12V=+\KQ.QfV&5)4<PD^2IV#N8A
B54M4]TV)>QDAMK<R;NU^/GKLfg4S;K3cKI8a(N\ULf0eKCBL\d#/3\aOb,Y(=J?
EI(.#>d\5JW]0LS;cPf)<X8ORNcJ6](P15MAd2d\.-?.3GEC[9J0WX&^#^9YTeLU
]C(F>dYZ59^;5M4@X(f8CKKUTNT[N]Q(.20^g,bcHbHQE.2LPWAUO,.g@1IC=_4.
T:Q33EW]M7_H<T\Y2RN(ZW8\V>#Z]?^32-YJ.:cHD/]C0-S4&&e<E]&E^K<XJ54C
eeL.Y=E,MaC^agX54F6LfST=QQ:(M5VD@4?Y.]-/.#B\9a)g3E&8VY==3]4-Z^Z7
dO-D)&PH4NI8a=.W62.-.VH:,4JMXe&fU(.ecY,;1H(OT3TAOZ_@cR1>5V<\c0<2
SIH^P\/(:H42Q<f3A1LW22OWUg>-#adAC\>?,F_CUZdM:bX&SCR,E&SAbNJ8A1&)
\.><MB^25A^FLbUd-<B^G^UVIGWH#f,f?\aG\3:dNCBYA/)1]>H[:>J-1249>eD\
T-1<E]=.QcMcVd.[2YH:?H;C>IfC&-[Acf?=Z(c##L]\C]-9].T0.FK/#d^eWM&a
cPaI&U2W3-J:>g2BY<cHZ?>A@]6]AQ@dNSV\8eR=;1@UP]g1GM4/CEfBD1ZCc\#[
EBBK#S67IJVYE=1HY+8V,HB2TAP-TdH8X3-0b[dR1YE+M?\\IL?6JZ(>.]?B8QV/
G6]IgYIHY:&?)RNT<7<M,G8V@.=a&OS+]]Q\TT^?PIaW\R13aU,BV\b:)3dQN\WF
^:5NVaDO;5Y]&8?:R;ZI=eASF?9AG=F7-?U.eSeQZSL_Z@#=GXRMY@N7YZ-[(BN;
RdZW_LH1-D@/gbg(fKe:>7b-(?YfL(6)R)^=)89<K<&ZeTXAA6bIETI0+[TJ4)BP
)S]?L6WF(&gUO.?P)ZZdCeD5\7G#T)L[@12DK^55?B@?^?=f#\O#,,_JagV?U4[&
[IRLA.Q&g063LFCI)G:>7#\._c8PKP^FDe1c>XQ:KL1;W&][W<=fALdLHRPGe-=X
6YY[C9fE7c8H_F.(J><3_(C]]IZ7P&&@X2d8T9^3d65XR+4<O@a<V2fW^26=[W8W
Ya/WP;&g:Ua<&A&G(H/MO7_D2@&/,GX<@W7gCKJe>&90AdeS.:cO@Y7YIYM[@=>T
<=^TV9S8@E2O&_WZgFXeL>\bO5/X:^=5-a#C,=/75e&D:1(Hc:;UP1<K,N7-1H=)
N9UgOa8M1<340CC3+0dC27(Ob8@8@OB?2QG7X>-AVGGdUCB3cKF=Md(YY>.K@Wd2
84(@(aDc)G#W7L0HEWaLJQcc_;a[_7\)S,M9N\LSg+:VE^_AA9_EJMJBSIT#HS,e
_CE0BH<WfDd8BPJ3RJ#SGT8[:f-(23Z492Ab(EII)[@_E+6<:b4C1N9<(,M(E]T@
5TKVCA5.]J@]6b)GEB]M=SI<b0<MC7MdBHF7&(+#6#5#:U9FI;4AgT>#4GP@[K?K
7M5^-f@_ZgBF7VSJ7P0O^(]KA[\[QM.Xf#_FSJ23L/3_1JRG9AfQgU_(^e&5->&N
\Q@d2&D@0_1IQNJAG._QFZ=)9_a>1F2UYW6c[[0Wga@V-cT:Ud@SQ??M;BKcDG^e
;=;5d/J,ZJ@>@0d9\GdcV06<?UV\W48/12K@RU=^C1V.GTL>W,c/e:C_/F/D@>^P
FD2,D=X37^@f^=P0&,[B2I&84])U9BBT3F,+&K-D/N1YcK9+.g)f08Ld+L,D:]FR
=)X<0/Ub=H<+]MfI0KGKfR@6aZJSaOG)8&+O)e_8Z#=7GUCg4O].4SIPUHSC6I,2
\JJ@1DUgDa]D?(5YXSF0(<<8ZYVG13M^LW44I#c9I6-T^;^JXbb=g&<d);,^AHfN
H._fYZV,<86-F>3>WDM4Y)T1e(H)XD1H]4L3b#5D1^8+BP85/X]B,dRMNAI<:C3M
ML+5dJTGWGg?0/\73Z:2LW#:Z8cN?Oc_OJgP-R8Z^G7eJS8OW2]]]Ib-ZE;L?@e;
(T]62[U#7#JGYW=R?6OOZQ]e/&.JWZCC>XYOB2O2c<8d84VS@H?>b4a]H-G7)4Xd
P=5.^.Zb/_9>c=fG,>)SP.[U\ZYa2B(5&;6Ie]KNS^ZQBBS,1b,@:3\bYWb9\,(R
+a&X)agF&CW8Q^7>)#3(M]cf>4.^TF([b6LI7+(d,eTES/a^,cAb<M:bT2;FD7>8
HRWg\L6&Y/WGg<?K;,8]_;:dNbQN&GYZV3#HOJ_N/=J7Fb0#<eIVXV4WZ&?JB:La
-6VQE5;<Y;-b3B:AJ^F;1NT=dL]M+JgTdKJA=-OO:)YW6dgB1=RD)Wf_L]D3a^<?
=TA^>SBe0e?J@6^1SD?@c.?AY]ddE\aO-+PU?PD_9#5=Z,K<C1F&^8MU[@7ZQ&d)
9Y5._(XMK@+11S]2U=f21&?@1=9S7O)7C,Dg(&REXFc<VXX9X#eXDc1c]ZJL5O@D
cVFW&H-U:63?9[/H1RH8+dL?f[;I79gNP#;VO9[,46H2JWU8OdN:Y7a4OF>]T9dZ
bM&;CV+b)XJ1^W6?].R+D#8N-57QKV1)e<?\F7?:(X>\Q2\C,?5RR81[/?.6ZA.b
1DeH1]Y6K@KS/TWbC[eJR122Q>-[6>7fFS3Q4-/\=]0D1:3:2BMIT\M>e^3b09D-
Nc08?36>J>XOcTO]UZ/B&_TaUb8K@-64+CDE[\XZ4NCUB:(gB+Y?e;I\I^@,AG5G
,TTMGIZ/\H<&:D=:AG9@JaL\[==744-]#4K4b>c<A=dP3ID&gFA2U377ELX]+d1?
H<T7//8F#0=41AMZ@(Yf5L@(aMV.dFE&E_a7YFKF.D(/M<#Z&XJTRL\/Z]A/\\92
ed\I7/2H.>FJFaBF64J-)d])>@e[>9YB5:UME.;&,9AdA6-2&:;3K_8GDY6D\SQb
3@U6=V1?f3J(JJVBRLFXV2HLUQ77#WfOb<Wg#>AE-/&N86F7U4<4,R.Y?9E=\/8c
KTUI?OI@e9fK\MW7E=O)\^:ZZJMUJMae68:,EYagBIS.P-;TMQ[3]HFEMO+a]D><
OS;/</aSbPDJdJ+:A<.RL=FH,?,&M:Sa4Qb:6SAZCd6S?g&FZ0=40SO7+@I><bU4
&]ISaQAO)D-]OQ1X<8/92TA4<We7N0=5&Of[7[S\D@8:)IGPL6Y]Ye:Ng2##d[aY
g@)_]#QK?.FIE=YZMFA&C+QO5f06)?a+9.Y-g0(EY#&Y?RWcOb)(_DKKOY:[B^B&
CEM\-D&(?2V=3E,E5WML9<E:6<4#^W#]M_\O>[5]fA7^Qa1?1^,,ZM]Fb1_JK_3d
C(>J9g-[_Ng,4),e&A\2G<c9CT[1.O7\&#WZ@-1&1@=0c^P?1U&A2E\8d_F_(]PW
M6<2aa@>U2=bVEL9T-BLfFHcP<(&OH1]Y@cVXN\LE_f&NEWJF)[?D;\^;:OCbNCU
E(2[;EZb;22;BEZ8L8W2e:IN2@0:/^]MfBZ@2++O[O3ZU6NM=O)7K@?_?^H)#<HA
SZ;_R+/@(d.A;J+fJ2##GO-1_d?aI]&1>a.a[(R6N,=/Ec-DLf7#)BGDec-fKP=2
12G@a4XN@XFW.@aM;6+BP9R3Q@7-8MC.H.LWMa]4/^169,X>H6.P]L//U=-3L/[[
V/?X+]BfD2de3WXQ2\/)M;(8.FFV,aZ_aH(KZ=#S@-@L2)7>O4Y:J\Z^=G=+ELCf
G[[JHdf++dfLLFJV34f_Q=?dURN0[6eO0IOb9fU6XV/UacHV>CWc;@/dV<33BgDX
gf,,/,R.G0X.XEd8+WQEJMUR8d(^]\SQaRZeM((S]IHGY9WdJ_+.>+g_TF?4c^\N
E0Tad(T@K\P/_dE_T3>6^eAP\ABHf1)BKdB:6R6?49=UV2,MB+.BcM</?gI26=+G
4^ALDCEA3gE,fQIB7YHI)D:C2JMD?Hf_=EN=]E0,YJ(a:1J0VIKFR:VNQ@96V<.1
cL\2d\?]2BQ2=WPM4+aH]b[T,E,-:::/YHRa0X.30XY?5QdfS(gKU>,BUK0)/+9L
B>^S/f)DO_eVfPCO=-aOO?UJ50.NK0Ba.W/I:7=Z?H](,)AVNH;J?Z>_[D+VT7-Z
TVFO@?1M]BL&Q]W<DeY:=AP?>M,J85>a(Y.H\GT);Bf[NFgT#KH62WL:4J:+RC(A
c&EDEM7H:R,;:U+,:)@BP>]3.33HB/e]S-W#@1NSB:<<>e8)PWe5aVNCNVcc65VV
F5UF\+aSUMQe+1:eSD_\2Bc8ce&VB^4dHg-IHBeHM\+IBCS>50[OPXN8GfP6_d@M
PXA6KCFg=gd4M,E,a<YD(5L,8Hc=aSdDL0QKac+f[;4H[b2O&#gL:[BBeS;\^G8;
Y_d:ZPf51YOD<9UTT/S-UO]^@0IZZBeVMBG_6cCK-CTg#N0c9b-D3N);I??<;@Ce
HAAE;I[^DJC1>a)N,5Pg2d(PN0V<>@^#S?YLPM5aCD)8UfIB[fH,f9\G:TI)&(bZ
X8:79XUbTQ#aCd<Z@J^/P;[U4EWWWFf1;NQ_&>aOYD259,I)JV.+\#_#=XGL;+=e
9QG1LQT^7-fBB-UbV[,VL4:Z^LW;X=/KeO?]bc3(#+Q]8CCceVa<?cS8Kg8Tc1Pb
DdRB[EG@Ndc]-@:_Pg@M,G[H;8+VO09;;12-OH3F]HcQEU57N:^/dTSdKBN-O=)#
aRPOZYB:2&P,M,#;BGYO3BFg.+_#KT)@#e,b(M@Q;U/&fSf[G:>Gg&c[O88.ZcTB
HE3gEQR6ZMD#[A+S:TIQV5fO^7YSPJg[>+N,^3.0TG#c\Zc8LR8&acR1/MM<&I9&
O2-+3,OG6G320XIgAGZ\IO;BRg@NfV1YPOQ^;X@?\D(\eU[DK/.+:ZE=bD>4?C\;
_6O>XbTRXN>4LFYN&OW//+9P0W^2/L+b14]H1BCC.IG^c9Y&.Z9BMZ9K:(KI[e56
LU/@cYe^LJ9[ZDca@gAb&O?[8C(WMV0Eb27aAf^\MVf]ZE1cPf/:c])N[0Sdd3c-
2IJ=I/W58O,Maa]\UC<GZRdeb4IbD6)Wb1/(_GUFT=Te-O2(g5SZ?RQ#gRT=)]?P
f5eY2;^JB0UKZ57F)Og&L80SY<<-]X0#36+4,]A4=B+gV5J<;PH,b6O1FU7AEQ=G
;e(RNd_\UKA-,c1eM4]V.T->YV.[HUGGND+=W16g@5&F.,6V0KC,&+[_Uf2.^:GT
5FYD5SB_)HPd,/R]dO#(H7T-A8)6gAM5IacFH(T,[1?f,PTWf)7[XEI;E@g0H3D:
5,eIG0gC;EX<2ZKcD.+Z<BO^JJT51H_G-;V+?.M\[[8F]@S7REO=1OGg,+-Y+UN_
8+c^I5-g3c>+KXXCV8WWT8M[Xd9TQH6WX(2Z=N,=GCR6^>9,I-YFXY,fX-&DCJe#
aXK\Z,FN?(Cg/3):@>_-H:dF9AL14OQ?3eC1.Q9=a((LPM/@.4NBI/SY/I]g[)54
LeU95KOZ+He,B>6<LHg63?C1,b\Q&c;:a&X\/FGbTQBW&_:dcH89.Ig+DXN4dQ0G
=+3C<[(?QK9T+\aGSg;TCLVM^Q&WMQc\XZ.Q+V+:_CB-M#b_&e5f=Fb1NY.BW:Za
HH<;;[\=]3F^=K_GXCOPWH+^I-YJg?_AMBeF)WLC#Z==TTJcA[8LagL<@a#5B>3)
9HF/0-+e1aG^aa1#6X1;\PC=Tdb1VZ_9^A.#XDLZLb=PO72#3e:#>f+B\VE4(ZT(
>_6C\0/3@I-(Rb9WH>BdegW26DD;](3Be7V-g[2DNCV/DL:IE&&J&L:RRPQ&_^B6
f6RO5XSW3ecg?47.gM8/c4)J.5bYA_/EX97_QY:&e1&aa&U&[G:0SXHO6A6b?eT=
6U071ARL#YP2aJ]JDSI2?bXG\Z-3@ObM:f#N_=@aE5^#K@LRXRW/IZ3WUPZZ]Gdb
?YD6cNO#H/&9@72gA]V3(\#N[B:ZB57ZP^S;4g;S4DY=A+;E8[IE/@[23fJ7<:3J
ed^6IGg-D_7@36)YHHK_]T99;SLT>\HX[,EKDEX&XG6<A:f@W7c(8FRKK;G.:@XD
,D(I(:?;SeP(_\+eXQ8H=7fDQR[PXC7\?cb)caZYB>&Y?D86NYa?):)<AR(O8]GH
+TaD^d6&<dKTYEc0F-_.0aCI\>BHJ^T-6M3&/U+X]K]ZPfb#aE1RR?7V[g\OO]+F
,98?/QB#+R.f;=^YW_,[9GIGVO]/WLVC<3@]^&Qg1(PEE3d1\,3WcB,4eUJG&0Y-
a\?82L0-e@1fS0CNUg#?P(g;+/1CI+)7M0\1W1=2/gN<U/8>2G2S)&=.DPSW(ZOa
SG1SBGcc&b]=LabQUL7][U4+)Re+P&]_TOeSbF6]HUO;bJ(OPM445d+a<a@e#b7W
3\OGFYVIeg1^T2b2Y\E&05P&aX59)F^CQD)G:\6AEQ&-eO#.;A1edJ((5P_@g]cO
G,gCd]S;bW:(_1b9;8+\]65EC;-_d1>_XY);X7U8;523e[T:M/Z/HWI3\aWg\::H
=;.^2J)=bY48UMO&P^R2E2M[6<=CRXPgN2VE@XY+57CF3:dW)XRA3>aP]F?0Fd7W
bHQ,#I@>-BMS0LNR-84#4c+N,ID8=LddI_5;?P+QY.fM4AX\cI7PDE##H&:VR<)(
7+ZA9<(L(c9a>-#4395X+V?S0eeM7\Q>PZN:71<FIB6EZ,4J#L^M>:XY(KD\)a]/
J?DO(/_]V7I?\H8;;_<L3(BS5aS?D(4W9PF@]8@2XTD9<LYZ(9-WO?&6V_ZAZ=BN
[S[:<\8:eMcGOAC-::A:]Y3@a8aLL&WTM<I9AT8,Ad^(@DCD<Z8fOKE_XbE]3U#F
J1RWgMQ/b+J)@Q:d/@/J6&\74U3D&BagW_<\8ID6]-HRg82G\eW=\OW6][L8HQI,
;0F6,BPY=&e/)PQ]^7+BCVaR5&R?5bZ@HQ#]&8cN=/5?LdYO(CJWS^f[:\6HHJC;
-@X^d:aG7NW[aVY=fV)^);456e;(.52(4&]dI0</X@F^FQ4DR;DHI@Zcc44N)DT.
)0BggHNTKP0965C,#SD^Oe]GD^>L&[MBf?-5@_U#CgV,^FRNc@3]g3DK@D\8/5gO
8:7;0[,gOB&H;P3De-a)YI;BaW9)3Sff^I:(H)&^RTA+\cO;=1@>=6UbV+EBfB5(
DAH7aRN8=<JeQVTPf->[0WQ7PJ8Rf/JgD[cU&F#J#L<KCRQ2.Z93Vab3g:)GC,(X
</=aG&YL-YY@G7+_CY-U6AR=;T@P_973Y0>I]?UV=?N-[VcBZI]7^-H/^/VLg_GH
eU7F;fgG=):PT&=O9CeNEG@:D0)O]C6+a]UG,\NFIE?cOO3HC/d8L@OeC0ZG57XG
UgRR3W.fJYWDUFdLK19,-<TT+\aL5>H=DDeJBU>C=3X.\e@Jd@VWTZ<^XRPCYH.4
Oe_+,fd4P(AVRUIJdd^B,2&<KMNcRME/H)MLf9,+EY^NRGG442+NCEB37[MZLCbB
Z5dP<,@L^=b9H.2&LL?bIFONf1e56TUG8;AUQC?7_dPL6O.OVS;P48=C7]3,C^f2
JMa#TYI(E)D9Y\#5)3?6Y+\[OR8P@^Ge2\IADK+H<Gd;)L^=3\.M@+IYa(J+_X;>
Oc@DMgLReX]O]JRgKb^@/_K2PML7-=3g2+\):5I>?&WQ]EL@g^I<][e#P=XUCH>b
.[Q5C7L[55^O/7.R<C3@f5@QO5&a_gI)KE)?FDO?Ac]^?T3LZT\)9g<OR&0.T0d.
>WZ[.Ca0OaOPb92D1&Q#M>MV9Z>U?W)ALK8PMY@E6C2d:@5\=[7#-):#RgUEc+RZ
7?fbS+F(T_[Ag@71,H4dO&P#E.,LB4_Q>@V^bEDMGQ>B#d[Jd99^E]-gZLc3+F.M
R4EQ#]34DSg\VHgWF8UB=gJcgg1-N@=?2YE6?9/VgQ-0Ig?:dG.CCQ0RUF[MgW4C
#27ZB)Gg#K:V=EJH?ETU;)/Q]\>WB.RBV_5Q\TK[AMC7e(d?;PI=GY:=.YEOC1+T
S-\]&HSbNA;J^1X?IVVHMGE,7+^gb]R^e/cg4E1A.95,@e-a(VOECb+1_H9@WESY
Y1IVaM+O46+B1F@7QTF><C@Z\-G64(AIIGB.WXQV4AX:)=4]d=Gcg?eQ:FTGEG1T
bWeC&[6.V0PDZ<0SK==Ff[8;]Ie&V_?Vd[B7Y((49<C8N?).e]XQFRL#S&OTY0/V
0W7;Y0<ZcC9]GfHWeL.6(92<K)&QcII1Yc,16__-D6-B(//3(FKXE3H)fEFSV>];
U,b.C4E-e?CU<>gW7/0#,30_(?K1HQS=S-Y?<.Wc\E5H(ff]eITfW)3WR\^<GS&H
,,8g&.:QZJWBLG[2eBEIZP\-)1J\-g\NF\;Bc&c-1/c^0edVMHB<X2AYFY]U-Be7
SKeGTO+R;@I_:8M_c)c5_.XFRAdRbO??<^V3JC[@]QBWL;8(6RG(Uc?aZX:@KS0f
a-2KZ=X\Vc&8XfE)BL]/-P1C_DO_@)Qe9Y()A(M[=:cJb)PZ\(MdATcH4L^.6XZd
#H4>]WUC91C1e:>R)VNFB[MBP@1#7\5SYU?Q0JIFXZG9-FUNC+OK82&<I-/O[K?D
I7X5#GDVW[A2=\JX^3U+=QEP.Z/=7fFd?]d-E_:&)90L]7MFE_TK808.LA,@b1eE
.<3FdVfYXLW])0bgEbN_AG9CgDQ<H5P(D1LKaFAIBG9//:A.</R-L6;Q+<&<8.58
K;gW\F,7;(,X^)Q>.M-I^H2a.X+LJ-;O._8NLLKQ]DXf?^L#OM1#D];XaKLULE4#
Q2@[#V#&9,\R]#^=SG1=E<4512_>a[+O2;JK3,R)1cd82Y+,ZQ7@/NfBB+4IE)(X
RK_dN#E),S-4eb]eT6A6\N6@e[UUY-U0MK:XJB2EYKTfgM6RX6D]X6NN5U<V[3O_
WC5S\/MUe?;JXaZ=eZH>H&C=QU[7_#AOHM1^gKKV2Hag#4L[8+MLV(g<;-R(X#T?
8IX^W7BEB5<&W/[#>#:B-YfR@&^[&@K0dgZ4:&aO2(A.TAd,4.;T8)]gPI)7;+7P
1fcb0])@Ie[\U,IQAKbQT(&3MVQZ[9ggZI57DB&<06WDLA_JA,ZGLe^D1CC/fd=I
SZF7.=DE&.DS,/-^VZ21DD++.<?C;&Z5=c/GS2U](=B<KZ.IG]dWI\HK9/Z\HHDK
LHQb6eeT]<aLWaZBRCQb^?g[G#g3MAG6MNScY_F6:b3bUR]QR&bR#J)]8@gZ^6\.
,?;PLFX0#LPJf)MVL#_\T(D#Q1NCGR5-ccbL3c<aYLeA?ERcQAXDfOMdZ1R9ZDZ)
6P9RefVH[SLgY=APO^3Xf?gGN=a8QMI^S^5_f&MK(7Gf\0YGJEXRDAc>@KOc>9f(
2[;<]c[QV#YJ@gGJ=(0e7C5,,1I[R)IdN=2_I:2ZVDcG)e@.aLaOe-TJ.Oae.+3]
J41,50Pcc@cfFO1ADFSI[-R\44C.eLQa@+LC6J0\cc)_SC)gO:;UQeC9@+?:&07S
&<9WV7VC4CK1S&2/FKSQP/B2Q5\<MRS5fFV=P5I498Y-dgf7:#Y7dO<Y>]+NMMO,
55,eS^40XeOO(#g>E,g5[_66)3[<;/EPY<D[38P0<GQU))_>UD@AOg+P.>QBUTB#
BOaZ5@@QX[0-D3J9;W-BG^8IN+Bc.H,@7D7B2fJZ6)SN:#=#a:Q+fB3NM[/<1;PB
,T2f?#CG37g7d/SBAMZbFG_]Deb?D=YC8(WHVg^F&:+O0MQ0,TF:FMDRAKfb25HP
<e+;5P)@(WPg9_K9698J-)#Zg8GdEFV.--P4-gHf(N:L+TQ#-7+Z^_KfZ\[X3c;8
O^JD4aa;cAR-^>S)\^[@)P<^[N]G?0[(\09P=W^(8e1d6gg=BC+API11D)G@NQ[[
4bG:\b<XCV1P>Q^@AJ.KR66D+1a/N?>Z=OXPb+c-^&G<GcgZ0V^2e1Hc.Z7+)H#[
/:,W>WMOV,#BJQgg)X+GYD8N+:2L]D^9G#b57+R/?V.6d7)85Ld,F/,4>D<>93BW
RGVF]</@KUY)DMMadc[+dC17SM04Ac?^;+>d4]1XJ4-&KJ_6D9.E;E</7SZ,3K@g
6f#/^bJ4>LY1_+?,PLE@IQ#P9/CD5g^0F/Z8faKBWg;70c-@4+BK7V)DY4(.4e[F
T4.+bfIOg&8/S:McS_56?=La)[0geN><)HU3SCJS>e6TNK2^\/D@)X0V(d)UB0Yf
6T<FP,A45>QdENWJ<Z4:8fCO;P38?2KTDAd[[VQL4J0CdAAH(Xa\69R1<=?30B8R
RP^FKa,+N#+7a[?,OH[/C7E;SSacUa))3CXg;3ODE^E_WG:,\>.=5[>PPUbMW5]@
BA+]5<QCZ]G[Y==F0K7#A7;C?JG-3#0UAa]3a)4Y,&3[bU=Y:#+b>.9MAB2A.AOP
X&BdL_XNe<A[ISY4@LU.2_CV_LEcK6+@MC?)I8[P0AN1F8S;eWC^C<@&_2B6]LW.
4(+LaZGS:Ca^6LZdb1dHTb?AH^2a[#bSUS9];RE_9+;HT0CNTMXA/E>2fO.a<A,.
9cZa8HK?AN,H@&c,BCBD3F^W80.HO;58+IEJ_]cY[7_YS?b/RUg/b6T<@Z,3b/d6
[9]9?gZH\XG:P+;)<P@QZ]OF;FfUeI0_:C=7FKgGZY8T3CQZgWId[31D3@)GB4NQ
XILCTUeM&/6^SVU&3[4T4T-/W;2e75[W;.FS_g0bW_I)X,fD#(:1#S.XC+5ZD08]
VFB,<S71<a(6XMGX62Za36I05#I>XD9-82-dUgPJY]b0<-])T08Yc5_bMdNY6:Hd
:U^e\;&AU6,IGTL)]KM(>NP)#3^>f3NC:g,\[7)V&3R;dP4/&4U6Ce<?XA_Ib=f_
5NS0CMN+2]+aQ)PRE6R^=Q@R+.&b+bW[A70\1O._35aEK]F_2C=X__;W+d&)OO1-
J.:7J^SIRO@RZ;>.f7C#4^>PWHaAX>][J,gU+WGH-I\4X&&>(T(R(/Gf>;XY6fW:
_INcc-\#[^[QKB@41_0)#[B0>PDPfdW3bQH^U-.//,AE=K]NY)+2d+gLA8,@a7(7
f+b#BJ,/gF&.Q/HL9GbH=&DA47^:F[:W\R:MI.0ZcGRe)I5]PI_V:)IWV-L)QR(a
UJ]W2QGeN\\4NJ66/LGIZ,+EgYYE,VU/F@RYWI8&Cb>O^\IY.COTa;YI8\X;-.@H
0>Yd,PO:_A42)^7H-]6]F8.,b</FU2MJ+3g0c)V_JQ#IF_#;aSM=.gW;:GL:>C4_
W>]&AULgG=W4N)E3(#WUL-efVd(YO1ebLTNM0#\PE/e=BMdF,AcaV0H6_L(HUZS8
^3dN+:df;Qg?#@7F7UTFb3[.Wbc:RLEUb&bY#9A)+;f?@XDUYL;YPD)UO<4WG2LR
5U2CXPMFYMS^STZA:9_#N/2(^RCRHfU24,]TR7DVHH^<BZg;1&>_M7X^Q2:V(<O2
QC,7\^X]949a\MDBG>J?Bdd#H769\>/g:F^ZX3?(P>-@GVD&R9-c8VRgI>gQWHI2
,\(NY+N/UYP6SN<3UC1H>PV33\Jg>4L2^IeEeJ\_;A-Ude/@4=f]g;S>X4:F()<+
8:QfZAEdC+e>]##LTKB[<b2+&+6U&J&;fa3G^M0B\CSI#:?5Z/,D4]325=XgFO-D
_62_N[O,XPHgFG#_1CIDVGHB>GNYXc=CT:F:\aW;Z@@]]/P)5ZY@M-Z@(NcBG4Je
ME9a/A4+LgW_E0E@(]4V#I1RH1^MKAQe<VE[;NLb61F,]6B\;:DcV8X.8e6[M/8;
/@Ng67KVKSXL2\e;f0^,_4ReLb/>FF>GFCY71#48E0I)NSNFOWAe>C\]17@Sga/e
@9/2IOH+XODS_cNDD6^@RCF=9gQ-c<5RL>VC\.W4,KW8K<.-=<EC;cW\QES,g>EM
DJ0:Hg\ceZPCZ6fe@U+@<(96E1cLU>9PUb>9P1YMIEW;Nb3d#We@6A+OcALUT4_a
UYQHBd3c#L3NS@Y7R#<L(-564Pe;@<HU7ZPKUDEDeKINK<e./H+a5F:/OeS+\:g-
I,[K62C1/QbB\>bN?BSV##aQTg6GLB@V./1D8W22W2F7[802@Y(^0\6@G^]O+T3,
99[K33b0\_eTK,9C4.3_YJ(/<-3:E:V-Qg7G(R_7/JM5QVL)]/GOgQ-;BK9;JBY.
EM,XY#2<\1^cf6T_O0:ZPBU&?c9^JI6ZHKTK1<TIeB-cL5bc4@MTLgE0L71/f\/4
Q_]8XIR)^b8Ca<ZMD5194>HXE7T:SD0QfB_]N(?:f90b_UF+1T[[E/EfF-6/JSCO
:WIWb=V^N82Z1eI6LOR/cDUDA4M#LGU5=R)/=)P2dBbGZ[(#^_=X-:T0H1=#T\CX
RCSS<a:5A)K8Y1(g(]e3CZ>O14MRgY)?.T,Q8<;b:T9=MR0LaPcZ\g0=(<#_&VIB
-8dICb[A>.bb2&@@QN-YA(X1(<BA>1&2_P2YPKHL[bPW>B5MC_A9@VJT_XJ0U_1e
Sf4_+=DL;LB5c?7F(cBV]9^^01(&V@fCfCWeG[X0UAd=KPN+3G;<-P?F;Q08=3+B
>:[31,G<KX]GDc0eZCHE93)bZO8c\#9aK^8.BWeQR>D>PCdUV9#+/#M0^c/7LAP5
DZ>029Rd801AIPH^H41;GZ-Q2JRdVdMQBKD_;#3L8/DD\@UTP_^UP[Dd)71g&;=-
\GCLF9a-0?&66LWP#V&0=I,B((PT?WIXIQFaW1@1beU]+bHC:X8BDEcT]5CV&?HQ
[A-B(J[X.JD#RV&+IC]VPHe,-b:3\gOg1@9:5+:ZT&9Q76Xb2CNE,#P/:QMRA0>@
GPE2F_4gOd<TNN:V-[&-,Wf.eUP+J)<IZ0Ib=P&@U]T3O@M8g>MRL((ECDHO>Xd4
LWOU45U;GQ^588d-[@fbS0\Y6CX?dUbZ@XM@Y#+OcbJC,f@gLXQEVSMcOa+f^gCD
\W9:6gLXZTa->cODf=BP89UdX4NY6Cd5;0_Tc>+P\V9#-RK&Wg3d50][13c:ROC2
c7c+.cGQGD/,OET#UJW2L5f&XJ9K\90O;]N15RS;Gd8Dd2.ZC/2ec/\E3N8JV7GH
O=-TG;OW7JNJ8@3#=T8)V[74)T-BJ1WN0Bb7/gf,(<6<V#F?UU\,0g&(^B4]UR,]
U^2GcK(ecNFV0X.SVZ8;cN2@0dW9a+U-?P5&WX6[+RUOOEJS#S=N0/[,+;QdWHU]
<EeEYW8F5\-e?T-MT0^P9]?:YO.3UX<&[^a9/b5bD\g&a,@?H=DVK1FHgS6>8G6O
U75?_NBJd>:\c5,NLa_45<\d4\Q_6]UeI2cc+XT^]KI?a_,C)J]<JFe<2==>\JCL
L,GVMJLKWI-g&F,8J<4AcCbcg-cH94[7#.4EX3NTG7=U]U(MV_U?a3B[[.A5d0;+
O48_XS:L(#d6&&53DG&+/;2F>aVTSVXQN80_G8GOHJd-HOUF(3U/F9#be28/6#S_
;]H&1MP60#_H[c]eT-651c-Y59#5)c1VIFL;D;A.HUBU[=8O-f9>JFRTIaF#e/A0
K0^V7a2E>XJODdaLKXW0H^]<cPX<G?Z)g6&eQb@#U&f^+^O21[F[@M=a&FGB>/)6
S9T-J]++L2<FJ7/QB:G+ZE=dYfI^#aLH([7;3GR_M&#TK[5b,JaVZ&&SaLJH3gBU
gSLNfI,?X/^5;D\ZB@3?4JaK;db23^RU136CUg]&,7<I5.+_[4[TLKAe;/RbI6.5
bQC0)/U+gMEc4IJ6Zb\+[_F-WY:UgD-OD#,gLPcZYS>RH>FLID<W=?\MEbQOL@eM
;&,P&;CU2C)IU=4=B?AW_?F.0S4-P_SdX=K(UY8N5U84ZdLf/FW_P4GP\H/I.492
)C^V(]E3)#PKeF)J-IE)\fc/E5KVNFC6O,S?F++[?G>Z@eZ_SY6K_CBe3KU(9N(M
H/79?E7]19-dULRNL]fC)4LeJJ-M?J;YP3:eY&]M.RcMXQ=QJ8G1V1f=HOI?UdTX
D]KH?D-3F:M<:IUD5HddD(9.QA2fOMfK:DLUW1N^F(T-=:UD\<I7b<cJZ1FEL3(7
1I\HgY\G(8<GcDS@3>W<E\=0FVET)T(@M<LYV[NG3(]G+f994CXa6>UH9>T5093/
J\E->NBE/IR9Vcdg-HWg@CdQC2/?#7f.E4fN6B^-@8@d(6f.Y8D/W>?^7O;G(&LT
](_WD+:9,a4[X>GWW=&PU,3YR^P]O&_X_d-+E03VV,Md0F+&FIL@TK.SP_7#0N)K
XTM:I(K#GFECgJ>WV4#4)Z=Ma^TMB>[@=J@eR;3(<5W?XYLCIX>YG2Cc\:GKe+G#
^X&+H4E&8;DA>U13Ja&eH>?LWJ1fYX2WQM9,#H2aYV\L^JT?>19:ATCegg&8_/G<
@ZSQ85--2U1bUHVU>J7Y/>>0[V0^3PZ7?ddI-\]1GUEe_QDQ_,PHdaOW;NZ(EdEG
Ac.?G[4Ne64XA[FWfR>Z<^GF@4(a[6IDbTTW7YDC\>1&H]@1^WK)b=c3[EED8U[L
;4H501P]X0]MTVV]\5Hc(:R9Sg;TX[[P;GcF#Fc-F8UAUB#S[&eMJAbVf=I_>Wb<
+3FB;1@1)Y.b65I_0IU7N4T1K^K&K;FOd9GVEVY3]MS&X96DP+@f.g1VGLdS&Zab
]^Ffg?S45,V2L9EG;_DNH+ZKg,5PB@97@-FINJ9=+?K;UN6Ud#,,c;)8\0B4L0[N
OMD-1Q^JQdMGLREUT^a^([IeZ9;:UI3_S+U,K8)c@bK^a,4<JKN:B9cZ<JCW9(UY
8H[20=)F#D^0WQ.[>WKHT&>+bJ@)ce_4LDLV7)J1I6?D6+<cX>BPMM>,f_9^F-D=
I@73:KcDZ27+>FQ5E;L8GXeAC8#U<L_0(+fQ\?ZeG3bCdgQf?7dg58gKH4GL(>X_
TX4M0=^Bf=RSI9PJU>c:CS[VJU=U#E3ICT0];1,3S<NQTf_7a9I@1B-EbR5[EKKU
7V1/5K^b2?OZ/+<#/cSRLJE(@HgH5MBOLJ0JF&.((V#E7-3I<U/,fdU3KYfWaB_.
_+_NM<2&@KTJMY[@e+]G/(fW7G7>&M,_)K0O2GIZBN)aC3E;dD)ORP6],W3W99()
BSQc(ZV&]e+WLEFMUW.8W2<[UPfZf^RXYBC?Wa+,+U\7PR[Y=4>OcaJ?@1CN#:M]
c.11J=K9[NX(W-VN-[65WCHOL5=Xb#cK1.fA,53dUU]ObeZG<KAX_NVVE/#A6U6,
8VdGB7aO))9D/_d;L^48ALU)C=^N,0(BR_WJH[gNI##A1FKNO9@BOg6-?d/Y-AQg
R5HSXfC.<^D08<_)MZW8ID+P3<-DEH)[^(gR_^d]g]UZ=>1]5Gf+#B4NQ(If7/]b
>dGg3MZ-[O?c32S.WAD55b=Eb8IPXESa:@3D8;>3N3Q^^L@XCV+1<1/56JV.]CIU
W6@JeC5(NR:0^Md^-7Q(IC6MAODfIQ<<@J:8=<4I=f6(E^HP^K(SYTCGM9=@g)ee
O7IKg9T<(7LZBC48cUS7HWLX5P)7Y,6/>#e3Y#E;RC<@7^>=+-V6OMYAHM4(dD2d
aACAf&dg.].IT)+:U74)dBZHgQ_\GB>1/-<N@7V,d]1\7PDNdZ5WKX7W2d[_cT>M
FMU<)0LPb5>[<b,DKFH->ZS<06C-]RbefcR8D50?,:TXMe0f>_()+((R^@9c-Q8W
[=;OU2JL;?A[(JC(4cEd.0KC;26.C_S#G6A6,W^,T&Ud.8I46VL2L^LcDUV76fNY
Ff#/]IH?/JEOA7(fQAU<eg<#fH_C8S3=aA&WMa,8MN@RF3NIJMC^@27V<,(?ZB>F
f)N)^FWQJ].R#M[JVM9?B>+L[/-WQ<UJR_59F/6[?,]f,G74a::FK8GHPD-S.H.7
2/>/a)=//PXDcCRYgZ.PO.KO72dR&B2+A89)PN>+KP08E35HJ]ATWV4MZQb8,faH
:N[,CEK,C<gO\\aJ):Z.0<D<^X<?W??5\V,.9bDaB<JKM,DL(2=e)e/;I\)7Vaf;
Ab.Q<OPEWH?+#f<c0cX)I<5Ie4&2?O7:O;\.Z@\0?,YLM/:PW4>3gD1c-,dSJb/d
6_-L[D/3KEFX2#<>=GReL.9NMW+4<[89(TOH>LH7L1Je-L.&>cY<dde7\\VL3QBM
=d,_;3+)^).-?O^AR5[HY31&T=c]9JT=DW#(2/A-efRSYP1c4eSUW@[L&H1Q&APE
Y5H-.a=EJ:&D-&9O^=?>0\^\gM-F79UG.1JG<O/><38VZJOdGeSC0g4IP7P4U&=Q
N->\N8#.-ceD]+RL7PBG-OX;JQ4WM6<+3HdB3H8aa[\C)4;KTAaY4:?;N-JJ3b>\
X?U[>-7gHC._88OIXBa\>D]YTS9CbKHg3Eda#31SN/>M:UWSZAPd0Ma6?,QdQQ,<
7?8DRUUS6]-ZGIJ8-9X\<KS[bE-8a-VVbZ.1-Q4GT^=S6[=(P5D5JW@O3HaIIB68
HF47[ZAXTWa@Q6>8I6=@56C_&M(9Q,_NbegNL_a1d7G0TYH^;.(fe35HYNH.5(+(
]_]H_7OC6B5KUbdbTN6XY4H=c77P9Df3a-PK>2-H2Y-]da[A[U6=]618@C#RdO5N
eH?@I2/fUb3^e?>QBeVZUMRK,:>@^E>dB)W0E6;(XTX03=]?CG<JNNU@EUNJ>W7Q
8#d#@DH43)Q.L]EC5]UaJ&bfAW#5D.b=X2SV0(PZLZ^SL1[4/_(OB2@Ng^Sd&).S
]M,AQBTZS/UY,0ed2\#:5UfD1@bI(=eR3ccWI>>\:/-,a65#@Sd^3A6+-2Eg7^(a
-]Y,CISQPHO0BY]CHY.)1[BO.2INf-D6g#N@<>CaX_d)JRA^?JZg3KJK-FRbBZ_C
ZD7fA]880/A.33/2L?,bTGd+KAQWO;8<(C&=3#DFJ3S/S0-Og#IGIDL+e7U(b0O7
\GIUd5ee;41+#>+[39eTGa=A<U383>IQ=a+0,LBY5:@>COY(Zf7#=0.6]a0;D0;^
](-)DI8J=JWM>AD=F#S]&[-AL4)17R-A1O2V@>6LUT,VeCd2[9;gI3+3XX5NJ&#^
9K0&,=F>(?]?d&=FWBeIc-e&ND#Ee&KVW61+6,B7Y.6R[eFR1ddH.=2bY>C6Xg)C
Zb-\]M-.L:2&S-Kfc?C.&+C09SR>T5\T#4;SKY>[e9eB(X,-ggGd6U8#YB,<=V^<
B3aQN^]S+Jd36Oe]C5]6GgS:ggPdB)QD:Hc:X=>?@\f\+P>eU<M&^]S)(2dCe6XE
FfE(Ma=SRW]+=)4J].WUeCK?,LYOK?>R,Q]SORR;Gg^OR:Tg0/^C1cYQBE;#]X2:
,QMD9_1McbcL[bVd/C1Z3a;.-;VO,>YD,<9:,MfbRO6_D^IV4?I7)B<^P5QQNXO2
UX8YHW7R[PRLOET)6Z70bVeeaf<FJ@^V,S&O,LVSeCc1W7R8)QBXdUf4RZSM)2P=
4Q-OY6YS&=fbc<39Q,J8,^;>ISVB:\D9_5XW#.PW,S5NO2]+HB&#Q_EaQCN2e@eW
#R/]3@U+/8ZCQM\F4\@Pg8T4fBF:GGZ6OM0eAT&<;P&c?)]7?AbE=QR\)cWYF]eZ
NB::.gX(f#(E^/C?OK^#_A4(dO9AfgB\#^]9M(UT49M.<g/IA-3c+d8=)X,OP?O_
LZ\\XSZKXYdR5LfE0UXB_B49\G[,&X+,E]9;3PRD@1H058X^2A6JO?f7?7-TJ;c0
T83MH3WG6UDP7-_WO.F0Pc^&R;HHA_,_-K,F&GPTTa,9NHeXTQEAbK7MI]4GbO8e
?a@W:TPGX>K=NK3_FN8Wg5+P3=;J?PfBa95ZI?-A(KLa.0P-a;2:JN5a_7.Yf4PN
e2T4F;O=?51d=M,I.[AD&GEV1g@9TadM6c082,5#Y+5G^S@#&2D&TU/XCgBB[]Pd
I[<3G\Z+G8Y.SLJT<<]fb[M4c&:?<WT2a@5TK(S4f#1S[@Qc\:c/3IHUc?]W_EdB
J#D5RJ\c>d;TE[4NVf=c>/?8<]-\_R1XK;TdN6\]9aZ&MPIFFKJ39)H\2(@/(I;H
[X43K^M4NBZ<(\L;&cYN,<W1^_0c>9^W?RP,>&W+fCGE^71JLNe(Ge+;2,(a7I;0
>\WcaF0Q&(PQ22>SQ]0e2O5T6ObX@[7_UG&:2F_GXaK<<c7Z#2SOG=fKJHFDe?>?
>J3b^)^62=&eU.U)-1YWdBSFVP49FfPGd6.2U/=aFW(&4fPBI.W0W2:KcB+,LC_f
#AJ\?5\]5g,\U]IIDI_EO@_\PO)/C3B?.:8/&O<W-?IQ)&4RUZ,Y;+ML,Z_027)e
;=ZWPI&SC_A41\9>\[:U+J)RM\[N8RI^74N]=ZZDZ=7aO7K?\[AW/Y,<G;[AA\K^
._Y;+S.b6Ga-1S7;]W7T5K?cA+3P36Z?Ba>M\[.;g@)fO\^9TM;H:/)-D;0<+SC#
@]e0_;@Hc:OT(WGVG]&c^;V@@1-/J7b1E]eF;B06O4G8Y(cOB<C0L^Z@HS#8A0#V
D4SU26KfgZ\f5R?aE+F<8JYfPeOB&3HS7,SGJ6T8<66ZKQTOgV3M)(]\[)=MP??5
F3dLAH_5N3aP?7c#>W@1#X:,+2]J>]\A@RL2^2a3KYcCYW2\1S.P:BacS55cL1^d
\?6<1.V7L7:cH]_d/956ZERU1E-c]P&R(]E(P12cDFA6=6T?JED==D50]+6;R-UB
B<^IVc3.F7C,GeTfA;TB(U?0g]27P:>(@gC9a[P4(NPCOL+2>JbcLQA]c/bL5+#]
W@,3ZT>d8f428XZ=PDe]Dd&7FKL.+]]1/\V)[VO(ZD-H\4CfO.e<])<a(b=faT^c
Xbb^2KG@;/G1QMGW)CH?O/]<K<?RCRISLAZ2ZdT86_#(FF/X2C6d]NZDL/371[LW
;V_QWKZ)L5JZQ];1bc]3:IR<K6F5_c-Z#[^17F2>bX;f.)0dSg[PZ3MDI0D0=LET
MN^#9W2#Lg8\OX.N=G;CB,5/PXU,^?2YT<B</?g^2/E/eeP5Se<Qa.:UN(6>?P\e
95O)071];Aa[_T+/JN5Z3&4I7+,]DQeECP5C&1E(,fZLE2-He5A/PS(_ZB^509EZ
QEV)Y@X/])9&/0;]Y4CdKZ4#T94Gf^&[Id1D1A,a9>-U&,X<C_E[S[)Q0gW;9+OT
eU[.1ASG5>]aT3E^e_9a2D#&D2S?5P>UV_f)2WTO]b5:KK66:?.X.P[=-NC@9D@5
A>)&FX6H+4;<1AR+MfVa]A5VC-Ee4-+FZLNSKHTc2B_,&UI2P>#RZVbP?8e_Tcb0
UU;ge>8KWN[25#:LIUC-MY3gN<O&S.@ZNU\=\B,38RIFF05PgV,Q=\V>@CcHQNXM
-U^_XRYFaK-cHP8^\>HP(1^g/,TM[dSH,&<7-a;V=e.a]<6_(4c.O7RS4<:ZB&aa
,36/CbIA#Vc@(^0FR(<:d5:_>ULKdJfD?f7g<)88FYD=]TSYDVb[F+e7--eO,?AF
.3TR(J>N[Yef<S5T0DDWZW=U+^+?A+YMDNS\fNb+:G):#-:gS?V>BACTf>0S6438
O7fbZ1/K;WM+#PE/ILMc#7:cUbdB2A0O#\MUYVA>[M@d:13E64&3FIB-]PN@40H#
=7XMB.bI2H_<?3?UX1aA8eG3XY5]4W6]&JZZe8_RT;(9C(ZVAcU]&U9/MP[<L:?f
@8dDUTJFbY5[Y5ZQ8cK](]=RV2)M4c7QVD3b;TO&a1?1;<HC+1+H_[GUD[a:M:.8
HSd+RV>U(d84M9[(0GK8g>a.7,6R8XaCO>^4cQN+SNADLY0NMNB)V23GR>ON>69]
E3a)[R.e.3&OFS:#=J8MR_NXfO-Ke^O)NS:8gU>A[CZ/SV8AgUNP)W??EA++[9R]
<8U^QTF4JXeV(&RVTFg5@?BA:XXPH@4Y-#J+\&X78LBKVeVR_JRBHfW1CI2BX[1e
LP3a3A&=LA(gUD@Ce-[RgYcBA:_AO2Y:3+0ACe_.;8+d4>P+V:g_Pgg,8J#5#Q3D
^Q#I^)_DCPdc1&>NSM:55LGA(?AR7.OYBD#>62d+<<28Q40bPJ4J1Yb5&R;Sg_2J
6R(T&BP;c-eW6c(J_KFQU<?eGQBX4,I?PfWWScEM/0YD)(I??2d<]Q6^ZFe[)+;J
)WI?NO-ZZ_-1>cZ:O/E0?,Z(3.eGM6+Q@=<^0=LHJAfYN)\Z2g:@7TX]T5<LE0BW
Y6?-RK,I&BMKg1[_L4S#[9.&Fc9B/L-AQ3##2[a)9Q@.,B9;bI,MO/>MC0:O\5]-
/#1IaIM9@.U;6,<Tf<-@?9.&)C0;9;[c0>SA_&BELf5/A-D7LgcGE(fRZMUM_bJd
WUg4A.@27QKJXI\XZ3=#DQ:^@)V/NT)3L9+f86C=..F:NA23B;?J8e@G4XGd__X&
6ZTcTVRFa7-NTT+LMNQHGGUgVH,UG,C]DL6LB?FCC7N+@PIGD,#f7L5HTGT^G+5c
^EddSD23_VcRJ2KQTXH7#:@B9.5S1c8:@L?9QK-<HOe)_9e=A+(COLOId9A8#]O;
6:#EY^e_^Qe2db#URK68Z6X#K]M,<,8KWRJN;)0[gfbF:6)bRS_M(Z5F/:;VJ;;b
Ma?LK_/<&9+Te>=#8-[U>^^;O_Rfg4\9#P,V&Rc9dKU?_;U6&E-DgcSB@W(H?TZG
ggM8+7R=0FPc[Ff\Pd)c&bP.Q7aH]>\d5UcLg53-B2?5;#IX&E\FeU&UgWC[6:[P
0ZJ&>><]TJcD9c+);GEFO(8ROO^2@>[9-P7V&[fUE@0cZE<<BKV(20cWQ9J,,>&E
MFLWNAO:Q(8MB.>]]J9Cgf.?C+S1RKf\N220cC)DAP@2]C3ceEHg;WV_\Z/5[NSX
_BLE:-7/fL+Ef\R32V_T[0,g,WX94K39I3<,L/NIKZJf[YS0&ML\VaeH/TB/KLd+
:Zb6#8+eH@8,FGS7AQ,@0@CMR:G2U[TSF6UQadLD\8TVT)Kc5Fg-cUU=[^#&#?(a
H[^>)EaY_e(+()U>7.0@:N,;3WeN&_b4CXO?T6B,[\R90-f]S7=f+Og:#MJJF:8C
fY>e^O>.FT\Q7=94--0aJ[,;UO]bK^8+D)eIF9#HL8J^LIc:\QgE[fPC)(T-48E/
@/0&_f7aV)WU<e06[;RG.JLSZ<&NC@OEG6D(]C\6CG??<KMd7fJF(4;98ecUW9WU
>F47\g_@C^Jag)/(>&BW)9C94F?QXEAF6G;_d9A5)3[_0[N,:Y4NUHe&aHTESPb@
PGgD_YW4fdW[@d5faF+/b^:bS^ER8?R>[7@+;_AH.eCKbLFFWFGJ0LPG1-+GP@c@
XP1ZM4?E:W.:H_U8X[M^=LT?3e1EC12b-OP<SKDUZOJeDeE]eX[>Q\WN.,Y1PA^)
-d_IbF-=aYV;2f?RF.LF5(cQ/]0FU-:bZESB\S],Yg6Yc-.PN6&K3]O;d,&KTJ@E
]]E/NY;<_K.7T2A7]EN4RUKNHD(F_+C[N1WXUeW9#_]5]U;OK(S6(6^Y&c<<c.K6
9QU]G^L9#KaU0-;UKYA<Q+\)7X;T#U>^0]HZ[HM,[-Pc4;f.;UL]\&V2TBU-MBCe
K>=NUfK1VU6+YLCTaGR\JPOHVeD:9ANS-?N>]M4W98S-e#Yb4B]XYZB:B+5g(U10
.gWM\4L6f/0PCLO43:/cb.AT#,ZZL9OH1V\ZCC,KKda^=eI]5.gMVB&B]+2FW<5B
)=48RN;RL\+86/+,-7@3BW:Y;^<[LJ78_#Y/@0b0^-@0+#JK]VQc\b@B<X8J<&P4
V+L1DLALX?W5.7TL#+E5-VZL(09Wb2[KVD<>=Q-2gB043RWD#P12+96:_Z(A@P35
ST49fO[#-GC^d/N8K/CdR>7]G>/Q[NECXa7>6A-0R3)S()fXZV)f.:6E0(d+E)4O
4U9JUM6RQVV7&+841)9BHAL5]4E),-P8(@\M+Z,g:.@HQ#b0eR8XT]a17,f(YL7(
VZN<d+9RD@U5+]fRI8)XP5dC/,1>BM.604BWJ;7+[8b+5++1afDNebM5;g6-33aQ
NEA8&9[(9WL&+f;@>@\ZfAFeP7GNI-Jf]X=IKR(J;2X@&M=C54cRHBZ5[A\;c-3W
+9N@^>L-+E>^G14/B850H3=acC7F0X/=TM(/XJ#B,1)CG3GB(9H<Y<]LGQ0C98U1
bWVB5;G6?>IX.4=P@UHS;N)L>.7cMHV)GD]4G;6O=PWVc<@d=dEC2OYPb3(IEA&_
PC&X^G.>-)(S+f8-<IR4?<A>CARCbfL+5f\g_Idf5+WFd0T(caX([HY5UP6M^UdA
.b9C4UOfEeQHMFA#V#cE/[b?X&:2Z97B?A8M/I0Ec5)?AVA.4T5OReLdJ=A54[PG
[YCGGK\W=;>X1XG8\ga]c+GH1Ze]\ddSYAAS5XBa;GT58S0e=/2(0FE-,^2#QAAJ
:8aPGMEb+HVBN.U+GWMX2?O5JH[@Pe/AGX\UXK-FU3;1(-,IBg^)T1:05&I&PR#0
YbV5M@-L<7PMTMY+2EBQN4++&eE-;^b/Eb6dGOBG4,fG41P/:XKd=UA-e]IQ/Z;2
<L\=d]-M(7XER7[8>76#4L><EXBB_BT;TKE]g1DP;E)X5)DKeRUPZ&6IR&CW295d
Ue0b<@0Q.D)eL4GXBNef?E+U]JDE<;a?O9U/=PYNe>S;MB;XH>e(TQ:>D1<=@58G
G+4[((,ddKeg-3@H_0PTAa>??;R@e6G:_\P\I9#Y9I))Uc1L\=\9bCQIK=6G.c<f
_/9,EQdMY4+=9LLQ0TeVP-)_X&0B<aZG\-<ADL?d+[9^\G3[I6P/V,F\fO2YLL^?
I@(1c9Nd7G1T4MY3/150QOR7MY[09EZZPJN-#gD+CGW188Y21J:&PHHU[W:aJB&;
Bf?-cHN:X6N+&+f<Z3V4OMgEJK.)M^R-b#f54S^DDG_g^?LR^GA4SUW;A/d=[IF\
.<\,S);T5bT+9a@\;fN&DbSVR45Gd(<P1V5AOf?],Z_)4).1aC:U-dWHM#fQdeYO
GH>UK;L(K#fX:K72DUE]?LA03[V-9Ka]N6U2=)^<P+NPOMXRLg53\TE-bPFTe0M]
a[NeXFd^)21MS]YHT_Bg,@dA+DBaE,3HZ]\aJ05VUA\+Kc[VSVgbB1LA0U+HF]H@
7^W0<c5R]LRZ?5A@)>DRJddDXVBUG_<dXW>(,F2;ZfNc[7D4]2:CWTL(:=E5YGVc
4fHENAO;R4&0+[J\L@?0U?CXQZVRI(R/>((Fg3^E@F)DPUMa/#]CdR/]KVHfTA87
L,CW=18R]a0P&,-P<51HLE6dfK8?@-c6Yg.CeP3FBN,WD,[[#c:TP>0Uc7g,^])Q
20F33H^Y;<Y15J^R@gXXF9ag^Ub+KfRF&J<9^>+2Q@P[OdVP+6XYPWRC;<dQ#,0d
K<C;@TM3HU=a5#<3Z_X><EO153UZH,UQ<H0S@P#/\R;b,Nda=4cggC20[/>I2+N5
@aUb=-]A(PLXK3>QTgb9ZZ):B-[fA[WKP2PU?5]3L#4KG,^81>D?U/X7;f7<cR?V
a+;aaR>A]7f;NGa@3F.Wd.:RYW5K36LPZfOP5B_d.>&,,FD<:3D.bFf6YDPYXS\Z
-X+WGEVab-EJ2AHb;-ZPV7LDG4f,RK6E8e+/dL(Ld(e3c9]bYB-K3X>HGU^\_]8:
]W86#fa:UHZW&W)_D.E/2:(RI5EF]\4I[^L5_^:6\T^6f=H]/3]a:a;Qd@3]YYAP
e@e[T9=bYc6+7UJF@G;O&fD79MFY;>_7=..JcA952KW8)#Je5I#QBEU)BD@3=[9N
f\GN0IJ-C+D>>?QeXaJT1R>f5A0&PdaIB7O0aA6D0E@A9ZYS&J-4E#dDT:0+.X2F
/MQTLB#OOW+UFY?O@g/JfX>\P&H-@6fg@-2>4T?,XM/-eN8(FWb0GY4,=@=.KM:,
Z[3M:773?1G;>EP)?1S&BM7\W>M:.+1N-W/=?#(a/gWMF^gfV)C()N4Cc;RIRbS,
8LJ<Q;MeSSM@Wa\V#=?KJX6TKEAJPI7Qb-b_5VO>Ef\#9TL.T4@)W:ML.)f=?(S=
R=JM)3LJcX0/=VK<L,3:2E_Cb^-WHF7KAcI/g/>A0S8C-XJSEb^Sa;-g>V=.KdbY
ID6f6]YcY4^BGNG1aQOY+Fg>)Y:>QNEFbY@&<^LFd>7>1<,c-\>&eABDeUE[^UFA
ggK;G24.^27d,\^8NJ,T\F=dF^X3bE-5ULX.-3g-Q]7cHG8T>e,W<:?a:G1J(OFL
6Oe0^0->4g]7YHXG]^CM1EKRF9GRO<[(<5R<=YB2c;bUZbOJ<#)B(V45D>5H@R:O
:3^9eH\8dMXR(RV&2A<ZQ,.4caB]R=(Ea/S/TS>[SM&:5We#LM8Ac.STJ5_,-3T?
D;;-VTMO9ag8TT>V<<^0SS;NXB_DI=WV5-H&fU-Y3Y,A4KOF,Q95]7/L=6[:Of\;
XB92UE]UTEd^XW-7(U;NbBbaPPQA8/+RAc:Y;.DPJEeIZ=aZcX-D#2QQU([HGF.J
1(1+1ZR#PP[/D17DW8d[/a,J:EA1WR1V\[T=5c6B03IF#B@7We]DUOP2P0&M52_4
GbIdTP3@6[4JQ69W,D#OB(F0^+D\88]93@g(A=J>LR9?(7;@K/WI?Ice]K<SL?dT
]0E2X:1d#JC9NC<CV,=C/M3+=0\ZCfPU]UOE6\OO_;4RF<H4.MW(L-U.P)N,;BcA
OR=YW-JVFLA[:/b@9@fW//Q,?cPU=UNCa0.M:]^&#?Z-=AH/GCfGD50K)0<@5>E#
A5KeYJJV88=bH+N^F,QUN@LY&T[M.+a@74JWGa\.]#QN-N3I37P^)]:7:.S\2La<
3UNU1(;D#D34-I3WE52bbcZ<^_D7dOK;ad;GUQ=GW8((/b51W&_)PEI\.5bN#MFa
7YILa_.@]15Q[JNeH)@]]JSM<&[[I,f)Q5J2M&G3(5J<;PcG76H0T-8(dGR_9/C(
T2]3)7H6dOCRW)bKAM/5),JT9\eJ\f+f+F6TAT[>@W0O)BEAE^b&J?,XO2[C.X;=
Q\CGL_^GeLeM54ZVH/6Og0_gZ#XF0.@H#UNBLc3Ze<EPQ)Rb]JF_:O+WD8C+K0;2
6d[6Rfe#LZ12W@2N7X2AXd^7I.L<KQeWW=V44^-b1Q\=G._1NZOPMd&CJ&L3\@YX
a;L_WNGAH_Mad)H14AUbP:-N,LE(9^R3aKI7cI@.]##?PT-.)EXK(=1RW<CF.D>T
Ce??5=c0@cK+#=&J9D5eFKKE1\5<WY\/Q2]fZO7XD6V0E6.e3Q1S6WBV4aZg8U2c
]c/?,LBP]^5QFVI)L_,#[.+5>bVb^77^cQ14W&ga5>0)X-5=Q0YQF=UF.Q@&OLIE
8_;&+@g.?GC^2_P;#b.SbFL-f+IcPB+9dIW,Q1e9Q6#2A5,(g2-9efcT&115T_:]
I7Y7-7..O)7V2b9K#)[)_#^eKFQJ[EB:&M_YIUO7f>&#=S]RWY,Ugg,#3g(V?854
CZ/cOF1#ZfdA<fNUY-,QG]YX<cgbd;fFHT2F3?D1ZE4aDFK7WPU:?:+J.V?>)P1C
:TR@>X?#H.5/7D/^YC2:),:A)4-KN=[Vf_H[4L?X/H5H5268.9^CI;6D?85R76[?
1,5WV>-L5gE?6.FC&3W]0Ig6CWE;5,=B5\CFX2BP/[PMG1MED(\DF878XS-9GMf-
;O;3GcQLBMAK0@H)9X[NfJ&&dSbAL)9=B9K-:=O=DNP;X<(g2eUM,45XY90UHDAX
Y;YfPW/J:NPY4/@74+[G_7^:?f477=d9LM=a<(PQAJZ:@Gf6TJ<OaXP]X:)V[S0@
8X9>>:O1b66DdS1HEF8>7f^=_L8Q/Gg:Kd,.^TcIIdKX=-09Y4O>AJ3.>V)?\T\:
7]]^DKRI9-:UD&HES:F3Q=<X5C/g]J-,B\NP]GV:C0A?O)=FMUAN@++H9-[6T2^R
[S+fSL<3ZB_&-,5b\1.VNd_Z?DN0#K.88g5VNVT=a7d)_FSbB;U:==EagNQER@(1
:eZ>@OLfR0cD1JJ5gYD^N<_A<JJgb#PE-PLU<N;I:(F:3a\44WY>+F6U?CL3.D.b
OR@aTTJH&GNKX#K4&K85,/c3#Z_>U;RT6ecgeR+:++]VX0Z5(63.U+ESa+.?2UFW
#R2cI??Ig;PY<P:I7e0G7_LGZSOK_Q^,9#+D-]g35+909G75W32DKDc^W)2HW4T(
5gYN1[E1#9)f(T,/.&<T8;6XV3?MeQIWF5]KbA7gC,B]CYe_P35B^&.1_2Y9Obb6
V:_g3?JC9ge+R+DY^6XI(#8H)^(]NC?FZ6TWa/N?1AD?E(7A7b<=DB@XOX)3T?66
^gdc=D9UVDG]XMPJ308KfCP0YAe?UI+(OA^P1-0@#b.IOK?JFTe7WN]+7=H2QY.e
,A7(#GINK;:]P;[JGbTE9_T9U:-H,G-#(B<TaQ9DB>#T?QVYUa]ESV0/UWgDSE0P
HdW21NZ#\7PC6)BEg3ND;6I+):+I#>g[Z,d.)^aIL-4@c>ME2cRePAFQPbCT[C>V
aGeGQK;H],R1;b7NPOP.,;;5GAB:(XX>RA(=[g=?RZ-O,_XSSE?S#JZL6@_feX#<
bK0c)0GC\7COVPXUeUcJHWT^\8aCLRLUH-cPbL&3[a.8Xf(3647XDbf](XT?e?<D
aeLcPEXO#&WXFS4eVTd\:gaK(IJ6A.:_c5N:_OEHT<G6D,cES#]_bKIG+U,YBOU<
6TB]eA6NMB6/dJP)^>Qa3/Iee)Ge3D[Hd7O#ZM6eG\MP?^6Fb=fS2[+c;\-\5[95
)[D+Tba8ASf,b3d_d?(6<0\X/ULHReaJH[MOJX,OI2C4;#Y@<gB.J7a.MXg5D[9I
&_BHZ9Z9NHGeDZWMR;1Gd++1+9/4D2,B=SdR+L\&/560eR@)/f5&R,F#R;OQS?8>
LGN6ZJP5e,I\WJ@<9C(_AYf&;SaA31#FDNa[0Sg.BQ2V3bB:PG3:JDC?3K>V1X2O
7\]cB9S]Y?/Qee52G73Q:<DF\KQIL,<29G/fW,-U4CKC)HT<=RS-]#4^I=TW-HeF
;:W]+(Q7_^@USY_[#NMF/B=-(1^3:c9_H(BV9SQ4WaPX,Bcf@2H<(U&OSQ(]B^#M
)0KH=I-YXZP6g7fX&)AT#;DD&B#JPPb&3(,f+@&4K1587f3+WDV^.c7c2Y5cBH+U
OOVR+OA8H^?eJ?f?WA_N(_GAY&-b<])\,KYYLG[1a=R#+NXSCE>H&5BPX=W<MZDO
5D(:LR63dEVf<S5IB[X1PA_O_>T87I.5EG5fXYa_QL.YCJ3ZU6WS)HW];#BGOD7E
8JIf^>(c_6#VG,cc7HcbBP?1,/>PYe6BOHU0e60A=T=d5^5BT>WT>\]#@W8I0Z>D
8a+ab8ZLM2K&Q8bG_[1D2\8.Z:]V:1>>&4+?Fc;5dC#.P+9cCEgXUV2)#FV5b.9G
[dVK1eMgR4QZHW.Ce\_)FP\J/\(JgI,OMIDXKK&]/Y3S<Y><F5(@Z&9H9M(;\d15
5X_IBQWe[b49G>PeR7[?<-+9,g61,UDe-;.5TDMRVfC22gXYT7M)ROT,MS#\0NA:
94XYA>KJFfQZ44,KLCXgVD809#E1:S0I.gTV1&f:;P4WY?RAYE,)VgI+YYNT,]FJ
&\8;-3ADAgaABI7H&^((I)G+a.fE=K+5/U+9M0@\d@&Z]b@,<K5.A9[&g]A::CJ@
HEdbW^Fbg1-YYFX9[CSX6-KVEYW6IM14NcP_Z43/39;MVEQ6BT+WaP9BX4_5SL/S
RL\=;FY^S;R[(W@N/O69gFFCM7abWAK3>8d7)I]6W;_];KC=JRJ.5J[<^[XEN87+
J/=P3](7ZT]UXOE(QTVd[\R++=4AIMMC\?W@ET;QI89=CC)UeTV)f1c-Sf\-)KC8
51Y-3e-QKYA.=1KAV]TV]g:A]FO/Qeg]^G?<QQ\@N3R\9;bB0@Q>EVVQ=3T4+5P8
bD_?4I99TXSgaeGZ&cH2_#Jf;f)9gcU.I)F6FDJeK=&7/R/,;K\T=^;&+2FVZ45N
?3:[CZ3<^)bR8aA/Cc,IOAJI]aK-,>@]-CY,YPS^1,NG^(gTD-?HJ:78FQa(3UT7
[9gH:H.BF3b0SMacE_)\+4B^G,(K,CE+D85__DY>KQ>T02G5TL76VR.;\7\M>7^d
>_@]6eGe0YfV\S#W/\,N:Gb@_/VVHF:gAc#Y^GI#fP)1][]57Q36eA&#\LGg=?-0
O+\E1/Mb10K)FM+<#)M-]4C9A^+Sd<a9I3E<Z3707RF9HNRGNcLU=ZEJT[:JL52J
^B;C>]:E7cb=PYbI;PVI^X38HW0<g.S<;:2);gSIY9[YJbR19P5#fHg/#(4d02a0
E?P=ZRde[cN(6;#:Y^CQ55NGO=-VX6=W&:PZX6KL=Q0F5Q3U]49NB:WN(DQJbKf?
Q;f?Q<0^8L9Uc3+^N>[BJ>^Y#ZFQ9c=_gMHRR<G8ASN?QA15^:Q,1Y)2P@E^aG;C
7=cZfOM-VJeMSIaNcbIEIA51;-L1_K(dJ(W5_@CK=4>KB]X&NX;-U24(K[VeI7e^
#I[JU:5\74Q[J<)c_U2a9e^E?/U._9<(T82AAM-BC6H=__a)H<I/LUC)c;@cYEeM
b5R)[Q+6Xca5>&b@>P5BX,-Cb=g1^,O6Z?&:Y>@IATbF?@C<:1AJKF?&K\Q_@#--
CQW0^9:&#T15F,:c1aa(;.?1_Kf5LTHJL3J[#=@7T5[A6BR_Pg]1U6f:I&R?I<M6
K;L/:A(.\]MD)TDYC/T>+=?18$
`endprotected


`endif // GUARD_SVT_SPI_TRANSACTION_EXCEPTION_SV
