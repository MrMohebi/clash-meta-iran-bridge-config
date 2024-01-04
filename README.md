# Clash-Meta iran bridge config

## manual
### ports:
- `sokcs5` and `https`  Proxy on port `1080` ([change the port here...](./docker-compose.yml#L16))
- `vmess` Proxy on port `8585` ([change the port here...](./docker-compose.yml#L17))

### auth:
- `socks5` authentication is username`root` password:`PASSWORD_SHOULD_BE_CHANGED` ([change user and pass here...](./config.yaml#L63) and [here](./docker-compose.yml#L12)) 
- `vmess` authentication (username and uuid) also are [here... change them](./config.yaml#L72)

generate UUID online [here](https://www.uuidgenerator.net/version4)


### Dashboard login:
To login to the dashboard on port:`8085` use this secret:`API_SECRET` ([also change it here...](./config.yaml#L53)) and ip of your server