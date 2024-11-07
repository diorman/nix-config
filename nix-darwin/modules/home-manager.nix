{ home-manager, custom, ... }:

{
  imports = [ home-manager.darwinModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "nix-backup";
    verbose = true;
    extraSpecialArgs = {
      inherit custom;
    };
    users.${custom.config.user} = import ../../home-manager;
  };
}
