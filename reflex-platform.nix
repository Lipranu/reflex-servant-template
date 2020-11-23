# Reflex Platform release 0.6.1.0
{ pkgs ? import <nixpkgs> {} }:
let
  reflex-platform = pkgs.fetchFromGitHub {
    owner = "reflex-frp";
    repo = "reflex-platform";
    rev = "673c2622b288504bb57006e6b440d5240ce1865c";
    sha256  = "0ny8dah1s3amvs1h5k8j1zwzmh07a12af833b6g32cxf0qlj3v0l";
  };
in import reflex-platform {}
