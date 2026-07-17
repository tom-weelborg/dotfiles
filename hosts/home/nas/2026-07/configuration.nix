{ config, pkgs, ... }@inputs:
let
  authorizedSshKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPVKaWEUtl0aXRSDalYuPlJroe+KqQM1BCaUXhpxp/1j nas-login"
  ];
in
{
  sops.secrets.access-tokens = {
    sopsFile = ../../../../secrets.yaml;
  };

  users.users.root.openssh.authorizedKeys.keys = authorizedSshKeys;

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
        openssh = {
          server = {
            enable = true;
            openFirewall = true;
            settings = {
              PermitRootLogin = "prohibit-password";
            };
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
