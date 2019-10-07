# verify -- {{{
verify\:check:  ## Check rust syntax [alias: check]
	@cargo check --all -v
.PHONY: verify\:check

check: | verify\:check
.PHONY: check

verify\:format:  ## Check format without changes [alias: verify:fmt, format, fmt]
	@cargo fmt --all -- --check
.PHONY: verify\:format

verify\:fmt: | verify\:format
.PHONY: verify\:fmt

format: | verify\:format
.PHONY: format

fmt: | verify\:format
.PHONY: fmt

verify\:lint:  ## Check coding style using clippy [alias: lint]
	@cargo clippy --all-targets
.PHONY: verify\:lint

lint: | verify\:lint
.PHONY: lint

verify\:all: | verify\:check verify\:format verify\:lint  ## Check code using all verify:xxx targets [alias: verify]
.PHONY: verify\:all

verify: | verify\:all
.PHONY: verify
# }}}

# build -- {{{
build:
	cargo build
.PHONY: build
# }}}

# other utilities -- {{{
clean:  ## Clean up
	@cargo clean
.PHONY: clean

run\:%:
	@cargo run --quiet --bin $(subst run:,,$@)
.PHONY: run\:%

help:  ## Display this message
	@grep -E '^[0-9a-z\:\\]+: ' $(MAKEFILE_LIST) | grep -E '  ## ' | \
		sed -e 's/\(\s|\(\s[0-9a-z\:\\]*\)*\)  /  /' | tr -d \\\\ | \
		awk 'BEGIN {FS = ":  ## "};" \
		  "{printf "\033[38;05;222m%-21s\033[0m %s\n", $$1, $$2}' | \
		sort
.PHONY: help
# }}}
#
.DEFAULT_GOAL = build
default: build
