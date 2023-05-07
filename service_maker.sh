#!/bin/sh
#program start

echo "auto-git-tool service maker ver1.3"
sleep 3

while :
do
read -p "
did you open this file by using sudo? (y/n)" choise0
if [[ $choise0 = "y" ]]; then
	break
elif [[ $choise0 = "n" ]]; then
	echo "open this file as root."
	exit 0
else
	echo "choose one.
"

fi
done

#copy files
read -p "enter repositories name... :" reponame
echo "
copying .sh file"
cp resouces/auto_git_tool.sh temp/auto_git_tool.sh
echo "copying .service file"
cp resouces/auto_git_tool.service temp/auto_git_tool.service


#chmod to .sh file
echo "changing authority .sh file"
chmod +x temp/auto_git_tool.sh


##change file contents
#apply user and group name to .service file
read -p "
enter user name...:" username

read -p "enter group name...(if you dont know, input username):" groupname
read -p "
enter target directory's full path...:" fullpath
echo "
replace files contents"
sed -i "s/username/$username/g" temp/auto_git_tool.service
sed -i "s/groupname/$groupname/g" temp/auto_git_tool.service
#apply full path to .sh file
sed -i "s@fullpath@$fullpath@g" temp/auto_git_tool.sh
#パスを指定するには/を@に変更
sed -i "s@placedir@/usr/bin/auto_git_tool_$reponame.sh@g" temp/auto_git_tool.service
sed -i "s/servicename/$reponame/g" temp/auto_git_tool.service


#check file
echo "
--------------
.service file
--------------"
cat temp/auto_git_tool.service
echo "--------------"
while :
do

read -p "Is that OK? (y/n)" choise1
if [[ $choise1 = "y" ]]; then
	break
elif [[ $choise1 = "n" ]]; then
	echo "please restart one more again..."
	echo "deleting temp files..."
	#remove tempfile
	rm temp/auto_git_tool.sh
	rm temp/auto_git_tool.service
	exit 0
else
	echo "pleace input correct one."
fi

done

echo "
---------
.sh file
---------"
cat temp/auto_git_tool.sh
echo "---------"
while :
do

read -p "Is that OK? (y/n)" choise2
if [[ $choise2 = "y" ]]; then
	break
elif [[ $choise2 = "n" ]]; then
	echo "please restart one more again..."
	echo "deleting temp files..."
	rm temp/auto_git_tool.sh
	rm temp/auto_git_tool.service
	exit 0
else
	echo "pleace input correct one."
fi

done


#rename copyfiles to reposit name
echo "
change name .service file"
mv temp/auto_git_tool.service temp/auto_git_tool_$reponame.service
echo "change name .sh file"
mv temp/auto_git_tool.sh temp/auto_git_tool_$reponame.sh


#copy files to system directories
echo "copying..."
sudo cp temp/auto_git_tool_$reponame.service /etc/systemd/system/
sudo cp temp/auto_git_tool_$reponame.sh /usr/bin/


#enable/start service
echo "
starting service..."
sudo systemctl start auto_git_tool_$reponame.service
echo "please check service status.
press [:q] to quit status screen."
sleep 3
sudo systemctl status auto_git_tool_$reponame.service
while :
do

read -p "Is that OK? (y/n)" choise2
if [[ $choise2 = "y" ]]; then
        break
elif [[ $choise2 = "n" ]]; then
        echo "please restart one more again..."
        echo "deleting temp files..."
        sudo rm temp/auto_git_tool_$reponame.sh /etc/systemd/system/auto_git_tool_$reponame.service
        sudo rm temp/auto_git_tool_$reponame.service /usr/bin/auto_git_tool_$reponame.sh
	rm temp/auto_git_tool_$reponame.sh
	rm temp/auto_git_tool_$reponame.service
        exit 0
else
        echo "pleace input correct one."
fi

done

sudo systemctl enable auto_git_tool_$reponame.service


echo "
Successful!!
"

sleep 2

#remove tempfile
echo "removing tempfile..."
rm temp/auto_git_tool_$reponame.sh
rm temp/auto_git_tool_$reponame.service

echo "please restart this pc after this file closed."

#program end
exit 0

