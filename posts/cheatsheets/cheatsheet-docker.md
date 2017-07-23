This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License ](http://creativecommons.org/licenses/by-sa/4.0/).

# Run a bash in a docker image (here debian) for testing purposes

```bash
docker run -i -t debian:latest /bin/bash
```

# CLean-up files
```
  docker stop $(docker ps -a -q) # Stop the running containers
  docker rm $(docker ps -a -q)   # Remove the containers
  docker rmi $(docker images -q) # Remove the images from the local machine
```

# Postgres DOcker Image
```
# Run the Postgres DOcker Instance with a password
docker run --name posgtres -h postgres -e POSTGRES_PASSWORD=mysecretpassword -e POSTGRES_USER=myuser -e POSTGRES_DB=mydatabase -d -p 127.0.0.1:5445:5432 postgres
# Run the Postgres DOcker Instance in trust mode
docker run --name posgtres -h postgres -e POSTGRES_USER=myuser -e POSTGRES_DB=mydatabase -d -p 127.0.0.1:5445:5432 postgres
psql -U mysuer -h 127.0.0.1 -p 5445 mydatabase
```


[![enter image description here](https://i.creativecommons.org/l/by-sa/4.0/80x15.png) ](http://creativecommons.org/licenses/by-sa/4.0/)