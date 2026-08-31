{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.sddm = {
    pkgs,
    lib,
    ...
  }: let
    tokyonight-sddm = pkgs.stdenv.mkDerivation {
      pname = "tokyo-night-sddm";
      version = "1.0";

      src = pkgs.fetchFromGitHub {
        owner = "MarianArlt";
        repo = "sddm-tokyo-night";
        rev = "320c8e7a836009f3e0c0360a0f443b0ab75583b3";
        hash = "sha256-J1Txu7fnyg2Y1Zlyd2F1B2vI40L/L9V+N6/c4jM947c=";
      };

      dontBuild = true;

      installPhase = ''
        mkdir -p $out/share/sddm/themes/tokyo-night-sddm
        cp -R ./* $out/share/sddm/themes/tokyo-night-sddm/

        sed -i 's/Font=.*/Font="Fira Mono Nerd Font"/' $out/share/sddm/themes/tokyo-night-sddm/theme.conf
        sed -i 's/FontSize=.*/FontSize="11"/' $out/share/sddm/themes/tokyo-night-sddm/theme.conf
      '';
    };
  in {
    environment.systemPackages = [
      tokyonight-sddm
    ];

    services.displayManager.sddm = {
      enable = true;
      theme = "tokyo-night-sddm";
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs.kdePackages; [
        tokyonight-sddm
        qt5compat
        qtsvg
        qtmultimedia
      ];
    };
  };
}
