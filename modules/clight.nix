{ ... }:

{
  services.clight = {
    enable = true;
    latitude = "40.7";
    longitude = "-73.8";

    temperature = {
      day = 6504;
      night = 2700;
    };

    extraConfig = ''
      captures = 20;
      ambient_gamma = true;
      gamma_long_transition = true;
      ac_capture_timeouts = [ 120, 300, 60 ];
      ac_backlight_regression_points = [ 0.0, 0.12, 0.24, 0.37, 0.51, 0.64, 0.70, 0.82, 0.93, 0.97, 1.0 ];
      batt_backlight_regression_points = [ 0.0, 0.12, 0.18, 0.28, 0.42, 0.49, 0.54, 0.65, 0.75, 0.78, 0.80 ];
    '';
  };
}
