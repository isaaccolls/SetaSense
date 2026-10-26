#define LCD_RS_PIN PIN_C0
#define LCD_RW_PIN PIN_C1
#define LCD_ENABLE_PIN PIN_C2
#define LCD_DATA4 PIN_C3
#define LCD_DATA5 PIN_C4
#define LCD_DATA6 PIN_C5
#define LCD_DATA7 PIN_C6

#include <16F877A.h>
#fuses HS, NOWDT, NOPROTECT, NOCPD
#use delay(clock = 20Mhz, crystal)
#include <lcd.c>
#use fast_io(b)

char customBlink(int delay)
{
  output_high(pin_b7);
  delay_ms(delay);
  output_low(pin_b7);
  delay_ms(delay);
}

void main()
{
  port_b_pullups(true);
  set_tris_b(0);
  lcd_init();
  lcd_putc("\fHola Mundo");
  lcd_gotoxy(1, 2);
  lcd_putc("te amo :)");
  while (true)
  {
    customBlink(1000);
  }
}