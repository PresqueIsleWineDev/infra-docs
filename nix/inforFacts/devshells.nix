{ inputs
, cell
}:
let
  inherit (inputs) nixpkgs std;
  l = nixpkgs.lib // builtins;
in
l.mapAttrs (_: std.std.lib.mkShell) {
  default = { ... }: {
    # ...

    # Nixago uses shell hooks for generating configuration files. In order for
    # that to work, devshell must add them to its own configuration. To ensure
    # this happens, we specify the configurations we would like generated using
    # the `nixago` attribute.
    nixago = [
      cell.configs.conform
      cell.configs.lefthook
      cell.configs.prettier
      cell.configs.treefmt
    ];

    # ...
  };
}

