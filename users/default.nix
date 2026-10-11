{ config, lib, pkgs, users, usersWithProfiles, ... }@args:
{
  options.userConfig = builtins.listToAttrs (
    builtins.map
      (username: {
        name = username;
        value = lib.mkOption {
          type = lib.types.nullOr (lib.types.enum usersWithProfiles.${username});
          default = null;
        };
      })
      users
  );

  config = lib.mkMerge (
    builtins.concatLists (
      builtins.attrValues (
        builtins.mapAttrs
          (username: profiles:
            map
              (profileName:
                lib.mkIf (config.userConfig.${username} == profileName) (
                  let
                    profileConfig = import (./. + "/${username}/${profileName}");
                  in
                  {
                    users.users.${username} = {
                      isNormalUser = profileConfig.options.isNormalUser;
                      description = profileConfig.options.displayname;
                      extraGroups = profileConfig.options.extraGroups;
                    };
                  }
                  //
                  profileConfig.configFunction username args
                )
              )
              profiles
          )
          usersWithProfiles
      )
    )
  );
}
