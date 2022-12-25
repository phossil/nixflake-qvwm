{
  default = final: prev:
    let
      nurPkgs = removeAttrs (import ../pkgs final prev) [
        "callPackage"
      ];
    in
    nurPkgs;
}
