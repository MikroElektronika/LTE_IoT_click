#include "Click_LTE_IoT_types.h"

const uint32_t _LTEIOT_TIMER_LIMIT      = 5;	    // 5 ticks
const uint16_t _LTEIOT_BUF_WARNING      = 192;	// 192 bytes activate warning
const uint8_t  _LTEIOT_POLL_ENABLE      = 1; 	// poll enabled
const uint8_t  _LTEIOT_CALLBACK_ENABLE  = 0;	    // calback disabled

const uint32_t _LTEIOT_UART_CFG[ 4 ] = 
{
	115200, 
	_UART_8_BIT_DATA, 
    _UART_NOPARITY, 
    _UART_ONE_STOPBIT
};