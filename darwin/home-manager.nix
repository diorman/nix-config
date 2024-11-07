{ config, home-manager, xcfg, ... }:

{
  imports = [ home-manager.darwinModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "nix-backup";
    verbose = true;
    extraSpecialArgs = { inherit xcfg; };
    users.${xcfg.user} = import ../home-manager;
  };
}
