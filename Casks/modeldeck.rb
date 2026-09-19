cask "modeldeck" do
  version "1.1.12"
  sha256 "e7b6d49c32e0f7e9fb7d867b292ba7b7b39dd52aca8aa9f7a062e6e6a998b820"

  url "https://github.com/timharris707/modeldeck/releases/download/v#{version}/ModelDeck-#{version}.dmg"
  name "ModelDeck"
  desc "Multi-account manager and usage deck for AI coding CLIs"
  homepage "https://modeldeck.ai/"

  livecheck do
    url "https://github.com/timharris707/modeldeck/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "ModelDeck.app"

  uninstall quit: "app.modeldeck.mac"

  zap launchctl: "ai.hermes.modeldeck",
      trash:     [
        "~/Library/Application Support/ModelDeck",
        "~/Library/Caches/app.modeldeck.mac",
        "~/Library/HTTPStorages/app.modeldeck.mac",
        "~/Library/LaunchAgents/ai.hermes.modeldeck.plist",
        "~/Library/Preferences/app.modeldeck.mac.plist",
        "~/Library/Saved Application State/app.modeldeck.mac.savedState",
        "~/Library/WebKit/app.modeldeck.mac",
      ]

  caveats <<~EOS
    ModelDeck keeps its accounts and settings in
    ~/Library/Application Support/ModelDeck. Uninstalling the app leaves
    that data in place so a reinstall picks up where you left off.
    `brew uninstall --zap modeldeck` deletes it, including any managed
    account profiles. Keychain items must be removed by hand; see the
    Uninstall section of the ModelDeck README.
  EOS
end
