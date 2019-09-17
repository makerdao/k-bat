SOURCES = src/prelude.smt2.md src/lemmas.k.md src/storage.k.md src/collateral.md

specs: dapp
	klab build

dapp:
	git submodule sync --recursive
	git submodule update --init --recursive
	cd bat-token && dapp build

.PHONY: clean
clean:
	cd bat-token && dapp clean
	rm -rf out/
