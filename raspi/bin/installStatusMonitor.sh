#!/bin/sh

XAUTOSTART=/home/pi/.config/lxsession/LXDE-pi/autostart

touch $XAUTOSTART
chmod 755 $XAUTOSTART

cat << EOF > $XAUTOSTART
#!/bin/sh
/home/pi/monitoring-display/raspi/bin/startChrome.sh
EOF


sudo apt-get install unclutter
