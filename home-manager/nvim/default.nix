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
    extraConfig = "lua require('config')";
  };

  home.packages = with pkgs; [
    # Go
    # gopls

    # Nix
    # nil
    # nixfmt-rfc-style

    # Lua
    # sumneko-lua-language-server
    # stylua

    # TypeScript/JavaScript
    # typescript-language-server
    # vscode-langservers-extracted
    # prettierd
    # TODO: Delete after testing eslint LSP
    # eslint_d
  ];

  home.sessionVariables = {
    PRETTIERD_LOCAL_PRETTIER_ONLY = 1;
    # TODO: Delete after testing eslint LSP
    # ESLINT_D_LOCAL_ESLINT_ONLY = 1;
  };

  home.file."${config.xdg.configHome}/nvim/lua".source = config.lib.file.mkOutOfStoreSymlink "${thisPath}/lua";
}
