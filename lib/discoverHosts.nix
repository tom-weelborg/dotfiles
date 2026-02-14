{ inputs, lib, system, variables }:
let
  isHostDir = path:
    builtins.pathExists (path + "/default.nix");

  discoverModules = import ./discoverModules.nix lib;

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
                      ../overlays
                      ../specialisations
                      inputs.home-manager.nixosModules.default
                      inputs.nur.modules.nixos.default
                      (import (path + "/default.nix"))
                    ] ++ lib.attrValues (discoverModules ../modules [ "modules" ]);
                    specialArgs = {
                      inherit
                        variables
                        ;
                      overrideFunction = lib.mkDefault;
                    };
                  };
              }
            else
              discover path newPrefix
        )
        dirs;
in
discover