FROM debian

RUN apt update
RUN apt upgrade

#instalacionde paquetes basicos
RUN apt install -y neofetch
RUN apt install -y git
RUN apt install -y net-tools
RUN apt install -y ssh
RUN apt install -y curl
RUN apt install -y wget

RUN mkdir /data
WORKDIR /data

#instalacion de mvn y nodejs
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
ENV NVM_DIR /root/.nvm
RUN mkdir -p $NVM_DIR && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
    echo "source $NVM_DIR/nvm.sh" >> /root/.bashrc

# Instala Node.js 20
RUN /bin/bash -c "source /root/.nvm/nvm.sh && nvm install 20"


#clonamos repositorio
RUN git clone https://github.com/Bautistadev/nodejs-helloworld-api.git


EXPOSE 3000


ENTRYPOINT ["/bin/bash"]

