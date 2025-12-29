ROOT = $(shell git rev-parse --show-toplevel)

.PHONY: host\:alpha
host\:alpha:
	@sudo "$(ROOT)/bin/build-darwin.sh" alpha

