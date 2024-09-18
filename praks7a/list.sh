#!/bin/bash

#skript vaatab kataloogi sisu ja väljastab selle kohta info


echo -n "Sisestage kataloogi nimi: "
read kus


#muutujad :((
link=0
kt=0
fail=0

if [ "$kus" != "$pwd" ]; then
cd "$kus"
else
echo "wow"
fi


for wa in * 
do
	if [ $wa == "." ] || [ $wa == ".." ]; then
		continue

	#kas on fail
	elif test -L $wa; then
		echo "$wa on link"
		link=$((link + 1))

	#kas on link
	elif test -f $wa; then
		echo "$wa on fail"
		fail=$((fail + 1))

	#kas on kataloog
	elif test -d $wa; then
		echo "$wa on kataloog"
		kt=$((kt + 1))

	fi
done

echo "kataloogis on $kt kataloogi, $fail faili ja $link linki"
