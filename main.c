#include <16F877A.h>
#fuses HS, NOWDT, NOPROTECT, NOCPD
#use delay(clock = 20000000)
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
  while (true)
  {
    customBlink(999);
  }
}
