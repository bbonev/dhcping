#
# $Id: Makefile,v 1.1 2001/08/24 00:36:50 mavetju Exp $
#

all: dhcping

dhcping: dhcping.o
	gcc -Wall -g -o dhcping dhcping.o
dhcping.o: dhcping.c dhcp_options.h
	gcc -Wall -g -c -o dhcping.o dhcping.c

clean:
	rm -f dhcping dhcping.o

install:
	install -c -o root -g wheel -m 755 dhcping /usr/local/bin
	install -c -o root -g wheel -m 644 dhcping.8 /usr/local/man/man8

uninstall:
	rm /usr/local/bin/dhcping
	rm /usr/local/man/man8/dhcping.8
