
__delay_ms:

;P16F887_LED_TITLE.c,25 :: 		void _delay_ms(long ms) {
;P16F887_LED_TITLE.c,27 :: 		for(l=0; l<65000; l++)
	CLRF       R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
L__delay_ms0:
	MOVLW      128
	XORWF      R4+3, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L___delay_ms24
	MOVLW      0
	SUBWF      R4+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L___delay_ms24
	MOVLW      253
	SUBWF      R4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L___delay_ms24
	MOVLW      232
	SUBWF      R4+0, 0
L___delay_ms24:
	BTFSC      STATUS+0, 0
	GOTO       L__delay_ms1
;P16F887_LED_TITLE.c,28 :: 		for(m=0; m<ms; m++)
	CLRF       R8+0
	CLRF       R8+1
	CLRF       R8+2
	CLRF       R8+3
L__delay_ms3:
	MOVLW      128
	XORWF      R8+3, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG__delay_ms_ms+3, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L___delay_ms25
	MOVF       FARG__delay_ms_ms+2, 0
	SUBWF      R8+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L___delay_ms25
	MOVF       FARG__delay_ms_ms+1, 0
	SUBWF      R8+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L___delay_ms25
	MOVF       FARG__delay_ms_ms+0, 0
	SUBWF      R8+0, 0
L___delay_ms25:
	BTFSC      STATUS+0, 0
	GOTO       L__delay_ms4
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      R8+0
	MOVF       R0+1, 0
	MOVWF      R8+1
	MOVF       R0+2, 0
	MOVWF      R8+2
	MOVF       R0+3, 0
	MOVWF      R8+3
;P16F887_LED_TITLE.c,29 :: 		;
	GOTO       L__delay_ms3
L__delay_ms4:
;P16F887_LED_TITLE.c,27 :: 		for(l=0; l<65000; l++)
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVF       R4+1, 0
	MOVWF      R0+1
	MOVF       R4+2, 0
	MOVWF      R0+2
	MOVF       R4+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
;P16F887_LED_TITLE.c,29 :: 		;
	GOTO       L__delay_ms0
L__delay_ms1:
;P16F887_LED_TITLE.c,30 :: 		}
L_end__delay_ms:
	RETURN
; end of __delay_ms

__clear_display:

;P16F887_LED_TITLE.c,32 :: 		void _clear_display(short n) {
;P16F887_LED_TITLE.c,33 :: 		if(n >= 1) {
	MOVLW      128
	XORWF      FARG__clear_display_n+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__clear_display6
;P16F887_LED_TITLE.c,34 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;P16F887_LED_TITLE.c,35 :: 		}
	GOTO       L__clear_display7
L__clear_display6:
;P16F887_LED_TITLE.c,36 :: 		else if (n == 0) {
	MOVF       FARG__clear_display_n+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__clear_display8
;P16F887_LED_TITLE.c,37 :: 		LCD_Cmd(_LCD_FIRST_ROW);
	MOVLW      128
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;P16F887_LED_TITLE.c,38 :: 		}
L__clear_display8:
L__clear_display7:
;P16F887_LED_TITLE.c,39 :: 		}
L_end__clear_display:
	RETURN
; end of __clear_display

__write_msg:

;P16F887_LED_TITLE.c,41 :: 		void _write_msg(unsigned char row, unsigned char colum, char msg[]) {
;P16F887_LED_TITLE.c,42 :: 		LCD_Out(row,colum,msg);
	MOVF       FARG__write_msg_row+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG__write_msg_colum+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       FARG__write_msg_msg+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;P16F887_LED_TITLE.c,43 :: 		}
L_end__write_msg:
	RETURN
; end of __write_msg

_main:

;P16F887_LED_TITLE.c,45 :: 		void main() {
;P16F887_LED_TITLE.c,46 :: 		ANSEL    = 0;                        // Configure AN pins as digital I/O
	CLRF       ANSEL+0
;P16F887_LED_TITLE.c,49 :: 		ANSELH   = 0;                        // Necessario.
	CLRF       ANSELH+0
;P16F887_LED_TITLE.c,50 :: 		C1ON_bit = 0;                        // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;P16F887_LED_TITLE.c,51 :: 		C2ON_bit = 0;                        // Não é de extrema importancia
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;P16F887_LED_TITLE.c,54 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;P16F887_LED_TITLE.c,55 :: 		_clear_display(1);                   // LCD Clear display
	MOVLW      1
	MOVWF      FARG__clear_display_n+0
	CALL       __clear_display+0
;P16F887_LED_TITLE.c,56 :: 		_clear_display(0);                   // LCD First Row
	CLRF       FARG__clear_display_n+0
	CALL       __clear_display+0
;P16F887_LED_TITLE.c,58 :: 		while(1) {
L_main9:
;P16F887_LED_TITLE.c,59 :: 		switch(counter) {
	GOTO       L_main11
;P16F887_LED_TITLE.c,60 :: 		case 0:
L_main13:
;P16F887_LED_TITLE.c,61 :: 		_write_msg(1,1,ini);
	MOVLW      1
	MOVWF      FARG__write_msg_row+0
	MOVLW      1
	MOVWF      FARG__write_msg_colum+0
	MOVLW      _ini+0
	MOVWF      FARG__write_msg_msg+0
	CALL       __write_msg+0
;P16F887_LED_TITLE.c,62 :: 		_delay_ms(1);
	MOVLW      1
	MOVWF      FARG__delay_ms_ms+0
	CLRF       FARG__delay_ms_ms+1
	CLRF       FARG__delay_ms_ms+2
	CLRF       FARG__delay_ms_ms+3
	CALL       __delay_ms+0
;P16F887_LED_TITLE.c,63 :: 		_clear_display(1);
	MOVLW      1
	MOVWF      FARG__clear_display_n+0
	CALL       __clear_display+0
;P16F887_LED_TITLE.c,64 :: 		counter =1;
	MOVLW      1
	MOVWF      _counter+0
;P16F887_LED_TITLE.c,65 :: 		continue;
	GOTO       L_main9
;P16F887_LED_TITLE.c,67 :: 		case 1:
L_main14:
;P16F887_LED_TITLE.c,68 :: 		_write_msg(1,1,stable);
	MOVLW      1
	MOVWF      FARG__write_msg_row+0
	MOVLW      1
	MOVWF      FARG__write_msg_colum+0
	MOVLW      _stable+0
	MOVWF      FARG__write_msg_msg+0
	CALL       __write_msg+0
;P16F887_LED_TITLE.c,69 :: 		_delay_ms(1);
	MOVLW      1
	MOVWF      FARG__delay_ms_ms+0
	CLRF       FARG__delay_ms_ms+1
	CLRF       FARG__delay_ms_ms+2
	CLRF       FARG__delay_ms_ms+3
	CALL       __delay_ms+0
;P16F887_LED_TITLE.c,70 :: 		_clear_display(1);
	MOVLW      1
	MOVWF      FARG__clear_display_n+0
	CALL       __clear_display+0
;P16F887_LED_TITLE.c,71 :: 		counter = 2;
	MOVLW      2
	MOVWF      _counter+0
;P16F887_LED_TITLE.c,72 :: 		continue;
	GOTO       L_main9
;P16F887_LED_TITLE.c,74 :: 		case 2:
L_main15:
;P16F887_LED_TITLE.c,75 :: 		counter = 3;
	MOVLW      3
	MOVWF      _counter+0
;P16F887_LED_TITLE.c,77 :: 		for(t=0; t<4; t++) {
	CLRF       _t+0
	CLRF       _t+1
	CLRF       _t+2
	CLRF       _t+3
L_main16:
	MOVLW      128
	XORWF      _t+3, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      0
	SUBWF      _t+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      0
	SUBWF      _t+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      4
	SUBWF      _t+0, 0
L__main29:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
;P16F887_LED_TITLE.c,78 :: 		_write_msg(1,1,hello);
	MOVLW      1
	MOVWF      FARG__write_msg_row+0
	MOVLW      1
	MOVWF      FARG__write_msg_colum+0
	MOVLW      _hello+0
	MOVWF      FARG__write_msg_msg+0
	CALL       __write_msg+0
;P16F887_LED_TITLE.c,79 :: 		LCD_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;P16F887_LED_TITLE.c,80 :: 		_delay_ms(0.00001);
	CLRF       FARG__delay_ms_ms+0
	CLRF       FARG__delay_ms_ms+1
	CLRF       FARG__delay_ms_ms+2
	CLRF       FARG__delay_ms_ms+3
	CALL       __delay_ms+0
;P16F887_LED_TITLE.c,77 :: 		for(t=0; t<4; t++) {
	MOVF       _t+0, 0
	MOVWF      R0+0
	MOVF       _t+1, 0
	MOVWF      R0+1
	MOVF       _t+2, 0
	MOVWF      R0+2
	MOVF       _t+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      _t+0
	MOVF       R0+1, 0
	MOVWF      _t+1
	MOVF       R0+2, 0
	MOVWF      _t+2
	MOVF       R0+3, 0
	MOVWF      _t+3
;P16F887_LED_TITLE.c,81 :: 		}
	GOTO       L_main16
L_main17:
;P16F887_LED_TITLE.c,83 :: 		for(t=0; t<3; t++) {
	CLRF       _t+0
	CLRF       _t+1
	CLRF       _t+2
	CLRF       _t+3
L_main19:
	MOVLW      128
	XORWF      _t+3, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      0
	SUBWF      _t+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      0
	SUBWF      _t+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      3
	SUBWF      _t+0, 0
L__main30:
	BTFSC      STATUS+0, 0
	GOTO       L_main20
;P16F887_LED_TITLE.c,84 :: 		_write_msg(1,1,hello);
	MOVLW      1
	MOVWF      FARG__write_msg_row+0
	MOVLW      1
	MOVWF      FARG__write_msg_colum+0
	MOVLW      _hello+0
	MOVWF      FARG__write_msg_msg+0
	CALL       __write_msg+0
;P16F887_LED_TITLE.c,85 :: 		LCD_Cmd(_LCD_SHIFT_LEFT);
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;P16F887_LED_TITLE.c,86 :: 		_delay_ms(0.00001);
	CLRF       FARG__delay_ms_ms+0
	CLRF       FARG__delay_ms_ms+1
	CLRF       FARG__delay_ms_ms+2
	CLRF       FARG__delay_ms_ms+3
	CALL       __delay_ms+0
;P16F887_LED_TITLE.c,83 :: 		for(t=0; t<3; t++) {
	MOVF       _t+0, 0
	MOVWF      R0+0
	MOVF       _t+1, 0
	MOVWF      R0+1
	MOVF       _t+2, 0
	MOVWF      R0+2
	MOVF       _t+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      _t+0
	MOVF       R0+1, 0
	MOVWF      _t+1
	MOVF       R0+2, 0
	MOVWF      _t+2
	MOVF       R0+3, 0
	MOVWF      _t+3
;P16F887_LED_TITLE.c,87 :: 		}
	GOTO       L_main19
L_main20:
;P16F887_LED_TITLE.c,89 :: 		if(counter == 3)
	MOVF       _counter+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;P16F887_LED_TITLE.c,90 :: 		_clear_display(1);
	MOVLW      1
	MOVWF      FARG__clear_display_n+0
	CALL       __clear_display+0
L_main22:
;P16F887_LED_TITLE.c,91 :: 		break;
	GOTO       L_main12
;P16F887_LED_TITLE.c,92 :: 		}
L_main11:
	MOVF       _counter+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _counter+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVF       _counter+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main15
L_main12:
;P16F887_LED_TITLE.c,93 :: 		}
	GOTO       L_main9
;P16F887_LED_TITLE.c,94 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
