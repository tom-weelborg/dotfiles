let
  firefox = import ../_shared/firefox.nix {
    program = "firefox";
  };
in
  firefox
