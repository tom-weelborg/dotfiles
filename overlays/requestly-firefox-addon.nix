final: prev: {
  firefox-addons = prev.firefox-addons // {
    requestly = prev.firefox-addons.buildFirefoxXpiAddon {
      pname = "requestly";
      version = "25.9.24";

      addonId = "extension@requestly.in";

      url = "https://app.requestly.io/firefox/builds/requestly-latest.xpi";
      sha256 = "sha256-dlu7NAX0bAhQtwcGh//0EgluKrD8X747OcaUt0bQdj4=";

      meta = with prev.lib; {
        homepage = "https://requestly.com/";
        description = "Features: Intercept & Modify HTTPs Requests, API Mocking, GraphQL Mocking, Rest API Client, API Testing, Modify HTTP Headers, etc";
        license = licenses.agpl3Only;
        mozPermissions = [
          "contextMenus"
          "declarativeNetRequest"
          "proxy"
          "scripting"
          "storage"
          "tabs"
          "unlimitedStorage"
          "webNavigation"
          "webRequest"
          "<all_urls>"
          "https://app.requestly.io/*"
          "https://app.requestly.com/*"
          "https://requestly.com/*"
        ];
        platforms = platforms.all;
      };
    };
  };
}
