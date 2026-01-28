# Cobb composes
My take on IaC for managing multiple apps for personal projects on my VPS using Docker Compose as the backbone.

This repository contains Docker Compose configurations for all services running on a personal VPS.

Each folder represents a service/application, with its compose and its own isolated dependencies.

### Core Infrastructure
- [nginx-proxy-manager](https://github.com/NginxProxyManager/nginx-proxy-manager)
- [dockge](https://github.com/louislam/dockge)
- [uptime kuma](https://github.com/louislam/uptime-kuma)

### Applications
- Each app folder contains its `compose.yml` and configuration
- App source code (when applicable) lives in `src/` subdirectories (gitignored)
- Persistent data (when applicable) stored in `data/` subdirectories (gitignored)

## Server Setup
Set up and start npm and dockge to be able to manage and expose applications.

## Adding an app

### 1. Create the app folder structure

### 2. Create compose.yml

Use the appropriate template based on each app stack. The compose file should:
- Define all services (db, redis, web, workers, etc.)
- Use environment variables for secrets
- Expose the web service on a unique port (3001, 3002, 3003, etc.)
- Mount `./src` for app code
- Mount `./data` for persistent data

### 3. Create .env with real secrets

### 4. Clone/copy your app code
```bash
git clone <app-repo> src/
```

### 5. Start the app
```bash
docker-compose up -d
```

or via dockge

### 6. Configure NPM proxy

1. Go to NPM web interface
2. Add Proxy Host:
   - Domain: `myapp.yourdomain.com`
   - Forward to: `my-new-app-web-1` (or check with `docker ps`)
   - Port: `3000` (or whatever port your app uses internally)
3. Request SSL certificate

## Current apps
WIP

## Backup Strategy
WIP

## Contributing
Contributions are welcome, I understand this is not an "abstract" project so it may be awkward to contribute to something so specific and tied to personal apps, but any ideas or help in the setup or the "architecture" side of things is well appreciated.
