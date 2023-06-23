#{inputs,cell,...}:
{cell,...}: {
  imports = [ cell.nixosProfiles.kubernetes.common ];
  services.kubernetes = {
    roles = ["node"];
  };
}
