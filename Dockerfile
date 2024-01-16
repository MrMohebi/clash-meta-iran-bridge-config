FROM hub.hamdocker.ir/golang:1.20.3-alpine as builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o appendEnvToYaml appendEnvToYaml.go
RUN go build -o generateMasterProxies generateMasterProxies.go



FROM hub.hamdocker.ir/metacubex/clash-meta:v1.16.0
LABEL authors="MMMohebi"

COPY --from=builder /app/appendEnvToYaml /
COPY --from=builder /app/generateMasterProxies /

#COPY .env.example ./
COPY masterRun.sh ./
COPY slaveRun.sh ./

COPY config-master.yaml ./
COPY config-slave.yaml ./

RUN chmod +x /generateMasterProxies /appendEnvToYaml /masterRun.sh slaveRun.sh

ENTRYPOINT []

RUN apk add curl bash --no-cache

