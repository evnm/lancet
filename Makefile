INSTALL_ROOT = /usr/local

install:
	cp -R bin/lancet $(INSTALL_ROOT)/bin/
	if [[ ! -a "$(INSTALL_ROOT)/libexec" ]]; then mkdir $(INSTALL_ROOT)/libexec; fi
	cp libexec/* $(INSTALL_ROOT)/libexec/

uninstall:
	rm $(INSTALL_ROOT)/bin/lancet $(INSTALL_ROOT)/libexec/lancet*
