#! /bin/bash
while :; do
	git -C /home/kanikama0601/auto_git_tool_shell pull
	git -C /home/kanikama0601/auto_git_tool_shell add .
	git -C /home/kanikama0601/auto_git_tool_shell commit -m "auto commit"
	git -C /home/kanikama0601/auto_git_tool_shell push --force
	sleep 120
done
