{
  description = "package and nixosModule of QVWM";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    (flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        nurPkgs = import ./pkgs (pkgs // nurPkgs) pkgs;
      in
      rec {
        packages = flake-utils.lib.filterPackages system (flake-utils.lib.flattenTree nurPkgs);
        checks = packages;
      })) // {
      overlays = import ./overlays;
    };
}
