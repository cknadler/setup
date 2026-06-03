.PHONY: all test lint doctor brew defaults help

SHELL := /bin/bash

BATS    ?= bats
SHELLCHECK ?= shellcheck

SCRIPTS   := bootstrap lib.sh .osx tests/fixtures/bin/_shim
BREWFILES := Brewfile Brewfile.home Brewfile.media Brewfile.music

all: lint test

help:
	@echo "make test     — run bats test suite (tests/*.bats)"
	@echo "make lint     — shellcheck bootstrap/lib.sh/.osx/fixtures + Brewfile syntax"
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
	/bin/bash -n .osx
	# Brewfiles are Ruby — syntax-check them (catches malformed cask/brew/mas lines).
	@for bf in $(BREWFILES); do echo "ruby -c $$bf"; ruby -c "$$bf" >/dev/null; done

doctor:
	./bootstrap --doctor

brew:
	./bootstrap --only brewfile

defaults:
	./bootstrap --only osx,bindings
