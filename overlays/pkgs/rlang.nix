final: prev:

let
  rPackages = with prev.rPackages; [
    ggplot2
    showtext
    rmarkdown
    RDocumentation
  ];
in
{
  rWrapper = prev.rWrapper.override {
    packages = rPackages;
  };

  rstudioWrapper = prev.rstudioWrapper.override {
    packages = rPackages;
  };
}
