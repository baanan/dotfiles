{
  stdenv,
  ncurses,
  systemd,
  hidapi,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "sdgyrodsu";
  version = "2.6";

  src = fetchFromGitHub {
    owner = "kmicki";
    repo = "SteamDeckGyroDSU";
    rev = "master";
    sha256 = "sha256-0fJPOvcfcxzLEoqgUPsNvgGDTOE7uy5YB7vwD0iEK6I=";
  };

  nativeBuildInputs = [
    ncurses
    systemd
    hidapi
  ];

  buildPhase = ''
    # ignore dependency check, since we're not using arch
    sed -i 's/prepare: ;/prepare: ;\n$\(CHECKDEPS): ;/g' Makefile
    # build without installing
    make release
  '';

  installPhase = ''
    mkdir -p $out/usr/local/bin/
    cp bin/release/sdgyrodsu $out/usr/local/bin/

    mkdir -p $out/etc/sdgyrodsu
    cp pkg/sdgyrodsu.service $out/etc/sdgyrodsu/
  '';

  NOPREPARE = "true";
}
