lib:
let
  isModuleDir = path:
    builtins.pathExists (path + "/default.nix");

  discover = basePath:
    let
      entries = builtins.readDir basePath;
      dirs = lib.filterAttrs (_: t: t == "directory") entries;
    in
      lib.concatLists
        (map
          (name:
            let
              path = basePath + "/${name}";
            in
              if isModuleDir path then
                [
                  (import path)
                ]
              else
                discover path
          )
          (builtins.attrNames dirs)
        )
      ;
in
discover
