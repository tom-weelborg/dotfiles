let
  vivaldi = import ../_shared/chromium.nix {
    browserName = "vivaldi";
    programName = "vivaldi";
    programPackageName = "vivaldi";
  };
in
  vivaldi
