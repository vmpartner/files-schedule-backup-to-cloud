# Backup files to ftp by cron schedule 

Usage example
```yaml
  rclone:
    image: vmpartner/ftp-schedule-backup:version-1.0.5
    environment:
      SCHEDULE: "0 */6 * * *"
      RCLONE_CONFIG_SELECTEL_TYPE: "swift"
      RCLONE_CONFIG_SELECTEL_ENV_AUTH: "false"
      RCLONE_CONFIG_SELECTEL_USER: "my_user"
      RCLONE_CONFIG_SELECTEL_KEY: "my_password"
      RCLONE_CONFIG_SELECTEL_AUTH: "https://auth.selcdn.ru/v1.0"
      RCLONE_CONFIG_SELECTEL_ENDPOINT_TYPE: "public"
      RCLONE_DEST: "selectel:my_container/my_math"
      CHECK_URL: "https://hc-ping.com/my_check_token" # https://healthchecks.io
    volumes:
      - /my_path_backup:/source:ro
      - /etc/localtime:/etc/localtime:ro
    stdin_open: true
    tty: true
    labels:
      io.rancher.container.pull_image: always
    restart: "no"
```
