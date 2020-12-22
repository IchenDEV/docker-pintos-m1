# Docker-Pintos-M1

For easy develop pintos on macOS in GB126016 OS 2020 Fall, ZJUT

## Base on

- [pintos development environment for KAIST CS330](https://github.com/sean-ahn/pintos-env)

## How to use on macOS

### Prerequisite

#### 1. Install docker & docker-compose

- [docker](https://docs.docker.com/install/)
- [docker-compose](https://docs.docker.com/compose/install/#install-compose)

#### 2. Build a image

``` bash
docker-compose build
```

### Start containers

```bash
docker-compose up
```

### Access container

```bash
docker exec -it pintos-dev bash
```

From now on, you are in a docker container.

```bash
root@{CONTAINER-ID}:~/pintos/src# ls
devices  examples  filesys  lib  LICENSE  Make.config  Makefile  Makefile.build  Makefile.kernel  Makefile.userprog  misc  tests  threads  userprog  utils  vm
root@{CONTAINER-ID}:~/pintos/src# cd threads
root@{CONTAINER-ID}:~/pintos/src/threads# make check
```

- You don't need to modify source code in this container. You can modify your code in host system.
- You have to compile source code in this container.

## Official websites

- [Pintos](https://web.stanford.edu/class/cs140/projects/pintos/pintos.html)

- [Docker](https://docs.docker.com/)

- [gdbgui](https://gdbgui.com/)

## Tested Host

- Apple M1 of MBP2020 with 16GB RAM
