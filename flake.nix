{
  description = "package and nixosModule of QVWM";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowBroken = true;
        };
      in
      rec {
        devShell = with pkgs; (mkShell {
          nativeBuildInputs = [
            autoconf
            automake
            bison
            flex
            gettext
          ];
          buildInputs = with xorg; [
            libXpm
            libSM
            libXScrnSaver
            libICE
            libXext
            libXrender
          ] ++ [
            alsa-lib
            audiofile
            imlib
          ];
        });
        defaultPackage = pkgs.qvwm;
      });
}
