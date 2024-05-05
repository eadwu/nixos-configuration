{ buildDotnetModule, fetchFromGitHub
, dotnetCorePackages }:

buildDotnetModule 
rec {
  pname = "OhmGraphite";
  version = "0.28.1";

  src = fetchFromGitHub {
    owner = "nickbabcock";
    repo = "OhmGraphite";
    rev = "v${version}";
    sha256 = "sha256-1X2u3OR88sesY6qkz9/Toj2LMPb4Iisf7ZhQbnTer5E=";
  };

  postPatch = ''
    sed -i 's@\\publish\\@@g' OhmGraphite/OhmGraphite.csproj
  '';

  dotnet-sdk = dotnetCorePackages.sdk_6_0;
  selfContainedBuild = true;
  
  projectFile = "OhmGraphite/OhmGraphite.csproj";
  nugetDeps = ./ohmgraphite-deps.nix;
  runtimeId = "win-x64";
  
  useAppHost = false;
  packNupkg = false;

  executables = [ "OhmGraphite.exe" ];
}