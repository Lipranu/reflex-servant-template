let reflex-platform = import ./reflex-platform.nix {};
in  reflex-platform.project (i: {

  withHoogle = false;

  packages = {
  };

  shells = {
    ghc = [];
    ghcjs = [];
  };

})
