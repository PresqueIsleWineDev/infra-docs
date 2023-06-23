#{ inputs, cell, ... }:
{ cell
, ...
}: {
  imports = [ cell.nixosProfiles.kubernetes.common ];
  services.kubernetes.kubelet.extraOpts = "--fail-swap-on=false";
}
