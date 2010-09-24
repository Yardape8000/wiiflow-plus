#! /bin/bash
# Make sure to update versions.txt and commit all changes before running make release, or folders may be wrong.
rev_new_raw=$(svnversion -n . 2>/dev/null | tr '\n' ' ' | tr -d '\r')
[ -n "$rev_new_raw" ] || rev_new_raw=$(SubWCRev . 2>/dev/null | tr '\n' ' ' | tr -d '\r')


rev_new_raw=$(echo $rev_new_raw | sed 's/[^0-9]*\([0-9]*\)\(.*\)/\1 \2/')
rev_new=0
a=$(echo $rev_new_raw | sed 's/\([0-9]*\).*/\1/')
let "a+=0"
#find max rev
while [ "$a" ]; do
	[ "$a" -gt "$rev_new" ] && rev_new=$a
	rev_new_raw=$(echo -n $rev_new_raw | sed 's/[0-9]*[^0-9]*\([0-9]*\)\(.*\)/\1 \2/')
	a=$(echo $rev_new_raw | sed 's/\([0-9]*\).*/\1/') 
done

rev_old=$(cat ./source/svnrev.h 2>/dev/null | tr -d '\n' | sed 's/[^0-9]*\([0-9]*\).*/\1/')

	mkdir -p Compiles/files/txt
	mkdir -p Compiles/files/r$rev_new
	mkdir -p Compiles/files/r$rev_new/debug

	make ios249
	cp $1.dol Compiles/files/r$rev_new/249.dol
	make ios250
	cp $1.dol Compiles/files/r$rev_new/250.dol
	make ios222
	cp $1.dol Compiles/files/r$rev_new/222.dol
	make ios223
	cp $1.dol Compiles/files/r$rev_new/223.dol
	make ios224
	cp $1.dol Compiles/files/r$rev_new/224.dol
	
	cp $1.elf Compiles/files/r$rev_new/debug/boot.elf
	cp build/*.map Compiles/files/r$rev_new/debug/boot.map
	cp versions.txt Compiles/files/txt/versions.txt

	echo >&2

	rev_new=`expr $rev_new + 1`
	rev_date=`date +%Y%m%d%H%M -u`
	
echo $a