FROM node:12-slim
RUN npm i -g firebase-tools
COPY README.md LICENCE /
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
