# PHP OCI Test

Test call to stored proc in remote Oracle DB

## Prerequistes
Docker, GIT

## Steps:

1. Clone Repo
```bash
git clone
```

2. Start Application
```bash
docker compose up -d
```

3. Attach to running container (VS code / Docker Desktop)

4. Within Docker container execute script
```bash
php index.php
```

5. Close container
```bash
docker compose down
```