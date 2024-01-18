FROM golang:1.20.3-alpine as builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o appendEnvToYaml appendEnvToYaml.go
RUN go build -o generateMasterProxies generateMasterProxies.go



FROM gozargah/marzban-node:v0.2.0
LABEL authors="MMMohebi"

COPY --from=builder /app/appendEnvToYaml /
COPY --from=builder /app/generateMasterProxies /

COPY --from=metacubex/clash-meta:v1.16.0 /clash /

WORKDIR /

#COPY .env.example ./
COPY masterRun.sh ./
COPY slaveRun.sh ./


COPY config-master.yaml ./
COPY config-slave.yaml ./



RUN chmod +x /generateMasterProxies /appendEnvToYaml /masterRun.sh /slaveRun.sh /clash

ENTRYPOINT []
