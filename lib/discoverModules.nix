lib:
let
  isModuleDir = path:
    builtins.pathExists (path + "/default.nix");

  discover = basePath:
    let
      entries = builtins.readDir basePath;
      dirs = lib.filterAttrs (_: t: t == "directory") entries;
    in
      lib.concatMapAttrs
        (name: _:
          let
            path = basePath + "/${name}";
          in
            if isModuleDir path then
              {
                "${name}" = path;
              }
            else
              discover path
        )
        dirs;
in
discover