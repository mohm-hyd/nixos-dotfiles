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
      plymouth = let
        tokyonight-plymouth = pkgs.stdenv.mkDerivation {
          pname = "tokyonight-plymouth";
          version = "1.0";

          src = pkgs.fetchFromGitHub {
            owner = "rototrash";
            repo = "tokyo-night-plymouth";
            rev = "main";
            sha256 = "sha256-4Y13yJ1uP8h0D6NqK2k+U3T501N7kP2sB/1mK0p1R5c="; # Replace with `pkgs.lib.fakeHash` to fetch exact sha256 if needed
          };

          installPhase = ''
            mkdir -p $out/share/plymouth/themes
            cp -r tokyo-night $out/share/plymouth/themes/
          '';
        };
      in {
        enable = true;
        theme = "tokyo-night";
        themePackages = [tokyonight-plymouth];
      };
      kernelPackages = pkgs.linuxPackages_latest;
    };
  };
}
