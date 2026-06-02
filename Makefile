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

doctor:
	./bootstrap --doctor

brew:
	./bootstrap --only brewfile

defaults:
	./bootstrap --only osx,bindings
