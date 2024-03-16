# Docker Frappe
## Notes
> Mysql Root password : **123**
## Installing Docker
Look at [here](https://docs.docker.com/desktop/install/windows-install/) if you are using windows.

and look at [here](https://docs.docker.com/engine/install/) if you are using Linux.
## Build
```bash
docker-compose up
```
if you want to start with _detach_ mode, the first you must to run `up` and click `CTRL+C` after that, you run `docker-compose start`
## Enter to container frappe
enter to container _frappe_ `docker-compose exec frappe bash`
## Init bench
[Enter to container frappe](#enter-to-container-frappe)]

if you found error `permission denid for user frappe` you must change the `group id`
### Fix error permission denied
get id from `group id` in your linux machine or host
```bash
id
uid=1000(nyuuk_popos) gid=1000(nyuuk_popos) groups=1000(nyuuk_popos),4(adm),27(sudo),124(lpadmin),999(docker)
```
send command into frappe docker container
```bash
docker compose exec -it -u root frappe groupmod -g 1000 frappe
```
<span style="color: red;">1000</span> is a id from gruop id `(nyuuk_popos)`. after that you must change the directory permission, this run in host not in container
```bash
sudo chown -R root:1000 dev
sudo chmod -R g+rwx dev
```
### Initial
```bash
bench init --skip-redis-config-generation frappe-bench
# enter in frappe-bench
cd frappe-bench
bench set-config -g db_host mariadb
bench set-config -g redis_cache redis://redis-cache:6379
bench set-config -g redis_queue redis://redis-queue:6379
bench set-config -g redis_socketio redis://redis-queue:6379
```
> Note after initial, and you want to configure or run server bench, you must inside frappe-bench folder
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
bench get-app --resolve-deps erpnext
bench --site development.localhost install-app erpnext
```
## Start server bench
[Enter to container frappe](#enter-to-container-frappe)

start this command in `frappe-bench` directory
```bash
bench start
```
