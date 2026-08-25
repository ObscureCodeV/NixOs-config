{config,pkgs,...}:
{
  hardware.system76.enableAll = true; 
  boot.kernelPackages = pkgs.linuxPackages_6_12;
  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtl8821au
  ];
}
