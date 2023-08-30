FROM ghcr.io/gedgin/php:8.2-dev

LABEL maintainer="gin8 <gediminas.gineitis@gmail.com>"

WORKDIR /var/www/localhost/htdocs

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        automake \
        git \
        git-extras \
        git-flow \
        jq \
        less \
        lftp \
        libtool \
        mariadb-client \
        rsync \
        sudo \
        unzip \
        vim \
        wget \
    && apt-get clean

# Install composer
RUN wget -q https://getcomposer.org/composer-stable.phar \
    && mv composer-stable.phar /usr/local/bin/composer \
    && chmod 755 /usr/local/bin/composer

# Install Node.js
RUN export NVM_DIR="/usr/local/nvm" \
    && mkdir $NVM_DIR \
    && wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.39.0/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install 18 \
    && n=$(which node) \
    && n=${n%/bin/node} \
    && cp -r $n/{bin,lib,share} /usr/local \
    && nvm use system \
    && /usr/local/bin/npm i -g npm \
    && nvm uninstall 18 \
    && nvm cache clear

RUN usermod -l docker -d /home/docker -s /bin/bash www-data \
    && groupmod -n docker www-data \
    && /sbin/mkhomedir_helper docker \
    && usermod -a -G sudo docker \
    && echo docker:docker | chpasswd

COPY .bash_aliases /home/docker/.bash_aliases

RUN chown -R docker:docker /home/docker

USER docker

RUN echo 'export NVM_DIR="/usr/local/nvm"' >> /home/docker/.bashrc \
    && echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> /home/docker/.bashrc \
    && echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> /home/docker/.bashrc

RUN mkdir /home/docker/bin \
    && echo "export PATH=\$PATH:$HOME/bin" >> /home/docker/.bashrc

ENTRYPOINT ["tail", "-f", "/dev/null"]
