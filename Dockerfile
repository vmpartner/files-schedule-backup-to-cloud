FROM alpine

ENV RCLONE_DEST **None**
ENV SCHEDULE **None**
ENV CHECK_URL **None**

RUN apk update && apk add --no-cache curl && apk add --no-cache tzdata
ADD upload.sh /upload.sh
ADD run.sh /run.sh
RUN chmod +x /upload.sh && chmod +x /run.sh
RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cd rclone-*-linux-amd64 && \
    cp rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone

USER root

CMD ["sh", "run.sh"]
