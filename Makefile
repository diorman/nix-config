ROOT = $(shell git rev-parse --show-toplevel)

.PHONY: host\:alpha
host\:alpha:
	@"$(ROOT)/bin/build-darwin.sh" alpha

