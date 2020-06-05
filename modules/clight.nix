{ lib, ... }:

{
  location = {
    latitude = 40.7;
    longitude = (-73.8);
  };

  services.clight = {
    enable = lib.mkDefault true;

    temperature = {
      day = 3000;
      night = 2400;
    };

    settings = {
      captures = 16;
      screen_samples = 20;
      screen_contrib = 0.2;
      gamma_long_transition = true;
      ac_capture_timeouts = [ 120 300 60 ];
      ac_backlight_regression_points = [ 0.0 0.12 0.18 0.28 0.42 0.49 0.54 0.65 0.75 0.78 0.80 ];
      batt_backlight_regression_points = [ 0.0 0.12 0.18 0.28 0.42 0.49 0.54 0.65 0.75 0.78 0.80 ];
    };
  };
}
