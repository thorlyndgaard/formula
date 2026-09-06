{
  ...
}:

{
  #hardware.opentabletdriver.enable = true;

  #programs.localsend.enable = true;
  # services.input-remapper.enable = true;

  #services.printing = {
  #  enable = true;
  #  webInterface = false;
  #};
  virtualisation.docker = {
    enable = true;
  };

  modules = {
    programs = {
      apps = {
        gpu-screen-recorder = {
          enable = true;
          ui.enable = true;
        };
        qbittorrent.enable = true;
      };

      gaming = {
        enable = true;
        game-optimize.settings = {
          CpuThreads = 16;
          VulkanDevice = "10de:2504";
          DXVKDeviceName = "NVIDIA GeForce";
        };

        gamescope.session = {
          enable = true;
          monitor = 0;
          settings = {
            VulkanAdapter = "10de:2504";
            SteamDeckHud = false;
            MangoApp = true;
          };
        };
      };
    };
  };
}
