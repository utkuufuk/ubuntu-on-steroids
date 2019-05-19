## Docker Cheatsheet
 1. [Docker Commands](#docker-commands)
 2. [Dockerfile Tips](#dockerfile-tips)
 3. [Docker Compose Commands](#docker-compose-commands)
 4. [Docker Compose File Tips](#docker-compose-file-tips)

### Docker Commands
#### List Images / Containers
```sh
# list all images
docker images

# list all images (including intermediate)
docker images -a

# list running containers
docker container ls
docker ps

# list all containers
docker container ls -a
docker ps -a

# inspect a container
docker inspect <container_id>

# get container IP address
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_id>
```

#### Build Image
```sh
# build a docker image from the local files in <local_app_dir>
docker build --tag=<username>/<repository>:<version> <local_app_dir>

# tag an already built image
docker tag <existing_tag> <username>/<repository>:<version>
```

#### Run Image
**`docker run`** *will attempt to fetch the image from public registry if it's not found in local machine.*
```sh
# map the <exposed_port> in Dockerfile to <machine_port> that the app will be served
docker run -p <exposed_port>:<machine_port> <tag>

# run image in detached mode
docker run -d -p <exposed_port>:<machine_port> <tag>

# mount the volume 'my-vol' into '/app/' in the container
docker run -d \
    --mount source=my-vol,target=/app \
    -p <exposed_port>:<machine_port> \
    <tag>

# same as above, but mounts the volume as read-only
docker run -d \
    --mount source=my-vol,target=/app,readonly \
    -p <exposed_port>:<machine_port> \
    <tag>

# run image in interactive mode, open up a shell, and remove container on exit
docker run --rm -ti <tag> /bin/bash
```

#### Stop Container
```sh
# gracefully stop container
docker container stop <hash>

# force shutdown
docker container kill <hash>
```

#### Remove Images / Containers / Networks / Volumes
```sh
# remove container from machine
docker container rm <hash>

# delete all stopped containers
docker rm $(docker ps -a -q)

# remove image from machine
docker image rm <image_id>

# remove all stopped containers, all dangling images and all unused networks
docker system prune

# same as above, plus remove all unused volumes
docker system prune --volumes
```

#### Volumes
```sh
# create a volume named 'my-vol'
docker volume create my-vol

# list volumes
docker volume ls

# inspect the 'my-vol' volume
docker volume inspect my-vol

# remove the 'my-vol' volume
docker volume rm my-vol

# remove all unused volumes
docker volume prune
```

#### Remote Registry
```sh
# login to public registry
docker login

# logout from public registry 
docker logout 

# login to private registry
docker login <hostname>:<port>

# logout from private registry
docker logout <hostname>:<port> 

# upload image to registry
docker push <username>/<repository>:<tag>

# list all images in registry
curl -X <hostname>:<port>/v2/_catalog

# list all tags for an image in registry
curl -X <hostname>:<port>/v2/<image_name>/tags/list
```

### Dockerfile Tips
#### `.dockerignore` Exceptions
Lines starting with `!` can be used to make exceptions to exclusions. The following is an example `.dockerignore` file that uses this mechanism:
``` sh
# all markdown files except `README.md` are excluded from the context.
*.md
!README.md
```

#### Notes on Instructions
 * **`ARG`** - An `ARG` declared before a `FROM` is outside of a build stage, so it can’t be used in any instruction after a `FROM`.

 * **`RUN`** - The `<command>` in a `RUN <command>` instruction is run in a shell, which by default is `/bin/sh -c`. You can explicitly choose a shell using the *exec* form:
    ``` dockerfile
    RUN ["/bin/bash", "-c", "<command>"]
    ```

 * **`EXPOSE`** - The `EXPOSE` instruction does not actually publish the port. It functions as a type of documentation between the person who builds the image and the person who runs the container, about which ports are intended to be published. To actually publish the port when running the container, use the `-p` flag on docker run to publish and map one or more ports.

#### Minimize the Number of Intermediate Steps
Instead of installing packages one by one like this:
``` dockerfile
FROM alpine:3.4

RUN apk update
RUN apk add curl
RUN apk add vim
RUN apk add git
```

combine these steps like this:
``` dockerfile
FROM alpine:3.4

RUN apk update && \
    apk add curl && \
    apk add vim && \
    apk add git
```

#### Adding Packages
It’s always advisable to put `apt-get update` and `apt-get install` commands on the same line because of [this](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#apt-get).

#### Upgrading Packages
Avoid `RUN apt-get upgrade` and `dist-upgrade`, as many of the "essential" packages from the parent images cannot upgrade inside an [unprivileged container](https://docs.docker.com/engine/reference/run/#security-configuration). If a package contained in the parent image is out-of-date, contact its maintainers. If you know there is a particular package, foo, that needs to be updated, use `apt-get update && apt-get install -y foo` to update automatically.


#### Build Workflow
 1. Pick the right base image.
 2. Go into shell and build your environment step by step using:
    ``` sh
    # use /bin/sh on Alpine
    docker run --rm -ti <tag> /bin/bash
    ```
 3. Add verified steps into the Dockerfile.
 4. Repeat steps 2 and 3 until complete.

### Docker Compose Commands
#### Docker Compose
```sh
# build images
docker-compose build

# build missing images & run containers
docker-compose up

# re-build images if Dockerfile or image files have changed
docker-compose up --build

# start in detached mode
docker-compose up -d

# stop containers
docker-compose down

# list containers
docker-compose ps

# access all container logs
docker-compose logs

# push images to registry
docker-compose push

# pull images into a new machine
docker-compose pull
```

### Docker Compose File Tips
#### `build`
`build` can be specified either as a string containing a path to the build context:
``` yml
version: "3"
services:
  webapp:
    # dockerfile path of the image
    build: <context_path>
```

``` yml
version: "3"
services:
  webapp:
    build:
      # dockerfile path of the image
      context: <context_path>
      # environment variables accessible only during the build process
      args:
        buildno: <arg1>
        gitcommithash: <arg2>
```

#### `image`
If the image does not exist, Compose attempts to pull it, unless you have also specified build, in which case it builds it using the specified options and tags it with the specified tag.
``` yml
version: "3"
services:
  redis:
    # attempt to pull 'redis' if it does not exist
    image: redis
```
``` yml
version: "3"
services:
  webapp:
      build: <context_path>
      # tag the built image
      image: <username>/<repository>:<version> 
```

#### `command`
``` yml
services:
  some-service:
    # overrides the default CMD in Dockerfile
    command: <command> 
```

#### `container_name`
``` yml
services:
  some-service:
    # specify a custom container name, rather than a generated default name
    container_name: <name> 
```

#### `depends_on`
 * `docker-compose up` starts services in dependency order. In the following example, `db` and `redis` are started before web.

 * `docker-compose up SERVICE` automatically includes `SERVICE`’s dependencies. In the following example, `docker-compose up web` also creates and starts `db` and `redis`

``` yml
version: "3"
services:
  web:
    build: .
    depends_on:
      - db
      - redis
  redis:
    image: redis
  db:
    image: postgres
```

#### `entrypoint`
``` yml
services:
  some-service:
    # overrides the default ENTRYPOINT and ignores the CMD instruction in dockerfile
    entrypoint: <entrypoint> 
```

#### `env_file`
Add environment variables from a file. Can be a single value or a list:
``` yml
services:
  some-service:
    env_file: <path_to_env_file>
```
``` yml
services:
  some-service:
    env_file:
    - <path_to_env_file_1>
    - <path_to_env_file_2>
    - <path_to_env_file_3>
```

Compose expects each line in an env file to be in `VAR=VAL` format. Lines beginning with `#` are treated as comments and are ignored. Blank lines are also ignored:
``` sh
# Set Rails/Rack environment
RACK_ENV=development
```

#### `environment`
Add environment variables. You can use either an array or a dictionary. Any boolean values; `true`, `false`, `yes`, `no`, need to be enclosed in quotes to ensure they are not converted to `True` or `False` by the YML parser.

Environment variables with only a key are resolved to their values on the machine Compose is running on, which can be helpful for secret or host-specific values.
``` yml
services:
  some-service:
    environment:
      RACK_ENV: development
      SHOW: 'true'
      SESSION_SECRET:
```

#### `expose`
Expose ports without publishing them to the host machine - they’ll only be accessible to linked services. Only the internal port can be specified.
``` yml
services:
  some-service:
    expose:
    - "3000"
    - "8000"
```

#### `networks`
Networks to join, referencing entries under the top-level `networks` key:
``` yml
services:
  some-service:
    networks:
     - some-network
     - other-network
```


#### `ports`
Either specify both ports `(HOST:CONTAINER)`
``` yml
ports:
 - "8000:8000"
 - "49100:22"
```

#### `volumes`
You can mount a host path as part of a definition for a single service, and there is no need to define it in the top level `volumes` key.
But, if you want to reuse a volume across multiple services, then define a named volume in the top-level `volumes` key. 
``` yml
version: "3"
services:
  web:
    image: nginx:alpine
    # long syntax
    volumes:
      - type: volume
        source: mydata
        target: /data
        volume:
          nocopy: true
      - type: bind
        source: ./static
        target: /opt/app/static

  db:
    image: postgres:latest
    # short syntax
    volumes:
      - "/var/run/postgres/postgres.sock:/var/run/postgres/postgres.sock"
      - "dbdata:/var/lib/postgresql/data"

# named volumes must be listed here
volumes:
  mydata:
  dbdata:
```

**Short Syntax:**
``` yml
volumes:
  # Just specify a path and let the Engine create a volume
  - /var/lib/mysql

  # Specify an absolute path mapping
  - /opt/data:/var/lib/mysql

  # Path on the host, relative to the Compose file
  - ./cache:/tmp/cache

  # User-relative path
  - ~/configs:/etc/configs/:ro

  # Named volume
  - datavolume:/var/lib/mysql
```

**Long Syntax:**

The long form syntax allows the configuration of additional fields that can’t be expressed in the short form.

| key       | description |
|:----------|:------------|
| type      | mount type `volume`, `bind` or `tmpfs` |
| source    | source of the mount, or the name of a volume defined in the top-level `volumes` key |
| target    | path in the container where the volume is mounted |
| read_only | flag to set the volume as read-only |
| volume    | configure additional volume options |
| nocopy    | flag to disable copying of data from a container when a volume is created |

Here’s an example of a two-service setup where a database’s data directory is shared with another service as a volume so that it can be periodically backed up:
``` yml
version: "3"

services:
  db:
    image: db
    volumes:
      - data-volume:/var/lib/db
  backup:
    image: backup-service
    volumes:
      - data-volume:/var/lib/backup/data

volumes:
  data-volume:
```

#### `external`
If set to true, specifies that this volume has been created outside of Compose. `docker-compose up` does not attempt to create it, and raises an error if it doesn’t exist.

In the example below, instead of attempting to create a volume called `[projectname]_data`, Compose looks for an existing volume simply called `data` and mount it into the `db` service’s containers.
``` yml
version: "3"

services:
  db:
    image: postgres
    volumes:
      - data:/var/lib/postgresql/data

volumes:
  data:
    external: true
```


#### `network_mode`
``` yml
services:
  some-service::
    # network_mode: host -> do not use isolated network
    network_mode: <mode>
```

