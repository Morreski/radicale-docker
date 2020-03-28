# Radicale-Docker

Simple dockerization of the [Radicale](https://radicale.org/2.1.html) CalDav/CardDav server

## Setup

*Variables*
* `$RADICALE_DIR`: Folder on host file system where radicale related stuff will be stored
* `$PORT`: Exposed port on host machine

Build the image
```bash
docker build -t radicale:testing .
```

Copy the config from this repository to `$RADICALE_DIR`
```
cp config.ini $RADICALE_DIR
```

Run it
```bash
docker run \
    -it \
    --rm  \
    -v $RADICALE_DIR:/srv/radicale \
    -p $PORT:5232 \
    --name radicale \
    radicale:testing
```

## Create user

```
docker exec -it radicale htpasswd -B /srv/radicale/users $USERNAME
```

No need to restart the server afterward
