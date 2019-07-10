self: super:

{
  boxpub = (import (builtins.fetchGit {
    url = "https://git.sr.ht/~eadwu/boxpub";
    ref = "master";
  }) { }).boxpub;
}
