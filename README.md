# Elcazadorbytheblood
Un script que ayudara al  envenamiento en redes , montando un servidor propio el cual sera el index de todos los sitios por lo cual navegen los internautas de aquella dicha red.

#Requerimientos IMPORTANTES.!
Ettercap sudo apt-get install ettercap
Lighttpd sudo apt-get install lighttpd
Geany    sudo apt-get install geany 

# Pasos Para poder Ejecutarlo.
 configurar el puerto a escucha de lighttpd 
para ello ir a la direccion :
cd /etc/lighttpd 

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
tienen que tener instalado ettercap y a la hora de ejecutar partir 
con usuario root en este caso presionar las teclas ctrl+alt+f1 
y inician como root luego  estando en root para inciar el motor 
grafico ponene startx y luego precionan las teclas ctrl+alt+t 
y en la terminal escriben unity --replace 
una vez hecho esto estara todo el entorno y pueden ya ejecutar el 
script con ./thebloodw.sh


