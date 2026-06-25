{ inputs, lib, variables }:
let
  isHostDir = path:
    builtins.pathExists (path + "/default.nix");

  discoverModules = import ./discoverModules.nix lib;
  discoveredModules = discoverModules ../modules;
  systemModules = map
    (v: v.systemModule)
    (builtins.filter
      (v: builtins.hasAttr "systemModule" v)
      (lib.attrValues discoveredModules) 
    );
  userModules = builtins.mapAttrs
    (_: v: v.userModule)
    (lib.filterAttrs
      (_: v: builtins.hasAttr "userModule" v)
      discoveredModules 
    );

  readDirIfExists = import ./readDirIfExists.nix;

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
              let
                host = import path;
              in
              {
                ${hostName} =
                  lib.nixosSystem {
                    system = host.system;
                    modules = [
                      ../configuration.nix
                      (import ../overlays inputs)
                      ../specialisations
                      inputs.home-manager.nixosModules.default
                      inputs.disko.nixosModules.disko
                      host.config
                    ] ++ systemModules;
                    specialArgs = {
                      inherit
                        readDirIfExists
                        userModules
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
