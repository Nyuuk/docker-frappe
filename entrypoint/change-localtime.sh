#!/usr/bin/sh

echo "Removing localtime file"
sudo rm /etc/localtime
echo "Linking time Asia/Jakarta to localtime"
sudo ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
