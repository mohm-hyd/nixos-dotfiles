{...}: {
  flake.nixosModules.amdDrivers = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      mesa
      vulkan-tools
    ];
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          libva-vdpau-driver
          libvdpau-va-gl
        ];
      };
      amdgpu = {
        initrd.enable = true;
        opencl.enable = true;
      };
    };
  };
}
