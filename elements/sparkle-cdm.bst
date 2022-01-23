kind: meson

build-depends:
- freedesktop-sdk.bst:components/appstream-glib.bst
- freedesktop-sdk.bst:components/flex.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/gstreamer.bst

environment:
  PKG_CONFIG_PATH: "%{libdir}/pkgconfig:%{datadir}/pkgconfig"
  CXXFLAGS: "%{target_flags} -std=gnu++17"

variables:
  optimize-debug: "false"
  app-id: >-
    org.freedesktop.Platform.sparkle-cdm

  meson-local: >-
    -Db_ndebug=true
    -Dsample-player=disabled

config:
  install-commands:
    (>):
    - |
      set -e
      dest_dir=%{install-root}%{datadir}/appdata
      mkdir -p ${dest_dir}
      CURRENT_REF=$(git rev-parse --short HEAD)
      TIMESTAMP=$(git log -1 --format="%at" ${CURRENT_REF})
      VERSION_DATE=$(date -d @"$TIMESTAMP" -Idate)
      for app_id in %{app-id}
      do
        m4 -D__VERSION__=${CURRENT_REF} -D__VERSION_DATE__=${VERSION_DATE} \
        -D__APP_ID__=${app_id} \
          appdata.template > ${dest_dir}/${app_id}.appdata.xml
        appstream-compose --basename ${app_id} \
          --prefix=%{install-root}%{prefix} --origin=flatpak ${app_id}
      done

sources:
- kind: git_tag
  url: https://github.com/Sparkle-CDM/sparkle-cdm.git
  track: main
  ref: d36516479b4eb2bcda9e584e50e3cde2941d6316
- kind: local
  path: files/sparkle-cdm/appdata.template
