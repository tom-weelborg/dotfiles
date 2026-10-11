{ lib, mkModule, pkgs, ... }@args:
let
  enableOptionDescription = "vscodium";

  extensionProfilesOptions = lib.mapAttrs'
    (key: _: {
      name = (lib.removeSuffix ".nix" key);
      value = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    })
    (builtins.readDir ./extensionProfiles);

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
mkModule
  {
    modulePath = [
      "programs"
      "gui"
      "development"
      "vscodium"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
        extensionProfiles = extensionProfilesOptions;
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          environment.systemPackages = [
            (pkgs.vscode-with-extensions.override {
              vscode = pkgs.vscodium;
              vscodeExtensions = getExtensions {
                inherit (cfg) extensionProfiles;
                inherit pkgs;
              };
            })
          ];
        };
    };
    userModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
        extensionProfiles = extensionProfilesOptions;
      };
      mkConfig = { cfg, username }:
        lib.mkIf cfg.enable
        {
          users.users.${username}.packages = lib.mkAfter [
            (pkgs.vscode-with-extensions.override {
              vscode = pkgs.vscodium;
              vscodeExtensions = getExtensions {
                inherit (cfg) extensionProfiles;
                inherit pkgs;
              };
            })
          ];
        };
    };
    homeManagerModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
        extensionProfiles = extensionProfilesOptions;
        userSettings = lib.mkOption {
          type = lib.types.attrs;
          default = {
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
          };
        };
      };
      mkConfig = { cfg, username }: { pkgs, ... }@homeManagerArgs:
        lib.mkIf cfg.enable
        {
          programs.vscodium = {
            enable = true;

            profiles = {
              default = {
                extensions = getExtensions {
                  inherit (cfg) extensionProfiles;
                  inherit pkgs;
                };
                inherit (cfg) userSettings;
              };
            };
          };
        };
    };
  }
  args
