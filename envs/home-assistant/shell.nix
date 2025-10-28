{ pkgs ? import <nixpkgs> {}
, extraPkgs ? []
}:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    bashInteractive
    pkg-config
    autoreconfHook
    python313
    libjpeg
    libxslt
    doxygen
    graphviz
    isa-l
    zlib
  ];
  # fix homeassistant-pyozw build
  NIX_CFLAGS_COMPILE = [ "-Wno-error=format-security" ];
  LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [ stdenv.cc.cc libjpeg ];
  buildInputs = with pkgs; [
    cacert
    libxml2
    openssl
    libxslt
    libffi
    udev
    ffmpeg
  ] ++ extraPkgs;
}
