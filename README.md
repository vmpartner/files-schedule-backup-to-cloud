# Backup files to cloud by cron schedule & rclone

Usage example
```yaml
  rclone:
    image: vmpartner/files-schedule-backup-to-cloud:v3.0.4
    environment:
      SCHEDULE: "0 */6 * * *"
      RCLONE_CONFIG_SELECTEL_TYPE: "swift"
      RCLONE_CONFIG_SELECTEL_ENV_AUTH: "false"
      RCLONE_CONFIG_SELECTEL_USER: "my_user"
      RCLONE_CONFIG_SELECTEL_KEY: "my_password"
      RCLONE_CONFIG_SELECTEL_AUTH: "https://auth.selcdn.ru/v1.0"
      RCLONE_CONFIG_SELECTEL_ENDPOINT_TYPE: "public"
      RCLONE_DEST: "selectel:my_container/my_math"
      CHECK_URL: "https://hc-ping.com/my_check_token"
      FOLDER_DATE: "%Y%m"
    volumes:
      - /my_path_backup:/source:ro
      - /etc/localtime:/etc/localtime:ro
    stdin_open: true
    tty: true
    restart: "unless-stopped"
```

Used https://rclone.org/ for rsync to cloud

Build from source:
```bash
docker build -t vmpartner/files-schedule-backup-to-cloud:v3.0.4 .
docker push vmpartner/files-schedule-backup-to-cloud:v3.0.4
```
