#!/bin/sh
PROGRAMMING="$HOME/Documents/Programming"
PROJECT="$HOME/Documents/Project"
AXECT="https://github.com/Axect/"

if [ ! -d "$PROGRAMMING" ]; then
  mkdir $PROGRAMMING
  cd $PROGRAMMING
  git clone "${AXECT}Haskell"
  git clone "${AXECT}Rust"
  git clone "${AXECT}Go"
  git clone "${AXECT}Scala"
  git clone "${AXECT}Julia"
  git clone "${AXECT}Nim"
  git clone "${AXECT}R"
  git clone "${AXECT}Chapel"
  git clone "${AXECT}Idris"
  git clone "${AXECT}Prolog"
  git clone "${AXECT}Elm"
  git clone "${AXECT}Elixir"
fi

if [ ! -d "$PROJECT" ]; then
  mkdir $PROJECT
  cd $PROJECT
  mkdir "Haskell_Project"
  mkdir "Rust_Project"
  mkdir "Go_Project"
  mkdir "Lectures"
  mkdir "Server"

  git clone "${AXECT}Euler"
  git clone "${AXECT}Academy"

  cd "Haskell_Project"
  git clone "${AXECT}HNumeric"
  git clone "${AXECT}Hubble"
  git clone "${AXECT}HTEPS"
  git clone "${AXECT}HRemember"
  git clone "${AXECT}HWord"
  git clone "${AXECT}Lorentz-Test"
  git clone "${AXECT}Vim-Haskell-Manual"

  cd "../Rust_Project"
  git clone "${AXECT}Peroxide"

  cd "../Go_Project"
  git clone "${AXECT}RGE"
  git clone "${AXECT}Numeric"
  git clone "${AXECT}HEP_CS"
  git clone "${AXECT}check"

  cd "../Lectures"
  git clone "${AXECT}MLStudy"
  git clone "${AXECT}FPfS"
  git clone "${AXECT}FP-Lecture"
  git clone "${AXECT}THLecture"

  cd "../Server"
  git clone "${AXECT}HEP_Web_Django"
  git clone "${AXECT}HEP-COSMO"
fi


