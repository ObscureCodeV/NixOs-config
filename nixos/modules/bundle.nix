{config, pkgs, ...}:
{
  imports = [
    ./sudo.nix
	./amdgpu.nix
	./sound.nix
	./firejail.nix
	./network.nix
    ./kernel.nix
    ./ssh.nix
    ./printers.nix
    ./gnupg.nix
    ./amnezia-vpn.nix
    ./xdg.nix
    ./syncthing.nix
    ./keyd.nix
  ];
}
