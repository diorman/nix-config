{
  pkgs,
  config,
  custom,
  ...
}:

let
  thisPath = "${custom.config.codePath}/github.com/diorman/nix-config/home-manager/nvim";

in
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraConfig = "lua require('custom')";
    plugins = with pkgs.vimPlugins; [ packer-nvim ];
  };

  home.packages = with pkgs; [
    # Go
    gopls

    # Nix
    nil
    nixfmt-rfc-style

    # Lua
    sumneko-lua-language-server
    stylua

    # TypeScript/JavaScript
    typescript-language-server
    eslint_d
    prettierd
  ];

  home.sessionVariables = {
    PRETTIERD_LOCAL_PRETTIER_ONLY = 1;
    ESLINT_D_LOCAL_ESLINT_ONLY = 1;
  };

  home.file."${config.xdg.configHome}/nvim/lua".source = config.lib.file.mkOutOfStoreSymlink "${thisPath}/lua";
}
