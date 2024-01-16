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
- `socks5` authentication is username`root` password:`PASSWORD_SHOULD_BE_CHANGED` ([change user and pass here...](./config-master.yaml#L63) and [here](./docker-compose.yml#L12)) 
- `vmess` authentication (username and uuid) also are [here... change them](./config-master.yaml#L72)

generate UUID online [here](https://www.uuidgenerator.net/version4)
