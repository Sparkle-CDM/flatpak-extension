kind: flatpak_image

build-depends:
- sparkle-cdm.bst

(@): elements/config.yml

config:
  include:
  - runtime
  - debug
  - devel
  directory: "%{prefix}"
  metadata:
    Runtime:
      name: org.freedesktop.Platform.sparkle-cdm
      runtime: org.freedesktop.Platform/x86_64/%{branch}
      sdk: org.freedesktop.Sdk/%{arch}/%{branch}
