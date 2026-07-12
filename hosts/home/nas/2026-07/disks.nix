let
  createZfsPartition = device:
    {
      type = "disk";
      inherit device;
      content = {
        type = "gpt";
        partitions = {
          zfs = {
            size = "100%";
            content = {
              type = "zfs";
              pool = "zroot";
            };
          };
        };
      };
    };
in
{
  boot.zfs.forceImportRoot = false;

  disko.devices = {
    disk = {
      ssd = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "umask=0077"
                ];
              };
            };

            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "encrypted-root";
                askPassword = true;
                settings = {
                  allowDiscards = true;
                };
                content = {
                  type = "btrfs";
                  extraArgs = [
                    "-f"
                  ];
                  subvolumes = {
                    "/root" = {
                      mountpoint = "/";
                      swap.swapfile.size = "16G";
                    };
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [
                        "noatime"
                      ];
                    };
                  };
                };
              };
            };
          };
        };
      };

      hdd1 = createZfsPartition "/dev/sda";

      hdd2 = createZfsPartition "/dev/sdb";

      hdd3 = createZfsPartition "/dev/sdc";
    };

    zpool = {
      zroot = {
        type = "zpool";
        mode = "raidz1";

        rootFsOptions = {
          mountpoint = "none";
          compression = "zstd";
          encryption = "aes-256-gcm";
          keyformat = "passphrase";
          keylocation = "file:///etc/zfs/zroot.key";
          "com.sun:auto-snapshot" = "true";
        };

        datasets = {
          data = {
            type = "zfs_fs";
            mountpoint = "/zroot";
          };
        };
      };
    };
  };
}
