{ config, lib, pkgs, ... }:

let

  inherit (lib) mkIf mkOption types;

in

{
  options.uninstall = mkOption {
    type = types.bool;
    default = false;
    visible = false;
    description = ''
      Whether to set up a minimal configuration that will remove all managed
      files and packages.
    '';
  };

  config = mkIf config.uninstall {
    home.packages = lib.mkForce [];
    home.file = lib.mkForce {};
    home.stateVersion = lib.mkForce "23.11";
    home.enableNixpkgsReleaseCheck = lib.mkForce false;
    manual.manpages.enable = lib.mkForce false;
  };
}
