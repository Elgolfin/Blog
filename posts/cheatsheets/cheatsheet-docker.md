This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License ](http://creativecommons.org/licenses/by-sa/4.0/).

# Run a bash in a docker image (here debian) for testing purposes

```bash
docker run -i -t debian:latest /bin/bash
```

```
  docker-cleanup() {
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
  docker-rmi
}
```

 ```
  docker-rmi() {
  docker rmi $(docker images -q)
}
```

[![enter image description here](https://i.creativecommons.org/l/by-sa/4.0/80x15.png) ](http://creativecommons.org/licenses/by-sa/4.0/)