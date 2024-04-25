#!/bin/bash
apt -y install git
rm /usr/bin/welding
cp /home/pi/ProdcutBinaries/welding/welding /usr/bin/
killall welding
chmod 777 /usr/bin/welding
./usr/bin/welding &
echo  `date`  >>  /home/pi/update.log

