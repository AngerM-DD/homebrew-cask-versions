cask "hyper-canary" do
  arch arm: "arm64", intel: "x64"

  version "4.0.0-canary.5"
  sha256 arm:   "b23c51a1a2c6a0c1940965f959d30a6a185111954204132402aa29038d30ad98",
         intel: "4f0182611a650e83a8b5084e6f64e03c62c600641d5adb5af6f3253a796415d8"

  url "https://github.com/vercel/hyper/releases/download/v#{version}/Hyper-#{version}-mac-#{arch}.zip",
      verified: "github.com/vercel/hyper/"
  name "Hyper"
  desc "Terminal built on web technologies"
  homepage "https://hyper.is/"

  livecheck do
    url "https://releases-canary.hyper.is/"
    regex(/hyper-(\d+(?:\.\d+)*.+)-mac-#{arch}\.zip/i)
  end

  auto_updates true
  conflicts_with cask: "hyper"

  app "Hyper.app"
  binary "#{appdir}/Hyper.app/Contents/Resources/bin/hyper"

  zap trash: [
    "~/.hyper_plugins",
    "~/.hyper.js",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/co.zeit.hyper.sfl*",
    "~/Library/Application Support/Hyper",
    "~/Library/Caches/co.zeit.hyper.ShipIt",
    "~/Library/Caches/co.zeit.hyper",
    "~/Library/Cookies/co.zeit.hyper.binarycookies",
    "~/Library/Logs/Hyper",
    "~/Library/Preferences/ByHost/co.zeit.hyper.ShipIt.*.plist",
    "~/Library/Preferences/co.zeit.hyper.helper.plist",
    "~/Library/Preferences/co.zeit.hyper.plist",
    "~/Library/Saved Application State/co.zeit.hyper.savedState",
  ]
end
