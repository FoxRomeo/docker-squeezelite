ARG ARCH=
FROM ${ARCH}/alpine:3.20

COPY run-squeezelite.sh /run-squeezelite.sh
RUN passwd -l root ; \
    apk add --update --upgrade bash procps libusb openssl flac faad2 alsa-lib libmad libvorbis mpg123 && \
    apk add --update --upgrade alpine-sdk git libusb-dev openssl-dev flac-dev faad2-dev alsa-lib-dev libmad-dev libvorbis-dev mpg123-dev && \
    mkdir -p /usr/src && \
    cd /usr/src && \
    git clone https://github.com/ralph-irving/squeezelite.git && \
    cd squeezelite && \
    make && \
    cp -fv /usr/src/squeezelite/squeezelite /usr/bin/ && \
    cd / && \
    rm -rf /usr/src && \
    apk del alpine-sdk git libusb-dev openssl-dev flac-dev faad2-dev alsa-lib-dev libmad-dev libvorbis-dev mpg123-dev && \
    chmod u+x /run-squeezelite.sh

ENV SQUEEZELITE_AUDIO_DEVICE default
ENV SQUEEZELITE_NAME SqueezeLite
ENV SQUEEZELITE_TIMEOUT 2
ENV SQUEEZELITE_DELAY 500

ENV STARTUP_DELAY_SEC 0

CMD ["/run-squeezelite.sh"]

# health checks
COPY healthcheck.sh /healthcheck.sh
HEALTHCHECK --start-period=30s --interval=30s --timeout=3s --retries=3 \
    CMD /bin/sh /healthcheck.sh