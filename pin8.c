#include <avr/io.h>
#include <util/delay.h>

//alias for blink delay time
enum { BLINK_DELAY_MS = 1000,  };

int main (void) {

//set pin 8 as output
DDRB |=_BV(DDB0);

//endless loop for blink
	while(1) {

		//set pin to high, delay
		PORTB|=_BV(PORTB0);	
		_delay_ms(BLINK_DELAY_MS);

		//set pin to low, delay
		PORTB &= ~_BV(PORTB0);
		_delay_ms(BLINK_DELAY_MS);
	
	}

return 0;
}
