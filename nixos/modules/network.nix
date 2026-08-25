{
  networking = {
    hostName = "nixos";
	nameservers = [ "1.1.1.1" "8.8.8.8" ];
	firewall.enable = true;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };
}
	
