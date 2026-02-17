{ pkgs, variables, ... }:
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

  home-manager.users.${variables.username} = { config, ... }: {
    xdg.configFile."VSCodium/User/settings.json" = {
      source = config.lib.file.mkOutOfStoreSymlink (./settings.json);
      force = true;
    };
  };
}
