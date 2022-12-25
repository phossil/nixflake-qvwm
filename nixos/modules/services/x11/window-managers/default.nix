{ config, lib, ... }:

with lib;

let
  cfg = config.services.xserver.windowManager;
in

{
  imports = [
    ./qvwm.nix
  ];
}
