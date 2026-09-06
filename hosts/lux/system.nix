{
  ...
}:

{
  modules.system = {
    kernel = {
      #kernel = "cachyos-bore-lto";
      kernel = "latest";
      scx.scheduler = "scx_lavd";
    };

    boot = {
      loader = {
        bootloader = "limine";
        
      };
      plymouth.enable = true;
    };

    nix = {
      build.limit-resources.enable = true;
      editor = true;
      flake = "/home/thor/NixOS/formula";
    };

    tuning.zram.algorithm = "lz4";
    impermanence.enable = true;
  };
}
