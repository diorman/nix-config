{ config, custom, ... }:

let
  thisPath = "${custom.config.codePath}/github.com/diorman/nix-config/home-manager/keyboard";

in
{
  home.file."${config.xdg.configHome}/karabiner/karabiner.json".source = config.lib.file.mkOutOfStoreSymlink "${thisPath}/karabiner.json";
}
