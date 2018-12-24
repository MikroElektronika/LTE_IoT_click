#line 1 "D:/Clicks_git/L/LTE_IoT_Click/SW/example/c/ARM/STM/Click_LTE_IoT_STM.c"
#line 1 "d:/clicks_git/l/lte_iot_click/sw/example/c/arm/stm/click_lte_iot_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdbool.h"



 typedef char _Bool;
#line 1 "d:/clicks_git/l/lte_iot_click/sw/example/c/arm/stm/click_lte_iot_config.h"
#line 1 "d:/clicks_git/l/lte_iot_click/sw/example/c/arm/stm/click_lte_iot_types.h"
#line 3 "d:/clicks_git/l/lte_iot_click/sw/example/c/arm/stm/click_lte_iot_config.h"
const uint32_t _LTEIOT_TIMER_LIMIT = 5;
const uint16_t _LTEIOT_BUF_WARNING = 192;
const uint8_t _LTEIOT_POLL_ENABLE = 1;
const uint8_t _LTEIOT_CALLBACK_ENABLE = 0;

const uint32_t _LTEIOT_UART_CFG[ 4 ] =
{
 115200,
 _UART_8_BIT_DATA,
 _UART_NOPARITY,
 _UART_ONE_STOPBIT
};
#line 1 "d:/clicks_git/l/lte_iot_click/sw/example/c/arm/stm/click_lte_iot_timer.h"
#line 1 "d:/clicks_git/l/lte_iot_click/sw/example/c/arm/stm/click_lte_iot_types.h"
#line 13 "d:/clicks_git/l/lte_iot_click/sw/example/c/arm/stm/click_lte_iot_timer.h"
static void lteiot_configTimer()
{
 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_PSC = 1;
 TIM2_ARR = 35999;
 NVIC_IntEnable(IVT_INT_TIM2);
 TIM2_DIER.UIE = 1;
 TIM2_CR1.CEN = 1;
 EnableInterrupts();
}

void Timer_interrupt() iv IVT_INT_TIM2
{
 lteiot_tick();
 TIM2_SR.UIF = 0;
}
#line 32 "D:/Clicks_git/L/LTE_IoT_Click/SW/example/c/ARM/STM/Click_LTE_IoT_STM.c"
const uint8_t _LTEIOT_AT[5] = "AT";
const uint8_t _LTEIOT_ATE1[10] = "ATE1";
const uint8_t _LTEIOT_AT_CMEE[15] = "AT+CMEE=2";
const uint8_t _LTEIOT_AT_CGATT[15] = "AT+CGATT?";
const uint8_t _LTEIOT_AT_CEREG[15] = "AT+CEREG?";
const uint8_t _LTEIOT_AT_COPS[15] = "AT+COPS=0";
const uint8_t _LTEIOT_AT_COPS_1[15] = "AT+COPS?";
const uint8_t _LTEIOT_AT_USOCR[15] = "AT+USOCR=17";
const uint8_t _LTEIOT_AT_USOST[50] = "AT+USOST=0,\"195.34.89.241\",7,13,\"TestNumberOne\"";
const uint8_t _LTEIOT_AT_USORF[15] = "AT+USORF=0,13";
const uint8_t _LTEIOT_AT_USOCL[15] = "AT+USOCL=0";

void lteiot_default_handler( uint8_t *rsp, uint8_t *evArgs )
{
 mikrobus_logWrite( rsp, _LOG_TEXT );
}

void systemInit()
{
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_AN_PIN, _GPIO_OUTPUT );
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_PWM_PIN, _GPIO_INPUT );
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
 mikrobus_uartInit( _MIKROBUS1, &_LTEIOT_UART_CFG[0] );
 mikrobus_logInit( _LOG_USBUART_A, 115200 );
 mikrobus_logWrite ("--- System init ---", _LOG_LINE);
}

void applicationInit()
{

 lteiot_configTimer();


 lteiot_uartDriverInit(( const uint8_t* )&_MIKROBUS1_GPIO, ( const uint8_t* )&_MIKROBUS1_UART);
 lteiot_coreInit( lteiot_default_handler, 1500 );


 lteiot_hfcEnable(  1  );
 lteiot_modulePower(  1  );


 lteiot_cmdSingle( &_LTEIOT_AT[0] );
 Delay_1sec();
 lteiot_cmdSingle( &_LTEIOT_ATE1[0] );
 Delay_1sec();


 lteiot_cmdSingle( &_LTEIOT_AT_CMEE[0] );
 Delay_1sec();

 lteiot_cmdSingle( &_LTEIOT_AT_CGATT[0] );
 Delay_1sec();

 lteiot_cmdSingle( &_LTEIOT_AT_CEREG[0] );
 Delay_1sec();

 lteiot_cmdSingle( &_LTEIOT_AT_COPS[0] );
 Delay_1sec();

 lteiot_cmdSingle( &_LTEIOT_AT_COPS_1[0] );
 Delay_1sec();

 lteiot_cmdSingle( &_LTEIOT_AT_USOCR[0] );
 Delay_1sec();

 lteiot_cmdSingle( &_LTEIOT_AT_USOST[0] );
 Delay_1sec();

 lteiot_cmdSingle( &_LTEIOT_AT_USORF[0] );
 Delay_1sec();

 lteiot_cmdSingle( &_LTEIOT_AT_USOCL[0] );
}

void applicationTask()
{
 lteiot_process();
}

void main()
{
 systemInit();
 applicationInit();

 while (1)
 {
 applicationTask();
 }
}
