# Questions: `bee` module in `divnix/hive`

I can't speak for Jhu, but I can speak about what is currently unclear to me.

I think a lot of confusion stems from not being able to resolve the relationship graph of the `paisano` family of projects.
- Which projects are intended to be used in tandem with `paisano`?
- Which projects are intended to be used in tandem with `std`?

knowing which projects are related to `paisano` or intended to be used alongside `paisano`. the future direction of the collection of projects related to `paisano`.

## System Profiles

It looks like the overarching desire for users is to implement something like `nixosProfiles` in a way that is:

- achievable by the current state of `hive`.
- won't require too refactoring when the placeholder `nixosProfile` blockType is implemented in `hive`?
- can mutually import common config shared with analog profiles for other systems like `darwinProfiles`, etc.

Obviously `<systemType>Profiles` aren't implemented by `hive` yet, only `<systemType>Configuration`, which naturally leads to questions of how module loading works / changes when using `hive.collect`.

- How are the conventional `pkgs`, `lib`, `config` module args passed & how do you reference them in a system configuration/module/profile?


## Main API

Can you replace `std.growOn` with `hive.growOn` and keep the original behavior for `std.harvest` in soil blocks?

Why do the arguments for `hive.collect` differ from `std.harvest`?


## Bee Module

Is the `bee` module an abstraction around system configuration types? Like you can define it within a `nixosConfiguration`, `darwinConfiguration`, homeManagerConfiguration`, etc. and that configuration will use the appropriate `pkgs` based on its system type?

There are `bee.home`, `bee.darwin`, & `bee.wsl` options, but no `bee.nixos`...does this mean `bee.pkgs` is the NixOS analog? If not, what is the full purpose for `bee.pkgs`?


## Configuration Cross-Reference

- How can I reference the resolved configuration value of another `nixosConfiguration` within a `nixosConfiguration`
- How can I reference values set in the `config` of the currently host system in a `homeConfiguration` in a way that isn't specific to the

## Hive Docs

The actual inner mechanics of the base NixOS module system is still a bit unclear to me. But the API is well-documented and exemplified in tons of public config repos, so users don't need to understand what goes on beneath the hood. Understanding the interface makes it fairly simple to start stitching larger configs from small well-defined components.

The rapidly changing API of `hive` limits the benefit of attempting to document that interface layer, so it makes sense not to document pre-emptively. This leaves users of `hive` in the opposite situation, where they must understand the workings of the bits they intend to use, but how to compose larger systems is somewhat ambiguous until you understand the rest of the surrounding machinery with the same granularity.

It seems like `hive` could benefit from providing an overview level of "what, why, & how" without trying to document the specific interfaces, so users can have a better idea of how to stitch together the bits of implementation they learn.


## Idea: Project Design Overview

Overall Goals:

- Implement `blockType` definitions for `nixosConfiguration`, `darwinConfiguration`, `homeConfiguration`, etc.
- Implement `blockType` definitions for `nixosProfiles`, ...
- Implement `blockType` definitions for `nixosSuites`, ...
- Implement a configuration module (`bee`) to simplify passing `system` and `pkgs` to configurations of various types: `nixosConfiguration`, `darwinConfiguration`. `homeConfiguration`, etc.


## Idea: Splitting of Concerns

### Modules

Modules define options to be used in profiles, suites, & configurations.

```nix
{ config, lib, pkgs }: {
  imports = [];  # list of places to import other code from
  options = {};  # declaration of options to allow setting
  config = {};   # definition of how options deviate a configuration
}
```

Examples: (and what configurations they provide options for)

-       `diskoModule` = Disko
-        `homeModule` = home-manager environments
-       `nixosModule` = NixOS systems
-      `darwinModule` = Darwin systems
-      `systemModule` = Generic systems      ( `nixosModule` +   `darwinModule` ...)
-    `hardwareModule` = Hardware setups
-    `devshellModule` = Development shells
- `environmentModule` = Generic environments (`systemModule` + `devshellModule`    )
-       `flakeModule` = Generic configurations

New modules types can be extended from a generic base.

```nix
# TODO: Extension API
mkModuleType = configTypeName: {
  imports = [];
  options = {};
  config = {};
}

diskoModule = lib.mkModuleType "disko" { ... };

```

```nix
{pkgs, lib, config}: {
  nixos = {
    imports = [];
    options = {};
    config = {};
  };
  homeManager = {
    imports = [];
    options = {};
    config = {};
  };
  common = {
    imports = [];
    options = {};
    config = {};
  };
  generic = {
    conditions = [({...}: moduleTypeName)];
    imports = [];
    options = {};
    config = {};
  };
  ...
}
```

### Profiles

Profiles set option values to be used in suites & configurations.

### Suites

Suites aggregate collections of profiles to be used in configurations.

### Configurations

Configurations are valid sets of options that satisfy every condition necessary to serve as a standalone unit.

### BlockTypes

- `<type>Module`
- `<type>Profile`
- `<type>Suite`
- `<type>Configuration`

## Frustrations

Documentation in the Nix world is lacking as a whole. This is compounded by utterly misleading/confusing naming choices, bizarre organization, & feature redundancy.

- nix module vs. nixos module
- nixpkgs vs. pkgs vs. packages
- system nixpkgs attr vs. system NixOS option
- "nix" = functional language and its expression evaluator, package manager, & CLI
- "nixpkgs" = Nix language's standard library + the set of all default packages + NixOS modules.

- Flakes being the de facto standard, but considered experimental by the docs.

- Flakes being essentially an attrset with named attrs "inputs" & "outputs" instead of being a function
