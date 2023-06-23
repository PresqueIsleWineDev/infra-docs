{ inputs
, cell
}:
inputs.treefmt-nix.lib.mkWrapper inputs.nixpkgs.legacyPackages [
  "treefmt-nix"
  "dockfmt"
  "pgformatter"
  "yamlfix"
  # TODO: Formatter: Kubernetes manifests
  # TODO: Formatter: Helm charts
  # TODO: Formatter: PowerShell scripts
] {
  projectRootFile = "flake.nix";
  programs.nixpkgs-fmt.enable = true;
  programs.terraform.enable = true;
  programs.terraform.package = inputs.nixpkgs.terraform_1;
}
