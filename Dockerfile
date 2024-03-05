# Usar a imagem base
FROM budtmo/docker-android:emulator_11.0

# Definir as variáveis de ambiente necessárias
ENV EMULATOR_DEVICE="Samsung Galaxy S10" \
    WEB_VNC=true

# Expor as portas necessárias
EXPOSE 6080 9999

# Adiciona o script start.sh ao contêiner
COPY start.sh /usr/local/bin/start.sh

# Configura o contêiner para executar o start.sh quando iniciar
CMD ["/usr/local/bin/start.sh"]

