let reflex-platform = import ./reflex-platform.nix {};
in  reflex-platform.project ({ pkgs, ... }: {

  withHoogle = false;
  useWarp = true;

  packages = {
    frontend = ./frontend;
    backend = ./backend;
    common = ./common;
  };

  shells = {
    ghc = ["frontend" "common" "backend"];
    ghcjs = ["frontend" "common"];
  };

  overrides = self: super: {
    servant-reflex = self.callPackage ./servant-reflex.nix { };
  };

  shellToolOverrides = self: super: {
      cabal2nix = pkgs.haskellPackages.cabal2nix;
  };

})
