let
  getExtensions = { extensionProfiles, pkgs }:
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
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.gui.development.vscodium;
    in
    {
      options.modules.programs.gui.development.vscodium = {
        enable = lib.mkEnableOption "vscodium";
        extensionProfiles =
          (
            lib.mapAttrs'
              (key: value: {
                name = (lib.removeSuffix ".nix" key);
                value = lib.mkOption {
                  type = lib.types.bool;
                  default = false;
                };
              })
              (builtins.readDir ./extensionProfiles)
          )
          //
          {
            nix = lib.mkOption {
              type = lib.types.bool;
              default = true;
            };
          };
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = [
          (pkgs.vscode-with-extensions.override {
            vscode = pkgs.vscodium;
            vscodeExtensions = getExtensions {
              inherit pkgs;
              extensionProfiles = cfg.extensionProfiles;
            };
          })
        ];
      };
    };

  userModule = { extensionProfiles ? {} }:
    { username }:
    { lib, pkgs, ... }:
    {
      users.users.${username}.packages = lib.mkAfter [
        (pkgs.vscode-with-extensions.override {
          vscode = pkgs.vscodium;
          vscodeExtensions = getExtensions {
            inherit
              extensionProfiles
              pkgs
              ;
          };
        })
      ];

      home-manager.users.${username} = { config, ... }: {
        xdg.configFile."VSCodium/User/settings.json" = {
          source = config.lib.file.mkOutOfStoreSymlink (./settings.json);
          force = true;
        };
      };
    };
}
