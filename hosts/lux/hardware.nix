{
  config,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  modules = {

    hardware = {
      core.enable = true;
      # archOptimizations.variant = "x86_64-v3";
      displays = {
        enable = true;
        monitors = [
          {
            adapter = "HDMI-A-1";
            resolution = {
              width = 1920;
              height = 1080;
            };
            refreshRate = 75;
            variableRefreshRate = false;
            scale = 1;
            position = {
              x = 0;
              y = 0;
            };
            colorManagement = {
              enable = false;
              hdr = false;
              bitDepth10 = false;
            };
          }
        ];
      };

      bluetooth.enable = false;
      cpu.amd.enable = true;

      gpu = {
        graphics = {
          enable = true;
        };
        vaapi.enable = true;
        nvtop.enable = true;
        nvidia = {
          enable = true;
          initrd = true;
          cudaSupport = true;
          # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/os-specific/linux/nvidia-x11/default.nix
          # Temporary fix, beta package is not compatible with kernel 7.1, so we use latest (610.43)
          #package = config.boot.kernelPackages.nvidiaPackages.latest;
          #package = config.boot.kernelPackages.nvidiaPackages.beta;
          # use this to use a specific driver version if the current one has issues (very common with nvidia)
          package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
            version = "610.43.03";
            sha256_64bit = "sha256-ReLUwTSiPDXlDyU6SqY+fl6NF+PRhdSgfIpY6WEu05I=";
            sha256_aarch64 = "sha256-jSdlXo60ilXLKWKvZfgbBnVqVYuw6zhnGuiDgwxYz94=";
            openSha256 = "sha256-QCXmqo2xNyIwjGv0da2MUC8ex641Mmc5DUI+uRFVwgE=";
            settingsSha256 = "sha256-z/t+SdEQdVJPwjKIRHO02d264Kt47eWiOwwsaxmh4xQ=";
            persistencedSha256 = "sha256-sOKUsAFHh0/COH+nNgbH9+7hWgivOzq4YmTuk9MOFfI=";
          };
        };
      };

      disk = {
        enable = true;
        device = "/dev/disk/by-id/ata-KINGSTON_SA400S37960G_50026B77853CCEF7";
        swap.file.size = "16G";
        mainPartition.size = "740G";
        ephemeral.enable = true;
      };
    };
  };
}
