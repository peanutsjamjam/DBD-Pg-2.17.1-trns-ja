
HTML_INSTALL_DIR ?= /usr/home/sugawara/public_html/pod

all: Pg.pod.utf8

Pg.pod.utf8: Pg.pod
	@#sed -e '/^=encoding euc-jp/s/.*/=encoding utf8/' Pg.pod | nkf -E -w > ${.TARGET}
	sed -e '/^=encoding euc-jp/s/.*/=encoding utf8/' Pg.pod | iconv -f EUC-JP -t UTF-8 > ${.TARGET}

Pg.html: Pg.pod.utf8
	sed -Ee '/^=encoding +/d' Pg.pod.utf8 | pod2html \
		--outfile=${.TARGET} \
		--index \
		--title='DBD::Pg - PostgreSQL database driver for the DBI module'
	rm *.tmp

html: Pg.html
	cp Pg.html ${HTML_INSTALL_DIR}

clean:
	rm -f *.tmp
	rm -f *.html

