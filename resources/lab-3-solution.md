docker run -d --name backend rackerlabs/whoa
docker create --name certs -v /certificates -e affinity:container==whoa busybox
docker cp ./private-key.pem certs:/certificates/private-key.pem
docker cp ./public-certificate.pem certs:/certificates/public-certificate.pem
docker build -t my-nginx -f resources/Dockerfile.nginx --build-arg affinity:container==certs resources/
docker run -d --name my-nginx --volumes-from certs -p 443:443 my-nginx
