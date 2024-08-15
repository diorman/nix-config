{ pkgs, config, lib, osConfig, ... }:

{
  programs = {
    # shell prompt
    starship.enable = true;

    bash.enable = true;

    fish = {
      enable = true;

      # FIXME: This is needed to address bug where the $PATH is re-ordered by
      # the `path_helper` tool, prioritising Apple’s tools over the ones we’ve
      # installed with nix.
      #
      # This gist explains the issue in more detail: https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2
      # There is also an issue open for nix-darwin: https://github.com/LnL7/nix-darwin/issues/122
      loginShellInit = let
        # This naive quoting is good enough in this case. There shouldn't be any
        # double quotes in the input string, and it needs to be double quoted in case
        # it contains a space (which is unlikely!)
        dquote = str: ''"'' + str + ''"'';

        makeBinPathList = map (path: path + "/bin");
      in ''
        fish_add_path --move --prepend --path ${
          lib.concatMapStringsSep " " dquote
          (makeBinPathList osConfig.environment.profiles)
        }
        set fish_user_paths $fish_user_paths
      '';

      interactiveShellInit = ''
        # disable the welcome message
        set fish_greeting

        # required by GPG agent
        set -x GPG_TTY (tty)

        fish_default_key_bindings
      '';

      shellAbbrs = {
        g = "git";
        gs = "git status";
        lg = "lazygit";
      };

    };
  };

  home.packages = with pkgs; [ bashInteractive ];

  home.file."${config.xdg.configHome}/starship.toml".text = ''
    [shell]
    disabled = false
    format="[$indicator]($style)"
    fish_indicator = ""
    bash_indicator = "\\$_ "
    style = "bold cyan"
  '';

  # Disables "Last login" message for new tabs
  home.file.".hushlogin".text = "";
}
