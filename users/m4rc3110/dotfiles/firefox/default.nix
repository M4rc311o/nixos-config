{
  pkgs,
  unstablePkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles = {
      "m4rc3110" = {
        id = 0;
        isDefault = true;
        containers = {
          "school" = {
            id = 1;
            color = "red";
            icon = "circle";
          };
        };
        containersForce = true;

        preConfig = builtins.readFile "${unstablePkgs.arkenfox-userjs}/user.js";
        settings = {
          "browser.startup.page" = 3; # resume previous session
          "browser.startup.homepage" = "about:home";
          "browser.newtabpage.enabled" = true;
          "browser.search.suggest.enabled" = true;
          "browser.urlbar.suggest.searches" = true;
          "browser.search.separatePrivateDefault" = false;
          "browser.search.separatePrivateDefault.ui.enabled" = false;
          "network.auth.subresource-http-auth-allow" = 2;
          "browser.cache.disk.enable" = true;
          "browser.sessionstore.privacy_level" = 0; # keep session data
          "toolkit.winRegisterApplicationRestart" = true;
          "dom.security.https_only_mode" = false;
          "privacy.sanitize.sanitizeOnShutdown" = false;
          "privacy.resistFingerprinting.block_mozAddonManager" = false;
          "signon.rememberSignons" = false;
          "extensions.formautofill.addresses.enabled" = false;
          "extensions.formautofill.creditCards.enabled" = false;
          "security.OCSP.require" = false;

          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.showTopSites" = false;
          "browser.toolbars.bookmarks.visibility" = "never";
          "browser.urlbar.trimURLs" = false;
          "browser.translations.automaticallyPopup" = false;
          "browser.tabs.inTitlebar" = 0;
          "browser.download.autohideButton" = false;
          "identity.fxaccounts.toolbar.enabled" = false;
        };
      };
    };
    policies = {
      ExtensionSettings = {
        "{eb8c4a94-e603-49ef-8e81-73d3c4cc04ff}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/gruvbox-dark-theme/latest.xpi";
          installation_mode = "force_installed";
        };
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
          private_browsing = true;
        };
        "simple-tab-groups@drive4ik" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/simple-tab-groups/latest.xpi";
          installation_mode = "force_installed";
          default_area = "navbar";
          private_browsing = false;
        };
        "{c4b582ec-4343-438c-bda2-2f691c16c262}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/600-sound-volume/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
          private_browsing = true;
        };
        "jid1-Y3WfE7td45aWDw@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/behind_the_overlay/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
          private_browsing = true;
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
          default_area = "navbar";
          private_browsing = false;
        };
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
          private_browsing = false;
        };
        "vpn@proton.ch" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-vpn-firefox-extension/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
          private_browsing = true;
        };
        "firefox-extension@shodan.io" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/shodan-addon/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
          private_browsing = true;
        };
        "firefox@tampermonkey.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tampermonkey/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
          private_browsing = false;
        };
        "@contain-facebook" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/facebook-container/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
          private_browsing = false;
        };
      };
    };
  };
}
