{
  config,
  extralib,
  ...
}:

{
  imports = extralib.umport {
    path = ./.;
    exclude = [
      ./configuration.nix
      ./home
    ];
  };

  modules = {
    system = {
      settings = {
        users = {
          root.initialPassword = "12345";

          thor = {
            description = "thor";
            initialPassword = "12345";
            shell = config.programs.fish.package;
            hm.config = {
              imports = extralib.umport {
                path = ./home;
              };
            };
          };
        };

        stateVersion = "26.05";
      };
    };
  };
}
