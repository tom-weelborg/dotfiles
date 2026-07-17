final: prev: {
  soapui = (prev.soapui.override {
    jdk = prev.jdk17;
  }).overrideAttrs (old: {
    postFixup = (old.postFixup or "") + ''
      wrapProgram $out/bin/soapui \
        --prefix LD_LIBRARY_PATH : ${
          prev.lib.makeLibraryPath [
            prev.glib
            prev.gtk3
            prev.libGL
            prev.libx11
            prev.libxext
            prev.libxi
            prev.libxrender
            prev.libxtst
            prev.libxxf86vm
          ]
        }
    '';
  });
}
