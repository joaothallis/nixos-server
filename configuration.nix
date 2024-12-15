{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix

  ];

  services.tailscale.enable = true;

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "live_media" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
  };

  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  networking.hostName = "nixos";
  networking.domain = "";
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [
    ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIywXCJvuYxPSDXk/tNY+pTCyJW+bXbZtJ3YQH/jDNHp joao@Joaos-MacBook-Pro.local''
  ];
  system.stateVersion = "23.11";
}
