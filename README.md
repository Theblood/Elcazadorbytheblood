# Elcazadorbytheblood
Un script que ayudara al  envenamiento en redes , montando un servidor propio el cual sera el index de todos los sitios por lo cual navegen los internautas de aquella dicha red.(Probado en kali linux!)

#Requerimientos IMPORTANTES.!
Lighttpd sudo apt-get install lighttpd
Geany    sudo apt-get install geany 

# Configuracion de Lighttpd
Configurar el puerto a escucha de lighttpd 
para ello ir a la direccion :cd /etc/lighttpd 
estando dentro de la carpeta editar lighttpd.conf
ponen nano lighttpd.conf 
donde dice server.port = 80 
cambienlo por server.port = 8080 
y guardan los cambios.
luego resetean lighttpd:
/etc/init.d/lighttpd restart
para verificar si el puerto escucha quedo bien ponen 
netstat -ntulp
y buscan lighttpd tendra que salirle 0.0.0.0:8080 
#ejecucion del script 
solo abren terminal y escriben ./thebloodw.sh
#Probado en Kali linux!.


