#!/bin/sh
TIME=`/bin/date`
URL1='https://grafana.rplan.com/d/8cv9E-3iz/container-metrics?orgId=1&var-namespace=rplan&var-container=rplan'
URL2='https://grafana.rplan.com/d/LenhZUrmk/pod-metrics?orgId=1&var-namespace=rplan&var-pod=couchbase-2'
URL="$URL1 $URL2"
CHROMIUM_FLAGS="--disable-restore-session-state --disable-logging --memory-model=low --disable-session-crashed-bubble --disable-infobars --start-fullscreen"
LOG=/tmp/startChrome.log
PROJECT_ROOT=/home/pi/monitoring-display/raspi

echo $TIME > $LOG

/usr/bin/xset s noblank
/usr/bin/xset s off
/usr/bin/xset -dpms

/usr/bin/xset -q >> $LOG

cp $PROJECT_ROOT/ChromiumPreferences /home/pi/.config/chromium/Default/Preferences
echo /usr/bin/chromium-browser $CHROMIUM_FLAGS $URL >> $LOG
/usr/bin/chromium-browser $CHROMIUM_FLAGS $URL &
