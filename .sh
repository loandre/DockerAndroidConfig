#!/bin/bash

emulator -avd test -no-audio -no-window -no-snapshot &
emulator_pid=$!

# Espera o emulador iniciar completamente
adb wait-for-device

echo "Emulador iniciado."

# Mantém o script em execução para manter o container ativo
wait $emulator_pid

