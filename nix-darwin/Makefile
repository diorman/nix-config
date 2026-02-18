.PHONY: update
update: flake-update rebuild

.PHONY: rebuild
rebuild: switch activate-settings

.PHONY: flake-update
flake-update:
	@nix flake update

.PHONY: switch
switch: switch-alpha

.PHONY: switch-%
switch-%:
	@sudo darwin-rebuild switch --flake ".#$*"

.PHONY: bootstrap
bootstrap: bootstrap-alpha

.PHONY: bootstrap-%
bootstrap-%:
	@nix \
		--extra-experimental-features flakes \
		--extra-experimental-features nix-command \
		run nix-darwin \
		-- switch \
		--flake ".#$*"

.PHONY: activate-settings
	@/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
