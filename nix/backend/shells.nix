{ inputs
, cell
}:
let
  l = nixpkgs.lib // builtins;
  inherit (inputs) nixpkgs;
in l.mapAttrs (_: inputs.std.mkShell) rec {
  clusterAdmin = {
    name = "Cluster Administration";
    imports = [
      cell.devshellProfiles.kubeadm
      cell.devshellProfiles.kubectl
      inputs.std.devshellProfiles.default  # Make `std` available in the `numtide/devshell`
    ];
  };
  default = clusterAdmin;
}
