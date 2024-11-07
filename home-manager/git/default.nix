{ pkgs, custom-config, ... }:

let
  gitFixup = pkgs.writeScriptBin "git-fixup" "${builtins.readFile ./git-fixup.sh}";

  gitFuzzySwitch = pkgs.writeScriptBin "git-fuzzy-switch" "${builtins.readFile ./git-fuzzy-switch.sh}";

  gitGet = pkgs.writeScriptBin "git-get" "${builtins.readFile ./git-get.sh}";

in
{
  programs.git = {
    enable = true;
    userName = "Diorman Colmenares";
    userEmail = "229201+diorman@users.noreply.github.com";
    signing = {
      key = custom-config.gitSigningKey;
      signByDefault = true;
    };
    extraConfig = {
      alias = {
        s = "status";
        sw = "switch";
        fsw = "fuzzy-switch";
        co = "commit";
        commend = "commit --amend --no-edit";
        stush = "stash --include-untracked";
        rbi = "!f() { git rebase -i HEAD~$1; }; f";
        fo = "!f() { git fetch origin $1:$1; }; f";
      };
      branch.autosetuprebase = "always";
      color = {
        diff = "auto";
        status = "auto";
        branch = "auto";
        ui = true;
      };
      core = {
        editor = "vim";
        autocrlf = "input";
      };
      credential.helper = "osxkeychain";
      fetch.prune = true;
      format.pretty = "format:%Cred%h%Creset%C(yellow)%d%Creset %s %C(bold blue)<%an>%n%C(magenta)%ad %Cgreen(%cr)%Creset%n";
      init.defaultBranch = "main";
      push = {
        autoSetupRemote = true;
        default = "current";
        followTags = true;
      };
    };

    ignores = [
      ".direnv/"
      ".vim/"
      ".DS_Store"
      ".idea"
      "*.iml"
      ".classpath"
      ".project"
      ".settings"
      ".factorypath"
    ];
  };

  home.packages = [
    gitFixup
    gitFuzzySwitch
    gitGet
  ];
}
