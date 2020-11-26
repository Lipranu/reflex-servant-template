{ pkgs ? import <nixpkgs> {} }:
let
  reflex-platform = pkgs.fetchFromGitHub {
    owner = "reflex-frp";
    repo = "reflex-platform";
    rev = "097e0ef01539f1ba23bd6a4e2aaedc7d2b114a26";
    sha256  = "0998wvqb8fv1ng5mbs0d7iivvgkbc6f5wahb6nhf42m79vcgbw2i";
  };
in import reflex-platform {}
