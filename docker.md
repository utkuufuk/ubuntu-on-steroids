## Docker Cheatsheet
 1. [Docker Commands](#docker-commands)
 2. [Dockerfile Tips](#dockerfile-tips)
 3. [Docker Compose Commands](#docker-compose-commands)

### Docker Commands
#### List Images / Containers
```sh
# list all images
docker images

# list all images (including intermediate)
docker images -a

# list running containers
docker container ls

# list all containers
docker container ls -a

# inspect a container
docker inspect <container_id>
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

#### Remove Images / Containers
```sh
# remove container from machine
docker container rm <hash>

# remove image from machine
docker image rm <image_id>
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

#### Public Registry
```sh
# login to public registry
docker login

# logout from public registry
docker logout

# upload image to public registry
docker push <username>/<repository>:<tag>
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
