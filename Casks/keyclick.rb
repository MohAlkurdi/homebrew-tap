cask "keyclick" do
  version "0.2.0"
  sha256 "2b13e654ec607fcca5e33c245568f85f4f5590146586d07aa7169cbed7cae9b9"

  url "https://github.com/MohAlkurdi/keyclick/releases/download/v#{version}/KeyClick.zip"
  name "KeyClick"
  desc "Mechanical keyboard sounds for every keystroke"
  homepage "https://mohalkurdi.github.io/keyclick-site/"

  auto_updates true
  depends_on macos: ">= :ventura"

  app "KeyClick.app"

  # KeyClick is not notarized, so Gatekeeper would block the quarantined download.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/KeyClick.app"]
  end

  uninstall quit: "com.mohalkurdi.KeyClick"

  zap trash: [
    "~/Library/Caches/com.mohalkurdi.KeyClick",
    "~/Library/HTTPStorages/com.mohalkurdi.KeyClick",
    "~/Library/Preferences/com.mohalkurdi.KeyClick.plist",
  ]
end
