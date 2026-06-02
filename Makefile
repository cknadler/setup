.PHONY: all test lint doctor brew defaults help

SHELL := /bin/bash

BATS    ?= bats
SHELLCHECK ?= shellcheck

SCRIPTS := bootstrap lib.sh tests/fixtures/bin/_shim

all: lint test

help:
	@echo "make test     — run bats test suite (tests/*.bats)"
	@echo "make lint     — run shellcheck over bootstrap, lib.sh, fixtures"
	@echo "make all      — lint then test"
	@echo "make doctor   — ./bootstrap --doctor"
	@echo "make brew     — ./bootstrap --only brewfile"
	@echo "make defaults — ./bootstrap --only osx,bindings"

test:
	$(BATS) tests/

lint:
	$(SHELLCHECK) -s bash $(SCRIPTS)
	# Also parse-check under the fresh-macOS baseline bash (3.2.57). Catches
	# bash 4+ features that shellcheck doesn't flag by default.
	/bin/bash -n bootstrap
	/bin/bash -n lib.sh

doctor:
	./bootstrap --doctor

brew:
	./bootstrap --only brewfile

defaults:
	./bootstrap --only osx,bindings
