#! /bin/bash
while :; do
	git -C fullpath pull
	git -C fullpath add .
	git -C fullpath commit -m "auto commit"
	git -C fullpath push --force
	sleep 120
done
