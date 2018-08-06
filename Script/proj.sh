#!/bin/sh
PROGRAMMING="$HOME/Documents/Programming"
PROJECT="$HOME/Documents/Project"
AXECT="https://github.com/Axect/"

if [ ! -d "$PROGRAMMING" ]; then
  mkdir $PROGRAMMING
  cd $PROGRAMMING
  git clone "${AXECT}Haskell"
  git clone "${AXECT}D"
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
  mkdir "D_Project"
  mkdir "Rust_Project"
  mkdir "Go_Project"
  mkdir "Lectures"
  mkdir "Server"

  git clone "${AXECT}Euler"
  git clone "${AXECT}Academy"
  git clone "${AXECT}ML_Project"

  cd "Haskell_Project"
  git clone "${AXECT}HNumeric"
  git clone "${AXECT}Hubble"
  git clone "${AXECT}HTEPS"
  git clone "${AXECT}HRemember"
  git clone "${AXECT}HWord"
  git clone "${AXECT}Lorentz-Test"
  git clone "${AXECT}Vim-Haskell-Manual"

  cd "$PROJECT/D_Project"
  git clone "${AXECT}DNumeric"

  cd "$PROJECT/Rust_Project"
  git clone "${AXECT}Peroxide"

  cd "$PROJECT/Go_Project"
  git clone "${AXECT}RGE"
  git clone "${AXECT}Numeric"
  git clone "${AXECT}HEP_CS"
  git clone "${AXECT}check"

  cd "$PROJECT/Lectures"
  git clone "${AXECT}MLStudy"
  git clone "${AXECT}FPfS"
  git clone "${AXECT}FP-Lecture"
  git clone "${AXECT}THLecture"
  git clone "${AXECT}QFT2018"

  cd "$PROJECT/Server"
  git clone "${AXECT}HEP_Web_Django"
  git clone "${AXECT}HEP-COSMO"

  cd "$PROJECT"
fi


