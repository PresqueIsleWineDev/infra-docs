# Nix Flake Inputs: Nixago

Repo: [`nix-community/nixago`](https://github.com/nix-community/nixago)


## Overview

Declare & dynamically generate configuration files for common tooling included in many software projects.

## Why

### Design

- Integrates with Nix
- Integrates with [`divnix/std`](https://github.com/divnix/std) & [`divnix/hive`](https://github.com/divnix/hive) as a `std.blockType`
- Automatically generate configurations when entering `devshells` via passing `shellHook = (nixago.lib.make config).shellHook` as an attr of the argument to `pkgs.mkShell`.
- Lots of time-consuming DevOps work performed with **far** less effort than manually learning & writing each config format, just set the Nix options.
- Extensible via 3rd-party extensions. See: [`nix-community/nixago-extensions`](https://github.com/nix-community/nixago-extensions)

### Use Cases for our Infrastructure

-

## Declaration

Declares:

-


## Library Functions

- `nixago.lib.make`

## Outputs

Result Outputs:

-


## Examples

```nix
  let
    data = {
      "field1" = "value1";
      "field2" = true;
    };
  in
  nixago.lib.make {
    inherit data;
    output = "config.json";
    format = "json"; # Optional if it matches the file extension
    engine = nixago.engines.nix { }; # Optional as this is the default engine
  }
```


## To-Do

- [ ] Finish me!
