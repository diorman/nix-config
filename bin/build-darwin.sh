#!/bin/bash

if [ -z "$1" ]; then
  echo "Host not specified"
  exit 1
fi

root="$(git rev-parse --show-toplevel)"

if test -x '/run/current-system/sw/bin/darwin-rebuild'; then
  /run/current-system/sw/bin/darwin-rebuild \
    switch \
    --flake "$root/darwin#$1"
    # where $secrets has the path to a TOML tmp file created with mktemp (needs to be random)
    # --override-input secrets "file+file:///$secrets"
else
  nix \
    --extra-experimental-features flakes \
    --extra-experimental-features nix-command \
    run nix-darwin \
    -- switch \
    --flake "$root/darwin#$1"
    # --override-input secrets "file+file:///$secrets"
fi
