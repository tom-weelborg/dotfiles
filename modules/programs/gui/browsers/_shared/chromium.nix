{ program, ... }:
let
  chromium = import ./base.nix {
    defaultExtensionsFunction = { ... }:
      [
        "oboonakemofpalcgghocfoadofidjkkk" # KeePassXC-Browser
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
        "khncfooichmfjbepaaaebmommgaepoid" # Unhook - Remove YouTube Recommended & Shorts
      ];
    extensionsTypeFunction = { lib }: lib.types.str;
    inherit program;
    programConfig = { moduleConfig, pkgs, variables, ... }:
      {
        enable = true;
        extensions = map
          (extension: { id = extension; })
          (moduleConfig.defaultExtensions ++ moduleConfig.extraExtensions);
      };
  };
in
  chromium
