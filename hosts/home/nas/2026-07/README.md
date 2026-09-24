# home-nas-2026-07

## Adding a new HDD

1. Find the new disk after you've installed it using:

  ```sh
  ls -l /dev/disk/by-id/ata-*
  ```

  Look for a disk without a partition.

2. Partition the disk (replacing `<id>` with the id found in step 1):

  ```sh
  fdisk /dev/disk/by-id/<id>
  ```

  Use the following arguments (press enter after each):

  ```
  g

  n

  t
  163

  w
  ```

  Alternatively to `163`, you can use `20`.

  The meanings of the arguments are:

  <table>
    <thead>
      <tr>
        <td>
          Argument
        </td>
        <td>
          Meaning
        </td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          20
        </td>
        <td>
          Linux filesystem
        </td>
      </tr>
      <tr>
        <td>
          163
        </td>
        <td>
          ZFS pool member
        </td>
      </tr>
      <tr>
        <td>
          g
        </td>
        <td>
          create a new empty GPT partition table
        </td>
      </tr>
      <tr>
        <td>
          n
        </td>
        <td>
          add a new partition
        </td>
      </tr>
      <tr>
        <td>
          t
        </td>
        <td>
          change a partition type
        </td>
      </tr>
      <tr>
        <td>
          w
        </td>
        <td>
          write table to disk and exit
        </td>
      </tr>
    </tbody>
  </table>

3. Add the new partition to ZPool `zdata` (replacing `<id>` with the id found in step 1):

  ```sh
  zpool attach zdata raidz1-0 /dev/disk/by-id/<id>-part1
  ```

4. Check ZPool status by running:

  ```sh
  zpool status -v zdata
  ```

  It should contain a section starting with: `expand: expansion of raidz1-0 in progress`.
  Make sure there are no errors.

5. Add the new disk to [disk configuration](./disks.nix).

6. Rebuild the system:

  ```sh
  sudo nixos-rebuild switch --flake .#home-nas-2026-07
  ```
