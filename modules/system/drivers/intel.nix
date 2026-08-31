{...}: {
  flake.nixosModules.intelDrivers = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      mesa
      vulkan-tools
    ];

    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "i965";
    };

    boot.initrd.kernelModules = ["i915"];
    services.xserver.videoDrivers = ["modesetting"];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-vaapi-driver # Older VA-API driver required for Sandy Bridge
        libvdpau-va-gl
      ];
    };
  };
}
