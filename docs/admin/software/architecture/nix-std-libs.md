# Library Functions: `divnix/std` & `divnix/hive`

## Library Functions

```nix

growOn { cellsFrom = ./dir; cellBlocks = [<cellBlockDef>...]; }
 <cellBlockDef> = (<blockType> <blockName> <optionAttrs>)

```

```nix

outputs = std.growOn {
  cellsFrom=./dir;
  cellBlocks=[
     #(<type> <name> <optAttrs>)...
  ];
}
{ # --- Soil ---
  <flakeOutAttr> = std.harvest <inputEl> [<cell> <cellBlock>];
} # ...

```

### Args: `std.growOn`

#### Cells

Each folder inside `cellsFrom` becomes a "cell"

Each `<block>.nix` or `<block>/default.nix` in cell becomes a "cell block"

- `cellBlocks` has similar output structure to normal flake projects.
- `cellBlocks` defines `<block>` file/dir names to be picked up by std.
  - e.g. `<cellsFrom>/<cellName>/<block>.nix`


#### Soil
Generates Nix CLI compatible outputs, can use any flake output maker (e.g. `flake-parts` / `flake-utils`)
  - attrsets here require associated Nix files?
  - group `<outputAttrs>` by cell = best practice?

### Usage

```nix

 std.growOn  <stdAttrs> <soilAttrs> #...
hive.growOn  <stdAttrs> <soilAttrs> #...
 std.harvest <???> [<cell> <cellBlock>]
hive.harvest <???> [<cell> <cellBlock>]    # (can use multiple lists?)

```

## CLI Usage

```bash

$ nix run .
$ nix run github:divnix/std

```
