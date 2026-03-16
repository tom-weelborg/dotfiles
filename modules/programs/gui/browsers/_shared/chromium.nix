{ program, ... }:
let
  chromium = import ./base.nix {
    extraExtensionsTypeFunction = { lib }: lib.types.str;
    inherit program;
    programConfig = { moduleConfig, pkgs, variables, ... }:
      {
        enable = true;
        extensions = [
          { id = "oboonakemofpalcgghocfoadofidjkkk"; } # KeePassXC-Browser
          { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
          { id = "khncfooichmfjbepaaaebmommgaepoid"; } # Unhook - Remove YouTube Recommended & Shorts
        ] ++ map (extension: { id = extension; }) moduleConfig.extraExtensions;
      };
  };
in
  chromium