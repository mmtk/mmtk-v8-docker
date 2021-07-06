build-mmtk:
	cd mmtk-v8/mmtk && cargo build --features nogc

check: build-mmtk
	cd v8 && ./tools/dev/gm.py x64.optdebug-mmtk.checkall