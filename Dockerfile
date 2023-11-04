FROM 998244353/music-party-base

ARG WORK_DIR=/root/music-party
WORKDIR ${WORK_DIR}
EXPOSE 3000

COPY . ./

RUN \
  npm i

CMD npm start
