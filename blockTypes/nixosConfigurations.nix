# Like: https://github.com/divnix/hive/blob/main/src/blocktypes/nixosConfigurations.nix
{
  nixpkgs,
  mkCommand,
}: let
  l = nixpkgs.lib // builtins;
  /*
  Use the nixosConfigurations Blocktype for
  final definitions of your NixOS hosts.
  */
  nixosConfigurations = {
    name = "nixosConfigurations";
    type = "nixosConfigurations";
    actions = {
      currentSystem,
      fragment,
      fragmentRelPath,
      target,
    }: let
      getString = o: (l.elemAt (l.splitString ["/"] fragmentRelPath) o);
      host = (getString 0) + "-" + (getString 2);
      dc = getString 1;
      bin = ''
        bin=$(nix build .#${dc}.${host}.system --no-link --print-out-paths)/sw/bin
        export PATH=$bin:$PATH
      '';
    in [
      (mkCommand currentSystem {
        name = "switch";
        description = "switch the configuration";
        command =
          bin
          + ''
            nixos-rebuild switch --flake .#${host}
          '';
      })
      (mkCommand currentSystem {
        name = "activate";
        description = "build & activate the configuration";
        command =
          bin
          + ''
            nixos-rebuild activate --flake .#${host}
          '';
      })
      (mkCommand currentSystem {
        name = "dry-activate";
        description = "build & dry-activate the configuration";
        command =
          bin
          + ''
            nixos-rebuild dry-activate --flake .#${host}
          '';
      })
      (mkCommand currentSystem {
        name = "dry-build";
        description = "dry-build the configuration";
        command =
          bin
          + ''
            nixos-rebuild dry-build --flake .#${host}
          '';
      })
      (mkCommand currentSystem {
        name = "build";
        description = "build the configuration";
        command =
          bin
          + ''
            nixos-rebuild build --flake .#${host}
          '';
      })
      (mkCommand currentSystem {
        name = "build-vm";
        description = "build the configuration to be run in a Virtual Machine";
        command =
          bin
          + ''
            nixos-rebuild build-vm --flake .#${host}
          '';
      })
      (mkCommand currentSystem {
        name = "exec";
        description = "exec the command with the configuration";
        command =
          bin
          + ''
            nixos-rebuild "$@" --flake .#${host}
          '';
      })
      (mkCommand currentSystem {
        name = "upgrade";
        description = "upgrade & switch the configuration";
        command =
          bin
          + ''
            nixos-rebuild switch --flake .#${host} --upgrade
          '';
      })
      (mkCommand currentSystem {
        name = "upgrade-all";
        description = "upgrade-all & switch the configuration";
        command =
          bin
          + ''
            nixos-rebuild switch --flake .#${host} --upgrade-all
          '';
      })
      (mkCommand currentSystem {
        name = "rollback";
        description = "rollback to the previous configuration";
        command =
          bin
          + ''
            nixos-rebuild switch --flake .#${host} --rollback
          '';
      })
      (mkCommand currentSystem {
        name = "switch-next-boot";
        description = "build the configuration, but don't activate it until the next boot";
        command =
          bin
          + ''
            nixos-rebuild boot --flake .#${host}
          '';
      })
      (mkCommand currentSystem {
        name = "test";
        description = "build & activate the configuration, but don't add boot entry";
        command =
          bin
          + ''
            nixos-rebuild test --flake .#${host}
          '';
      })
      #edit - opens configuration.nix in editor (TODO: how to do this with flakes / hive)
      #build-remote - Build on remote machine(s)
      #install-bootloader
      #specialize
    ];
  };
in
  nixosConfigurations
