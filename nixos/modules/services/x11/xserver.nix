{ config, lib, utils, pkgs, ... }:

with lib;

let
  # Abbreviations.
  cfg = config.services.xserver;
  xorg = pkgs.xorg;
in

{
  imports = [
    ./window-managers/default.nix
  ];
}
