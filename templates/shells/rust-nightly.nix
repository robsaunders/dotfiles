let
  moz_overlay = import (builtins.fetchTarball {
    src = "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz";
    sha256 = "1iq6fy50pv36zsd3qxbyjs3rn1x2541v8z74kcd3n0hqs6406xni";
  });
  nixpkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
in with nixpkgs;
stdenv.mkDerivation {
  name = "moz_overlay_shell";
  buildInputs = [ nixpkgs.latest.rustChannels.nightly.rust ];
}
