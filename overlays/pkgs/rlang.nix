self: super:

let
  rPackages = with super.rPackages; [
    ggplot2
    showtext
    rmarkdown
    RDocumentation
  ];
in {
  rWrapper = super.rWrapper.override {
    packages = rPackages;
  };

  rstudioWrapper = super.rstudioWrapper.override {
    packages = rPackages;
  };
}
