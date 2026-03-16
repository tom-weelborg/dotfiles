let
  vivaldi = import ../_shared/chromium.nix {
    program = "vivaldi";
  };
in
  vivaldi
