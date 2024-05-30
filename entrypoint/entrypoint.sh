#!/bin/bash

# Fungsi untuk mengecek apakah folder /workspace/frappe-bench sudah ada
check_directory() {
    if [ -d "/workspace/frappe-bench" ]; then
        return 0 # Folder sudah ada
    else
        return 1 # Folder belum ada
    fi
}

# Fungsi untuk menjalankan langkah-langkah saat folder belum ada
setup_frappe_bench() {
    cd /workspace || exit 1
    echo "Change permission folder"
    sudo chown -R frappe:$GID /workspace
    sudo chmod -R g+rwx /workspace
    echo "Initial Directory frapp-bench"
    bench init --skip-redis-config-generation frappe-bench
    cd frappe-bench || exit 1
    echo "Initial Database config and redis config"
    bench set-config -g db_host mariadb
    bench set-config -g redis_cache redis://redis-cache:6379
    bench set-config -g redis_queue redis://redis-queue:6379
    bench set-config -g redis_socketio redis://redis-queue:6379
    echo "Initial new site with domain ${URL_SITE} with password DB ${MARIADB_PWD}"
    bench new-site --mariadb-root-password $MARIADB_PWD --admin-password admin --no-mariadb-socket $URL_SITE
    ehco "Initial config developer mode"
    bench --site $URL_SITE set-config developer_mode 1
    bench --site $URL_SITE clear-cache
    echo "Starting Bench"
    bench start
    echo "Error Starting Bench | sleep infinity"
    sleep infinity
}

# Fungsi untuk menjalankan langkah-langkah saat folder sudah ada
run_bench_start() {
    cd /workspace/frappe-bench || exit 1
    echo "Folder found in /workspace/frappe-bench"
    echo "Starting Bench"
    bench start
    echo "Error Starting Bench | sleep infinity"
    sleep infinity
}

# Mengecek apakah folder /workspace/frappe-bench sudah ada
if check_directory; then
    /entrypoint/change-localtime.sh
    run_bench_start
else
    /entrypoint/change-localtime.sh
    setup_frappe_bench
fi

