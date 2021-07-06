# MMTk/V8 Dockerfile

## Getting Started

### Build docker image

*This will fetch the latest v8 and mmtk-v8 repo.*

```console
$ docker image build -t mmtk-v8 .
```

### Start a container

*Start a container and directly run v8 tests:*

```console
$ docker container run mmtk-v8 # directly executes `gm x64.optdebug-mmtk.checkall`
```

*Or, run tests manually in a container:*

```console
$ docker container run -it mmtk-v8 bash
root@70f9de71f77b:~/mmtk-v8-workspace# make check
```
