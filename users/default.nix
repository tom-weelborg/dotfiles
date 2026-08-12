users:
{ lib, ... }:
let
  generatedUserModules =
    lib.concatLists (
      lib.mapAttrsToList
        (username: user:
          map
            (module:
              module {
                inherit username;
              }
            )
            user.userModules
        )
        users
    );

  generatedHomeManagerModules =
    lib.concatLists (
      lib.mapAttrsToList
        (username: user:
          map
            (module:
              {
                home-manager.users.${username} = module {
                  inherit username;
                };
              }
            )
            user.homeManagerModules
        )
        users
    );

  userAccounts =
    lib.mapAttrs
      (_: user: {
        isNormalUser = user.isNormalUser;
        description = user.displayname;
        extraGroups = user.extraGroups;
      })
      users;

in
{
  imports = generatedUserModules ++ generatedHomeManagerModules;

  users.users = userAccounts;
}
