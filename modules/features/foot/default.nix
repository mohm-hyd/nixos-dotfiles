{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.foot = moduleWithSystem (
    {self'}: {
      environment.systemPackages = with self'.packages; [
        foot
      ];
    }
  );

  perSystem = {pkgs, ...}: {
    packages.foot = let
      fira-mono = pkgs.nerd-fonts.fira-mono;
      fontsConf = pkgs.makeFontsConf {
        fontDirectories = [fira-mono];
      };
    in
      inputs.wrappers.wrappers.foot.wrap {
        inherit pkgs;

        env = {
          "FONTCONFIG_FILE" = "${fontsConf}";
        };

        settings = {
          main = {
            include = "~/.config/foot/themes/noctalia";
            font = "FiraMono Nerd Font Mono:size=18";
            pad = "4x4";
          };

          colors-dark = {
            alpha = 0.7;
          };
        };
      };
  };
}
