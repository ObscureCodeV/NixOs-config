{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          control = {
            comma = "C-c";
            dot = "C-v";
          };
        };
      };
    };
  };
}
