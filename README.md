# File Sharing System (Ruby on Rails)

This is a full-stack **Ruby on Rails** application that allows users to **upload, manage, and share large files** via short URLs.

## 🛠 Prerequisites

Ensure you have the following installed:
- **Ruby** (3.x recommended)
- **Rails** (7.x recommended)
- **PostgreSQL** (14+ recommended)
- **Node.js & Yarn** (for frontend assets)
- **Redis** (if using Sidekiq for background jobs)

## 🚀 Installation Guide

### 1️⃣ Clone the Repository
```sh
1. git clone git@github.com:TylerRake7468/file_sharing_system.git
2. cd file-sharing-system

3. bundle install
4. yarn install
5. config/database.yml   => add your postgres user credential id password
6. rails db:create
7. rails db:migrate
8. rails server
