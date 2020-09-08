#!/usr/bin/sh

make_req_file(){
	echo "Making pip_upgradable.txt file"
	pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 > pip_upgradable.txt
	echo "Done"
}

upgrade(){
echo "Updating..."
while read i; 
do
	pip install --upgrade $i
done < pip_upgradable.txt

echo "Done"
}

delete_req_file(){
	echo "Deleting pip_upgradable.txt file"
	rm -f pip_upgradable.txt
}

make_req_file
upgrade
delete_req_file
