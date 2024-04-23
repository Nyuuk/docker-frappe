FROM docker.io/frappe/bench:latest

COPY ../entrypoint/ /entrypoint

RUN sudo apt update && sudo apt install dos2unix -y; \
    sudo dos2unix /entrypoint/entrypoint.sh

RUN sudo chmod +rwx /entrypoint/entrypoint.sh

CMD [ "/entrypoint/entrypoint.sh" ]