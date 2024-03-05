#!/bin/bash

# Tenta simular um ambiente interativo para maestro studio
#maestro studio > /dev/null 2>&1 &

# Ou experimente iniciar dentro de um 'screen' ou 'tmux' se disponível
screen -dmS maestro_session maestro studio

tail -f /dev/null

