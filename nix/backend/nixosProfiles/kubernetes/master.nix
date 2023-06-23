{ inputs, cell
, ...
}: let

  kubeMaster = {
    ip = "10.17.1.146";
    hostname = "api.cluster";
    apiPort = 6443;
  };

in
{

  imports = [
    cell.nixosProfiles.kubernetes.common
    cell.nixosProfiles.kubernetes.apiserver
    #cell.nixosProfiles.kubernetes.master
    #cell.nixosProfiles.kubernetes.node
    #cell.nixosProfiles.kubernetes.testMachine
  ];

  networking.extraHosts = "${kubeMaster.ip} ${kubeMaster.hostname}";

  services.kubernetes = {
    roles = ["master"];
    masterAddress = kubeMaster.hostname;
    apiserverAddress = "https://${kubeMaster.hostname}:${toString kubeMaster.port}";
    easyCerts = true;

    # --- Kubernetes API ---
    # Master nodes will usually also be the cluster's:
    # - API server
    # - DNS server
    # TODO: Move to nixosProfile.kubernetes.apiserver
    apiserver = {
      securePort = kubeMaster.apiPort;
      advertiseAddress = kubeMaster.ip;
    };


    # --- Kubernetes DNS ---
    # Use CoreDNS
    addons.dns.enable = true;

    # --- Kubelets ---
    kubelet.kubeconfig.server = "https://${kubeMaster.hostname}:${toString kubeMaster.apiPort}";
    # If you use swap
    kubelet.extraOpts = "--fail-swap-on=false";

  };

}
