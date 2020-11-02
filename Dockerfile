FROM node:15-alpine
LABEL version=7.12.1
USER node

RUN mkdir ~/lint
WORKDIR /home/node/lint
RUN ln -s /var/build/node_modules ../
COPY package.json package-lock.json ./
RUN npm install --no-save --ignore-scripts --no-audit --no-fund --no-update-notifier
WORKDIR /var/build
ENTRYPOINT ["/home/node/lint/node_modules/.bin/eslint", "--cache-location=/tmp/.eslintcache"]
