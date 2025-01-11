FROM ubuntu:latest

LABEL maintainer="gin8 <gin8@gin8.de>"

SHELL ["/bin/bash", "-c"]

# https://github.com/phusion/baseimage-docker/issues/58#issuecomment-47995343
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Set environment variables
ENV NODE_VERSION=22
ENV NPM_VERSION=11

# Specify build-time variables
ARG USERNAME=docker
ARG GROUPNAME=docker
ARG UID=1000
ARG GID=1000

RUN apt-get update \
    && apt-get install -y \
    build-essential \
    curl \
    ca-certificates \
    git \
    git-extras \
    git-flow \
    graphicsmagick \
    less \
    libglu1 \
    libxi6 \
    mysql-client \
    python3 \
    sudo \
    unzip \
    vim \
    && apt-get clean

# Install nvm and the latest Node.js version for the specified major version
RUN export NVM_DIR="/usr/local/nvm" && \
    mkdir $NVM_DIR && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && \
    source $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm use $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    ln -s $NVM_DIR/versions/node/$(nvm version)/bin/node /usr/bin/node && \
    ln -s $NVM_DIR/versions/node/$(nvm version)/bin/npm /usr/bin/npm && \
    ln -s $NVM_DIR/versions/node/$(nvm version)/bin/npx /usr/bin/npx

# Install latest npm version for the specified major version
RUN npm install -g npm@$NPM_VERSION

# Create non-root user
RUN if id -u ${UID} >/dev/null 2>&1; then \
       usermod -l ${USERNAME} $(id -un ${UID}) && \
       groupmod -n ${GROUPNAME} $(id -gn ${GID}); \
    else \
       groupadd -g ${GID} ${GROUPNAME} && \
       useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USERNAME}; \
    fi && \
    echo ${USERNAME}:${GROUPNAME} | chpasswd

# Create app directory and set permissions
WORKDIR /home/${USERNAME}/app
RUN chown -R ${USERNAME}:${GROUPNAME} /home/${USERNAME}/app

# Switch to non-root user
USER ${USERNAME}

ENTRYPOINT ["tail", "-f", "/dev/null"]

EXPOSE 3000 3001


