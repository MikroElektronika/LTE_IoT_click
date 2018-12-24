![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

---

# LTE_IoT Click

- **CIC Prefix**  : LTEIOT
- **Author**      : Katarina Perendic
- **Verison**     : 1.0.0
- **Date**        : jul 2018.

---

### Software Support

We provide a library for the LTE_IoT Click on our [LibStock](https://libstock.mikroe.com/projects/view/2493/lte-iot-click) 
page, as well as a demo application (example), developed using MikroElektronika 
[compilers](http://shop.mikroe.com/compilers). The demo can run on all the main 
MikroElektronika [development boards](http://shop.mikroe.com/development-boards).

**Library Description**

The application is composed of three sections :

- System Initialization - Initializes all necessary GPIO pins, UART used for
the communcation with LTE IOT 2 module and UART used for infromation logging
- Application Initialization - Initializes driver, power on module and sends few
command for the default module configuration
Create UDP socket and sending message to UDP socket.


This code snippet shows how generic parser should be properly initialized. 
Before intialization module must be turned on and additionaly to that hardware 
flow control should be also 

Commands :
- Command : AT+CMEE=2 - Enables the cellular module to report verbose error result codes
- Command : AT+CGATT? - Verifies the SARA-R4 module is attached to the network.
- Command : AT+CEREG? - Verify the network registration status.
- Command : AT+COPS=0 - Register the module on the network
- Command : AT+COPS? - Read the operator name
- Command : AT+USOCR=17 - Create a UDP socket.
- Command : AT+USOST=0,"IP address",port,number character,"message" - Connecting and storing text on the server.
- Command : AT+USORF=0,number character - Reading the message from the server
- Command : AT+USOCL=0 - Closing the socket.


```.c

// MODULE POWER ON
    lteiot_hfcEnable( true );
    lteiot_modulePower( true );

// MODULE INIT
    lteiot_cmdSingle( &_LTEIOT_AT[0] );
    lteiot_cmdSingle( &_LTEIOT_ATE1[0] );
    lteiot_cmdSingle( &_LTEIOT_AT_CMEE[0] );
    lteiot_cmdSingle( &_LTEIOT_AT_CGATT[0] );
    lteiot_cmdSingle( &_LTEIOT_AT_CEREG[0] );
    lteiot_cmdSingle( &_LTEIOT_AT_COPS[0] );
    lteiot_cmdSingle( &_LTEIOT_AT_COPS_1[0] );
    lteiot_cmdSingle( &_LTEIOT_AT_USOCR[0] );
    lteiot_cmdSingle( &_LTEIOT_AT_USOST[0] );
    lteiot_cmdSingle( &_LTEIOT_AT_USOCL[0] );

```

Alongside with the demo application timer initialization functions are provided.
Note that timer is configured acording to default develoment system and 
MCUs, changing the system or MCU may require update of timer init and timer ISR 
functions.

The full application code, and ready to use projects can be found on our 
[LibStock](https://libstock.mikroe.com/projects/view/2493/lte-iot-click) page.

Other mikroE Libraries used in the example:

- String
- Conversion

**Additional notes and informations**

Depending on the development board you are using, you may need 
[USB UART click](http://shop.mikroe.com/usb-uart-click), 
[USB UART 2 Click](http://shop.mikroe.com/usb-uart-2-click) or 
[RS232 Click](http://shop.mikroe.com/rs232-click) to connect to your PC, for 
development systems with no UART to USB interface available on the board. The 
terminal available in all Mikroelektronika 
[compilers](http://shop.mikroe.com/compilers), or any other terminal application 
of your choice, can be used to read the message.

---

| **Supported** | STM | KIN | CEC | MSP | TI  | PIC | P32 | DSP | AVR | FT90x |
|--------------:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:-----:|
| **mikroC**    |  x  |  x  |     |     |  x  |  x  |  x  |  x  |  x  |   x   |
| **mikroB**    |  x  |  x  |     |     |  x  |  x  |  x  |  x  |  x  |   x   |
| **mikroP**    |  x  |  x  |     |     |  x  |  x  |  x  |  x  |  x  |   x   |

---
---
