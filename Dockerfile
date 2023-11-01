FROM ubuntu:20.04

ENV NODE_VERSION=16.14.2
ARG WORK_DIR=/root/music-party
WORKDIR ${WORK_DIR}
EXPOSE 3000

COPY . ./

RUN \
  apt update && \
  apt -y upgrade && \
  apt -y install ffmpeg curl && \
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash && \
  chmod +x /root/.nvm/nvm.sh && \
  export NVM_DIR="$HOME/.nvm" && \
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
  nvm install ${NODE_VERSION} && \
  nvm use ${NODE_VERSION} && \
  nvm alias default ${NODE_VERSION} && \
  cd ${WORK_DIR} && ls && \
  npm i

ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

CMD npm start