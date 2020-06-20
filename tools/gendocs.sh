#!/bin/bash

# Copyright (C) 2020 Maddison Hellstrom <https://github.com/b0o>
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <https://www.gnu.org/licenses/>.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

set -Eeuo pipefail
shopt -s inherit_errexit

declare -g prog basedir reporoot
prog="$(basename "${BASH_SOURCE[0]}")"
basedir="$(realpath -e "$(dirname "${BASH_SOURCE[0]}")")"
reporoot="$(realpath -e "$basedir/..")"

declare -a progs=(
  btrbk-find
  btrbk-purge
  btrbk-gen-conf
  btrfs-subvol-conv
  btrfs-undelete
)

function readme() {
  cat << EOF
btrfs-extras ![status: experimental](https://img.shields.io/badge/status-experimental-red?style=flat) [![version](https://img.shields.io/github/v/tag/b0o/btrfs-extras?style=flat&color=yellow&label=version&sort=semver)](https://github.com/b0o/btrfs-extras/releases) [![license: gpl-3.0-or-later](https://img.shields.io/github/license/b0o/btrfs-extras?style=flat&color=green)](https://opensource.org/licenses/GPL-3.0)
===
EOF

  declare -i i=0
  for prog in "${progs[@]}"; do
    [[ $i -gt 0 ]] && echo -e "\n---"
    i=$((i + 1))
    echo ""
    echo "### $prog"
    echo '```'
    "$prog" -H 2>&1
    echo '```'
  done

  echo ""
}

readme > "$reporoot/README.md"
