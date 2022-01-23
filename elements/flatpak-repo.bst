kind: flatpak_repo

build-depends:
- freedesktop-sdk.bst:components/flatpak-minimal.bst
- sparkle-cdm-extension.bst

(@): elements/config.yml

config:
  arch: "%{flatpak_arch}"
  repo-mode: archive
  branch: '%{branch}'
  environment:
  - components/flatpak-minimal.bst
