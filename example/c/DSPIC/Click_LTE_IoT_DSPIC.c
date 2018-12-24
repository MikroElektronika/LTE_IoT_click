/*
Example for LTE_IoT Click

    Date          : jul 2018.
    Author        : Katarina Perendic

Test configuration dsPIC :
    
    MCU                : P33FJ256GP710A
    Dev. Board         : EasyPIC Fusion v7
    dsPIC Compiler ver : v7.1.0.0

---

Description :

The application is composed of three sections :

- System Initialization - Initializes all necessary GPIO pins, UART used for
the communcation with LTE IOT module and UART used for infromation logging
- Application Initialization - Initializes driver, power on module and sends few
command for the default module configuration. 
Create UDP socket and sending message to UDP socket.


*/

#include "Click_LTE_IoT_types.h"
#include "Click_LTE_IoT_config.h"
#include "Click_LTE_IoT_timer.h"

const uint8_t _LTEIOT_AT[5]         = "AT";
const uint8_t _LTEIOT_ATE1[10]      = "ATE1";
const uint8_t _LTEIOT_AT_CMEE[15]   = "AT+CMEE=2";
const uint8_t _LTEIOT_AT_CGATT[15]  = "AT+CGATT?";
const uint8_t _LTEIOT_AT_CEREG[15]  = "AT+CEREG?";
const uint8_t _LTEIOT_AT_COPS[15]   = "AT+COPS=0";
const uint8_t _LTEIOT_AT_COPS_1[15] = "AT+COPS?";
const uint8_t _LTEIOT_AT_USOCR[15]  = "AT+USOCR=17";
const uint8_t _LTEIOT_AT_USOST[50]  = "AT+USOST=0,\"195.34.89.241\",7,13,\"TestNumberOne\"";
const uint8_t _LTEIOT_AT_USORF[15]  = "AT+USORF=0,13";
const uint8_t _LTEIOT_AT_USOCL[15]  = "AT+USOCL=0";

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
// TIMER INIT
    lteiot_configTimer();

// DRIVER INIT
    lteiot_uartDriverInit((T_LTEIOT_P)&_MIKROBUS1_GPIO, (T_LTEIOT_P)&_MIKROBUS1_UART);
    lteiot_coreInit( lteiot_default_handler, 1500 );

// MODULE POWER ON
    lteiot_hfcEnable( true );
    lteiot_modulePower( true );

// MODULE INIT
    lteiot_cmdSingle( &_LTEIOT_AT[0] );
    Delay_1sec();
    lteiot_cmdSingle( &_LTEIOT_ATE1[0] );
    Delay_1sec();
    /* Opening a UDP socket */
    // Commmand : AT+CMEE=2 - Enables the cellular module to report verbose error result codes
    lteiot_cmdSingle( &_LTEIOT_AT_CMEE[0] );
    Delay_1sec();
    // Commmand : AT+CGATT? - Verifies the SARA-R4 module is attached to the network.
    lteiot_cmdSingle( &_LTEIOT_AT_CGATT[0] );
    Delay_1sec();
    // Commmand : AT+CEREG? - Verify the network registration status.
    lteiot_cmdSingle( &_LTEIOT_AT_CEREG[0] );
    Delay_1sec();
    // Commmand : AT+COPS=0 - Register the module on the network
    lteiot_cmdSingle( &_LTEIOT_AT_COPS[0] );
    Delay_1sec();
    // Commmand : AT+COPS? - Read the operator name
    lteiot_cmdSingle( &_LTEIOT_AT_COPS_1[0] );
    Delay_1sec();
    // Commmand : AT+USOCR=17 - Create a UDP socket.
    lteiot_cmdSingle( &_LTEIOT_AT_USOCR[0] );
    Delay_1sec();
    // Commmand : AT+USOST=0,"IP address",port,number character,"message" - Connecting and storing text on the server.
    lteiot_cmdSingle( &_LTEIOT_AT_USOST[0] );
    Delay_1sec();
    // Commmand : AT+USORF=0,number character - Reading the message from the server
    lteiot_cmdSingle( &_LTEIOT_AT_USORF[0] );
    Delay_1sec();
    // Commmand : AT+USOCL=0 - Closing the socket.
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

/* -------------------------------------------------------------------------- */