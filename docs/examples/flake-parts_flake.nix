# Docs:
# - https://flake.parts
#
# CLI Usage:
#
# - Flake from Template:
#   $ nix flake init -t github:hercules-ci/flake-parts
#
{
  inputs.flake-parts.url = "github:hercules-ci/flake-parts";
  outputs = inputs@{ flake-parts, ... }:
  flake-parts.lib.mkFlake { inherit inputs; } {
    flake = {
      # Put your original flake attributes here.
    };
    systems = [
      # systems to build `perSystem` attributes for
      "x86_64-linux"  "aarch64-linux"
      "x86_64-darwin" "aarch64-darwin"
    ];
    perSystem = { config, ... }: {
    };
  };
}
