{
  presets.app.floorp.policies = {
    ExtensionSettings = {
      # Bitwarden: https://bitwarden.com/
      # Password manager, secure and open source, can be self-hosted with vaultwarden.
      "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
        installation_mode = "normal_installed";
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/{446900e4-71c2-419f-a6a7-df9c091e268b}/latest.xpi";
        default_area = "navbar";
        private_browsing = true;
      };
    };
  };
}
