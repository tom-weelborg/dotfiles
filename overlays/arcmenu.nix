final: prev: {
  gnomeExtensions = prev.gnomeExtensions // {
    arcmenu = prev.gnomeExtensions.arcmenu.overrideAttrs (old: rec {
      version = "69.2";

      src = prev.fetchFromGitLab {
        owner = "arcmenu";
        repo = "ArcMenu";
        rev = "v${version}";
        hash = "sha256-BdvFeoXwGxFlBH1JqcSDAKMzN+wBEmZdsz+gXWxQF6Y=";
      };
    });
  };
}
