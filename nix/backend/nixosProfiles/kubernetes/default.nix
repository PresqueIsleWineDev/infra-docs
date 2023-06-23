{inputs,cell,...}: {
  imports = [
    cell.nixosProfiles.kubernetes.node
  ];
}
