{
  description = "package and nixosModule of QVWM";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
  };

  outputs = inputs @ { self, nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      genSystems = lib.genAttrs [
        "aarch64-linux"
        "x86_64-linux"
      ];

      pkgsFor = nixpkgs.legacyPackages;
    in
    {
      overlays.default = _: prev: rec {
        qvwm = prev.callPackage ./pkgs { };
      };

      packages = genSystems (system:
        (self.overlays.default null pkgsFor.${system})
        // {
          default = self.packages.${system}.qvwm;
        });
      #nixosModules.default = import ./nix/module.nix inputs;
    };
}
