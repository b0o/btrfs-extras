btrbk-purge
===========

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
Repository: https://github.com/b0o/btrbk-purge
Issues:     https://github.com/b0o/btrbk-purge/issues
License:    GPL-3.0-or-later
            https://www.gnu.org/licenses/gpl-3.0.txt
Copyright:  2019-2020 Maddison Hellstrom <github.com/b0o>
```
