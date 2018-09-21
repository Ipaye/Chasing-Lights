;**************************************************
; HEADER SECTION

LIST P=16F84A
#include <p16f84a.inc>
ORG 0
GOTO START
	
ZEROBIT	EQU	2
COUNT	EQU	0CH
	

;*************************************
__CONFIG H'3FF0'

;SUBROTINE SECTION
;**************************************

delay1	CLRF	TMR0
LOOPA	MOVF	TMR0, W
		SUBLW	.32
		BTFSS	STATUS, ZEROBIT
		GOTO	LOOPA
		RETLW	0

delay2	CLRF	TMR0
LOOPB	MOVF	TMR0, W
		SUBLW	.32
		BTFSS	STATUS, ZEROBIT
		GOTO 	LOOPB
		RETLW	0


;******************************************
; CONFIGURATION

START	BSF	STATUS,5
		MOVLW	B'00011111'
		MOVWF	TRISA

		MOVLW	B'00000000'
		MOVWF	TRISB

		MOVLW	B'00000111'
		MOVWF	OPTION_REG

		BCF	STATUS,5
		CLRF	PORTA
		CLRF	PORTB

;***********************************************
		
;start code
BEGIN	BSF		PORTB,0
		CALL	delay1
		
		BSF		PORTB,1
		CALL	delay1
		
		BSF		PORTB,2
		CALL	delay1
		
		BSF		PORTB,3
		CALL	delay1
		
		BSF		PORTB,4
		CALL	delay1
		
		BSF		PORTB,5
		CALL	delay1
		
		BSF		PORTB,6
		CALL	delay1
		
		BSF		PORTB,7
		CALL	delay1
		
		BCF		PORTB,7
		CALL	delay1
		
		BCF		PORTB,6
		CALL	delay1
		
		BCF		PORTB,5
		CALL	delay1
		
		BCF		PORTB,4
		CALL	delay1
		
		BCF		PORTB,3
		CALL	delay1
		
		BCF		PORTB,2
		CALL	delay1
		
		BCF		PORTB,1
		CALL	delay1
		
		BCF		PORTB,0
		call	delay1
		
		CALL 	delay2
		goto 	BEGIN
		
		
		
end
		
		