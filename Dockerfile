FROM alpine

ENV RCLONE_DEST **None**
ENV SCHEDULE **None**
ENV SCHEDULE **None**
ENV CHECK_URL **None**

RUN apk update && apk add curl
ADD upload.sh /upload.sh
ADD run.sh /run.sh
RUN chmod +x /backup.sh && chmod +x /run.sh
RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cd rclone-*-linux-amd64 && \
    cp rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone && \
    mkdir -p /usr/share/man/man1 && \
    cp rclone.1 /usr/share/man/man1/ && \
    makewhatis /usr/share/man

USER root

CMD ["sh", "run.sh"]
