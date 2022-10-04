FROM alpine:3.16
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing --update \
    python3 python3-pip aria2 qbittorrent-nox libpq-dev libffi-dev wget \
    p7zip tar xz curl pv jq ffmpeg locales git unzip rtmpdump libmagic \
RUN wget https://github.com/tonmoyislam250/fluffy-guide/releases/download/v6/pack.zip \
    && unzip pack.zip && cd pack && apk add *
    && locale-gen en_US.UTF-8 && \
    curl -L https://github.com/tonmoyislam250/drinkbeer12/releases/download/v1.3.3/megasdkrest-amd64 \
    -o /usr/local/bin/megasdkrest && chmod +x /usr/local/bin/megasdkrest
WORKDIR /usr/src/app
COPY pewdiepie.so /usr/src/binary
COPY race.py start.sh req.txt .
RUN mv /usr/bin/aria2c /usr/bin/mrbeast \
    && mv /usr/bin/qbittorrent-nox /usr/bin/pewdiepie \
    && mv /usr/bin/ffmpeg /usr/bin/mutahar
RUN pip3 install --no-cache-dir -r req.txt
