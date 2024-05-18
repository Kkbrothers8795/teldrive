FROM --platform=${BUILDPLATFORM:-linux/amd64} golang:alpine as builder

RUN curl -sSL instl.sh/divyam234/teldrive/linux | bash

RUN apk update && apk add --no-cache git ca-certificates tzdata && update-ca-certificates
WORKDIR /app

COPY go.mod .
COPY . .

ENV GO111MODULE=on
RUN go mod download && go mod verify

VOLUME ./session.db:/session.db:rw
VOLUME ./config.toml:/config.toml

EXPOSE 8080

ENTRYPOINT ["/app/teldrive"]
