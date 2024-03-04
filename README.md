# Docker Frappe
## Build
```bash
docker-compose build
docker-compose start
```
## Enter to container frappe
enter to container _frappe_ `docker-compose exec frappe bash`
## Init bench
[Enter to container frappe](#enter-to-container-frappe)
```bash
bench init --skip-redis-config-generation frappe-bench
bench set-config -g db_host mariadb
bench set-config -g redis_cache redis://redis-cache:6379
bench set-config -g redis_queue redis://redis-queue:6379
bench set-config -g redis_socketio redis://redis-queue:6379
```
## Create new site
[Enter to container frappe](#enter-to-container-frappe)
```bash
bench new-site --no-mariadb-socket development.localhost
```
## Developer mode in site
[Enter to container frappe](#enter-to-container-frappe)
```bash
bench --site development.localhost set-config developer_mode 1
bench --site development.localhost clear-cache
```
## Install ERPNext
[Enter to container frappe](#enter-to-container-frappe)
```bash
bench --site development.localhost install-app erpnext
```
## Start server bench
[Enter to container frappe](#enter-to-container-frappe)

start this command in `frappe-bench` directory
```bash
bench start
```
