#! /bin/bash
while :; do
	git -C fullpath pull
	git -C fullpath add .
	git -C fullpath commit -m "auto commit"
	git -C fullpath push --force
	chmod -r 777 fullpath
	sleep 120
done
