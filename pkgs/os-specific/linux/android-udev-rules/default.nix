{ lib, stdenv, fetchFromGitHub }:

## Usage
# In NixOS, simply add this package to services.udev.packages:
#   services.udev.packages = [ pkgs.android-udev-rules ];

stdenv.mkDerivation rec {
  pname = "android-udev-rules";
  version = "20230104";

  src = fetchFromGitHub {
    owner = "M0Rf30";
    repo = "android-udev-rules";
    rev = version;
    sha256 = "sha256-tbejLvig+eTG+DHAchWEMMydd6ePRKyfRVPp6uDhP70=";
  };

  installPhase = ''
    runHook preInstall
    install -D 51-android.rules $out/lib/udev/rules.d/51-android.rules
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/M0Rf30/android-udev-rules";
    description = "Android udev rules list aimed to be the most comprehensive on the net";
    platforms = platforms.linux;
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ abbradar ];
  };
}
