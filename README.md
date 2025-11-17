# 🚀 Flask DevOps Production Template (Docker • CI/CD • Monitoring • AI Review • Local Deploy)
A complete **production-ready DevOps template** built around a real Flask application.

This project is designed for both **learning DevOps** and **selling clones on marketplaces** — it includes everything a modern DevOps environment requires:

✔ Docker & Docker Compose

✔ CI/CD pipelines (build, linting, security scan, Docker Hub push)

✔ AI Code Review (Reviewdog + LLM suggestions)

✔ Local **Self-Hosted Runner**

✔ Monitoring stack (Prometheus + Grafana)

✔ SQLite/PostgreSQL-ready architecture

✔ Professional folder layout

✔ Ready for production deployment

## 🏗 Architecture Overview
                ┌──────────────────────┐
                │     Developer        │
                └──────────┬───────────┘
                           │ git push
                           ▼
                ┌─────────────────────────┐
                │      GitHub Actions     │
                ├─────────────────────────┤
                │ 1. CI (Lint, Scan, Test)│
                │ 2. AI Review            │
                │ 3. Build Docker Image   │
                │ 4. Push to Docker Hub   │
                │ 5. CD → Local Runner    │
                └──────────┬──────────────┘
                           │ SSH (secure)
                           ▼
                ┌─────────────────────────┐
                │   Self-Hosted Runner    │
                │    (local PC/server)    │
                ├─────────────────────────┤
                │ docker compose pull     │
                │ docker compose up -d    │
                └──────────┬──────────────┘
                           │
                           ▼
                ┌─────────────────────────┐
                │     Flask Web App       │
                │     + Prometheus        │
                │     + Grafana Dashboards│
                └─────────────────────────┘

## 📁 Folder Structure
```text
projects_pro/
├── app/
│   ├── Dockerfile
│   ├── entrypoint.sh
│   ├── requirements.txt
│   └── src/
│       ├── flaskr/...
│       ├── instance/
│       └── wsgi.py
├── deployment/docker/
│   ├── docker-compose.yml
│   ├── grafana/
│   │   └── flask-dashboard.json
│   └── prometheus/
│       └── prometheus.yml
├── monitoring/
│   └── docker-compose.yml
└── .github/workflows/
    ├── ci.yml
    ├── cd.yml
    ├── docker-publish.yml
    └── ai-review.yml
```
## 🐳 Docker Deployment

**Build locally**
```
docker build -t flask-app .
docker run -p 5000:5000 flask-app
```
**Production deployment**

(deployed by CI/CD automatically)
```
cd /home/eldorz/deploy
docker compose pull
docker compose up -d
```
## 🔁 CI/CD Pipeline (GitHub Actions)
### ✔ CI — Continuous Integration
Runs on every push & PR:

- flake8 (Python linting)
- hadolint (Dockerfile linting)
- shellcheck (entrypoint linting)
- Trivy Security Scan
- Build & Test

File: `.github/workflows/ci.yml`

### ✔ Docker Publish — Build & Push to Docker Hub

Every push to `main`:
- Build image
- Tag latest
- Push to Docker Hub repo:
```
eldordevops/projectspro:latest
```
File: `.github/workflows/docker-publish.yml`

### ✔ CD — Deploy to Local Machine (Self-Hosted Runner)

Triggered on every push to `main`.

Uses:
- Local deployment directory
- `deploy.sh` script
- Self-hosted runner under user `eldorz`

File: `.github/workflows/cd.yml`

## 🤖 AI Code Review

This project includes an **AI review stage** using reviewdog.

Features:

- Inline PR comments
- Warnings & recommendations
- Dockerfile, Python, Bash analysis
- Works only during Pull Requests

To see AI reviews:
1. Create a new branch
2. Edit any file
3. Push
4. Open Pull Request

You will get automatic AI feedback.

## 📈 Monitoring (Prometheus + Grafana)
**Run monitoring stack:**
```
cd deployment/docker
docker compose up -d grafana prometheus
```
**Access dashboards:**

- Prometheus → <u>http://localhost:9090</u>
- Grafana → <u>http://localhost:3000</u>
- Flask Dashboard imported automatically

A ready dashboard is included:
```
deployment/docker/grafana/flask-dashboard.json
```
## 💾 Database Options
**Option A — SQLite (default)**

Stored inside:
```
app/src/instance/flaskr.sqlite
```
Auto-initialized via `entrypoint.sh`.

**Option B — PostgreSQL (optional)**

Uncomment few lines in compose file to switch to Postgres.

## 🧪 Tests
(placeholder — extend later)
```
pytest -q
```
## 🔧 Local Self-Hosted Runner Setup

1. Create folder:
```
mkdir actions-runner && cd actions-runner
```
2. Download runner from GitHub
3. Configure with repo token
4. Run:
```
./run.sh
```
CD will automatically deploy to:
```
/home/eldorz/deploy
```
## ▶ How to Run Everything

**1. Local development:**
```
cd app
docker build -t flask-app .
docker run -p 5000:5000 flask-app
```
**2. Full environment:**
```
cd deployment/docker
docker compose up -d
```
**3. After CI/CD deploy:**

Open:

👉 <u>http://localhost:5005</u>

👉 <u>http://127.0.0.1:5005</u>

## 🌍 For Buyers (Marketplace-Ready)

This template can be sold as:

- **DevOps Starter Kit**
- **Flask API Production Template**
- **Monitoring-Enabled Docker App**
- **Full CI/CD Pipeline Example**
- **Self-Hosted Runner Setup**
- **AI Code Review Template**

All components are clean, modern, and production-grade.

## ⭐ Contribute / Support
If you like this project:
- ⭐ Star the repository
- 👏 Follow author
- 📝 Open issues, feature requests
- 🔄 Create PRs

## 💬 Contact

**Developer / DevOps Engineer:**

👉 *Eldor Zufarov*

👉 GitHub: <u>https://github.com/DataWizual</u>

## 🎉 Done!
