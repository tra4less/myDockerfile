## [anyproxy](https://github.com/alibaba/anyproxy) is a fully configurable http/https proxy in NodeJS

[![](https://images.microbadger.com/badges/image/n0trace/anyproxy.svg)](https://microbadger.com/images/n0trace/anyproxy "Get your own image badge on microbadger.com")

## offical document

[http://anyproxy.io/cn.html](http://anyproxy.io/cn.html)

## Tags:
* [![](https://images.microbadger.com/badges/version/n0trace/anyproxy.svg)](https://microbadger.com/images/n0trace/anyproxy "Get your own version badge on microbadger.com")
* [![](https://images.microbadger.com/badges/version/n0trace/anyproxy:beta.svg)](https://microbadger.com/images/n0trace/anyproxy:beta "Get your own version badge on microbadger.com")

---
## run

```
docker run --name anyproxy --restart=always \
	-p 8001:8001\
	-p 8002:8002 \
	-d n0trace/anyproxy
```

## test

curl http://httpbin.org/user-agent --proxy http://<server-ip>:8001

