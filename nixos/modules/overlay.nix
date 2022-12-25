{
  imports = [
    ./services/x11/window-managers/default.nix
    ./services/x11/xserver.nix
  ];

  nixpkgs.overlays = [ (import ../../overlays).default ];
}
