{
  nix-homebrew,
  homebrew-core,
  homebrew-cask,
  homebrew-bundle,
  custom,
  ...
}:

{
  imports = [ nix-homebrew.darwinModules.nix-homebrew ];

  environment.variables = {
    HOMEBREW_NO_ANALYTICS = "1";
  };

  nix-homebrew = {
    enable = true;
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "homebrew/homebrew-bundle" = homebrew-bundle;
    };
    user = custom.config.user;
    mutableTaps = false;
  };

  homebrew = {
    enable = true;
    casks = [
      "1password"
      "adobe-acrobat-reader"
      "discord"
      "firefox"
      "flux"
      "font-fira-code-nerd-font"
      "karabiner-elements"
      "kitty"
      "spotify"
      "wireshark"
    ];

    masApps = {
      Numbers = 409203825;
      Pages = 409201541;
      Slack = 803453959;
    };
  };
}
