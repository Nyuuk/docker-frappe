# Docker Frappe
## Notes
> Mysql Root password : **123**
## Installing Docker
Lihat di [sini](https://docs.docker.com/desktop/install/windows-install/) jika kamu menggunakan Windows.

dan lihat [sini](https://docs.docker.com/engine/install/) jika kamu menggunakan Linux.

## Clone repository
> Repository : [https://github.com/Nyuuk/docker-frappe](https://github.com/Nyuuk/docker-frappe)
```bash
git clone https://github.com/Nyuuk/docker-frappe.git
cd docker-frappe
```

## Build
```bash
docker compose up
```
jika kamu ingin men start docker dengan _detach mode_, langkah pertama kamu harus merun `docker compose up` dan pencet `CTRL+C`, setelah itu, start docker compose dengan `docker compose start`
## Enter to container frappe
masuk ke dalam container _frappe_ `docker compose exec -it frappe bash`

## Create new site
<<<<<<< HEAD
default dari settingan [entrypoint.sh](https://github.com/Nyuuk/docker-frappe/blob/main/entrypoint/entrypoint.sh), ini akan meng generate new site, dengan domain tripwe.local, jika kamu ingin mengubahnya. kamu bisa mengedit di file `docker-compose.yml`.
```yaml
frappe:
    networks:
      default:
        ipv4_address: 172.26.0.5
    restart: on-failure
    # image: docker.io/frappe/bench:latest
    build:
      context: .
      dockerfile: dockerfile/Dockerfile
    # command: /entrypoint/entrypoint.sh
    environment:
      - SHELL=/bin/bash
      - URL_SITE=tripwe.local
      - MARIADB_PWD=${MARIADB_PWD}
```
silahkan edit `URL_SITE` lalu jalani `docker compose up` lagi.


jika kamu ingin menambahkan site baru, maka jalan kan command di bawah ini
=======
default dari settingan [entrypoint.sh](https://github.com/Nyuuk/docker-frappe/blob/main/entrypoint/entrypoint.sh), ini akan meng generate new site, dengan domain api.tripwe.local, jika kamu ingin mengubahnya. kamu bisa mengedit di services -> frappe -> environments -> URL_SITE. jika kamu ingin menambahkan site baru, maka jalan kan command di bawah ini
>>>>>>> 1b30ba1 (feat: healtcheck waiting db)

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

<<<<<<< HEAD
## Install ERPNext (Optional)
=======
## Install ERPNext
>>>>>>> 1b30ba1 (feat: healtcheck waiting db)
[Enter to container frappe](#enter-to-container-frappe)
```bash
bench get-app --resolve-deps erpnext
bench --site development.localhost install-app erpnext
```
<<<<<<< HEAD

## Install Custom app (Optional)
Sebagai contoh saya ingin menginstall apps yang mana apps ini di gunakan untuk _trial and error_ saya [GitLab Nyuuk - learn_apps](https://gitlab.com/Nyuuk/learn_apps)
### 1. Install app ke lokal
```bash
bench get-app $URL_OF_THIS_REPO --branch dev
```
jika command di atas success maka structure folder dalam folder bench atau frappe-bench akan seperti ini
```bash
tree dev/frappe-bench/ -L 2
dev/frappe-bench/
├── apps
│   ├── frappe
│   ├── learn
│   └── erpnext
├── archived
│   └── sites
├── config
│   ├── bench_build.lock
│   ├── pids
│   ├── scheduler_process.lock
│   └── site_config.lock
├── env
│   ├── bin
│   ├── include
│   ├── lib
│   ├── lib64 -> lib
│   ├── pyvenv.cfg
│   └── share
├── logs
│   ├── bench.log
│   ├── database.log
│   ├── frappe.log
│   ├── frappe.log.1
│   ├── ipython.log
│   ├── scheduler.log
│   ├── worker.error.log
│   └── worker.log
├── patches.txt
├── Procfile
└── sites
    ├── apps.json
    ├── apps.txt
    ├── assets
    ├── common_site_config.json
    ├── learn.local
    └── tripwe.local
```
### Install app ke site
```bash
bench --site (NAME_OF_YOUR_SITE) install-app learn
```
`(NAME_OF_YOUR_SITE)` silahkan ganti dengan site anda, jika lupa atau tidak tau, bisa cek di folder `sites`
```bash
└── sites
    ├── apps.json
    ├── apps.txt
    ├── assets
    ├── common_site_config.json
    ├── learn.local
    └── tripwe.local
```

## Restart Container
Setelah install apps, dan akan mengakses site nya dari browser, kalian wajib setiap setelah menambahkan apps baru yaitu mresetart frappe bench nya atau container nya
```bash
exit # exit dari container
docker compose restart frappe
```
=======
>>>>>>> 1b30ba1 (feat: healtcheck waiting db)
