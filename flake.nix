{
  description = "package of Qvwm";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.callPackage ./derivation.nix { };

      devShells.${system}.default = pkgs.mkShell {
        # use 'buildInputs' if using 'devEnv'
        inputsFrom = [ self.packages.${system}.default ];
      };
    };
}