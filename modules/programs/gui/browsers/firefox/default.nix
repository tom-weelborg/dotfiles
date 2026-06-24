let
  firefox = import ../_shared/firefox.nix {
    browserName = "firefox";
    configPath = xdg: "${xdg.configHome}/mozilla/firefox";
    programName = "firefox";
    programPackageName = "firefox";
  };
in
  firefox
