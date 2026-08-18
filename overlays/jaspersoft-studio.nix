final: prev: {
  jaspersoft-studio = prev.buildFHSEnv {
    name = "jaspersoft-studio";

    targetPkgs = pkgs: with pkgs; [
      # Java
      jdk17

      # GTK / GLib
      gtk3
      gtk4
      glib
      gsettings-desktop-schemas

      # X11 / AWT / SWT
      libX11
      libXext
      libXi
      libXrender
      libXtst
      libXfixes
      libXrandr
      libXcursor
      libXdamage
      libXcomposite
      libxcb

      # Fonts / rendering
      fontconfig
      freetype
      cairo
      pango
      gdk-pixbuf

      # Runtime
      zlib
      alsa-lib
      cups
      nss
    ];

    # Download the software from here:
    # https://community.jaspersoft.com/download-jaspersoft/community-edition/.
    # Then put it into the following directory.
    runScript = "/opt/jaspersoft-studio/Jaspersoft\\ Studio";

    extraInstallCommands = ''
      mkdir -p $out/share/applications

      cat > $out/share/applications/jaspersoft-studio.desktop <<EOF
      [Desktop Entry]
      Name=Jaspersoft Studio
      Exec=$out/bin/jaspersoft-studio
      Terminal=false
      Type=Application
      Categories=Development;IDE;
      EOF
    '';
  };
}
