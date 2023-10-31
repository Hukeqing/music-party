FROM ubuntu:20.04

ENV NODE_VERSION=16.14.2

RUN \
  apt update && \
  apt -y upgrade && \
  apt -y install ffmpeg curl && \
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash && \
  /root/.nvm/nvm.sh && nvm install ${NODE_VERSION} && \
  /root/.nvm/nvm.sh && nvm use ${NODE_VERSION} && \
  /root/.nvm/nvm.sh && nvm alias default ${NODE_VERSION} && \

ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

CMD npm start