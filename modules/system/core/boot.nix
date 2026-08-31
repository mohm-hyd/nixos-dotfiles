{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.bootloader = {
    pkgs,
    lib,
    ...
  }: {
    boot = {
      loader = {
        timeout = 2;
        systemd-boot = {
          enable = true;
        };
        efi = {
          canTouchEfiVariables = true;
        };
      };
            plymouth = {
        enable = true;
        theme = "catppuccin-mocha";
        themePackages = with pkgs; [
          # By default we would install all themes
          (catppuccin-plymouth.override {
            variant = "mocha";
          })
        ];
      };
 
      kernelPackages = pkgs.linuxPackages_latest;
    };
  };
}
