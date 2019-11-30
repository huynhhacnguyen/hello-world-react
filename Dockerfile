FROM node:12.13.0-alpine
LABEL maintainer="vbosstech"

WORKDIR /webapp
COPY ./package.json .
RUN yarn install
COPY . .

EXPOSE 3000

CMD ["yarn", "start"]
