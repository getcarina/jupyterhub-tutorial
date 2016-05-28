```
$ carina grow --by=1 mycluster

$ docker run --name whoa1 --detach --publish 80:8080 rackerlabs/whoa
$ docker run --name whoa2 --detach --publish 80:8080 rackerlabs/whoa
$ docker rm -f whoa1 whoa2
```
