#!/bin/bash
apt -y install git
rm /usr/bin/welding
cp /home/pi/ProdcutBinaries/welding/welding /usr/bin/
killall welding

chmod 777 /usr/bin/welding
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games
/usr/bin/welding &
echo  `date`  >>  /home/pi/update.log

