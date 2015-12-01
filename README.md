centos-mock-docker
==================

An example of using [Mock - FedoraProject](https://fedoraproject.org/wiki/Mock) on CentOS 7 to build RPMs.
In this example, I rebuild a rpm of [highway](https://github.com/tkengo/highway)

## Usage

Build the docker container.

```
docker build -t mock .
```

Start the container. The `--privileged` option is needed to use `mock` command.

```
docker run --privileged -it mock
```

In the container, run the following commands.

```
su - mockbuild
./bin/build-highway.sh
```

The build results and logs are created in `/var/lib/mock/epel-7-x86_64/result/`

```
[mockbuild@7ea0955ef645 ~]$ ls -l /var/lib/mock/epel-7-x86_64/result/
total 1108
-rw-rw-r-- 1 mockbuild mock  31533 Dec  1 17:24 build.log
-rw-rw-r-- 1 mockbuild mock 314716 Dec  1 17:24 highway-1.1.0-1.el7.centos.src.rpm
-rw-rw-r-- 1 mockbuild mock 131272 Dec  1 17:24 highway-1.1.0-1.el7.centos.x86_64.rpm
-rw-rw-r-- 1 mockbuild mock 451168 Dec  1 17:24 highway-debuginfo-1.1.0-1.el7.centos.x86_64.rpm
-rw-rw-r-- 1 mockbuild mock 189962 Dec  1 17:24 root.log
-rw-rw-r-- 1 mockbuild mock    812 Dec  1 17:24 state.log
```

## NOTE
It is preferrable to keep this container between building multiple RPMs since `mock` caches yum results.
See [Using Mock to test package builds - FedoraProject](https://fedoraproject.org/wiki/Using_Mock_to_test_package_builds).
