{inputs, cell, ...}: {
  imports = [ cell.nixosProfiles.k3s.single-node ];
}
