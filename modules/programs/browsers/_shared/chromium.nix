{ browserName, programName, programPackageName, ... }:
let
  chromium = import ./base.nix {
    inherit
      browserName
      programName
      programPackageName
      ;
    defaultExtensionsFunction = { ... }:
      [
        "oboonakemofpalcgghocfoadofidjkkk" # KeePassXC-Browser
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
        "khncfooichmfjbepaaaebmommgaepoid" # Unhook - Remove YouTube Recommended & Shorts
      ];
    extensionsTypeFunction = { lib }: lib.types.str;
    programConfig = { moduleConfig, ... }:
      {
        enable = true;
        extensions = map
          (extension: { id = extension; })
          moduleConfig.extensions;
      };
  };
in
  chromium
