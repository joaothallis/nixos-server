{ ... }:
{
  imports = [
    ./hardware-configuration.nix

  ];

  services.tailscale.enable = true;

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
