all: yasnippet.stamp js2-mode/js2-mode.el _submodules.stamp

.PHONY: _submodules.stamp
_submodules.stamp:
	cd .. && git submodule update --init
	date > $@

yasnippet.stamp:
	svn checkout http://yasnippet.googlecode.com/svn/trunk/ yasnippet
	date > $@

js2-mode/js2-mode.el:
	svn checkout http://js2-mode.googlecode.com/svn/trunk/ js2-mode
