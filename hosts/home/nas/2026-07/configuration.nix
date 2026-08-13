{ config, pkgs, ... }@inputs:
let
  authorizedSshKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPVKaWEUtl0aXRSDalYuPlJroe+KqQM1BCaUXhpxp/1j nas-login"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK8y2v3JYqacZn6nySkaksP1YYIG+4zk3NuwaK2+faJs nas-login"
  ];

  jellyfinGid = 1000;
in
{
  services.nfs.server = {
    enable = true;
    exports = ''
      /export 192.168.178.0/24(rw,fsid=0,no_subtree_check,all_squash,anonuid=993,anongid=${toString jellyfinGid})
    '';
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
  };

  networking.firewall.allowedTCPPorts = [
    111
    2049
    4000
    4001
    4002
  ];

  networking.firewall.allowedUDPPorts = [
    111
    2049
    4000
    4001
    4002
  ];

  users.groups.jellyfin.gid = jellyfinGid;

  systemd = {
    network = {
      enable = true;

      networks = {
        "lan" = {
          matchConfig = {
            Name = "enp4s0";
          };

          address = [
            "192.168.178.94/24"
          ];

          routes = [
            { Gateway = "192.168.178.1"; }
          ];

          dns = [
            "192.168.178.1"
          ];
        };
      };
    };

    services = {
      zfs-mount = {
        enable = false;
      };
    };
  };


  boot.initrd = {
    availableKernelModules = [
      "igc"
    ];

    systemd = {
      enable = true;

      network = {
        enable = true;

        networks = {
          "lan" = {
            matchConfig = {
              Name = "enp4s0";
            };

            address = [
              "192.168.178.94/24"
            ];

            routes = [
              { Gateway = "192.168.178.1"; }
            ];
          };
        };
      };
    };

    network = {
      enable = true;

      ssh = {
        enable = true;

        authorizedKeys = authorizedSshKeys;

        hostKeys = [
          /boot/initrd-ssh-host-key
        ];

        port = 2222;

        extraConfig = ''
          ForceCommand /bin/systemctl default
        '';
      };
    };
  };

  sops.secrets.access-tokens = {
    sopsFile = ../../../../secrets.yaml;
  };

  users.users.root.openssh.authorizedKeys.keys = authorizedSshKeys;

  modules = {
    jellyfin = {
      server = {
        enable = true;
        openFirewall = true;
      };
    };
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
        ssh = {
          startAgent = true;
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
