{ inputs, lib }:
let
  isHostDir = path:
    builtins.pathExists (path + "/default.nix");

  discoverModules = import ./discoverModules.nix lib;
  discoveredModules = discoverModules ../modules;

  readDirIfExists = import ./readDirIfExists.nix;

  usersWithProfiles = import ../users/usersWithProfiles.nix lib;

  users = builtins.attrNames usersWithProfiles;

  mkModule = import ./mkModule.nix { inherit lib users; };

  mkStandardModule = import ./mkStandardModule.nix { inherit lib users; };

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
                      (import ../overlays inputs)
                      ../specialisations
                      ../users
                      inputs.home-manager.nixosModules.default
                      inputs.disko.nixosModules.disko
                      inputs.sops-nix.nixosModules.sops
                      host.config
                    ] ++ discoveredModules;
                    specialArgs = {
                      inherit
                        readDirIfExists
                        mkModule
                        mkStandardModule
                        users
                        usersWithProfiles
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
