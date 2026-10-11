{ lib, mkModule, pkgs, ... }@args:
let
  enableOptionDescription = "git";
in
mkModule
  {
    modulePath = [
      "programs"
      "cli"
      "development"
      "git"
    ];
    systemModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
        name = lib.mkOption {
          type = lib.types.str;
        };
        email = lib.mkOption {
          type = lib.types.str;
        };
        extraSettings = lib.mkOption {
          type = lib.types.attrs;
          default = {};
        };
      };
      mkConfig = { cfg }:
        lib.mkIf cfg.enable
        {
          programs.git = {
            enable = true;
            config = lib.recursiveUpdate
              {
                init.defaultBranch = "main";
                user = {
                  inherit
                    (cfg)
                    name
                    email
                    ;
                };
              }
              cfg.extraSettings;
          };
        };
    };
    userModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
      };
      mkConfig = { cfg, username }:
        lib.mkIf cfg.enable
        {
          users.users.${username}.packages = lib.mkAfter [
            pkgs.git
          ];
        };
    };
    homeManagerModule = {
      options = {
        enable = lib.mkEnableOption enableOptionDescription;
        name = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = null;
        };
        email = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = null;
        };
        extraSettings = lib.mkOption {
          type = lib.types.attrs;
          default = {};
        };
        secretOptions = lib.mkOption {
          type = lib.types.attrs;
          default = {};
        };
      };
      mkConfig = { cfg, username }: { lib, ... }@homeManagerArgs:
        let
          secretOptionsPath = ".config/git/secretOptions";

          printOptions = options:
            (lib.concatStringsSep
              "\n"
              (lib.mapAttrsToList
                (name: value:
                  "\t${name} = \\\"$(cat ${value})\\\""
                )
                options
              )
            );

          flattenOptions = options:
            builtins.foldl'
              (sectionAcc: section:
                sectionAcc
                //
                (builtins.foldl'
                  (optionAcc: option:
                    if builtins.isAttrs option.value then
                      optionAcc
                      //
                      (builtins.foldl'
                        (subsectionOptionAcc: subsectionOption:
                          subsectionOptionAcc
                          //
                          {
                            "[${section.name} \\\"${option.name}\\\"]" = {
                              ${subsectionOption.name} = subsectionOption.value;
                            };
                          }
                        )
                        {}
                        (lib.attrsToList option.value)
                      )
                    else
                      optionAcc
                      //
                      {
                        "[${section.name}]" = {
                          ${option.name} = option.value;
                        };
                      }
                  )
                  {}
                  (lib.attrsToList section.value)
                )
              )
              {}
              (lib.attrsToList options)
            ;

          printSections = options:
            let
              flattened = flattenOptions options;
            in
            (lib.concatStringsSep
              "\n"
              (lib.mapAttrsToList
                (name: value:
                  ''
                    ${name}
                    ${printOptions value}
                  ''
                )
                flattened
              )
            );
        in
        lib.mkIf cfg.enable
        {
          programs.git = {
            enable = true;
            settings = (
              (lib.recursiveUpdate
                {
                  init.defaultBranch = "main";
                  user = lib.mkMerge [
                    (lib.mkIf (cfg.name != null) { inherit (cfg) name; })
                    (lib.mkIf (cfg.email != null) { inherit (cfg) email; })
                  ];
                }
                cfg.extraSettings
              )
              //
              {
                include = {
                  path = "~/${secretOptionsPath}";
                };
              }
            );
          };

          home.activation.gitSecretOverrides =
            lib.hm.dag.entryAfter [ "writeBoundary" ] ''
              target="$HOME/${secretOptionsPath}"

              mkdir -p "$(dirname "$target")"

              echo "${printSections cfg.secretOptions}" > $target
            '';
        };
    };
  }
  args
