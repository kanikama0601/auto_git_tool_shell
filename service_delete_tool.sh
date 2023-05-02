#!/bin/sh
#program start
	read -p "enter auto_git_tool service name :" name
	sudo systemctl disable auto_git_tool_$name.service
	sudo systemctl stop auto_git_tool_$name.service
	sudo rm /etc/systemd/system/auto_git_tool_$name.service
	sudo rm /usr/bin/auto_git_tool_$name.sh
#program end
exit 0

