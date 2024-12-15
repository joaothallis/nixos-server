# NixOS Server

To update server configuration:

```bash
rsync configuration.nix hardware-configuration.nix nixos-server:/etc/nixos/
ssh nixos-server nixos-rebuild switch
```
