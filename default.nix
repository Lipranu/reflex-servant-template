let reflex-platform = import ./reflex-platform.nix {};
in  reflex-platform.project (i: {

  withHoogle = false;

  packages = {
    frontend = ./frontend;
    backend = ./backend;
    common = ./common;
  };

  shells = {
    ghc = ["frontend" "common" "backend"];
    ghcjs = ["frontend" "common"];
  };

})
