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
          );
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

  userModule = {
      extensionProfiles ? {},
      userSettings ? {
        "diffEditor.ignoreTrimWhitespace" = false;

        "editor.rulers" = [
          80
        ];
        "editor.stickyScroll.enabled" = false;

        "explorer.autoReveal" = false;
        "explorer.compactFolders" = false;

        "files.insertFinalNewline" = true;

        "window.openFoldersInNewWindow" = "on";

        "workbench.editor.empty.hint" = "hidden";
        "workbench.editor.enablePreview" = false;
        "workbench.editor.wrapTabs" = true;
        "workbench.tree.enableStickyScroll" = false;

        "[json]" = {
          "editor.defaultFormatter" = "vscode.json-language-features";
        };

        "[jsonc]" = {
          "editor.defaultFormatter" = "vscode.json-language-features";
        };
      }
    }:
    { username }:
    { lib, pkgs, ... }:
    {
      home-manager.users.${username} = { config, ... }: {
        programs.vscodium = {
          enable = true;

          profiles = {
            default = {
              extensions = getExtensions {
                inherit
                  extensionProfiles
                  pkgs
                  ;
              };
              inherit userSettings;
            };
          };
        };
      };
    };
}
