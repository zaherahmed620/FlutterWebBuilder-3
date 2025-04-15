{pkgs}: {
  deps = [
    pkgs.pkg-config
    pkgs.cmake
    pkgs.clang
    pkgs.curl
    pkgs.which
    pkgs.unzip
    pkgs.xz
    pkgs.git
    pkgs.wget
  ];
}
