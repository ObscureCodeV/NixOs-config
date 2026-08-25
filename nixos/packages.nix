{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    tree
    git
    curl
	nftables
    bat
    unzip
    unrar
	zip
    wayland
    xwayland
    wlroots
    wl-clipboard
    hyprland
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-wlr
    alacritty
    dmenu
    hyprpaper
		
    pipewire
    pavucontrol

    feh
    ranger
	btop
    home-manager
    nodejs
    bash

    direnv
    niv
    lorri
    cachix
    devenv

    chromium
    librewolf
    wpsoffice
    iwd
    iw
    tor
    tor-browser
    tcpdump
    traceroute
    whois
    util-linux
    libuuid
    amnezia-vpn

    btrfs-snap
    exfat
    exfatprogs
    rsync
    rclone
    windsend
    mtpfs

    linux-firmware

	freshfetch
	obs-studio

    p7zip
    unrar
    openvpn

  	gcc
  	zig
    gdb
    clang
    lldb
    clang-tools
    cmake
    gnumake
    
    wine
    lutris
    wineWow64Packages.waylandFull
    winePackages.fonts
    winetricks
    gamescope
    dxvk
    vkd3d-proton
    steam

	firejail
		
    vulkan-tools

    ayugram-desktop
          
    gtklp
    kdePackages.print-manager
    system-config-printer
    xsane
    usbutils
    samsung-unified-linux-driver
    foo2zjs

    fontconfig

    goofcord
    zoom-us

    hyprshot
    vlc
    libcdio-paranoia
	haskell.compiler.native-bignum.ghc98
	haskell-language-server
	wofi
	cloc
	rmtrash
	trash-cli
	trashy
    killport
    killall
	cpufetch
	cpufrequtils
	lm_sensors
	hddtemp
	smartmontools
	hd-idle
	stress
    hwinfo
    pass
    pwgen
    gnupg
    
    mcomix

	imagemagick

	parsec-bin
	ffmpeg

	age
	nb
	openssl
	w3m
	qbittorrent
];

	fonts.packages = with pkgs; [
	  vista-fonts
      corefonts
      font-awesome
      jetbrains-mono
      nerd-fonts.jetbrains-mono
      iosevka
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      winePackages.fonts    # Замена от Wine
      liberation_ttf      # Свободная альтернатива MS шрифтам
      dejavu_fonts
      ttf_bitstream_vera 
    ];
    programs.nix-ld.enable = true;
}
