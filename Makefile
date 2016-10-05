DIR := texts
texts := $(wildcard $(DIR)/*.txt)
datfiles := $(patsubst %,%.dat,${texts})

ifeq ($(present_datafiles),)
	CLEAN=
else
	CLEAN=rm $(present_datfiles)
endif

.PHONY: clean all install

all:
	$(foreach text,$(texts), strfile $(text) $(text).dat;)

clean:
	$(foreach datfile,$(wildcard $(DIR)/*.dat), rm $(datfile);)

install:
	cp $(DIR)/* /usr/share/fortune/
