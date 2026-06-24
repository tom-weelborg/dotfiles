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
            user.modules
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
  imports = generatedUserModules;

  users.users = userAccounts;
}
