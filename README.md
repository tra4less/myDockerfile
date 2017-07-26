## certgen

[![](https://images.microbadger.com/badges/image/n0trace/certgen.svg)](https://microbadger.com/images/n0trace/certgen "Get your own image badge on microbadger.com")

### Tags:
* [![](https://images.microbadger.com/badges/version/n0trace/certgen.svg)](https://microbadger.com/images/n0trace/certgen "Get your own version badge on microbadger.com")

---

fast generate docker cert in /root/.docker

### env

- `DOMAIN` : docker domain

### run

```
docker run --name certgen -d -v /root/.docker:/root/.docker -e DOMAIN=<domain> n0trace/certgen
``` 
