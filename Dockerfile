# syntax=docker/dockerfile:1.2
FROM node:16-bullseye

RUN npm install -g @listenai/lisa
RUN --mount=type=secret,id=lisa_token \
    lisa login --token $(cat /run/secrets/lisa_token) && \
    lisa install -g @lisa-plugin/zephyr && \
    lisa zep use-env csk6 && \
    rm -f ${HOME}/.config/configstore/lisa.json

VOLUME [ "/workspace" ]
WORKDIR /workspace

ADD entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
