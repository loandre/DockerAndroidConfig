FROM ubuntu:20.04

# Instala as dependências necessárias
RUN apt-get update && apt-get install -y curl unzip libqt5widgets5

# Baixa e instala o Android SDK
RUN mkdir /opt/android-sdk && cd /opt/android-sdk && \
    curl -o sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip && \
    unzip sdk-tools.zip && rm sdk-tools.zip

ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# Aceita as licenças e instala as plataformas e ferramentas necessárias
RUN yes | sdkmanager --licenses && \
    sdkmanager "platform-tools" "platforms;android-29" "emulator" "system-images;android-29;google_apis;x86_64"

# Cria um AVD
RUN echo "no" | avdmanager create avd -n test -k "system-images;android-29;google_apis;x86_64"

# Copia um script de inicialização customizado (explicado mais adiante)
COPY start-emulator.sh /opt/android-sdk/

# Expõe a porta do ADB
EXPOSE 5555

CMD ["/opt/android-sdk/start-emulator.sh"]

