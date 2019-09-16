{ pkgs, ... }:

let
  easyFX = "${pkgs.fetchzip {
    url = "https://nilssoderman.com/files/blender/EasyFX.zip";
    sha256 = "0zlm2kgnjwcp8p9znbp4iwn4wqlv30yg8335nk3k8mgr0c21xx16";
  }}/EasyFX.py";

  autoMirror = "${builtins.fetchTarball {
    url = "https://framagit.org/Lapineige/Blender_add-ons/-/archive/master/Blender_add-ons-master.tar.gz";
  }}/AutoMirror/AutoMirror_V2-4.py";

  matalogue = "${builtins.fetchTarball {
    url = "https://github.com/gregzaal/Matalogue/archive/master.tar.gz";
  }}/matalogue.py";

  sculptBrushes = "${builtins.fetchTarball {
    url = "https://github.com/IIK3D/Sculpt_Brushes/archive/master.tar.gz";
  }}/sculpt_brushes";

  batchOperations = "${builtins.fetchTarball {
    url = "https://github.com/dairin0d/batch-operations/archive/master.tar.gz";
  }}/space_view3d_batch_operations";

  blender_2_7x = {
    "blender/2.79/pie-essentials".source = ./blender/pie-essentials;

    "blender/2.79/EasyFX.py".source = easyFX;
    "blender/2.79/AutoMirror_V2-4.py".source = autoMirror;
    "blender/2.79/matalogue.py".source = matalogue;
    "blender/2.79/space_view3d_batch_operations".source = batchOperations;
  };

  blender_2_8x = {
    "blender/2.80/sculpt_brushes".source = sculptBrushes;
  };
in
{
  home.packages = [ pkgs.blender ];
  xdg.configFile = blender_2_8x;
}
