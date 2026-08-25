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
              pool = "zdata";
            };
          };
        };
      };
    };
in
{
  disko.devices = {
    disk = {
      ssd = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-CT1000P310SSD8_2539533D77DB";
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

      hdd1 = createZfsPartition "/dev/disk/by-id/ata-ST8000VN002-2ZM188_WPV3BTQE";

      hdd2 = createZfsPartition "/dev/disk/by-id/ata-ST8000VN002-2ZM188_WPV3BTAP";

      hdd3 = createZfsPartition "/dev/disk/by-id/ata-ST8000VN002-2ZM188_WPV3BT76";

      hdd4 = createZfsPartition "/dev/disk/by-id/ata-ST8000VN002-2ZM188_WPV3P60W";
    };

    zpool = {
      zroot = {
        type = "zpool";

        rootFsOptions = {
          mountpoint = "none";
          compression = "zstd";
          acltype = "posixacl";
          xattr = "sa";
          "com.sun:auto-snapshot" = "true";

          encryption = "aes-256-gcm";
          keyformat = "passphrase";
          keylocation = "prompt";
        };

        options = {
          ashift = "12";
        };

        datasets = {
          root = {
            type = "zfs_fs";
            mountpoint = "/";
          };

          nix = {
            type = "zfs_fs";
            mountpoint = "/nix";
            options = {
              mountpoint = "/nix";
            };
          };

          swap = {
            type = "zfs_volume";
            size = "16G";
            content = {
              type = "swap";
            };
            options = {
              volblocksize = "4096";
              compression = "zle";
              logbias = "throughput";
              sync = "always";
              primarycache = "metadata";
              secondarycache = "none";
              "com.sun:auto-snapshot" = "false";
            };
          };
        };
      };

      zdata = {
        type = "zpool";
        mode = "raidz1";

        rootFsOptions = {
          mountpoint = "none";
          compression = "zstd";
          acltype = "posixacl";
          xattr = "sa";
          "com.sun:auto-snapshot" = "true";

          encryption = "aes-256-gcm";
          keyformat = "passphrase";
          keylocation = "file:///etc/zfs/data.key";
        };

        options = {
          ashift = "12";
        };

        datasets = {
          data = {
            type = "zfs_fs";
            mountpoint = "/data";
          };
        };
      };
    };
  };
}
