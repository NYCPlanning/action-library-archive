#!/bin/bash

echo "entrypoint.sh called"

if [ "$1" != "" ] ; then name="--name $1"; else name=''; fi
if [ "$2" != "" ] ; then path="--path $2"; else path=''; fi
if [ "$4" = "true" ] ; then s3="--s3"; else s3=''; fi
if [ "$5" = "true" ] ; then compress="--compress"; else compress=''; fi
if [ "$6" = "true" ] ; then latest="--latest"; else latest=''; fi
if [ "$7" != "" ] ; then version="--version $7"; else version=''; fi

for format in $3
do
  python3 -m library.cli archive $name $path -o $format $s3 $compress $latest $version &
done

# wait

# show=$(library show $1 --json)
# echo "::set-output name=show::$show"