{
  pkgs,
  lib,
  config,
  ...
}:

{
  home.packages = with pkgs; [
    python3 # A high-level dynamically-typed programming language
    rustup # The Rust toolchain installer

    # Go
    go # The Go programming language
    gopls # Official language server for the Go language

    # Nix
    nil # Yet another language server for Nix
    nixfmt # Official formatter for Nix code

    # Lua
    lua-language-server # Language server that offers Lua language support
    stylua # Opinionated Lua code formatter

    # Ruby
    ruby-lsp # An opinionated language server for Ruby
    rubocop # A Ruby static code analyzer and formatter, based on the community Ruby style guide
    ruby # The ruby programming language

    # TypeScript/JavaScript
    nodejs # Event-driven I/O framework for the V8 JavaScript engine
    typescript-language-server # Language Server Protocol implementation for TypeScript using tsserver
    vscode-langservers-extracted # HTML/CSS/JSON/ESLint language servers extracted from vscode
    prettierd # Prettier, as a daemon, for improved formatting speed
  ];

  home.sessionVariables = {
    PATH = "$HOME/.cargo/bin:$PATH";
  };

  home.activation.configureRustup = lib.hm.dag.entryAfter [ "installPackages" ] ''
    export PATH="${config.home.path}/bin:$PATH"

    if ! rustup default &> /dev/null; then
      rustup default stable
      rustup update
    fi
  '';
}
