FROM node:12.13.0-alpine as builder
LABEL maintainer="vbosstech"

WORKDIR /webapp
COPY ./package.json .
RUN yarn install
COPY . .
RUN yarn build


FROM node:12.13.0-alpine
LABEL maintainer="vbosstech"

WORKDIR /webapp
RUN yarn global add serve
COPY --from=builder /webapp/build/. ./build/

EXPOSE 3000

CMD ["serve", "-l", "tcp://0.0.0.0:3000", "build"]
