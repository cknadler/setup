.PHONY: all test lint doctor help

SHELL := /bin/bash

BATS    ?= bats
SHELLCHECK ?= shellcheck

SCRIPTS := bootstrap lib.sh tests/fixtures/bin/_shim

all: lint test

help:
	@echo "make test     — run bats test suite (tests/*.bats)"
	@echo "make lint     — run shellcheck over bootstrap, lib.sh, fixtures"
	@echo "make doctor   — run ./bootstrap --doctor"
	@echo "make all      — lint then test"

test:
	$(BATS) tests/

lint:
	$(SHELLCHECK) -s bash $(SCRIPTS)

doctor:
	./bootstrap --doctor
