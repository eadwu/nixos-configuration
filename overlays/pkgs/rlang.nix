final: prev:

let
  rPackages = with prev.rPackages; [
    ggplot2
    showtext
    rmarkdown
    languageserver
    # RDocumentation
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
