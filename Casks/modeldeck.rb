cask "modeldeck" do
  version "1.1.5"
  sha256 "b6ff1cbcdf8cb25c7d64ea0e3beee490b8b2d9b9b69523e936e0e65fb126eaef"

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

  caveats <<~EOS
    ModelDeck keeps its accounts and settings in
    ~/Library/Application Support/ModelDeck. Uninstalling the app leaves
    that data in place so a reinstall picks up where you left off.
  EOS
end
