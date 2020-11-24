test:
	nix-shell -A shells.ghc --run "cabal new-test all"

build:
	nix-shell -A shells.ghc --run "cabal new-build all"
	make test

build-js:
	nix-shell -A shells.ghcjs --run "cabal --project-file=cabal-ghcjs.project --builddir=dist-ghcjs new-build all"
	make test

repl-frontend:
	nix-shell -A shells.ghc --run "cabal new-repl exe:frontend"

repl-backend:
	nix-shell -A shells.ghc --run "cabal new-repl exe:backend"

ghcid-frontend:
	nix-shell -A shells.ghc --run "ghcid -c \"cabal new-repl exe:frontend\""

ghcid-backend:
	nix-shell -A shells.ghc --run "ghcid -c \"cabal new-repl exe:backend\""

ghcid-test-frontend:
	nix-shell -A shells.ghc --run "ghcid -c \"cabal new-repl test:frontend-test\""

ghcid-test-backend:
	nix-shell -A shells.ghc --run "ghcid -c \"cabal new-repl test:backend-test\""

ghcid-test-common:
	nix-shell -A shells.ghc --run "ghcid -c \"cabal new-repl test:common-test\""

clean:
	rm -fR dist dist-*
