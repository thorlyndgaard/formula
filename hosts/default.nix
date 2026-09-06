{
  inputs,
  ...
}:

let
  mkNixosSystem = inputs.mansaos.lib.mkNixosSystemDefaults {
    defaultLocation = ./.;
    defaultPresetsSources = {
      oobe = inputs.mansaos-oobe.presets;
    };
  };
in
{
  flake.nixosConfigurations = {
    lux = mkNixosSystem {
      hostName = "lux";
      presets = [
        "oobe/system"
        "mansaos/setup/workstation"
      ];
      specialArgs = {
        inputs = {
          inherit (inputs)
            hypr-dynamic-cursors
            hypr-darkwindow
            stylix
            shadower
            ;
        };
      };
    };
  };
}
