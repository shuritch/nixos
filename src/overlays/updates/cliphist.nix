{ prev, final, ... }:

{
  cliphist = prev.cliphist.overrideAttrs (_old: {
    vendorHash = "sha256-M5n7/QWQ5POWE4hSCMa0+GOVhEDCOILYqkSYIGoy/l0=";
    src = final.fetchFromGitHub {
      owner = "sentriz";
      repo = "cliphist";
      rev = "c49dcd26168f704324d90d23b9381f39c30572bd";
      sha256 = "sha256-2mn55DeF8Yxq5jwQAjAcvZAwAg+pZ4BkEitP6S2N0HY=";
    };
  });
}
