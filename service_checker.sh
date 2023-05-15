#!/bin/sh
#program start
	read -p "enter service name..." name
	echo ("press : key to exit...")
	systemctl status auto_git_tool_$name.service 
#program end
exit 0

