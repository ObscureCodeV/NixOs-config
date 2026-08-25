{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    extraConfig = ''

      hl.config({
        input = {
          kb_layout = "us,ru",
          kb_options = "grp:alt_shift_toggle",
          follow_mouse = 1,
        },
      })

      hl.monitor({
        output = "",
        mode = "1920x1080",
        position = "auto",
        scale = 1,
      })

      hl.on("hyprland.start", function ()
        hl.exec_cmd("waybar")
      end)

      local main = "SUPER"
      local terminal = "alacritty"

      hl.bind(main.. " + Return", hl.dsp.exec_cmd(terminal))
      hl.bind(main.. " + Q", hl.dsp.window.kill())
      hl.bind(main.. " + R + Q", hl.dsp.exit())
      hl.bind(main.. " + M", hl.dsp.window.fullscreen())

      local menu = "wofi --show drun"
      local screenshot = "hyprshot -m region"

      hl.bind(main .. " + SPACE", hl.dsp.exec_cmd(menu))
      hl.bind(main .. " + P", hl.dsp.exec_cmd(screenshot))

      hl.bind(main .. " + H", hl.dsp.focus({ direction = "left" }))
      hl.bind(main .. " + L", hl.dsp.focus({ direction = "right" }))
      hl.bind(main .. " + K", hl.dsp.focus({ direction = "up" }))
      hl.bind(main .. " + J", hl.dsp.focus({ direction = "down" }))

      hl.bind(main .. " + SHIFT + H",  hl.dsp.window.swap({ direction = "left" }))
      hl.bind(main .. " + SHIFT + L",  hl.dsp.window.swap({ direction = "right" }))
      hl.bind(main .. " + SHIFT + K",  hl.dsp.window.swap({ direction = "up" }))
      hl.bind(main .. " + SHIFT + J",  hl.dsp.window.swap({ direction = "down" }))

      for i = 1, 10 do
        local key = i % 10 -- 10 maps to key 0
        hl.bind(main .. " + " .. key, hl.dsp.focus({ workspace = i}))
        hl.bind(main .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i }))
      end

      hl.bind(main .. " + CTRL + H",  hl.dsp.window.resize({ x = -60, y = 0, relative = true }))
      hl.bind(main .. " + CTRL + L",  hl.dsp.window.resize({ x = 60,  y = 0, relative = true }))
      hl.bind(main .. " + CTRL + K",  hl.dsp.window.resize({ x = 0, y = -60, relative = true }))
      hl.bind(main .. " + CTRL + J",  hl.dsp.window.resize({ x = 0, y = 60 , relative = true }))

    '';
  };
}
