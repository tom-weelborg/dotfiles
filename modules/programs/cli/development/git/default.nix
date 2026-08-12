{
  systemModule = { config, lib, pkgs, ... }:
    let
      cfg = config.modules.programs.cli.development.git;
    in
    {
      options.modules.programs.cli.development.git = {
        enable = lib.mkEnableOption "git";
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

      config = lib.mkIf cfg.enable {
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
    programs.cli.development.git =
      { }:
      { username }:
      { lib, pkgs, ... }:
      {
        users.users.${username}.packages = lib.mkAfter [
          pkgs.git
        ];
      };
  };

  homeManagerModule = {
    programs.cli.development.git =
      { name, email, extraSettings ? {}, secretOptions ? {} }:
      { username }:
      { lib, ... }:
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
      {
        programs.git = {
          enable = true;
          settings = (
            (lib.recursiveUpdate
              {
                init.defaultBranch = "main";
                user = lib.mkMerge [
                  (lib.mkIf (name != null) { inherit name; })
                  (lib.mkIf (email != null) { inherit email; })
                ];
              }
              extraSettings
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

            echo "${printSections secretOptions}" > $target
          '';
      };
  };
}
