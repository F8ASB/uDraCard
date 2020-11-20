whiptail --title "INFORMATION:" --msgbox "Ce programme permet de programmer la uDraCard, il est necessaire de positionner les switchs 2 et 3 sur ON.                                                                             Team F4ICR/F5SWB/F8ASB" 15 60

while : ; do

choix=$(whiptail --title "Choisir votre action" --radiolist \
"Que voulez vous faire?" 15 60 4 \
"1" "CONFIGURATION uDraCard " ON \
"2" "ENVOYER SUR uDraCard " OFF 3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ]; then
    echo "Your chosen option:" $choix
else
    echo "You chose Cancel."; break;
fi

choixfreqtx()

{

freqtx=$(whiptail --inputbox "Fréquence TX XXX.XXXX ?" 8 39 433.5000 --title "Frequence TX" 3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ]; then
    echo "Frequence TX " $freqtx
    choixctcsstx
else
    echo "Annulation"; break;
fi
}

choixctcsstx()
{
CTCSSTX=$(whiptail --title "Choisir votre action" --radiolist \
"Frequence CTCSS en TX?" 50 60 39 \
"0000" "PAS DE CTCSS" ON \
"0001" "67.0Hz" OFF \
"0002" "71.9Hz" OFF \
"0003" "74.4.0Hz" OFF \
"0004" "77.0Hz" OFF \
"0005" "79.7Hz" OFF \
"0006" "82.5Hz" OFF \
"0007" "85.4Hz" OFF \
"0008" "88.5Hz" OFF \
"0009" "91.5Hz" OFF \
"0010" "94.8Hz" OFF \
"0011" "97.4Hz" OFF \
"0012" "67.0Hz" OFF \
"0013" "100.0Hz" OFF \
"0014" "103.5Hz" OFF \
"0015" "107.2Hz" OFF \
"0016" "110.9Hz" OFF \
"0017" "114.8Hz" OFF \
"0018" "118.8Hz" OFF \
"0019" "123.0Hz" OFF \
"0020" "127.3Hz" OFF \
"0021" "131.8Hz" OFF \
"0022" "136.5Hz" OFF \
"0023" "141.3Hz" OFF \
"0024" "146.2Hz" OFF \
"0025" "151.4Hz" OFF \
"0026" "156.7Hz" OFF \
"0027" "162.2Hz" OFF \
"0028" "167.9Hz" OFF \
"0029" "179.9Hz" OFF \
"0030" "186.2Hz" OFF \
"0031" "192.8Hz" OFF \
"0032" "203.5Hz" OFF \
"0033" "210.7Hz" OFF \
"0034" "218.1Hz" OFF \
"0035" "225.7Hz" OFF \
"0036" "233.6Hz" OFF \
"0037" "241.8Hz" OFF \
"0038" "250.3Hz " OFF 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "CTCSS TX " $CTCSS
    choixfreqrx
else
    echo "Annulation"; choixfreqtx;
fi
}

choixfreqrx()
{

freqrx=$(whiptail --inputbox "Fréquence RX XXX.XXXX ?" 8 39 433.5000 --title "Frequence RX" 3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ];

then
    echo "Frequence RX " $freqrx;
    choixctcssrx
else
    echo "Annulation"; 
    choixctcsstx;
fi

}

choixctcssrx()
{
CTCSSRX=$(whiptail --title "Choisir votre action" --radiolist \
"Frequence CTCSS en RX?" 50 60 39 \
"0000" "PAS DE CTCSS" ON \
"0001" "67.0Hz" OFF \
"0002" "71.9Hz" OFF \
"0003" "74.4.0Hz" OFF \
"0004" "77.0Hz" OFF \
"0005" "79.7Hz" OFF \
"0006" "82.5Hz" OFF \
"0007" "85.4Hz" OFF \
"0008" "88.5Hz" OFF \
"0009" "91.5Hz" OFF \
"0010" "94.8Hz" OFF \
"0011" "97.4Hz" OFF \
"0012" "67.0Hz" OFF \
"0013" "100.0Hz" OFF \
"0014" "103.5Hz" OFF \
"0015" "107.2Hz" OFF \
"0016" "110.9Hz" OFF \
"0017" "114.8Hz" OFF \
"0018" "118.8Hz" OFF \
"0019" "123.0Hz" OFF \
"0020" "127.3Hz" OFF \
"0021" "131.8Hz" OFF \
"0022" "136.5Hz" OFF \
"0023" "141.3Hz" OFF \
"0024" "146.2Hz" OFF \
"0025" "151.4Hz" OFF \
"0026" "156.7Hz" OFF \
"0027" "162.2Hz" OFF \
"0028" "167.9Hz" OFF \
"0029" "179.9Hz" OFF \
"0030" "186.2Hz" OFF \
"0031" "192.8Hz" OFF \
"0032" "203.5Hz" OFF \
"0033" "210.7Hz" OFF \
"0034" "218.1Hz" OFF \
"0035" "225.7Hz" OFF \
"0036" "233.6Hz" OFF \
"0037" "241.8Hz" OFF \
"0038" "250.3Hz " OFF 3>&1 1>&2 2>&3)
 
exitstatus=$?

if [ $exitstatus = 0 ]; then
    echo "CTCSS RX " $CTCSSRX
    choixpas
else
    echo "Annulation"; choixfreqrx;
fi
}

choixpas()

{
 SPACE=$(whiptail --title "Choisir le pas:" --radiolist \
"Votre choix?" 15 60 4 \
"0" "12.5Khz " ON \
"1" "25Khz " OFF 3>&1 1>&2 2>&3)
exitstatus=$?

if [ $exitstatus = 0 ]; then
    echo "PAS : " $SPACE
    choixhighpass
else
    echo "Annulation";choixctcssrx ;
fi
}

choixhighpass()

{
HIGHPASS=$(whiptail --title "FILTRE HIGHPASS" --radiolist \
"Activer le HIGHPASS?" 15 60 4 \
"0" "OUI " OFF \
"1" "NON " ON 3>&1 1>&2 2>&3)
exitstatus=$?

if [ $exitstatus = 0 ]; then
    echo "HIGHPASS : " $HIGHPASS
    choixlowpass
else
    echo "Annulation";choixpas ;
fi
}

choixlowpass()

{
LOWPASS=$(whiptail --title "FILTRE LOWPASS" --radiolist \
"Activer le LOWPASS?" 15 60 4 \
"0" "OUI " OFF \
"1" "NON " ON 3>&1 1>&2 2>&3)
exitstatus=$?

if [ $exitstatus = 0 ]; then
    echo "LOWPASS : " $LOWPASS
    choixpreamp
else
    echo "Annulation";choixhighpass ;
fi
}

choixpreamp()
{
if (whiptail --title "Reglage du De/preaccentiuation" --yesno "Voulez vous rester en deaccentation? (oui par defaut)" 8 78); then

    PREAMP=1
    choixsquelch
else
    PREAMP=0
    choixsquelch
fi
echo "PREAMP: "$PREAMP
}

choixsquelch()
{

SQUELCH=$(whiptail --title "Choisir le niveau de Squelch" --radiolist \
"Votre choix?" 15 60 9 \
"0" "niveau 0 " OFF \
"1" "niveau 1 " OFF \
"2" "niveau 2 " OFF \
"3" "niveau 3 " OFF \
"4" "niveau 4 " ON \
"5" "niveau 5 " OFF \
"6" "niveau 6 " OFF \
"7" "niveau 7 " OFF \
"8" "niveau 8 " OFF 3>&1 1>&2 2>&3)
exitstatus=$?

if [ $exitstatus = 0 ]; then
    echo "NIVEAU SQUELCH : " $SQUELCH
    choixvolume
else
    echo "Annulation"; choixpreamp;
fi
}

choixvolume()
{

VOLUME=$(whiptail --title "Choisir le niveau de volume" --radiolist \
"Votre choix?" 15 60 9 \
"0" "niveau 0 " OFF \
"1" "niveau 1 " OFF \
"2" "niveau 2 " OFF \
"3" "niveau 3 " OFF \
"4" "niveau 4 " ON \
"5" "niveau 5 " OFF \
"6" "niveau 6 " OFF \
"7" "niveau 7 " OFF \
"8" "niveau 8 " OFF 3>&1 1>&2 2>&3)
exitstatus=$?

if [ $exitstatus = 0 ]; then
    echo "NIVEAU DE VOLUME : " $VOLUME
    ecriturefichier
else
    echo "Annulation"; choixsquelch;
fi
}

#Ecriture du fichier de paramatres

ecrituredra()

{
echo "ENVOYER SUR LE DRA"
whiptail --title "INFORMATION:" --msgbox "programmation la uDraCard, il est necessaire de positionner les switchs 2 et 3 sur ON, à la fin de la programmation le sytème redemarrera ..." 15 60

python3 /opt/uDraCard/uDraProg.py
exit 0
}


ecriturefichier()

{

echo "ECRITURE FICHIER PARAMETRAGE"
echo ""

cat >/opt/uDraCard/parametres.py <<EOF
#!/usr/bin/python3
# -*- coding: utf-8 -*-

# VARIABLES CONFIGURATION DRA/SA818
volumelevel = '$VOLUME'       # volume 2-8
filterpre = '$PREAMP'   # Filter pre/de-emph
lowpass= '$LOWPASS'
highpass= '$HIGHPASS'

# CONFIG GENERALE : 'AT+DMOSETGROUP={},{},{},{},{},{}\r\n'.format(channelspace, txfreq, rxfreq, txcxcss, squelch, rxcxcss)
channelspace = '$SPACE'     # 0=12.5kHz, 1=25kHz
txfreq = '$freqtx'          # TX frequency
rxfreq = '$freqrx'          # RX frequency
squelch = '$SQUELCH'        # SQUELCH 0-8 (0 = open)
txctcss = '$CTCSSTX'        # CTCSS / CDCSS
rxctcss = '$CTCSSRX'        # CTCSS / CDCSS
EOF

}




case $choix in

1) 
choixfreqtx
;;

2) 
pkill spotnik2hmi
ecrituredra
;;

esac





done
exit 0








