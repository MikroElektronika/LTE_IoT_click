/*

Use mikroE Timer Calculator to generate proper timer configuration
and timer ISR.

https://www.mikroe.com/timer-calculator

*/
#include "Click_LTE_IoT_types.h"

#define __LTE_IoT_TIMER__

static void lteiot_configTimer()
{
    T1CON      = 0x8010;
    T1IP0_bit  = 1;
    T1IP1_bit  = 1;
    T1IP2_bit  = 1;
    T1IF_bit   = 0;
    T1IE_bit   = 1;
    PR1        = 10000;
    TMR1       = 0;
    EnableInterrupts();
}

void Timer_interrupt() iv IVT_TIMER_1 ilevel 7 ics ICS_SRS
{
    lteiot_tick();
    T1IF_bit     = 0;
}
