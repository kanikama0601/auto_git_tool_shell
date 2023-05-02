#! /bin/bash
while :; do
	git -C /home/kanikama0601/js1 pull
	git -C /home/kanikama0601/js1 add .
	git -C /home/kanikama0601/js1 commit -m "auto commit"
	git -C /home/kanikama0601/js1 push --force
	sudo chmod -R 777 /home/kanikama0601/js1
	sleep 120
done
