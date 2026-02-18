# Nix Configuration

My personal Nix configuration for macOS using [nix-darwin](https://github.com/LnL7/nix-darwin) and [home-manager](https://github.com/nix-community/home-manager).

## Summary

This configuration manages:
- Development tools and CLI utilities via Nix
- GUI applications and Mac App Store apps via Homebrew
- Shell environment (Fish + Starship)
- Editor configuration (Neovim)
- Git, GPG, and SSH settings
- Keyboard customization with Karabiner-Elements

## Commands

```bash
# Rebuild the current configuration
make -C nix-darwin rebuild

# Update all flake inputs
make -C nix-darwin update
```