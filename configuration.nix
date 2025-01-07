{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix

  ];

  services.tailscale.enable = true;

  systemd.services.tailscale-funnel-node-exporter = {
    description = "Tailscale Funnel live_media";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.tailscale}/bin/tailscale funnel 4000";
      Restart = "on-failure";
    };
    wantedBy = [ "multi-user.target" ];
  };

  environment.systemPackages = with pkgs; [
    git
    elixir
  ];
  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;
  networking.hostName = "nixos";
  networking.domain = "";
  services.openssh.enable = true;
  users.users = {
    root.openssh.authorizedKeys.keys = [
      ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIywXCJvuYxPSDXk/tNY+pTCyJW+bXbZtJ3YQH/jDNHp joao@Joaos-MacBook-Pro.local''
      ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO/zA4tBQIJTlEyqlrBtHL6G92BSyF7igftzb3zk1zvG claudionts@gmail.com''
    ];

    github = {
      isNormalUser = true;
      description = "GitHub Deployment User";
      home = "/home/github";
      openssh.authorizedKeys.keys = [
        ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIywXCJvuYxPSDXk/tNY+pTCyJW+bXbZtJ3YQH/jDNHp joao@Joaos-MacBook-Pro.local''
      ];
    };
  };
  system.stateVersion = "23.11";
}
