# makefile for flashing arduino uno
# nmt 2015

# set compiler
CC = avr-gcc

# initialisation for compiler
default: pin8

# create object file from source
pin8.o: pin8.c
	$(CC) -Os -DF_CPU=16000000L -mmcu=atmega328p -c -o pin8.o pin8.c

# create executable from object file
pin8: pin8.o
	$(CC) -mmcu=atmega328p pin8.o -o pin8

# turn executable into hex file
hex:
	avr-objcopy -O ihex -R .eeprom pin8 pin8.hex

# initialize arduino
read:
	avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200

# write to arduino
write:
	avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:pin8.hex

# clean everything
clean:
	$(RM) pin8.o pin8.hex pin8

## 
