{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.vscode-with-extensions.override {
      vscode = pkgs.vscodium;
      vscodeExtensions = with pkgs.vscode-extensions; [
        # Nix
        jnoortheen.nix-ide
      ];
    })
  ];
}
