FROM golang:1.16-buster

ADD ./ /src/

WORKDIR /src/

RUN go build -o ./initech ./

FROM debian:buster-slim

RUN mkdir /initech/
COPY --from=0 /src/initech /bin/initech
COPY ./web/index.html /initech/index.html

ENV INITECH_PATH=/initech/
ENTRYPOINT ["/bin/initech"]
