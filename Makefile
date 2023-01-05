CFLAGS?=-O2 -g -Wall -W $(shell pkg-config --cflags librtlsdr)
LDLIBS+=$(shell pkg-config --libs librtlsdr) -lpthread -lm
CC?=gcc
DESTDIR?=.
PROGNAME=dump1090

all: dump1090

%.o: %.c
	g++ $(CFLAGS) -c $<

dump1090: dump1090.o anet.o
	g++ -g -o dump1090 dump1090.o anet.o $(LDFLAGS) $(LDLIBS)

install:
	mkdir -p $(DESTDIR)/bin
	cp -a dump1090 $(DESTDIR)/bin/dump1090

clean:
	rm -f *.o dump1090
