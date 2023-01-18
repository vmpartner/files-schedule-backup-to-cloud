FROM alpine

ENV RCLONE_DEST **None**
ENV SCHEDULE **None**
ENV CHECK_URL **None**
ENV FOLDER_DATE **None**

RUN apk update && apk add --no-cache curl tzdata

RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cd rclone-*-linux-amd64 && \
    cp rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone

COPY upload.sh run.sh /
RUN chmod +x /upload.sh && chmod +x /run.sh

USER root

CMD ["sh", "run.sh"]
