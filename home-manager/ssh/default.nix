{
  home.file.".ssh/config".text = ''
    Host github.com
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_ed25519
  '';
}
