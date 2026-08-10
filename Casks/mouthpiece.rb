cask "mouthpiece" do
  on_arm do
    version "2.0.8"
    sha256 "1d207311fb376ae826a3232c743d638a87096514a4de10ba485b8b26bbbd1cac"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}-arm64.dmg"
  end

  on_intel do
    version "2.0.8"
    sha256 "0230e394046d7555f980f476a87a31574715ddd06b3d13bce1290f74173aaf0b"

    url "https://github.com/NotWizard/Mouthpiece/releases/download/v#{version}/Mouthpiece-#{version}-x64.dmg"
  end

  name "Mouthpiece"
  desc "Native speech-to-text dictation app"
  homepage "https://github.com/NotWizard/Mouthpiece"

  auto_updates true
  depends_on macos: :sequoia

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Mouthpiece.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Mouthpiece.app"],
                   sudo: false
  end

  zap trash: [
    "~/.cache/mouthpiece",
    "~/Library/Application Support/Mouthpiece",
    "~/Library/Preferences/com.mouthpiece.app.plist",
  ]
end
