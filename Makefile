ROOT = $(shell git rev-parse --show-toplevel)

.PHONY: host\:alpha
host\:alpha:
	@sudo "$(ROOT)/bin/build-darwin.sh" alpha
  # Apply changes without the logout/login cycle
	@/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
