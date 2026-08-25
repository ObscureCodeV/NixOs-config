let
  dir = "./bash-scripts";
in
{
  programs.bash = {
    enable = true;
	shellAliases = {
      "cps" = "${dir}/cp-to-send.sh";
      "backup" = "${dir}/backup.sh";
      "bgg" = "${dir}/backup-google.drive.sh";
    };
  };
}
