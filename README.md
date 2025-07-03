
# Bimanu Project

Gas station finder application with Vue.js frontend, Node.js backend, and PostGIS database.

## Production Deployment

### Prerequisites

- Docker and Docker Compose installed
- Git (for cloning/updating)
- Minimum 2GB RAM, 10GB disk space

### Quick Start

1. **Clone the repository:**
   ```bash
   git clone git@github.com:Philipp-Rudolph/bimanu-docker-wrapper.git
   cd bimanu-docker-wrapper
   git submodule update --recursive --remote --init 
   ```

2. **Deploy based on your needs:**

   a. **For production deployment:**
      ```bash
      docker compose -f docker-compose.prod.yml up -d --build
      ```

   b. **For development deployment:**
      ```bash
      docker compose up -d --build
      ```

3. **Verify deployment:**
   ```bash
   docker compose ps
   ```

4. **Initial Database import (if needed)**
   ```bash
   curl -X POST http://localhost:3002/import 
   ```

### Services & Ports

- **Frontend:** http://localhost:8082 (Vue.js application)
- **Backend API:** http://localhost:3002 (Node.js REST API)
- **Database Admin:** http://localhost:8083 (Adminer)
- **Database:** PostgreSQL with PostGIS (internal)

### Environment Configuration

The production environment uses these settings:
- Database: PostgreSQL 17 with PostGIS 3.5
- Backend: Node.js production mode
- Frontend: Nginx serving built Vue.js app

### Maintenance Commands

```bash
# Stop all services
docker compose down

# Update and rebuild
git pull
docker compose up -d --build

# View logs
docker compose logs -f
```

### Troubleshooting

- Check service status: `docker compose ps`
- View logs: `docker compose logs [service-name]`
- Restart services: `docker compose restart`
