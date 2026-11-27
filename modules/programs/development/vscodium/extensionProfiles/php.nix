{ pkgs, ... }:
with pkgs.vscode-marketplace;
with pkgs.vscode-marketplace-release;
with pkgs.open-vsx;
with pkgs.open-vsx-release;
with pkgs.vscode-extensions;
[
  bmewburn.vscode-intelephense-client
  brapifra.phpserver

  devsense.composer-php-vscode
  devsense.intelli-php-vscode
  devsense.phptools-vscode
  devsense.profiler-php-vscode

  phproberto.vscode-php-getters-setters
  xdebug.php-debug
  zobo.php-intellisense
]