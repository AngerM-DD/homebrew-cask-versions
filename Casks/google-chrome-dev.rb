cask "google-chrome-dev" do
  version "118.0.5993.11"
  sha256 :no_check

  url "https://dl.google.com/chrome/mac/universal/dev/googlechromedev.dmg"
  name "Google Chrome Dev"
  desc "Web browser"
  homepage "https://www.google.com/chrome/dev/"

  livecheck do
    url "https://chromiumdash.appspot.com/fetch_releases?channel=Dev&platform=Mac"
    regex(/"version":\s*"v?(\d+(?:\.\d+)+)"/i)
  end

  auto_updates true
  depends_on macos: ">= :el_capitan"

  app "Google Chrome Dev.app"

  zap trash:     [
        "/Library/Caches/com.google.SoftwareUpdate.*",
        "/Library/Google/Google Chrome Brand.plist",
        "/Library/Google/GoogleSoftwareUpdate",
        "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.google.chrome.app.*.sfl*",
        "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.google.chrome.sfl*",
        "~/Library/Application Support/Google/Chrome Dev",
        "~/Library/Caches/com.google.Chrome.helper.*",
        "~/Library/Caches/com.google.Chrome",
        "~/Library/Caches/com.google.Keystone.Agent",
        "~/Library/Caches/com.google.Keystone",
        "~/Library/Caches/com.google.SoftwareUpdate",
        "~/Library/Caches/Google/Chrome Dev",
        "~/Library/Google/Google Chrome Brand.plist",
        "~/Library/Google/GoogleSoftwareUpdate",
        "~/Library/LaunchAgents/com.google.keystone.agent.plist",
        "~/Library/LaunchAgents/com.google.keystone.xpcservice.plist",
        "~/Library/Logs/GoogleSoftwareUpdateAgent.log",
        "~/Library/Preferences/com.google.Chrome.plist",
        "~/Library/Preferences/com.google.Keystone.Agent.plist",
        "~/Library/Saved Application State/com.google.Chrome.app.*.savedState",
        "~/Library/Saved Application State/com.google.Chrome.savedState",
        "~/Library/WebKit/com.google.Chrome",
      ],
      rmdir:     [
        "/Library/Google",
        "~/Library/Application Support/Google",
        "~/Library/Caches/Google",
        "~/Library/Google",
      ],
      launchctl: [
        "com.google.keystone.agent",
        "com.google.keystone.daemon",
      ]
end
