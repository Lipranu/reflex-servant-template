{ mkDerivation, base, bytestring, case-insensitive, containers
, data-default, exceptions, fetchgit, ghcjs-dom, http-api-data
, http-media, jsaddle, mtl, network-uri, reflex, reflex-dom-core
, safe, servant, servant-auth, stdenv, string-conversions, text
, transformers
}:
mkDerivation {
  pname = "servant-reflex";
  version = "0.3.6";
  src = fetchgit {
    url = "https://github.com/imalsogreg/servant-reflex";
    sha256 = "0issnp95rnji3v9qifr0brypxsvmjkzanfq5lscj68lynnjv37g0";
    rev = "1109043c8437a375fc00bb48792e8dc377a84494";
    fetchSubmodules = true;
  };
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base bytestring case-insensitive containers data-default exceptions
    ghcjs-dom http-api-data http-media jsaddle mtl network-uri reflex
    reflex-dom-core safe servant servant-auth string-conversions text
    transformers
  ];
  description = "servant API generator for reflex apps";
  license = stdenv.lib.licenses.bsd3;
}
