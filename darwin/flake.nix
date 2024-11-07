{
  description = "Nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";

    secrets = {
      url = "file+file:///dev/null";
      flake = false;
    };

    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew
    , homebrew-core, homebrew-cask, homebrew-bundle, secrets }: {
      darwinConfigurations.alpha = nix-darwin.lib.darwinSystem {
        specialArgs = inputs // {
          xcfg = {
            host = "alpha";
            user = "diorman";
            gitSigningKey = "E8F90C5215A46B09";
          } // nixpkgs.lib.trivial.importTOML secrets.outPath;
        };
        modules = [ ./core.nix ./ux.nix ./homebrew.nix ./home-manager.nix ];
      };
    };
}

