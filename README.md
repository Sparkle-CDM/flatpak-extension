# Sparkle-CDM Flatpak extension

## Build

If you have [BuildStream](https://buildstream.build/) installed already:

```shell
make final-repo
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

## Install

```shell

flatpak remote-add --if-no-exists sparkle-cdm https://sparkle-cdm.github.io/flatpak-extension/sparkle-cdm.flatpakrepo
flatpak install org.freedesktop.Platform.sparkle-cdm
```

The extension will then be enabled when running in the context of the
`org.webkit.Sdk` and `org.webkit.Platform` runtimes.
