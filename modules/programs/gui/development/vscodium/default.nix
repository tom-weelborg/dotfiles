{
  options = lib:
    {
      extensionProfiles = {
        nix = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
      };
    };

  module = { moduleConfig, pkgs, variables, ... }:
    let
      getExtensions = extensionProfiles:
        let
          extensionProfilesToInclude = builtins.filter
            (k: extensionProfiles.${k})
            (builtins.attrNames extensionProfiles);

          result = builtins.concatLists (
            builtins.map
              (k: import ./extensionProfiles/${k}.nix { inherit pkgs; })
              extensionProfilesToInclude
          );
        in
          result;
    in
    {
      environment.systemPackages = [
        (pkgs.vscode-with-extensions.override {
          vscode = pkgs.vscodium;
          vscodeExtensions = getExtensions moduleConfig.extensionProfiles;
        })
      ];

      home-manager.users.${variables.username} = { config, ... }: {
        xdg.configFile."VSCodium/User/settings.json" = {
          source = config.lib.file.mkOutOfStoreSymlink (./settings.json);
          force = true;
        };
      };
    };
}
