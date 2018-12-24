/*

Use mikroE Timer Calculator to generate proper timer configuration
and timer ISR.

https://www.mikroe.com/timer-calculator

*/
#include "Click_LTE_IoT_types.h"

#define __LTE_IoT_TIMER__

static void lteiot_configTimer()
{


    // Configure Timer
}

void Timer_interrupt()
{
    lteiot_tick();
    // Reset Flag
}