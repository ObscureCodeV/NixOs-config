{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "ehci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  services.fstrim.enable = true;
  hardware.cpu.intel.updateMicrocode = true;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ba795a0c-6434-4de2-828d-af62562e7005";
    fsType = "btrfs";
    options = ["compress=zstd:1"];
  };

  fileSystems."/mnt/HDD" = {
    device = "/dev/disk/by-label/WD-BLACK-1TB";
    fsType = "ext4";
    options = ["defaults" "noatime" "nodiratime" "data=ordered" "nofail"];
  };

  systemd.services.hd-idle = {
    description = "HDD Idle Timeout Daemon";
    after = [ "local-fs.target" ];
    wantedBy = [ "local-fs.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.hd-idle}/bin/hd-idle -i 600 -a /dev/disk/by-label/WD-BLACK-1TB";
      Restart = "on-failure";  # Только при реальных сбоях
      RestartSec = 30;         # Ждем подольше перед рестартом
    };
  };
  
  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s25.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

}
