stack build
stack haddock

cabal build
cabal haddock --for-hackage
cabal sdist

echo "Input Version"
read ver

cabal upload dist/HNumeric-${ver}.tar.gz
cabal upload -d

git add --all

echo "Input Commit Message"
read msg

git commit -am $msg

git push
