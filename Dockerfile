FROM ubuntu:20.04

WORKDIR /app
RUN apk update && apk add --no-cache git ca-certificates tzdata && update-ca-certificates

COPY go.mod .
COPY . .

ENV GO111MODULE=on
RUN go mod download && go mod verify

VOLUME ./session.db:/session.db:rw
VOLUME ./config.toml:/config.toml
RUN chmod +x install.sh
EXPOSE 8080

CMD ["bash", "install.sh"]
