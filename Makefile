# vet {{{
vet\:check: # Check rust syntax [alias: check]
	@cargo check --all -v
.PHONY: vet\:check

check: vet\:check
.PHONY: check

vet\:format: # Check format without changes [alias: vet:fmt, format, fmt]
	@cargo fmt --all -- --check
.PHONY: vet\:format

vet\:fmt: vet\:format
.PHONY: vet\:fmt

format: vet\:format
.PHONY: format

fmt: vet\:format
.PHONY: fmt

vet\:lint: # Check coding style using clippy [alias: lint]
	@cargo clippy --all-targets
.PHONY: vet\:lint

lint: vet\:lint
.PHONY: lint

vet\:all: vet\:check vet\:format vet\:lint # Check code using all vet:xxx targets [alias: vet]
.PHONY: vet\:all

vet: vet\:all
.PHONY: vet
# }}}

# build {{{
build:
	cargo build
.PHONY: build
# }}}

# utils {{{
run\:%:
	@cargo run --quiet --bin $(subst run:,,$@)
.PHONY: run\:%

clean: # Clean up
	@cargo clean
.PHONY: clean

help: # Display this message
	@grep --extended-regexp '^[0-9a-z\:\\\%]+: ' $(firstword $(MAKEFILE_LIST)) | \
		grep --extended-regexp ' # ' | \
		sed --expression='s/\([a-z0-9\-\:\ ]*\): \([a-z0-9\-\:\ ]*\) #/\1: #/g' | \
		tr --delete \\\\ | \
		awk 'BEGIN {FS = ": # "}; \
			{printf "\033[38;05;222m%-11s\033[0m %s\n", $$1, $$2}' | \
		sort
.PHONY: help
# }}}

.DEFAULT_GOAL = build
default: build
