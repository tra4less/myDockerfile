## [spiderkeeper](https://github.com/DormyMo/spiderkeeper) is a scalable admin ui for spider service

[![](https://images.microbadger.com/badges/image/n0trace/spiderkeeper.svg)](https://microbadger.com/images/n0trace/spiderkeeper "Get your own image badge on microbadger.com")


## Tags:
* [![](https://images.microbadger.com/badges/version/n0trace/spiderkeeper.svg)](https://microbadger.com/images/n0trace/spiderkeeper "Get your own version badge on microbadger.com")


---
### run

```
docker run --name spiderkeeper --restart=always \
	-p 6800:6800 \
	-p 5000:5000 \
	-d n0trace/spiderkeeper
```