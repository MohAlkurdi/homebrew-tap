cask "keyclick" do
  version "0.2.1"
  sha256 "a85aa32473d2bf0736a65369ece49c4b0a35f20fabe6c0241edee587c62d73fb"

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
