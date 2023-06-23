{inputs,cell,...}:
let
  inherit (inputs.nixpkgs) pkgs;
in
{

  imports = [ cell.nixosProfiles.k3s.common ];

  networking.firewall.allowedTCPPorts = [ 6443 ];
  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = toString [
      # "--kubelet-arg=v=4"  # Optionally add additional args to k3s
    ];
  };
  environment.systemPackages = [ pkgs.k3s ];

  # pkgs.k3s doesnt include pkg required by network policy controller: ipset
  # so we manually add it.
  systemd.services.k3s.path = [ pkgs.ipset ];
}
