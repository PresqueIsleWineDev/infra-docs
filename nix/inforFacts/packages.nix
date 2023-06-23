{ inputs
, cell
}:
let
  inherit (inputs) nixpkgs std;
  l = nixpkgs.lib // builtins;
in rec
{
  # --- Infor FACTS Windows Client ---
  # To be used by ../workstations/windows
  clientBinary = with nixpkgs; stdenv.mkDerivation {
    pname = "infor-facts-client";
    version = "7.7";
    src = std.incl inputs.self [
      (inputs.self + nix/inforFacts/pvxwin32.exe)
    ];
    buildInputs = [
      #mdbook mkbook-mermaid
    ];
    buildPhase = ''
      #mdbook build
    '';
    installPhase = ''
      #cp -r book $out
    '';
    meta = {
      description = "Infor FACTS client";
      #maintainers = [ "" ];
    };
  };

  # --- Infor FACTS Server ---
  # To be used by ../backend
  serverBinary = with nixpkgs; stdenv.mkDerivation {
    pname = "infor-facts-server";
    version = "7.7";

    src = std.incl inputs.self [
      (inputs.self + /pvxwin32.exe)
    ];

    meta = {
      description = "Infor FACTS server";
    };
  };

  default = serverBinary;
}
