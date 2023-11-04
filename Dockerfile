FROM 998244353/common-node-16

RUN \
  apt -y install ffmpeg

CMD npm start
