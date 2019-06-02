{ pkgs, lib, ... }:

let
  easyFX = "${pkgs.fetchzip {
    url = "https://nilssoderman.com/files/blender/EasyFX.zip";
    sha256 = "0zlm2kgnjwcp8p9znbp4iwn4wqlv30yg8335nk3k8mgr0c21xx16";
  }}/EasyFX.py";

  autoMirror = "${builtins.fetchGit {
    url = "https://framagit.org/Lapineige/Blender_add-ons.git";
  }}/AutoMirror/AutoMirror_V2-4.py";

  matalogue = "${builtins.fetchGit {
    url = "https://github.com/gregzaal/Matalogue";
  }}/matalogue.py";

  sculptBrushes = "${builtins.fetchGit {
    url = "https://github.com/IIK3D/Sculpt_Brushes";
  }}/sculpt_brushes";

  batchOperations = "${builtins.fetchGit {
    url = "https://github.com/dairin0d/batch-operations";
  }}/space_view3d_batch_operations";

  blender_2_7x = {
    "blender/2.79/pie-essentials".source = ./blender/pie-essentials;

    "blender/2.79/EasyFX.py".source = easyFX;
    "blender/2.79/AutoMirror_V2-4.py".source = autoMirror;
    "blender/2.79/matalogue.py".source = matalogue;
    "blender/2.79/space_view3d_batch_operations".source = batchOperations;
  };

  blender_2_8x = { };
in {
  home.packages = lib.singleton pkgs.blender;
  xdg.configFile = {
    "blender/2.80/sculpt_brushes".source = sculptBrushes;
  };
}
