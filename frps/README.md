## [frps](https://github.com/fatedier/frp) is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet.

[![](https://images.microbadger.com/badges/image/n0trace/frps.svg)](https://microbadger.com/images/n0trace/frps "Get your own image badge on microbadger.com")


## Tags:
* [![](https://images.microbadger.com/badges/version/n0trace/frps.svg)](https://microbadger.com/images/n0trace/frps "Get your own version badge on microbadger.com")


---
### run

```
docker run --name frps --restart=always \
	-p 80:80 \
	-p 443:443 \
	-p 7000:7000 \
	-p 7500:7500 \
	-d n0trace/frps
```

`-v frps.ini:/etc/frp/frps.ini` -  specifies the path to the file named frps.ini, which should be your frps config file


the [default config](https://github.com/n0trace/myDockerfile/blob/master/frps/conf/frps.ini)
