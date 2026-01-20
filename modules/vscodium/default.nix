{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.vscode-with-extensions.override {
      vscode = pkgs.vscodium;
      vscodeExtensions =
        with pkgs.vscode-marketplace;
        with pkgs.vscode-marketplace-release;
        with pkgs.open-vsx;
        with pkgs.open-vsx-release;
      [
      ];
    })
  ];
}
