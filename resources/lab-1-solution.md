```
docker run --detach --name nginx --publish 80:80 nginx:1.9
chmod a+r README.md
docker cp README.md nginx:/usr/share/nginx/html/index.html
open http://$(docker port nginx 80/tcp)
docker rm --force nginx
```
