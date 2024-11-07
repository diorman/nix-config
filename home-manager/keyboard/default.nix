{ config, ... }:

{
  home.file."${config.xdg.configHome}/karabiner/karabiner.json".source = config.lib.file.mkOutOfStoreSymlink ./karabiner.json;
}
