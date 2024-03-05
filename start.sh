#!/bin/bash

# Espera o servidor VNC e o Android Emulator iniciarem
sleep 30

# Loop até o emulador estar pronto
while [ -z "$(adb devices | grep emulator)" ]; do
   echo "Waiting for emulator to start..."
   sleep 5
done

# Configura a localização do dispositivo
adb emu geo fix -38.5282 -3.7237

# Verifica se o comando maestro existe
if [ -x "$(command -v maestro)" ]; then
    # Inicia o Maestro Studio
    maestro studio &
else
    echo "Maestro Studio not found, please check the installation."
fi

# Mantém o container em execução
tail -f /dev/null

