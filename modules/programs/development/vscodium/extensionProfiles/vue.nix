{ pkgs, ... }:
with pkgs.vscode-marketplace;
with pkgs.vscode-marketplace-release;
with pkgs.open-vsx;
with pkgs.open-vsx-release;
with pkgs.vscode-extensions;
[
  # octref.vetur # deprecated
  # hollowtree.vue-snippets
  # sdras.vue-vscode-snippets
  vue.volar
]
++
pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  # {
  #   name = "vue-snippets";
  #   publisher = "hollowtree";
  #   version = "1.0.4";
  #   sha256 = "IQBRAwiL0HdX4HooJMB1YIVPT+bl5gvMHg4mE0iZxm8=";
  # }
  {
    name = "vue-vscode-snippets";
    publisher = "sdras";
    version = "3.2.0";
    sha256 = "Gij1YItyIGYQT9TKaN+WXoWrltXJbFVBrzaw4Ai7bBU=";
  }
]