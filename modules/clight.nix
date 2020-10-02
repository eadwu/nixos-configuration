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
      verbose = true;

      backlight.ac_timeouts = [ 120 300 60 ];
      backlight.pause_on_lid_closed = true;

      sensor.ac_regression_points = [ 0.0 0.12 0.18 0.28 0.42 0.49 0.54 0.65 0.75 0.78 0.80 ];
      sensor.batt_regression_points = [ 0.0 0.12 0.18 0.28 0.42 0.49 0.54 0.65 0.75 0.78 0.80 ];
      sensor.captures = [ 16 16 ];

      gamma.long_transition = true;

      screen.contrib = 0.2;
      screen.num_samples = 20;
    };
  };
}
