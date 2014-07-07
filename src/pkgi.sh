#!/bin/bash
#
# License
# -------
# 
# Copyright (C) 2014  Cai, Zhi-Wei. (contact@reversi.ng)
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
#

if [ "$1" == "" ]; then
	echo "usage: sh $0 pkg_path"
	exit
fi

echo "\n\tCopyright (C) 2014  Cai, Zhi-Wei. (contact@reversi.ng)\n"

if [ ! -f "$1" ]; then
	echo "\n[ERROR] .pkg file \""$1"\" does not exist!\n"
	exit
fi
if [ ! -f "/usr/sbin/pkgutil" ]; then
	echo "\n[ERROR] pkgutil not found! Do you have Xcode installed?\n"
	exit
fi

base=$(basename "$1")
search="function pm_install_check\(\) {"
replace="$search return true;"
uuid=$(uuidgen)

echo " * Extracting files from \"$base\"..."
pkgutil --expand "$1" /tmp/$uuid/

echo " * Modifying files from \"$base\"..."
distFile="/tmp/$uuid/Distribution"
originalHash=$(md5 -q "$distFile")
perl -pi -w -e "s/$search/$replace/g;" "$distFile"
newHash=$(md5 -q "$distFile")
if [ "$originalHash" == "$newHash" ]; then
	echo "\n[ERROR] Modifying failed!\n"
	exit
fi

echo " * Creating new package -> /tmp/$uuid.pkg"
pkgutil --flatten /tmp/$uuid /tmp/$uuid.pkg
rm -rf /tmp/$uuid > /dev/null 2>&1
if [ ! -f "/tmp/$uuid.pkg" ]; then
	echo "\n[ERROR] New .pkg file creating failed.\n"
	exit
fi

echo " * Strating installation..."
open /tmp/$uuid.pkg > /dev/null 2>&1

echo " * All done. :)\n"
rm -- "$0"