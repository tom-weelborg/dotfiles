let
  brave = import ../_shared/chromium.nix {
    program = "brave";
  };
in
  brave
