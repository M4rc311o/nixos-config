let
  disks = {
    main = "/dev/disk/by-id/nvme-Apacer_AS2280P4U_256GB_2025022709000218";
    fast1 = "/dev/disk/by-id/ata-Apacer_AS350_1TB_0EF4075411F900168116";
    fast2 = "/dev/disk/by-id/ata-Apacer_AS350_1TB_51990754112400116698";
    slow1 = "/dev/disk/by-id/ata-ST2000DM008-2UB102_WFL6CPVG";
    slow2 = "/dev/disk/by-id/ata-ST2000DM008-2UB102_WK30JDLP";
  };
in {
  disko.devices = {
    disk = {
      main = {
        device = disks.main;
        type = "disk";
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
                mountOptions = ["umask=0077"];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
      fast1 = {
        type = "disk";
        device = disks.fast1;
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "fastpool";
              };
            };
          };
        };
      };
      fast2 = {
        type = "disk";
        device = disks.fast2;
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "fastpool";
              };
            };
          };
        };
      };
      slow1 = {
        type = "disk";
        device = disks.slow1;
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "slowpool";
              };
            };
          };
        };
      };
      slow2 = {
        type = "disk";
        device = disks.slow2;
        content = {
          type = "gpt";
          partitions = {
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "slowpool";
              };
            };
          };
        };
      };
    };
    zpool = {
      fastpool = {
        type = "zpool";
        mode = "mirror";
        rootFsOptions = {
          compression = "lz4";
          relatime = "on";
          # canmount = "off";
          mountpoint = "/pools/fast";
        };
      };
      slowpool = {
        type = "zpool";
        mode = "mirror";
        rootFsOptions = {
          compression = "zstd";
          relatime = "on";
          # canmount = "off";
          mountpoint = "/pools/slow";
        };
      };
    };
  };
}
