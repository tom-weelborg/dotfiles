{
  userModule = { secrets ? {} }:
    { username }:
    { ... }:
    {
      sops = {
        age.keyFile = "/home/${username}/.config/sops/age/keys.txt";

        secrets = builtins.mapAttrs
          (_: value:
            {
              owner = username;
            }
            //
            value
          )
          secrets
          ;
      };
    };
}
