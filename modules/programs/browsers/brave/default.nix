let
  brave = import ../_shared/chromium.nix {
    browserName = "brave";
    programName = "brave";
    programPackageName = "brave";
  };
in
  brave
