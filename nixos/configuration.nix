
{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/bundle.nix
      ./env.nix
      ./packages.nix 
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  
  time.timeZone = "Europe/Moscow";
  
  users = {
    users = {
      vanger = {
        isNormalUser = true;
        extraGroups = [ "wheel" "input" "networkmanager" "scanner" "lp" "fuse"];
      };
    };
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  system.stateVersion = "26.05";
}

