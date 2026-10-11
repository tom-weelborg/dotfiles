{ config, pkgs, ... }@inputs:
let
  authorizedSshKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPVKaWEUtl0aXRSDalYuPlJroe+KqQM1BCaUXhpxp/1j nas-login"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK8y2v3JYqacZn6nySkaksP1YYIG+4zk3NuwaK2+faJs nas-login"
  ];

  userUid = 0;
  userGid = 0;

  jellyfinUid = 993;
  jellyfinGid = 1000;
in
{
  services.caddy = {
    enable = true;
    virtualHosts = {
      "weelb.org".extraConfig = ''
        rewrite * /weelb.org{uri}
        reverse_proxy https://tom-weelborg.github.io {
          header_up Host tom-weelborg.github.io
        }
      '';
      "media.weelb.org".extraConfig = ''
        reverse_proxy 127.0.0.1:8096
      '';
    };
  };

  services.nfs.server = {
    enable = true;
    exports = ''
      /export/games       192.168.178.0/24(rw,no_subtree_check,all_squash,anonuid=${toString userUid},anongid=${toString userGid})
      /export/jellyfin    192.168.178.0/24(rw,no_subtree_check,all_squash,anonuid=${toString jellyfinUid},anongid=${toString jellyfinGid})
      /export/users/tom   192.168.178.0/24(rw,no_subtree_check,all_squash,anonuid=${toString userUid},anongid=${toString userGid})
    '';
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
  };

  networking.firewall.allowedTCPPorts = [
    80
    443

    111
    2049
    4000
    4001
    4002

    25565
    25566
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
            Name = "enp5s0";
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
              Name = "enp5s0";
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
        systemModule = {
          enable = true;
          openFirewall = true;
        };
      };
    };
    programs = {
      cli = {
        development = {
          docker = {
            systemModule = {
              enable = true;
            };
          };
          git = {
            systemModule = {
              enable = true;
              name = "Tom Weelborg";
              email = "135610355+tom-weelborg@users.noreply.github.com";
            };
          };
        };
        fastfetch = {
          systemModule = {
            enable = true;
          };
        };
        openssh = {
          server = {
            systemModule = {
              enable = true;
              openFirewall = true;
              settings = {
                PermitRootLogin = "prohibit-password";
              };
            };
          };
        };
        ssh = {
          systemModule = {
            startAgent = true;
          };
        };
      };
    };
    system = {
      kernel = {
        systemModule = {
          packages = pkgs.linuxPackages;
        };
      };
      networking = {
        systemModule = {
          hostId = "a435d329";
        };
      };
      nix = {
        systemModule = {
          access-tokens-path = config.sops.secrets.access-tokens.path;
        };
      };
      sops-config = {
        systemModule = {
          keyFile = "/var/lib/sops-nix/key.txt";
          sshKeyPaths = [
            "/root/.ssh/github"
          ];
          generateKey = true;
        };
      };
      system = {
        systemModule = {
          stateVersion = "26.05";
        };
      };
    };
  };

  imports = [
    ./hardware-configuration.nix
  ];
}
