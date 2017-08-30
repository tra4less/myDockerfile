## [spiderKeeper](https://github.com/DormyMo/SpiderKeeper) is a scalable admin ui for spider service

[![](https://images.microbadger.com/badges/image/n0trace/spiderKeeper.svg)](https://microbadger.com/images/n0trace/spiderKeeper "Get your own image badge on microbadger.com")


## Tags:
* [![](https://images.microbadger.com/badges/version/n0trace/spiderKeeper.svg)](https://microbadger.com/images/n0trace/spiderKeeper "Get your own version badge on microbadger.com")


---
### run

```
docker run --name spiderKeeper --restart=always \
	-p 6800:6800 \
	-p 5000:5000 \
	-d n0trace/spiderKeeper
```