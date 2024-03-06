# Passo 1:

### 1.1 - Alterar as permissões do arquivo start.sh no seu sistema host:
```
chmod +x start.sh
```
### 1.2 - Criar a imagem Docker com o Android Studio:
```
docker build -t minha-imagem-android .
```
### 1.3 Rodar o Contêiner:
```
docker run -d -p 6080:6080 -p 9999:9999 -e EMULATOR_DEVICE="Samsung Galaxy S10" -e WEB_VNC=true --device /dev/kvm --name android-container minha-imagem-android
```

#### Obs: Caso nao esteja iniciado: Colocar para rodar
```
docker start android-container
docker exec -it android-container /bin/bash
```
------------------------

# Passo 2: 

### 2.1. Entrar dentro do Contêiner:
```
docker exec -it android-container /bin/bash
```
### 2.2. Instalar a APK que ja foi copiada do DockerFile:
```
adb install /home/androidusr/testIDVouTeHomologar.apk 
```
### 2.3. Rodar o Shell Script que roda o template.yaml do Maestro Studio
```
./run_test.sh "hml704appsPro" 
              <"nome do app">
```
###### * A intenção é rodar esses comandos do passo 2 apenas com um shell script.