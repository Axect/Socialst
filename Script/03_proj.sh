#!/bin/sh
PROGRAMMING="$HOME/Documents/Programming"
PROJECT="$HOME/Documents/Project"
TEMPLATE="$HOME/Documents/Template"
TEST="$HOME/Documents/Test"
AXECT="https://github.com/Axect/"
SYTEARK="https://github.com/SYTEARK/"

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
#  git clone "${AXECT}TypeScript"
  git clone "${AXECT}Racket"
  git clone "${AXECT}Zig"
fi

if [ ! -d "$PROJECT" ]; then
  mkdir $PROJECT
  cd $PROJECT
  mkdir "Blog"
  mkdir "Haskell_Project"
  mkdir "D_Project"
  mkdir "Rust_Project"
  mkdir "Go_Project"
  mkdir "Lectures"
  mkdir "Server"
  mkdir "Study"
  mkdir "Research"
  mkdir "Machine_Learning"
  mkdir "R_Project"
  mkdir "Nim_Project"
  mkdir "Julia_Project"
  mkdir "SYTEARK"

  git clone "${AXECT}Euler"
  git clone "${AXECT}Academy"

  cd "$PROJECT/Blog"
  git clone "${AXECT}blog"
  git clone "${AXECT}axect.github.io"
  git clone "${AXECT}Notes"
  git clone "${AXECT}Slides"

  cd "$PROJECT/Haskell_Project"
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
  git clone "${AXECT}advent-of-code-2022"
  git clone "${AXECT}Acalc"
  git clone "${AXECT}Peroxide"
  git clone "${AXECT}Puruda"
  git clone "${AXECT}Puruspe"
  git clone "${AXECT}Bench"
  git clone "${AXECT}Music_Tournament"
  git clone "${AXECT}Peroxide_Doc"
  git clone "${AXECT}Peroxide_Gallery"
  git clone "${AXECT}Rustube"
  git clone "${AXECT}Scientific_Bench"
  git clone "${AXECT}Woroxide"
  git clone "${AXECT}Yonsei-Flexible"

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
  git clone "${AXECT}Cpp_Lecture"
  git clone "${AXECT}PL2020"

  cd "$PROJECT/Server"
  git clone "${AXECT}HEP_Web_Django"
  git clone "${AXECT}HEP-COSMO"

  cd "$PROJECT/Study"
  git clone "${AXECT}Physics2018"
  git clone "${AXECT}Grad2019"
  git clone "${AXECT}Physics2019"

  cd "$PROJECT/Research"
  git clone "${AXECT}NSCool"
  git clone "${AXECT}WhiteEagle"
  git clone "${AXECT}white_owl"
  git clone "${AXECT}fig_for_paper"

  cd "$PROJECT/Machine_Learning"
  git clone "${AXECT}ML_Project"
  git clone "${AXECT}ML2020"
  git clone "${AXECT}ML_with_Rust"
  git clone "${AXECT}NMC2020"
  git clone "${AXECT}MLTest"

  cd "$PROJECT/R_Project"
  git clone "${AXECT}R_Yeji"

  cd "$PROJECT/Nim_Project"
  git clone "${AXECT}NiMusic"

  cd "$PROJECT/Julia_Project"
  git clone "${AXECT}Acalc.jl"

  cd "$PROJECT/SYTEARK"
  git clone "${SYTEARK}ML2021"

  cd "$PROJECT"
fi

if [ ! -d "$TEMPLATE" ]; then
    mkdir $TEMPLATE
    cd $TEMPLATE
    git clone "${AXECT}Eisvogel_Template"
    git clone "${AXECT}Latex_Template"
    git clone "${AXECT}Remark_Template"
    git clone "${AXECT}Mail_Signature"
    cd "$HOME/Documents"
fi

if [ ! -d "$TEST" ]; then
    git clone "${AXECT}Test"
fi
