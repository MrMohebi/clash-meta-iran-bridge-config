FROM hub.hamdocker.ir/golang:1.20.3-alpine as builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o validateIp validateIp.go





FROM hub.hamdocker.ir/metacubex/clash-meta:v1.16.0
LABEL authors="MMMohebi"

COPY --from=builder /app/validateIp /
RUN chmod +x /validateIp

RUN apk add curl --no-cache



