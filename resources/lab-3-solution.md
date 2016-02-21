```
mkdir lab3
cd lab3
docker run -d --name backend rackerlabs/whoa
docker create --name certs -v /certificates -e affinity:container==backend busybox
openssl req -x509 -newkey rsa:2048 -days 365 -nodes -batch -keyout private-key.pem -out public-certificate.pem
docker cp ./private-key.pem certs:/certificates/private-key.pem
docker cp ./public-certificate.pem certs:/certificates/public-certificate.pem
docker build -t my-nginx -f Dockerfile.nginx --build-arg affinity:container==certs .
docker run -d --name my-nginx --link backend --volumes-from certs -p 443:443 my-nginx
curl --insecure https://$(docker port my-nginx 443/tcp)
```
