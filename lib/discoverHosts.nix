{ inputs, lib, system, variables }:
let
  isHostDir = path:
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
            hostName = lib.concatStringsSep "-" newPrefix;
          in
            if isHostDir path then
              {
                ${hostName} =
                  lib.nixosSystem {
                    inherit system;
                    modules = [
                      ../configuration.nix
                      ../modules/shared.nix
                      inputs.home-manager.nixosModules.default
                      inputs.nur.modules.nixos.default
                      (import (path + "/default.nix"))
                    ];
                    specialArgs = {
                      inherit
                        variables
                        ;
                    };
                  };
              }
            else
              discover path newPrefix
        )
        dirs;
in
discover