Click_LTE_IoT_STM_lteiot_configTimer:
;click_lte_iot_timer.h,15 :: 		static void lteiot_configTimer()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;click_lte_iot_timer.h,17 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
_SX	[R0, ByteOffset(RCC_APB1ENR+0)]
;click_lte_iot_timer.h,18 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;click_lte_iot_timer.h,19 :: 		TIM2_PSC = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;click_lte_iot_timer.h,20 :: 		TIM2_ARR = 35999;
MOVW	R1, #35999
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;click_lte_iot_timer.h,21 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;click_lte_iot_timer.h,22 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
_SX	[R0, ByteOffset(TIM2_DIER+0)]
;click_lte_iot_timer.h,23 :: 		TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;click_lte_iot_timer.h,24 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;click_lte_iot_timer.h,25 :: 		}
L_end_lteiot_configTimer:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Click_LTE_IoT_STM_lteiot_configTimer
_Timer_interrupt:
;click_lte_iot_timer.h,27 :: 		void Timer_interrupt() iv IVT_INT_TIM2
SUB	SP, SP, #4
STR	LR, [SP, #0]
;click_lte_iot_timer.h,29 :: 		lteiot_tick();
BL	_lteiot_tick+0
;click_lte_iot_timer.h,30 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
_SX	[R0, ByteOffset(TIM2_SR+0)]
;click_lte_iot_timer.h,31 :: 		}
L_end_Timer_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer_interrupt
_lteiot_default_handler:
;Click_LTE_IoT_STM.c,46 :: 		void lteiot_default_handler( uint8_t *rsp, uint8_t *evArgs )
; rsp start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; rsp end address is: 0 (R0)
; rsp start address is: 0 (R0)
;Click_LTE_IoT_STM.c,48 :: 		mikrobus_logWrite( rsp, _LOG_TEXT );
MOVS	R1, #1
; rsp end address is: 0 (R0)
BL	_mikrobus_logWrite+0
;Click_LTE_IoT_STM.c,49 :: 		}
L_end_lteiot_default_handler:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _lteiot_default_handler
_systemInit:
;Click_LTE_IoT_STM.c,51 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_LTE_IoT_STM.c,53 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_AN_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_LTE_IoT_STM.c,54 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_PWM_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #6
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_LTE_IoT_STM.c,55 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #7
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_LTE_IoT_STM.c,56 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #1
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_LTE_IoT_STM.c,57 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_LTE_IoT_STM.c,58 :: 		mikrobus_uartInit( _MIKROBUS1, &_LTEIOT_UART_CFG[0] );
MOVW	R0, #lo_addr(__LTEIOT_UART_CFG+0)
MOVT	R0, #hi_addr(__LTEIOT_UART_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_uartInit+0
;Click_LTE_IoT_STM.c,59 :: 		mikrobus_logInit( _LOG_USBUART_A, 115200 );
MOV	R1, #115200
MOVS	R0, #32
BL	_mikrobus_logInit+0
;Click_LTE_IoT_STM.c,60 :: 		mikrobus_logWrite ("--- System init ---", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr1_Click_LTE_IoT_STM+0)
MOVT	R0, #hi_addr(?lstr1_Click_LTE_IoT_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_LTE_IoT_STM.c,61 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_LTE_IoT_STM.c,63 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_LTE_IoT_STM.c,66 :: 		lteiot_configTimer();
BL	Click_LTE_IoT_STM_lteiot_configTimer+0
;Click_LTE_IoT_STM.c,69 :: 		lteiot_uartDriverInit((T_LTEIOT_P)&_MIKROBUS1_GPIO, (T_LTEIOT_P)&_MIKROBUS1_UART);
MOVW	R1, #lo_addr(__MIKROBUS1_UART+0)
MOVT	R1, #hi_addr(__MIKROBUS1_UART+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_lteiot_uartDriverInit+0
;Click_LTE_IoT_STM.c,70 :: 		lteiot_coreInit( lteiot_default_handler, 1500 );
MOVW	R0, #lo_addr(_lteiot_default_handler+0)
MOVT	R0, #hi_addr(_lteiot_default_handler+0)
MOVW	R1, #1500
BL	_lteiot_coreInit+0
;Click_LTE_IoT_STM.c,73 :: 		lteiot_hfcEnable( true );
MOVS	R0, #1
BL	_lteiot_hfcEnable+0
;Click_LTE_IoT_STM.c,74 :: 		lteiot_modulePower( true );
MOVS	R0, #1
BL	_lteiot_modulePower+0
;Click_LTE_IoT_STM.c,77 :: 		lteiot_cmdSingle( &_LTEIOT_AT[0] );
MOVW	R0, #lo_addr(__LTEIOT_AT+0)
MOVT	R0, #hi_addr(__LTEIOT_AT+0)
BL	_lteiot_cmdSingle+0
;Click_LTE_IoT_STM.c,78 :: 		Delay_1sec();
BL	_Delay_1sec+0
;Click_LTE_IoT_STM.c,79 :: 		lteiot_cmdSingle( &_LTEIOT_ATE1[0] );
MOVW	R0, #lo_addr(__LTEIOT_ATE1+0)
MOVT	R0, #hi_addr(__LTEIOT_ATE1+0)
BL	_lteiot_cmdSingle+0
;Click_LTE_IoT_STM.c,80 :: 		Delay_1sec();
BL	_Delay_1sec+0
;Click_LTE_IoT_STM.c,83 :: 		lteiot_cmdSingle( &_LTEIOT_AT_CMEE[0] );
MOVW	R0, #lo_addr(__LTEIOT_AT_CMEE+0)
MOVT	R0, #hi_addr(__LTEIOT_AT_CMEE+0)
BL	_lteiot_cmdSingle+0
;Click_LTE_IoT_STM.c,84 :: 		Delay_1sec();
BL	_Delay_1sec+0
;Click_LTE_IoT_STM.c,86 :: 		lteiot_cmdSingle( &_LTEIOT_AT_CGATT[0] );
MOVW	R0, #lo_addr(__LTEIOT_AT_CGATT+0)
MOVT	R0, #hi_addr(__LTEIOT_AT_CGATT+0)
BL	_lteiot_cmdSingle+0
;Click_LTE_IoT_STM.c,87 :: 		Delay_1sec();
BL	_Delay_1sec+0
;Click_LTE_IoT_STM.c,89 :: 		lteiot_cmdSingle( &_LTEIOT_AT_CEREG[0] );
MOVW	R0, #lo_addr(__LTEIOT_AT_CEREG+0)
MOVT	R0, #hi_addr(__LTEIOT_AT_CEREG+0)
BL	_lteiot_cmdSingle+0
;Click_LTE_IoT_STM.c,90 :: 		Delay_1sec();
BL	_Delay_1sec+0
;Click_LTE_IoT_STM.c,92 :: 		lteiot_cmdSingle( &_LTEIOT_AT_COPS[0] );
MOVW	R0, #lo_addr(__LTEIOT_AT_COPS+0)
MOVT	R0, #hi_addr(__LTEIOT_AT_COPS+0)
BL	_lteiot_cmdSingle+0
;Click_LTE_IoT_STM.c,93 :: 		Delay_1sec();
BL	_Delay_1sec+0
;Click_LTE_IoT_STM.c,95 :: 		lteiot_cmdSingle( &_LTEIOT_AT_COPS_1[0] );
MOVW	R0, #lo_addr(__LTEIOT_AT_COPS_1+0)
MOVT	R0, #hi_addr(__LTEIOT_AT_COPS_1+0)
BL	_lteiot_cmdSingle+0
;Click_LTE_IoT_STM.c,96 :: 		Delay_1sec();
BL	_Delay_1sec+0
;Click_LTE_IoT_STM.c,98 :: 		lteiot_cmdSingle( &_LTEIOT_AT_USOCR[0] );
MOVW	R0, #lo_addr(__LTEIOT_AT_USOCR+0)
MOVT	R0, #hi_addr(__LTEIOT_AT_USOCR+0)
BL	_lteiot_cmdSingle+0
;Click_LTE_IoT_STM.c,99 :: 		Delay_1sec();
BL	_Delay_1sec+0
;Click_LTE_IoT_STM.c,101 :: 		lteiot_cmdSingle( &_LTEIOT_AT_USOST[0] );
MOVW	R0, #lo_addr(__LTEIOT_AT_USOST+0)
MOVT	R0, #hi_addr(__LTEIOT_AT_USOST+0)
BL	_lteiot_cmdSingle+0
;Click_LTE_IoT_STM.c,102 :: 		Delay_1sec();
BL	_Delay_1sec+0
;Click_LTE_IoT_STM.c,104 :: 		lteiot_cmdSingle( &_LTEIOT_AT_USORF[0] );
MOVW	R0, #lo_addr(__LTEIOT_AT_USORF+0)
MOVT	R0, #hi_addr(__LTEIOT_AT_USORF+0)
BL	_lteiot_cmdSingle+0
;Click_LTE_IoT_STM.c,105 :: 		Delay_1sec();
BL	_Delay_1sec+0
;Click_LTE_IoT_STM.c,107 :: 		lteiot_cmdSingle( &_LTEIOT_AT_USOCL[0] );
MOVW	R0, #lo_addr(__LTEIOT_AT_USOCL+0)
MOVT	R0, #hi_addr(__LTEIOT_AT_USOCL+0)
BL	_lteiot_cmdSingle+0
;Click_LTE_IoT_STM.c,108 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_LTE_IoT_STM.c,110 :: 		void applicationTask()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_LTE_IoT_STM.c,112 :: 		lteiot_process();
BL	_lteiot_process+0
;Click_LTE_IoT_STM.c,113 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTask
_main:
;Click_LTE_IoT_STM.c,115 :: 		void main()
;Click_LTE_IoT_STM.c,117 :: 		systemInit();
BL	_systemInit+0
;Click_LTE_IoT_STM.c,118 :: 		applicationInit();
BL	_applicationInit+0
;Click_LTE_IoT_STM.c,120 :: 		while (1)
L_main0:
;Click_LTE_IoT_STM.c,122 :: 		applicationTask();
BL	_applicationTask+0
;Click_LTE_IoT_STM.c,123 :: 		}
IT	AL
BAL	L_main0
;Click_LTE_IoT_STM.c,124 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
