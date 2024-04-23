FROM docker.io/frappe/bench:latest

COPY ../entrypoint/ /entrypoint

RUN apt update && apt install dos2unix -y; \
    dos2unix /entrypoint/entrypoint.sh


CMD [ "/entrypoint/entrypoint.sh" ]