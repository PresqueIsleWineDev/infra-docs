# flake.nix
{ description = "Infrastructure Resources for PIWC";

  # --- std/hive libs ------------------
  # Enforce the structure of our repo. They provide clear boundaries for
  # Main purpose: define how to collect Nix modules' outputs & assemble into flake outputs.
  # TODO: Create docs for these inputs
  inputs = {
    hive.url = "github:divnix/hive";          # Modular structure for nix-based system configurations.
    std.url = "github:divnix/std";            # Modular structure for nix software development lifecycle components.
    std-ext.url = "github:GTrunSec/std-ext";  # Extensions to std,
  };

  # --- std/hive deps ------------------
  # std leaves these inputs blank so that flakes using std as an input can override them.
  # Each of these inputs provides blockTypes that wrap some component with actions called w/ the paisano TUI
  # Each cellBlock output attr represents an instance of that blockType's component.
  # ??? dont need to specify URL, just what n
  # In-progress: kubectl, helm, terranix
  # TODO: Create docs for these inputs
  inputs = {
    arion    = {url="github:hercules-ci/arion";     }; # Declare containers & networking params & run like docker-compose
    colmena  = {url="github:nix-community/colmena"; }; # Declare hives of NixOS systems & deploy them.
    devshell = {url="github:numtide/devshell";      }; # Declare development shells w/ exact environment, deps, & utils.
    disko    = {url="github:nix-community/disko";   }; # Declare hard disk partition layouts & filesystems, & format disks.
    makes    = {url="github:fluidattacks/makes";    }; # Declare CI/CD pipelines for both cloud & local envs. (makes.nix)
    microvm  = {url="github:astro/microvm.nix";     }; # Declare NixOS VMs & run in hypervisor or as systemd service.
    n2c      = {url="github:nlewo/nix2container";   }; # Declare OCI container manifests & build them.
    nixago   = {url="github:nix-community/nixago";  }; # Declare configs for repository tools & build/generate their files.
  };

  # --- Util Libs ----------------------
  # Provide utility libraries to use in Nix expressions.
  # TODO: Create docs for these inputs
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    std-data-collection = {
      url = "github:divnix/std-data-collection";
      inputs.std.follows = "std";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  # --- nixpkgs ------------------------
  # Provides the Nix standard library & packages.
  # TODO: Create docs for these inputs
  inputs = {
    nixpkgs.follows             = "std/nixpkgs";
    nixpkgs.url                 = "github:NixOS/nixpkgs/release-23.05";
    nixpkgs-stable.url          = "github:NixOS/nixpkgs/release-23.05";
    nixpkgs-unstable.url        = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-darwin.follows      = "hive/nixpkgs";
    nixpkgs-darwin.url          = "github:NixOS/nixpkgs/nixpkgs-23.05-darwin";
    nixpkgs-darwin-stable.url   = "github:NixOS/nixpkgs/nixpkgs-23.05-darwin";
    nixpkgs-darwin-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable-darwin";
    nixpkgs-nixos-stable.url    = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs-nixos-unstable.url  = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-nixos.follows       = "hive/nixpkgs";
    nixos.follows               = "hive/nixpkgs";
  };

  # --- Systems ------------------------
  # Provides libraries or modules to generate a Nix-based system.
  # Outputs are system configurations that can be run, switched to, or installed.
  # TODO: Create docs for these inputs
  inputs = {
    darwin.url = "github:LnL7/nix-darwin";                    # MacOS system
    darwin.inputs.nixpkgs.follows = "nixpkgs-stable";
    home-manager.url = "github:nix-community/home-manager";   # Home user environments
    system-manager = {                                        # Generic Linux systems (non-NixOS)
      url = "github:numtide/system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
      # Example Config:
      # TODO: Create blockTypes.systemManagerConfig
      # systemConfigs.<name> = self.lib.makeSystemConfig {
      #   system = flake-utils.lib.system.x86_64-linux;
      #   modules = cell.systemModules ++ [
      #     ({ <moduleArgs> }: { imports = [...]; options = [...]; config = [...]; ... })
      #     (import ./<filename>.nix { inherit inputs cell system; })
      #   ];
      # };
      # CLI Usage: `nix run 'github:numtide/system-manager' -- switch --flake '.'`
    };
  };

  # --- Configuration Modules ----------
  # Provides modules to extend the options accessible to system configurations.
  inputs = {
    nixos-hardware.url = "github:nixos/nixos-hardware";  # nixos-hardware: Easy modules to support various hardware configurations
    nixvim.url = "github:pta2002/nixvim";                # nixvim:  build Nix config w/ home/system modules or lib.makeNixvim
  };

  inputs = {
    qnr.url = "github:divnix/quick-nix-registry";    # quick-nix-registry: Local nix registry for caching packages, etc.
    treefmt-nix.url = "github:numtide/treefmt-nix";  # treefmt: multi-lang formatter for Nix projects
    terranix.url = "github:terranix/terranix";       # Terranix: Terraform config in Nix ---
    sops-nix.url = "github:Mic92/sops-nix";          # sops-nix: Encrypted secrets in Nix configs
  };

  outputs = { std, hive, self, nixpkgs, ...} @ inputs: let
    lib = inputs.nixpkgs.lib // builtins;
  in hive.growOn {
    inherit inputs;
    cellsFrom = ./nix;
    cellBlocks = with std.blockTypes; with hive.blockTypes; [
      colmenaConfigurations
      darwinConfigurations
      diskoConfigurations
      homeConfigurations
      nixosConfigurations

      # --- Generic Reusables ----------------------------------------
      (runnables           "apps"                   {ci.build = true;}) # Apps can be run
      (functions           "jobs"                   {ci.build = true;}) # Jobs can be run
      (functions           "lib"                    {ci.build = true;}) # Libraries hold shared code
      (nixago              "configs"                {ci.build = true;})

      (installables        "generators"             {ci.build = true;}) # Generators create installable images
      (installables        "packages"               {ci.build = true;}) # Packages can be installed
      (functions           "overlays"               {ci.build = true;}) # Overlays map package sets to new package sets

      # --- Services -------------------------------------------------
      (containers          "containers"  {ci.build  =true;              }) # Container definitions
      (containers          "images"      {ci.publish=true;              }) # Images are built from container definitions to be deployed
      (containers          "deployments" {ci.upgrade=true; ci.diff=true;}) # Deployments are run

      # --- Generic Flakes -------------------------------------------
      (functions           "flakeModules"           {ci.build = true;}) # Flake modules declare options to use in any flake config
      (functions           "flakeProfiles"          {ci.build = true;}) # Flake profiles set module options
      (functions           "flakeSuites"            {ci.build = true;}) # Flake suites aggregage profiles

      # --- Shells ---------------------------------------------------
      (devshells           "shells"              {ci.build = true;}) # devshells can be entered
      (functions           "shellModules"        {ci.build = true;}) # Modules implement
      (functions           "shellProfiles"       {ci.build = true;}) # Profiles activate
      (functions           "shellSuites"         {ci.build = true;}) # Suites aggregage profiles

      # --- Program Configs ------------------------------------------
      # --- Neovim ---
      (functions             "nixvimConfigurations"  {ci.build = true;}) # Nixvim complete configurations
      (functions             "nixvimModules"         {ci.build = true;}) # Nixvim new options
      (functions             "nixvimProfiles"        {ci.build = true;}) # e.g. completionKeymaps.vscode-alike
      (functions             "nixvimSuites"          {ci.build = true;}) # Nixvim suites aggregate nixvimProfiles

      # --- Nix System Collections -----------------------------------
      # --- Colmena ---
      #(colmenaConfigurations "colmenaConfigurations" {ci.build = true;})
      (functions             "colmenaProfiles"       {ci.build = true;})

      # --- Nix System Configs ---------------------------------------
      (functions             "hardwareProfiles"      {ci.build = true;}) # Set module options relevant to hardware. e.g. disk.nvme, formFactor.server, formFactor.laptop, formFactor.touchscreen, etc.

      # --- Disks ---
      #(diskoConfigurations   "diskoConfigurations"   {ci.build = true;}) # Disko configs describe disk layouts to be written to disks
      (functions             "diskoProfiles"         {ci.build = true;}) # Disko profiles describe some aspect of a disk config

      # --- MacOS ---
      #(darwinConfigurations  "darwinConfigurations"  {ci.build = true;})
      (functions             "darwinProfiles"        {ci.build = true;})
      (functions             "darwinModules"         {ci.build = true;})
      (functions             "darwinSuites"          {ci.build = true;})

      # --- home-manager ---
      #(homeConfigurations    "homeConfigurations"    {ci.build = true;}) # Configurations can be deployed
      (functions             "homeModules"           {ci.build = true;}) # Modules implement
      (functions             "homeProfiles"          {ci.build = true;}) # Profiles activate
      (functions             "homeSuites"            {ci.build = true;}) # Suites aggregage profiles

      # --- NixOS ---
      #(nixosConfigurations   "nixosConfigurations"   {ci.build = true;})
      (functions             "nixosModules"          {ci.build = true;})
      (functions             "nixosProfiles"         {ci.build = true;})
      (functions             "nixosSuites"           {ci.build = true;})

      # --- Foreign Unix Systems ---
      # IDEA: Merge
      #(functions             "systemConfigurations"  {ci.build = true;})
      #(functions             "systemModules"         {ci.build = true;})
      #(functions             "systemProfiles"        {ci.build = true;})
      #(functions             "systemSuites"          {ci.build = true;})

    ];
    #nixpkgsConfig = {
    #};
  }

  { # --- Website ---------------------------------------
    containers = std.harvest self ["website" "containers"];
    devShells  = std.harvest self ["website" "shells"    ];
    packages   = std.harvest self ["website" "packages"  ];
  }

  { # --- QuickBooks --------------------------------------
    #apps       = std.harvest self ["quickBooks" "apps"      ];
    #containers = std.harvest self ["quickBooks" "containers"];
    devShells  = std.harvest self ["quickBooks" "shells"    ];
    packages   = std.harvest self ["quickBooks" "packages"  ];
  }

  { # --- Infor FACTS --------------------------------------
    apps       = std.harvest self ["inforFacts" "apps"      ];  #   Apps: windows, linux, macos
    #containers = std.harvest self ["inforFacts" "containers"]; # Containers: server
    devShells  = std.harvest self ["inforFacts" "shells"    ];  # Shells: user,admin,dev
    packages   = std.harvest self ["inforFacts" "packages"  ];  #   Pkgs: client-{windows,linux,macos}, server, server-container, server-container-image, server-system
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
    devShells            = std.harvest self ["backend" "shells"             ];
    packages            =  std.harvest self ["backend" "packages"           ];
    nixosConfigurations = hive.harvest self ["backend" "nixosConfigurations"];
    nixosModules        = hive.harvest self ["backend" "nixosModules"       ];
    nixosProfiles       = hive.harvest self ["backend" "nixosProfiles"      ];
    nixosSuites         = hive.harvest self ["backend" "nixosSuites"        ];
  }

  { # --- Workstations -----------------------------------
              colmenaHive = hive.collect self "colmenaConfigurations";
     darwinConfigurations = hive.collect self  "darwinConfigurations";
      diskoConfigurations = hive.collect self   "diskoConfigurations";
       homeConfigurations = hive.collect self    "homeConfigurations";
      nixosConfigurations = hive.collect self   "nixosConfigurations";
      devShells           = hive.harvest self ["workstations" "shells"];
      formatter           = hive.harvest nixpkgs.legacyPackages ["alejandra"];
      #packages = std.harvest inputs.disko [ "packages" ];  # TODO: Harvest packages from inputs
  }
  { # --- Primera PrintHub ---------------------------------
  }
  { # --- BarTender ----------------------------------------
  }
  { # --- FedEx Shipping Manager ---------------------------
  }


  ; # --- /outputs --- /growOn args ----------------------------------------------


  # --- Nix CLI Config ---------------------------------------------------------
  nixConfig = {
    accept-flake-input = true;
    experimental-features = [ "nix-command" "flakes" "repl-flake" ];
    extra-substituters = [
      "https://colmena.cachix.org"
      "https://nix-community.cachix.org"
      "https://numtide.cachix.org"
    ];
    extra-trusted-public-keys = [
      "colmena.cachix.org-1:7BzpDnjjH8ki2CT3f6GdOk7QAzPOl+1t3LvTLXqYcSg="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
    ];
  };

}
