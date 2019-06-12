# stage 1 - Build confd

FROM golang:1.10-alpine as confd

ARG CONFD_VERSION=0.16.0

ADD https://github.com/kelseyhightower/confd/archive/v${CONFD_VERSION}.tar.gz /tmp/

RUN apk add --no-cache \
    bzip2 \
    make && \
  mkdir -p /go/src/github.com/kelseyhightower/confd && \
  cd /go/src/github.com/kelseyhightower/confd && \
  tar --strip-components=1 -zxf /tmp/v${CONFD_VERSION}.tar.gz && \
  go install github.com/kelseyhightower/confd && \
  rm -rf /tmp/v${CONFD_VERSION}.tar.gz

# stage 2 - Build Node/React App | https://mherman.org/blog/dockerizing-a-react-app/

# base image
FROM node:12.2.0-alpine

# copy conf from stage 1 into stage 2
COPY --from=confd /go/bin/confd /usr/local/bin/confd

# set working directory
WORKDIR /app

# run confd (will show an error but we will take care of this on start app)
COPY ./confd /etc/confd
RUN confd -onetime -backend env; exit 0

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install --silent
RUN npm install react-scripts@3.0.1 -g --silent

# run confd and start app
CMD confd -onetime -backend env && npm start