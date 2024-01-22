
#!/bin/bash

# Verifica si Spotify está en ejecución
if pgrep -x "spotify" > /dev/null; then
    echo "true"
else
    echo "false"
fi

