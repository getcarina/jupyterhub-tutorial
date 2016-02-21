```
$ carina create foobar --wait

$ carina grow --by=2 foobar

$ eval $(carina env foobar)
PS> carina env foobar --shell powershell | ix

$ docker run --name whoa1 --detach --publish 80:8080 rackerlabs/whoa
$ docker run --name whoa2 --detach --publish 80:8080 rackerlabs/whoa
$ docker run --name whoa3 --detach --publish 80:8080 rackerlabs/whoa
$ docker rm -f whoa1 whoa2 whoa3
```
