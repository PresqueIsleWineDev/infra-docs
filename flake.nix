# flake.nix
{ description = "Infrastructure Resources for PIWC";
  inputs = {
    hive.url = "github:divnix/hive";
    std.url = "github:divnix/std";
    std-ext.url = "github:GTrunSec/std-ext";

    nixpkgs.follows = "std/nixpkgs";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos.follows = "hive/nixpkgs";

    qnr.url = "github:divnix/quick-nix-registry";

    nixvim.url = "github:pta2002/nixvim";

    flake-utils.url = "github:numtide/flake-utils";

    system-manager = { # Configure non-NixOS Linux systems
      url = "github:numtide/system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
      # Example Config:
      # systemConfigs.<name> = self.lib.makeSystemConfig {
      #   system = flake-utils.lib.system.x86_64-linux;
      #   modules = cell.systemModules ++ [
      #     ({ <moduleArgs> }: { imports = [...]; options = [...]; config = [...]; ... })
      #     (import ./<filename>.nix { inherit inputs cell system; })
      #   ];
      # };
      # CLI Usage: `nix run 'github:numtide/system-manager' -- switch --flake '.'`
    };

    # --- treefmt: multi-lang formatter for Nix projects ---
    treefmt-nix.url = "github:numtide/treefmt-nix";

  };
  # +------------+
  # | std / hive |
  # +---Lib------+-----------------------------------------------------------+
  # | growOn { cellsFrom = ./dir; cellBlocks = [<cellBlockDef>...]; }        |
  # |  <cellBlockDef> = (<blockType> <blockName> <optionAttrs>)              |
  # | growOn { cellsFrom=./dir; cellBlocks=[                                 |
  # |  (<type> <name> <optAttrs>)...       ];                                |
  # | } { <flakeOutAttr> = harvest <inputEl> [<cell> <cellBlock>]; }  ...    |
  # +--- cells --+-----------------------------------------------------------+
  # | Each folder inside `cellsFrom` becomes a "Cell"                        |
  # | Each <block>.nix or <block>/default.nix in cell becomes a "Cell Block" |
  # | - `cellBlocks` has similar output structure to normal flake projects.  |
  # | - `cellBlocks` defines <block> file/dir names to be picked up by std.  |
  # |   - e.g. '<cellsFrom>/<cellName>/<block>.nix'                          |
  # +--- soil ---------------------------------------------------------------+
  # | Generates Nix CLI compatible outputs, can use any flake output maker   |
  # |                                       (e.g. flake-parts / flake-utils) |
  # |   - attrsets here require associated Nix files?                        |
  # |   - group <outputAttrs> by cell = best practice?                       |
  # +------------------------------------------+---CLI Usage-----------------+
  # |  std.growOn  <stdAttrs> <soilAttrs>...   | $ nix run .                 |
  # | hive.growOn  <stdAttrs> <soilAttrs>...   | $ nix run github:divnix/std |
  # |  std.harvest <???> [<cell> <cellBlock>]  +-----------------------------+
  # | hive.harvest <???> [<cell> <cellBlock>]      (can use multiple lists?) |
  # +------------------------------------------------------------------------+
  outputs = { std, hive, self, nixpkgs, ...} @ inputs: hive.growOn {
    inherit inputs;
    cellsFrom = ./nix;
    cellBlocks = with std.blockTypes; with hive.blockTypes; [

      # --- Generic Reusables ----------------------------------------
      (functions           "jobs"                   {ci.build = true;}) # Jobs can be run
      (functions           "libs"                   {ci.build = true;}) # Libraries hold shared code

      (installables        "packages"               {ci.build = true;})
      (functions           "overlays"               {ci.build = true;})

      # --- Services -------------------------------------------------
      (containers          "containers"             {ci.build = true;})

      # --- Generic Flakes -------------------------------------------
      (functions           "flakeModules"           {ci.build = true;})
      (functions           "flakeProfiles"          {ci.build = true;})
      (functions           "flakeSuites"            {ci.build = true;})

      # --- Shells ---------------------------------------------------
      (devshells           "devshells"              {ci.build = true;}) # devshells can be entered
      (functions           "devshellModules"        {ci.build = true;}) # Modules implement
      (functions           "devshellProfiles"       {ci.build = true;}) # Profiles activate
      (functions           "devshellSuites"         {ci.build = true;}) # Suites aggregage profiles

      # --- Program Configs ------------------------------------------
      # --- Neovim ---
      (functions             "nixvimConfigurations"  {ci.build = true;})
      (functions             "nixvimModules"         {ci.build = true;})
      (functions             "nixvimProfiles"        {ci.build = true;})
      (functions             "nixvimSuites"          {ci.build = true;})

      # --- Nix System Collections -----------------------------------
      # --- Colmena ---
      (colmenaConfigurations "colmenaConfigurations" {ci.build = true;})
      (functions             "colmenaProfiles"       {ci.build = true;})

      # --- Nix System Configs ---------------------------------------
      # --- MacOS ---
      (darwinConfigurations  "darwinConfigurations"  {ci.build = true;})
      (functions             "darwinProfiles"        {ci.build = true;})
      (functions             "darwinModules"         {ci.build = true;})
      (functions             "darwinSuites"          {ci.build = true;})

      # --- Disks ---
      (diskoConfigurations   "diskoConfigurations"   {ci.build = true;})
      (functions             "diskoProfiles"         {ci.build = true;})

      # --- home-manager ---
      (homeConfigurations    "homeConfigurations"    {ci.build = true;}) # Configurations can be deployed
      (functions             "homeModules"           {ci.build = true;}) # Modules implement
      (functions             "homeProfiles"          {ci.build = true;}) # Profiles activate
      (functions             "homeSuites"            {ci.build = true;}) # Suites aggregage profiles

      # --- NixOS ---
      (nixosConfigurations   "nixosConfigurations"   {ci.build = true;})
      (functions             "nixosModules"          {ci.build = true;})
      (functions             "nixosProfiles"         {ci.build = true;})
      (functions             "nixosSuites"           {ci.build = true;})

      # --- Foreign Unix Systems ---
      # IDEA: Merge
      (functions             "systemConfigurations"  {ci.build = true;})
      (functions             "systemModules"         {ci.build = true;})
      (functions             "systemProfiles"        {ci.build = true;})
      (functions             "systemSuites"          {ci.build = true;})
    ];
  }

  { # --- Website ---------------------------------------
    devShells  = std.harvest self ["website" "devshells"];
    packages   = std.harvest self ["website" "packages"];
    containers = std.harvest self ["website" "containers"];
  }

  { # --- Nix-based System Configs -----------------------
    colmenaConfigurations = hive.harvest self ["nixos" "colmenaConfigurations"];
     darwinConfigurations = hive.harvest self ["nixos" "darwinConfigurations" ];
      diskoConfigurations = hive.harvest self ["nixos" "diskoConfigurations"  ];
       homeConfigurations = hive.harvest self ["nixos" "homeConfigurations"   ];
      nixosConfigurations = hive.harvest self ["nixos" "nixosConfigurations"  ];

      devShells = hive.harvest self ["nixos" "devshells"];
      formatter = hive.harvest nixpkgs.legacyPackages ["alejandra"];

  }

  { # --- QuickBooks --------------------------------------
    containers = std.harvest self ["quickBooks" "containers"];
    devShells  = std.harvest self ["quickBooks" "devshells"];
    packages   = std.harvest self ["quickBooks" "packages"];

  }

  { # --- Infor FACTS --------------------------------------
    containers = std.harvest self ["inforFacts" "containers"];
    devShells  = std.harvest self ["inforFacts" "devshells"];
    packages   = std.harvest self ["inforFacts" "packages"];
  }

  { # --- Internal Backends --------------------------------
    #formatter = std.harvest inputs.nixpkgs.legacyPackages [
    #  "alejandra"    # Nix
    #  "dockfmt"      # Dockerfiles
    #  "pgformatter"  # PostgreSQL
    #  "yamlfix"      # YAML
    #];
    formatter = std.harvest inputs.treefmt-nix.lib.mkWrapper nixpkgs.legacyPackages [ "treefmt-nix" ]
    { projectRootFile = "flake.nix";
      programs.nixpkgs-fmt.enable = true;
      programs.terraform.enable = true;
      programs.terraform.package = nixpkgs.terraform_1;
    };
    packages = std.harvest self ["internalBackends" "packages"];
  }

  ; # --- /outputs --- /growOn args ----------------------------------------------


  # --- Nix CLI Config ---------------------------------------------------------
  nixConfig = {
    accept-flake-input = true;
    experimental-features = [ "nix-command" "flakes" "repl-flake" ];
    extra-substituters = [
      "https://numtide.cachix.org"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

}
