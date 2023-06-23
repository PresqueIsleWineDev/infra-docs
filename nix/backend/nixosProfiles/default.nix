{ inputs
, cell
}:
{

  base = {
    bee = inputs.nixpkgs-stable;
    home = inputs.home-manager;
    inherit (inputs.nixpkgs) system;
    imports = [
    ];
  };

}
