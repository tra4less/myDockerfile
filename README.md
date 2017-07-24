## [shadowsocks](https://github.com/shadowsocks/shadowsocks) A fast tunnel proxy that helps you bypass firewalls.

[![](https://images.microbadger.com/badges/image/n0trace/shadowsocks.svg)](https://microbadger.com/images/n0trace/shadowsocks "Get your own image badge on microbadger.com")


## Tags:
* [![](https://images.microbadger.com/badges/version/n0trace/shadowsocks.svg)](https://microbadger.com/images/n0trace/shadowsocks "Get your own version badge on microbadger.com")


---
### run

```
docker run --name shadowsocks -d -p <port>:<port> n0trace/shadowsocks -s 0.0.0.0 -p <port> -k <password> -m aes-256-cfb
```
