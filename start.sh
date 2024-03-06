#!/bin/bash

# echo "Iniciando o Maestro Studio..."
# Tenta simular um ambiente interativo para maestro studio
# maestro studio > /dev/null 2>&1 &

echo "Aguardando o emulador ficar pronto..."
# Espera o emulador estar pronto (ajuste o tempo conforme necessário)
sleep 30

# Checa se o adb reconhece o dispositivo
ADB_DEVICES=$(adb devices)
echo "$ADB_DEVICES"

if [[ "$ADB_DEVICES" == *"emulator"* ]]; then
  echo "Emulador detectado, prosseguindo com a instalação da APK..."
  # Instala as APKs
  adb install /home/androidusr/testIDVouTeHomologar.apk
else
  echo "Emulador não detectado. Verifique se o emulador está funcionando corretamente."
fi

# Mantém o contêiner rodando
tail -f /dev/null

