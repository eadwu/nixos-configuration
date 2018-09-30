self: super:

let
  inherit (self.pkgs) fetchgit fetchpatch;
in {
  polybar = (super.polybar.override {
    githubSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  }).overrideAttrs (oldAttrs: {
    src = fetchgit {
      url = "https://github.com/jaagr/polybar";
      rev = "2fba443f56b425a128c5801a3ddf9752bfd49cf3";
      sha256 = "1zbk5rgyk0zxki4hni96pr22wpfd19qhw8a3s1rsr377vk4w4l45";
    };
  });
}
