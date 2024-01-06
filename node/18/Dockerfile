FROM ubuntu:22.04

LABEL maintainer="gin8 <gediminas.gineitis@gmail.com>"

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
  && apt-get install -y \
  curl \
  graphicsmagick \
  less \
  sudo \
  vim \
  && apt-get clean

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - \
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
