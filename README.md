## [frpc](https://github.com/fatedier/frp) is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet.

[![](https://images.microbadger.com/badges/image/n0trace/frpc.svg)](https://microbadger.com/images/n0trace/frpc "Get your own image badge on microbadger.com")


## Tags:
* [![](https://images.microbadger.com/badges/version/n0trace/frpc.svg)](https://microbadger.com/images/n0trace/frpc "Get your own version badge on microbadger.com")
* [![](https://images.microbadger.com/badges/version/n0trace/frpc:aarch64.svg)](https://microbadger.com/images/n0trace/frpc:aarch64 "Get your own version badge on microbadger.com")

---
### run

```
docker run --name frpc --restart=always \
	-p 22:22 \
	-p 6000:6000 \
	-p 7000:7000 \
	-d n0trace/frpc
```

`-v /var/frp/conf/frpc.ini:frpc.ini` -  specifies the path to the file named frpc.ini, which should be your frpc config file