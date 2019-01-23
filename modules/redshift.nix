{ ... }:

{
  services.redshift = {
    enable = true;
    latitude = "40.7";
    longitude = "-73.8";

    brightness = {
      day = "1";
      night = "0.8";
    };

    temperature = {
      day = 6504;
      night = 2700;
    };
  };
}
