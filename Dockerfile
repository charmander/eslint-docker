FROM node:14-alpine
LABEL version=7.5.0
USER node

RUN mkdir ~/lint
WORKDIR /home/node/lint
RUN ln -s /var/build/node_modules ../
COPY package.json package-lock.json ./
RUN npm install --ignore-scripts
WORKDIR /var/build
ENTRYPOINT ["/home/node/lint/node_modules/.bin/eslint", "--cache-location=/tmp/.eslintcache"]
