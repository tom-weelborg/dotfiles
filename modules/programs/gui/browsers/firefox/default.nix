let
  firefox = import ../_shared/firefox.nix {
    configPath = xdg: "${xdg.configHome}/mozilla/firefox";
    program = "firefox";
  };
in
  firefox
