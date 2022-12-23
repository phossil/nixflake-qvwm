{
  description = "package and nixosModule of QVWM";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        packages = flake-utils.lib.flattenTree {
          qvwm = pkgs.callPackage ./pkgs;
        };
        devShells.default = with pkgs; (mkShell {
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
      });
}
