# MMTk/V8 Dockerfile

## Getting Started

### Build docker image

```console
$ docker image build -t mmtk-v8 .
```

### Start a container

```console
$ docker container run mmtk-v8 # directly executes `gm x64.optdebug-mmtk.checkall`
```

Or,

```console
$ docker container run -it mmtk-v8 bash
root@70f9de71f77b:~/mmtk-v8-workspace# make check
```