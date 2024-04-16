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
default dari settingan [entrypoint.sh](https://github.com/Nyuuk/docker-frappe/blob/main/entrypoint/entrypoint.sh), ini akan meng generate new site, dengan domain api.tripwe.local, jika kamu ingin mengubahnya. kamu bisa mengedit di services -> frappe -> environments -> URL_SITE. jika kamu ingin menambahkan site baru, maka jalan kan command di bawah ini

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
