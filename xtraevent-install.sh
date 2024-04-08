#!/bin/sh
##setup command=wget -q "--no-check-certificate" https://github.com/popking159/xtraeventplugin/raw/main/xtraevent-install.sh -O - | /bin/sh
echo "removing old xtraevent "
opkg remove enigma2-xtraevent-6.4
echo "downloading xtraevent..."
wget -O  /var/volatile/tmp/xtraevent_v6.4_all.ipk https://raw.githubusercontent.com/popking159/xtraeventplugin/main/xtraevent_v6.4_all.ipk
echo "Installing xtraevent..."
opkg install /var/volatile/tmp/xtraevent_v6.4_all.ipk
sleep 5
sync
echo "#########################################################"
echo "#########################################################"

# ============================================================================================================
SETTINGS="/etc/enigma2/settings"
echo "Adding new setting xtraevent..."
sleep 2
echo "These settings will save posters in hdd"
echo "Be sure to mount your storage as hdd"
init 4
sleep 3
sed -i "/xtraEvent/d" $SETTINGS
{
    echo "config.plugins.xtraEvent.apis=True"
	echo "config.plugins.xtraEvent.extra3=true"
	echo "config.plugins.xtraEvent.FanartSearchType=movies"
	echo "config.plugins.xtraEvent.imgNmbr=2"
	echo "config.plugins.xtraEvent.info=false"
	echo "config.plugins.xtraEvent.loc=/media/hdd/"
	echo "config.plugins.xtraEvent.searchNUMBER=8"
	echo "config.plugins.xtraEvent.searchType=movie"
	echo "config.plugins.xtraEvent.timerHour=2"
	echo "config.plugins.xtraEvent.timerMod=Period"
	echo "config.plugins.xtraEvent.tmdbAPI=c7ca0c239088f1ae72a197d1b4be51b8"
	echo "config.plugins.xtraEvent.tvdb=true"
	echo "config.plugins.xtraEvent.tvdbAPI=a99d487bb3426e5f3a60dea6d3d3c7ef"
	
} >> $SETTINGS

# ============================================================================================================
sleep 2
sync
echo ""
echo ">>>>>>>>>     RESTARTING     <<<<<<<<<"
echo ""
init 3
echo "==================================================================="
echo "===                          FINISHED                           ==="
echo "==================================================================="
sleep 2
exit 0
