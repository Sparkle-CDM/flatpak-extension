kind: junction

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: 'release/21.08'
  ref: freedesktop-sdk-21.08.9-25-gfb49cd02a3869721e08be44e068979ce98da6da6
  submodules:
    utils/buildstream-abi-checker:
      url: gitlab:freedesktop-sdk/buildstream-abi-checker.git
      checkout: false

config:
  options:
    bootstrap_build_arch: "%{arch}"
    target_arch: "%{arch}"
    (?):
    - target_arch == 'i686':
        bootstrap_build_arch: 'x86_64'
    - target_arch == 'arm':
        bootstrap_build_arch: 'aarch64'
