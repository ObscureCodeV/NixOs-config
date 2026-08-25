{pkgs, ...}:
{
  services.printing = {
    enable = true;
    drivers = [ pkgs.samsung-unified-linux-driver pkgs.foo2zjs ];
  };

  hardware.sane.enable = true;

  hardware.printers = {
    ensurePrinters = [
      {
        name = "CLX-3185";
        location = "Home";
        deviceUri = "usb://Samsung/CLX-3180%20Series?serial=Z4X0BAIB200408T&interface=1";
        model = "Samsung-CLX-3185.ppd.gz";
        ppdOptions = {
          PageSize = "A4";
        };
      }
    ];
  };
}
