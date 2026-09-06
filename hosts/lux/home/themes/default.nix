{
  config,
  lib,
  ...
}:

{
  modules.xdgPortal = {
    settings = {
      accent_color = "#bd2d7c";
    };
  };

  wayland.windowManager.hyprland.settings.config.decoration.shadow = lib.mkIf config.stylix.enable {
    color = lib.mkOverride 40 "rgba(bd2d7c22)";
    color_inactive = lib.mkOverride 40 "rgba(00000099)";
  };
}
