
all: Pg.pod.utf8

Pg.pod.utf8: Pg.pod
	#sed -e '/^=encoding euc-jp/s/.*/=encoding utf8/' Pg.pod | nkf -E -w > ${.TARGET}
	sed -e '/^=encoding euc-jp/s/.*/=encoding utf8/' Pg.pod | iconv -f EUC-JP -t UTF-8 > ${.TARGET}

html: Pg.pod.utf8
	pod2html \
		--infile=Pg.pod.utf8 \
		--outfile=Pg.html \
		--index \
		--title='DBD::Pg - PostgreSQL database driver for the DBI module'

clean:
	rm -f *.tmp

