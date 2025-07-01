
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
   ```

2. **Deploy to production:**
   ```bash
   docker compose -f docker-compose.prod.yml up -d --build
   ```

3. **Verify deployment:**
   ```bash
   docker compose ps
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

## Optional-Anforderungen (Kür):

**Entwicklungstools & Qualität:**

- [x]  Methoden/Tools für kollaborative Entwicklung evaluieren
    - **GitHub/GitLab** für Code-Repository mit Issues, Pull/Merge Requests
    - **Branch-Strategie**: GitFlow oder GitHub Flow
        - `main` - Production-ready Code
        - `integration` - Integration Branch
        - `i-feat/xyz` - Feature-Entwicklung
        - `i-fix/xyz` - Schnelle Bugfixes
        - `i-chore/xyz` - Schnelle Bugfixes
    - **Jira** für Sprint Planung / Erweiterungen
    - **Slack** für Kommunikation
    - **Notion** für gemeinsame Dokumentation
    - **Docker Compose** optimieren für lokale Entwicklung (Einheitliche Entwicklungsumgebung)

- [x]  Maßnahmen zur Sicherstellung der Codequalität definieren
    - Einrichtung von esLint für Code Qualität (Linting)
    - Einrichtung einer CI/CD Pipeline mit obligatorischem Linting (und ggf. Testing)
    - DependaBot für Sicherheitswarnungen von Dependencies

**Erweiterungen:**

- [x]  Konzept für CRUD-App Erweiterung entwickeln
    - Einrichtung weiterer Endpunkte im Backend
        
        ```jsx
        app.post('/api/gas-stations', createGasStation);       // CREATE
        app.get('/api/gas-stations/:id', getGasStation);       // READ
        app.put('/api/gas-stations/:id', updateGasStation);    // UPDATE
        app.delete('/api/gas-stations/:id', deleteGasStation); // DELETE
        ```
        
    - Frontend Erweiterung
        - Login-Seite für Authentifizierung
        - Formular für neue Einträge
        - Input Validierung neuer Einträge

- [x]  Hosting-Strategie und -Maßnahmen planen
    - Containerisierung (Docker Swarm / Kubernetes)
    - Nginx Reverse Proxy + CertBot für TSL / SSL
    - Monitoring (UptimeRobot / Prometheus / Grafana / Kuma)
    - ggf. Caching für Performance
    - ggf. Fail2Ban und Rate Limiting gegen Bot Attacken
    - ggf. Logging und Backups an neutralen Orten