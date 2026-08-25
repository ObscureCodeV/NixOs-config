
let
  basedir = "/home/vanger/sync";
  private =
    if builtins.pathExists ./private.nix 
    then import ./private.nix 
    else {};
in
{
  services.syncthing = {
    enable = true;
    user = "vanger";
    dataDir = "/home/vanger/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        win11 = {
          id = private.sync.win11_id or "";
        };
      };
      folders."NixOs-conf" = {
        path = "${basedir}/Nixos-config";
        type = "sendreceive";
        devices = [ "win11"];
      };
      folders."doc" = {
        path = "${basedir}/doc";
        type = "sendreceive";
        devices = [ "win11"];
      };
      folders."study" = {
        path = "${basedir}/study";
        type = "sendreceive";
        devices = [ "win11"];
      };
      folders."my-book" = {
        path = "${basedir}/my_book";
        type = "sendreceive";
        devices = [ "win11"];
      };
      options = {
        localAnnounceEnabled = true;
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
