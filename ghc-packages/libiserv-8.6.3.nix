{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = { network = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "libiserv"; version = "8.6.3"; };
      license = "BSD-3-Clause";
      copyright = "XXX";
      maintainer = "XXX";
      author = "XXX";
      homepage = "";
      url = "";
      synopsis = "Provides shared functionality between iserv and iserv-proxy";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs.base)
          (hsPkgs.binary)
          (hsPkgs.bytestring)
          (hsPkgs.containers)
          (hsPkgs.deepseq)
          (hsPkgs.ghci)
          ] ++ (pkgs.lib).optionals (flags.network) [
          (hsPkgs.network)
          (hsPkgs.directory)
          (hsPkgs.filepath)
          ]) ++ (pkgs.lib).optional (!system.isWindows) (hsPkgs.unix);
        };
      };
    } // rec { src = pkgs.fetchurl { url = http://releases.mobilehaskell.org/ghc-packages/libiserv-8.6.3.tar.gz; sha256 = "0pzncp0k5d5jshm0k58gih66cvwh30fkay72yj71s6kvsyqyk612"; }; }
