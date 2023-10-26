# Use a imagem base do Ubuntu
FROM ubuntu:latest

VOLUME /opt/robotframework/results
VOLUME /opt/robotframework/tests

# Atualize o sistema e instale as dependências
RUN apt-get update && apt-get install -y \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Instale o Robot Framework e a biblioteca Selenium
RUN pip3 install --upgrade robotframework
RUN pip3 install --upgrade robotframework-seleniumlibrary | grep "Successfully installed"

# Copie o código do projeto para o contêiner
WORKDIR /app
COPY . /app