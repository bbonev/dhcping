CFLAGS+=${CPPFLAGS}
CFLAGS+=-Wall -Wextra -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -O3 -fPIE
LDFLAGS+=-g -Wl,-z,relro -Wl,-z,now -fPIE -pie
LIBS+=

ifeq ($(shell uname -s),Darwin)
LDFLAGSTODROP:=-Wl,-z,relro -Wl,-z,now
LDFLAGS:=$(filter-out $(LDFLAGSTODROP),$(LDFLAGS))
endif

all: dhcping dhcping.8

clean:
	-rm -f dhcping.o dhcping dhcping.8

re:
	${MAKE} clean
	${MAKE} -j all

dhcping.8: dhcping.pod Makefile
	pod2man --section 8 \
		--date "27 Jan 2002" \
		--name "DHCPING" \
		--center "User Contributed Software" \
		dhcping.pod dhcping.8

dhcping: dhcping.o
	${CC} ${LDFLAGS} -o $@ dhcping.o ${LIBS}

dhcping.o: dhcping.c dhcp_options.h Makefile
	${CC} ${CFLAGS} -c -o $@ dhcping.c

VER:=$(shell grep 'define VERSION' version.h|tr -d '\"'|awk '{print $$3}')
mkotar:
	${MAKE} clean
	-dh_clean
	tar \
		--xform 's,^[.],dhcping-${VER},' \
		--exclude ./.git \
		--exclude ./.gitignore \
		--exclude ./debian \
		-Jcvf ../dhcping_${VER}.orig.tar.xz .
	-rm -f ../dhcping_${VER}.orig.tar.xz.asc
	gpg -a --detach-sign ../dhcping_${VER}.orig.tar.xz
	cp -fa ../dhcping_${VER}.orig.tar.xz ../dhcping-${VER}.tar.xz
	cp -fa ../dhcping_${VER}.orig.tar.xz.asc ../dhcping-${VER}.tar.xz.asc
