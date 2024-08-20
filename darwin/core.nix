{ self, xcfg, ... }: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [ ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "x86_64-darwin";

  users.users.${xcfg.user} = { home = "/Users/${xcfg.user}"; };

  # Configure shells to loads the nix-darwin environment.
  programs.fish.enable = true;
  programs.bash.enable = true;

  # Configure fish as default shell
  system.activationScripts.postActivation.text = ''
    dscl . -create /Users/${xcfg.user} UserShell /run/current-system/sw/bin/fish
  '';
}
