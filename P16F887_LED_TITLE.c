// Lcd pinout settings
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D4 at RB0_bit;

// Pin direction
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;

char ini[] = "Inicial. sistema";
char stable[] = "Sistema stable";
char hello[] = "Ola";

long t;    //timer
unsigned char C_status;     // program status = 0
unsigned short counter;     // increment if neccessary

void _delay_ms(long ms) {
   long l,m;
   for(l=0; l<65000; l++)
      for(m=0; m<ms; m++)
        ;
}

void _clear_display(short n) {
  if(n >= 1) {
    LCD_Cmd(_LCD_CLEAR);
  }
  else if (n == 0) {
    LCD_Cmd(_LCD_FIRST_ROW);
  }
}

void _write_msg(unsigned char row, unsigned char colum, char msg[]) {
  LCD_Out(row,colum,msg);
}

void main() {
    ANSEL    = 0;                        // Configure AN pins as digital I/O
                                         // Extremamente necessario caso contrario
                                         // Não irá funcionar
    ANSELH   = 0;                        // Necessario.
    C1ON_bit = 0;                        // Disable comparators
    C2ON_bit = 0;                        // Não é de extrema importancia
                                         // Neste contexto.

    Lcd_Init();
    _clear_display(1);                   // LCD Clear display
    _clear_display(0);                   // LCD First Row
    
    while(1) {
       switch(counter) {
          case 0:
            _write_msg(1,1,ini);
            _delay_ms(1);
            _clear_display(1);
            counter =1;
          continue;
          
          case 1:
             _write_msg(1,1,stable);
             _delay_ms(1);
             _clear_display(1);
             counter = 2;
          continue;
          
          case 2:
             counter = 3;

             for(t=0; t<4; t++) {
                 _write_msg(1,1,hello);
                 LCD_Cmd(_LCD_SHIFT_RIGHT);
                 _delay_ms(0.00001);
             }
             
             for(t=0; t<3; t++) {
                 _write_msg(1,1,hello);
                 LCD_Cmd(_LCD_SHIFT_LEFT);
                 _delay_ms(0.00001);
             }

             if(counter == 3)
                _clear_display(1);
          break;
       }
    }
}