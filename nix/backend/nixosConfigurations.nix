{ inputs
, cell
}:
{
  # TODO: Consider moving to nixosSuites
  # TODO: Consider splitting nixosProfiles.master into profiles: apiserver, load-balancer, etc.

  # --- Master Nodes -----------------------------
  # --- Main Server ---
  kube-master-server-0 = {
    imports = with cell; with inputs.cells.workstations; [
      nixosSuites.kubernetes.node
      nixosSuites.kubernetes.master
      hardwareProfiles.server-main
    ];
  };

  # --- HP Prodesk ---
  kube-master-hp-prodesk-0 = {
    imports = with cell; with inputs.cells.workstations; [
      nixosSuites.kubernetes.node
      nixosSuites.kubernetes.master
      hardwareProfiles.hp-prodesk
    ];
  };
  kube-master-hp-prodesk-1 = {
    imports = with cell; with inputs.cells.workstations; [
      nixosSuites.kubernetes.node
      nixosSuites.kubernetes.master
      hardwareProfiles.hp-prodesk
    ];
  };

  # --- Worker Nodes -----------------------------
  # --- HP Prodesk ---
  kube-worker-hp-prodesk-0 = {
    imports = with cell; with inputs.cells.workstations; [
      nixosSuites.kubernetes.node
      hardwareProfiles.hp-prodesk
    ];
  };
  kube-worker-hp-prodesk-1 = {
    imports = with cell; with inputs.cells.workstations; [
      nixosSuites.kubernetes.node
      hardwareProfiles.hp-prodesk
    ];
  };
  kube-worker-hp-prodesk-2 = {
    imports = with cell; with inputs.cells.workstations; [
      nixosSuites.kubernetes.node
      hardwareProfiles.hp-prodesk
    ];
  };
  kube-worker-hp-prodesk-3 = {
    imports = with cell; with inputs.cells.workstations; [
      nixosSuites.kubernetes.node
      hardwareProfiles.hp-prodesk
    ];
  };
  kube-worker-hp-prodesk-4 = {
    imports = with cell; with inputs.cells.workstations; [
      nixosSuites.kubernetes.node
      hardwareProfiles.hp-prodesk
    ];
  };
  kube-worker-hp-prodesk-5 = {
    imports = with cell; with inputs.cells.workstations; [
      nixosSuites.kubernetes.node
      hardwareProfiles.hp-prodesk
    ];
  };

}
