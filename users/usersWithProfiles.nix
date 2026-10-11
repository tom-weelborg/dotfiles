lib:
let
  getSubdirectories = dir:
    builtins.attrNames (
      lib.filterAttrs
        (_: type: type == "directory")
        (builtins.readDir (toString dir))
    );

  users = getSubdirectories ./.;

  isModuleDir = path:
    builtins.pathExists (path + "/default.nix");

  getProfilesForUser = username:
    let
      userPath = ./. + "/${username}";
    in
    builtins.filter
      (profileName: isModuleDir (userPath + "/${profileName}"))
      (getSubdirectories userPath);

  transformUserToUserWithProfiles = username:
    {
      name = username;
      value = getProfilesForUser username;
    };
in
builtins.listToAttrs (
  builtins.map
    (transformUserToUserWithProfiles)
    users
)
