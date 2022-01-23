# Sparkle-CDM Flatpak extension

## Build

If you have [BuildStream](https://buildstream.build/) installed already:

```shell
$ make final-repo
```

Otherwise, to build from a toy container with [Toolbx](https://containertoolbx.org), first create the toolbox:

```shell
podman build -t sparkle-cdm:scv1 .
toolbox -y create -c sparkle-cdm-v1 --image sparkle-cdm:scv1
```

Then build the repo:

```shell
make BST_BIN="toolbox run -c sparkle-cdm-v1 bst" final-repo
```
