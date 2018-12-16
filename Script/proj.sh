#!/bin/sh
PROGRAMMING="$HOME/Documents/Programming"
PROJECT="$HOME/Documents/Project"
AXECT="https://github.com/Axect/"

if [ ! -d "$PROGRAMMING" ]; then
  mkdir $PROGRAMMING
  cd $PROGRAMMING
  git clone "${AXECT}Asymptote"
  git clone "${AXECT}Crystal"
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
  git clone "${AXECT}Lua"
  git clone "${AXECT}Cpp"
  git clone "${AXECT}C"
  git clone "${AXECT}Sage"
  git clone "${AXECT}JS"
  git clone "${AXECT}Scheme"
  git clone "${AXECT}Racket"
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
  mkdir "Study"
  mkdir "Machine_Learning"
  mkdir "R_Project"
  mkdir "Nim_Project"

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

  cd "$PROJECT/D_Project"
  git clone "${AXECT}DNumeric"
  git clone "${AXECT}FPTools"

  cd "$PROJECT/Rust_Project"
  git clone "${AXECT}Peroxide"
  git clone "${AXECT}Bench"
  git clone "${AXECT}Music_Tournament"
  git clone "${AXECT}RGE_Peroxide"
  git clone "${AXECT}Example_Peroxide"

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

  cd "$PROJECT/Study"
  git clone "${AXECT}Physics2018"
  
  cd "$PROJECT/Machine_Learning"
  git clone "${AXECT}ML_Project"

  cd "$PROJECT/R_Project"
  git clone "${AXECT}R_Yeji"

  cd "$PROJECT/Nim_Project"
  git clone "${AXECT}NiMusic"

  cd "$PROJECT"
fi


