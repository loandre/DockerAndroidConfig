# Usa uma imagem base do Android com emulador pré-configurado
FROM budtmo/docker-android:emulator_11.0

USER root

# Corrige possíveis problemas de permissão com apt-get
RUN mkdir -p /var/lib/apt/lists/partial && \
    chmod -R 755 /var/lib/apt/lists && \
    apt-get clean && \
    apt-get update && \
    apt-get install -y curl

# Define variáveis de ambiente para o dispositivo e VNC
ENV EMULATOR_DEVICE="Samsung Galaxy S10" \
    WEB_VNC=true

# Instala o Maestro Studio
RUN curl -Ls "https://get.maestro.mobile.dev" | bash

# Adiciona o PATH do Maestro ao .bashrc para todos os usuários
RUN echo 'export PATH="$PATH:$HOME/.maestro/bin"' >> /etc/bash.bashrc

# Copia os scripts necessários e arquivos de teste para o container
COPY maestroShellScript /home/androidusr/maestroShellScript

# Dá permissão de execução para os scripts
RUN chmod +x /home/androidusr/maestroShellScript/run_test.sh

# Portas expostas (VNC e Maestro Studio)
EXPOSE 6080 9999

# Define o comando ou script de inicialização
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
ENTRYPOINT ["/usr/local/bin/start.sh"]

