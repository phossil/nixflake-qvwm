final: prev:

with final;

let
  callPackage = prev.newScope final;
in
{
  inherit callPackage;

  qvwm = callPackage ./applications/window-managers/qvwm { };
}
