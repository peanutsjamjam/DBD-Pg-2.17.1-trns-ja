
all: Pg.pod.utf8

Pg.pod.utf8: Pg.pod
	#sed -e '/^=encoding euc-jp/s/.*/=encoding utf8/' Pg.pod | nkf -E -w > ${.TARGET}
	sed -e '/^=encoding euc-jp/s/.*/=encoding utf8/' Pg.pod | iconv -f EUC-JP -t UTF-8 > ${.TARGET}

