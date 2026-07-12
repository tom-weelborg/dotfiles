{ config, pkgs, ... }@inputs:
{
  sops.secrets.access-tokens = {
    sopsFile = ../../../../secrets.yaml;
  };

  modules = {
    programs = {
      cli = {
        development = {
          git = {
            enable = true;
            name = "Tom Weelborg";
            email = "135610355+tom-weelborg@users.noreply.github.com";
          };
        };
      };
    };
    system = {
      kernel = {
        packages = pkgs.linuxPackages;
      };
      networking = {
        hostId = "a435d329";
      };
      nix = {
        access-tokens-path = config.sops.secrets.access-tokens.path;
      };
      sops = {
        keyFile = "/var/lib/sops-nix/key.txt";
        sshKeyPaths = [
          "/root/.ssh/github"
        ];
        generateKey = true;
      };
      system = {
        stateVersion = "26.05";
      };
    };
  };

  imports = [
    ./hardware-configuration.nix
  ];
}
