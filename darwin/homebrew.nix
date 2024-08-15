{ nix-homebrew, homebrew-core, homebrew-cask, homebrew-bundle, xcfg, ... }:

{
  imports = [ nix-homebrew.darwinModules.nix-homebrew ];

  environment.variables = { HOMEBREW_NO_ANALYTICS = "1"; };

  nix-homebrew = {
    enable = true;
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "homebrew/homebrew-bundle" = homebrew-bundle;
    };
    user = xcfg.user;
    mutableTaps = false;
  };

  homebrew = {
    enable = true;
    casks = [
      "1password"
      "docker"
      "firefox"
      "flux"
      "font-fira-code-nerd-font"
      "karabiner-elements"
      "kitty"
      "spotify"
      "wireshark"
    ];

    masApps = { Slack = 803453959; };
  };
}
