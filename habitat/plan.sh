pkg_name=talloc
pkg_origin=defilan
pkg_version="2.1.12"
pkg_maintainer="Chris Maher <chris@mahercode.io>"
pkg_license=("GPL-3.0")
pkg_source="https://www.samba.org/ftp/talloc/talloc-${pkg_version}.tar.gz"
pkg_shasum="987c0cf6815e948d20caaca04eba9b823e67773f361ffafe676e24b953cc604b"
pkg_build_deps=(core/gcc core/make core/python2 core/coreutils)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

do_prepare() {
  # The `/usr/bin/env` path is hardcoded, so we'll add a symlink if needed.
  if [[ ! -r /usr/bin/env ]]; then
    ln -sv "$(pkg_path_for coreutils)/bin/env" /usr/bin/env
  fi
}

do_check(){
  make tests
}

