let
  pkgs = import <nixpkgs> { };
  stdenv = pkgs.llvmPackages_13.stdenv;
in

pkgs.stdenv.mkDerivation
{
  name = "elm-pos";
  version = "0.1.0";

  buildInputs = with pkgs; [
    clang
    zlib
    elmPackages.elm
    sqlite
    minify
  ];

  buildPhase = ''
    elm make --optimize src/Main.elm --output elm.js
    minify elm.js > elm.min.js
  '';

  meta = {
    description = "PoS (point of sale) frontend in elm";
    license = "BSD";
  };
}

