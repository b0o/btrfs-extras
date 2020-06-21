btrfs-extras ![status: experimental](https://img.shields.io/badge/status-experimental-red?style=flat) [![version](https://img.shields.io/github/v/tag/b0o/btrfs-extras?style=flat&color=yellow&label=version&sort=semver)](https://github.com/b0o/btrfs-extras/releases) [![license: gpl-3.0-or-later](https://img.shields.io/github/license/b0o/btrfs-extras?style=flat&color=green)](https://opensource.org/licenses/GPL-3.0)
===

- [btrbk-find](#btrbk-find)
- [btrbk-purge](#btrbk-purge)
- [btrbk-gen-conf](#btrbk-gen-conf)
- [btrfs-subvol-conv](#btrfs-subvol-conv)
- [btrfs-undelete](#btrfs-undelete)

## btrbk-find
```
Usage: btrbk-find [options] <path> [path ...]

Find all occurrances of a given file within your btrbk backups.

Options
  General
  -v            verbose output
  -h            show short usage information
  -H            show extended usage information

  Btrbk
  -C <config>   the configuration file to be used by btrbk; if unspecified, the
                default btrbk configuration file will be used.

  Search locations
  -a            search snapshots and backups [default]
  -s            search snapshots only
  -b            search backups only

  Timespan filtering

  For the following options, a <date> is expected to be a valid date string as
  described in `info date "General date syntax"`.

  Relative dates like '1 month ago' are supported.

  -N <date>     only search within subvolumes newer than <date>
  -O <date>     only search within subvolumes older than <date>

  Uniqueness & Diffing

  -U            only display the first seen of 2 or more identical versions of
                a file; directories are ignored.

  -D            open a graphical tool (diffuse) to view diffs between each
                version of each file; directories are ignored; requires -U;
                if using sudo, you may need to use sudo -e to export DISPLAY /
                WAYLAND_DISPLAY for use by diffuse

Notes
  Network Backups
  btrbk-find has not been developed with network backups in mind; they are currently
  not supported.

Version:    v0.1.0
Repository: https://github.com/b0o/btrfs-extras
Issues:     https://github.com/b0o/btrfs-extras/issues
License:    GPL-3.0-or-later
            https://www.gnu.org/licenses/gpl-3.0.txt
Copyright:  2019-2020 Maddison Hellstrom <github.com/b0o>

```

## btrbk-purge
```
Usage: btrbk-purge [options] <path> [path ...]

Purge unwanted files/directories from all btrbk snapshots/backups at once.

Options
  General
  -v            verbose output
  -d            dry-run
  -h            show short usage information
  -H            show extended usage information

  Btrbk
  -C <config>   the configuration file to be used by btrbk; if unspecified, the
                default btrbk configuration file will be used.
  -L <lockfile> the lockfile used by btrbk; if unspecified, btrbk-purge will
                attempt to determine the lockfile from the btrbk configuration
                file.

  Filtering
  -a            apply to source, snapshots, and backups
  -S            apply to source
  -s            apply to snapshots [default: true]
  -b            apply to backups   [default: true]

  Removal
  -r            remove subdirectories and their contents recursively
  -x            secure removal using srm
  -i            interactively prompt before removal
  -p <n>        run <n> concurrent deletion processes (default: 1)

WARNING
  btrbk-purge is still in the experimental phase. It does not have unit
  tests, and has only been manually tested on a small range of use case
  scenarios. There is a high risk of bugs that will lead to data loss. Proceed
  at your own risk.

WARNING
  support for special characters in filenames is flaky

Notes
  Safety
  btrbk-purge is a utility for file deletion, and as such its usage comes with the
  risk of accidental deletion of important data. Prior to running any purge,
  please use the -d (dry-run) option to verify that only the desired files will
  be deleted.

  Lockfiles
  It is important to ensure your btrbk installation is correctly configured to
  use a lockfile. This will ensure that btrbk-purge doesn't attempt to alter a
  snapshot that btrbk is operating on, which could lead to loss of filesystem
  integrity.

  Network Backups
  btrbk-purge has not been developed with network backups in mind; they are currently
  not supported.

Version:    v0.1.0
Repository: https://github.com/b0o/btrfs-extras
Issues:     https://github.com/b0o/btrfs-extras/issues
License:    GPL-3.0-or-later
            https://www.gnu.org/licenses/gpl-3.0.txt
Copyright:  2019-2020 Maddison Hellstrom <github.com/b0o>

```

## btrbk-gen-conf
```
Usage: btrbk-gen-conf [options] <conf>

Automatically generate entries for your btrbk.conf file
based on existing subvolumes.

Expects <conf> to be a valid Bash script which defines the following
variables:

ROOT_SUBVOL (string)
  The root subvol for which to generate the btrbk config

SNAPSHOTS_FILTER (string)
  A valid awk regular expression which matches the subvolume names of snapshots

IGNORE_SUBVOLS (string array) (optional)
  An array of subvolume names which should be ignored when generating the btrbk
  config

SUBVOL_EXTRAS (string -> string associative array) (optional)
  An associative array of subvolume names mapping to any extra fields which should be
  included in the subvolumes' configuration sections.

Options
  General
  -h            show short usage information
  -H            show extended usage information

Version:    v0.1.0
Repository: https://github.com/b0o/btrfs-extras
Issues:     https://github.com/b0o/btrfs-extras/issues
License:    GPL-3.0-or-later
            https://www.gnu.org/licenses/gpl-3.0.txt
Copyright:  2020 Maddison Hellstrom <github.com/b0o>

```

## btrfs-subvol-conv
```
Usage: btrfs-subvol-conv [opts] <command> [<args>]

Convert between normal directories and btrfs subvolumes

Options:
  -k     keep backup of original <source> dir/subvol
  -v     verbose output
  -d     dry-run (implies -v)
  -h     show short usage information
  -H     show extended usage information

Commands:
  to-subvol
  dir-to-subvol <source> [dest]
      Convert normal directory source to btrfs subvolume.
      If dest is not supplied, conversion is done in-place.

  to-dir
  subvol-to-dir <source> [dest]
      Convert btrfs subvolume source to normal directory.
      If dest is not supplied, conversion is done in-place.

Version:    v0.1.0
Repository: https://github.com/b0o/btrfs-extras
Issues:     https://github.com/b0o/btrfs-extras/issues
License:    GPL-3.0-or-later
            https://www.gnu.org/licenses/gpl-3.0.txt
Copyright:  2020 Maddison Hellstrom <github.com/b0o>

```

## btrfs-undelete
```
Usage: btrfs-undelete [opts] <dev> <file/dir> <dest>

Attempt to recover the most recent version of the given file or directory
(recursively).

<dev> must not be mounted, otherwise this program may appear to work but find
nothing.

<file/dir> must be specified relative to the filesystem root. It may contain *
and ? as wildcards, but in that case, empty files might be 'recovered'. If
<file/dir> is a single file name, this program tries to recover the most recent
non-empty version of the file.

<dest> must be a writable directory with enough free space to hold the files
you're trying to restore.

Options:
  -h     show short usage information
  -H     show extended usage information

Version:    v0.1.0
Repository: https://github.com/b0o/btrfs-extras
Issues:     https://github.com/b0o/btrfs-extras/issues
License:    GPL-3.0-or-later
            https://www.gnu.org/licenses/gpl-3.0.txt
Copyright:  2020 Maddison Hellstrom <github.com/b0o>
            2013 Jörg Walter <info@syntax-k.de>
```
