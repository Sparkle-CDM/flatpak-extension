kind: junction

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: 'release/21.08'
  ref: freedesktop-sdk-21.08.10-38-g12633126175aa7155643fd428b369206a2a8a5ce
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
