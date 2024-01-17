# Clash-Meta iran bridge config

## how to use:
just clone the project and execute:
```bash 
$ docker compose up -d --build
```

## manual
### ports:
- `sokcs5` and `https`  Proxy on port `1085` ([change the port here...](./docker-compose.yml#L22))
- `vmess` Proxy on port `8585` ([change the port here...](./docker-compose.yml#L23))

### auth:
- `socks5` authentication is username`root` password:`123456789` ([change user and pass here...](./docker-compose.yml#L12)) 
- `vmess` authentication (username and uuid) also are [here... change them](./docker-compose.yml#L16)

generate UUID online [here](https://www.uuidgenerator.net/version4)

[`SLAVE_PROXIES`](./docker-compose.yml#L17)  points to slave servers that can be in same machine or in other servers. separated by `,`