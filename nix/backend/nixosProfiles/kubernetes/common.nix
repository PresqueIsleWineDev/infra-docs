{ inputs, cell }: let
  kubeMaster = {
    ip = "10.17.1.146";
    hostname = "api.cluster";
    apiPort = 6443;
  };
in
{
  imports = [
  ];

  networking.extraHosts = "${kubeMaster.ip} ${kubeMaster.hostname}";

  services.kubernetes = let
    api = "https://${kubeMaster.hostname}:${toString kubeMaster.apiPort}";
  in {
    masterAddress = kubeMaster.hostname;
    apiserverAddress = api;
    easyCerts = true;
    addons.dns.enable = true;
  };
}

