{
  pkgs,
  lib,
  config,
  ...
}:

{
  home.packages = with pkgs; [
    # fnm # Fast and simple Node.js version manager
    go # The Go Programming language
    python3 # A high-level dynamically-typed programming language
    # rbenv # Version manager tool for the Ruby programming language
    # asdf-vm
    rustup # The Rust toolchain installer

    # Go
    # gopls

    # Nix
    nil
    nixfmt-rfc-style

    # Lua
    sumneko-lua-language-server
    stylua

    # Ruby
    ruby-lsp
    rubocop
    ruby

    # TypeScript/JavaScript
    nodejs
    typescript-language-server
    vscode-langservers-extracted
    prettierd
    # TODO: Delete after testing eslint LSP
    # eslint_d

    # readline
    # libyaml
    # zlib
    # libtool
  ];

  # programs.fish.shellInitLast = ''
  #   . "${pkgs.asdf-vm}/share/asdf-vm/asdf.fish"
  # '';

  home.sessionVariables = {
    PATH = "$HOME/.cargo/bin:$PATH";
  };

  # home.activation.configureAsdf = lib.hm.dag.entryAfter ["installPackages"] ''
  #   export PATH="${config.home.path}/bin:$PATH"
  #
  #   . "${pkgs.asdf-vm}/share/asdf-vm/asdf.sh"
  #
  #   asdf plugin-add ruby || true
  #   asdf plugin-add nodejs || true
  # '';

  home.activation.configureRustup = lib.hm.dag.entryAfter [ "installPackages" ] ''
    export PATH="${config.home.path}/bin:$PATH"

    if ! rustup default &> /dev/null; then
      rustup default stable
      rustup update
    fi
  '';

  home.file.".tool-versions".text = ''
    ruby 3.4.1
    nodejs 22.12.0
  '';

  home.file.".asdfrc".text = ''
    legacy_version_file = yes
  '';

}
