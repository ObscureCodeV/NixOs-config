{
  programs.ssh.extraConfig = "
    Host github.com
      HostName github.com
      User git
      IdentityFile ~/.ssh/ObscureCode/git/key
      IdentitiesOnly yes
      ";
}
