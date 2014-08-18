#	$OpenBSD: Makefile,v 1.25 2014/08/04 17:38:12 reyk Exp $

PROG=		httpd
SRCS=		parse.y
SRCS+=		config.c control.c httpd.c log.c logger.c proc.c
SRCS+=		server.c server_http.c server_file.c server_fcgi.c
MAN=		httpd.8 httpd.conf.5

LDADD=		-levent -lressl -lssl -lcrypto -lutil
DPADD=		${LIBEVENT} ${LIBRESSL} ${LIBSSL} ${LIBCRYPTO} ${LIBUTIL}
#DEBUG=		-g -DDEBUG=3
CFLAGS+=	-Wall -I${.CURDIR}
CFLAGS+=	-Wstrict-prototypes -Wmissing-prototypes
CFLAGS+=	-Wmissing-declarations
CFLAGS+=	-Wshadow -Wpointer-arith
CFLAGS+=	-Wsign-compare
CLEANFILES+=	y.tab.h

.include <bsd.prog.mk>
