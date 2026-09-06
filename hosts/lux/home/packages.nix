{
  extralib,
  pkgs,
  ...
}:

{
  imports = extralib.usePresets (
    map (app: "mansaos/app/${app}") [
      "discord"
      "easyeffects"
      "obs-studio"
    ]
  );

  presets.app = {
    floorp = {
      # userChrome.sidebar = {
      #   hideDelay = "0ms";
      # };
      profiles = {
        home = {
          id = 0;
          search.default = "google";
        };
        chill = {
          id = 1;
        };
      };
    };
    discord-canary = {
      enable = true;
      extraDiscordPackageConfig.vulkan = false;
    };
  };

  programs = {
    obsidian.enable = true;

    git = {
      settings.user = {
        name = "Thor";
        email = "thorlyndgaard@proton.me";
      };
    };

    vscode = {
      profiles.default.userSettings = {
        "files.autoSave" = "afterDelay";
        "workbench.editor.enablePreview" = true;
        "editor.formatOnSave" = true;
      };
    };
  };

  modules = {
    impermanence = {
      packages = with pkgs; [
        kdePackages.kdenlive
        gimp3-with-plugins
        footage
        proton-vpn
        {
          package = spotify;
          data = [
            ".cache/spotify"
            ".config/spotify"
          ];
        }
        #codex
      ];
    };

    apps = {
      lutris.enable = true;
    };

    flatpak = {
      packages = [
        "org.qbittorrent.qBittorrent"
        "org.nickvision.tubeconverter"
        "org.vinegarhq.Sober"
        "com.github.taiko2k.avvie" # Crop and downsize images easily
        "org.gnome.gitlab.YaLTeR.VideoTrimmer" # Cut videos easily
        "page.kramo.Sly" # A friendly image editor that requires no internet connection or preexisting expertise. Just open a photo and have at it.
      ];
    };
  };
}
