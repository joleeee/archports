#!/bin/sh
  file="$1"
   dir="$(dirname "$file")"
  root="$(basename $(readlink -f "$dir"/../..))"
  repo="$(basename $(readlink -f "$dir"/..))"
   pkg="$(basename $(readlink -f "$dir"))"
    db="$repo.db.tar.gz"
   ldb="$(readlink -f "$dir"/../..)/$db"
  arch="$(uname -m)"

if [ -z "$file" ]; then
	echo missing file argument
	exit 1
fi

webdir="/var/www/arch-pkgs/$root/$repo/os/$arch"

# retrieve db
rsync "root@sluga:/$webdir/$db" "$ldb" || ( echo error retreiving db - make a new? [y/n] && read ans && [ "$ans" == "y" ] && echo repo-add "$ldb" ) || exit 1

# update db
repo-add "$ldb" "$file"

#          hack to make the parent dirs
rsync -v --rsync-path="mkdir -p $webdir && rsync" "$file" "$ldb" root@sluga:/"$webdir"
echo uploading $file to $webdir

rm $ldb
