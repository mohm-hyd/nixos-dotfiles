{
  self,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.thinkpadFanControl = moduleWithSystem ({inputs', ...}: {
    # Enable fan control for the thinkpad module (why is this not the default??)
    boot.extraModprobeConfig = ''
      options thinkpad_acpi fan_control=1
    '';

    services.thinkfan = {
      enable = true;

      extraArgs = ["-s" "5"];

      levels = [
        [0 0 55]
        [1 50 60]
        [3 58 68]
        [5 65 75]
        [7 73 85]
        ["level disengaged" 82 32767]
      ];
    };
  });
}
