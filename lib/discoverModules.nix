lib:
let
  isModuleDir = path:
    builtins.pathExists (path + "/default.nix");

  discover = basePath: prefix:
    let
      entries = builtins.readDir basePath;
      dirs = lib.filterAttrs (_: t: t == "directory") entries;
    in
      lib.concatMapAttrs
        (name: _:
          let
            path = basePath + "/${name}";
            newPrefix = prefix ++ [ name ];
          in
            if isModuleDir path then
              {
                "${name}" = { config, pkgs, ... }@inputs:
                let
                  importedModule = import path;

                  moduleFunction =
                    if (builtins.typeOf importedModule) == "set" then
                      importedModule.module
                    else
                      importedModule
                    ;

                  moduleOptions =
                    if (builtins.typeOf importedModule) == "set" then
                      importedModule.options lib
                    else
                      {}
                    ;

                  options = lib.setAttrByPath newPrefix ({
                    enable = lib.mkEnableOption name;
                  } // moduleOptions);

                  moduleConfig = lib.attrByPath newPrefix {} config;
                in
                {
                  inherit options;

                  config = lib.mkIf moduleConfig.enable (moduleFunction (inputs // {
                    inherit moduleConfig;
                  }));
                };
              }
            else
              discover path newPrefix
        )
        dirs;
in
discover