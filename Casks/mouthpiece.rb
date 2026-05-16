cask "mouthpiece" do
  on_arm do
    version "1.2.0"
    sha256 "f402e9b8e6b143503b7b4bde79bf772129006cc3b53a33ec1cce583813eb9963"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}-arm64.dmg"
  end

  on_intel do
    version "1.2.0"
    sha256 "ef495323399e8f901608e92553e03410522b33b7832f361ff11eb2f46d60eb75"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}.dmg"
  end

  name "Mouthpiece"
  desc "Desktop dictation app using whisper.cpp"
  homepage "https://github.com/NotWizard/Mouthpiece"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Mouthpiece.app"

  zap trash: [
    "~/Library/Application Support/Mouthpiece",
    "~/Library/Caches/com.mouthpiece.app",
    "~/Library/Logs/Mouthpiece",
    "~/Library/Preferences/com.mouthpiece.app.plist",
  ]
end
