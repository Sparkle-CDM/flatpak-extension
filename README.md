# Sparkle-CDM Flatpak extension

## Build

If you have [BuildStream](https://buildstream.build/) installed already:

```shell
make final-repo
```

Otherwise, setup pipenv:

```shell
pip3 install --user -U pipenv
pipenv install
```

Then build the repo:

```shell
make BST_BIN="pipenv run bst" final-repo
```

## Install

```shell

flatpak remote-add --if-no-exists sparkle-cdm https://sparkle-cdm.github.io/flatpak-extension/sparkle-cdm.flatpakrepo
flatpak install org.freedesktop.Platform.sparkle-cdm
```

The extension will then be enabled when running in the context of the
`org.webkit.Sdk` and `org.webkit.Platform` runtimes.

