{
  modules.desktop = {
    hyprland.extraLuaFiles."nix.noctalia.keybinds" = ''
      hl.bind("SUPER + Space", hl.dsp.exec_cmd(noctaliaIPC .. "panel-toggle launcher"))
      --hl.bind("SUPER + CTRL + minus", hl.dsp.exec_cmd(noctaliaIPC .. "bar-toggle"))
      hl.bind("SUPER + CTRL + Q", hl.dsp.exec_cmd(noctaliaIPC .. "panel-toggle session"))
      hl.bind("SUPER + L", hl.dsp.exec_cmd(noctaliaIPC .. "session lock"))
      hl.bind("SUPER + CTRL + X", hl.dsp.exec_cmd(noctaliaIPC .. "panel-toggle wallpaper"))
      hl.bind("SUPER + X", hl.dsp.exec_cmd(noctaliaIPC .. "wallpaper-random"))
    '';
    noctalia.settings = {
      shell.avatar_path = "~/.face";
      wallpaper.directory = "~/Imagens/Wallpapers";
    };
  };
}
