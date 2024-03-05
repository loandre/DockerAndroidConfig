# Usar a imagem base
FROM budtmo/docker-android:emulator_11.0

# Definir as variáveis de ambiente necessárias
ENV EMULATOR_DEVICE="Samsung Galaxy S10" \
    WEB_VNC=true

# Expor as portas necessárias
EXPOSE 6080 9999

# Instalar Maestro CLI
RUN curl -Ls "https://get.maestro.mobile.dev" | bash

# Copia o script start.sh para o diretório de trabalho atual
COPY start.sh .

# Configura o contêiner para executar o start.sh quando iniciar
CMD ["./start.sh"]

