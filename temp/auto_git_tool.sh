#! /bin/bash
while :; do
	git -C /home/kanikama0601/for_test pull
	git -C /home/kanikama0601/for_test add .
	git -C /home/kanikama0601/for_test commit -m "auto commit"
	git -C /home/kanikama0601/for_test push --force
	chmod -R 777 /home/kanikama0601/for_test
	sleep 120
done
