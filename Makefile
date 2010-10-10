
all: Pg.pod.utf8

Pg.pod.utf8: Pg.pod
	nkf -E -w Pg.pod > ${.TARGET}

