#!/bin/bash

# Inicia o servidor VNC e o Android Emulator
# (Assume-se que a imagem base já configure esses serviços para iniciar automaticamente)

# Espera o emulador estar completamente carregado
sleep 30

# Configura a localização do dispositivo
adb emu geo fix -38.5282 -3.7237

# Inicia o Maestro Studio
maestro studio &

# Mantém o container em execução
tail -f /dev/null

