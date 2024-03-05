# Use uma imagem base que inclua o Android SDK e o emulador. A imagem do budtmo/docker-android já inclui muitas dessas dependências.
FROM budtmo/docker-android:emulator_11.0

# Define variáveis de ambiente necessárias
ENV EMULATOR_DEVICE="Samsung Galaxy S10" \
    WEB_VNC=true

# Exposição das portas para o VNC e o Maestro Studio
EXPOSE 6080 9999

# Instalação do Maestro Studio
RUN curl -Ls "https://get.maestro.mobile.dev" | bash && \
    echo 'export PATH="$PATH":"$HOME/.maestro/bin"' >> $HOME/.bashrc

# Comandos para iniciar o VNC e o Maestro Studio serão definidos em um script de inicialização
# Este passo assume que você tem um script de inicialização, como 'start.sh', no mesmo diretório que o Dockerfile
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Comando para configurar a localização do dispositivo. 704 Apps em Fortaleza Jacarecanga está aproximadamente na latitude -3.7237 e longitude -38.5282
# Este comando será executado a cada início do container para garantir que a localização esteja correta.
# O script start.sh deve incluir o comando abaixo antes de iniciar o emulador
# adb emu geo fix -38.5282 -3.7237

ENTRYPOINT ["start.sh"]

