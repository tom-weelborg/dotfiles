let
  chromium = import ../_shared/chromium.nix {
    browserName = "chromium";
    programName = "chromium";
    programPackageName = "chromium";
  };
in
  chromium
