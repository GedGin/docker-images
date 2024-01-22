FROM ubuntu:22.04

LABEL maintainer="gin8 <gediminas.gineitis@gmail.com>"

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
  && apt-get install -y \
  curl \
  gnupg \
  lsb-release \
  graphicsmagick \
  less \
  sudo \
  vim \
  git \
  && apt-get clean

# Add the NodeSource APT repository for Node.js 14.x
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -

# Create the nodesource.list file
RUN VERSION_CODENAME=$(lsb_release -sc) \
    && echo "deb https://deb.nodesource.com/node_14.x $VERSION_CODENAME main" | sudo tee /etc/apt/sources.list.d/nodesource.list \
    && echo "deb-src https://deb.nodesource.com/node_14.x $VERSION_CODENAME main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list

# Install Node.js
RUN apt-get update \
  && apt-get install -y nodejs

RUN useradd -d /home/docker -s /bin/bash docker \
  && /sbin/mkhomedir_helper docker \
  && usermod -a -G sudo docker \
  && echo docker:docker | chpasswd

RUN mkdir /home/docker/bin \
  && echo "export PATH=\$PATH:/home/docker/bin" >> /home/docker/.bashrc

COPY .bash_aliases /home/docker/.bash_aliases

RUN chown -R docker:docker /home/docker

USER docker

WORKDIR /home/docker/app

EXPOSE 3000
