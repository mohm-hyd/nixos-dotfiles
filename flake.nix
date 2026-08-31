{
  description = "Master flake for nix config";

  inputs = {
    # System
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    # Apps
    nvim.url = "github:mohm-hyd/nvim";
    niri-noctalia = {
      url = "github:mohm-hyd/niri-noctalia";
    };
    # Flake parts
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);
}
