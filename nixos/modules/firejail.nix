{config,pkgs, ...}:
{
  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      chromium = {
        executable = "${pkgs.chromium}/bin/chromium";
        profile = "${pkgs.firejail}/etc/firejail/chromium.profile";
      };
      tor-browser = {
        executable = "${pkgs.tor-browser}/bin/tor-browser";
        profile = "${pkgs.firejail}/etc/firejail/tor-browser.profile";
      };
      ayugram = {
      	executable = "${pkgs.ayugram-desktop}/bin/ayugram-desktop";
      	profile = "${pkgs.firejail}/etc/firejail/ayugram-desktop.profile";
      };
      librewolf = {
      	executable = "${pkgs.librewolf}/bin/librewolf";
      	profile = "${pkgs.firejail}/etc/firejail/librewolf.profile";
      };
    };
  };
}
