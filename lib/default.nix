lib:
let
  libFiles = lib.mapAttrs'
    (n: _: {
      name = lib.removeSuffix ".nix" n;
      value = import ./${n};
    })
    (
      lib.filterAttrs
        (n: _: n != "default.nix")
        (builtins.readDir ./.)
    );
in
libFiles